Return-Path: <SRS0=af6Y=EK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 622C9C4742C
	for <linux-clk@archiver.kernel.org>; Wed,  4 Nov 2020 19:15:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 135C0206ED
	for <linux-clk@archiver.kernel.org>; Wed,  4 Nov 2020 19:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604517327;
	bh=x4IMmGGfstOB5QZnRkOBuIvAws/n8zpWfSdcIL7R6Wc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=nG5f3lXRYwPePa4ePQ3sURU1fvCjNTvEWpLrm1kSxbEMtv6wZ1KyoIQ8N74Dy+oVJ
	 D01D/RqrDYEiywXGMjJWCXzLIIf8854sZMAJI19nnxTbILACUpVSRd8wQSjN5+n0i7
	 l/ksZqdMghH/gg8/nbMvRfNPCC+baf87tOLNSe3w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728999AbgKDTP0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Nov 2020 14:15:26 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:45348 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726564AbgKDTPY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Nov 2020 14:15:24 -0500
Received: by mail-ot1-f67.google.com with SMTP id k3so8486638otp.12;
        Wed, 04 Nov 2020 11:15:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3ktR9xXAhm5rkXgxzXt3WdwZLIj5Pq6xAAQ/UnvJYVQ=;
        b=oMxmi1u/CnqFlcdVx/dAjctazz62N+Mjo6lfMtJA29MwjbsQIn217sAiM4qAyyceGP
         OSl3xAVEeXNu/Et4WT7pOVJuowdLrZxvniRijLjJ0lGuAeoKN8HuKBvAYhSfBhbpfbqy
         xSFaYEjS8ouxve0Hig34eQ5xGPf11CQQZWoHgkiYNNTfOt9gnHVmZ2dtpNzfQzxYFE/1
         kvZcqtdwSSbqvCC82+cJQRML/NP6UezeUFMl+sEideJ7pd8FadzKF4oWogLQXk6JoPfb
         d7RiGg8/7Cbuc0+eSAIfInLGg6X3v8db+j0h1nkPuxQQByGP+Z2iESh58C5C87ug7XOK
         o8RQ==
X-Gm-Message-State: AOAM531/ZppZAZ2x6rzxhzwsSmI44W6f00hIe6+RRzqqUHn/+PsRzSqn
        bgNbxMJ6phlsI7w/FyH3vg==
X-Google-Smtp-Source: ABdhPJxynEbTDEPWyxdkPjdoSSl8j0qBRbQwd+b7vgHuU/oNQqSspABE21ehLcNPH7MIDU3+IrBepQ==
X-Received: by 2002:a9d:a87:: with SMTP id 7mr14380326otq.29.1604517321660;
        Wed, 04 Nov 2020 11:15:21 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d22sm641493oij.53.2020.11.04.11.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 11:15:20 -0800 (PST)
Received: (nullmailer pid 3972094 invoked by uid 1000);
        Wed, 04 Nov 2020 19:15:20 -0000
Date:   Wed, 4 Nov 2020 13:15:20 -0600
From:   Rob Herring <robh@kernel.org>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     linux-clk@vger.kernel.org, git@xilinx.com,
        devicetree@vger.kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, gregkh@linuxfoundation.org,
        devel@driverdev.osuosl.org
Subject: Re: [PATCH v7 1/7] dt-bindings: add documentation of xilinx clocking
 wizard
Message-ID: <20201104191520.GB3967018@bogus>
References: <1604502407-14352-1-git-send-email-shubhrajyoti.datta@xilinx.com>
 <1604502407-14352-2-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604502407-14352-2-git-send-email-shubhrajyoti.datta@xilinx.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Nov 04, 2020 at 08:36:41PM +0530, Shubhrajyoti Datta wrote:
> Add the devicetree binding for the xilinx clocking wizard.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
> v6:
> Fix a yaml warning
> v7:
> Add vendor prefix speed-grade
> 
>  .../bindings/clock/xlnx,clocking-wizard.yaml       | 65 ++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> new file mode 100644
> index 0000000..a19b9bb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/xlnx,clocking-wizard.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Xilinx clocking wizard
> +
> +maintainers:
> +  - Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> +
> +description: |
> +  The clocking wizard is a soft ip clocking block of Xilinx versal. It
> +  reads required input clock frequencies from the devicetree and acts as clock
> +  clock output.
> +
> +select: false

Why? That's one way to make the example pass with your schema...

> +
> +properties:
> +  compatible:
> +      - enum:
> +          - xlnx,clocking-wizard
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
> +  xlnx,speed-grade:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [1, 2, 3]
> +    description:
> +      Speed grade of the device.
> +
> +required:
> +  - compatible
> +  - "#clock-cells"
> +  - clocks
> +  - clock-names
> +  - speed-grade
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-generator@40040000 {
> +        #clock-cells = <1>;
> +        reg = <0x40040000 0x1000>;
> +        compatible = "xlnx,clocking-wizard";
> +        xlnx,speed-grade = <1>;
> +        clock-names = "clk_in1", "s_axi_aclk";
> +        clocks = <&clkc 15>, <&clkc 15>;
> +        clock-output-names = "clk_out1", "clk_out2",
> +        "clk_out3", "clk_out4", "clk_out5",
> +        "clk_out6", "clk_out7";
> +    };
> +...
> -- 
> 2.1.1
> 
