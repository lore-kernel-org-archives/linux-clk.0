Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35EDACDB474
	for <linux-clk@archiver.kernel.org>; Mon, 23 Oct 2023 14:22:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230274AbjJWOWf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Oct 2023 10:22:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230158AbjJWOWe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Oct 2023 10:22:34 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF1E210A
        for <linux-clk@vger.kernel.org>; Mon, 23 Oct 2023 07:22:30 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c50ec238aeso48072581fa.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Oct 2023 07:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698070949; x=1698675749; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=E+6RuqzMvi6/cl8AxQsj75tOfUbUu+K7Xht0IansoAI=;
        b=P1Eapi9MKhLNW032vehQNJudaQcFzxexhOGUDPNuglr8Ahy5jK1FCbe9oo+MGymiRj
         g1W5WVoltfgOqw2gLXfyo2Yk5IbSMzcIYfhLW1QgZbCMM2wpBVFMVEVTTV4rzv7uxTPN
         dfWNSn/V7rlYl20JjURKnQ9NBL3ERa0jV78rCg+VautEsy7GlARpxctV2iG+SEU4KOSk
         ScijY2aMASFGqEzICBFP9BIY2UzerL1B8QlVhcF2YYmXHklHLkO/sQFj/d55IKJ2FEIS
         qUkL8fU4aTVXuhHMZhbc2aVaNcUFNkjc3eTvirAUCMUWFanCLwspvI7F2MSph3/foEN5
         CbEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698070949; x=1698675749;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+6RuqzMvi6/cl8AxQsj75tOfUbUu+K7Xht0IansoAI=;
        b=hHlHCH14skm3MUplGOFcBw1od8WblCzYCcE5oOAGm9fJcEKdrpRf+kGBjp+NZhogYC
         p6VxAKSp5W8MvJ17ihhCA+LURMkEaD6fDTdVykhiM1laXgaV1ZiwKNznUYKGlzfgl9cN
         s85Ry+tZ7+mNiy4yoy3K28cB2y52ILMVdd7DP4dIn88k/HjaQy/aZ8Rey0vHJdLrRKdr
         lttCFFvrYydkdUlAlJ5SNOWm6ahBiuTdMbdI3dopAvuF9EGEWN868VuRQwzs9GcRwuXK
         b2x3otuUTHlZ+iSivA7pvH441JLxrdCDWxslhExZPIJyt0dbBlNk7Z3kLecBA+RX2nSl
         QSBw==
X-Gm-Message-State: AOJu0Yz6r0uR9Ccdir++VXWHFuaG86P00KkGfp13CSijZMit5OKrw2uk
        bWqpJ2QEwiToacExbUUUFCqZpj/TZRSgZj0wu2M=
X-Google-Smtp-Source: AGHT+IHc6CmbwwWmCnTdzGhXOAKUQkxUhWrqELC5YNvIOIMaavPZPWSg5xlXBNXGrT5DBzHza0MHgQ==
X-Received: by 2002:a2e:9051:0:b0:2c5:19e9:422c with SMTP id n17-20020a2e9051000000b002c519e9422cmr6179488ljg.24.1698070948940;
        Mon, 23 Oct 2023 07:22:28 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:f0e1:712a:7682:b4ff])
        by smtp.gmail.com with ESMTPSA id e16-20020adfef10000000b0032d8354fb43sm7934803wro.76.2023.10.23.07.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 07:22:28 -0700 (PDT)
References: <20231023102810.4001943-1-arnd@kernel.org>
User-agent: mu4e 1.8.13; emacs 29.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Arnd Bergmann <arnd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>, Yu Tu <yu.tu@amlogic.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Dmitry Rokosov <ddrokosov@sberdevices.ru>,
        Jian Hu <jian.hu@amlogic.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] clk: meson: S4: select
 CONFIG_COMMON_CLK_MESON_CLKC_UTILS
Date:   Mon, 23 Oct 2023 16:20:42 +0200
In-reply-to: <20231023102810.4001943-1-arnd@kernel.org>
Message-ID: <1j1qdlpgf0.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Mon 23 Oct 2023 at 12:28, Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Without this, the newly added drivers fail to link:
>
> aarch64-linux-ld: drivers/clk/meson/s4-pll.o: in function `meson_s4_pll_probe':
> s4-pll.c:(.text+0x13c): undefined reference to `meson_clk_hw_get'
> aarch64-linux-ld: drivers/clk/meson/s4-peripherals.o: in function `meson_s4_periphs_probe':
> s4-peripherals.c:(.text+0xb0): undefined reference to `meson_clk_hw_get'
>
> Fixes: e787c9c55edad ("clk: meson: S4: add support for Amlogic S4 SoC PLL clock driver")
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied fixing this minor checkpatch warning (1 extra char)

WARNING: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes: e787c9c55eda ("clk: meson: S4: add support for Amlogic S4 SoC PLL clock driver")'

and preparing the PR for Stephen now.
Thanks Arnd.

> ---
> v2: fix up both drivers, the first version only addressed the s4-pll one.
> ---
>  drivers/clk/meson/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index c5303e4c16043..29ffd14d267b6 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -149,6 +149,7 @@ config COMMON_CLK_S4_PLL
>  	tristate "S4 SoC PLL clock controllers support"
>  	depends on ARM64
>  	default y
> +	select COMMON_CLK_MESON_CLKC_UTILS
>  	select COMMON_CLK_MESON_MPLL
>  	select COMMON_CLK_MESON_PLL
>  	select COMMON_CLK_MESON_REGMAP
> @@ -161,6 +162,7 @@ config COMMON_CLK_S4_PERIPHERALS
>  	tristate "S4 SoC peripherals clock controllers support"
>  	depends on ARM64
>  	default y
> +	select COMMON_CLK_MESON_CLKC_UTILS
>  	select COMMON_CLK_MESON_REGMAP
>  	select COMMON_CLK_MESON_DUALDIV
>  	select COMMON_CLK_MESON_VID_PLL_DIV

