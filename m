Return-Path: <daniel@ffwll.ch>
Return-Path: <daniel@ffwll.ch>
Sender: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 31 Jan 2017 22:17:02 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Eric Anholt <eric@anholt.net>, Mark Rutland <mark.rutland@arm.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Rob Herring <robh+dt@kernel.org>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 09/11] drm/panel: Add support for the Raspberry Pi 7"
 Touchscreen.
Message-ID: <20170131211702.o2he5o6ktaztmrkx@phenom.ffwll.local>
References: <20161214194621.16499-1-eric@anholt.net>
 <20161214194621.16499-10-eric@anholt.net>
 <20170131210717.GA872@mithrandir.ba.sec>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170131210717.GA872@mithrandir.ba.sec>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jan 31, 2017 at 10:07:19PM +0100, Thierry Reding wrote:
> On Wed, Dec 14, 2016 at 11:46:19AM -0800, Eric Anholt wrote:
> > +static int rpi_touchscreen_enable(struct drm_panel *panel)
> > +{
> > +	struct rpi_touchscreen *ts = panel_to_ts(panel);
> > +	int i;
> > +
> > +	rpi_touchscreen_i2c_write(ts, REG_POWERON, 1);
> > +	/* Wait for nPWRDWN to go low to indicate poweron is done. */
> > +	for (i = 0; i < 100; i++) {
> > +		if (rpi_touchscreen_i2c_read(ts, REG_PORTB) & 1)
> > +			break;
> > +	}
> 
> Don't you want to fail when power on doesn't succeed? Seems kind of
> pointless to continue if the panel doesn't power on.

kms works under the assumption that even when the sink is dead, the
display pipe (well, vblanks and pageflips) keep working. There's a patch
floating around to give userspace more information about what's going
wrong through an async uevent+read-only property for cases where an
unresponsive sink is normal, i.e. link training for dp.

But either way, continuing is generally the right thing to do, there's no
way to report -EIO from here (because no reasons than that's where
accidentally ended up with our evolved design ...).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
