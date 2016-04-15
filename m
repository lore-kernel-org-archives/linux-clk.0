Return-Path: <alexandre.belloni@free-electrons.com>
Date: Fri, 15 Apr 2016 18:24:06 +0200
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Mark Brown <broonie@kernel.org>
Cc: Wadim Egorov <w.egorov@phytec.de>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	rtc-linux@googlegroups.com, linux-rockchip@lists.infradead.org,
	robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
	linux@arm.linux.org.uk, mturquette@baylibre.com,
	sboyd@codeaurora.org, lee.jones@linaro.org, lgirdwood@gmail.com,
	a.zummo@towertech.it, dianders@chromium.org, zyw@rock-chips.com,
	arnd@arndb.de, k.kozlowski@samsung.com, javier@osg.samsung.com,
	kgene@kernel.org, olof@lixom.net, geert+renesas@glider.be,
	sjoerd.simons@collabora.co.uk, treding@nvidia.com,
	public_timo.s@silentcreek.de
Subject: Re: [PATCH 3/6] regulator: rk808: Make rk808 generic, rename
 rk808-regulator.c
Message-ID: <20160415162406.GD25196@piout.net>
References: <1460711790-22646-1-git-send-email-w.egorov@phytec.de>
 <1460711790-22646-4-git-send-email-w.egorov@phytec.de>
 <20160415102602.GE3217@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160415102602.GE3217@sirena.org.uk>
List-ID: <linux-clk.vger.kernel.org>

On 15/04/2016 at 11:26:02 +0100, Mark Brown wrote :
> On Fri, Apr 15, 2016 at 11:16:27AM +0200, Wadim Egorov wrote:
> 
> > This patch just renames the rk808 driver so we can reuse this driver
> > to add more regulator devices from the RK8XX PMIC family later.
> 
> We normally manage to cope fine without renaming things - it's quite
> common to have drivers that were initially named after one part
> supporting multiple parts, avoiding the rename makes things like
> backports easier and avoids needing git log --follow and so on.

I agree with that and I will also add that probably at some point in
time a new part may appear with a name matching rk8xx but may not be
compatible with the rk8xx driver and that is when the real mess starts.

Finally, renaming the config options and the modules is not nice for the
user.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
