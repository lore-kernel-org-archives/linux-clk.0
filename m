Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 925F8C4332F
	for <linux-clk@archiver.kernel.org>; Thu,  3 Nov 2022 02:53:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231397AbiKCCxb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Nov 2022 22:53:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbiKCCw6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Nov 2022 22:52:58 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 096171742A
        for <linux-clk@vger.kernel.org>; Wed,  2 Nov 2022 19:52:01 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id v3so510619pgh.4
        for <linux-clk@vger.kernel.org>; Wed, 02 Nov 2022 19:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fCqO3QlyxQvDT0x+o7BF5bX3iSDJLGmHcDQfDe9vAnw=;
        b=xuKhe1nL73XZdr3LYDCwjHCiOAxOJ+DifYx3Fc/Z34iXO6f1EcWpN5Syfur6xz7bTy
         KenjQxPJzLKaJZmED6xPz/6JoLyWP1UxoqgCIjFq1/zFoD0S4JL4q195ajbA1rVvO5TD
         IxV9lurV/mM8QWhQHJYpDWw+PNohoQRkWN4wm1M8a1sseic6RY2PgBbb9jbt7NL2mnXT
         A7I9TxwH3IHPnkTihn2rxl5ffCl1CMRFyeTN2qCIfiVigiBvoiWtPLqoWgqr0/znGchR
         TF3aUxrqCep0UiHbZ75YwrsneAMDoAHUNjIn5laOHtdSqM5E+E1o1rMwak8WVqkM8eBP
         7YqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fCqO3QlyxQvDT0x+o7BF5bX3iSDJLGmHcDQfDe9vAnw=;
        b=FX9oQULuhLqnOCXpq0XYS6K7xydpZpumLPa1aSuNFfjDRFNKJFsJrRJUhbS6WxUAkW
         /gG3obJMC2Mz4Gk0R42t4LihdKY+aqYveA9gaG57Zf7E9GWsKvBi9TgjFIYAw/7g2dYo
         bfoMA+wzyV8/zrv0W380RjWmIn5xlUjg4oUwxvfYWnEcWvdljXF9v45lxfub30voQF3I
         NXOdB2kpT55tbX/9qOVlfVdDGPlQsdWWvhKZY804QzusAPa51e0dy7rzrMY1tXkiblny
         TYJFC0u9HJJ7atEfGGZOg3OJ8nRYRbAK0r6u1UBmNsBPqw5L4pw6vWtQKYHHUSiiPAkG
         hjhA==
X-Gm-Message-State: ACrzQf0PJraJw0gkWl4ai57mjTyR6SyYhpO0f4gFlp4b5XICHC08nqRj
        msWOiRk/JstfsLFq/S0jdl7fhQ==
X-Google-Smtp-Source: AMsMyM51ykASDmLBohSM0PmjQEeWbT0MhPuGZKBxelw3Pb5ydPIpEKTN0cwcRWrPUWcXWKYDaJ9hIQ==
X-Received: by 2002:a63:f07:0:b0:440:5c6e:5833 with SMTP id e7-20020a630f07000000b004405c6e5833mr24721616pgl.375.1667443920519;
        Wed, 02 Nov 2022 19:52:00 -0700 (PDT)
Received: from localhost ([122.172.84.80])
        by smtp.gmail.com with ESMTPSA id w18-20020a170902e89200b0017f92246e4dsm9043145plg.181.2022.11.02.19.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 19:51:59 -0700 (PDT)
Date:   Thu, 3 Nov 2022 08:21:57 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     =?utf-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
Cc:     Bhavna Yadav <bhavna.yadav@st.com>,
        Rajeev Kumar <rajeev-dlh.kumar@st.com>,
        Deepak Sikri <deepak.sikri@st.com>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
        Vipin Kumar <vipin.kumar@st.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        thomas.petazzoni@bootlin.com, Viresh Kumar <vireshk@kernel.org>,
        soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Alexandre Ghiti <alexandre.ghiti@canonical.com>,
        Vijay Kumar Mishra <vijay.kumar@st.com>
Subject: Re: [PATCH v2 1/6] arm: configs: spear6xx: Refresh defconfig
Message-ID: <20221103025157.4ml5ns4me4365lsj@vireshk-i7>
References: <20221102171012.49150-1-kory.maincent@bootlin.com>
 <20221102171012.49150-2-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221102171012.49150-2-kory.maincent@bootlin.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 02-11-22, 18:10, Köry Maincent wrote:
> From: Kory Maincent <kory.maincent@bootlin.com>
> 
> Refresh the defconfig to follow the changes made over the year.
> I ensure important options have not gone away.
> I drop the gpio sysfs config as it is useless to keep it alone without
> CONFIG_EXPERT.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>  arch/arm/configs/spear6xx_defconfig | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/arch/arm/configs/spear6xx_defconfig b/arch/arm/configs/spear6xx_defconfig
> index 3d631b1f3cfa..1cf0621d2154 100644
> --- a/arch/arm/configs/spear6xx_defconfig
> +++ b/arch/arm/configs/spear6xx_defconfig
> @@ -11,7 +11,6 @@ CONFIG_PARTITION_ADVANCED=y
>  CONFIG_BINFMT_MISC=y
>  CONFIG_NET=y
>  CONFIG_MTD=y
> -CONFIG_MTD_OF_PARTS=y
>  CONFIG_MTD_BLOCK=y
>  CONFIG_MTD_RAW_NAND=y
>  CONFIG_MTD_NAND_FSMC=y
> @@ -28,19 +27,15 @@ CONFIG_NETDEVICES=y
>  # CONFIG_NET_VENDOR_SMSC is not set
>  CONFIG_STMMAC_ETH=y
>  # CONFIG_WLAN is not set
> -CONFIG_INPUT_FF_MEMLESS=y
> -# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
>  # CONFIG_INPUT_KEYBOARD is not set
>  # CONFIG_INPUT_MOUSE is not set
>  # CONFIG_LEGACY_PTYS is not set
>  CONFIG_SERIAL_AMBA_PL011=y
>  CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
> -CONFIG_RAW_DRIVER=y
>  CONFIG_I2C=y
>  CONFIG_I2C_DESIGNWARE_PLATFORM=y
>  CONFIG_SPI=y
>  CONFIG_SPI_PL022=y
> -CONFIG_GPIO_SYSFS=y
>  CONFIG_GPIO_PL061=y
>  # CONFIG_HWMON is not set
>  CONFIG_WATCHDOG=y

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
