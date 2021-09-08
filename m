Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB603C433EF
	for <linux-clk@archiver.kernel.org>; Wed,  8 Sep 2021 02:09:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD0B06115C
	for <linux-clk@archiver.kernel.org>; Wed,  8 Sep 2021 02:09:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347131AbhIHCKp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Sep 2021 22:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347125AbhIHCKo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Sep 2021 22:10:44 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C754C061757
        for <linux-clk@vger.kernel.org>; Tue,  7 Sep 2021 19:09:37 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so367772pjc.3
        for <linux-clk@vger.kernel.org>; Tue, 07 Sep 2021 19:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7NYzM/JHWz+Fchf07XDZ5B5EQZtrwYGf0aZaNqlzyHc=;
        b=nBbT/qUKGrTbqMibm0K8J4JkgO3JQakv4S3JxJCGj1nqvnkGXh60acFH6QHdOdOwFq
         tl2JgUe/6Y+vT0gVbgAPKikswJIfV1buTiAh9B71JzG71J2uzX9Fw0nEgTWg8UVoIG45
         yhBSM1GVQOrT1pzXmxmHoQoIOO4VjQHBMyjpIR022OjCNlKae5xRXVoYjr2E30tDhemA
         updhzfS6gsPwWpWNjd0U8o7/bwuajJ99c2EVsY8tB7/yIUqM9K8gg0B/Zcnwkmj+s+KZ
         ZJ375lKTAZRRNglanTHHEzVJ01JqWvMaOIEIulafVBU7vM11Fy7fwImFdym4PsIJ+2Wz
         C5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7NYzM/JHWz+Fchf07XDZ5B5EQZtrwYGf0aZaNqlzyHc=;
        b=rNmkdAc1v5mW7WYrMnU9FGQ2ZPZFpsnWl8wrAV2d8JkRtOiwVe8KhJOhACEgbxGdW2
         QNBDyEsik4VaSM1cwZin5IwbGkjbjWzOpXgblFV3tBN/3Cz7FPndO/3xb+mbb8k4u8k/
         M5H+5kJ9c4+6NyuUm3L8wia3VROS+zgo6+sLvL96rJdHCbs3GWrZvGjGCv+qqy2UIS2l
         pOCk+ZrG+h9hUlw/qTId2z3pOzMoSWbWjViRFCOxJol0Wob0UcE/7gw5n24JnOsfFdIx
         moFDDXVLPMDmUauvxMlhtGuJj7bGQvY7IJpc+uVMNIGK57KvnP61rjEaIqDygnctQgUc
         2Ycw==
X-Gm-Message-State: AOAM532kI3RIDoZ1SVUelXJG75jeStslHFQAAlGMuBRGy1CEXSLz+wnN
        0KcY4EV3yLo4O+gnsPey0rB7UKt1yf3SHg6QOGQ=
X-Google-Smtp-Source: ABdhPJxdP4gTchzCo+ZAT1VvYKwNscoCzoB5wdo4DUOGVEojV9N2Jj5yp24CISY6jJFA1h2GQcsMKw==
X-Received: by 2002:a17:902:c205:b0:138:c28f:a774 with SMTP id 5-20020a170902c20500b00138c28fa774mr939495pll.59.1631066976966;
        Tue, 07 Sep 2021 19:09:36 -0700 (PDT)
Received: from leoy-ThinkPad-X240s ([202.155.204.36])
        by smtp.gmail.com with ESMTPSA id d5sm331607pfd.142.2021.09.07.19.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 19:09:36 -0700 (PDT)
Date:   Wed, 8 Sep 2021 10:09:31 +0800
From:   Leo Yan <leo.yan@linaro.org>
To:     Brian Norris <briannorris@chromium.org>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Chen-Yu Tsai <wenst@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [RESEND PATCH 2/2] arm64: dts: rockchip: add Coresight debug
 range for RK3399
Message-ID: <20210908020931.GB1538480@leoy-ThinkPad-X240s>
References: <20210907094628.RESEND.1.If29cd838efbcee4450a62b8d84a99b23c86e0a3f@changeid>
 <20210907094628.RESEND.2.Ibc87b4785709543c998cc852c1edaeb7a08edf5c@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210907094628.RESEND.2.Ibc87b4785709543c998cc852c1edaeb7a08edf5c@changeid>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Sep 07, 2021 at 09:46:37AM -0700, Brian Norris wrote:
> Per Documentation/devicetree/bindings/arm/coresight-cpu-debug.txt.
> 
> This IP block can be used for sampling the PC of any given CPU, which is
> useful in certain panic scenarios where you can't get the CPU to stop
> cleanly (e.g., hard lockup).
> 
> Signed-off-by: Brian Norris <briannorris@chromium.org>

Looks good to me, FWIW:

Reviewed-by: Leo Yan <leo.yan@linaro.org>

> ---
> 
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 48 ++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> index 3871c7fd83b0..c8c62637b600 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> @@ -433,6 +433,54 @@ usbdrd_dwc3_1: usb@fe900000 {
>  		};
>  	};
>  
> +	debug@fe430000 {
> +		compatible = "arm,coresight-cpu-debug", "arm,primecell";
> +		reg = <0 0xfe430000 0 0x1000>;
> +		clocks = <&cru PCLK_COREDBG_L>;
> +		clock-names = "apb_pclk";
> +		cpu = <&cpu_l0>;
> +	};
> +
> +	debug@fe432000 {
> +		compatible = "arm,coresight-cpu-debug", "arm,primecell";
> +		reg = <0 0xfe432000 0 0x1000>;
> +		clocks = <&cru PCLK_COREDBG_L>;
> +		clock-names = "apb_pclk";
> +		cpu = <&cpu_l1>;
> +	};
> +
> +	debug@fe434000 {
> +		compatible = "arm,coresight-cpu-debug", "arm,primecell";
> +		reg = <0 0xfe434000 0 0x1000>;
> +		clocks = <&cru PCLK_COREDBG_L>;
> +		clock-names = "apb_pclk";
> +		cpu = <&cpu_l2>;
> +	};
> +
> +	debug@fe436000 {
> +		compatible = "arm,coresight-cpu-debug", "arm,primecell";
> +		reg = <0 0xfe436000 0 0x1000>;
> +		clocks = <&cru PCLK_COREDBG_L>;
> +		clock-names = "apb_pclk";
> +		cpu = <&cpu_l3>;
> +	};
> +
> +	debug@fe610000 {
> +		compatible = "arm,coresight-cpu-debug", "arm,primecell";
> +		reg = <0 0xfe610000 0 0x1000>;
> +		clocks = <&cru PCLK_COREDBG_B>;
> +		clock-names = "apb_pclk";
> +		cpu = <&cpu_b0>;
> +	};
> +
> +	debug@fe710000 {
> +		compatible = "arm,coresight-cpu-debug", "arm,primecell";
> +		reg = <0 0xfe710000 0 0x1000>;
> +		clocks = <&cru PCLK_COREDBG_B>;
> +		clock-names = "apb_pclk";
> +		cpu = <&cpu_b1>;
> +	};
> +
>  	cdn_dp: dp@fec00000 {
>  		compatible = "rockchip,rk3399-cdn-dp";
>  		reg = <0x0 0xfec00000 0x0 0x100000>;
> -- 
> 2.33.0.153.gba50c8fa24-goog
> 
