Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:50186 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967924AbeE3H15 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 May 2018 03:27:57 -0400
Subject: Re: [PATCH v3 3/5] Documentation: DT: add i.MX EPIT timer binding
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
        Colin Didier <colin.didier@devialet.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20180529170436.22711-1-peron.clem@gmail.com>
 <20180529170436.22711-4-peron.clem@gmail.com>
CC: Fabio Estevam <fabio.estevam@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        =?UTF-8?Q?Cl=c3=a9ment_Peron?= <clement.peron@devialet.com>
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Message-ID: <7f2f8b6b-b7f6-99c1-fc5f-a7628a751fdc@mentor.com>
Date: Wed, 30 May 2018 10:27:51 +0300
MIME-Version: 1.0
In-Reply-To: <20180529170436.22711-4-peron.clem@gmail.com>
Content-Type: text/plain; charset="utf-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Clément,

On 05/29/2018 08:04 PM, Clément Péron wrote:
> From: Clément Peron <clement.peron@devialet.com>
> 
> Add devicetree binding document for NXP's i.MX SoC specific
> EPIT timer driver.
> 
> Signed-off-by: Clément Peron <clement.peron@devialet.com>
> ---
>  .../devicetree/bindings/clock/imx6q,epit.txt  | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/imx6q,epit.txt
> 
> diff --git a/Documentation/devicetree/bindings/clock/imx6q,epit.txt b/Documentation/devicetree/bindings/clock/imx6q,epit.txt
> new file mode 100644
> index 000000000000..a84a60c6ae35
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/imx6q,epit.txt

The file should be renamed to a more generic name like 'imx,epit.txt'
or 'imx31,epit.txt'.

Also note that the folder is incorrectly selected, it must be
Documentation/devicetree/bindings/timer/

> @@ -0,0 +1,24 @@
> +Binding for the i.MX6 EPIT timer

Let's change it to 'Binding for the i.MX EPIT timer'.

> +
> +This binding uses the common clock binding[1].
> +
> +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> +
> +Required properties:
> +- compatible: should be "fsl,imx6q-epit"

Compatible should be "fsl,imx31-epit", i.MX31 SoC seems to be the first
one in the series, which has the timer module.

There should be added more compatibles specific to later SoC versions.

> +- reg: physical base address of the controller and length of memory mapped
> +  region.
> +- interrupts: Should contain EPIT controller interrupt
> +- clocks: list of clock specifiers, must contain an entry for each required
> +  entry in clock-names
> +- clock-names : should include entries "ipg", "per"
> +
> +Example:
> +	epit1: epit@20d0000 {
> +		compatible = "fsl,imx6q-epit";

For i.MX6Q example a list of compatibles should be updated like

	compatible = "fsl,imx6q-epit", "fsl,imx31-epit";

> +		reg = <0x020d0000 0x4000>;
> +		interrupts = <0 56 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&clks IMX6QDL_CLK_EPIT1>,
> +			<&clks IMX6QDL_CLK_IPG_PER>;
> +		clock-names = "ipg", "per";

It looks like "ipg" and "per" clocks are swapped, please double check it.

> +	};
> 

--
With best wishes,
Vladimir
