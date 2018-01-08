Return-Path: <leo.yan@linaro.org>
Return-Path: <leo.yan@linaro.org>
Date: Mon, 8 Jan 2018 12:22:35 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "Wangtao (Kevin, Kirin)" <kevin.wangtao@hisilicon.com>,
	Wei Yongjun <weiyongjun1@huawei.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Kaihua Zhong <zhongkaihua@huawei.com>,
	Ruyi Wang <wangruyi@huawei.com>, Kai Zhao <zhaokai1@hisilicon.com>,
	linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH -next] clk: =?utf-8?Q?hisilicon?=
 =?utf-8?B?OiBoaTM2NjDvvJpGaQ==?= =?utf-8?Q?x?= potential NULL dereference in
 hi3660_stub_clk_probe()
Message-ID: <20180108042235.GA21618@leoy-ThinkPad-T440>
References: <1515047794-170174-1-git-send-email-weiyongjun1@huawei.com>
 <CAK7LNAQXTg=A6udMPs4dptbaLz1U5+D4JBJaW0W8d_EgH_R1_A@mail.gmail.com>
 <20180105084004.GC26855@leoy-linaro>
 <7454cc50-7b92-2531-4261-45bd1703f1fb@hisilicon.com>
 <CAK7LNAQcieqS0vrGKrtr3paQADpG0GEM_k9zPdLiKF8ykv5PaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <CAK7LNAQcieqS0vrGKrtr3paQADpG0GEM_k9zPdLiKF8ykv5PaA@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jan 05, 2018 at 06:50:21PM +0900, Masahiro Yamada wrote:
> 2018-01-05 18:47 GMT+09:00 Wangtao (Kevin, Kirin) <kevin.wangtao@hisilicon.com>:
> >
> >
> > 在 2018/1/5 16:40, Leo Yan 写道:
> >>
> >> On Fri, Jan 05, 2018 at 12:59:38PM +0900, Masahiro Yamada wrote:
> >>>
> >>> 2018-01-04 15:36 GMT+09:00 Wei Yongjun <weiyongjun1@huawei.com>:
> >>>>
> >>>> platform_get_resource() may return NULL, add proper check to
> >>>> avoid potential NULL dereferencing.
> >>>>
> >>>> This is detected by Coccinelle semantic patch.
> >>>>
> >>>> @@
> >>>> expression pdev, res, n, t, e, e1, e2;
> >>>> @@
> >>>>
> >>>> res = platform_get_resource(pdev, t, n);
> >>>> + if (!res)
> >>>> +   return -EINVAL;
> >>>> ... when != res == NULL
> >>>> e = devm_ioremap(e1, res->start, e2);
> >>>>
> >>>> Fixes: 4f16f7ff3bc0 ("clk: hisilicon: Add support for Hi3660 stub
> >>>> clocks")
> >>>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> >>>> ---
> >>>>   drivers/clk/hisilicon/clk-hi3660-stub.c | 2 ++
> >>>>   1 file changed, 2 insertions(+)
> >>>>
> >>>> diff --git a/drivers/clk/hisilicon/clk-hi3660-stub.c
> >>>> b/drivers/clk/hisilicon/clk-hi3660-stub.c
> >>>> index 9b6c72b..e8b2c43 100644
> >>>> --- a/drivers/clk/hisilicon/clk-hi3660-stub.c
> >>>> +++ b/drivers/clk/hisilicon/clk-hi3660-stub.c
> >>>> @@ -149,6 +149,8 @@ static int hi3660_stub_clk_probe(struct
> >>>> platform_device *pdev)
> >>>>                  return PTR_ERR(stub_clk_chan.mbox);
> >>>>
> >>>>          res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >>>> +       if (!res)
> >>>> +               return -EINVAL;
> >>>>          freq_reg = devm_ioremap(dev, res->start, resource_size(res));
> >>>>          if (!freq_reg)
> >>>>                  return -ENOMEM;
> >>>
> >>>
> >>> Probably, it is better to use devm_ioremap_resource().
> >>> This checks NULL input.
> >>
> >>
> >> Thanks for suggestion, Masahiro. This is good suggestion.
> >>
> >> Yongjun, could you spin new patch by using devm_ioremap_resource()
> >> to replace devm_ioremap()?
> >
> > clk-stub's memory region has intersection with mailbox, so we can not use
> > devm_ioremap_resource here, it will cause problem when mailbox driver be
> > accepted by mainline.
> 
> Hmm, that sounds odd.
> 
> syscon in this case?

I verified Yongjun patch v2 for using devm_ioremap_resource(), just as
Kevin mentioned after using devm_ioremap_resource() the kernel has
memory mapping conflict between stub clock driver and mailbox driver.

Following Masahiro suggestion, I changed the stub clock driver to use
syscon & regmap to access the memory, I can confirm this can work
well, you could review in below change.

But this change should note two things, one thing is it is dependent on
mailbox driver upstreaming, so I prefer we can commit one patch for this
change along with mailbox driver patch set; the second thing is we
need change DT binding document.

If you have any better solution for this, also very welcome.

Thanks,
Leo Yan

---8<---

diff --git a/drivers/clk/hisilicon/clk-hi3660-stub.c b/drivers/clk/hisilicon/clk-hi3660-stub.c
index e8dde4f..40ee63b 100644
--- a/drivers/clk/hisilicon/clk-hi3660-stub.c
+++ b/drivers/clk/hisilicon/clk-hi3660-stub.c
@@ -25,12 +25,14 @@
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/mailbox_client.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <dt-bindings/clock/hi3660-clock.h>
 
-#define HI3660_STUB_CLOCK_DATA		(0x70)
+#define HI3660_STUB_CLOCK_DATA		(0x570)
 #define MHZ				(1000 * 1000)
 
 #define DEFINE_CLK_STUB(_id, _cmd, _name)			\
@@ -60,7 +62,7 @@ struct hi3660_stub_clk {
 	unsigned int rate;
 };
 
-static void __iomem *freq_reg;
+static struct regmap *freq_reg;
 static struct hi3660_stub_clk_chan stub_clk_chan;
 
 static unsigned long hi3660_stub_clk_recalc_rate(struct clk_hw *hw,
@@ -72,7 +74,9 @@ static unsigned long hi3660_stub_clk_recalc_rate(struct clk_hw *hw,
 	 * LPM3 writes back the CPU frequency in shared SRAM so read
 	 * back the frequency.
 	 */
-	stub_clk->rate = readl(freq_reg + (stub_clk->id << 2)) * MHZ;
+	regmap_read(freq_reg, HI3660_STUB_CLOCK_DATA + (stub_clk->id << 2),
+		    &stub_clk->rate);
+	stub_clk->rate *= MHZ;
 	return stub_clk->rate;
 }
 
@@ -133,7 +137,7 @@ static struct clk_hw *hi3660_stub_clk_hw_get(struct of_phandle_args *clkspec,
 static int hi3660_stub_clk_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *res;
+	struct device_node *np = pdev->dev.of_node;
 	unsigned int i;
 	int ret;
 
@@ -148,12 +152,12 @@ static int hi3660_stub_clk_probe(struct platform_device *pdev)
 	if (IS_ERR(stub_clk_chan.mbox))
 		return PTR_ERR(stub_clk_chan.mbox);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	freq_reg = devm_ioremap_resource(dev, res);
-	if (IS_ERR(freq_reg))
+	freq_reg = syscon_regmap_lookup_by_phandle(np,
+				"hisilicon,hi3660-clk-sram");
+	if (IS_ERR(freq_reg)) {
+		dev_err(dev, "failed to get sram regmap\n");
 		return PTR_ERR(freq_reg);
-
-	freq_reg += HI3660_STUB_CLOCK_DATA;
+	}
 
 	for (i = 0; i < HI3660_CLK_STUB_NUM; i++) {
 		ret = devm_clk_hw_register(&pdev->dev, &hi3660_stub_clks[i].hw);
