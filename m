Return-Path: <dongas86@gmail.com>
Return-Path: <dongas86@gmail.com>
Date: Thu, 13 Apr 2017 21:58:28 +0800
From: Dong Aisheng <dongas86@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org,
	leonard.crestez@nxp.com, ping.bai@nxp.com, anson.huang@nxp.com,
	viresh.kumar@linaro.org, mturquette@baylibre.com, rjw@rjwysocki.net,
	linux-kernel@vger.kernel.org, broonie@kernel.org,
	octavian.purdila@nxp.com, kernel@pengutronix.de,
	fabio.estevam@nxp.com, yibin.gong@nxp.com, shawnguo@kernel.org,
	sboyd@codeaurora.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 0/3] clk: introduce clk_bulk_get accessories
Message-ID: <20170413135828.GA24254@b29396-OptiPlex-7040>
References: <1491969809-20154-1-git-send-email-aisheng.dong@nxp.com>
 <86200633-8349-f1c3-f4d8-a130a26381f7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <86200633-8349-f1c3-f4d8-a130a26381f7@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Apr 11, 2017 at 10:01:29AM -0700, Florian Fainelli wrote:
...
> > This is a RFC patch intending to bring up the idea to discuss.
> > 
> > Comments are welcome and appreciated!
> 
> Thanks a lot for doing this, we have historically done something similar
> on ARCH_BRCMSTB platforms in our downstream tree with a concept of a
> "software" clock which has multiple parents (yikes), using the bulk
> accessors would essentially allow us to remove part of this hack, so I
> am all in favor of this!

Glad to see someone else has the same idea! :-)

Thanks for the supporting!

Regards
Dong Aisheng
