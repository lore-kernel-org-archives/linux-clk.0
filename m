Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF30CC433FE
	for <linux-clk@archiver.kernel.org>; Tue, 22 Feb 2022 11:47:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbiBVLsM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Feb 2022 06:48:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230386AbiBVLsK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Feb 2022 06:48:10 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F4DAB0C7C
        for <linux-clk@vger.kernel.org>; Tue, 22 Feb 2022 03:47:44 -0800 (PST)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A830B3FCA8
        for <linux-clk@vger.kernel.org>; Tue, 22 Feb 2022 11:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645530462;
        bh=CYWNzKnqaoItjToqg6EQcu6bFi6QxqySZfcz0bcPfBo=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=CLdAArw1E9h7wSE2qsnzwJaOlSb0R9ssAeBVQM+AufsrTLy6bFJcMOp+HC/zovRLE
         PXq3sHhgEyDJcNSCUqoxlNuP011VqxqHCtMQ3DeXYbag3a0+OfDemRQIXMkEs5ZJnt
         HHK5syU87vqfi0+Mwj1wnL628eHEUgOdrQzrnBP3MzTechNIYVePvAQnRkuPmrfasg
         /yyPePe3NcthDzLqOS3VyFBPa5gpZbndFwoosvHLWOQLSVuo7V+k01tTALMPPjdvaq
         2AygE+udlzXCkj4CJsq6JdGa92hktEaOomX9E6wt58PjtFVrd8UPutpF8RSTqlUtRG
         FYEmhrqMkY6Ig==
Received: by mail-ej1-f69.google.com with SMTP id mp5-20020a1709071b0500b0069f2ba47b20so5587552ejc.19
        for <linux-clk@vger.kernel.org>; Tue, 22 Feb 2022 03:47:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CYWNzKnqaoItjToqg6EQcu6bFi6QxqySZfcz0bcPfBo=;
        b=GFtTtc8PXCt62MjFYKintVTbXl1YYcHcH8FR6V77+6SyOqVcwJFesiSStrH7e/yjE+
         GM2qZ7p8xsgyH93cmacQgQXmOT7flwfDDThD3OEvG79N2rGC+kqu8NuNhx2/FBEPRfxa
         J0tQaS6UoBKiMq2wc9nWs/eSMItpwsOe5teSJtt5fL8sRfGMlv4rliZmWQNtu+lgg2/q
         OkIGgfHnKB4ROF9kQDLcu9YYCXH/la1uv/B20mEKWpoVrVdZ5skHF5Mm3GG2qUcvGw3k
         QQLLWRW2u4wfsgjB0ql+9ORBgSX3jxNRliqp/NHQP6vL304uXCZ0cnCZJvbmM2x7VZL9
         2Esw==
X-Gm-Message-State: AOAM531XxNpxJLk7aORl6M87CI0/omykNs2VPsNUmwo/yxCbHnN/SCoB
        JwxNxIlruAJ/rvKCV2Y/NUMafoTyKSa+ZEGlouXvEdzZRglAqzrMv4xNhPS1Re4UGNHmaI8Xxgc
        tRf6ZT2IKalSV7rrIklASmiSNwdTkCyCB4fKzPQ==
X-Received: by 2002:a50:ee14:0:b0:403:c81d:c3dd with SMTP id g20-20020a50ee14000000b00403c81dc3ddmr26245457eds.195.1645530460773;
        Tue, 22 Feb 2022 03:47:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw74mhsV/2W3lR8/IwwYq4ETpgJX3NzSIDTsTcUBJA5wLNLeluEykhVwO6c/WS9iZgUd4murA==
X-Received: by 2002:a50:ee14:0:b0:403:c81d:c3dd with SMTP id g20-20020a50ee14000000b00403c81dc3ddmr26245448eds.195.1645530460615;
        Tue, 22 Feb 2022 03:47:40 -0800 (PST)
Received: from [192.168.0.124] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id i16sm2610732edu.52.2022.02.22.03.47.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Feb 2022 03:47:40 -0800 (PST)
Message-ID: <b8ed8f82-9271-cc1d-2f2d-38068f2f2426@canonical.com>
Date:   Tue, 22 Feb 2022 12:47:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v11 1/1] clk: microchip: Add driver for Microchip
 PolarFire SoC
Content-Language: en-US
To:     conor.dooley@microchip.com, mturquette@baylibre.com,
        sboyd@kernel.org, linux-clk@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org
Cc:     geert@linux-m68k.org, david.abdurachmanov@gmail.com,
        palmer@dabbelt.com, daire.mcnamara@microchip.com,
        cyril.jean@microchip.com,
        Padmarao Begari <padmarao.begari@microchip.com>
References: <20220222082706.3044572-1-conor.dooley@microchip.com>
 <20220222082706.3044572-2-conor.dooley@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220222082706.3044572-2-conor.dooley@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22/02/2022 09:27, conor.dooley@microchip.com wrote:
> From: Daire McNamara <daire.mcnamara@microchip.com>
> 
> Add support for clock configuration on Microchip PolarFire SoC
> 
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Co-developed-by: Padmarao Begari <padmarao.begari@microchip.com>
> Signed-off-by: Padmarao Begari <padmarao.begari@microchip.com>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/clk/Kconfig              |   4 +-
>  drivers/clk/Makefile             |   2 +-
>  drivers/clk/microchip/Kconfig    |  10 +
>  drivers/clk/microchip/Makefile   |   1 +
>  drivers/clk/microchip/clk-mpfs.c | 381 +++++++++++++++++++++++++++++++
>  5 files changed, 394 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/clk/microchip/Kconfig
>  create mode 100644 drivers/clk/microchip/clk-mpfs.c
> 
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 4a8451f61f37..8dffd2d9ba38 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -331,9 +331,6 @@ config COMMON_CLK_PXA
>  	help
>  	  Support for the Marvell PXA SoC.
>  
> -config COMMON_CLK_PIC32
> -	def_bool COMMON_CLK && MACH_PIC32
> -
>  config COMMON_CLK_OXNAS
>  	bool "Clock driver for the OXNAS SoC Family"
>  	depends on ARCH_OXNAS || COMPILE_TEST
> @@ -408,6 +405,7 @@ source "drivers/clk/keystone/Kconfig"
>  source "drivers/clk/mediatek/Kconfig"
>  source "drivers/clk/meson/Kconfig"
>  source "drivers/clk/mstar/Kconfig"
> +source "drivers/clk/microchip/Kconfig"
>  source "drivers/clk/mvebu/Kconfig"
>  source "drivers/clk/pistachio/Kconfig"
>  source "drivers/clk/qcom/Kconfig"
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 6a98291350b6..3b0062746984 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -92,7 +92,7 @@ obj-$(CONFIG_ARCH_KEYSTONE)		+= keystone/
>  obj-$(CONFIG_MACH_LOONGSON32)		+= loongson1/
>  obj-y					+= mediatek/
>  obj-$(CONFIG_ARCH_MESON)		+= meson/
> -obj-$(CONFIG_MACH_PIC32)		+= microchip/
> +obj-y					+= microchip/
>  ifeq ($(CONFIG_COMMON_CLK), y)
>  obj-$(CONFIG_ARCH_MMP)			+= mmp/
>  endif
> diff --git a/drivers/clk/microchip/Kconfig b/drivers/clk/microchip/Kconfig
> new file mode 100644
> index 000000000000..e1af380d8c9c
> --- /dev/null
> +++ b/drivers/clk/microchip/Kconfig
> @@ -0,0 +1,10 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config COMMON_CLK_PIC32
> +	def_bool COMMON_CLK && MACH_PIC32
> +
> +config MCHP_CLK_MPFS
> +	bool "Clk driver for PolarFire SoC"
> +	depends on (RISCV && SOC_MICROCHIP_POLARFIRE) || COMPILE_TEST
> +	help
> +	  Supports Clock Configuration for PolarFire SoC
> \ No newline at end of file

Missing newline.

Best regards,
Krzysztof
