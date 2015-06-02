Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1432565608-26036-1-git-send-email-tomeu.vizoso@collabora.com>
References: <1432565608-26036-1-git-send-email-tomeu.vizoso@collabora.com>
Date: Tue, 2 Jun 2015 10:48:50 +0200
Message-ID: <CACRpkdasLwMfEHGMRd1X3K_DU7NMPreE8TMwqqDTg8k9wj=wJQ@mail.gmail.com>
Subject: Re: [PATCH 00/21] On-demand device registration
From: Linus Walleij <linus.walleij@linaro.org>
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Grant Likely <grant.likely@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?UTF-8?Q?St=C3=A9phane_Marchesin?= <stephane.marchesin@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Alexander Holler <holler@ahsoftware.de>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	dmaengine@vger.kernel.org,
	"open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
	linux-clk@vger.kernel.org,
	"linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
	linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, May 25, 2015 at 4:53 PM, Tomeu Vizoso
<tomeu.vizoso@collabora.com> wrote:

> have looked into ordered probing as a
> better way of solving this than moving nodes around in the DT or playing with
> initcall levels.
>
> While reading the thread [1] that Alexander Holler started with his series to
> make probing order deterministic, it occurred to me that it should be possible
> to achieve the same by registering devices as they are referenced by other
> devices.

This is pretty cool, but a too local solution to a global problem.

Deferred probe and initcall reordering, silly as they may seem,
does not require you to use device tree.

The real solution, which I think I pointed out already when we
added deferred probe, is to put dependency graphs in the drivers
and have the kernel device driver core percolate dependecies by
walking the graph on probing driver, removing driver (usually the
inverse use case), [runtime] suspend and [runtime] resumeing
a driver. Possibly the dependencies will even be different
depending on use case.

This is what systemd is doing in userspace for starting services:
ask for your dependencies and wait for them if they are not
there. So drivers ask for resources and wait for them. It also
needs to be abstract, so for example we need to be able to
hang on regulator_get() until the driver is up and providing that
regulator, and as long as everything is in slowpath it should
be OK. (And vice versa mutatis mutandis for clk, gpio, pin
control, interrupts (!) and DMA channels for example.)


So if this should be solved it should be solved in an abstract way
in the device driver core available for all, then have calls calling
out to DT, ACPI, possibly even PCI or USB (as these
enumerate devices themselves) to obtain a certain
dependency.

Yours,
Linus Walleij
