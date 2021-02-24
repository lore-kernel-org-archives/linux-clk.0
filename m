Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59F11C433DB
	for <linux-clk@archiver.kernel.org>; Wed, 24 Feb 2021 14:41:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E809064F0F
	for <linux-clk@archiver.kernel.org>; Wed, 24 Feb 2021 14:41:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237039AbhBXOgz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Feb 2021 09:36:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234689AbhBXOLA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 24 Feb 2021 09:11:00 -0500
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39B61C06174A;
        Wed, 24 Feb 2021 06:10:20 -0800 (PST)
Received: by mail-io1-xd34.google.com with SMTP id f6so2082286iop.11;
        Wed, 24 Feb 2021 06:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3D1Nudqra57iFYZkCqfpmz5q0clF1aW4HbVFHLjnaxY=;
        b=EQ+9OxZiTAskxOz0HKXsoxtLBm2lGyksYANT3XCa7/nDtfckkPDWWruBrE8Bcsgg31
         rl1NeWUzYWdtpYi+CWtgkJXAMs9ASVJQAZoIe5xqdRghB+X5XVTWcrhaBTtSaimR5gy+
         Kyy/L5OulfCkOh+QNOfGEbd+E/kB7WVfp1ezapWcsNgWUKedG9grXuQZhdHibFlMo8q4
         K2v05+5fmgqsCwP+U5rXcPiFCrUL8Rcm/I1uDQEccAM3f94sqwNoK+O/wc0pEFRmPRiN
         Dh3KL52q9oTQpi8REfuOfASzbEcc9yVMWDIhDpWPcoTpC6G8I2ia3j56056RMZpV5Fvf
         dN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3D1Nudqra57iFYZkCqfpmz5q0clF1aW4HbVFHLjnaxY=;
        b=GIm9Yl899J/wGGFiLtKXjv7losrejj1L/goERzc87REdYfN8RAM5A36tDp5H+tEcYB
         lNy74FYxMZhtD8w5Ww9GXk7t/JizTNo5WdRtaJ+5Jp4zjzWoJvk3QuvEDKYo4epFiEdQ
         uJGLObK56F270IlM7TEOEooeSJORlCvGvWh2qVsBedwVscMfqPvRe73brU+zdEUbsLzS
         Szlp/7gTfm7VdFxzHMRLhtuSJcHf9xAe1nKVbrnjhEG6ilgnblUXpQW6VimL4Q0EovJQ
         DK3OyV3tQuwTI/qNfmE0W0bHF9RHTW+//TqpzjjSGh1GKBLnq9TW9XIdP6nIdB2avYcO
         9Erg==
X-Gm-Message-State: AOAM532D66fUWQEzHYAXaou8UOoJuhhLGjXZPGTHBTx1x/zHagJog8Fl
        pK8txsyYuNnLp7/diLoh2/+M8/nCkOnbhUqeAZrVH520
X-Google-Smtp-Source: ABdhPJzkVX6pcV17+6LbmSXRjVa/Z6jJDmMS+AyFdrrLr2g5CFJHPCLSAYmjJYj+yw4MZDtRAyMZOviOo40kz5Z7N88=
X-Received: by 2002:a05:6602:2e93:: with SMTP id m19mr14230470iow.122.1614175819665;
 Wed, 24 Feb 2021 06:10:19 -0800 (PST)
MIME-Version: 1.0
References: <1613623791-4598-1-git-send-email-shubhrajyoti.datta@xilinx.com>
 <1613623791-4598-2-git-send-email-shubhrajyoti.datta@xilinx.com>
 <20210218092804.6c78c99c@xps13> <161369785558.1254594.14662342386099652001@swboyd.mtv.corp.google.com>
In-Reply-To: <161369785558.1254594.14662342386099652001@swboyd.mtv.corp.google.com>
From:   Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date:   Wed, 24 Feb 2021 19:40:08 +0530
Message-ID: <CAKfKVtH1rSc4d8MMZCegMNG8shNxgXfu6qTd9WxuaGGFMEJ6CA@mail.gmail.com>
Subject: Re: [PATCH v9 1/7] dt-bindings: add documentation of xilinx clocking wizard
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-clk@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Feb 19, 2021 at 6:54 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Miquel Raynal (2021-02-18 00:28:04)
> > Hi Shubhrajyoti,
> >
> > Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com> wrote on Thu, 18 Feb
> > 2021 10:19:45 +0530:
> >
> > > Add the devicetree binding for the xilinx clocking wizard.
> > >
> > > Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> > > ---
> > > v6:
> > > Fix a yaml warning
> > > v7:
> > > Add vendor prefix speed-grade
> > > v8:
> > > Fix the warnings
> > > v9:
> > > Fix the warnings
> > >
> > >  .../bindings/clock/xlnx,clocking-wizard.yaml       | 65 ++++++++++++++++++++++
> > >  1 file changed, 65 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> > > new file mode 100644
> > > index 0000000..d209140
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> > > @@ -0,0 +1,65 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: "http://devicetree.org/schemas/clock/xlnx,clocking-wizard.yaml#"
> > > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > > +
> > > +title: Xilinx clocking wizard
> > > +
> > > +maintainers:
> > > +  - Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> > > +
> > > +description:
> > > +  The clocking wizard is a soft ip clocking block of Xilinx versal. It
> > > +  reads required input clock frequencies from the devicetree and acts as clock
> > > +  clock output.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: xlnx,clocking-wizard
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  "#clock-cells":
> > > +    const: 1
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: clock input
> > > +      - description: axi clock
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: clk_in1
> > > +      - const: s_axi_aclk
> > > +
> > > +  clock-output-names: true
> > > +
> > > +  xlnx,speed-grade:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    enum: [1, 2, 3]
> > > +    description:
> > > +      Speed grade of the device.
> >
> > A bit of explanation of what this describes would be welcome.
> >
> > Don't forget that binding are not tied to any driver implementation,
> > these are supposed to be hardware description properties.
>
> Would opp tables work for this?
This is the parameter is for speed of the fabric.
