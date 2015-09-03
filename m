Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Kevin Hilman <khilman@kernel.org>
To: Leo Yan <leo.yan@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
	Zhangfei Gao <zhangfei.gao@linaro.org>,
	Bintian Wang <bintian.wang@huawei.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH] clk: Hi6220: separately build stub clock driver
References: <1441162667-25532-1-git-send-email-leo.yan@linaro.org>
Date: Thu, 03 Sep 2015 09:01:03 -0700
In-Reply-To: <1441162667-25532-1-git-send-email-leo.yan@linaro.org> (Leo Yan's
	message of "Wed, 2 Sep 2015 10:57:47 +0800")
Message-ID: <7h7fo7pk5c.fsf@deeprootsystems.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Leo Yan <leo.yan@linaro.org> writes:

> The previous code, kernel builds Hi6220's common clock driver and stub
> clock driver together. Stub clock driver has introduced the dependency
> with CONFIG_MAILBOX, so kernel will not build Hi6220's common clock
> driver due ARM64's defconfig have not enabled CONFIG_MAILBOX by default.
>
> So separately build stub clock driver and common clock driver for
> Hi6220; and only let stub clock driver has the dependency with
> CONFIG_MAILBOX.
>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>

Tested-by: Kevin Hilman <khilman@linaro.org>

I verifed that this patch on top of next-20150902  fixes the hikey boot
failure I was seeing.

Kevin
