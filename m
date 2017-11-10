Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Fri, 10 Nov 2017 15:11:54 -0600
From: Rob Herring <robh@kernel.org>
To: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
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
Subject: Re: [PATCH V4 09/12] clk: sprd: Add dt-bindings include file for
 SC9860
Message-ID: <20171110211154.z2j5emtcdef7xqv2@rob-hp-laptop>
References: <20171110063607.3250-1-chunyan.zhang@spreadtrum.com>
 <20171110063607.3250-10-chunyan.zhang@spreadtrum.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20171110063607.3250-10-chunyan.zhang@spreadtrum.com>
List-ID: <linux-clk.vger.kernel.org>

On Fri, Nov 10, 2017 at 02:36:04PM +0800, Chunyan Zhang wrote:
> This file defines all SC9860 clock indexes, it should be included in the
> device tree in which there's device using the clocks.
> 
> Signed-off-by: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
> ---
>  include/dt-bindings/clock/sprd,sc9860-clk.h | 408 ++++++++++++++++++++++++++++
>  1 file changed, 408 insertions(+)
>  create mode 100644 include/dt-bindings/clock/sprd,sc9860-clk.h

Acked-by: Rob Herring <robh@kernel.org>
