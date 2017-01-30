Return-Path: <Chris.Packham@alliedtelesis.co.nz>
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
CC: Stephen Boyd <sboyd@codeaurora.org>, Linus Walleij
	<linus.walleij@linaro.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Michael Turquette
	<mturquette@baylibre.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn
	<andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Chris Brand
	<chris.brand@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, "Arnd
 Bergmann" <arnd@arndb.de>, Thierry Reding <treding@nvidia.com>, Sudeep Holla
	<sudeep.holla@arm.com>, Juri Lelli <juri.lelli@arm.com>, Thomas Petazzoni
	<thomas.petazzoni@free-electrons.com>, Laxman Dewangan
	<ldewangan@nvidia.com>, Kalyan Kinthada
	<Kalyan.Kinthada@alliedtelesis.co.nz>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
Subject: Re: [PATCHv5 0/5] Support for Marvell switches with integrated CPUs
Date: Mon, 30 Jan 2017 20:27:58 +0000
Message-ID: <3e0e797ad5bd4747b33f631fcecd3933@svr-chch-ex1.atlnz.lc>
References: <20170127032546.14657-1-chris.packham@alliedtelesis.co.nz>
 <87wpdgwj72.fsf@free-electrons.com> <20170127184745.GD8801@codeaurora.org>
 <f8f6e8db585147d3adb025bed29694ab@svr-chch-ex1.atlnz.lc>
 <87o9yotxuo.fsf@free-electrons.com>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On 31/01/17 03:40, Gregory CLEMENT wrote:=0A=
> Hi Chris,=0A=
>=0A=
> The 5 patches should be available soon (if it is not already the case),=
=0A=
> in the linux-next branch.=0A=
>=0A=
> The clk patch is already there, the 3 arm patch have been merged in my=0A=
> mvebu/for-next branch, and the pinctrl patch is about to be merged in=0A=
> the pinctrl/for-next branch.=0A=
>=0A=
> Gregory=0A=
>=0A=
=0A=
Gregory, Stephen, Linus W, thanks for applying the patches. Numerous =0A=
reviewers thanks for your feedback.=0A=
=0A=
