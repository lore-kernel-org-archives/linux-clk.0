Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE63C433B4
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 10:27:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A3C461164
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 10:27:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230302AbhDHK1P (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Apr 2021 06:27:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230383AbhDHK1P (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Apr 2021 06:27:15 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2572C061761;
        Thu,  8 Apr 2021 03:27:02 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id w21-20020a9d63950000b02901ce7b8c45b4so1775965otk.5;
        Thu, 08 Apr 2021 03:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OPgpXoiJBLE7xLR6Mwqd8Fgd+bP7WP19uXTieYTkcCw=;
        b=a5o+RIbKsH38L+o/Oy1ji+i97mzEOma7h9jd370lnlRtzUmZVVt8Rx3aw+jMUBMrj0
         OGqrTleY1u/50YOwpU50Js1Xl5OtLncc+sg5uB113GhEhfaRrLOFp5DhYpIbuhpth4//
         quPQd1rrudYr8Tb92pslckHIsWdoalz7ifUf5AkaYDaUR5iL+Kjs/tnZKqu/zwTAvG2O
         GEwZp84bB4ZWFe0+Z1LagX1Ek7jq0/n7nUGfYPJsp+jue442to5Ahf6KaQgOGI7+FBZu
         vqLoHUhLeGyL38dno+pvrbDpwiC79c2r3MhpkszDWRqnjOvgW/OxayAQvOIQstfwwaeq
         eDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OPgpXoiJBLE7xLR6Mwqd8Fgd+bP7WP19uXTieYTkcCw=;
        b=hxT+z5j4M7Tyr8cO9cP75IVMgkNjVq9EfxPtrUwaLYrrTERfZcqIej2ez6eXy9J6xc
         AH0XdAIkhqomeosJAIAJ4Y78Uz7nmYz5Ad8/D1WcGQvSRpDwO4oJEA0MYyG09MYV87HF
         Rhu36xG6cvXqcubfJPMVDFDfwmrxIZi45ezxJE34Uti48azGCvjR5+waIE62jdi4NbPt
         OqWFYTUfPusEYI1OpuoIGeR08GY68GFPcYp0qxWSrZjdkYPgCdn2O5kPLwwP1K0yBPdF
         IejDVZw/x+iYAwjOijPOg0SQLho4dfl6zExkhvrMYG2W+J9JPV8bC93x6ZQKDa4+MkP1
         rQjA==
X-Gm-Message-State: AOAM531AIOe100ggG8sLjrz7yCqXgSnKKGB6F//btRAZSn/BwzcsvcN6
        QA4Qu42RF2rhVWUgwcbp4MV4Iodopof5DbsXcjI=
X-Google-Smtp-Source: ABdhPJzz9eA6rOHK+nS5k0wdbav/SHQRmxigzTKjxsZLMyUufFa1GRqnlOYHXbNR/TplkAKn99x4DCZqCohrHP7A+Lw=
X-Received: by 2002:a05:6830:408a:: with SMTP id x10mr6952838ott.248.1617877622284;
 Thu, 08 Apr 2021 03:27:02 -0700 (PDT)
MIME-Version: 1.0
References: <1614172241-17326-1-git-send-email-shubhrajyoti.datta@xilinx.com>
 <1614172241-17326-9-git-send-email-shubhrajyoti.datta@xilinx.com> <20210306202022.GA1146983@robh.at.kernel.org>
In-Reply-To: <20210306202022.GA1146983@robh.at.kernel.org>
From:   Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date:   Thu, 8 Apr 2021 15:56:50 +0530
Message-ID: <CAKfKVtF8FAAt-Rszq62hBtJWokYXrKH_DwU1cGvXzBni99VM+A@mail.gmail.com>
Subject: Re: [PATCH v10 8/9] dt-bindings: add documentation of xilinx clocking wizard
To:     Rob Herring <robh@kernel.org>
Cc:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-clk@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Mike Turquette <mturquette@baylibre.com>, git@xilinx.com,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        devel@driverdev.osuosl.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, Mar 7, 2021 at 1:50 AM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Feb 24, 2021 at 06:40:40PM +0530, Shubhrajyoti Datta wrote:
> > Add the devicetree binding for the xilinx clocking wizard.
> >
> > Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> > ---
> >  v6:
> >  Fix a yaml warning
> >  v7:
> >  Add vendor prefix speed-grade
> >  v8:
> >  Fix the warnings
> >  v10:
> >  Add nr-outputs
> >
> >  .../bindings/clock/xlnx,clocking-wizard.yaml       | 72 ++++++++++++++++++++++
> >  1 file changed, 72 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> > new file mode 100644
> > index 0000000..280eb09
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> > @@ -0,0 +1,72 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: "http://devicetree.org/schemas/clock/xlnx,clocking-wizard.yaml#"
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: Xilinx clocking wizard
> > +
> > +maintainers:
> > +  - Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> > +
> > +description:
> > +  The clocking wizard is a soft ip clocking block of Xilinx versal. It
> > +  reads required input clock frequencies from the devicetree and acts as clock
> > +  clock output.
> > +
> > +properties:
> > +  compatible:
> > +    const: xlnx,clocking-wizard
>
> Not very specific. Only 1 version of this h/w?

Will fix in next version
>
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#clock-cells":
> > +    const: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: clock input
> > +      - description: axi clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: clk_in1
> > +      - const: s_axi_aclk
> > +
> > +
> > +  xlnx,speed-grade:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [1, 2, 3]
> > +    description:
> > +      Speed grade of the device. Higher the speed grade faster is the FPGA device.
>
> How does one decide what value?
This is a property of the FPGA fabric.
So  hdf/xsa  should tell that
>
> > +
> > +  nr-outputs:
>
> xlnx,nr-outputs
>
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [1, 2, 3, 4, 5, 6, 7, 8]
>
> minimum: 1
> maximum: 8
>
> > +    description:
> > +      Number of outputs.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - "#clock-cells"
> > +  - clocks
> > +  - clock-names
> > +  - xlnx,speed-grade
> > +  - nr-outputs
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    wizard@b0000000  {
>
> clock-controller@...
will fix.
>
> > +        compatible = "xlnx,clocking-wizard";
> > +        reg = <0xb0000000 0x10000>;
> > +        #clock-cells = <1>;
> > +        xlnx,speed-grade = <1>;
> > +        nr-outputs = <6>;
> > +        clock-names = "clk_in1", "s_axi_aclk";
> > +        clocks = <&clkc 15>, <&clkc 15>;
> > +    };
> > +...
> > --
> > 2.1.1
> >
