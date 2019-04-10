Return-Path: <SRS0=uxtc=SM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D77A0C10F11
	for <linux-clk@archiver.kernel.org>; Wed, 10 Apr 2019 15:32:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9E30020818
	for <linux-clk@archiver.kernel.org>; Wed, 10 Apr 2019 15:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1554910341;
	bh=8Uiu8jPrASJzDfP74Z0RIV0stXadfnYo6fsMAplIiBk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=bZXR1tdUKNfi60zVZ/M7x6kKtAMUr9TRTslspCGTUpaGja3EuqkUpjpNE8dowZN2A
	 /MnZ6oAB6WL53BjWlgsNW9BlhWzt5kSWKUlsU6kW+lRSDdOgXxV7cDzcl3P+x2LAqM
	 LNfxJApcCDD6RyCTZc9N7ZXWvwg4EE88qbF5valM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730626AbfDJPcV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Apr 2019 11:32:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:45530 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730505AbfDJPcV (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 10 Apr 2019 11:32:21 -0400
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2BBEF20854;
        Wed, 10 Apr 2019 15:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1554910339;
        bh=8Uiu8jPrASJzDfP74Z0RIV0stXadfnYo6fsMAplIiBk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=plCebfehFp72++RZ/i+YzJj4HoTRA0FwCiWJ6w24EeLMMmepQ24/z1pThASiqPMNU
         w2RTgk5F60/j39C/wZh7AHejAo/pPfi1Po+YYd3WqRHcnfejttHBWwNGq6ILqMsEAu
         zmyBFL1N7xSfsovIdd8CGDpaU1aYhX+KPMGn152A=
Received: by mail-qk1-f178.google.com with SMTP id z76so1460298qkb.12;
        Wed, 10 Apr 2019 08:32:19 -0700 (PDT)
X-Gm-Message-State: APjAAAVnw2huBFicOZ31OK0K5u6lOpQ1iF43XpzcxQ96h7zCjCThK+JL
        NDDJOHrpfqKOLBNPwMUC0LNBdKNNARkVxTMqPA==
X-Google-Smtp-Source: APXvYqzGWuK3B+0h61dMUsiokgzg4wJMmQH4fLlHsiqT5Uw156wRyLJcUJAoX/AT8LgIOm04r4R/aqLaM3uzVMiuMrs=
X-Received: by 2002:a37:5805:: with SMTP id m5mr33957016qkb.136.1554910338346;
 Wed, 10 Apr 2019 08:32:18 -0700 (PDT)
MIME-Version: 1.0
References: <1550771836-10014-1-git-send-email-aisheng.dong@nxp.com>
 <1550771836-10014-2-git-send-email-aisheng.dong@nxp.com> <20190326134715.GA4055@bogus>
 <AM0PR04MB42110F1F251243A165DB9EC680580@AM0PR04MB4211.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB42110F1F251243A165DB9EC680580@AM0PR04MB4211.eurprd04.prod.outlook.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 10 Apr 2019 10:32:06 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK9xkR3P7_cfhpr3kQBEF_wGgZO4oHpoDW+3ybpqYoXNw@mail.gmail.com>
Message-ID: <CAL_JsqK9xkR3P7_cfhpr3kQBEF_wGgZO4oHpoDW+3ybpqYoXNw@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: firmware: imx-scu: new binding to parse
 clocks from device tree
To:     Aisheng Dong <aisheng.dong@nxp.com>
Cc:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Mar 27, 2019 at 9:35 AM Aisheng Dong <aisheng.dong@nxp.com> wrote:
>
> > From: Rob Herring [mailto:robh@kernel.org]
> > Sent: Tuesday, March 26, 2019 9:47 PM
> > On Thu, Feb 21, 2019 at 06:03:43PM +0000, Aisheng Dong wrote:
> > > There's a few limitations on one cell clock binding (#clock-cells =
> > > <1>) that we have to define all clock IDs for device tree to reference.
> > > This may cause troubles if we want to use common clock IDs for multi
> > > platforms support when the clock of those platforms are mostly the same.
> > > e.g. Current clock IDs name are defined with SS prefix. However the
> > > device may reside in different SS across CPUs, that means the SS
> > > prefix may not valid anymore for a new SoC. Furthermore, the device
> > > availability of those clocks may also vary a bit.
> > >
> > > For such situation, We formerly planned to add all new IDs for each SS
> > > and dynamically check availability for different SoC in driver. That
> > > can be done but that may involve a lot effort and may result in more
> > > changes and duplicated code in driver, also make device tree
> > > upstreaming hard which depends on Clock IDs.
> > >
> > > To relief this situation, we want to move the clock definition into
> > > device tree which can fully decouple the dependency of Clock ID
> > > definition from device tree. And no frequent changes required in clock driver
> > any more.
> > >
> > > Then we can use the existence of clock nodes in device tree to address
> > > the device and clock availability differences across different SoCs.
> > >
> > > For SCU clocks, only two params required, thus two new property created:
> > > rsrc-id = <IMX_SC_R_UART_0>;
> > > clk-type = <IMX_SC_PM_CLK_PER>;
> > >
> > > And as we want to support clock set parent function, 'clocks' property
> > > is also used to pass all the possible input parents.
> > >
> > > Cc: Rob Herring <robh@kernel.org>
> > > Cc: Stephen Boyd <sboyd@kernel.org>
> > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > Cc: Sascha Hauer <kernel@pengutronix.de>
> > > Cc: Michael Turquette <mturquette@baylibre.com>
> > > Cc: devicetree@vger.kernel.org
> > > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > > ---
> > >  .../devicetree/bindings/arm/freescale/fsl,scu.txt  | 29
> > ++++++++++++++++------
> > >  include/dt-bindings/firmware/imx/rsrc.h            | 17
> > +++++++++++++
> > >  2 files changed, 38 insertions(+), 8 deletions(-)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > > b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > > index 72d481c..2816789 100644
> > > --- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > > +++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > > @@ -78,6 +78,19 @@ Required properties:
> > >                       "fsl,imx8qm-clock"
> > >                       "fsl,imx8qxp-clock"
> > >                     followed by "fsl,scu-clk"
> > > +- #clock-cells:            Should be 0.
> > > +- rsrc-id:         Resource ID associated with this clock
> > > +- clk-type:                Type of this clock.
> > > +                   Refer to <include/dt-bindings/firmware/imx/rsrc.h> for
> > > +                   available clock types supported by SCU.
> >
> > Can't you just make these 2 values clock cells? I'm all for getting rid of made
> > up clock numbers.
> >
>
> Thanks for the agreement to remove clock IDs.
>
> The 2 values clock cell seems not the best approach for i.MX because it still needs
> to define all clocks in the driver which is exactly we want to avoid now due to some
> special HW characteristic:

Why's that? You can walk the DT and extract the 2 cells for each clock
present. That's not any different than walking child nodes here and
getting the resource ids and type. That's not really fast, but if
speed is really an issue we can consider addressing that in ways that
extend rather than change the binding.

> 1. clock resources may be allocated to different SW execution partition by firmware
> and A core may not have access rights for those clocks not belong to its partition.
> So we want to describe them in DT according to the partition configuration.

Do you have an example? I'd assume you assign peripherals to different
partitions and resource assignment simply follows that. Can clocks not
be available when a peripheral still is?

> 2. Each clock is associated with a different power domain which is better to be
> described in device tree. And clock state will be lost and need restore after power cycle
> of the domain.
>
> Based on above requirements, do you think we can do as below?

Can you provide an example that shows the whole hierarchy for a
peripheral. Here you have FSPI, PWM, and MMC. Reviewing SCU clocks and
LPCG clocks separately is not helpful.

>
> //LSIO SS
> lsio_scu_clk: lsio-scu-clock-controller {
>         compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
>
>         fspi0_clk: clock-fspi0{
>                 #clock-cells = <0>;
>                 rsrc-id = <IMX_SC_R_FSPI_0>;
>                 clk-type = <IMX_SC_PM_CLK_PER>;
>                 power-domains = <&pd IMX_SC_R_FSPI_0>;

Are the power domain ID and rsrc-id always the same for a clock?

>         };
>
>                 fspi1_clk: clock-fspi1{
>                         ...
>                 };
>         ...
> };
>
> /* LPCG clocks */
> lsio_lpcg_clk: lsio-lpcg-clock-controller {
>         compatible = "fsl,imx8qxp-lpcg";

I think this wrapper node should be removed and the compatible moved
into the child nodes.

>         pwm0_lpcg: clock-controller@5d400000 {
>                 reg = <0x5d400000 0x10000>;
>                 #clock-cells = <1>;
>                 clocks = <&pwm0_clk>, <&pwm0_clk>, <&pwm0_clk>,
>                          <&lsio_bus_clk>, <&pwm0_clk>;
>                 bit-offset = <0 4 16 20 24>;

Are all LPCG instances the same, but some clocks are missing if the
child peripheral doesn't use certain clocks? IOW, bit 0 is always
ipg_clk, bit 24 is always ipg_mstr_clk?

Assuming so, 'bit-offset' should be removed and you should either have
a fixed number of clock entries with 0 entries for non-connected
clocks or use clock-names to define which clocks are present (with the
same set of defined names for all LPCG instances).

>                 clock-output-names = "pwm0_lpcg_ipg_clk",
>                                      "pwm0_lpcg_ipg_hf_clk",
>                                      "pwm0_lpcg_ipg_s_clk",
>                                      "pwm0_lpcg_ipg_slv_clk",
>                                      "pwm0_lpcg_ipg_mstr_clk";

IMO, this is wrong as the names should be relative to the module. So
'ipg_clk', 'ipg_hf_clk', etc.

>                 power-domains = <&pd IMX_SC_R_PWM_0>;
>                 status = "disabled";
>         };
>
>                 pwm1_lpcg: clock-controller@5d410000 {
>                                 ...
>                 }
>         ...
> };
>
> And for users, it could simply be:
> usdhc1: mmc@5b010000 {
>         clocks = <&sdhc0_lpcg 1>,
>                  <&sdhc0_lpcg 0>,
>                  <&sdhc0_lpcg 2>;
>         clock-names = "ipg", "per", "ahb";
>         assigned-clocks = <&sdhc0_clk>;
>         assigned-clock-rates = <200000000>;
>                 ....
> };
