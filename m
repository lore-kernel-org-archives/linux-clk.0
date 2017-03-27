Return-Path: <dcb314@hotmail.com>
From: David Binderman <dcb314@hotmail.com>
To: "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@codeaurora.org" <sboyd@codeaurora.org>, "rjui@broadcom.com"
	<rjui@broadcom.com>, "sbranden@broadcom.com" <sbranden@broadcom.com>,
	"jonmason@broadcom.com" <jonmason@broadcom.com>,
	"bcm-kernel-feedback-list@broadcom.com"
	<bcm-kernel-feedback-list@broadcom.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: drivers/clk/bcm/clk-iproc-pll.c:280]: (style) Redundant condition
Date: Mon, 27 Mar 2017 10:47:11 +0000
Message-ID: <HE1PR0801MB186548205AD0A49B09F6A3149C330@HE1PR0801MB1865.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Hello there,


linux-4.11-rc4/drivers/clk/bcm/clk-iproc-pll.c:280]: (style) Redundant cond=
ition: If 'rate >=3D 2200000000', the comparison 'rate' is always true.

Source code is

    } else if (rate >=3D VCO_HIGH && rate && rate < VCO_HIGH_HIGH) {

Suggest new code

    } else if (rate >=3D VCO_HIGH  && rate < VCO_HIGH_HIGH) {

Regards

David Binderman
