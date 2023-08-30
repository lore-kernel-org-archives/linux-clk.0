Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CFC2C6FA8F
	for <linux-clk@archiver.kernel.org>; Wed, 30 Aug 2023 02:45:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237797AbjH3Coq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Aug 2023 22:44:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241822AbjH3Coc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Aug 2023 22:44:32 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61887CEC;
        Tue, 29 Aug 2023 19:44:27 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-27183f4ccc1so1651651a91.2;
        Tue, 29 Aug 2023 19:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693363467; x=1693968267; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6IkO9heiK/3IppRrCoBo6SsCuPvqZof4XLqWQAV+Q8=;
        b=ABxTBNo2tyY7r4+ley7Kisk8NxLEstun66RkqZ/LeH0bGMmI82aeYQxhmSt2oPF8Dt
         SDCt94/qmbgZOvNMcZ2e6f18OGaH614wTFvON1ooA1r1j/j45xkAzLr/aup+GbQMWR5R
         HCWzTlMkkv084OfntWm8/daCUL1+NnRrzY1ICQ/kglnm0/2oiLgLglZQMGIpFExY93m4
         u7kgkhJllzGDD849T+2EDufHumDKWzsUpCaaNWRhLcXQ7Pgc2oZHeXwTImlLlnpYSf/h
         hzj02WcKuhl2FUUNbyiQX7138qQ6gdHHiGdyPmXtVMkte7irkTfhJd24CS3rjKQW7YvP
         As1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693363467; x=1693968267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+6IkO9heiK/3IppRrCoBo6SsCuPvqZof4XLqWQAV+Q8=;
        b=AaY3EC+y8QWRBDWpbCdt90fp397fUGV4hiZ2lCEU1cXwJ+K8KggtykjBgZQALnrbG3
         sHnPF5/rmQt+ZYGnZdIxOtMd8c9pWOwR8OGLP6Oyy+UeGnMPqWmp/LbmKkhOM9UVu2yg
         gxNAwUn8W1aUsFryOcLTTdBmTeaRzEo2glgCTlJz5vw5KOqz+2EvimDT3xohTLaxlKVh
         FnwpKVY/KbYUH4NVgZ36XvCmYwGBAgJpbzdaCuy1zSaKAEqCPrN2lVVGcA2uAJI4As6L
         el+QsgJb8Xp8+t1UhajXHz+GtteYXbMND7gyl8VqByesXgY75uyxyAJD2hzICOIXMvaG
         /upg==
X-Gm-Message-State: AOJu0Yw09iRc4GGtab6Pd2NLATnsx4VEyjpR+BKIHe873zPx3hjn+w7M
        w7ehHlHoHuT54nLnJFezTDCjVbRxHkJjgwwVlew=
X-Google-Smtp-Source: AGHT+IHW1NRWoZCkWByi29KVq1k53JC9RJfQnl7Eqd75V3byZ0BdpIUy44crH1CYTSwuOASSIO+BhHp00zpbMluuCeA=
X-Received: by 2002:a17:90a:f182:b0:271:addf:3c96 with SMTP id
 bv2-20020a17090af18200b00271addf3c96mr928363pjb.46.1693363466465; Tue, 29 Aug
 2023 19:44:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230508114236.8444-1-marex@denx.de>
In-Reply-To: <20230508114236.8444-1-marex@denx.de>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 29 Aug 2023 21:44:15 -0500
Message-ID: <CAHCN7xJGMkf3MZWK5NqtUxnSTRaZdL-8f3ngUsOUKEdOmdUvXw@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] arm64: dts: imx8mp: Add SAI, SDMA, AudioMIX
To:     Marek Vasut <marex@denx.de>
Cc:     linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Richard Leitner <richard.leitner@skidata.com>,
        Abel Vesa <abelvesa@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, May 8, 2023 at 6:42=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:
>
> Add all SAI nodes, SDMA2 and SDMA3 nodes, and AudioMIX node. This is
> needed to get audio operational on i.MX8MP .
>
> Acked-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> Tested-by: Adam Ford <aford173@gmail.com> #imx8mp-beacon-kit
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Tested-by: Richard Leitner <richard.leitner@skidata.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jacky Bai <ping.bai@nxp.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Marco Felsch <m.felsch@pengutronix.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Richard Cochran <richardcochran@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
> V2: - Add AUDIO_AXI clock to audio gpc
>     - Use IMX8MP_CLK_AUDIOMIX_SDMA2_ROOT for SDMA2 IPG clock
> V3: Rename audio_ahb to plain ahb
> V4: - Add RB/TB from Luca
>     - Rebase on next 20230223
> V5: - Add TB from Adam and Alexander
>     - Replace blk-ctrl@ with clock-controller@
>     - Specify sound-dai-cells in sai nodes
> V6: - Add RB from Fabio
>     - Drop power-domain-names from audiomix block/clock controller
>     - Move reg below compatible property
>     - Move sound-dai-cells below reg property
>     - Sort DT properties: compatible, regs, #cells, properties, status
> V7: - Move #clock-cells below reg property
>     - Add AB from Peng
>     - Add RB from Marco, sort the tags
> V8: Add TB from Richard
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 158 ++++++++++++++++++++++
>  1 file changed, 158 insertions(+)
>
<snip>
Marek,

I have a question about the clocking for eASRC and PDM.

> +
> +                       audio_blk_ctrl: clock-controller@30e20000 {
> +                               compatible =3D "fsl,imx8mp-audio-blk-ctrl=
";
> +                               reg =3D <0x30e20000 0x10000>;
> +                               #clock-cells =3D <1>;
> +                               clocks =3D <&clk IMX8MP_CLK_AUDIO_ROOT>,
> +                                        <&clk IMX8MP_CLK_SAI1>,
> +                                        <&clk IMX8MP_CLK_SAI2>,
> +                                        <&clk IMX8MP_CLK_SAI3>,
> +                                        <&clk IMX8MP_CLK_SAI5>,
> +                                        <&clk IMX8MP_CLK_SAI6>,
> +                                        <&clk IMX8MP_CLK_SAI7>;
> +                               clock-names =3D "ahb",
> +                                             "sai1", "sai2", "sai3",
> +                                             "sai5", "sai6", "sai7";
> +                               power-domains =3D <&pgc_audio>;
> +                       };
> +               };
> +

I am trying to plumb in the micfil driver with a PDM microphone on a
Plus.  I have SAI3 and SAI5 audio working, but if I try to use the
micfil, the PDM clock doesn't get turned on, and the micfil doesn't
appear to see anything coming in.  I was curious why the
audio_blk_ctrl has clock entries for IMX8MP_CLK_SAIx, but there isn't
one for the PDM nor the ASRC clocks.  I added the MICFIL noted to the
8mp in a previous patch [1], and I am trying to customize the MICFIL
node as follows:

&micfil {
#sound-dai-cells =3D <0>;
pinctrl-names =3D "default";
pinctrl-0 =3D <&pinctrl_pdm>;
assigned-clocks =3D <&clk IMX8MP_CLK_PDM>;
assigned-clock-parents =3D <&clk IMX8MP_AUDIO_PLL1_OUT>;
assigned-clock-rates =3D <196608000>;
status =3D "okay";
};

I also noticed in the down-stream kernel, the pdm_ipg_clk and
pdm_root_clk are shared gates with separate parents.

The PDM tree of the down-stream kernel looks like this:
 audio_pll1_ref_sel                0        0        0    24000000
     0     0  50000         Y
       audio_pll1                     0        0        0   393216000
        0     0  50000         Y
          audio_pll1_bypass           0        0        0   393216000
        0     0  50000         Y
             audio_pll1_out           0        0        0   393216000
        0     0  50000         N
                pdm                   0        0        0   196608000
        0     0  50000         N
                   pdm_root           0        0        0   196608000
        0     0  50000         N
                      pdm_sel         0        0        0   196608000
        0     0  50000         Y
                         pdm_root_clk       0        0        0
196608000          0     0  50000         N

The PDM tree of the mainline looks like this:

   audio_pll1_ref_sel                0        0        0    24000000
       0     0  50000         Y
       audio_pll1                     0        0        0   393216000
        0     0  50000         Y
          audio_pll1_bypass           0        0        0   393216000
        0     0  50000         Y
             audio_pll1_out           0        0        0   393216000
        0     0  50000         N
                pdm                   0        0        0   196608000
        0     0  50000         N
                   pdm_root           0        0        0   196608000
        0     0  50000         N
                      pdm_sel         0        0        0   196608000
        0     0  50000         Y

It seems like the "pdm_root_clk" generated by the shared audo-blk
down-sream driver is missing from the mainline.  I looked up the clock
I referenced when I attempted to enable the miffil, but
'IMX8MP_CLK_AUDIOMIX_PDM_ROOT doesn't appear to be configured in
either clk-imx8mp.c or clk-imx8mp-audiomix.c.  Maybe it's obscured by
the macros, but it seems like the pdm_sel should somehow have an
additional variable for the shared clock and an additional clock like
pdm_root_clk assigned with it.

I have similar configurations for Mini and Nano, and both of them are
able to record audio, so I think there might be a clock issue
somewhere related to the audiomix driver, and not a misconfiguration
of the sound-card or the micfil itself.

thanks for any suggestions,

adam


[1] - https://patchwork.kernel.org/project/linux-arm-kernel/patch/202308270=
23155.467807-3-aford173@gmail.com/
