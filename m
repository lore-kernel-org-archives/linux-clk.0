Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1512984414.334.10.camel@baylibre.com>
Subject: Re: [PATCH v6 4/6] clk: meson: make the spinlock naming more
 specific
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yixun Lan <yixun.lan@amlogic.com>, Neil Armstrong
 <narmstrong@baylibre.com>,  Kevin Hilman <khilman@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@codeaurora.org>, Carlo Caione <carlo@caione.org>,  Qiufang Dai
 <qiufang.dai@amlogic.com>, Jian Hu <jian.hu@amlogic.com>,
 linux-amlogic@lists.infradead.org,  devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Mon, 11 Dec 2017 10:26:54 +0100
In-Reply-To: <20171211064853.32111-5-yixun.lan@amlogic.com>
References: <20171211064853.32111-1-yixun.lan@amlogic.com>
	 <20171211064853.32111-5-yixun.lan@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Mon, 2017-12-11 at 14:48 +0800, Yixun Lan wrote:
> Make the spinlock more specific, so better for lockdep
> debugging and ctags/grep.
> 
> Suggested-by: Stephen Boyd <sboyd@codeaurora.org>
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>

Yixun,

This change is not related to the main task describe in the cover letter.
Next time, please send it after your series, or before as a dependency to avoid
mixing topics

Thanks
Jerome
