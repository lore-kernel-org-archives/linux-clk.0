Return-Path: <robh+dt@kernel.org>
MIME-Version: 1.0
In-Reply-To: <baedcf46084db730e4db94e714632399a568b255.1529067662.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1529067662.git.matti.vaittinen@fi.rohmeurope.com> <baedcf46084db730e4db94e714632399a568b255.1529067662.git.matti.vaittinen@fi.rohmeurope.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 15 Jun 2018 15:59:03 -0600
Message-ID: <CAL_JsqJ6nfqDpG9g_Wk-X2DsKpD+xAzFTEmkRmGBEAkLaayEnw@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] mfd: bd71837: Devicetree bindings for ROHM BD71837 PMIC
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee.jones@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Sebastian Reichel <sre@kernel.org>,
	Jianhong Chen <chenjh@rock-chips.com>, Andrey Smirnov <andrew.smirnov@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>, Kate Stewart <kstewart@linuxfoundation.org>,
	"heiko@sntech.de" <heiko@sntech.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-clk <linux-clk@vger.kernel.org>, devicetree@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-input@vger.kernel.org,
	mikko.mutanen@fi.rohmeurope.com, heikki.haikola@fi.rohmeurope.com
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jun 15, 2018 at 7:30 AM, Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:
> Document devicetree bindings for ROHM BD71837 PMIC MFD.
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>  .../devicetree/bindings/mfd/rohm,bd71837-pmic.txt  | 67 ++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.txt

Looks good now. :)

Reviewed-by: Rob Herring <robh@kernel.org>
