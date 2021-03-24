Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 147DFC433C1
	for <linux-clk@archiver.kernel.org>; Wed, 24 Mar 2021 17:05:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C1F4C61A12
	for <linux-clk@archiver.kernel.org>; Wed, 24 Mar 2021 17:05:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237074AbhCXRFT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Mar 2021 13:05:19 -0400
Received: from mail-io1-f43.google.com ([209.85.166.43]:36758 "EHLO
        mail-io1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237023AbhCXRFC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 24 Mar 2021 13:05:02 -0400
Received: by mail-io1-f43.google.com with SMTP id f19so22247288ion.3;
        Wed, 24 Mar 2021 10:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Y14F9T2jsTltJHPnMpq7UymlxKoj7XEuVdqVJoZYFWE=;
        b=p3wiJb74Cb1wQU68D3DxUTcy4uMsxf2CXJii82OwL9cPYcHQsHGSayJZH12Ml6r94R
         dSGR/U7pVE+K/tUlm5kEECZ0ZzeAX1ogeTSUMuSaX7EbKj/nUf5hymcQCY1CAq7N/zgz
         tAEbkdrvGO2NLycNv38erED6G4HITJ7P5Jd9z8BnY6ylxK9ozeQrdNYSZ11q2LOAcdvz
         6sIEQ+NUIf3Xd39TvEAWXzknm1vhWD8bCK5gc5z4wcjMZxKPSjIydlkKm0ZmPWpLBTRh
         seA0luFLXCBk2bgZ47RloB3mkNaPA45QBulK0c8wZymZl+CANHec9Gdkcio4sRnRng+V
         lzfA==
X-Gm-Message-State: AOAM530nyf8y+N+VafpWL9mzyYqS5iNLTMGLT6enf7oILBP3J7qH93mQ
        wt4gwnAmendCHwDJkDkNsA==
X-Google-Smtp-Source: ABdhPJz3r1fjFM1pybMFqDTGKa9jRyh4zb0saqiI6U8zl7cLJ3Yu8ibOzuV50P+Fkx+4sfdikn9j0Q==
X-Received: by 2002:a6b:b2cd:: with SMTP id b196mr3295520iof.67.1616605501143;
        Wed, 24 Mar 2021 10:05:01 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id k4sm1339787ion.29.2021.03.24.10.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 10:05:00 -0700 (PDT)
Received: (nullmailer pid 3252068 invoked by uid 1000);
        Wed, 24 Mar 2021 17:04:58 -0000
Date:   Wed, 24 Mar 2021 11:04:58 -0600
From:   Rob Herring <robh@kernel.org>
To:     Robert Hancock <robert.hancock@calian.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, mike.looijmans@topic.nl,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 1/9] dt-bindings: clock: clk-si5341: Add new attributes
Message-ID: <20210324170458.GA3177057@robh.at.kernel.org>
References: <20210312181710.3998978-1-robert.hancock@calian.com>
 <20210312181710.3998978-2-robert.hancock@calian.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210312181710.3998978-2-robert.hancock@calian.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Mar 12, 2021 at 12:17:02PM -0600, Robert Hancock wrote:
> Add new silabs,xaxb-ext-clk and silabs,iovdd-33 properties.
> 
> Changed vdd-supply on top-level node to optional since it is not actually
> used by the driver.
> 
> Removed vdd-supply from output sub-nodes, as it was not supported by the
> driver and it is not easily possible to support this in that location with
> the kernel regulator infrastructure. Changed to have vddX-supply
> attributes for each output on the top-level device node.
> 
> Signed-off-by: Robert Hancock <robert.hancock@calian.com>
> ---
>  .../devicetree/bindings/clock/silabs,si5341.txt  | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/silabs,si5341.txt b/Documentation/devicetree/bindings/clock/silabs,si5341.txt
> index 504cce3abe46..1cf7e002cb16 100644
> --- a/Documentation/devicetree/bindings/clock/silabs,si5341.txt
> +++ b/Documentation/devicetree/bindings/clock/silabs,si5341.txt
> @@ -24,9 +24,8 @@ it.
>  
>  The device type, speed grade and revision are determined runtime by probing.
>  
> -The driver currently only supports XTAL input mode, and does not support any
> -fancy input configurations. They can still be programmed into the chip and
> -the driver will leave them "as is".
> +The driver currently does not support any fancy input configurations. They can
> +still be programmed into the chip and the driver will leave them "as is".
>  
>  ==I2C device node==
>  
> @@ -45,9 +44,9 @@ Required properties:
>  	corresponding to inputs. Use a fixed clock for the "xtal" input.
>  	At least one must be present.
>  - clock-names: One of: "xtal", "in0", "in1", "in2"
> -- vdd-supply: Regulator node for VDD
>  
>  Optional properties:
> +- vdd-supply: Regulator node for VDD
>  - vdda-supply: Regulator node for VDDA
>  - vdds-supply: Regulator node for VDDS
>  - silabs,pll-m-num, silabs,pll-m-den: Numerator and denominator for PLL
> @@ -60,7 +59,14 @@ Optional properties:
>    be initialized, and always performs the soft-reset routine. Since this will
>    temporarily stop all output clocks, don't do this if the chip is generating
>    the CPU clock for example.
> +- silabs,xaxb-ext-clk: When present, indicates that the XA/XB pins are used
> +  in EXTCLK (external reference clock) rather than XTAL (crystal) mode.
>  - interrupts: Interrupt for INTRb pin.
> +- silabs,iovdd-33: When present, indicates that the I2C lines are using 3.3V
> +  rather than 1.8V thresholds.

How does communication over I2C to set the register for this work if the 
register setting is wrong? I guess it's just leakage current...

> +- vddX-supply (where X is an output index): Regulator node for VDD for the
> +  specified output. The driver selects the output VDD_SEL setting based on this
> +  voltage.

This is called vddoX in the datasheet.

>  - #address-cells: shall be set to 1.
>  - #size-cells: shall be set to 0.
>  
> @@ -77,8 +83,6 @@ Required child node properties:
>  - reg: number of clock output.
>  
>  Optional child node properties:
> -- vdd-supply: Regulator node for VDD for this output. The driver selects default
> -	values for common-mode and amplitude based on the voltage.
>  - silabs,format: Output format, one of:
>  	1 = differential (defaults to LVDS levels)
>  	2 = low-power (defaults to HCSL levels)
> -- 
> 2.27.0
> 
