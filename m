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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 697A4C0650F
	for <linux-clk@archiver.kernel.org>; Mon,  5 Aug 2019 03:57:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2E34520818
	for <linux-clk@archiver.kernel.org>; Mon,  5 Aug 2019 03:57:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eoOV7bRD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbfHED5y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 4 Aug 2019 23:57:54 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:38787 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726757AbfHED5y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 4 Aug 2019 23:57:54 -0400
Received: by mail-io1-f65.google.com with SMTP id j6so44603683ioa.5;
        Sun, 04 Aug 2019 20:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qz/MoLLlSkJY20V2cyugR1tHjtS6GkFWnF+GIM8vIoQ=;
        b=eoOV7bRDx1Xa45V4Rk0VtDZ3ojxBFIYnD8EChRIuDnwItBqJexTK8HzjTQA46modBJ
         LT1YLFR4COFqZhBD7kyA1GNDpas9w6xhyE1FojDA6YLTBVDxH1b/NVn96+NYAyG4eEDT
         mvDyJUgMlcvsPI44AdAEwybXJENG+gQ7JqziEet3+uB97Lof1DQsWIlWwP0vQ9bAsnso
         R/ac5cCDrmM7xKgV8sXatt/YCXx4885ZORtkBLUw52Sivei+3FLWy4MEcltQBf/Yw7uX
         NIAXO1mq/yJ5Q0nJVBIpSb73q7XM/ADtv92OTXA/J7NqXS/i1APu0R/lm7eCIldBS+Ox
         666Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qz/MoLLlSkJY20V2cyugR1tHjtS6GkFWnF+GIM8vIoQ=;
        b=ky9fSFPq7rPN6RlLlEpJ8TCxEwpUyyu57rKRRqVLVao24BmYHWzQCh3sNxjrYJ3HFR
         Rde0FunhCD3ItfSrHGCjXDgSzQN93UJnoAsSBsGl+sxcQVdbfDM5UUeToTQTlfYODqo1
         20ESJa//vVeURHExlKeV4Xt45lRxrGJWeal7+uwBqXwz/toVcG34ctsuZ/nEM3VaUxJf
         Wjy8Dtm3USdJltHiy5s/AYxgTGVYwz7k8XpO2Jzsj6uFTncbB9d1EK+8MEMfaM4tQ5u2
         IyhdgwxmujTUruYmiQnlmUDoQQ7d8tlMYgFUXajaSmWvXNCBau7i2EewGydtkSvq62Qc
         fDLg==
X-Gm-Message-State: APjAAAVi1TkDVE7WbwrumjQyo+D5YyIuN0tsY/p0+mjpfrBz2FclrXoG
        Sla8A/r6ykmI7OHvqNE9AxBZEFgS+irH1u78ihQ=
X-Google-Smtp-Source: APXvYqzlM/sygSpqZQGNaTUEGA8/jEOI8rTtvIJVlIDP3rywY3YdmWrdQiAPauDVhJkcDbizxVMfAuyU7h5BF9UXLpM=
X-Received: by 2002:a6b:bf01:: with SMTP id p1mr9943054iof.181.1564977473126;
 Sun, 04 Aug 2019 20:57:53 -0700 (PDT)
MIME-Version: 1.0
References: <1563289265-10977-1-git-send-email-aisheng.dong@nxp.com>
 <1563289265-10977-2-git-send-email-aisheng.dong@nxp.com> <20190803144246.GM8870@X250.getinternet.no>
In-Reply-To: <20190803144246.GM8870@X250.getinternet.no>
From:   Dong Aisheng <dongas86@gmail.com>
Date:   Mon, 5 Aug 2019 11:48:29 +0800
Message-ID: <CAA+hA=Sm0MAHNwH1sZQfK8cO+3jLkue97u=ceFiUv34+qGos1Q@mail.gmail.com>
Subject: Re: [PATCH v3 01/11] dt-bindings: firmware: imx-scu: new binding to
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

On Sun, Aug 4, 2019 at 11:49 AM Shawn Guo <shawnguo@kernel.org> wrote:
>
> On Tue, Jul 16, 2019 at 11:00:55PM +0800, Dong Aisheng wrote:
> > There's a few limitations on the original one cell clock binding
> > (#clock-cells = <1>) that we have to define some SW clock IDs for device
> > tree to reference. This may cause troubles if we want to use common
> > clock IDs for multi platforms support when the clock of those platforms
> > are mostly the same.
> > e.g. Current clock IDs name are defined with SS prefix.
> >
> > However the device may reside in different SS across CPUs, that means the
> > SS prefix may not valid anymore for a new SoC. Furthermore, the device
> > availability of those clocks may also vary a bit.
> >
> > For such situation, we want to eliminate the using of SW Clock IDs and
> > change to use a more close to HW one instead.
> > For SCU clocks usage, only two params required: Resource id + Clock Type.
>
> If this is how SCU firmware addresses the clock, I agree that it's worth
> witching to this new bindings, which describes the hardware (SCU
> firmware in this case) better, IMO.
>
> > Both parameters are platform independent. So we could use two cells binding
> > to pass those parameters,
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
> >  * Changed to two cells binding and register all clocks in driver
> >    instead of parse from device tree.
> > v1->v2:
> >  * changed to one cell binding inspired by arm,scpi.txt
> >    Documentation/devicetree/bindings/arm/arm,scpi.txt
> >    Resource ID is encoded in 'reg' property.
> >    Clock type is encoded in generic clock-indices property.
> >    Then we don't have to search all the DT nodes to fetch
> >    those two value to construct clocks which is relatively
> >    low efficiency.
> >  * Add required power-domain property as well.
> > ---
> >  .../devicetree/bindings/arm/freescale/fsl,scu.txt       | 12 +++++++-----
> >  include/dt-bindings/firmware/imx/rsrc.h                 | 17 +++++++++++++++++
> >  2 files changed, 24 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > index 5d7dbab..351d335 100644
> > --- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > +++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > @@ -89,7 +89,10 @@ Required properties:
> >                         "fsl,imx8qm-clock"
> >                         "fsl,imx8qxp-clock"
> >                       followed by "fsl,scu-clk"
> > -- #clock-cells:              Should be 1. Contains the Clock ID value.
> > +- #clock-cells:              Should be either
> > +                     2: Contains the Resource and Clock ID value.
> > +                     or
> > +                     1: Contains the Clock ID value. (DEPRECATED)
> >  - clocks:            List of clock specifiers, must contain an entry for
> >                       each required entry in clock-names
> >  - clock-names:               Should include entries "xtal_32KHz", "xtal_24MHz"
> > @@ -162,7 +165,7 @@ firmware {
> >
> >               clk: clk {
> >                       compatible = "fsl,imx8qxp-clk", "fsl,scu-clk";
> > -                     #clock-cells = <1>;
> > +                     #clock-cells = <2>;
> >               };
> >
> >               iomuxc {
> > @@ -192,8 +195,7 @@ serial@5a060000 {
> >       ...
> >       pinctrl-names = "default";
> >       pinctrl-0 = <&pinctrl_lpuart0>;
> > -     clocks = <&clk IMX8QXP_UART0_CLK>,
> > -              <&clk IMX8QXP_UART0_IPG_CLK>;
> > -     clock-names = "per", "ipg";
> > +     clocks = <&uart0_clk IMX_SC_R_UART_0 IMX_SC_PM_CLK_PER>;
> > +     clock-names = "ipg";
> >       power-domains = <&pd IMX_SC_R_UART_0>;
> >  };
> > diff --git a/include/dt-bindings/firmware/imx/rsrc.h b/include/dt-bindings/firmware/imx/rsrc.h
> > index 4e61f64..fbeaca7 100644
> > --- a/include/dt-bindings/firmware/imx/rsrc.h
> > +++ b/include/dt-bindings/firmware/imx/rsrc.h
> > @@ -547,4 +547,21 @@
> >  #define IMX_SC_R_ATTESTATION         545
> >  #define IMX_SC_R_LAST                        546
> >
> > +/*
> > + * Defines for SC PM CLK
> > + */
> > +#define IMX_SC_PM_CLK_SLV_BUS                0       /* Slave bus clock */
> > +#define IMX_SC_PM_CLK_MST_BUS                1       /* Master bus clock */
> > +#define IMX_SC_PM_CLK_PER            2       /* Peripheral clock */
> > +#define IMX_SC_PM_CLK_PHY            3       /* Phy clock */
> > +#define IMX_SC_PM_CLK_MISC           4       /* Misc clock */

This is for typical device resource.

> > +#define IMX_SC_PM_CLK_MISC0          0       /* Misc 0 clock */
> > +#define IMX_SC_PM_CLK_MISC1          1       /* Misc 1 clock */
> > +#define IMX_SC_PM_CLK_MISC2          2       /* Misc 2 clock */
> > +#define IMX_SC_PM_CLK_MISC3          3       /* Misc 3 clock */
> > +#define IMX_SC_PM_CLK_MISC4          4       /* Misc 4 clock */

This is for some special clock types which do not belong to above
normal clock types.
Used very rare in SCU firmware.
e.g.
enet0_mac0_rxclk SC_R_ENE T_0 / SC_PM_CL K_MISC0

> > +#define IMX_SC_PM_CLK_CPU            2       /* CPU clock */
> > +#define IMX_SC_PM_CLK_PLL            4       /* PLL */
> > +#define IMX_SC_PM_CLK_BYPASS         4       /* Bypass clock */

They're for specific clock types for CPU/PLL/BYPASS only.

>
> It seems that there are several sets of clock type which apply to
> different resources/devices?  If so, can you separate them a bit with
> some comments to make the list easier for readers?
>

Yes, i could add comments as above.
Thanks for the suggestions.

Aisheng

> Shawn
>
> > +
> >  #endif /* __DT_BINDINGS_RSCRC_IMX_H */
> > --
> > 2.7.4
> >
