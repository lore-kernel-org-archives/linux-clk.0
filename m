Return-Path: <SRS0=v13c=IE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F44DC433E6
	for <linux-clk@archiver.kernel.org>; Sat,  6 Mar 2021 20:21:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 188F4650AE
	for <linux-clk@archiver.kernel.org>; Sat,  6 Mar 2021 20:21:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231211AbhCFUUg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 6 Mar 2021 15:20:36 -0500
Received: from mail-qk1-f175.google.com ([209.85.222.175]:32863 "EHLO
        mail-qk1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231147AbhCFUUc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 6 Mar 2021 15:20:32 -0500
Received: by mail-qk1-f175.google.com with SMTP id l4so5637802qkl.0;
        Sat, 06 Mar 2021 12:20:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zWfn7H/UEf+l7pWxANCNIEOtNbl8gBUKRtLIogG6HU4=;
        b=ZAEF+p+IvfT3Jf3782JCjMvJRAQ7kThDM1LyHvRyA28jHzz56020Vz2s7dpUnZpuu+
         CR6zL7t35M8IcuqN+UBI4CqJ0PO7ama4Odzfqv71FAmbhn/yk05/9ow9naXDK5AH6S4a
         s8nZ/OqXz4JRoEOXwAWYz+MYPAa/WjHyEYSd39aHPm7YL6kwRZ3LiUeJJLhObq1Js9ZI
         jJ4oYT4K8qCxbR4iLO1vHImfdTqNty01Blrz6bae8k7HWBD7QI8q5BFXWo92kyEzhs9k
         2AWnObNzTEsvCqH3JVh6OLNASX5KrljvMyTiJVVnU+0tt4VmwCQ4LlKvlA9AXzUiF04c
         Uf4g==
X-Gm-Message-State: AOAM532x+vArn1qxQXZQavFXZqJMnth2+ZE/3K10AMB4m/isYL9L+Zzx
        3QS+Ah1F/9rsGBt06OTvrQ==
X-Google-Smtp-Source: ABdhPJw26Xz201By6e4mJ0f7HTFQskHAuUpIAQYA5A5yuiz6PQxGnYdEUczCOCgU8Xafebhb5xFZtA==
X-Received: by 2002:a05:620a:164c:: with SMTP id c12mr15761060qko.285.1615062031242;
        Sat, 06 Mar 2021 12:20:31 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.27.98])
        by smtp.gmail.com with ESMTPSA id e18sm4491041qtr.69.2021.03.06.12.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 12:20:30 -0800 (PST)
Received: (nullmailer pid 1151680 invoked by uid 1000);
        Sat, 06 Mar 2021 20:20:22 -0000
Date:   Sat, 6 Mar 2021 13:20:22 -0700
From:   Rob Herring <robh@kernel.org>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        gregkh@linuxfoundation.org, sboyd@kernel.org,
        mturquette@baylibre.com, shubhrajyoti.datta@gmail.com,
        git@xilinx.com, miquel.raynal@bootlin.com,
        devel@driverdev.osuosl.org
Subject: Re: [PATCH v10 8/9] dt-bindings: add documentation of xilinx
 clocking wizard
Message-ID: <20210306202022.GA1146983@robh.at.kernel.org>
References: <1614172241-17326-1-git-send-email-shubhrajyoti.datta@xilinx.com>
 <1614172241-17326-9-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614172241-17326-9-git-send-email-shubhrajyoti.datta@xilinx.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Feb 24, 2021 at 06:40:40PM +0530, Shubhrajyoti Datta wrote:
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
> 
>  .../bindings/clock/xlnx,clocking-wizard.yaml       | 72 ++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> new file mode 100644
> index 0000000..280eb09
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> @@ -0,0 +1,72 @@
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
> +    const: xlnx,clocking-wizard

Not very specific. Only 1 version of this h/w?

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

How does one decide what value?

> +
> +  nr-outputs:

xlnx,nr-outputs

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2, 3, 4, 5, 6, 7, 8]

minimum: 1
maximum: 8

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
> +  - nr-outputs
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    wizard@b0000000  {

clock-controller@...

> +        compatible = "xlnx,clocking-wizard";
> +        reg = <0xb0000000 0x10000>;
> +        #clock-cells = <1>;
> +        xlnx,speed-grade = <1>;
> +        nr-outputs = <6>;
> +        clock-names = "clk_in1", "s_axi_aclk";
> +        clocks = <&clkc 15>, <&clkc 15>;
> +    };
> +...
> -- 
> 2.1.1
> 
