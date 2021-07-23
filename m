Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 451CAC4338F
	for <linux-clk@archiver.kernel.org>; Fri, 23 Jul 2021 21:13:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 16CCD60F36
	for <linux-clk@archiver.kernel.org>; Fri, 23 Jul 2021 21:13:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231633AbhGWUdD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Jul 2021 16:33:03 -0400
Received: from mail-io1-f49.google.com ([209.85.166.49]:36772 "EHLO
        mail-io1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbhGWUdD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Jul 2021 16:33:03 -0400
Received: by mail-io1-f49.google.com with SMTP id f11so4163367ioj.3;
        Fri, 23 Jul 2021 14:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yuVVK6EtxAngf+ZF5K0vpPs9SAKz/uvmD94MOFUMPp0=;
        b=I2UME9DUojwkpE1CWjUEnZkLcKEXgAD9pcax1DlqtQDXJfZni+YeYTIqw2V9JCmkG8
         2zBjJ953cNwZl+QsluWP9PlN63UnKiYcV5uZvcJLYPz43ozHPgpALVegVf5ysk8DYlDI
         v+F05Z5PRlUian6excK6koMemMzMtA0Be6vkSvSSmnWZw+/n4XOWQcvkaMAktxOLkV5y
         Ek4/XVn4+fRGA9SA0mAnVjScS35hRoTAOs14Jx3bca6YN8+nKV2jSC2qtqSHMTTrFzDW
         6dwu1o8m0cpNJX9ZND4oZJWR6mb2z5hBHNko5sAUeMGF9zRfdowRbyhhU3nyAxrT+96x
         irAg==
X-Gm-Message-State: AOAM531l+Yq9K3refrc+QTZhSMpRJay9xqcLrLbVI4aThykwFVxCmBDa
        1jg0uuQhrOcJeJTMuLx0TQ==
X-Google-Smtp-Source: ABdhPJxDpjk7NrpYoYm+uXvJTsFfB5sdl3czDmTcapS5OwytQt51G3Y8MEskQyyLmq5l1mayAJsJlQ==
X-Received: by 2002:a05:6602:2595:: with SMTP id p21mr5428173ioo.51.1627074815819;
        Fri, 23 Jul 2021 14:13:35 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id l18sm17050116ioc.13.2021.07.23.14.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 14:13:35 -0700 (PDT)
Received: (nullmailer pid 2593429 invoked by uid 1000);
        Fri, 23 Jul 2021 21:13:33 -0000
Date:   Fri, 23 Jul 2021 15:13:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sean Anderson <sean.anderson@seco.com>
Cc:     linux-clk@vger.kernel.org, Luca Ceresoli <luca@lucaceresoli.net>,
        Stephen Boyd <sboyd@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: clk: vc5: Add properties for
 configuring the SD/OE pin
Message-ID: <20210723211333.GA2578851@robh.at.kernel.org>
References: <20210722190918.95737-1-sean.anderson@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210722190918.95737-1-sean.anderson@seco.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jul 22, 2021 at 03:09:16PM -0400, Sean Anderson wrote:
> These properties allow configuring the SD/OE pin as described in the
> datasheet.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> ---
> This patch requires the dt-schema commit 25b1b49 ("meta-schemas: Drop
> restrictions on top level 'allOf'") to pass dt_binding_check.
> 
> Changes in v5:
> - Don't use dummy if's for oneOfs under allOfs
> 
> Changes in v4:
> - Specify that bindings should specify these properties, but don't make
>   any guarantees about the driver's behavior when they are not present.
> - Clarify description of idt,(en|dis)able-shutdown properties.
> - Make opposing properties mutually exclusive.
> - Add these properties to the example.
> 
> Changes in v3:
> - Add idt,disable-shutdown and idt,output-enable-active-low to allow for
>   a default of not changing the SP/SH bits at all.
> 
> Changes in v2:
> - Rename idt,sd-active-high to idt,output-enable-active-high
> - Add idt,enable-shutdown
> 
>  .../bindings/clock/idt,versaclock5.yaml       | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> index 28675b0b80f1..1abf69e6b8e9 100644
> --- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> @@ -30,6 +30,21 @@ description: |
>      3 -- OUT3
>      4 -- OUT4
>  
> +  The idt,(en|dis)able-shutdown and idt,output-enable-active-(high|low)
> +  properties control the SH (en_global_shutdown) and SP bits of the
> +  Primary Source and Shutdown Register, respectively. Their behavior is
> +  summarized by the following table:
> +
> +  SH SP Output when the SD/OE pin is Low/High
> +  == == =====================================
> +   0  0 Active/Inactive
> +   0  1 Inactive/Active
> +   1  0 Active/Shutdown
> +   1  1 Inactive/Shutdown
> +
> +  One of idt,(en|dis)able-shutdown and one of
> +  idt,output-enable-active-(high|low) should be specified.
> +
>  maintainers:
>    - Luca Ceresoli <luca@lucaceresoli.net>
>  
> @@ -64,6 +79,34 @@ properties:
>      maximum: 22760
>      description: Optional load capacitor for XTAL1 and XTAL2
>  
> +  idt,enable-shutdown:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      Enable the shutdown functionality. The chip will be shut down if
> +      the SD/OE pin is driven high. This corresponds to setting the SH
> +      bit of the Primary Source and Shutdown Register.
> +
> +  idt,disable-shutdown:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      Disable the shutdown functionality. The chip will never be shut
> +      down based on the value of the SD/OE pin. This corresponds to
> +      clearing the SH bit of the Primary Source and Shutdown Register.

If these are mutually exclusive, better to do tristate. So 'idt,shutdown 
= 0|1' for disable/enable. Not present means use the default.

> +
> +  idt,output-enable-active-high:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      This enables output when the SD/OE pin is high, and disables
> +      output when the SD/OE pin is low. This corresponds to setting the
> +      SP bit of the Primary Source and Shutdown Register.
> +
> +  idt,output-enable-active-low:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      This disables output when the SD/OE pin is high, and enables
> +      output when the SD/OE pin is low. This corresponds to clearing the
> +      SP bit of the Primary Source and Shutdown Register.

And here 'idt,output-enable-active = 0|1'.

> +
>  patternProperties:
>    "^OUT[1-4]$":
>      type: object
> @@ -109,6 +152,16 @@ allOf:
>        required:
>          - clock-names
>          - clocks
> +  - oneOf:
> +      - required:
> +          - idt,enable-shutdown
> +      - required:
> +          - idt,disable-shutdown
> +  - oneOf:
> +      - required:
> +          - idt,output-enable-active-high
> +      - required:
> +          - idt,output-enable-active-low

Then you can drop all this.

>  
>  additionalProperties: false
>  
> @@ -138,6 +191,10 @@ examples:
>              clocks = <&ref25m>;
>              clock-names = "xin";
>  
> +            /* Set the SD/OE pin's settings */
> +            idt,disable-shutdown;
> +            idt,output-enable-active-low;
> +
>              OUT1 {
>                  idt,drive-mode = <VC5_CMOSD>;
>                  idt,voltage-microvolts = <1800000>;
> -- 
> 2.25.1
> 
> 
