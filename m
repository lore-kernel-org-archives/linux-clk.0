Return-Path: <moinejf@free.fr>
Date: Wed, 21 Oct 2015 08:15:19 +0200
From: Jean-Francois Moine <moinejf@free.fr>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Mark Brown <broonie@kernel.org>, "linux-fbdev@vger.kernel.org"
 <linux-fbdev@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>, Michael
 Turquette <mturquette@baylibre.com>, dri-devel
 <dri-devel@lists.freedesktop.org>, Liam Girdwood <lgirdwood@gmail.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Frank Rowand
 <frowand.list@gmail.com>, linux-clk@vger.kernel.org, Russell King
 <linux@arm.linux.org.uk>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>,
 Linux PWM List <linux-pwm@vger.kernel.org>, Kishon Vijay Abraham I
 <kishon@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Alan Stern
 <stern@rowland.harvard.edu>, Grant Likely <grant.likely@linaro.org>,
 Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre
 Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org"
 <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org"
 <linux-tegra@vger.kernel.org>, Terje =?UTF-8?B?QmVyZ3N0csO2bQ==?=
 <tbergstrom@nvidia.com>, Dan Williams <dan.j.williams@intel.com>, Tomeu
 Vizoso <tomeu.vizoso@collabora.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "linux-pm@vger.kernel.org"
 <linux-pm@vger.kernel.org>, Linux USB List <linux-usb@vger.kernel.org>,
 Stephen Boyd <sboyd@codeaurora.org>, Sebastian Reichel <sre@kernel.org>,
 Felipe Balbi <balbi@ti.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Vinod Koul <vinod.koul@intel.com>, Jingoo
 Han <jingoohan1@gmail.com>, dmaengine@vger.kernel.org, David Woodhouse
 <dwmw2@infradead.org>
Subject: Re: [GIT PULL] On-demand device probing
Message-ID: <20151021081519.13fa548a@OPI2>
In-Reply-To: <23698237.227MziouDO@vostro.rjw.lan>
References: <CAAObsKChQN4gg91dCWJS_Co_MrYyBrB1J7gxgGo4hsPXNZRp3g@mail.gmail.com>
	<Pine.LNX.4.44L0.1510201311260.1855-100000@iolanthe.rowland.org>
	<20151020193528.GE32054@sirena.org.uk>
	<23698237.227MziouDO@vostro.rjw.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Sorry to enter this thread a bit late.

About the number of probe deferred messages, I proposed a simple patch to
reduce them:

	https://lkml.org/lkml/2013/8/20/218

I was wondering how many messages this patch could save...

--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
