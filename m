Return-Path: <sboyd@codeaurora.org>
Date: Mon, 3 Aug 2015 14:46:03 -0700
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
Subject: Re: [PATCH v3 1/5] clk: hisi: refine parameter checking for init
Message-ID: <20150803214603.GC21068@codeaurora.org>
References: <1438564418-15948-1-git-send-email-leo.yan@linaro.org>
 <1438564418-15948-2-git-send-email-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1438564418-15948-2-git-send-email-leo.yan@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 08/03, Leo Yan wrote:
> *of_iomap()* will check the device node pointer, and if the pointer is
> NULL it will return error code. So refine clock's init flow by checking
> the device node with this simple way; and polish a little for the print
> out message.
> 
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
