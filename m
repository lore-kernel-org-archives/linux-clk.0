Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.csie.ntu.edu.tw ([140.112.30.61]:54692 "EHLO
        smtp.csie.ntu.edu.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751379AbdL2Ipp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Dec 2017 03:45:45 -0500
MIME-Version: 1.0
In-Reply-To: <20171222122243.25735-8-icenowy@aosc.io>
References: <20171222122243.25735-1-icenowy@aosc.io> <20171222122243.25735-8-icenowy@aosc.io>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 29 Dec 2017 16:45:18 +0800
Message-ID: <CAGb2v66LGkzscbpCAwhPvA2VPL-8Qpc+e5vNFPq6vS2Hvh9DbA@mail.gmail.com>
Subject: Re: [PATCH v3 07/11] ARM: sunxi: h3/h5: add simplefb nodes
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Dec 22, 2017 at 8:22 PM, Icenowy Zheng <icenowy@aosc.io> wrote:
> The H3/H5 SoCs have a HDMI output and a TV Composite output.
>
> Add simplefb nodes for these outputs.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  arch/arm/boot/dts/sunxi-h3-h5.dtsi | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> index fcb909658cf0..31478c03790d 100644
> --- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> +++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> @@ -53,6 +53,35 @@
>         #address-cells = <1>;
>         #size-cells = <1>;
>
> +       chosen {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +
> +               framebuffer-hdmi {
> +                       compatible = "allwinner,simple-framebuffer",
> +                                    "simple-framebuffer";
> +                       allwinner,pipeline = "mixer0-lcd0-hdmi";
> +                       clocks = <&display_clocks CLK_BUS_MIXER0>,
> +                                <&ccu CLK_BUS_TCON0>, <&ccu CLK_BUS_HDMI>,

Are the bus clocks necessary? It's not like simplefb is going to access
any of the control registers.

> +                                <&display_clocks CLK_MIXER0>,
> +                                <&ccu CLK_TCON0>, <&ccu CLK_HDMI>,
> +                                <&ccu CLK_HDMI_DDC>;

Is the DDC clock necessary? There's no usage of DDC with simplefb.

ChenYu

> +                       status = "disabled";
> +               };
> +
> +               framebuffer-tve {
> +                       compatible = "allwinner,simple-framebuffer",
> +                                    "simple-framebuffer";
> +                       allwinner,pipeline = "mixer1-lcd1-tve";
> +                       clocks = <&display_clocks CLK_BUS_MIXER1>,
> +                                <&ccu CLK_BUS_TCON1>, <&ccu CLK_BUS_TVE>,
> +                                <&display_clocks CLK_MIXER1>,
> +                                <&ccu CLK_TVE>;
> +                       status = "disabled";
> +               };
> +       };
> +
>         clocks {
>                 #address-cells = <1>;
>                 #size-cells = <1>;
> --
> 2.14.2
>
