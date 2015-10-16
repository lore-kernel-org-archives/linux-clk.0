Return-Path: <olof@lixom.net>
MIME-Version: 1.0
In-Reply-To: <1444909328-24761-1-git-send-email-tomeu.vizoso@collabora.com>
References: <20151014092644.GO14956@sirena.org.uk>
	<1444909328-24761-1-git-send-email-tomeu.vizoso@collabora.com>
Date: Fri, 16 Oct 2015 14:23:06 -0700
Message-ID: <CAOesGMj44N3Xfv_D_iLEzXBrkN6LXBa-uh6m3fi_F2xDenDhMg@mail.gmail.com>
Subject: Re: [GIT PULL] On-demand device probing
From: Olof Johansson <olof@lixom.net>
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>,
	Dan Williams <dan.j.williams@intel.com>, Linus Walleij <linus.walleij@linaro.org>,
	Alexandre Courbot <gnurou@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
	David Airlie <airlied@linux.ie>, =?UTF-8?Q?Terje_Bergstr=C3=B6m?= <tbergstrom@nvidia.com>,
	Stephen Warren <swarren@wwwdotorg.org>, Wolfram Sang <wsa@the-dreams.de>,
	Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>,
	Kishon Vijay Abraham I <kishon@ti.com>, Sebastian Reichel <sre@kernel.org>,
	Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Felipe Balbi <balbi@ti.com>,
	Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
	Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org,
	"dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	DRI mailing list <dri-devel@lists.freedesktop.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, linux-pwm@vger.kernel.org,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi,

I've bisected boot failures in next-20151016 down to patches in this branch:

On Thu, Oct 15, 2015 at 4:42 AM, Tomeu Vizoso
<tomeu.vizoso@collabora.com> wrote:
> Tomeu Vizoso (20):
>       driver core: handle -EPROBE_DEFER from bus_type.match()

The machine it happened on was OMAP5UEVM:

http://arm-soc.lixom.net/bootlogs/next/next-20151016/omap5uevm-arm-omap2plus_defconfig.html

But I've also seen it on tegra2, that one bisected down to:

>      regulator: core: Probe regulators on demand

http://arm-soc.lixom.net/bootlogs/next/next-20151016/seaboard-arm-multi_v7_defconfig.html



-Olof
