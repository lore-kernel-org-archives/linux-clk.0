Return-Path: <sboyd@codeaurora.org>
Date: Thu, 21 Dec 2017 15:02:32 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will.deacon@arm.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
	Mark Brown <broonie@kernel.org>,
	Xiaolong Zhang <xiaolong.zhang@spreadtrum.com>,
	Ben Li <ben.li@spreadtrum.com>,
	Orson Zhai <orson.zhai@spreadtrum.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [PATCH V7 01/12] drivers: move clock common macros out from
 vendor directories
Message-ID: <20171221230232.GO7997@codeaurora.org>
References: <20171207125715.16160-1-chunyan.zhang@spreadtrum.com>
 <20171207125715.16160-2-chunyan.zhang@spreadtrum.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20171207125715.16160-2-chunyan.zhang@spreadtrum.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/07, Chunyan Zhang wrote:
> These macros are used by more than one SoC vendor platforms, avoid to
> have many copies of these code, this patch moves them to the common
> header file which every clock drivers can access to.
> 
> Signed-off-by: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
