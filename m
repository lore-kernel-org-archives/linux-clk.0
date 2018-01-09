Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1515466276-5541-2-git-send-email-Anson.Huang@nxp.com>
References: <1515466276-5541-1-git-send-email-Anson.Huang@nxp.com> <1515466276-5541-2-git-send-email-Anson.Huang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 9 Jan 2018 07:26:43 -0200
Message-ID: <CAOMZO5DKsgydHaoKrrRngMck_9aQqFja9SParvDiD6V79ryuHg@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] ARM: dts: imx7s: add snvs rtc clock
To: Anson Huang <Anson.Huang@nxp.com>
Cc: Horia Geanta Neag <horia.geanta@nxp.com>, aymen.sghaier@nxp.com,
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
	Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
	Fabio Estevam <fabio.estevam@nxp.com>, Russell King - ARM Linux <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, adriana.reus@nxp.com,
	Stefan Agner <stefan@agner.ch>, Dong Aisheng <dongas86@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-clk@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Anson,

On Tue, Jan 9, 2018 at 12:51 AM, Anson Huang <Anson.Huang@nxp.com> wrote:

> +   - clocks
> +      Usage: required if SNVS LP RTC requires explicit enablement of clocks
> +      Value type: <prop_encoded-array>
> +      Definition:  A list of phandle and clock specifier pairs describing
> +          the clocks required for enabling and disabling SNVS LP RTC.


It is a single clock that is used here, so it would be better to
describe the text as:

      Definition:  A clock specifier describing the clock required for
enabling and disabling SNVS LP RTC

> +   - clock-names
> +      Usage: required if SNVS LP RTC requires explicit enablement of clocks
> +      Value type: <string>
> +      Definition: A list of clock name strings in the same order as the
> +          clocks property.

and here you must describe that the name should be "snvs-rtc":

      Definition: Clock name string should be "snvs-rtc".
