Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC7A2C433E0
	for <linux-clk@archiver.kernel.org>; Fri, 19 Feb 2021 01:24:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA53664EC7
	for <linux-clk@archiver.kernel.org>; Fri, 19 Feb 2021 01:24:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229474AbhBSBY6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Feb 2021 20:24:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:41338 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229468AbhBSBY5 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 18 Feb 2021 20:24:57 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0FE0A64E44;
        Fri, 19 Feb 2021 01:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613697857;
        bh=+unYTifO0TGH/0BCByaFUkWR19TSyWyG4C8bxvnjEvQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=XNY9RgvnEaMZUPaOtBMPBSBy3ZIedSZdoZKehp5mYho1TPfMPFVgJauJzJlxsAebg
         +o2IR2SQs8H/cXUNTDjSbVLHExfZwcTUcNrOTlHgEC1B62KBBFJmjA2MvowY0+Te/i
         5UoOADNzAmQpiEnQFxB293ZHYHXXHUGMctTYNA331nQWocd1EiydIfPOC1xIYPjrGg
         Az2s2hpdVROiuwM+z6ADdg+SinXNVnpfMDb8cN2XKwhSAlg1zkpKfmY43h6kl40HbU
         ox/T9Wgnn44rtYGODHxhc6+931aAsmeTSxKALITNBIMfe2TtLewXXPzB7tR60pP5BX
         5B18ZLHIWqrTQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210218092804.6c78c99c@xps13>
References: <1613623791-4598-1-git-send-email-shubhrajyoti.datta@xilinx.com> <1613623791-4598-2-git-send-email-shubhrajyoti.datta@xilinx.com> <20210218092804.6c78c99c@xps13>
Subject: Re: [PATCH v9 1/7] dt-bindings: add documentation of xilinx clocking wizard
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        mturquette@baylibre.com, gregkh@linuxfoundation.org,
        shubhrajyoti.datta@gmail.com
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Date:   Thu, 18 Feb 2021 17:24:15 -0800
Message-ID: <161369785558.1254594.14662342386099652001@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Miquel Raynal (2021-02-18 00:28:04)
> Hi Shubhrajyoti,
>=20
> Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com> wrote on Thu, 18 Feb
> 2021 10:19:45 +0530:
>=20
> > Add the devicetree binding for the xilinx clocking wizard.
> >=20
> > Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> > ---
> > v6:
> > Fix a yaml warning
> > v7:
> > Add vendor prefix speed-grade
> > v8:
> > Fix the warnings
> > v9:
> > Fix the warnings
> >=20
> >  .../bindings/clock/xlnx,clocking-wizard.yaml       | 65 ++++++++++++++=
++++++++
> >  1 file changed, 65 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/xlnx,clocki=
ng-wizard.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wiza=
rd.yaml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> > new file mode 100644
> > index 0000000..d209140
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> > @@ -0,0 +1,65 @@
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
> > +  reads required input clock frequencies from the devicetree and acts =
as clock
> > +  clock output.
> > +
> > +properties:
> > +  compatible:
> > +    const: xlnx,clocking-wizard
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
> > +  clock-output-names: true
> > +
> > +  xlnx,speed-grade:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [1, 2, 3]
> > +    description:
> > +      Speed grade of the device.
>=20
> A bit of explanation of what this describes would be welcome.
>=20
> Don't forget that binding are not tied to any driver implementation,
> these are supposed to be hardware description properties.

Would opp tables work for this?
