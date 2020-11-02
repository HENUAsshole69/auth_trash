package com.antique.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.Random;

@Service
public class CaptchaService {
    // 图片的宽度。
    private final int width = 120;
    // 图片的高度。
    private final int height = 40;
    // 验证码字符个数
    private final int codeCount = 4;
    // 验证码干扰线数
    private final int lineCount = 50;

    private final char[] codeSequence = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H',
            'I', 'J', 'K', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
            'X', 'Y', 'Z', '2', '3', '4', '5', '6', '7', '8', '9' };

    // 生成随机数
    private Random random;

    @Autowired
    public CaptchaService() {
        this.random = new Random();
    }

    public CaptchaEntry createCode() {
        int codeX = 0;
        int fontHeight = 0;
        fontHeight = height - 5;// 字体的高度
        codeX = width / (codeCount+3);// 每个字符的宽度

        // 图像buffer
        BufferedImage buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics2D g = buffImg.createGraphics();

        // 将图像填充为白色
        g.setColor(Color.WHITE);
        g.fillRect(0, 0, width, height);

        // 创建字体
        ImgFontByte imgFont = new ImgFontByte();
        Font font = imgFont.getFont(fontHeight);
        g.setFont(font);

        // 绘制干扰线
        for (int i = 0; i < lineCount; i++) {
            int xs = getRandomNumber(width);
            int ys = getRandomNumber(height);
            int xe = xs + getRandomNumber(width / 8);
            int ye = ys + getRandomNumber(height / 8);
            g.setColor(getRandomColor());
            g.drawLine(xs, ys, xe, ye);
        }

        StringBuffer randomCode = new StringBuffer();
        // 随机产生验证码字符
        for (int i = 0; i < codeCount; i++) {
            String strRand = String.valueOf(codeSequence[random
                    .nextInt(codeSequence.length)]);
            // 设置字体颜色
            g.setColor(getRandomColor());
            // 设置字体位置
            g.drawString(strRand, (i + 1) * codeX,
                    getRandomNumber(height / 2) + 25);
            randomCode.append(strRand);
        }
        return new CaptchaEntry(randomCode.toString(),buffImg);
    }

    /** 获取随机颜色 */
    private Color getRandomColor() {
        int r = getRandomNumber(255);
        int g = getRandomNumber(255);
        int b = getRandomNumber(255);
        return new Color(r, g, b);
    }

    /** 获取随机数 */
    private int getRandomNumber(int number) {
        return random.nextInt(number);
    }


    /** 字体样式类 */
    private static class ImgFontByte {
        public Font getFont(int fontHeight) {
            try {
                File file = new File("classpath:font");
                InputStream in = new FileInputStream(file);
                Font baseFont = Font.createFont(Font.TRUETYPE_FONT, in);
                return baseFont.deriveFont(Font.PLAIN, fontHeight);
            } catch (Exception e) {
                return new Font("Arial", Font.PLAIN, fontHeight);
            }
        }
    }

    public static class CaptchaEntry{
        private final String code;
        private final BufferedImage image;

        CaptchaEntry(String code, BufferedImage image) {
            this.code = code;
            this.image = image;
        }

        public String getCode() {
            return code;
        }

        public void writeImg(OutputStream sos) throws IOException {
            ImageIO.write(this.image, "png", sos);
            sos.close();
        }
    }
}
