Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F57C2D0E4
	for <linux-clk@archiver.kernel.org>; Mon, 23 Nov 2020 04:03:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA8E120757
	for <linux-clk@archiver.kernel.org>; Mon, 23 Nov 2020 04:03:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UzncrOzD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727033AbgKWECp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 22 Nov 2020 23:02:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbgKWECo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 22 Nov 2020 23:02:44 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05BFDC061A4C
        for <linux-clk@vger.kernel.org>; Sun, 22 Nov 2020 20:02:42 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id c66so13678794pfa.4
        for <linux-clk@vger.kernel.org>; Sun, 22 Nov 2020 20:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yR5CqZG96T7B8FOyDG6DEb0BKOLXt2vj8oVOlshnWBU=;
        b=UzncrOzDAnf6+OdZfi3ny2MkrTnhc8VldtziLzNK8bgMM3LmlxOVpo9O16sGU+cuh8
         Y90K4iWZ4PpNvLJYIUd+hAeeoXt7glhzQrpAbJOUoXAwIY+48LhN0BWP//3yEGxnAwXc
         5+qaYlGlk9fI1Z2DJ8o97O58CQfUL9zuR5KdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yR5CqZG96T7B8FOyDG6DEb0BKOLXt2vj8oVOlshnWBU=;
        b=bE+75/oYkwArmTHw2E9onJ1AvXLbVYqYTdU0BGHbnaDUip+eeutVQIPnp25/nJyDiS
         7Gp8qAKMqvNt+HTLZUluL5Xu+4Xmb8IZ4XVqC1eHZJ1kDPhDlTh6/N2WAfSFbQJrsnL8
         50UX6vgZUWQEPEzLkutkNLE5+jNTp2QObsKmU/7VLY2vvVuQS2sY7VQcHLWwKuBpH6wl
         ZOfIyGw2iuAeXR9Onm/YnHIURx+/qKupknihepeElXe85RhNVZwOfII3YVO3okr4JUkE
         dlQ7uPnZ8L4iFyp/P9aZMuJE6A1cRzw4k6whRJSWdk8iPp2TmsL25yrhHW4RfOLou+dx
         6aWA==
X-Gm-Message-State: AOAM533QAWICJjigkbilFEjL359zcN4dkKNGqc1l8TOsHsYeapdknuRe
        QBHCx+PBpzT7ugeZGYS61XQzgQ==
X-Google-Smtp-Source: ABdhPJzQ1fPZRBdR6Uv8knK7dPKl+RmDLBbZB8Wy/U5bnUBV5Jc9w+Uc2rBiKh2kQvaAX9GJNz6Whw==
X-Received: by 2002:a63:c00b:: with SMTP id h11mr25323450pgg.7.1606104162288;
        Sun, 22 Nov 2020 20:02:42 -0800 (PST)
Received: from chromium.org ([2401:fa00:1:b:f693:9fff:fef4:a8fc])
        by smtp.gmail.com with ESMTPSA id s21sm8942192pgm.65.2020.11.22.20.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2020 20:02:41 -0800 (PST)
Date:   Mon, 23 Nov 2020 12:02:37 +0800
From:   Ikjoon Jang <ikjn@chromium.org>
To:     Weiyi Lu <weiyi.lu@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 23/24] arm64: dts: mediatek: Add mt8192 clock
 controllers
Message-ID: <20201123040237.GA3013347@chromium.org>
References: <1604887429-29445-1-git-send-email-weiyi.lu@mediatek.com>
 <1604887429-29445-24-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604887429-29445-24-git-send-email-weiyi.lu@mediatek.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Nov 09, 2020 at 10:03:48AM +0800, Weiyi Lu wrote:
> Add clock controller nodes for SoC mt8192
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 163 +++++++++++++++++++++++++++++++
>  1 file changed, 163 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index e12e024..92dcfbd 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -5,6 +5,7 @@
>   */
>  
>  /dts-v1/;
> +#include <dt-bindings/clock/mt8192-clk.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
> @@ -213,6 +214,24 @@
>  			};
>  		};
>  
> +		topckgen: syscon@10000000 {
> +			compatible = "mediatek,mt8192-topckgen", "syscon";
> +			reg = <0 0x10000000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		infracfg: syscon@10001000 {
> +			compatible = "mediatek,mt8192-infracfg", "syscon";
> +			reg = <0 0x10001000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		pericfg: syscon@10003000 {
> +			compatible = "mediatek,mt8192-pericfg", "syscon";
> +			reg = <0 0x10003000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +

There are 26 new bindings for mt8192 clock providers, "mediatek,mt8192-*'.
I guess the one reason of doing this is that those mmio blocks are
just scattered all around over different memory regions.

I wonder if there could be a simpler way of merging them into one
binding of "mediatek,mt8192-clocks" and converting all new bindings
into generic syscon:

	mt8192-clocks: mt8192_clocks {
		compatible = "mediatek,mt8192-clocks";
		#clock-cells = <1>;

		infracfg: clk_infracfg {
			syscon = <&syscon_infracfg>;
		};
		pericfg: clk_pericfg {
			syscon = <&syscon_pericfg>:
		};
	};

	syscon_pericfg: syscon@10003000 {
		compatible = "syscon";
		reg = <0 0x10003000 0 0x1000>;
	};

	...

>  		pio: pinctrl@10005000 {
>  			compatible = "mediatek,mt8192-pinctrl";
>  			reg = <0 0x10005000 0 0x1000>,
> @@ -238,6 +257,12 @@
>  			#interrupt-cells = <2>;
>  		};
>  
> +		apmixedsys: syscon@1000c000 {
> +			compatible = "mediatek,mt8192-apmixedsys", "syscon";
> +			reg = <0 0x1000c000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
>  		systimer: timer@10017000 {
>  			compatible = "mediatek,mt8192-timer",
>  				     "mediatek,mt6765-timer";
> @@ -247,6 +272,12 @@
>  			clock-names = "clk13m";
>  		};
>  
> +		scp_adsp: syscon@10720000 {
> +			compatible = "mediatek,mt8192-scp_adsp", "syscon";
> +			reg = <0 0x10720000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
>  		uart0: serial@11002000 {
>  			compatible = "mediatek,mt8192-uart",
>  				     "mediatek,mt6577-uart";
> @@ -267,6 +298,12 @@
>  			status = "disabled";
>  		};
>  
> +		imp_iic_wrap_c: syscon@11007000 {
> +			compatible = "mediatek,mt8192-imp_iic_wrap_c", "syscon";
> +			reg = <0 0x11007000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
>  		spi0: spi@1100a000 {
>  			compatible = "mediatek,mt8192-spi",
>  				     "mediatek,mt6765-spi";
> @@ -379,6 +416,12 @@
>  			status = "disabled";
>  		};
>  
> +		audsys: syscon@11210000 {
> +			compatible = "mediatek,mt8192-audsys", "syscon";
> +			reg = <0 0x11210000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
>  		i2c3: i2c3@11cb0000 {
>  			compatible = "mediatek,mt8192-i2c";
>  			reg = <0 0x11cb0000 0 0x1000>,
> @@ -392,6 +435,12 @@
>  			status = "disabled";
>  		};
>  
> +		imp_iic_wrap_e: syscon@11cb1000 {
> +			compatible = "mediatek,mt8192-imp_iic_wrap_e", "syscon";
> +			reg = <0 0x11cb1000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
>  		i2c7: i2c7@11d00000 {
>  			compatible = "mediatek,mt8192-i2c";
>  			reg = <0 0x11d00000 0 0x1000>,
> @@ -431,6 +480,12 @@
>  			status = "disabled";
>  		};
>  
> +		imp_iic_wrap_s: syscon@11d03000 {
> +			compatible = "mediatek,mt8192-imp_iic_wrap_s", "syscon";
> +			reg = <0 0x11d03000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
>  		i2c1: i2c1@11d20000 {
>  			compatible = "mediatek,mt8192-i2c";
>  			reg = <0 0x11d20000 0 0x1000>,
> @@ -470,6 +525,12 @@
>  			status = "disabled";
>  		};
>  
> +		imp_iic_wrap_ws: syscon@11d23000 {
> +			compatible = "mediatek,mt8192-imp_iic_wrap_ws", "syscon";
> +			reg = <0 0x11d23000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
>  		i2c5: i2c5@11e00000 {
>  			compatible = "mediatek,mt8192-i2c";
>  			reg = <0 0x11e00000 0 0x1000>,
> @@ -483,6 +544,12 @@
>  			status = "disabled";
>  		};
>  
> +		imp_iic_wrap_w: syscon@11e01000 {
> +			compatible = "mediatek,mt8192-imp_iic_wrap_w", "syscon";
> +			reg = <0 0x11e01000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
>  		i2c0: i2c0@11f00000 {
>  			compatible = "mediatek,mt8192-i2c";
>  			reg = <0 0x11f00000 0 0x1000>,
> @@ -508,5 +575,101 @@
>  			#size-cells = <0>;
>  			status = "disabled";
>  		};
> +
> +		imp_iic_wrap_n: syscon@11f02000 {
> +			compatible = "mediatek,mt8192-imp_iic_wrap_n", "syscon";
> +			reg = <0 0x11f02000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		msdc_top: syscon@11f10000 {
> +			compatible = "mediatek,mt8192-msdc_top", "syscon";
> +			reg = <0 0x11f10000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		msdc: syscon@11f60000 {
> +			compatible = "mediatek,mt8192-msdc", "syscon";
> +			reg = <0 0x11f60000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		mfgcfg: syscon@13fbf000 {
> +			compatible = "mediatek,mt8192-mfgcfg", "syscon";
> +			reg = <0 0x13fbf000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		mmsys: syscon@14000000 {
> +			compatible = "mediatek,mt8192-mmsys", "syscon";
> +			reg = <0 0x14000000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		imgsys: syscon@15020000 {
> +			compatible = "mediatek,mt8192-imgsys", "syscon";
> +			reg = <0 0x15020000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		imgsys2: syscon@15820000 {
> +			compatible = "mediatek,mt8192-imgsys2", "syscon";
> +			reg = <0 0x15820000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		vdecsys_soc: syscon@1600f000 {
> +			compatible = "mediatek,mt8192-vdecsys_soc", "syscon";
> +			reg = <0 0x1600f000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		vdecsys: syscon@1602f000 {
> +			compatible = "mediatek,mt8192-vdecsys", "syscon";
> +			reg = <0 0x1602f000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		vencsys: syscon@17000000 {
> +			compatible = "mediatek,mt8192-vencsys", "syscon";
> +			reg = <0 0x17000000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		camsys: syscon@1a000000 {
> +			compatible = "mediatek,mt8192-camsys", "syscon";
> +			reg = <0 0x1a000000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		camsys_rawa: syscon@1a04f000 {
> +			compatible = "mediatek,mt8192-camsys_rawa", "syscon";
> +			reg = <0 0x1a04f000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		camsys_rawb: syscon@1a06f000 {
> +			compatible = "mediatek,mt8192-camsys_rawb", "syscon";
> +			reg = <0 0x1a06f000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		camsys_rawc: syscon@1a08f000 {
> +			compatible = "mediatek,mt8192-camsys_rawc", "syscon";
> +			reg = <0 0x1a08f000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		ipesys: syscon@1b000000 {
> +			compatible = "mediatek,mt8192-ipesys", "syscon";
> +			reg = <0 0x1b000000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		mdpsys: syscon@1f000000 {
> +			compatible = "mediatek,mt8192-mdpsys", "syscon";
> +			reg = <0 0x1f000000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
>  	};
>  };
> -- 
> 1.8.1.1.dirty
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
