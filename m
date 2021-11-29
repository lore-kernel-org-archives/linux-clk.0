Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD07C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 29 Nov 2021 20:21:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231216AbhK2UY1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 29 Nov 2021 15:24:27 -0500
Received: from mail-ot1-f52.google.com ([209.85.210.52]:33768 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233628AbhK2UWB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 29 Nov 2021 15:22:01 -0500
Received: by mail-ot1-f52.google.com with SMTP id 35-20020a9d08a6000000b00579cd5e605eso27274080otf.0;
        Mon, 29 Nov 2021 12:18:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AKx0UYp+W8zlORh/hAYHKyH5CFDH7qwJghIGPlkX1y4=;
        b=KWFmWZpBFj2ZTcuOk0wL8BNrDTKitu1nbN45mb/ookWH2fvaiBMJSlHFLnCqlMgnSX
         bQJlCICOEAzb7MTVMYFOxZEafUDYTSR1IbD8Cl0A+NsiGTKZ/ShXTtY6oGN2RC9p/56q
         Viws++XMtsPD8jvTl+i8+4C04DeyKkBE+oRz0In+zrn/Fz6DA7AZ5ntaxDWUfctr2G1o
         ZfxgeLor6PpuFbLydYU3dXRsOa5bk/+DbvW2ZPdhwPzqfFNIwrx/rMl5uOaFb7OJ7j4Y
         ExmvgGMe8nhaAcoL6/QYEEL2puXwAlQAS9eD/vVOlf6ey0Fi3a/COdc40azAPVYtSurL
         Y1eQ==
X-Gm-Message-State: AOAM530mXl/y+shWnOAZznNiNFJo19RhkaPwQRKN31T89R2leZ7Sw5cJ
        u1rvN8Bv+0yZQhZmlh+Ntg==
X-Google-Smtp-Source: ABdhPJzEO4tezry+DcDXNejiaC6V+voG6IAskVfPvrOgWmqcp2NdJc3t8aNfv9fiiM/5wwFXk9QbAw==
X-Received: by 2002:a05:6830:2704:: with SMTP id j4mr47148179otu.184.1638217123238;
        Mon, 29 Nov 2021 12:18:43 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id x13sm2813714otr.58.2021.11.29.12.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 12:18:42 -0800 (PST)
Received: (nullmailer pid 534139 invoked by uid 1000);
        Mon, 29 Nov 2021 20:18:41 -0000
Date:   Mon, 29 Nov 2021 14:18:41 -0600
From:   Rob Herring <robh@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-clk@vger.kernel.org,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-power@fi.rohmeurope.com
Subject: Re: [PATCH] [RFC] dt-bindings: clk: Introduce 'critical-clocks'
 property
Message-ID: <YaU1oThMxsBJj+re@robh.at.kernel.org>
References: <20211108224242.278128-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211108224242.278128-1-marex@denx.de>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Nov 08, 2021 at 11:42:42PM +0100, Marek Vasut wrote:
> NOTE: This is an RFC patch showing how this mechanism might be workable.
> 
> Some platforms require clock to be always running, e.g. because those clock
> supply devices which are not otherwise attached to the system. One example
> is a system where the SoC serves as a crystal oscillator replacement for a
> programmable logic device. The critical-clock property of a clock controller
> allows listing clock which must never be turned off.
> 
> The implementation here is similar to "protected-clock", except protected
> clock property is currently driver specific. This patch attempts to make
> a generic implementation of "critical-clock" instead.
> 
> Unlike "assigned-clocks", the "critical-clock" must be parsed much earlier
> in __clk_register() to assign CLK_IS_CRITICAL flag to clk_init_data .flags
> field. The parsing code obviously need to be cleaned up and factor out into
> separate function.
> 
> The new match_clkspec() callback is used to determine whether struct clk_hw
> that is currently being registered matches the clock specifier in the DT
> "critical-clock" property, and if so, then the CLK_IS_CRITICAL is added to
> these newly registered clock. This callback is currently driver specific,
> although I suspect a common and/or generic version of the callback could
> be added. Also, this new callback could possibly be used to replace (*get)
> argument of of_clk_add_hw_provider() later on too.
> 
> Thoughts (on the overall design, not code quality or patch splitting) ?
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-power@fi.rohmeurope.com
> To: linux-clk@vger.kernel.org
> ---
>  .../bindings/clock/clock-bindings.txt         | 16 ++++++++++++
>  drivers/clk/clk-bd718x7.c                     | 15 +++++++++++
>  drivers/clk/clk.c                             | 25 +++++++++++++++++++
>  include/linux/clk-provider.h                  |  2 ++
>  4 files changed, 58 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> index f2ea53832ac63..d9a783c35c5a1 100644
> --- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
> +++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> @@ -169,6 +169,22 @@ a shared clock is forbidden.
>  Configuration of common clocks, which affect multiple consumer devices can
>  be similarly specified in the clock provider node.
>  
> +==Critical clocks==
> +
> +Some platforms require clock to be always running, e.g. because those clock
> +supply devices which are not otherwise attached to the system. One example
> +is a system where the SoC serves as a crystal oscillator replacement for a
> +programmable logic device. The critical-clock property of a clock controller
> +allows listing clock which must never be turned off.
> +
> +   clock-controller@a000f000 {
> +        compatible = "vendor,clk95;
> +        reg = <0xa000f000 0x1000>
> +        #clocks-cells = <1>;
> +        ...
> +        critical-clocks = <UART3_CLK>, <SPI5_CLK>;

This will need a schema definition in dtschema.

Otherwise, the concept is fine for me. 

Rob
