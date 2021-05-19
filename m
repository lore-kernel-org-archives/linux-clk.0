Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FF40C433ED
	for <linux-clk@archiver.kernel.org>; Wed, 19 May 2021 19:03:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 635B36108D
	for <linux-clk@archiver.kernel.org>; Wed, 19 May 2021 19:03:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231368AbhESTFN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 May 2021 15:05:13 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:46775 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230140AbhESTFM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 May 2021 15:05:12 -0400
Received: by mail-ot1-f42.google.com with SMTP id d3-20020a9d29030000b029027e8019067fso12655074otb.13;
        Wed, 19 May 2021 12:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=903IGKg0Z/AmHXN1npm7TfNT4Xyet5hYcaJmA4ADIt0=;
        b=NrA7tqf3tvglo/NCUT80a/UJW6PzIMX29OoZEkHC+rvWdq8rSPPBpjDpkTu1Ux3T+T
         WkVGKnJrhJ2sGPuuNIX1rQ2tv86vzneCp3T0agIelU7y+g5cYcQzSN/QT7p/cDkpatzN
         JA9MAKz1EEx5QE5CmlspLbKmmh7ZwdBzJrchw6GNK0dw13y6naU2KZuLP+ZVZf41DfK5
         mJQn33DCOHz7pmZOOrGYRjNGu8ZcfgxiU71MG2R5bDcuYxeZM1eM78TgyNj4OsHAXoPP
         +E2Bq6jRe10MXlZipuGw5oEd0Y+XFC7vV28QmD1QJL/Cy3w2Mw/xRg+d8p5dwaDWVBmr
         BuZA==
X-Gm-Message-State: AOAM531ClYkS69ZWdvDCAP84kjDb/x5raiCSjuqkQeYoA4kX2d9b/3i2
        rf6hJLoXxR7e2Uh+25w3tYo4PvoYXg==
X-Google-Smtp-Source: ABdhPJyU/RDU+0Sz9xufG2+4gBupEYPcEuW0VfsUHIBgc0N3EYKE+NH5sshAf74Lej40woAXLH0yUw==
X-Received: by 2002:a05:6830:719:: with SMTP id y25mr781915ots.218.1621451032498;
        Wed, 19 May 2021 12:03:52 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u24sm123876otg.73.2021.05.19.12.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 12:03:51 -0700 (PDT)
Received: (nullmailer pid 3462989 invoked by uid 1000);
        Wed, 19 May 2021 19:03:51 -0000
Date:   Wed, 19 May 2021 14:03:51 -0500
From:   Rob Herring <robh@kernel.org>
To:     Daniel Mack <daniel@zonque.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        kuninori.morimoto.gx@renesas.com, mturquette@baylibre.com,
        sboyd@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: clk: cs2000-cp: Document
 aux-output-source
Message-ID: <20210519190351.GA3459779@robh.at.kernel.org>
References: <20210517122926.3263455-1-daniel@zonque.org>
 <20210517122926.3263455-2-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517122926.3263455-2-daniel@zonque.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, May 17, 2021 at 02:29:25PM +0200, Daniel Mack wrote:
> This new optional property can be used to control the function of the
> auxiliary output pin. Introduce a new dt-bindings include file that
> contains the numerical values.
> 
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
>  .../bindings/clock/cirrus,cs2000-cp.yaml          | 15 ++++++++++++++-
>  include/dt-bindings/clock/cirrus,cs2000-cp.h      | 14 ++++++++++++++
>  2 files changed, 28 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/clock/cirrus,cs2000-cp.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
> index 3af81087e5f9..d20ed0aabcb0 100644
> --- a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
> +++ b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
> @@ -38,6 +38,16 @@ properties:
>        The chip select number on the I2C bus
>      maxItems: 1
>  
> +  cirrus,aux-output-source:
> +    description:
> +      Specfies the function of the auxililary clock output pin
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum:
> +      - 0 # CS2000CP_AUX_OUTPUT_REF_CLK:  ref_clk input
> +      - 1 # CS2000CP_AUX_OUTPUT_CLK_IN:   clk_in input
> +      - 2 # CS2000CP_AUX_OUTPUT_CLK_OUT:  clk_out output
> +      - 3 # CS2000CP_AUX_OUTPUT_PLL_LOCK: pll lock status
> +
>  required:
>    - compatible
>    - reg
> @@ -45,10 +55,12 @@ required:
>    - clock-names
>    - '#clock-cells'
>  
> -additionalProperties: false
> +additionalProperties: true

No, that's only correct for collections of common properties.

>  
>  examples:
>    - |
> +    #include <dt-bindings/clock/cirrus,cs2000-cp.h>
> +
>      i2c@0 {
>        reg = <0x0 0x100>;
>        #address-cells = <1>;
> @@ -60,5 +72,6 @@ examples:
>          reg = <0x4f>;
>          clocks = <&rcar_sound 0>, <&x12_clk>;
>          clock-names = "clk_in", "ref_clk";
> +        cirrus,aux-output-source = <CS2000CP_AUX_OUTPUT_CLK_OUT>;
>        };
>      };
> diff --git a/include/dt-bindings/clock/cirrus,cs2000-cp.h b/include/dt-bindings/clock/cirrus,cs2000-cp.h
> new file mode 100644
> index 000000000000..b9b13cfc8fbd
> --- /dev/null
> +++ b/include/dt-bindings/clock/cirrus,cs2000-cp.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */

What about non-GPL users?

> +/*
> + * Copyright (C) 2021 Daniel Mack
> + */
> +
> +#ifndef __DT_BINDINGS_CS2000CP_CLK_H
> +#define __DT_BINDINGS_CS2000CP_CLK_H
> +
> +#define CS2000CP_AUX_OUTPUT_REF_CLK	0
> +#define CS2000CP_AUX_OUTPUT_CLK_IN	1
> +#define CS2000CP_AUX_OUTPUT_CLK_OUT	2
> +#define CS2000CP_AUX_OUTPUT_PLL_LOCK	3
> +
> +#endif /* __DT_BINDINGS_CS2000CP_CLK_H */
> -- 
> 2.31.1
> 
