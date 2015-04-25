Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Sat, 25 Apr 2015 14:23:39 +0200 (CEST)
From: Stefan Wahren <stefan.wahren@i2se.com>
Reply-To: Stefan Wahren <stefan.wahren@i2se.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Andrew Bresticker <abrestic@chromium.org>,
	linux-clk@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>,
	kernel@pengutronix.de, Georgi Djakov <georgi.djakov@linaro.org>,
	Pawel Moll <pawel.moll@arm.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Viresh Kumar <viresh.linux@gmail.com>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Zhangfei Gao <zhangfei.gao@linaro.org>,
	Barry Song <baohua@kernel.org>, Alex Elder <elder@linaro.org>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	linux-arm-kernel@lists.infradead.org,
	Dinh Nguyen <dinguyen@opensource.altera.com>,
	linux-kernel@vger.kernel.org, emilio@elopez.com.ar,
	dianders@chromium.org, Jason Cooper <jason@lakedaemon.net>,
	Chao Xie <chao.xie@marvell.com>, Tero Kristo <t-kristo@ti.com>,
	Gabriel FERNANDEZ <gabriel.fernandez@st.com>,
	mturquette@linaro.org, sboyd@codeaurora.org
Message-ID: <380631359.469897.1429964620007.JavaMail.open-xchange@oxbaltgw01.schlund.de>
In-Reply-To: <1429735986-18592-1-git-send-email-heiko@sntech.de>
References: <1429735986-18592-1-git-send-email-heiko@sntech.de>
Subject: Re: [PATCH v3 0/2] clk: improve handling of orphan clocks
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Heiko,

> Heiko Stuebner <heiko@sntech.de> hat am 22. April 2015 um 22:53 geschrieben:
>
>
> Using orphan clocks can introduce strange behaviour as they don't have
> rate information at all and also of course don't track
>
> [...]
>
>
> As this changes the behaviour for orphan clocks, it would of course
> benefit from more testing than on my Rockchip boards. To keep the
> recipent-list reasonable and not spam to much I selected one (the topmost)
> from the get_maintainer output of each drivers/clk entry.
> Hopefully some will provide Tested-by-tags :-)
>

excuse me for my naive question, but what kind of tests do you expect (beside
applying the patches)?

Stefan

>
> Thanks
> Heiko
>
