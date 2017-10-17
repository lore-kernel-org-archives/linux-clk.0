Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.csie.ntu.edu.tw ([140.112.30.61]:41236 "EHLO
        smtp.csie.ntu.edu.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934086AbdJQMJP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Oct 2017 08:09:15 -0400
MIME-Version: 1.0
In-Reply-To: <4d3de5b4c36ea67135d898d982891a7913478d9d.1508231063.git-series.maxime.ripard@free-electrons.com>
References: <cover.fe3d65d1ee05a55224d26e7d113388c428592b26.1508231063.git-series.maxime.ripard@free-electrons.com>
 <4d3de5b4c36ea67135d898d982891a7913478d9d.1508231063.git-series.maxime.ripard@free-electrons.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 17 Oct 2017 20:08:49 +0800
Message-ID: <CAGb2v64_WoUgc4=GWwaDWGfoiKyEwPDY0VvD+54V5c9MVSmZtA@mail.gmail.com>
Subject: Re: [PATCH 21/23] arm: dts: sun8i: a711: Add regulator support
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Priit Laes <plaes@plaes.org>, Icenowy Zheng <icenowy@aosc.io>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Quentin Schulz <quentin.schulz@free-electrons.com>,
        Mylene Josserand <mylene.josserand@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Oct 17, 2017 at 5:06 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:

No description?

> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts | 163 +++++++++++++++++++++--
>  1 file changed, 154 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts b/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
> index 723641f56a74..98dc0c22160b 100644
> --- a/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
> +++ b/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts

[...]

> +&reg_dldo2 {
> +       regulator-min-microvolt = <2800000>;
> +       regulator-max-microvolt = <4200000>;
> +       regulator-name = "vcc-mipi";

Is this connected to anything? The wide voltage range
is kind of fishy.

[...]

> @@ -193,7 +338,7 @@
>  };
>
>  &usbphy {
> -       usb1_vbus_supply = <&reg_vcc5v0>;
> -       usb2_vbus_supply = <&reg_vcc5v0>;
> +       usb1_vbus_supply = <&reg_vmain>;
> +       usb2_vbus_supply = <&reg_vmain>;

I wonder why this wasn't done earlier.


Regards
ChenYu
