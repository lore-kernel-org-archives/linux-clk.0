Return-Path: <sboyd@codeaurora.org>
Date: Thu, 1 Oct 2015 12:29:29 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Daniel Kurtz <djkurtz@chromium.org>
Cc: James Liao <jamesjj.liao@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mike Turquette <mturquette@baylibre.com>,
	Yingjoe Chen <yingjoe.chen@mediatek.com>,
	Pi-Cheng Chen <pi-cheng.chen@linaro.org>,
	linux-mediatek@lists.infradead.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-clk@vger.kernel.org
Subject: Re: [GIT PULL] clk: mediatek: New clocks support and fixes
Message-ID: <20151001192929.GJ19319@codeaurora.org>
References: <1442915603.24403.2.camel@mtksdaap41>
 <CAGS+omDcsFXZ2AkS9tma_q+MRnsdDmit-nRXLWAcowRTNgXC=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAGS+omDcsFXZ2AkS9tma_q+MRnsdDmit-nRXLWAcowRTNgXC=w@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 09/30, Daniel Kurtz wrote:
> Hi Mike,
> 
> On Tue, Sep 22, 2015 at 5:53 PM, James Liao <jamesjj.liao@mediatek.com> wrote:
> > This is a collection of new Mediatek clocks support and fixes. These
> > patches come from Joe [1], Pi-cheng [2] and me [3], including clock
> > support for subsystems, CPU, GPT and some minor fixes.
> >
> > [1] https://patchwork.kernel.org/patch/6777041/
> > [2] https://patchwork.kernel.org/patch/7174721/
> > [3] https://lkml.org/lkml/2015/8/10/194
> >
> > ----------------------------------------------------------------
> >
> > The following changes since commit 1f93e4a96c9109378204c147b3eec0d0e8100fde:
> >
> >   Linux 4.3-rc2 (2015-09-20 14:32:34 -0700)
> >
> > are available in the git repository at:
> >
> >   https://github.com/jamesjjliao/linux.git v4.3-rc2-clk
> >
> > for you to fetch changes up to 74219612bb7e25e64409171acada05d9949228f2:
> >
> >   arm64: dts: mt8173: Add subsystem clock controller device nodes (2015-07-09 12:58:14 +0800)
> >
> 
> Will this be pulled for 4.3, or is it now destined for 4.4?
> (sorry if you are receiving a duplicate email, the previous had HTML
> and was rejected by the lists)

This won't make v4.3. I see that there's a third pull request
now, with slightly different contents. Why?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
