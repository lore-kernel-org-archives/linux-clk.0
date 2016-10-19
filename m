Return-Path: <sboyd@codeaurora.org>
Date: Tue, 18 Oct 2016 17:05:26 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>,
	Joshua Clayton <stillcompiling@gmail.com>,
	Sascha Hauer <kernel@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Ranjani Vaidyanathan <Ranjani.Vaidyanathan@nxp.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Charles.Kang" <Charles.Kang@advantech.com.tw>,
	Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org,
	Akshay Bhat <akshay.bhat@timesys.com>
Subject: Re: [PATCH 3/3] clk: imx6: Fix procedure to switch the parent of
 LDB_DI_CLK
Message-ID: <20161019000526.GR8871@codeaurora.org>
References: <1474036587-13819-1-git-send-email-fabio.estevam@nxp.com>
 <1474036587-13819-3-git-send-email-fabio.estevam@nxp.com>
 <CAOMZO5D7=A=ms_iq1D+Fgg4wKpRx-aScm5V=avxRPu62rFymzQ@mail.gmail.com>
 <20161019000101.GQ8871@codeaurora.org>
 <CAOMZO5Ae_cB3BiqckAiOyaJPd2HWELkR8hVjEKHbY1nVOAeMxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAOMZO5Ae_cB3BiqckAiOyaJPd2HWELkR8hVjEKHbY1nVOAeMxQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 10/18, Fabio Estevam wrote:
> Hi Stephen,
> 
> On Tue, Oct 18, 2016 at 10:01 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> 
> > Urgh, sorry I missed this one and then we got too close to the
> > merge window to keep applying things and I was traveling for a
> > bit. Is this a bug that's urgent and needs to be fixed to keep
> > these boards working in the v4.9-rc series? Does it need to go
> > back to stable? The change is fairly large, so we might be able
> > to put it into clk-fixes for -rc2, but it would need some
> > justification and preferably a stable/fixes tag.
> >
> > Also, what about the other two patches in this series?
> 
> Yesterday I resent this series based on linux-next, so if you could
> apply them to clk-next that would be great.
> 

Ok that makes it easy. Thanks.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
