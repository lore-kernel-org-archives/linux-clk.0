Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Thu, 26 Jan 2017 16:27:50 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: martin@kaiser.cx
Subject: Re: [PATCH v2] clk: samsung: mark s3c...._clk_sleep_init() as __init
Message-ID: <20170127002750.GC8801@codeaurora.org>
References: <1485293599-23581-1-git-send-email-martin@kaiser.cx>
 <1485380545-24815-1-git-send-email-martin@kaiser.cx>
MIME-Version: 1.0
In-Reply-To: <1485380545-24815-1-git-send-email-martin@kaiser.cx>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: linux-samsung-soc@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

On 01/25, martin@kaiser.cx wrote:
> From: Martin Kaiser <martin@kaiser.cx>
> 
> These functions are referencing s3c...._clk_regs[], which are marked as
> __initdata. When compiling with CONFIG_DEBUG_SECTION_MISMATCH=y, this
> produces warnings like
> 
> WARNING: vmlinux.o(.text+0x198350):
> Section mismatch in reference from the function s3c2410_clk_sleep_init()
> to the (unknown reference) .init.data:(unknown)
> 
> Mark the s3c...._clk_sleep_init() functions as __init in
> order to fix this.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>

Fixes tag?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
