Return-Path: <sboyd@codeaurora.org>
Message-ID: <555F80BE.8070204@codeaurora.org>
Date: Fri, 22 May 2015 12:17:18 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
To: Brent Wang <wangbintian@gmail.com>
CC: Bintian <bintian.wang@huawei.com>,
 Mike Turquette <mturquette@linaro.org>,
 Zhangfei Gao <zhangfei.gao@linaro.org>, Xu Wei <xuwei5@hisilicon.com>,
 "xuejiancheng@huawei.com" <xuejiancheng@huawei.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 "sledge.yanwei@huawei.com" <sledge.yanwei@huawei.com>,
 linux-clk@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Will Deacon <will.deacon@arm.com>,
 Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@linaro.org>, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Haojian Zhuang <haojian.zhuang@linaro.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Olof Johansson <olof@lixom.net>, Haifeng Yan <yanhaifeng@gmail.com>,
 Russell King - ARM Linux <linux@arm.linux.org.uk>,
 Guodong Xu <guodong.xu@linaro.org>,
 Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
 Tyler Baker <tyler.baker@linaro.org>, Kevin Hilman <khilman@kernel.org>,
 "xuyiping@hisilicon.com" <xuyiping@hisilicon.com>,
 "wangbinghui@hisilicon.com" <wangbinghui@hisilicon.com>,
 "zhenwei.wang@hisilicon.com" <zhenwei.wang@hisilicon.com>,
 "victor.lixin@hisilicon.com" <victor.lixin@hisilicon.com>,
 "puck.chen@hisilicon.com" <puck.chen@hisilicon.com>,
 "dan.zhao@hisilicon.com" <dan.zhao@hisilicon.com>,
 "huxinwei@huawei.com" <huxinwei@huawei.com>,
 "z.liuxinliang@huawei.com" <z.liuxinliang@huawei.com>,
 "heyunlei@huawei.com" <heyunlei@huawei.com>,
 XinWei Kong <kong.kongxinwei@hisilicon.com>,
 "w.f@huawei.com" <w.f@huawei.com>,
 "Liguozhu (Kenneth)" <liguozhu@hisilicon.com>
Subject: Re: [PATCH v7 6/7] clk: hi6220: Clock driver support for Hisilicon
 hi6220 SoC
References: <1432117752-7074-1-git-send-email-bintian.wang@huawei.com>	<1432117752-7074-2-git-send-email-bintian.wang@huawei.com>	<555D09F3.7020506@codeaurora.org>	<555D57BB.8080702@huawei.com>	<555E1D55.1050907@codeaurora.org>	<555EBCA4.9030303@huawei.com>	<CAAS=xmgHJVThR2hVeMYZjKgJdodEG_hrs09BBA01gOXMSc8Rdg@mail.gmail.com>	<555F76D9.10308@codeaurora.org>	<20150522184131.GD1885@codeaurora.org> <CAAS=xmi98pvXR_qXREnpMfG+Tuh1d8ZdTmhJSvoMNJ0=iOoPpA@mail.gmail.com>
In-Reply-To: <CAAS=xmi98pvXR_qXREnpMfG+Tuh1d8ZdTmhJSvoMNJ0=iOoPpA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 05/22/15 11:57, Brent Wang wrote:
> Hello Stephen,
>
> 2015-05-23 2:41 GMT+08:00 Stephen Boyd <sboyd@codeaurora.org>:
>> On 05/22, Stephen Boyd wrote:
>>> On 05/22/15 11:30, Brent Wang wrote:
>>>> Hello Stephen,
>>>>
>>>> 2015-05-22 13:20 GMT+08:00 Bintian <bintian.wang@huawei.com>:
>>>>>> Is pl011 the uart device? Does it have a node in DT somewhere? If it
>>>>>> does, then we could put the assigned-parents properties in that node so
>>>>>> that when the pl011 probes the uart1 clock has its parent set to
>>>>>> clk_150m. See the "Assigned clock parents and rates" section of
>>>>>> Documentation/devicetree/bindings/clock/clock-bindings.txt.
>>>>>>
>>>>> I will verify this.
>>>> Currently the "assigned-clock*" doesn't work for pl011 UART device
>>>> node, maybe we will
>>>> do some fix for its driver later or other modules.
>>> Why doesn't it work?
>>>
>> Does this patch help?
> Yes, it works!
>
> I also tested adding  "of_clk_set_defaults" to "pl011_probe()", and
> "assigned-clock*"
> also works.
>
> So you will submit another patch to fix this problem and I can revove
> the "clk_set_parent"
> from my patch, right ?
>
>

How about you take it as part of your series? Or if you're planning on
splitting out the clk patch to go through clk-tree I can apply it before
applying the clock driver patch.


----8<-----

From: Stephen Boyd <sboyd@codeaurora.org>
Subject: [PATCH] amba: Support clk parents and rates assigned in DT

Add the call to of_clk_set_defaults() into the amba probe path so
that devices on the amba bus can use the assigned rates and
parents feature of the common clock framework.

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/amba/bus.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/amba/bus.c b/drivers/amba/bus.c
index f0099360039e..350ed93d4281 100644
--- a/drivers/amba/bus.c
+++ b/drivers/amba/bus.c
@@ -19,6 +19,7 @@
 #include <linux/amba/bus.h>
 #include <linux/sizes.h>
 #include <linux/limits.h>
+#include <linux/clk/clk-conf.h>
 
 #include <asm/irq.h>
 
@@ -237,6 +238,10 @@ static int amba_probe(struct device *dev)
 	int ret;
 
 	do {
+		ret = of_clk_set_defaults(dev->of_node, false);
+		if (ret < 0)
+			break;
+
 		ret = dev_pm_domain_attach(dev, true);
 		if (ret == -EPROBE_DEFER)
 			break;


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
