Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A66DDC433ED
	for <linux-clk@archiver.kernel.org>; Fri,  9 Apr 2021 23:32:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71537610CD
	for <linux-clk@archiver.kernel.org>; Fri,  9 Apr 2021 23:32:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235169AbhDIXdG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Apr 2021 19:33:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:35900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235166AbhDIXdG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 9 Apr 2021 19:33:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7878F610CA;
        Fri,  9 Apr 2021 23:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618011172;
        bh=LQjptmF8MepF3tK2x8z7XTkgYtDleL+Umaaih2EhyMU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=nusmPdWC0Qgno/sk5Iq2l4+hf0Z5KYW57Uo7SXiMwPIVtfdINqwVGAk0ChUsfQL6+
         4ii57ytVenu4SOi5lHBeP/h3kfs02/h5hbcXBRR0kpxMy/01c9GBr5soCvTxec5oE8
         t29oAherStTNOlMBJLZfMGAyGuzM4ZyeHqontE3SKYAsadLuZ8CW2Q3LWYG2PGWagZ
         i6AJLW+LXiaxE8gUMtzYRmuda4/O7mBLRXP2LMaW6wYTzp6QA8NOrMkbvB3Z8Y7nbf
         E93szktYHU8k1u/WgJ0KQCFCdUrYgU48yFOzGd25qopy3KGYJmBeEr1fjNGHNeuFOB
         qJF9pmddGc5xw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <14254feb-ddbd-068d-74a4-61407177336d@xilinx.com>
References: <1614172241-17326-1-git-send-email-shubhrajyoti.datta@xilinx.com> <1614172241-17326-9-git-send-email-shubhrajyoti.datta@xilinx.com> <20210306202022.GA1146983@robh.at.kernel.org> <CAKfKVtF8FAAt-Rszq62hBtJWokYXrKH_DwU1cGvXzBni99VM+A@mail.gmail.com> <14254feb-ddbd-068d-74a4-61407177336d@xilinx.com>
Subject: Re: [PATCH v10 8/9] dt-bindings: add documentation of xilinx clocking wizard
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>, open list:
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>, linux-clk@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mike Turquette <mturquette@baylibre.com>, git@xilinx.com,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        devel@driverdev.osuosl.org, ;
Illegal-Object: Syntax error in Cc: address found on vger.kernel.org:
        Cc:     ;
                        ^-missing semicolon to end mail group, extraneous tokens in mailbox, missing end of mailbox
To:     Michal Simek <michal.simek@xilinx.com>,
        Rob Herring <robh@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date:   Fri, 09 Apr 2021 16:32:51 -0700
Message-ID: <161801117111.2941957.3980674660268189208@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michal Simek (2021-04-08 03:40:29)
>=20
>=20
> On 4/8/21 12:26 PM, Shubhrajyoti Datta wrote:
> > On Sun, Mar 7, 2021 at 1:50 AM Rob Herring <robh@kernel.org> wrote:
> >>
> >> On Wed, Feb 24, 2021 at 06:40:40PM +0530, Shubhrajyoti Datta wrote:
> >>> Add the devicetree binding for the xilinx clocking wizard.
> >>>
> >>> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> >>> ---
> >>>  v6:
> >>>  Fix a yaml warning
> >>>  v7:
> >>>  Add vendor prefix speed-grade
> >>>  v8:
> >>>  Fix the warnings
> >>>  v10:
> >>>  Add nr-outputs
> >>>
> >>>  .../bindings/clock/xlnx,clocking-wizard.yaml       | 72 ++++++++++++=
++++++++++
> >>>  1 file changed, 72 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/clock/xlnx,cloc=
king-wizard.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wi=
zard.yaml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.ya=
ml
> >>> new file mode 100644
> >>> index 0000000..280eb09
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.ya=
ml
> >>> @@ -0,0 +1,72 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: "http://devicetree.org/schemas/clock/xlnx,clocking-wizard.yaml#"
> >>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> >>> +
> >>> +title: Xilinx clocking wizard
> >>> +
> >>> +maintainers:
> >>> +  - Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> >>> +
> >>> +description:
> >>> +  The clocking wizard is a soft ip clocking block of Xilinx versal. =
It
> >>> +  reads required input clock frequencies from the devicetree and act=
s as clock
> >>> +  clock output.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    const: xlnx,clocking-wizard
> >>
> >> Not very specific. Only 1 version of this h/w?
> >=20
> > Will fix in next version
> >>
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +  "#clock-cells":
> >>> +    const: 1
> >>> +
> >>> +  clocks:
> >>> +    items:
> >>> +      - description: clock input
> >>> +      - description: axi clock
> >>> +
> >>> +  clock-names:
> >>> +    items:
> >>> +      - const: clk_in1
> >>> +      - const: s_axi_aclk
> >>> +
> >>> +
> >>> +  xlnx,speed-grade:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    enum: [1, 2, 3]
> >>> +    description:
> >>> +      Speed grade of the device. Higher the speed grade faster is th=
e FPGA device.
> >>
> >> How does one decide what value?
> > This is a property of the FPGA fabric.
> > So  hdf/xsa  should tell that
>=20
> Shubhrajyoti: Rob likely doesn't know what hdf/xsa is that's why it is
> better to avoid it.
>=20
> fpgas/pl part of SoC are tested for performance and different chips have
> different speed grades. This is done for every chip and some chips are
> faster/slower. Based on this speed grade is labeled. And there is no way
> how to find at run time which speed grade your device has. That's why
> there is a need to have property to identify this.
>=20
> In designed tools it is your responsibility to select proper chip based
> on your order and then this value is propagated in Xilinx standard way
> via device tree generator to fill the right value for this property.

The OPP framework and binding has support for speed grades via the
'supported-hw' property. I expect this speed-grade property could be
dropped and an opp table could be assigned to the clk controller node
for this speed grade by the DT author. Unfortunate that it isn't burned
somewhere into the device so that software can pick the right frequency
limits that way.
