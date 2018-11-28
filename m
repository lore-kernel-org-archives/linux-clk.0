Return-Path: <SRS0=nz6M=OH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE4B2C43441
	for <linux-clk@archiver.kernel.org>; Wed, 28 Nov 2018 09:22:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 955CE21104
	for <linux-clk@archiver.kernel.org>; Wed, 28 Nov 2018 09:22:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="F4ePQxdf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 955CE21104
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728062AbeK1UXP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Nov 2018 15:23:15 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35910 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727778AbeK1UXP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Nov 2018 15:23:15 -0500
Received: by mail-wm1-f67.google.com with SMTP id a18so1124576wmj.1
        for <linux-clk@vger.kernel.org>; Wed, 28 Nov 2018 01:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=I5U0N/Cyvg+QB+OiDptGqb978H7/FxhJCm2x55dJjPM=;
        b=F4ePQxdfnWm37rz0Mro8hj+KsIqPxNtPv1ri4EwC+KGPDOSqr/v/gdNKjKKZyrIzFs
         dm+zPGurm3UlXrib6UmwlmQk00XL3jQ9ggjQ0JftRTwva44B78O0Grtw3mVMBFiyize7
         zv6Q1JH/AHxNxeNlHv4Yu871JPnSITnRGsvSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=I5U0N/Cyvg+QB+OiDptGqb978H7/FxhJCm2x55dJjPM=;
        b=F1ETctEev51oFz2dO+BcfIaCNR4/+GsyBakpmmgtDvRrK0c7t7AxyQF7+cgReWXrP3
         oJjxBpfh6H90wdlHzf9IJ4YU2K7EB6j/sVNkQmWKwvIV5/Zp2eJzsB9KD0uCSDx29h7C
         0u2HNyKzTOntKKoCDGAziTvogxn37FH0sLkUVE+EsICmumyYl4NcFQXpi7R+Ay9xPnGA
         s90MZZ8H8tgUGIyA4xipfNixKOkHkrEV8QQZCwna2uU3Vq7mK3Oer1ZL7NhT32I20Cem
         +cJ2MF9yuWdwfbuTTTfqqilUI/e46H+B1F7asLnM1YLI1d8GFLQKtN3gEZdsF6/Wzqdf
         ZgtA==
X-Gm-Message-State: AA+aEWbkvRm7IR3dCLx5lMFM/qiZU0IbYObCrJ2ReJaGi5TTrQPcoOf0
        LiC3nCcYQDYHU+b1rt9K9RTXjQ==
X-Google-Smtp-Source: AFSGD/UDW4h5SbideVHcM/Z8X7F9rVbUuGETi3uxP9l0XNwK0SNlsC3l6Rt7e+ANZzofKTJqUZvh/g==
X-Received: by 2002:a1c:b94b:: with SMTP id j72mr1855396wmf.58.1543396935927;
        Wed, 28 Nov 2018 01:22:15 -0800 (PST)
Received: from dell ([2.31.167.233])
        by smtp.gmail.com with ESMTPSA id z9sm6004513wrs.63.2018.11.28.01.22.14
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Nov 2018 01:22:15 -0800 (PST)
Date:   Wed, 28 Nov 2018 09:22:13 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, broonie@kernel.org,
        linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        lgirdwood@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 6/8] mfd: lochnagar: Add support for the Cirrus Logic
 Lochnagar
Message-ID: <20181128092213.GW4272@dell>
References: <20181120141631.18949-1-ckeepax@opensource.cirrus.com>
 <20181120141631.18949-6-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181120141631.18949-6-ckeepax@opensource.cirrus.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 20 Nov 2018, Charles Keepax wrote:

> Lochnagar is an evaluation and development board for Cirrus
> Logic Smart CODEC and Amp devices. It allows the connection of
> most Cirrus Logic devices on mini-cards, as well as allowing
> connection of various application processor systems to provide a
> full evaluation platform. This driver supports the board
> controller chip on the Lochnagar board. Audio system topology,
> clocking and power can all be controlled through the Lochnagar
> controller chip, allowing the device under test to be used in
> a variety of possible use cases.
> 
> As the Lochnagar is a fairly complex device this MFD driver
> allows the drivers for the various features to be bound
> in. Initially clocking, regulator and pinctrl will be added as
> these are necessary to configure the system. But in time at least
> audio and voltage/current monitoring will also be added.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
> 
> No change since v4.
> 
> Thanks,
> Charles
> 
>  MAINTAINERS                         |  17 ++
>  drivers/mfd/Kconfig                 |   8 +
>  drivers/mfd/Makefile                |   2 +
>  drivers/mfd/lochnagar-i2c.c         | 394 ++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/lochnagar.h       |  55 +++++
>  include/linux/mfd/lochnagar1_regs.h | 157 ++++++++++++++
>  include/linux/mfd/lochnagar2_regs.h | 253 +++++++++++++++++++++++
>  7 files changed, 886 insertions(+)
>  create mode 100644 drivers/mfd/lochnagar-i2c.c
>  create mode 100644 include/linux/mfd/lochnagar.h
>  create mode 100644 include/linux/mfd/lochnagar1_regs.h
>  create mode 100644 include/linux/mfd/lochnagar2_regs.h

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
