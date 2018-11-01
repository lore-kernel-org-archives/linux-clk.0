Return-Path: <SRS0=b8N2=NM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57FAEC0044C
	for <linux-clk@archiver.kernel.org>; Thu,  1 Nov 2018 10:20:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ECAF92081B
	for <linux-clk@archiver.kernel.org>; Thu,  1 Nov 2018 10:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECAF92081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbeKATXK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Nov 2018 15:23:10 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:44023 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726320AbeKATXK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Nov 2018 15:23:10 -0400
Received: by mail-ed1-f68.google.com with SMTP id y20-v6so16105295eds.10;
        Thu, 01 Nov 2018 03:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vp0iXqtWrrBjtiyJYcPlzK3VzdUj4NsJESrvC0b0WKY=;
        b=m/ayib/Iy4OHMxL8HCIc15tHT0zs4fv1T6CZo9ljt3ecUYPff/1SHrMyE4LiZvTWCf
         B5BRfxU3/rIKHNd8d+LxzQ0C8yO6myTvhGQ0K6U1Wj4OyZoXXDRmuYtEWM+8/tLQ42/1
         F/em252WmEcba9j1kpScaPkJXtgrfFcC0I1jhMMqGRsAii8jvu5HiNP8ZhjD/G5vEI/d
         NTk//87PF/EVmbWOtcD/uLvFxRa19Wzvifh0XwLFsfajG6EyO1ovl9qIhjwephnFi56i
         3HceBkkgJrr/DU1TZMeUFsF21tPTapWswPlNPxy0yv8cZ/DNv5anD/Bre3Mg2E4iLA6J
         2TLg==
X-Gm-Message-State: AGRZ1gKdQIIbi9GOa7VqrUTikiXezwTQrkKVz8/smiJbP66MgpCOiw5P
        P3UtyV+dZYiNjzTzy24brDrkYrxw6uk=
X-Google-Smtp-Source: AJdET5dvjZueoMRCyM0eW++infN3SZrk+gSBdTsbTP85afUQ+EB7lPDFeabVT1BymGNmfnMbH/hJpA==
X-Received: by 2002:aa7:d7c4:: with SMTP id e4-v6mr1236731eds.69.1541067646958;
        Thu, 01 Nov 2018 03:20:46 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id e14-v6sm961465edl.64.2018.11.01.03.20.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Nov 2018 03:20:46 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id q19-v6so914048wmc.2;
        Thu, 01 Nov 2018 03:20:46 -0700 (PDT)
X-Received: by 2002:a1c:9f01:: with SMTP id i1-v6mr4975938wme.8.1541067646090;
 Thu, 01 Nov 2018 03:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <20181028120859.5735-1-martin.blumenstingl@googlemail.com>
 <20181030221310.GA22640@bogus> <CAFBinCDnB5GiX530eLR5fa6JEZP9GtYDhJq6S7sKMXEtMP5FHQ@mail.gmail.com>
In-Reply-To: <CAFBinCDnB5GiX530eLR5fa6JEZP9GtYDhJq6S7sKMXEtMP5FHQ@mail.gmail.com>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Thu, 1 Nov 2018 18:20:32 +0800
X-Gmail-Original-Message-ID: <CAGb2v65L4Sq1Fxqyffq16Zpamv=WosgvCaXdVYH6ooLLmHW0SQ@mail.gmail.com>
Message-ID: <CAGb2v65L4Sq1Fxqyffq16Zpamv=WosgvCaXdVYH6ooLLmHW0SQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Meson8/Meson8b: introduce a HHI syscon node
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     Rob Herring <robh@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Carlo Caione <carlo@caione.org>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Nov 1, 2018 at 6:10 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Rob,
>
> On Tue, Oct 30, 2018 at 11:13 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Sun, Oct 28, 2018 at 01:08:56PM +0100, Martin Blumenstingl wrote:
> > > The Meson8/Meson8b/Meson8m2 SoCs are suffering from a similar problem
> > > as the GXBB/GXL/GXM SoCs (see the GX series from Jerome: [0]):
> > > There is a register area called "HHI" which is used for multiple IP
> > > blocks of the SoC:
> > > - the system clock controller
> > > - a few reset lines (there is a separate reset controller, these reset
> > >   lines are not part of the other reset controller). this reset
> > >   controller is currently implemented in the clock controller driver
> > > - a HDMI controller
> >
> > Does this have it's own clocks, resets or other resources?
> I'm not sure what's the best way to answer this as the HDMI part is
> not part of the public S805 datasheet. however, I went ahead and read
> Amlogic's BSP code (see [1], [2] and [3] - beware: these files will
> not make checkpatch happy ;)).
> first I have to make a correction here: while looking deeper into this
> the HDMI controller is *not* inside the HHI register area (but instead
> on the APB bus). sorry for getting this wrong
>
> here's how would make the .dts to look like (assuming we support all
> peripherals that I know of in the HHI area):
>
> &hhi {
>     compatible = "amlogic,meson-hhi-sysctrl",
>                            "simple-mfd",
>                            "syscon";
>
>     clkc: clock-controller {
>         ...
>     };
>
>     hhi_power: power-controller {
>         compatible = "amlogic,meson8-hhi-power-controller";
>         #power-domain-cells = <1>;
>     };
>
>     hdmi_phy: phy {
>         compatible = "amlogic,meson8-hdmi-phy";
>         #phy-cells = <0>;
>         /*
>          * HHI_HDMI_PHY_CNTL0 needs a magic value based on
>          * power on/off status. HHI_HDMI_PHY_CNTL1 has
>          * bit[1]: enable clock, bit[0]: soft reset (maybe
>          * these two should be provided by the clkc?)
>          */
>     };
> };
>
> &apb {
>     hdmi_tx: hdmi-tx@42000 {
>         compatible = "amlogic,meson8-hdmi";
>         reg = <0x42000 0xc>;
>         interrupts = <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>;
>         #address-cells = <1>;
>         #size-cells = <0>;
>
>         /*
>          * internally the actual HDMI controller registers
>          * are not accessed directly but through two special
>          * (address and data) registers: HDMI_ADDR_PORT,
>          * HDMI_DATA_PORT.
>          */
>
>         /*
>          * there are five internal reset registers:
>          * TX_SYS5_TX_SOFT_RESET_1
>          * TX_SYS5_TX_SOFT_RESET_2
>          * TX_SYS5_RX_SOFT_RESET_1
>          * TX_SYS5_RX_SOFT_RESET_2
>          * TX_SYS5_RX_SOFT_RESET_3
>          */
>
>         /*
>          * TODO: this has to know a few details about the
>          * audio stream as well to route the audio correctly
>          * (vendor code differentiates between 2ch / 8ch and
>          * programs the HDMI controller accordingly)
>          */
>
>         pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
>         pinctrl-names = "default";
>
>         /* TODO: what is VCLK1_HDMI exactly? */
>         clocks = <&clkc CLKID_HDMI_PCLK>,
>                  <&clkc CLKID_HDMI_SYS>,
>                  <&clkc CLKID_VCLK1_HDMI>;
>         clock-names = "pclk", "sys", "vclk1";
>
>         power-domains = <&hhi_power 0>, <&hhi_power 1> ;
>         power-domain-names = "edid", "hdcp";
>
>         phys = <&hdmi_phy>;
>         phy-names = "hdmi";
>
>         /* VPU VENC Input */
>         hdmi_tx_venc_port: port@0 {
>             reg = <0>;
>
>             hdmi_tx_in: endpoint {
>                 /*
>                  * this is provided by the VPU which has
>                  * many (>10) clock inputs - all connected
>                  * to "clkc" above
>                  */
>                 remote-endpoint = <&hdmi_tx_out>;
>             };
>         };
>
>         /* TMDS Output */
>         hdmi_tx_tmds_port: port@1 {
>             reg = <1>;
>         };
>     };
> };
>
> &saradc {
> ...
>     /*
>      * patches for this are already sent: TSC bit[4] is
>      * stored in HHI_DPLL_TOP_0 (which is right between the
>      * SYS_PLL and VID_PLL registers. the PLL clocks from
>      * these other registers are implemented in the driver
>      * for the "clkc" node above)
>      */
>     amlogic,hhi-sysctrl = <&hhi>;
> };
>
>
> > > - temperature sensor calibration data (by "data" I really mean data,
> > >   the ADC driver has four bits for the TSC data in it's own register
> > >   space, however on Meson8b and Meson8m2 there is a fifth TSC bit which
> > >   is stored in the HHI register area)
> > >
> > > The first three could be implemented with a single node (either in one
> > > big driver, or using a MFD driver which would register function-
> > > specific drivers).
> > > However, the TSC data is a big problem, because the ADC has it's own
> > > set of registers but needs to write one bit in the HHI register area.
> >
> > Generally, that would be solved with a phandle to the HHI and maybe an
> > offset cell in the ADC node. I don't see why that's a big problem.
> this is what I'm trying to do, see my dt-bindings patch for the SAR
> ADC (which is used to read the temperature sensor): [0]
> my understanding was that I should go through syscon to avoid double
> ioremap() of the same register set (the clock controller and SAR ADC
> would have to do it).
> which APIs (other than syscon) would you suggest for this case?

I would suggest avoiding the syscon API when you have other drivers going
through the same register space. You can do a syscon like approach by
having the HHI driver register one or multiple regmaps, with appropriate
access controls, which other drivers can fetch using dev_get_regmap() (via
a phandle to the HHI device). I don't know much about simple-mfd though.
If the registers are neatly grouped together by function it would be easier
to deal with. Or you could just have one device node with appropriate cell
properties and have a big driver register all the functions. That driver
would likely live under drivers/soc/.

ChenYu

>
> Regards
> Martin
>
>
> [0] https://patchwork.kernel.org/patch/10658557/
> [1] https://github.com/endlessm/linux-meson/blob/3a749cb45a381fb977bae0bee36c6c1cbee32ac1/arch/arm/mach-meson8b/hdmi_tx_hw/hdmi_tx_hw.c
> [2] https://github.com/endlessm/linux-meson/blob/3a749cb45a381fb977bae0bee36c6c1cbee32ac1/arch/arm/mach-meson8b/hdmi_tx_hw/hdmi_tx_reg.c
> [3] https://github.com/endlessm/linux-meson/blob/3a749cb45a381fb977bae0bee36c6c1cbee32ac1/arch/arm/mach-meson8b/include/mach/register.h
