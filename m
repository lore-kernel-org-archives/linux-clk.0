Return-Path: <leo.yan@linaro.org>
Return-Path: <leo.yan@linaro.org>
Date: Wed, 17 Jan 2018 15:58:55 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
	"Wangtao (Kevin, Kirin)" <kevin.wangtao@hisilicon.com>,
	Wei Yongjun <weiyongjun1@huawei.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Kaihua Zhong <zhongkaihua@huawei.com>,
	Ruyi Wang <wangruyi@huawei.com>, Kai Zhao <zhaokai1@hisilicon.com>,
	linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH -next] clk: =?utf-8?Q?hisilicon?=
 =?utf-8?B?OiBoaTM2NjDvvJpGaQ==?= =?utf-8?Q?x?= potential NULL dereference in
 hi3660_stub_clk_probe()
Message-ID: <20180117075855.GB1800@leoy-linaro>
References: <1515047794-170174-1-git-send-email-weiyongjun1@huawei.com>
 <CAK7LNAQXTg=A6udMPs4dptbaLz1U5+D4JBJaW0W8d_EgH_R1_A@mail.gmail.com>
 <20180105084004.GC26855@leoy-linaro>
 <7454cc50-7b92-2531-4261-45bd1703f1fb@hisilicon.com>
 <CAK7LNAQcieqS0vrGKrtr3paQADpG0GEM_k9zPdLiKF8ykv5PaA@mail.gmail.com>
 <20180108042235.GA21618@leoy-ThinkPad-T440>
 <20180110224820.GH28313@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180110224820.GH28313@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Jan 10, 2018 at 02:48:20PM -0800, Stephen Boyd wrote:
> On 01/08, Leo Yan wrote:
> > 
> > I verified Yongjun patch v2 for using devm_ioremap_resource(), just as
> > Kevin mentioned after using devm_ioremap_resource() the kernel has
> > memory mapping conflict between stub clock driver and mailbox driver.
> > 
> > Following Masahiro suggestion, I changed the stub clock driver to use
> > syscon & regmap to access the memory, I can confirm this can work
> > well, you could review in below change.
> > 
> > But this change should note two things, one thing is it is dependent on
> > mailbox driver upstreaming, so I prefer we can commit one patch for this
> > change along with mailbox driver patch set; the second thing is we
> > need change DT binding document.
> > 
> > If you have any better solution for this, also very welcome.
> > 
> 
> So I'll apply the original patch it sounds like.

Thanks for this and it's good for me, this is simple way to fix the
NULL checking issue.

Thanks,
Leo Yan
