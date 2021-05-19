Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD39C433B4
	for <linux-clk@archiver.kernel.org>; Wed, 19 May 2021 19:00:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5ADFC6109F
	for <linux-clk@archiver.kernel.org>; Wed, 19 May 2021 19:00:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231847AbhESTCA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 May 2021 15:02:00 -0400
Received: from mail-oi1-f180.google.com ([209.85.167.180]:41567 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231599AbhESTB7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 May 2021 15:01:59 -0400
Received: by mail-oi1-f180.google.com with SMTP id c3so14057277oic.8;
        Wed, 19 May 2021 12:00:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sijrQ01g/GiA5+mxy/bT/LDRTY/DN4cmmbkW83oKgmo=;
        b=ZARpigs5zuy+P/R16SvldNKKhBl5F3RHIsMMgc7z/Q1I3yTnOSZ3ABKHcVrjUavhZR
         99COjtBQxmVvJDycqOaAY6xb8WZNUluk+dK15KwCpOf12ro5vPcKFxCJr0YNKF/qh65C
         vBzAthBiCCn4VGslxVQmQIgN3dTZ9VBGeL1OvoqyQgm03S6ibaqxPHaL0zAhKDjGba3f
         AH/y2BMLop9GL68TFIfISjAY1ilwuHklBpjBc5UTUmrOeZsUtB4hx0jEXZU9tOgX0Z6w
         bDEOcsFXzGZD+V3uc1ITptd+x/+DPsH1X/04mqaxmKLN+SDW8eGlHem62Ca6eNz+/3uI
         EoKg==
X-Gm-Message-State: AOAM533NV5/+L85ak2+kW/taI8qHaE65Ofyxi87W/tYxqcF6BDT/nwU4
        pZTbhMU2cifng2C3dg9D6g==
X-Google-Smtp-Source: ABdhPJyU9mqfSTQ9V+xTABwTX3FRwu7WZUGXl5T+EEN0a/xilQkZw/2FrdUgtocQJwrFUgIBf3oM5Q==
X-Received: by 2002:a05:6808:2d3:: with SMTP id a19mr617556oid.133.1621450838163;
        Wed, 19 May 2021 12:00:38 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v19sm126714otk.22.2021.05.19.12.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 12:00:37 -0700 (PDT)
Received: (nullmailer pid 3458043 invoked by uid 1000);
        Wed, 19 May 2021 19:00:36 -0000
Date:   Wed, 19 May 2021 14:00:36 -0500
From:   Rob Herring <robh@kernel.org>
To:     Daniel Mack <daniel@zonque.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        kuninori.morimoto.gx@renesas.com, mturquette@baylibre.com,
        sboyd@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: convert cs2000-cp bindings to
 yaml
Message-ID: <20210519190036.GA3453934@robh.at.kernel.org>
References: <20210517122926.3263455-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517122926.3263455-1-daniel@zonque.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, May 17, 2021 at 02:29:24PM +0200, Daniel Mack wrote:
> The original author of the file was added as maintainer.
> 
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../bindings/clock/cirrus,cs2000-cp.yaml      | 64 +++++++++++++++++++
>  .../devicetree/bindings/clock/cs2000-cp.txt   | 22 -------
>  2 files changed, 64 insertions(+), 22 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
>  delete mode 100644 Documentation/devicetree/bindings/clock/cs2000-cp.txt
> 
> diff --git a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
> new file mode 100644
> index 000000000000..3af81087e5f9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/cirrus,cs2000-cp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Binding CIRRUS LOGIC Fractional-N Clock Synthesizer & Clock Multiplier
> +
> +maintainers:
> +  - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> +
> +description: |
> +  The CS2000-CP is an extremely versatile system clocking device that
> +  utilizes a programmable phase lock loop.
> +
> +  Link: https://www.cirrus.com/products/cs2000/
> +
> +properties:
> +  compatible:
> +    enum:
> +      - cirrus,cs2000-cp
> +
> +  clocks:
> +    description:
> +      Common clock binding for CLK_IN, XTI/REF_CLK
> +    minItems: 2
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 2
> +    maxItems: 2

Need to define the names and order.

> +
> +  '#clock-cells':
> +    const: 0
> +
> +  reg:
> +    description:
> +      The chip select number on the I2C bus

Drop. That's 'reg' for every I2C device.

> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c@0 {
> +      reg = <0x0 0x100>;
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      cs2000: clk_multiplier@4f {

clock-controller@4f

And drop cs2000 as it is unused here.

> +        #clock-cells = <0>;
> +        compatible = "cirrus,cs2000-cp";
> +        reg = <0x4f>;
> +        clocks = <&rcar_sound 0>, <&x12_clk>;
> +        clock-names = "clk_in", "ref_clk";
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/clock/cs2000-cp.txt b/Documentation/devicetree/bindings/clock/cs2000-cp.txt
> deleted file mode 100644
> index 54e6df0bee8a..000000000000
> --- a/Documentation/devicetree/bindings/clock/cs2000-cp.txt
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -CIRRUS LOGIC Fractional-N Clock Synthesizer & Clock Multiplier
> -
> -Required properties:
> -
> -- compatible:		"cirrus,cs2000-cp"
> -- reg:			The chip select number on the I2C bus
> -- clocks:		common clock binding for CLK_IN, XTI/REF_CLK
> -- clock-names:		CLK_IN : clk_in, XTI/REF_CLK : ref_clk
> -- #clock-cells:		must be <0>
> -
> -Example:
> -
> -&i2c2 {
> -	...
> -	cs2000: clk_multiplier@4f {
> -		#clock-cells = <0>;
> -		compatible = "cirrus,cs2000-cp";
> -		reg = <0x4f>;
> -		clocks = <&rcar_sound 0>, <&x12_clk>;
> -		clock-names = "clk_in", "ref_clk";
> -	};
> -};
> -- 
> 2.31.1
> 
