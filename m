Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Thu, 20 Jul 2017 14:12:12 +0100
From: Russell King - ARM Linux <linux@armlinux.org.uk>
To: Mark Brown <broonie@kernel.org>
Cc: Oleksij Rempel <ore@pengutronix.de>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        devicetree@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>,
        kernel@pengutronix.de, Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH v6 0/6] provide power off support for iMX6 with external
 PMIC
Message-ID: <20170720131212.GZ31807@n2100.armlinux.org.uk>
References: <20170620140910.7568-1-o.rempel@pengutronix.de>
 <c64ce8db-eea6-3709-9c97-fda16e93481a@pengutronix.de>
 <20170720123701.d5zyhbevyic3odxk@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170720123701.d5zyhbevyic3odxk@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jul 20, 2017 at 01:37:01PM +0100, Mark Brown wrote:
> On Tue, Jul 18, 2017 at 06:53:54AM +0200, Oleksij Rempel wrote:
> > Hallo all,
> > 
> > Here Gentle Ping to the Old King
> > 
> > DT is already ACKed.
> 
> Please don't send content free pings and please allow a reasonable time
> for review.  People get busy, go on holiday, attend conferences and so 
> on so unless there is some reason for urgency (like critical bug fixes)
> please allow at least a couple of weeks for review.  If there have been
> review comments then people may be waiting for those to be addressed.
> 
> Sending content free pings adds to the mail volume (if they are seen at
> all) which is often the problem and since they can't be reviewed
> directly if something has gone wrong you'll have to resend the patches
> anyway, though there are some other maintainers who like them - if in
> doubt look at how patches for the subsystem are normally handled.

It also doesn't help that there's little context about who Oleksij is
expecting a reply from.  There's 11 individuals in the To: header.
Is the reference above refering to me?  Shrug, I don't know.  I doubt
it because I'm not maintaining the imx6 SoC support.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
