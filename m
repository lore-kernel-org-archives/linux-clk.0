Return-Path: <linux+mturquette=baylibre.com@arm.linux.org.uk>
Date: Thu, 22 Oct 2015 16:02:13 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Frank Rowand <frowand.list@gmail.com>,
	Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Vinod Koul <vinod.koul@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alexandre Courbot <gnurou@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	David Airlie <airlied@linux.ie>,
	Terje =?iso-8859-1?Q?Bergstr=F6m?= <tbergstrom@nvidia.com>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Wolfram Sang <wsa@the-dreams.de>,
	Grant Likely <grant.likely@linaro.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	Sebastian Reichel <sre@kernel.org>,
	Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Felipe Balbi <balbi@ti.com>,
	Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
	Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
	Tomi Valkeinen <tomi.valkeinen@ti.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-clk@vger.kernel.org, dmaengine@vger.kernel.org,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	Linux PWM List <linux-pwm@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>
Subject: Re: [GIT PULL] On-demand device probing
Message-ID: <20151022150213.GT32532@n2100.arm.linux.org.uk>
References: <20151018193757.GA9147@kroah.com>
 <20151018195330.GB14956@sirena.org.uk>
 <CAAObsKB2BUZ-smid45wOdAQw6h2yNqCydk+azAFNk69ewHJtZQ@mail.gmail.com>
 <5627B677.5090109@gmail.com>
 <20151021162758.GP32054@sirena.org.uk>
 <5627D6E0.5020708@gmail.com>
 <CAL_Jsq+FPtCuBnte2HTgbdpNYM=v_kLaCRcOC1kMaCQwVC=5Kw@mail.gmail.com>
 <562808AF.7090406@gmail.com>
 <CAAObsKAkyjdvNOS3+nuT0N9sudUFLsZXFtcm6Y038p+HSdsZsg@mail.gmail.com>
 <20151022144405.GC21861@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20151022144405.GC21861@kroah.com>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Oct 22, 2015 at 07:44:05AM -0700, Greg Kroah-Hartman wrote:
> <oops, sent too early...>
> 
> On Thu, Oct 22, 2015 at 11:05:11AM +0200, Tomeu Vizoso wrote:
> > Given that downstreams are already carrying as many hacks as they
> > could think of to speed total boot up, I think this is effectively
> > telling them to go away.
> 
> No I'm not, I'm asking for real data, not hand-wavy-this-is-going-to
> solve-the-random-issue-i'm-having type patch by putting random calls in
> semi-random subsystems all over the kernel.

+100000000000, fully agree.

There's too much verbal diarrhoea going on in this thread and no facts.
I've been waiting for real data too, and there's not one shred of it, or
even a hint that it might appear.  So, the conclusion I'm coming to is
that there isn't any data to back up the claims made in this thread.

If it was such a problem, then in the _eight_ days that this has been
discussed so far, _someone_ would have sent some data showing the
problem.  I think the fact is, there is no data.

Someone prove me wrong.  Someone post the verifiable data showing that
there is a problem to be solved here.

Someone show what the specific failure cases are that are hampering
vendors moving forwards.  Someone show the long boot times by way of
kernel message log.  Someone show some evidence of the problems that
have been alluded to.

If no one can show some evidence, there isn't a problem here. :)

-- 
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
