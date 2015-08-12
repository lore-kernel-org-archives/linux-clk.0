Return-Path: <sboyd@codeaurora.org>
Date: Tue, 11 Aug 2015 17:38:17 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Leo Yan <leo.yan@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will.deacon@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Wei Xu <xuwei5@hisilicon.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Bintian Wang <bintian.wang@huawei.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, Guodong Xu <guodong.xu@linaro.org>,
	Jian Zhang <zhangjian001@hisilicon.com>,
	Zhenwei Wang <Zhenwei.wang@hisilicon.com>,
	Haoju Mo <mohaoju@hisilicon.com>, Dan Zhao <dan.zhao@hisilicon.com>,
	sunzhaosheng@hisilicon.com, victor.lixin@hisilicon.com
Subject: Re: [PATCH v4 0/4] clk: hisilicon: support stub clock
Message-ID: <20150812003817.GI26614@codeaurora.org>
References: <1438673249-6051-1-git-send-email-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1438673249-6051-1-git-send-email-leo.yan@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 08/04, Leo Yan wrote:
> This series adds support for hisilicon stub clock driver. On hi6220,
> the bootloader needs load the firmware image and set info for OPPs;
> after run into kernel, the stub clock driver is used to communicate
> w/t firmware for cpu dynamic frequency scaling.
> 
> In patch series v1/v2, the stub clock driver simply writes request in
> sram and send ipc to firmware; For patch series v3, the firmware has
> been upgraded to use mailbox, so stub clock driver will call standard
> mailbox APIs to request mailbox channel and send message to firmware.
> 
> Patch 4 adds stub clock node into dts and it references mailbox with
> phandle, so patch 4 will depend on mailbox driver's patch series [1].
> These patches have been tested on 96board hikey and is used by cpufreq
> driver.

The To: list is everyone, so I'm not sure who is supposed to
apply these patches. I'd like to take patches 1, 2, and 3 through
the clk tree though.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
