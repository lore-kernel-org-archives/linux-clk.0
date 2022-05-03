Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5458C433F5
	for <linux-clk@archiver.kernel.org>; Tue,  3 May 2022 21:16:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235746AbiECVUG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 May 2022 17:20:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbiECVUG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 May 2022 17:20:06 -0400
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A746425E85;
        Tue,  3 May 2022 14:16:31 -0700 (PDT)
Received: by mail-oi1-f181.google.com with SMTP id r8so19505906oib.5;
        Tue, 03 May 2022 14:16:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vcrV5cJCL/yAVp+KwhARHe1vfOLSEv6ziIn3lyRIq3M=;
        b=TC4YPhwwIEU/qH/ftJ3oH4/O7anHXJrDTYM1iFNbGrluSDvuP66qjoKIPwfMbyuQ8X
         477aQg8pFraLB1r8dG6ak46xR/n2juBTOti8JMgn6IKbiZ2Vz/FZEuGkrcxTKs+xOnjr
         sAniYwtJD0dYuuWSzCKmm/1xrhqLemooEh4lvwmub1vDCoBwU8KILu+r2j8vYWESls+t
         bNkyMOwmIVJXpvi8U9328/uJQT4YT/81w6kEUCTw7hgXqdrqklFOSLPa/OBNlKhxQeNw
         NRaaR6hWpokXudJDoBX3cw3NiWD9u3kb3c4iysEk2QUDB7UV3gaOM98VpkO8sxMVX1NI
         2w2w==
X-Gm-Message-State: AOAM5334Sl+zdLKqrAM4kpcj/a5oBeIzsGe+7QFpTZ4CJ5DRx1ZVZFus
        2UzMxY03YNGIi2C7ZJpJMg==
X-Google-Smtp-Source: ABdhPJzZ/OyRA/MZSV7Bt7V6rGVYIwZuYmkmsXdLoGoNZRjsAtnSm7oCEho7ztN2hUZDiEi9HBLJNA==
X-Received: by 2002:a05:6808:120c:b0:325:731e:923 with SMTP id a12-20020a056808120c00b00325731e0923mr2630508oil.155.1651612590975;
        Tue, 03 May 2022 14:16:30 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id g14-20020a05683030ae00b0060603221239sm4356388ots.9.2022.05.03.14.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 14:16:30 -0700 (PDT)
Received: (nullmailer pid 46134 invoked by uid 1000);
        Tue, 03 May 2022 21:16:29 -0000
Date:   Tue, 3 May 2022 16:16:29 -0500
From:   Rob Herring <robh@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [RESEND][PATCH v2 1/2] dt-bindings: clk: Introduce
 'critical-clocks' property
Message-ID: <YnGbrbtla8YHmKM1@robh.at.kernel.org>
References: <20220428110107.149524-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220428110107.149524-1-marex@denx.de>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Apr 28, 2022 at 01:01:06PM +0200, Marek Vasut wrote:
> Some platforms require select clock to be always running, e.g. because
> those clock supply vital devices which are not otherwise attached to
> the system and thus do not have a matching DT node and clock consumer.
> 
> An example is a system where the SoC serves as a crystal oscillator
> replacement for a programmable logic device. The "critical-clocks"
> property of a clock controller allows listing clock which must never
> be turned off.
> 
> Clock listed in the "critical-clocks" property may have other consumers
> in DT, listing the clock in "critical-clocks" only assures those clock
> are never turned off, and none of these optional additional consumers
> can turn the clock off either.
> 
> The implementation is modeled after "protected-clocks".
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org
> To: linux-clk@vger.kernel.org
> ---
> V2: Update the commit message to clarify the behavior
> ---
>  .../devicetree/bindings/clock/clock-bindings.txt | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

As mentioned on IRC, I'm okay with the property, but want Stephen's 
opinion on it. It also needs to be a schema in dtschema with the rest of 
the clock binding. I've submitted a patch to redirect this file to the 
schema.

> 
> diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> index f2ea53832ac6..975230e603d1 100644
> --- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
> +++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> @@ -169,6 +169,22 @@ a shared clock is forbidden.
>  Configuration of common clocks, which affect multiple consumer devices can
>  be similarly specified in the clock provider node.
>  
> +==Critical clocks==
> +
> +Some platforms require clock to be always running, e.g. because those clock

require some clocks

> +supply devices which are not otherwise attached to the system. One example
> +is a system where the SoC serves as a crystal oscillator replacement for a
> +programmable logic device. The critical-clocks property of a clock controller
> +allows listing clock which must never be turned off.
> +
> +   clock-controller@a000f000 {
> +        compatible = "vendor,clk95;
> +        reg = <0xa000f000 0x1000>
> +        #clocks-cells = <1>;
> +        ...
> +        critical-clocks = <UART3_CLK>, <SPI5_CLK>;
> +   };
> +
>  ==Protected clocks==
>  
>  Some platforms or firmwares may not fully expose all the clocks to the OS, such
> -- 
> 2.35.1
> 
> 
