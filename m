Return-Path: <robh+dt@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1445268580.53393.183.camel@infradead.org>
References: <561E1378.6000906@collabora.com> <20151017065750.GA18607@kroah.com>
 <20151018192931.GY14956@sirena.org.uk> <20151018193757.GA9147@kroah.com>
 <20151018195330.GB14956@sirena.org.uk> <1445247881.53393.146.camel@infradead.org>
 <CAL_JsqKehmSobpbdeXGo=-1pAbtrhCHovyyCWya_MNOhGCi8CQ@mail.gmail.com>
 <1445258870.53393.173.camel@infradead.org> <20151019145048.GI14956@sirena.org.uk>
 <1445268580.53393.183.camel@infradead.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 19 Oct 2015 10:58:25 -0500
Message-ID: <CAL_JsqLwvc1H9kQnWs=mA8P4Mq4izmSSeFU6KRtkExBkzF9ABg@mail.gmail.com>
Subject: Re: [GIT PULL] On-demand device probing
To: David Woodhouse <dwmw2@infradead.org>
Cc: Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>, Russell King <linux@arm.linux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
	=?UTF-8?Q?Terje_Bergstr=C3=B6m?= <tbergstrom@nvidia.com>,
	Stephen Warren <swarren@wwwdotorg.org>, Wolfram Sang <wsa@the-dreams.de>,
	Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>,
	Kishon Vijay Abraham I <kishon@ti.com>, Sebastian Reichel <sre@kernel.org>,
	Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Felipe Balbi <balbi@ti.com>,
	Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
	Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org,
	dmaengine@vger.kernel.org,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Linux PWM List <linux-pwm@vger.kernel.org>,
	Linux USB List <linux-usb@vger.kernel.org>,
	"linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Mon, Oct 19, 2015 at 10:29 AM, David Woodhouse <dwmw2@infradead.org> wro=
te:
> On Mon, 2015-10-19 at 15:50 +0100, Mark Brown wrote:
>> > But the point I'm making is that we are working towards *fixing* that,
>> > and *not* using DT-specific code in places where we should be using th=
e
>> > generic APIs.
>>
>> What is the plan for fixing things here?  It's not obvious (at least to
>> me) that we don't want to have the subsystems having knowledge of how
>> they are bound to a specific firmware which is what you seem to imply
>> here.
>
> I don't know that there *is* a coherent plan here to address it all.
>
> Certainly, we *will* need subsystems to have firmware-specific
> knowledge in some cases. Take GPIO as an example; ACPI *has* a way to
> describe GPIO, and properties which reference GPIO pins are intended to
> work through that =E2=80=94 while in DT, properties which reference GPIO =
pins
> will have different contents. They'll be compatible at the driver
> level, in the sense that there's a call to get a given GPIO given the
> property name, but the subsystems *will* be doing different things
> behind the scenes.
>
> My plan, such as it is, is to go through the leaf-node drivers which
> almost definitely *should* be firmware-agnostic, and convert those. And
> then take stock of what we have left, and work out what, if anything,
> still needs to be done.

Many cases are already agnostic in the drivers in terms of the *_get()
functions. Some are DT specific, but probably because those subsystems
are new and DT only. In any case, I don't think these 1 line changes
do anything to make doing conversions here harder.

>> It seems like we're going to have to refactor these bits of code when
>> they get generalised anyway so I'm not sure that the additional cost
>> here is that big.
>
> That's an acceptable answer =E2=80=94 "we're adding legacy code here but =
we
> know it's going to be refactored anyway". If that's true, all it takes
> is a note in the commit comment to that effect. That's different from
> having not thought about it :)

Considering at one point we did create a fwnode based API, we did
think about it. Plus there was little input from ACPI folks as to
whether the change was even useful for ACPI case. In any case, we're
talking about adding 1 line.

Rob
