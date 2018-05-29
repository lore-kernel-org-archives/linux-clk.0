Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:40101 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935212AbeE2PPF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 May 2018 11:15:05 -0400
MIME-Version: 1.0
In-Reply-To: <20180529150455.17300-4-peron.clem@gmail.com>
References: <20180529150455.17300-1-peron.clem@gmail.com> <20180529150455.17300-4-peron.clem@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 29 May 2018 12:15:04 -0300
Message-ID: <CAOMZO5CPUcTVkRhLDbBoZ2_WHy0UBOPDvEWBvTDp4DcCEjo6pw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] Documentation: DT: add i.MX EPIT timer binding
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        Colin Didier <colin.didier@devialet.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        =?UTF-8?Q?Cl=C3=A9ment_Peron?= <clement.peron@devialet.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, May 29, 2018 at 12:04 PM, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail=
.com> wrote:
> From: Cl=C3=A9ment Peron <clement.peron@devialet.com>
>
> Add devicetree binding document for NXP's i.MX SoC specific
> EPIT timer driver.
>
> Signed-off-by: Cl=C3=A9ment Peron <clement.peron@devialet.com>
> ---
>  .../devicetree/bindings/clock/imx6q,epit.txt  | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/imx6q,epit.tx=
t
>
> diff --git a/Documentation/devicetree/bindings/clock/imx6q,epit.txt b/Doc=
umentation/devicetree/bindings/clock/imx6q,epit.txt
> new file mode 100644
> index 000000000000..d54d455cebdc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/imx6q,epit.txt
> @@ -0,0 +1,25 @@
> +Binding for the i.MX6 EPIT timer
> +
> +This binding uses the common clock binding[1].
> +
> +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> +
> +Required properties:
> +- compatible: should be "fsl,imx6q-epit"
> +- reg: physical base address of the controller and length of memory mapp=
ed
> +  region.
> +- interrupts: Should contain EPIT controller interrupt
> +- clocks: list of clock specifiers, must contain an entry for each requi=
red
> +  entry in clock-names
> +- clock-names : as described in the clock bindings

Please list the name of each required clock here.

I see that the driver does not request a "ckil" clock.
