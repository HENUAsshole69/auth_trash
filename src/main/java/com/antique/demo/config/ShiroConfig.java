package com.antique.demo.config;


import com.antique.demo.realm.UserRealm;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.LinkedHashMap;
import java.util.Map;

@Configuration
public class ShiroConfig {
    // 下面两个方法对 注解权限起作用有很大的关系，请把这两个方法，放在配置的最上面
    @Bean(name = "lifecycleBeanPostProcessor")
    public LifecycleBeanPostProcessor getLifecycleBeanPostProcessor() {
        return new LifecycleBeanPostProcessor();
    }

    @Bean
    public DefaultAdvisorAutoProxyCreator getDefaultAdvisorAutoProxyCreator() {
        DefaultAdvisorAutoProxyCreator autoProxyCreator = new DefaultAdvisorAutoProxyCreator();
        autoProxyCreator.setProxyTargetClass(true);
        return autoProxyCreator;
    }

    /**
     * 注入UserRealm
     */
    @Bean
    public UserRealm userRealm() {
        return new UserRealm();
    }

    /**
     * 缓存
     *
     * @return
     */
    @Bean
    public EhCacheManager getEhCacheCache() {
        EhCacheManager em = new EhCacheManager();
        em.setCacheManagerConfigFile("classpath:ehcache-shiro.xml");
        return em;
    }

    /**
     * 创建ShiroFilterFactoryBean对象，设置安全管理器
     */
    @Bean
    public ShiroFilterFactoryBean getShiroFilterFactoryBean(DefaultWebSecurityManager securityManager) {
        //创建ShiroFilterFactoryBean对象
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        //设置安全管理器
        shiroFilterFactoryBean.setSecurityManager(securityManager);
        // 登录成功后要跳转的链接
        shiroFilterFactoryBean.setSuccessUrl("/index/1");
        //添加Shiro内置过滤器
        /*
         *Shiro内置过滤器，可以实现权限相关的拦截
         * 常用的过滤器
         * anon:无需认证（登录）可以访问
         * authc:必须认证才可以访问
         * user:如果使用rememberMe的功能可以直接访问
         * perms:该资源必须得到资源权限才可以访问
         * role:该资源必须得到角色权限才可以访问
         */
        Map<String, String> filterChainDefinitionMap = new LinkedHashMap<String, String>();
        //设置退出过滤器
        filterChainDefinitionMap.put("/loginOut", "logout");
        //设置请求放行
        filterChainDefinitionMap.put("/index/1", "anon");
        filterChainDefinitionMap.put("/SCaptchaServlet", "anon");
        filterChainDefinitionMap.put("/loginValidate", "anon");
        filterChainDefinitionMap.put("/ifLogin", "anon");
        filterChainDefinitionMap.put("/css/**", "anon");
        filterChainDefinitionMap.put("/data/**", "anon");
        filterChainDefinitionMap.put("/fonts/**", "anon");
        filterChainDefinitionMap.put("/icons-reference/**", "anon");
        filterChainDefinitionMap.put("/img/**", "anon");
        filterChainDefinitionMap.put("/js/**", "anon");
        filterChainDefinitionMap.put("/vendor/**", "anon");
        filterChainDefinitionMap.put("/layui/**", "anon");
        //设置身份验证请求
        //filterChainDefinitionMap.put("/core/updateCoreTechnology","perms[update:coretechnology]");
        //所有请求必须经过身份验证，此配置放到最后
        filterChainDefinitionMap.put("/**", "authc");
        //设置登录请求页面
        shiroFilterFactoryBean.setLoginUrl("/antique/login");
        //设置无访问权限后返回的页面
//        shiroFilterFactoryBean.setUnauthorizedUrl("/noAuthc");
        //返回ShiroFilterFactoryBean对象
        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);
        return shiroFilterFactoryBean;

    }

    /**
     * 创建DefaultWebSecurityManager对象，关联Realm
     */
    @Bean(name = "securityManager")
    public DefaultWebSecurityManager getDefaultWebSecurityManager(UserRealm userRealm) {
        //创建DefaultWebSecurityManager对象
        DefaultWebSecurityManager defaultWebSecurityManager = new DefaultWebSecurityManager();
        //设置关联的Realm
        defaultWebSecurityManager.setRealm(userRealm);
        defaultWebSecurityManager.setCacheManager(getEhCacheCache());
        //返回DefaultWebSecurityManager对象
        return defaultWebSecurityManager;
    }

    //开启shiro注解支持
    @Bean
    public AuthorizationAttributeSourceAdvisor getAuthorizationAttributeSourceAdvisor(DefaultWebSecurityManager securityManager) {
        AuthorizationAttributeSourceAdvisor advisor = new AuthorizationAttributeSourceAdvisor();
        advisor.setSecurityManager(securityManager);
        return advisor;
    }
}
