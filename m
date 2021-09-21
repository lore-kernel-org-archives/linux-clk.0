Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6DFAC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 21 Sep 2021 20:21:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B907A6115A
	for <linux-clk@archiver.kernel.org>; Tue, 21 Sep 2021 20:21:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231494AbhIUUXE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Sep 2021 16:23:04 -0400
Received: from mail-ot1-f46.google.com ([209.85.210.46]:35588 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230348AbhIUUXE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Sep 2021 16:23:04 -0400
Received: by mail-ot1-f46.google.com with SMTP id 77-20020a9d0ed3000000b00546e10e6699so261211otj.2;
        Tue, 21 Sep 2021 13:21:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zYcp/WS2dlftgb7wX8FVo6H8TAEkfNxUtmLYVyxn+ok=;
        b=RprKemGGCQLlHqyA/ju61QIDJCAuKAYS8xAURpKEn+F8O2b+t9N2RpA0buwyzowVfS
         0D7ZJHFVjbLpKccUukJVfeZA+gU7FawVbe4b+MPgY0fuL3XDwLBpdZnhMT7o2u9hMXOY
         nzBwbr1JNlyFlPq953l2BZYASOo/Tf70PjhHiY0qGZUc/5jr5j6bPta1uPSVj3Ne6lhD
         TI6NNViUaOTiXaKJIAUo6VUu63nu94npPS+QIIsrF3cbxAE7zkbDSF9rGHuGWctzyHzK
         qpUMm1KQ1iJfUaaJfYUe0N2Ws2srQj9YE1CB8qQjUpMA7ZDZefcqiQU3/lBXsQyYlaat
         R6kg==
X-Gm-Message-State: AOAM530ZtEWVfWGxSuedrBWtKCSothLb+zSOkjMy5zYU6s0WRSlqdL8c
        CdKaHMAHwnEcan3Xqj9PmS+N8YuwNw==
X-Google-Smtp-Source: ABdhPJwZfRf4HZVYyQNHwZlAs5eEEA2WlBtn6r5mlMM604XVMZsL5d5Wkj2hjYzchyNtMhlJDzPq9w==
X-Received: by 2002:a05:6830:19d2:: with SMTP id p18mr28085998otp.250.1632255695275;
        Tue, 21 Sep 2021 13:21:35 -0700 (PDT)
Received: from robh.at.kernel.org (rrcs-192-154-179-36.sw.biz.rr.com. [192.154.179.36])
        by smtp.gmail.com with ESMTPSA id j23sm7830oih.30.2021.09.21.13.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 13:21:34 -0700 (PDT)
Received: (nullmailer pid 3265187 invoked by uid 1000);
        Tue, 21 Sep 2021 20:21:32 -0000
Date:   Tue, 21 Sep 2021 15:21:32 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jens Renner <renner@efe-gmbh.de>
Cc:     linux-clk@vger.kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, devicetree@vger.kernel.org,
        s.hauer@pengutronix.de, sebastian.hesselbarth@gmail.com
Subject: Re: [PATCH 1/2] clk: si5351: Add DT property for phase offset
Message-ID: <YUo+zFqul4TvamzM@robh.at.kernel.org>
References: <20210913085138.116653-1-renner@efe-gmbh.de>
 <20210913085241.116691-1-renner@efe-gmbh.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210913085241.116691-1-renner@efe-gmbh.de>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Sep 13, 2021 at 10:52:41AM +0200, Jens Renner wrote:
> Add optional output clock DT property "clock-phase" to configure the
> phase offset in degrees with respect to other clock outputs.
> Add missing description for related optional output clock DT property
> "clock-frequency".
> 
> Signed-off-by: Jens Renner <renner@efe-gmbh.de>
> ---
>  .../devicetree/bindings/clock/silabs,si5351.txt        | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/silabs,si5351.txt b/Documentation/devicetree/bindings/clock/silabs,si5351.txt
> index 8fe6f80afade..62adf0d0874b 100644
> --- a/Documentation/devicetree/bindings/clock/silabs,si5351.txt
> +++ b/Documentation/devicetree/bindings/clock/silabs,si5351.txt
> @@ -50,11 +50,17 @@ Optional child node properties:
>    divider.
>  - silabs,pll-master: boolean, multisynth can change pll frequency.
>  - silabs,pll-reset: boolean, clock output can reset its pll.
> -- silabs,disable-state : clock output disable state, shall be
> +- silabs,disable-state: clock output disable state, shall be
>    0 = clock output is driven LOW when disabled
>    1 = clock output is driven HIGH when disabled
>    2 = clock output is FLOATING (HIGH-Z) when disabled
>    3 = clock output is NEVER disabled
> +- clock-frequency: integer in Hz, output frequency to generate (2500-200000000)
> +  This defines the output frequency set during boot. It can be reprogrammed
> +  duing runtime through the common clock framework.
> +- clock-phase: integer, phase shift in degrees (0-359), using the multisynth
> +  initial phase offset register (depends on the clock source / output ratio)
> +  and the clock output inverter (180 deg. only).

Not a standard property, needs a vendor prefix.

>  
>  ==Example==
>  
> @@ -111,7 +117,7 @@ i2c-master-node {
>  			silabs,drive-strength = <4>;
>  			silabs,multisynth-source = <1>;
>  			silabs,clock-source = <0>;
> -			pll-master;
> +			silabs,pll-master;
>  		};
>  
>  		/*
> -- 
> 2.33.0
> 
> 
