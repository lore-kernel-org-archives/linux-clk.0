Return-Path: <SRS0=NuDk=PZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B08C43387
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jan 2019 06:44:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7FAC420657
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jan 2019 06:44:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="FoLHtbyD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728200AbfAQGoy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Jan 2019 01:44:54 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44921 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728187AbfAQGox (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Jan 2019 01:44:53 -0500
Received: by mail-pg1-f196.google.com with SMTP id t13so3981068pgr.11
        for <linux-clk@vger.kernel.org>; Wed, 16 Jan 2019 22:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=atLgXCZJmtT0O+GD3SkLBWNlve906gHwrgA3+iQTNq8=;
        b=FoLHtbyD+T0hvK+Xsp8pX/kYm+I/+k4QezqwPy4hZEZOawY2bnAnmlg4Lqho8lfRFC
         Pe+kTdIIXJOQiqLOuMj2BNQwVtPcMeN9yRHNlK3tuyW9GRfX/qzmxsKxAR+caOljDVnx
         7oIH1rzzHgC/Mst7cn6AwQQOxI6ERIWzCV4G4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=atLgXCZJmtT0O+GD3SkLBWNlve906gHwrgA3+iQTNq8=;
        b=K7vg5AA34TwMSgZl85KvixfJZpj+acG29fxDSqPAlhmaLJdoZ520vE6U1rbnRfLHX9
         FTUIzvMcy1F0muc7u6Sny05Z0QnOMIdOWVu4qgGRHbrHQexxFpbMcdtls0ZLPEFYoisz
         GWHsXxar5BUf4Q6PVK6NQjP1CHmHG2Z2qQLay/3RO3OfuTrteH5TB9eKLYzdtYvQQe7g
         hZ9oXmwWfYLBocLWsnXpXF6AuhK3Y5fxZZq+6GM7yxFc6ciCbQPp7ApSzr0GJmoodARA
         XjuJopT2VP/QBOH/h6HxMNI/yTNutek7bTVGpi5RsEJldmTKE+cj77omvV518eX/bKaU
         w18w==
X-Gm-Message-State: AJcUukctA+b4m3mrvwaPpS9ehNQpD0AFht1OtGGIxi3Y4eIbLuU7o2X0
        x5eOMIwrPiBiu319DUbWITc/7Q==
X-Google-Smtp-Source: ALg8bN62G0/QBaoJRR1ApqR8rAiY5+uOY2xmB/Wpjp2VNGDP8FZVdyPWnrnDVFMusI5C+iaXRq/f4Q==
X-Received: by 2002:a62:2fc3:: with SMTP id v186mr13782534pfv.82.1547707492463;
        Wed, 16 Jan 2019 22:44:52 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v190sm977708pfv.26.2019.01.16.22.44.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jan 2019 22:44:51 -0800 (PST)
Date:   Wed, 16 Jan 2019 22:44:11 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org,
        david.brown@linaro.org, sboyd@kernel.org, will.deacon@arm.com,
        mturquette@baylibre.com, jassisinghbrar@gmail.com,
        vkoul@kernel.org, niklas.cassel@linaro.org, sibis@codeaurora.org,
        georgi.djakov@linaro.org, arnd@arndb.de,
        horms+renesas@verge.net.au, heiko@sntech.de,
        enric.balletbo@collabora.com, jagan@amarulasolutions.com,
        olof@lixom.net, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 04/13] dt-bindings: mailbox: qcom: Add clock-name
 optional property
Message-ID: <20190117064411.GK25498@builder>
References: <1545039990-19984-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1545039990-19984-5-git-send-email-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1545039990-19984-5-git-send-email-jorge.ramirez-ortiz@linaro.org>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon 17 Dec 01:46 PST 2018, Jorge Ramirez-Ortiz wrote:

> When the APCS clock is registered (platform dependent), it retrieves
> its parent names from hardcoded values in the driver.
> 
> The following commit allows the DT node to provide such clock names to
> the platform data based clock driver therefore avoiding having to
> explicitly embed those names in the clock driver source code.
> 
> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---
>  .../bindings/mailbox/qcom,apcs-kpss-global.txt      | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
> index 1232fc9..f252439 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
> @@ -23,6 +23,10 @@ platforms.
>  	Value type: <phandle>
>  	Definition: phandle to the input PLL, which feeds the APCS mux/divider
>  
> +       Usage: required if #clock-names property is present
> +       Value type: <phandle array>
> +	Definition: phandles to the two parent clocks of the clock driver.

I presume you meant to replace the existing definition of "clocks"?

I think the purpose of "required if #clock-cells" comes from that
meaning that it represents a clock-controller if #clock-cells is
specified, in which case it requires the upstream clock(s).

Regards,
Bjorn

> +
>  - #mbox-cells:
>  	Usage: required
>  	Value type: <u32>
> @@ -33,6 +37,12 @@ platforms.
>  	Value type: <u32>
>  	Definition: as described in clock.txt, must be 0
>  
> +- clock-names:
> +	Usage: required if the platform data based clock driver needs to
> +	retrieve the parent clock names from device tree.
> +	This will requires two mandatory clocks to be defined.
> +	Value type: <string-array>
> +	Definition: must be "aux" and "pll"
>  
>  = EXAMPLE
>  The following example describes the APCS HMSS found in MSM8996 and part of the
> @@ -65,3 +75,14 @@ Below is another example of the APCS binding on MSM8916 platforms:
>  		clocks = <&a53pll>;
>  		#clock-cells = <0>;
>  	};
> +
> +Below is another example of the APCS binding on QCS404 platforms:
> +
> +	apcs_glb: mailbox@b011000 {
> +		compatible = "qcom,qcs404-apcs-apps-global", "syscon";
> +		reg = <0x0b011000 0x1000>;
> +		#mbox-cells = <1>;
> +		clocks = <&gcc GCC_GPLL0_AO_OUT_MAIN>, <&apcs_hfpll>;
> +		clock-names = "aux", "pll";
> +		#clock-cells = <0>;
> +	};
> -- 
> 2.7.4
> 
