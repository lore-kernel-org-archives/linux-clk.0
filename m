Return-Path: <eddie.huang@mediatek.com>
Message-ID: <1443749391.7213.10.camel@mtksdaap41>
Subject: Re: [GIT PULL] clk: mediatek: New clocks support and fixes
From: Eddie Huang <eddie.huang@mediatek.com>
To: Stephen Boyd <sboyd@codeaurora.org>
CC: Daniel Kurtz <djkurtz@chromium.org>, James Liao
	<jamesjj.liao@mediatek.com>, Mike Turquette <mturquette@baylibre.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Pi-Cheng
 Chen <pi-cheng.chen@linaro.org>, <linux-clk@vger.kernel.org>
Date: Fri, 2 Oct 2015 09:29:51 +0800
In-Reply-To: <20151001192929.GJ19319@codeaurora.org>
References: <1442915603.24403.2.camel@mtksdaap41>
	 <CAGS+omDcsFXZ2AkS9tma_q+MRnsdDmit-nRXLWAcowRTNgXC=w@mail.gmail.com>
	 <20151001192929.GJ19319@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Return-Path: eddie.huang@mediatek.com
List-ID: <linux-clk.vger.kernel.org>

On Thu, 2015-10-01 at 12:29 -0700, Stephen Boyd wrote:
> On 09/30, Daniel Kurtz wrote:
> > Hi Mike,
> > 
> > On Tue, Sep 22, 2015 at 5:53 PM, James Liao <jamesjj.liao@mediatek.com> wrote:
> > > This is a collection of new Mediatek clocks support and fixes. These
> > > patches come from Joe [1], Pi-cheng [2] and me [3], including clock
> > > support for subsystems, CPU, GPT and some minor fixes.
> > >
> > > [1] https://patchwork.kernel.org/patch/6777041/
> > > [2] https://patchwork.kernel.org/patch/7174721/
> > > [3] https://lkml.org/lkml/2015/8/10/194
> > >
> > > ----------------------------------------------------------------
> > >
> > > The following changes since commit 1f93e4a96c9109378204c147b3eec0d0e8100fde:
> > >
> > >   Linux 4.3-rc2 (2015-09-20 14:32:34 -0700)
> > >
> > > are available in the git repository at:
> > >
> > >   https://github.com/jamesjjliao/linux.git v4.3-rc2-clk
> > >
> > > for you to fetch changes up to 74219612bb7e25e64409171acada05d9949228f2:
> > >
> > >   arm64: dts: mt8173: Add subsystem clock controller device nodes (2015-07-09 12:58:14 +0800)
> > >
> > 
> > Will this be pulled for 4.3, or is it now destined for 4.4?
> > (sorry if you are receiving a duplicate email, the previous had HTML
> > and was rejected by the lists)
> 
> This won't make v4.3. I see that there's a third pull request
> now, with slightly different contents. Why?
> 

Sorry not explain in pull request mail. Third pull request remove two
patches:

1. arm64: dts: mt8173: Add subsystem clock controller device nodes
   I think this should pull by Matthias, so I suggest James remove this
patch.

2. clk: mediatek: Export CPU mux clocks for CPU frequency control
   Mike said this patch is ok before
(http://lists.infradead.org/pipermail/linux-arm-kernel/2015-August/364886.html) 
But he told Pi-cheng recently he is working on coordinate clock rate, he
suggest Pi-cheng change this patch, other patches are ok. So James
remove this patch.

Eddie
Thanks
