Return-Path: <robert.jarzmik@free.fr>
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Heiko Stuebner <heiko@sntech.de>
Cc: mturquette@linaro.org,  sboyd@codeaurora.org,  dianders@chromium.org,  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,  Boris Brezillon <boris.brezillon@free-electrons.com>,  Alex Elder <elder@linaro.org>,  Alexandre Belloni <alexandre.belloni@free-electrons.com>,  Stephen Warren <swarren@wwwdotorg.org>,  Max Filippov <jcmvbkbc@gmail.com>,  kernel@pengutronix.de,  Zhangfei Gao <zhangfei.gao@linaro.org>,  Santosh Shilimkar <ssantosh@kernel.org>,  Chao Xie <chao.xie@marvell.com>,  Jason Cooper <jason@lakedaemon.net>,  Stefan Wahren <stefan.wahren@i2se.com>,  Andrew Bresticker <abrestic@chromium.org>,  Georgi Djakov <georgi.djakov@linaro.org>,  Sylwester Nawrocki <s.nawrocki@samsung.com>,  Geert Uytterhoeven <geert+renesas@glider.be>,  Barry Song <baohua@kernel.org>,  Dinh Nguyen <dinguyen@opensource.altera.com>,  Viresh Kumar <viresh.linux@gmail.com>,  Gabriel FERNANDEZ <gabriel.fernandez@st.com>,  emilio@elopez.com.ar,  Peter De Schrijver <pdeschrijver@nvidia.com>,  Tero Kristo <t-kristo@ti.com>,  Ulf Hansson <ulf.hansson@linaro.org>,  Pawel Moll <pawel.moll@arm.com>,  Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v3 0/2] clk: improve handling of orphan clocks
References: <1429735986-18592-1-git-send-email-heiko@sntech.de>
Date: Sun, 26 Apr 2015 21:58:16 +0200
In-Reply-To: <1429735986-18592-1-git-send-email-heiko@sntech.de> (Heiko
	Stuebner's message of "Wed, 22 Apr 2015 22:53:04 +0200")
Message-ID: <87pp6qk6g7.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Heiko Stuebner <heiko@sntech.de> writes:

> Using orphan clocks can introduce strange behaviour as they don't have
> rate information at all and also of course don't track
Ok, everything works as before on some pxa platforms.

As pxa clocks support is not even fully mainline, this test is not the best you
could get.

Cheers.

-- 
Robert
