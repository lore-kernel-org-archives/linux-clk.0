Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86172C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 14 Dec 2021 15:40:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231373AbhLNPkI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Dec 2021 10:40:08 -0500
Received: from mail-oi1-f179.google.com ([209.85.167.179]:43943 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231219AbhLNPkH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Dec 2021 10:40:07 -0500
Received: by mail-oi1-f179.google.com with SMTP id o4so27636544oia.10;
        Tue, 14 Dec 2021 07:40:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ovb0DbxUGYeODSKF6bHxeVffVUw8DcYCEblgl5V5Cfg=;
        b=qGCnVNW90QF+NipVwMdEAJgvLldUWCbvTCw++1PShX8Kr7xUgIGJHEGdfhbfZakj77
         RJxXgubt7SDIkJEwIR+K8CklLk01PVkmELQXfAa2hk1mDrxvGHuNChWwMawrYkN4Y3y3
         Sjd5jMUpowRnkGzWo7+nYNCw6oxrFD6hbgszwhFCswGCBwQzYDMwTjFsoYlXSuS2FqFh
         Q55itUtGGTlPpMG8gmkAGOASWjlPqx1W/tkXw+jpMmzlMQzIT8mGjEnjAFuD41Jle0jT
         g7ZJXOiW4IpBILfl+Jnx0u9w0aUheDgHwFz6UVpqxTAZzpk1scql7DVK0rM+I7L5DQr1
         gYQA==
X-Gm-Message-State: AOAM533+8vM+L9RnauPzn6B+72ZBuox9Z1XuiVLSELRl0VIuTTEp1Yti
        oZ5cGX2OA6td9kl+wppPzA==
X-Google-Smtp-Source: ABdhPJyFf+wJ1nqXqXJWkf1oygAcvPVNPaK9atkVruPCaMGtFdW41Us6ulpAHGg16rCaoAwmgr33RQ==
X-Received: by 2002:aca:3643:: with SMTP id d64mr34457612oia.107.1639496406889;
        Tue, 14 Dec 2021 07:40:06 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id t18sm29375ott.2.2021.12.14.07.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 07:40:06 -0800 (PST)
Received: (nullmailer pid 3424980 invoked by uid 1000);
        Tue, 14 Dec 2021 15:40:05 -0000
Date:   Tue, 14 Dec 2021 09:40:05 -0600
From:   Rob Herring <robh@kernel.org>
To:     Martin =?utf-8?Q?Povi=C5=A1er?= <povik@protonmail.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        kettenis@openbsd.org, marcan@marcan.st, sven@svenpeter.dev
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add Apple NCO
Message-ID: <Ybi61fzpOV7CumtR@robh.at.kernel.org>
References: <20211214120213.15649-1-povik@protonmail.com>
 <20211214120213.15649-2-povik@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211214120213.15649-2-povik@protonmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Dec 14, 2021 at 12:02:48PM +0000, Martin Povišer wrote:
> The NCO block found on Apple SoCs is a programmable clock generator
> performing fractional division of a high frequency input clock.
> 
> Signed-off-by: Martin Povišer <povik@protonmail.com>
> ---
>  .../devicetree/bindings/clock/apple,nco.yaml  | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/apple,nco.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/apple,nco.yaml b/Documentation/devicetree/bindings/clock/apple,nco.yaml
> new file mode 100644
> index 000000000000..5029824ab179
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/apple,nco.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/apple,nco.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple SoCs' NCO block
> +
> +maintainers:
> +  - Martin Povišer <povik@protonmail.com>
> +
> +description: |
> +  The NCO (Numerically Controlled Oscillator) block found on Apple SoCs
> +  such as the t8103 (M1) is a programmable clock generator performing
> +  fractional division of a high frequency input clock.
> +
> +  It carries a number of independent channels and is typically used for
> +  generation of audio bitclocks.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - apple,t6000-nco
> +        - apple,t8103-nco
> +      - const: apple,nco
> +
> +  apple,nchannels:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The number of output channels the NCO block has been
> +      synthesized for.

I'd assume there is some max number?

Do you really need to know this? If this is just to validate the clock 
cell values are less than this, then just drop that and the property. 
It's not the kernel's job to validate the DT.

> +
> +  clocks:
> +    description:
> +      Specifies the reference clock from which the output clocks
> +      are derived through fractional division.
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - apple,nchannels
> +  - clocks
> +  - '#clock-cells'
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    nco_clkref: clock-ref {
> +      compatible = "fixed-clock";
> +      #clock-cells = <0>;
> +      clock-frequency = <900000000>;
> +      clock-output-names = "nco-ref";
> +    };
> +
> +    nco: clock-generator@23b044000 {

clock-controller@...

> +      compatible = "apple,t8103-nco", "apple,nco";
> +      reg = <0x3b044000 0x14000>;

You really have 0x14000 worth of registers here because all of that 
will be mapped into virtual memory? Doesn't matter so much on 64-bit, 
but it did for 32-bit.

> +      #clock-cells = <1>;
> +      clocks = <&nco_clkref>;
> +      apple,nchannels = <5>;
> +    };
> --
> 2.33.0
> 
> 
> 
