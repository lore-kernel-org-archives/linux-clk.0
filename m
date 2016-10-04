Return-Path: <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Oct 2016 14:12:51 +0200
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: =?UTF-8?B?TXlsw6huZQ==?= Josserand <mylene.josserand@free-electrons.com>
Cc: vinod.koul@intel.com, maxime.ripard@free-electrons.com, wens@csie.org,
 mturquette@baylibre.com, sboyd@codeaurora.org, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com, lee.jones@linaro.org,
 mark.rutland@arm.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-sunxi@googlegroups.com,
 alexandre.belloni@free-electrons.com
Subject: Re: [PATCH 02/14] clk: ccu-sun8i-a33: Add CLK_SET_RATE_PARENT to
 ac-dig
Message-ID: <20161004141251.4e82378e@free-electrons.com>
In-Reply-To: <8dfe0935d35b8a218ebf39d37113e27289a0de9b.1475571575.git.mylene.josserand@free-electrons.com>
References: <cover.1475569400.git.mylene.josserand@free-electrons.com>
	<8dfe0935d35b8a218ebf39d37113e27289a0de9b.1475571575.git.mylene.josserand@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hello,

On Tue,  4 Oct 2016 11:46:15 +0200, Myl=C3=A8ne Josserand wrote:
> Add the flag CLK_SET_RATE_PARENT to 'ac-dig' clock.

There is no need to repeat the commit title inside the commit log
itself. What would be more useful is to explain *why* this is needed.

Thomas
--=20
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
