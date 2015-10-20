Return-Path: <stern+5638bce2@rowland.harvard.edu>
Date: Tue, 20 Oct 2015 10:40:03 -0400 (EDT)
From: Alan Stern <stern@rowland.harvard.edu>
To: Rob Herring <robh@kernel.org>
cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
    David Woodhouse <dwmw2@infradead.org>, Mark Brown <broonie@kernel.org>,
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
    Tomeu Vizoso <tomeu.vizoso@collabora.com>,
    Russell King <linux@arm.linux.org.uk>,
    Michael Turquette <mturquette@baylibre.com>,
    Stephen Boyd <sboyd@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>,
    Dan Williams <dan.j.williams@intel.com>,
    Linus Walleij <linus.walleij@linaro.org>,
    Alexandre Courbot <gnurou@gmail.com>,
    Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
    =?UTF-8?Q?Terje_Bergstr=C3=B6m?= <tbergstrom@nvidia.com>,
    Stephen Warren <swarren@wwwdotorg.org>, Wolfram Sang <wsa@the-dreams.de>,
    Frank Rowand <frowand.list@gmail.com>,
    Grant Likely <grant.likely@linaro.org>,
    Kishon Vijay Abraham I <kishon@ti.com>, Sebastian Reichel <sre@kernel.org>,
    Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
    Liam Girdwood <lgirdwood@gmail.com>, Felipe Balbi <balbi@ti.com>,
    Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
    Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
    Tomi Valkeinen <tomi.valkeinen@ti.com>,
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
     <linux-clk@vger.kernel.org>,  <dmaengine@vger.kernel.org>,
    "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
    dri-devel <dri-devel@lists.freedesktop.org>,
    "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
    "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
    "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
    "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
    Linux PWM List <linux-pwm@vger.kernel.org>,
    Linux USB List <linux-usb@vger.kernel.org>,
    "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>
Subject: Re: [GIT PULL] On-demand device probing
In-Reply-To: <CAL_JsqJuu5_Osqi+X6M6UeRDZFQB+_8riYDF1gvsGayk5-4SFw@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.1510201036290.1855-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

On Tue, 20 Oct 2015, Rob Herring wrote:

> > The probe ordering is not the entire picture, though.
> >
> > Even if you get the probe ordering right, the problem is going to show up in
> > multiple other places: system suspend/resume, runtime PM, system shutdown,
> > unbinding of drivers.  In all of those cases it is necessary to handle things
> > in a specific order if there is a dependency.
> 
> My understanding was with deferred probe that it also solves suspend
> ordering problems because things are suspended in reverse order of
> probing.

Devices are suspended in reverse order of _registration_.  Not of 
probing.

Furthermore, that applies only to devices that use synchronous suspend.  
Async suspend is becoming common, and there the only restrictions are 
parent-child relations plus whatever explicit requirements that drivers 
impose by calling device_pm_wait_for_dev().

Alan Stern
