Return-Path: <afd@ti.com>
Subject: Re: [GIT PULL] On-demand device probing
To: Tim Bird <tim.bird@sonymobile.com>,
        "frowand.list@gmail.com"
	<frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20151018192931.GY14956@sirena.org.uk>
 <20151018193757.GA9147@kroah.com> <20151018195330.GB14956@sirena.org.uk>
 <CAAObsKB2BUZ-smid45wOdAQw6h2yNqCydk+azAFNk69ewHJtZQ@mail.gmail.com>
 <5627B677.5090109@gmail.com> <20151021162758.GP32054@sirena.org.uk>
 <5627D6E0.5020708@gmail.com>
 <CAL_Jsq+FPtCuBnte2HTgbdpNYM=v_kLaCRcOC1kMaCQwVC=5Kw@mail.gmail.com>
 <562808AF.7090406@gmail.com>
 <CAAObsKAkyjdvNOS3+nuT0N9sudUFLsZXFtcm6Y038p+HSdsZsg@mail.gmail.com>
 <20151022144405.GC21861@kroah.com> <562930AB.1070203@gmail.com>
 <562A5602.7000208@sonymobile.com>
CC: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Rob Herring
	<robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
        Russell King
	<linux@arm.linux.org.uk>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>,
        Dan
 Williams <dan.j.williams@intel.com>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Alexandre Courbot <gnurou@gmail.com>,
        Thierry
 Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        =?UTF-8?Q?Terje_Bergstr=c3=b6m?= <tbergstrom@nvidia.com>,
        Stephen Warren
	<swarren@wwwdotorg.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Grant Likely
	<grant.likely@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Sebastian
 Reichel <sre@kernel.org>,
        Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Felipe Balbi <balbi@ti.com>,
        Jingoo Han <jingoohan1@gmail.com>, Lee Jones
	<lee.jones@linaro.org>,
        Jean-Christophe Plagniol-Villard
	<plagnioj@jcrosoft.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
        Linux PWM List
	<linux-pwm@vger.kernel.org>,
        "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>,
        "linux-fbdev@vger.kernel.org"
	<linux-fbdev@vger.kernel.org>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <562D3172.2070303@ti.com>
Date: Sun, 25 Oct 2015 14:45:54 -0500
MIME-Version: 1.0
In-Reply-To: <562A5602.7000208@sonymobile.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 10/23/2015 10:45 AM, Tim Bird wrote:
> I've been worried about DT overhead adding to boot time for a while.
> And IMHO probe deferral is just about the lamest way to solve boot
> order dependencies I can imagine, from a computer science perspective.
> (Well, there's a certain elegance to it, but it's a stupid "make
> everything re-doable, back up and start over, time-wasting" elegance.)
>

It has a bogosort kind of elegance. :)

Also this might be a silly question (I haven't been following this issue
for very long), but as the only place that can really know what devices
depend on each other, in a generic kernel, is the DT (or whatever
abstraction) will we not eventually need to solve this issue there? Could
we just add a "depends-on = <&phandle>;" to nodes when we know they are
needed for our board?
