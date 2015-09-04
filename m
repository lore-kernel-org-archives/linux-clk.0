Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 4 Sep 2015 22:41:47 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Kevin Hilman <khilman@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
	Zhangfei Gao <zhangfei.gao@linaro.org>,
	Bintian Wang <bintian.wang@huawei.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH] clk: Hi6220: separately build stub clock driver
Message-ID: <20150904144147.GA3890@leoy-linaro>
References: <1441162667-25532-1-git-send-email-leo.yan@linaro.org>
 <7h7fo7pk5c.fsf@deeprootsystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <7h7fo7pk5c.fsf@deeprootsystems.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, Sep 03, 2015 at 09:01:03AM -0700, Kevin Hilman wrote:
> Leo Yan <leo.yan@linaro.org> writes:
> 
> > The previous code, kernel builds Hi6220's common clock driver and stub
> > clock driver together. Stub clock driver has introduced the dependency
> > with CONFIG_MAILBOX, so kernel will not build Hi6220's common clock
> > driver due ARM64's defconfig have not enabled CONFIG_MAILBOX by default.
> >
> > So separately build stub clock driver and common clock driver for
> > Hi6220; and only let stub clock driver has the dependency with
> > CONFIG_MAILBOX.
> >
> > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> 
> Tested-by: Kevin Hilman <khilman@linaro.org>
> 
> I verifed that this patch on top of next-20150902  fixes the hikey boot
> failure I was seeing.

Thanks, Kevin and Stephen :)
