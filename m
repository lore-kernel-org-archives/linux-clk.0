Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Kevin Hilman <khilman@kernel.org>,
	Mike Turquette <mturquette@baylibre.com>,
	Doug Anderson <dianders@chromium.org>,
	linux-clk@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Alex Elder <elder@linaro.org>,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Sascha Hauer <kernel@pengutronix.de>,
	Zhangfei Gao <zhangfei.gao@linaro.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Chao Xie <chao.xie@marvell.com>,
	Jason Cooper <jason@lakedaemon.net>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Andrew Bresticker <abrestic@chromium.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Georgi Djakov <georgi.djakov@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Barry Song <baohua@kernel.org>,
	Dinh Nguyen <dinguyen@opensource.altera.com>,
	Viresh Kumar <viresh.linux@gmail.com>,
	Gabriel FERNANDEZ <gabriel.fernandez@st.com>,
	Emilio =?ISO-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Peter De Sc hrijver <pdeschrijver@nvidia.com>,
	Tero Kristo <t-kristo@ti.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Pawel Moll <pawel.moll@arm.com>,
	Michal Simek <michal.simek@xilinx.com>,
	Olof Johansson <olof@lixom.net>,
	Tyler Baker <tyler.baker@linaro.org>
Subject: Re: [PATCH v3 0/2] clk: improve handling of orphan clocks
Date: Wed, 12 Aug 2015 10:26 +0200
Message-ID: <3547940.Og2cC25c4G@diego>
In-Reply-To: <20150811223409.GN2839@codeaurora.org>
References: <1429735986-18592-1-git-send-email-heiko@sntech.de> <20150730100908.GI2564@lukather> <20150811223409.GN2839@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Am Dienstag, 11. August 2015, 15:34:09 schrieb Stephen Boyd:
> On 07/30, Maxime Ripard wrote:
> > On Mon, Jul 27, 2015 at 10:57:33AM +0200, Heiko Stübner wrote:
> > > did this lead anywhere meanwhile.
> > > 
> > > Last I remember the change to orphan handling made sunxi fail, but
> > > I'm still hoping to get this usable at some point :-)
> > 
> > To be honest, I don't know what the current status is. I haven't get
> > any news since that mail.
> > 
> > I started to move a significant portion of our clocks to
> > CLK_OF_DECLARE, but not all of them are (which probably make the
> > situation worse for the time being).
> 
> Sorry, I think we're still waiting for the critical clocks stuff
> to settle down so that Sunxi can use that instead of calling
> clk_prepare_enable() in init code. For now, I've put the first
> patch of the two into clk-next so that we can have proper orphan
> tracking. Hopefully we resolve critical clocks soon so that we
> can merge the defer part.

great :-)

For the defer-part you came up with a better solution than mine anyway, if I 
remember correctly.
