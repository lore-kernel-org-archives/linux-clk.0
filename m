Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 627CDC433E0
	for <linux-clk@archiver.kernel.org>; Thu, 24 Dec 2020 14:04:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 12DF12246B
	for <linux-clk@archiver.kernel.org>; Thu, 24 Dec 2020 14:04:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbgLXOEM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Dec 2020 09:04:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32535 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727144AbgLXOEL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Dec 2020 09:04:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1608818564;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KBihBeE7FaK4G7GPAOp0NUP3AloiGzKbKb/E0jog36A=;
        b=aZq1pHh2gy4vOzYkAKncLfPRauoD0gzIM9QVkacaBph5l82LjFDKP3Uh5fVAQyDVewbUxK
        ztf3ZbUkrbAvrcUw56fBjE0gHtS7/a2yuNRb86O2eKGBmXVQrXUdJgDipHAzUjWF9an4zU
        3UwFcN3R/i/XQfqSCWE4WlDXDTMsjbQ=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-ALWH0aBpOmyBo9aBavcLhQ-1; Thu, 24 Dec 2020 09:02:43 -0500
X-MC-Unique: ALWH0aBpOmyBo9aBavcLhQ-1
Received: by mail-oi1-f197.google.com with SMTP id e4so1047797oii.2
        for <linux-clk@vger.kernel.org>; Thu, 24 Dec 2020 06:02:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=KBihBeE7FaK4G7GPAOp0NUP3AloiGzKbKb/E0jog36A=;
        b=R1+54PF+o+LKai+rMUAmeT+t3hGmNb/PaEPwsJ2ffEd/KLL8TS3EX4cNdlCXRwTwMi
         pqzQWArr8RTy6eiT5QhyQrRBQMidMHZIf2BJmxEwZZ044yO7sXUwm6UM1Ln5YUxEgtWI
         AnQkt7jRYW+USFdCdTic1cD4+Gcg96WvJbrHL9PTYKE+QCsFxUd8IUppkWoS7ghK+IDW
         zpCceFvVBb/uOcNVdfDBYuUlKQl1jGva9qvhO/IJaBNXroGkYUSA0XBO9Ouiq1JzUamH
         ql/1Uw+TBRRK/NUlyIilWDbNsZ+HngHwQvSbHIz0mIETS2TCThkwyQNnFpKPCe3ptYmv
         JhWA==
X-Gm-Message-State: AOAM532AOgKqVKTXFAzy5nNoRDrFwsqnD49VQJImOG31scOEllmXEb5F
        yad7uK5eUDhfsOmTv0QFaH/hYpuS+3p+13J5KQU2Fa3eVRPi4M+/csDOUzf32yFZ83W9Y8lQKr4
        IxlLAeX+1+HBFz18s/BhU
X-Received: by 2002:a9d:5c8b:: with SMTP id a11mr22357617oti.126.1608818562305;
        Thu, 24 Dec 2020 06:02:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy5TuK4g70Wa7LQ5fkxYOJAqadcOmmttNzmJip+R7fCyD06vTogTSKVmSmRkNY9QCefp2bAug==
X-Received: by 2002:a9d:5c8b:: with SMTP id a11mr22357606oti.126.1608818562059;
        Thu, 24 Dec 2020 06:02:42 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id g12sm6838873oos.8.2020.12.24.06.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Dec 2020 06:02:41 -0800 (PST)
Subject: Re: [PATCH 1/2] clk: axi-clkgen: add support for ZynqMP (UltraScale)
To:     Alexandru Ardelean <alexandru.ardelean@analog.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        lars@metafoo.de, linux-fpga@vger.kernel.org, mdf@kernel.org,
        dragos.bogdan@analog.com, Mathias Tausen <mta@gomspace.com>
References: <20201221144224.50814-1-alexandru.ardelean@analog.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <58111fcc-d4c7-4b26-e038-2882b636e17f@redhat.com>
Date:   Thu, 24 Dec 2020 06:02:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201221144224.50814-1-alexandru.ardelean@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 12/21/20 6:42 AM, Alexandru Ardelean wrote:
> From: Dragos Bogdan <dragos.bogdan@analog.com>
>
> This IP core also works and is supported on the Xilinx ZynqMP (UltraScale)
> FPGA boards.
> This patch enables the driver to be available on these platforms as well.
>
> Since axi-clkgen is now supported on ZYNQMP, we need to make sure the
> max/min frequencies of the PFD and VCO are respected.
>
> This change adds two new compatible strings to select limits for Zynq or
> ZynqMP from the device data (in the OF table). The old compatible string
> (i.e. adi,axi-clkgen-2.00.a) is the same as adi,zynq-axi-clkgen-2.00.a,
> since the original version of this driver was designed on top of that
> platform.
>
> Signed-off-by: Dragos Bogdan <dragos.bogdan@analog.com>
> Signed-off-by: Mathias Tausen <mta@gomspace.com>
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> ---
>
> This is a re-spin of an older series.
> It needed to wait a txt -> yaml dt conversion:
> https://patchwork.kernel.org/project/linux-clk/patch/20201013143421.84188-1-alexandru.ardelean@analog.com/
>
> It's 2 patches squashed into one:
> https://patchwork.kernel.org/project/linux-clk/patch/20200929144417.89816-12-alexandru.ardelean@analog.com/
> https://patchwork.kernel.org/project/linux-clk/patch/20200929144417.89816-14-alexandru.ardelean@analog.com/
>
> The series from where all this started is:
> https://lore.kernel.org/linux-clk/20200929144417.89816-1-alexandru.ardelean@analog.com/
>
> Well, v4 was the point where I decided to split this into smaller
> series, and also do the conversion of the binding to yaml.
>
>  drivers/clk/Kconfig          |  2 +-
>  drivers/clk/clk-axi-clkgen.c | 15 +++++++++++++++
>  2 files changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 85856cff506c..252333e585e7 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -247,7 +247,7 @@ config CLK_TWL6040
>  
>  config COMMON_CLK_AXI_CLKGEN
>  	tristate "AXI clkgen driver"
> -	depends on ARCH_ZYNQ || MICROBLAZE || COMPILE_TEST
> +	depends on ARCH_ZYNQ || ARCH_ZYNQMP || MICROBLAZE || COMPILE_TEST
>  	help
>  	  Support for the Analog Devices axi-clkgen pcore clock generator for Xilinx
>  	  FPGAs. It is commonly used in Analog Devices' reference designs.
> diff --git a/drivers/clk/clk-axi-clkgen.c b/drivers/clk/clk-axi-clkgen.c
> index ad86e031ba3e..a413c13334ff 100644
> --- a/drivers/clk/clk-axi-clkgen.c
> +++ b/drivers/clk/clk-axi-clkgen.c
> @@ -108,6 +108,13 @@ static uint32_t axi_clkgen_lookup_lock(unsigned int m)
>  	return 0x1f1f00fa;
>  }
>  

Could something like

#ifdef ARCH_ZYNQMP

> +static const struct axi_clkgen_limits axi_clkgen_zynqmp_default_limits = {
> +	.fpfd_min = 10000,
> +	.fpfd_max = 450000,
> +	.fvco_min = 800000,
> +	.fvco_max = 1600000,
> +};

#endif

be added here and similar places to limit unused code ?

> +
>  static const struct axi_clkgen_limits axi_clkgen_zynq_default_limits = {
>  	.fpfd_min = 10000,
>  	.fpfd_max = 300000,
> @@ -560,6 +567,14 @@ static int axi_clkgen_remove(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id axi_clkgen_ids[] = {
> +	{
> +		.compatible = "adi,zynqmp-axi-clkgen-2.00.a",
> +		.data = &axi_clkgen_zynqmp_default_limits,
> +	},
> +	{
> +		.compatible = "adi,zynq-axi-clkgen-2.00.a",
> +		.data = &axi_clkgen_zynq_default_limits,
> +	},

This looks like zynqmp AND zynq are being added.

Is this a mistake ?

Tom

>  	{
>  		.compatible = "adi,axi-clkgen-2.00.a",
>  		.data = &axi_clkgen_zynq_default_limits,

