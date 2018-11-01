Return-Path: <SRS0=b8N2=NM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A7F9C0044C
	for <linux-clk@archiver.kernel.org>; Thu,  1 Nov 2018 10:10:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 379082081B
	for <linux-clk@archiver.kernel.org>; Thu,  1 Nov 2018 10:10:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="NrwsEJSY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 379082081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727516AbeKATNH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Nov 2018 15:13:07 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:37071 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727507AbeKATNG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Nov 2018 15:13:06 -0400
Received: by mail-ot1-f65.google.com with SMTP id o14so17266212oth.4;
        Thu, 01 Nov 2018 03:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ucq+Ow/GBzk+FbDsm4MS963GbjKsAuu2Zzh0p7Sp0HA=;
        b=NrwsEJSYgTQlxFnolG6OCF4wPeI/b5pMbJEGMXu7LSsN3n+gFbYEEC1oNb0Ac6vvAY
         6jIDZhKgy/6yTsQBOkBH9PFHqpT8Vmx7Sp+dL1Ch7nBT0BifrgRCENEIJWRAzzjZjbQZ
         sqi1l5CxuCElbIwnylg1I2Lpb9MVAsQeqMGMfzoOaGr6sQaem2m2r0LzJkN2KUh+sYyD
         oJBj7C1NERA14Y8vN6GbWKHONzgjcbcGgzBW1AO9/B0mBnmV4MTqBQJtyO8tJB6z8U1s
         hZdUyRSa5+VmSZW8OeaH5pjN6wOaX5aLS+soHIrv6cqXZYZBL2vhLc2AuWGreviVNzMA
         V9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ucq+Ow/GBzk+FbDsm4MS963GbjKsAuu2Zzh0p7Sp0HA=;
        b=ZvcBL0x978fLjkYvIPZbIZevcC/Fl21NirlmgApTGU306ENfd79dH3Kwc367LAK2yo
         To4ydJPg9gaLUem2rEiTdRTOaITDDWwuYlutjZjgQ6PzwF8LTX6xIASfJ+h0+N6UrlYK
         wV5albdyhoQSqaxB4KJPLPwwRTyAD/02LaCXVheDo44m7zaZjQ9N5mLMlVSQ8Qx8LGSx
         CAM/NTCfeELJsODrZu9YGmYlEwML/+N0KLsjhT4xcRGUksm1+eTugc8tTOp7yG6kIjuN
         OgOieLFmKLHARBLSa1QblXmmmIw4SEGg7GxSrvEfd7h+iLvTF+IYz1S2nkNIJOd1dWQb
         U3Sw==
X-Gm-Message-State: AGRZ1gInzbQGadlBGbFmgI6fvIdLTdAxjpVVh0RFfMOOyJhqFaF3qpcy
        br+9JtPgXtNvM1aJ5I/YH6zo9pMN8ed2O1yO6NM=
X-Google-Smtp-Source: AJdET5fZqbBl3AYsTw+TnwBN1Ye0PhKI0FbgA8r8UeJjiNNGBuUkC0BsihwYSotad+bs1NY4vNuNRdV+HPv8/1ykUlg=
X-Received: by 2002:a9d:7749:: with SMTP id t9mr4369359otl.342.1541067046936;
 Thu, 01 Nov 2018 03:10:46 -0700 (PDT)
MIME-Version: 1.0
References: <20181028120859.5735-1-martin.blumenstingl@googlemail.com> <20181030221310.GA22640@bogus>
In-Reply-To: <20181030221310.GA22640@bogus>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Thu, 1 Nov 2018 11:10:35 +0100
Message-ID: <CAFBinCDnB5GiX530eLR5fa6JEZP9GtYDhJq6S7sKMXEtMP5FHQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Meson8/Meson8b: introduce a HHI syscon node
To:     robh@kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com,
        mark.rutland@arm.com, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, carlo@caione.org, khilman@baylibre.com,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Rob,

On Tue, Oct 30, 2018 at 11:13 PM Rob Herring <robh@kernel.org> wrote:
>
> On Sun, Oct 28, 2018 at 01:08:56PM +0100, Martin Blumenstingl wrote:
> > The Meson8/Meson8b/Meson8m2 SoCs are suffering from a similar problem
> > as the GXBB/GXL/GXM SoCs (see the GX series from Jerome: [0]):
> > There is a register area called "HHI" which is used for multiple IP
> > blocks of the SoC:
> > - the system clock controller
> > - a few reset lines (there is a separate reset controller, these reset
> >   lines are not part of the other reset controller). this reset
> >   controller is currently implemented in the clock controller driver
> > - a HDMI controller
>
> Does this have it's own clocks, resets or other resources?
I'm not sure what's the best way to answer this as the HDMI part is
not part of the public S805 datasheet. however, I went ahead and read
Amlogic's BSP code (see [1], [2] and [3] - beware: these files will
not make checkpatch happy ;)).
first I have to make a correction here: while looking deeper into this
the HDMI controller is *not* inside the HHI register area (but instead
on the APB bus). sorry for getting this wrong

here's how would make the .dts to look like (assuming we support all
peripherals that I know of in the HHI area):

&hhi {
    compatible = "amlogic,meson-hhi-sysctrl",
                           "simple-mfd",
                           "syscon";

    clkc: clock-controller {
        ...
    };

    hhi_power: power-controller {
        compatible = "amlogic,meson8-hhi-power-controller";
        #power-domain-cells = <1>;
    };

    hdmi_phy: phy {
        compatible = "amlogic,meson8-hdmi-phy";
        #phy-cells = <0>;
        /*
         * HHI_HDMI_PHY_CNTL0 needs a magic value based on
         * power on/off status. HHI_HDMI_PHY_CNTL1 has
         * bit[1]: enable clock, bit[0]: soft reset (maybe
         * these two should be provided by the clkc?)
         */
    };
};

&apb {
    hdmi_tx: hdmi-tx@42000 {
        compatible = "amlogic,meson8-hdmi";
        reg = <0x42000 0xc>;
        interrupts = <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>;
        #address-cells = <1>;
        #size-cells = <0>;

        /*
         * internally the actual HDMI controller registers
         * are not accessed directly but through two special
         * (address and data) registers: HDMI_ADDR_PORT,
         * HDMI_DATA_PORT.
         */

        /*
         * there are five internal reset registers:
         * TX_SYS5_TX_SOFT_RESET_1
         * TX_SYS5_TX_SOFT_RESET_2
         * TX_SYS5_RX_SOFT_RESET_1
         * TX_SYS5_RX_SOFT_RESET_2
         * TX_SYS5_RX_SOFT_RESET_3
         */

        /*
         * TODO: this has to know a few details about the
         * audio stream as well to route the audio correctly
         * (vendor code differentiates between 2ch / 8ch and
         * programs the HDMI controller accordingly)
         */

        pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
        pinctrl-names = "default";

        /* TODO: what is VCLK1_HDMI exactly? */
        clocks = <&clkc CLKID_HDMI_PCLK>,
                 <&clkc CLKID_HDMI_SYS>,
                 <&clkc CLKID_VCLK1_HDMI>;
        clock-names = "pclk", "sys", "vclk1";

        power-domains = <&hhi_power 0>, <&hhi_power 1> ;
        power-domain-names = "edid", "hdcp";

        phys = <&hdmi_phy>;
        phy-names = "hdmi";

        /* VPU VENC Input */
        hdmi_tx_venc_port: port@0 {
            reg = <0>;

            hdmi_tx_in: endpoint {
                /*
                 * this is provided by the VPU which has
                 * many (>10) clock inputs - all connected
                 * to "clkc" above
                 */
                remote-endpoint = <&hdmi_tx_out>;
            };
        };

        /* TMDS Output */
        hdmi_tx_tmds_port: port@1 {
            reg = <1>;
        };
    };
};

&saradc {
...
    /*
     * patches for this are already sent: TSC bit[4] is
     * stored in HHI_DPLL_TOP_0 (which is right between the
     * SYS_PLL and VID_PLL registers. the PLL clocks from
     * these other registers are implemented in the driver
     * for the "clkc" node above)
     */
    amlogic,hhi-sysctrl = <&hhi>;
};


> > - temperature sensor calibration data (by "data" I really mean data,
> >   the ADC driver has four bits for the TSC data in it's own register
> >   space, however on Meson8b and Meson8m2 there is a fifth TSC bit which
> >   is stored in the HHI register area)
> >
> > The first three could be implemented with a single node (either in one
> > big driver, or using a MFD driver which would register function-
> > specific drivers).
> > However, the TSC data is a big problem, because the ADC has it's own
> > set of registers but needs to write one bit in the HHI register area.
>
> Generally, that would be solved with a phandle to the HHI and maybe an
> offset cell in the ADC node. I don't see why that's a big problem.
this is what I'm trying to do, see my dt-bindings patch for the SAR
ADC (which is used to read the temperature sensor): [0]
my understanding was that I should go through syscon to avoid double
ioremap() of the same register set (the clock controller and SAR ADC
would have to do it).
which APIs (other than syscon) would you suggest for this case?


Regards
Martin


[0] https://patchwork.kernel.org/patch/10658557/
[1] https://github.com/endlessm/linux-meson/blob/3a749cb45a381fb977bae0bee36c6c1cbee32ac1/arch/arm/mach-meson8b/hdmi_tx_hw/hdmi_tx_hw.c
[2] https://github.com/endlessm/linux-meson/blob/3a749cb45a381fb977bae0bee36c6c1cbee32ac1/arch/arm/mach-meson8b/hdmi_tx_hw/hdmi_tx_reg.c
[3] https://github.com/endlessm/linux-meson/blob/3a749cb45a381fb977bae0bee36c6c1cbee32ac1/arch/arm/mach-meson8b/include/mach/register.h
