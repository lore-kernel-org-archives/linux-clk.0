Return-Path: <SRS0=R3Mk=WB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 762B8C433FF
	for <linux-clk@archiver.kernel.org>; Mon,  5 Aug 2019 03:36:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 418392054F
	for <linux-clk@archiver.kernel.org>; Mon,  5 Aug 2019 03:36:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z3CkK3oh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727060AbfHEDgo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 4 Aug 2019 23:36:44 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:46691 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727053AbfHEDgo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 4 Aug 2019 23:36:44 -0400
Received: by mail-io1-f65.google.com with SMTP id i10so51040698iol.13;
        Sun, 04 Aug 2019 20:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pcbyKLsQIg4Rsr0vub4ExOMjS5ylHDKCL4fjaV6rcWo=;
        b=Z3CkK3ohO9GZHGb2IDpKpfzz5eyy/HdDj6jYd2DG2zGaUAwqmlF5gIyy+1TKrzzUKX
         s363bzYfTyZ2tchkpGkAu/KIWAf4bfG5ByapUquNksQl3/t1O3MZKodwy/IvEEiQfotu
         zn3H4dkHBu8gXpHu/0lz6hn2i5MTtPVj/0YJiMTrRbfM9gOgLjn4pfvlRmbI9BkDALeb
         /4a7oFVNrolFDcE9k/lIhjLALTwKnQvhRR7aUvi+Q057/HcyAjpOzvk0pYC1jWBXQBWF
         7Xr/gwDuuAU/EScWjdFo1uLja2V9255AciRt+Va1Y0mOzcYg1rH1AEGX+zHhC1ggqAX7
         tomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pcbyKLsQIg4Rsr0vub4ExOMjS5ylHDKCL4fjaV6rcWo=;
        b=G5o/+Hs13zL7HS4aGOUDny/1kzDOHVRiocSgdIkGlRwIr/RcdqhoiMyAl/EtgAbS+Z
         idIACcBj6MOhpL+jg/6BJpijmNVLVseEmQD0+rRCGz+gYJEJ9G4qQrSQNs7UmxTSko/B
         24XiYSM1BmLqeHm2bGh6bcxzQdl8tQgzf6ES52esDffNl8YjE4GgdxPjb1hkIKGvKlxV
         Ge86nX99xz8swFvi8PovfMULsBWSPHOV0u3kL1AfUe6h1Jo9WSHcmI8NZfDU+Yympfcf
         wGcEJCFWKNAN5ja8LksoWgUdDglsROjWYjCWlRtztpeSfFiwtOokU/Z40quHI0P7Srch
         tnmQ==
X-Gm-Message-State: APjAAAVxBQkWQzYJE10W2jiPAkSAqSZktfbMC0znaqxiTfvHn9GmkA8i
        hqkmC403B8QJCPN2DQm4ClxHwkn1A+eGx02jUu0=
X-Google-Smtp-Source: APXvYqxsU46Tq3pWH6yjG3uXM16AduF6Od2sRPr6n+HenkfrYtujNbUFRcLs7i9fjwtd/UyrreGmcLJDcc35trv4NFo=
X-Received: by 2002:a5d:9711:: with SMTP id h17mr64257105iol.280.1564976203442;
 Sun, 04 Aug 2019 20:36:43 -0700 (PDT)
MIME-Version: 1.0
References: <1563289265-10977-1-git-send-email-aisheng.dong@nxp.com>
 <1563289265-10977-3-git-send-email-aisheng.dong@nxp.com> <20190803135048.GL8870@X250.getinternet.no>
In-Reply-To: <20190803135048.GL8870@X250.getinternet.no>
From:   Dong Aisheng <dongas86@gmail.com>
Date:   Mon, 5 Aug 2019 11:27:20 +0800
Message-ID: <CAA+hA=TVv8m2GZr0W-u+S6XzJUCYrFDF95iyUGyAsbYMwatyZg@mail.gmail.com>
Subject: Re: [PATCH v3 02/11] dt-bindings: clock: imx-lpcg: add support to
 parse clocks from device tree
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>, sboyd@kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, Aug 4, 2019 at 11:45 AM Shawn Guo <shawnguo@kernel.org> wrote:
>
> On Tue, Jul 16, 2019 at 11:00:56PM +0800, Dong Aisheng wrote:
> > MX8QM and MX8QXP LPCG Clocks are mostly the same except they may reside
> > in different subsystems across CPUs and also vary a bit on the availability.
> >
> > Same as SCU clock, we want to move the clock definition into device tree
> > which can fully decouple the dependency of Clock ID definition from device
> > tree and make us be able to write a fully generic lpcg clock driver.
> >
> > And we can also use the existence of clock nodes in device tree to address
> > the device and clock availability differences across different SoCs.
> >
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: Shawn Guo <shawnguo@kernel.org>
> > Cc: Sascha Hauer <kernel@pengutronix.de>
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > ---
> > ChangeLog:
> > v2->v3:
> >  * no changes
> > v1->v2:
> >  * Update example
> >  * Add power domain property
> > ---
> >  .../devicetree/bindings/clock/imx8qxp-lpcg.txt     | 34 ++++++++++++++++++----
> >  1 file changed, 28 insertions(+), 6 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt b/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
> > index 965cfa4..6fc2fd8 100644
> > --- a/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
> > +++ b/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
> > @@ -11,6 +11,21 @@ enabled by these control bits, it might still not be running based
> >  on the base resource.
> >
> >  Required properties:
> > +- compatible:                Should be one of:
> > +                       "fsl,imx8qxp-lpcg"
> > +                       "fsl,imx8qm-lpcg" followed by "fsl,imx8qxp-lpcg".
> > +- reg:                       Address and length of the register set.
> > +- #clock-cells:              Should be 1. One LPCG supports multiple clocks.
> > +- clocks:            Input parent clocks phandle array for each clock.
> > +- bit-offset:                An integer array indicating the bit offset for each clock.
>
> I guess that the driver should be able to figure bit offset from
> 'clock-indices' property.
>

Yes, it can be done in theory.
Then the binding may look like:
sdhc0_lpcg: clock-controller@5b200000 {
        ...
        #clock-cells = <1>;
        clocks = <&sdhc0_clk IMX_SC_PM_CLK_PER>,
                 <&conn_ipg_clk>, <&conn_axi_clk>;
        clock-indices = <0>, <16>, <20>;
        clock-output-names = "sdhc0_lpcg_per_clk",
                             "sdhc0_lpcg_ipg_clk",
                             "sdhc0_lpcg_ahb_clk";
        power-domains = <&pd IMX_SC_R_SDHC_0>;
};

usdhc1: mmc@5b010000 {
        ...
        clocks = <&sdhc0_lpcg 16>,
                 <&sdhc0_lpcg 0>,
                 <&sdhc0_lpcg 20>;
        clock-names = "ipg", "per", "ahb";
};

However, after trying, i found  one limitation if using clock-indices
that users have to do a secondary search for the indices value from clock names
which is not very friendly.

Formerly from the clock output names, user can easily get the clock
index as they're
in fixed orders as output names, so very easily to use.
e.g.
clocks = <&sdhc0_lpcg 1>,
         <&sdhc0_lpcg 0>,
         <&sdhc0_lpcg 2>;

If using clock-indices, users have no way to know it's clock index
from clock output names order
unless they do a secondary search from the clock-indice array accordingly.
For example, for "sdhc0_lpcg_ahb_clk", user can easily know its
reference is <&sdhc0_lpcg 2>.
But if using clock-indice, we need search clock-indices array to find
its reference
becomes <&sdhc0_lpcg 20>. So this seems like a drawback if using clock-indices.

Therefore, personally i'm still a bit intend to the original way which
is more simple and
straightforward from user point of view, unless there's a strong
objections on define another
vendor private property.

Shawn,
How do you think?
Should we enforce the complexity to users?

> > +- hw-autogate:               Boolean array indicating whether supports HW autogate for
> > +                     each clock.
>
> Not sure why it needs to be a property in DT.  Or asking it different
> way, when it should be true and when false?
>

It is one LPCG feature.
For some specific device LPCGs, it may support clock auto gating. (depends on
IP's capability. e.g. uSDHC).
So we define this feature in DT as well in case if user may want to
use it in the future.

But AFAIK, there's still no one using it. Most drivers reply on runtime PM to do
clock management. Did not use LPCG auto gate off feature.
But the current LPCG driver API does support this parameter.

If you think it's unnecessary to define it in DT as there're still no
users, i can remove it
and disabling autogate in driver by default.

Regards
Aisheng

> Shawn
>
> > +- clock-output-names:        Shall be the corresponding names of the outputs.
> > +                     NOTE this property must be specified in the same order
> > +                     as the clock bit-offset and hw-autogate property.
> > +- power-domains:     Should contain the power domain used by this clock.
> > +
> > +Legacy binding (DEPRECATED):
> >  - compatible:        Should be one of:
> >                 "fsl,imx8qxp-lpcg-adma",
> >                 "fsl,imx8qxp-lpcg-conn",
> > @@ -33,10 +48,17 @@ Examples:
> >
> >  #include <dt-bindings/clock/imx8qxp-clock.h>
> >
> > -conn_lpcg: clock-controller@5b200000 {
> > -     compatible = "fsl,imx8qxp-lpcg-conn";
> > -     reg = <0x5b200000 0xb0000>;
> > +sdhc0_lpcg: clock-controller@5b200000 {
> > +     compatible = "fsl,imx8qxp-lpcg";
> > +     reg = <0x5b200000 0x10000>;
> >       #clock-cells = <1>;
> > +     clocks = <&sdhc0_clk IMX_SC_PM_CLK_PER>,
> > +              <&conn_ipg_clk>, <&conn_axi_clk>;
> > +     bit-offset = <0 16 20>;
> > +     clock-output-names = "sdhc0_lpcg_per_clk",
> > +                          "sdhc0_lpcg_ipg_clk",
> > +                          "sdhc0_lpcg_ahb_clk";
> > +     power-domains = <&pd IMX_SC_R_SDHC_0>;
> >  };
> >
> >  usdhc1: mmc@5b010000 {
> > @@ -44,8 +66,8 @@ usdhc1: mmc@5b010000 {
> >       interrupt-parent = <&gic>;
> >       interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_HIGH>;
> >       reg = <0x5b010000 0x10000>;
> > -     clocks = <&conn_lpcg IMX8QXP_CONN_LPCG_SDHC0_IPG_CLK>,
> > -              <&conn_lpcg IMX8QXP_CONN_LPCG_SDHC0_PER_CLK>,
> > -              <&conn_lpcg IMX8QXP_CONN_LPCG_SDHC0_HCLK>;
> > +     clocks = <&sdhc0_lpcg 1>,
> > +              <&sdhc0_lpcg 0>,
> > +              <&sdhc0_lpcg 2>;
> >       clock-names = "ipg", "per", "ahb";
> >  };
> > --
> > 2.7.4
> >
