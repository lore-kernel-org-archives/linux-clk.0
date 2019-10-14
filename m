Return-Path: <SRS0=L9C4=YH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2463DC4CECE
	for <linux-clk@archiver.kernel.org>; Mon, 14 Oct 2019 14:44:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F2317222C1
	for <linux-clk@archiver.kernel.org>; Mon, 14 Oct 2019 14:44:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EwxHdjjN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731121AbfJNOop (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Oct 2019 10:44:45 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40359 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732960AbfJNOoo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Oct 2019 10:44:44 -0400
Received: by mail-pf1-f194.google.com with SMTP id x127so10524234pfb.7
        for <linux-clk@vger.kernel.org>; Mon, 14 Oct 2019 07:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bNRsloUe1+m4c9HwAHy8LRzIsaF4TY0K3ozGxhA8oJE=;
        b=EwxHdjjNsqta9UkaQIFxIfnG0B6BAXf96vujfejhhkvHxVRBeQJgGrK9iYGgytgIEp
         9jm7sveUEd3k0Of2wyL6yDBybU1TWyg5lKWEjTIIelCia+RL1q6CrR0ZTmYBbAFRr46R
         82EZYjy6E2P2VFQAk+sZ0NkdG4Bmy1z3VzmSgaBqAhbMIPSgFUXiwirEu2ePF5hq8scJ
         bR47FX/znhoRxEHlW6LjlbtkjQD/8jKZwFjqomoa+4FY973w7sHWCxRFpMhxD67LbH9U
         0dZibsYhA/CwgcIkSqFv/IQIkeFjp6PDfUZcseqBC+qIr+hmerTNNTaFbRj27GitbON7
         0DUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bNRsloUe1+m4c9HwAHy8LRzIsaF4TY0K3ozGxhA8oJE=;
        b=FFF4nCkvXSRSlxU3CZEgXzVShxcHkrC9xdFv8Lsq+sSHhr1xPjg22DZ9Yhv9KrN8AT
         Ki5j8+L38RVYReIFXsBLi+661B5mGccFB8Z8diQHTXzRMRkT1Yz7IK8Mgm6dpSEu5I8s
         Hf+wdtcjSwpUKADRk0VgSE5YKIRG9ps/UDq/AMmBzFJXRa7FCNg1HrKUbVch4bHyF3mz
         f076ACVGF80Z7GiBAippJMrI+05YSDITvF7oZbjAPtzvK8SmfVQdxtqFfc9N5yGfQP2P
         8hxStEyhSSC7z7YH/GvBb7q1Haxk1GZ1bN99IApZ4x/K+J+zvro2FzLEwGzZdYfA+glx
         Lpwg==
X-Gm-Message-State: APjAAAUPtqEuLPzUsIljUbZthwsWQFiN/XDg8hP54sU4TtZSwXVSh4fV
        3H90thfmd+aH/OUVAPHV5aX6
X-Google-Smtp-Source: APXvYqyaDf+8FJSPKt0DRGHMoHpd4vlbdM2vJwLkBbOx/vnNENq1hbKjckJw85Fgl07ugMHoEKf38Q==
X-Received: by 2002:a63:5423:: with SMTP id i35mr34670105pgb.128.1571064281958;
        Mon, 14 Oct 2019 07:44:41 -0700 (PDT)
Received: from mani ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id y8sm14852113pgs.34.2019.10.14.07.44.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 07:44:41 -0700 (PDT)
Date:   Mon, 14 Oct 2019 20:14:32 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     ulf.hansson@linaro.org, afaerber@suse.de, robh+dt@kernel.org,
        sboyd@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        thomas.liau@actions-semi.com, linux-actions@lists.infradead.org,
        linus.walleij@linaro.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 3/7] arm64: dts: actions: Add MMC controller support
 for S900
Message-ID: <20191014144432.GA8583@mani>
References: <20190916154546.24982-1-manivannan.sadhasivam@linaro.org>
 <20190916154546.24982-4-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190916154546.24982-4-manivannan.sadhasivam@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Sep 16, 2019 at 09:15:42PM +0530, Manivannan Sadhasivam wrote:
> Add MMC controller support for Actions Semi S900 SoC. There are 4 MMC
> controllers in this SoC which can be used for accessing SD/MMC/SDIO cards.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied for v5.5.

Thanks,
Mani

> ---
>  arch/arm64/boot/dts/actions/s900.dtsi | 45 +++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/actions/s900.dtsi b/arch/arm64/boot/dts/actions/s900.dtsi
> index df3a68a3ac97..eb35cf78ab73 100644
> --- a/arch/arm64/boot/dts/actions/s900.dtsi
> +++ b/arch/arm64/boot/dts/actions/s900.dtsi
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <dt-bindings/clock/actions,s900-cmu.h>
> +#include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/reset/actions,s900-reset.h>
>  
> @@ -284,5 +285,49 @@
>  			dma-requests = <46>;
>  			clocks = <&cmu CLK_DMAC>;
>  		};
> +
> +		mmc0: mmc@e0330000 {
> +			compatible = "actions,owl-mmc";
> +			reg = <0x0 0xe0330000 0x0 0x4000>;
> +			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cmu CLK_SD0>;
> +			resets = <&cmu RESET_SD0>;
> +			dmas = <&dma 2>;
> +			dma-names = "mmc";
> +			status = "disabled";
> +		};
> +
> +		mmc1: mmc@e0334000 {
> +			compatible = "actions,owl-mmc";
> +			reg = <0x0 0xe0334000 0x0 0x4000>;
> +			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cmu CLK_SD1>;
> +			resets = <&cmu RESET_SD1>;
> +			dmas = <&dma 3>;
> +			dma-names = "mmc";
> +			status = "disabled";
> +		};
> +
> +		mmc2: mmc@e0338000 {
> +			compatible = "actions,owl-mmc";
> +			reg = <0x0 0xe0338000 0x0 0x4000>;
> +			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cmu CLK_SD2>;
> +			resets = <&cmu RESET_SD2>;
> +			dmas = <&dma 4>;
> +			dma-names = "mmc";
> +			status = "disabled";
> +		};
> +
> +		mmc3: mmc@e033c000 {
> +			compatible = "actions,owl-mmc";
> +			reg = <0x0 0xe033c000 0x0 0x4000>;
> +			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cmu CLK_SD3>;
> +			resets = <&cmu RESET_SD3>;
> +			dmas = <&dma 46>;
> +			dma-names = "mmc";
> +			status = "disabled";
> +		};
>  	};
>  };
> -- 
> 2.17.1
> 
