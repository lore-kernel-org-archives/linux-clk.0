Return-Path: <SRS0=aKI2=4P=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F02C0C4BA2D
	for <linux-clk@archiver.kernel.org>; Thu, 27 Feb 2020 13:06:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BB78624650
	for <linux-clk@archiver.kernel.org>; Thu, 27 Feb 2020 13:06:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQtnK7x6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729052AbgB0NGb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Feb 2020 08:06:31 -0500
Received: from mail-wr1-f42.google.com ([209.85.221.42]:36830 "EHLO
        mail-wr1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729025AbgB0NGb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Feb 2020 08:06:31 -0500
Received: by mail-wr1-f42.google.com with SMTP id j16so1708647wrt.3
        for <linux-clk@vger.kernel.org>; Thu, 27 Feb 2020 05:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=r9UDArMRXs4Mmuh86mluCWMWz6S3F8bHKkTAV4tquwc=;
        b=dQtnK7x6rc9gwoWqwwCtjeX8IKsQYwxhnvCkjo7OaAfutwqX0KNKbfwdp90f9Xt2JE
         6jkxdR4yQYViWKAnnbjnOCs4ErCCNZBCX58u7Vdwj5KzuFhtoBhPVA/JnVW8FvZSVTlL
         5xZHiiUroijt74+FaCpVBJbmW0IdHZJ9yGhrwAwakr/dQhf2Y381D4kSf7R4mxqDWBsI
         xE8GwMEoj5UJgWPit/Os7rqW1NLdKv9SOpMZNScmbQy7B0INsrEs0UWouJ1nadIQc8Nb
         fFIeGrX6SvSfWwjkDO9/kl43hxybXGEUOeJfdQMEgQ0/Np0GyRFfwgVboVmaPb9VpqU7
         1k2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=r9UDArMRXs4Mmuh86mluCWMWz6S3F8bHKkTAV4tquwc=;
        b=cRaVqMvc+uT/RFu/piwuk6f085BvilymmObCOmG3zyljJ0yALjeoZ8NnRoW1Zka/M7
         STb/xxPfmFqQomIYudREDPzmcdFqXbDp5OBuGWbOjtjKLmvMH1xgWF+p+30u3J7MPvze
         ZfO/HT59jhSAA+EKRxHmCI0D8Lr1/y1j3stTVpR42Yd6Sy0pY3v1lyfir5T9DiwFy2Kg
         W5oaSawAgnJX29pddMkG0WEh0+S58kLi0TNZBKgehineEDw/EAMXO540MwEp5F9Ompsc
         R/LVxYZU9OA4hr8/lD/EJj7nYDtNmd4x5aADQBbeVtnt+1RpTCWH6/QLI36yXgbNcEP3
         uKGw==
X-Gm-Message-State: APjAAAXt3sSR1jJmI8PPAuDuc2JjDi9HMZeQr6KwhA/EexVZrz2fqtwq
        QecXxhdYexTuAdbR2agQ2Dc=
X-Google-Smtp-Source: APXvYqwyWG0bYHyhxsK+EnYYgz3YtoQiRKQcnmffBH+PsYQCzSZ2hjB04mCUtyT7ifXoL+j5W1XJ1g==
X-Received: by 2002:a05:6000:14d:: with SMTP id r13mr4793931wrx.63.1582808789241;
        Thu, 27 Feb 2020 05:06:29 -0800 (PST)
Received: from localhost (dslb-002-207-138-002.002.207.pools.vodafone-ip.de. [2.207.138.2])
        by smtp.gmail.com with ESMTPSA id p16sm7151635wrw.15.2020.02.27.05.06.28
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2020 05:06:28 -0800 (PST)
Date:   Thu, 27 Feb 2020 13:57:43 +0100
From:   Oliver Graute <oliver.graute@gmail.com>
To:     aisheng.dong@nxp.com, anson.huang@nxp.com
Cc:     festevam@gmail.com, linux-imx@nxp.com, linux-clk@vger.kernel.org,
        s.hauer@pengutronix.de, mturquette@baylibre.com,
        leonard.crestez@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: RFC: imx8qm: imx-scu-clk: probe of clk failed
Message-ID: <20200227125743.GC16310@optiplex>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Aisheng,
Hello Anson,

I get the following imx-scu errors when using Linux version
5.6.0-rc1-next-20200214 with scfw Build 3353, Commit 494c97f3

It seems that important clocks are off somehow and that lpspi isn't
working because of that. What is the best way to debug such issues?

[    1.103799] imx-scu scu: NXP i.MX SCU Initialized
[    1.111383] a35_clk: failed to get clock rate -22
[    1.122843]  lcd0-pwm0: failed to power up resource 188 ret -22
[    1.128438] imx-scu-clk: probe of pwm_clk failed with error -22
[    1.134746]  lcd0: failed to power up resource 187 ret -22
[    1.139898] imx-scu-clk: probe of lcd_clk failed with error -22
[    1.151177] mipi_csi0_core_clk: failed to attached the power domain -2
[    1.157581] mipi_csi0_esc_clk: failed to attached the power domain -2
[    1.163985] mipi_csi0_i2c0_clk: failed to attached the power domain -2
[    1.170524] mipi_csi0_pwm0_clk: failed to attached the power domain -2
[    1.181817] imx8qm-pinctrl scu:pinctrl: initialized IMX pinctrl driver
[    1.211140] random: fast init done
[    1.216039] 5a060000.serial: ttyLP0 at MMIO 0x5a060000 (irq = 8, base_baud = 5000000) is a FSL_LPUAR[    1.225100] printk: console [ttyLP0] enabled
[    1.225100] printk: console [ttyLP0] enabled
[    1.233543] printk: bootconsole [lpuart32] disabled
[    1.233543] printk: bootconsole [lpuart32] disabled
[    1.243549] fsl-lpuart 5a060000.serial: DMA tx channel request failed, operating without tx DMA
[    1.252275] fsl-lpuart 5a060000.serial: DMA rx channel request failed, operating without rx DMA
[    1.261868] 5a070000.serial: ttyLP1 at MMIO 0x5a070000 (irq = 9, base_baud = 0) is a FSL_LPUART
[    1.270767] fsl-lpuart 5a070000.serial: DMA tx channel request failed, operating without tx DMA
[    1.279481] fsl-lpuart 5a070000.serial: DMA rx channel request failed, operating without rx DMA
[    1.289310] fb_st7789v spi0.0: fbtft_property_value: buswidth = 9
[    1.296105] fsl_lpspi 5a010000.lpspi: failed to enable clock
[    1.301771] spi_master spi0: failed to prepare transfer hardware: -13
[    1.308231] fb_st7789v spi0.0: write() failed and returned -13


Best regards,

Oliver
