Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05125C4338F
	for <linux-clk@archiver.kernel.org>; Tue, 17 Aug 2021 19:52:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D16DA61051
	for <linux-clk@archiver.kernel.org>; Tue, 17 Aug 2021 19:52:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232744AbhHQTw5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 17 Aug 2021 15:52:57 -0400
Received: from mail-oi1-f178.google.com ([209.85.167.178]:38426 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbhHQTw4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Aug 2021 15:52:56 -0400
Received: by mail-oi1-f178.google.com with SMTP id u25so830177oiv.5;
        Tue, 17 Aug 2021 12:52:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ixfHrTYt1Ggxk98FasDm3U4TseRB8t40ON9dN+2bDek=;
        b=XZ1XMAIfFYNoWOz39lrq8T8mPVaU0Kk9LJ+RCYHXwrLpC08YKZtie6fV6DmWsqEgi3
         Zxpzt/DkNskmJZCQh6ggwPd4+11V8YIP3wPh2Rp9yqPwVkzx0DVXUPb20xxDNg0bbGud
         yznGOuFGkWEgCMwIYHPIlUzDaXYERlad+W9G9xlTvnZgJkZMKhIAfEVYPzpCQYW7tkif
         H5lMy8HsE5+1Sc/2F/WX0L1Y8YE/tFh07w+ClRodo3dvEbmNNWYS0BnJvN49O7u+PxlF
         LE8K8Bg1XC9q2XOWsmg/kRn857tk1i69sFg9hKaUmC2OZHuHJEb6YmfN6yMNdWcAJJSm
         2Rzw==
X-Gm-Message-State: AOAM530lZNGN3M7Iy0DNhSgNwXaecOIShj8iKTabwkz6KR9/u3Ga0mqf
        9zIErIHNAamdE33KLM2D+A==
X-Google-Smtp-Source: ABdhPJwxWYE4D7xKcY+qlTUW/C7DjrHS7+9SN/4H7+11Cmf+scP5xOllg68dU2dyLMS2F0dIQEQDmg==
X-Received: by 2002:aca:c289:: with SMTP id s131mr3888056oif.14.1629229942998;
        Tue, 17 Aug 2021 12:52:22 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id bf41sm699883oib.41.2021.08.17.12.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 12:52:22 -0700 (PDT)
Received: (nullmailer pid 736727 invoked by uid 1000);
        Tue, 17 Aug 2021 19:52:21 -0000
Date:   Tue, 17 Aug 2021 14:52:21 -0500
From:   Rob Herring <robh@kernel.org>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     linux-clk@vger.kernel.org, git@xilinx.com,
        devicetree@vger.kernel.org, shubhrajyoti.datta@gmail.com
Subject: Re: [PATCH v12 1/5] dt-bindings: add documentation of xilinx
 clocking wizard
Message-ID: <YRwTdQ5MyH6/xcja@robh.at.kernel.org>
References: <20210810072533.27620-1-shubhrajyoti.datta@xilinx.com>
 <20210810072533.27620-2-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210810072533.27620-2-shubhrajyoti.datta@xilinx.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Aug 10, 2021 at 12:55:29PM +0530, Shubhrajyoti Datta wrote:
> Add the devicetree binding for the xilinx clocking wizard.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
>  v6:
>  Fix a yaml warning
>  v7:
>  Add vendor prefix speed-grade
>  v8:
>  Fix the warnings
>  v10:
>  Add nr-outputs
>  v11:
>  add the compatibles for various versions
>  rename nr-outputs to xlnx,nr-outputs
>  v12:
>  No change
> 
>  .../bindings/clock/xlnx,clocking-wizard.yaml  | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> new file mode 100644
> index 000000000000..74a121988e92
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/clock/xlnx,clocking-wizard.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Xilinx clocking wizard
> +
> +maintainers:
> +  - Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> +
> +description:
> +  The clocking wizard is a soft ip clocking block of Xilinx versal. It
> +  reads required input clock frequencies from the devicetree and acts as clock
> +  clock output.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - xlnx,clocking-wizard

What version is this one?

> +      - xlnx,clocking-wizard-v5-2 # version 5.2
> +      - xlnx,clocking-wizard-v6-0 # version 6.0

The comment is pretty pointless. And periods are allowed in compatible 
strings, so just do '-v5.2'.

> +
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  clocks:
> +    items:
> +      - description: clock input
> +      - description: axi clock
> +
> +  clock-names:
> +    items:
> +      - const: clk_in1
> +      - const: s_axi_aclk
> +
> +
> +  xlnx,speed-grade:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2, 3]
> +    description:
> +      Speed grade of the device. Higher the speed grade faster is the FPGA device.
> +
> +  xlnx,nr-outputs:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 8
> +    description:
> +      Number of outputs.
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#clock-cells"
> +  - clocks
> +  - clock-names
> +  - xlnx,speed-grade
> +  - xlnx,nr-outputs
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@b0000000  {
> +        compatible = "xlnx,clocking-wizard";
> +        reg = <0xb0000000 0x10000>;
> +        #clock-cells = <1>;
> +        xlnx,speed-grade = <1>;
> +        xlnx,nr-outputs = <6>;
> +        clock-names = "clk_in1", "s_axi_aclk";
> +        clocks = <&clkc 15>, <&clkc 15>;
> +    };
> +...
> -- 
> 2.17.1
> 
> 
