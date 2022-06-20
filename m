Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88E1FC433EF
	for <linux-clk@archiver.kernel.org>; Mon, 20 Jun 2022 15:27:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240165AbiFTP1L (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Jun 2022 11:27:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244249AbiFTP07 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Jun 2022 11:26:59 -0400
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35A9D1008
        for <linux-clk@vger.kernel.org>; Mon, 20 Jun 2022 08:26:18 -0700 (PDT)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20220620152613euoutp02a1cdc20f64084ac6cfb301415868ce3f~6XaRZyuqy1444714447euoutp02L
        for <linux-clk@vger.kernel.org>; Mon, 20 Jun 2022 15:26:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20220620152613euoutp02a1cdc20f64084ac6cfb301415868ce3f~6XaRZyuqy1444714447euoutp02L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1655738773;
        bh=/EYS0nGOxJgDmFEXdiRKI2ryAYHgLuoqpzukVdTU0UE=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=k0yyOq9nw61n5x123Md8N1mNubjomVFAJRDza6ZG+k7kKrprBXNe8AQ5UVXUNkNMP
         Ouhq5Z3KHtylBgUBT/vNPipClwK9AFd5peXxvPKl9C3wBbcMK+BC90WTygPIIX5mfG
         Ujqg4e4n/K5XqT7LNJo6fDDH6rlKmFd/ndMmHUyY=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20220620152612eucas1p1fd0ec5b9aad2c92c8de64fb47ba2ac27~6XaQ8400N2322123221eucas1p1e;
        Mon, 20 Jun 2022 15:26:12 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 8F.43.09664.49190B26; Mon, 20
        Jun 2022 16:26:12 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20220620152612eucas1p2bd95bcec491a02c486d0a5f6b97864cd~6XaQqms2c0602906029eucas1p2G;
        Mon, 20 Jun 2022 15:26:12 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220620152612eusmtrp15ce81b2e2eb9c2488cc63bf22852a530~6XaQptNAv2548825488eusmtrp1N;
        Mon, 20 Jun 2022 15:26:12 +0000 (GMT)
X-AuditID: cbfec7f2-d81ff700000025c0-cb-62b091944391
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 0E.48.09095.49190B26; Mon, 20
        Jun 2022 16:26:12 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220620152612eusmtip27c09d57cf0ced9734d6c85d5f205afcc~6XaQDOwjW1552815528eusmtip2N;
        Mon, 20 Jun 2022 15:26:11 +0000 (GMT)
Message-ID: <0cdc7588-4dc3-266f-aa37-86bf5996497f@samsung.com>
Date:   Mon, 20 Jun 2022 17:26:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH v9 2/4] clk: generalize devm_clk_get() a bit
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Russell King <linux@armlinux.org.uk>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, kernel@pengutronix.de,
        Michael Turquette <mturquette@baylibre.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Alexandru Ardelean <aardelean@deviqon.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20220520075737.758761-3-u.kleine-koenig@pengutronix.de>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNKsWRmVeSWpSXmKPExsWy7djP87pTJm5IMtj1ycyi7bmKxYOmVUwW
        qxZeY7NYNXUni8XHnnusFoem7mW0uHjK1eLftY0sFrcnTmZ04PS4fO0is8f7G63sHqt2rmP2
        aDnyltVj06pONo/+vwYenzfJBbBHcdmkpOZklqUW6dslcGVMWbONteC8akXnp4tsDYxz5boY
        OTkkBEwkNv67x9TFyMUhJLCCUeLlnjWsEM4XRolF/xexQDifGSX6z6xl7mLkAGtZ+NMQpFtI
        YDmjxMYbnBA1Hxkldv96xAaS4BWwk1h9bAsjSD2LgKrE41kuEGFBiZMzn7CA2KICSRLzt7Wy
        gtjCAg4S/X/fMIHYzALiEreezAe7SESgH2hvz2ZGiMQLRon5F+NBbDYBQ4mut11guzgFXCW2
        T7/GDlEjL9G8dTYzSLOEwH8Oiccb1zJB/Okisf/ERlYIW1ji1fEt7BC2jMTpyT0sEI/lS/yd
        YQwRrpC49noNM4RtLXHn3C82kBJmAU2J9bv0IcKOEnf/nmeD6OSTuPFWEOICPolJ26ZDQ4pX
        oqNNCKJaTWLW8XVwOw9euMQ8gVFpFlKgzELy/Cwkv8xC2LuAkWUVo3hqaXFuemqxYV5quV5x
        Ym5xaV66XnJ+7iZGYHo6/e/4px2Mc1991DvEyMTBeIhRgoNZSYTXhntDkhBvSmJlVWpRfnxR
        aU5q8SFGaQ4WJXHe5MwNiUIC6YklqdmpqQWpRTBZJg5OqQamsis510Nyj0ybsvXprskbFwRe
        eXUu5qT4Em4RZ8ayG+anfJuK/rg0zHPu8Fw170a4fGPFQU2jZU9O7vrBpSXv/3CfSodL0iuW
        QwK7VjKIG59Invotf5v0vmsBGny/DmVnBPGsuTrVPrC/qs3mj9g95ib2u1uPMpVnTT/xiHXy
        S2OD0rSANwyO9wKST/y7vFwkQ/Yyt8wNw4gHa2fcSV/hF3ddn+v23vQ1v1m4fQx/LXu76d6V
        2UcuvVf+WOaVYbnowf9D7U+S/7vGruZZmfjz3MNbXxzmSHaalk1cXDLz9CcN7/PfhRWNF156
        as9eJW5c6D//441Ez/Pz951lzVy2pUhJc/t588vN38xklswwsVRiKc5INNRiLipOBAC4fT7f
        vgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRmVeSWpSXmKPExsVy+t/xe7pTJm5IMvh3X8mi7bmKxYOmVUwW
        qxZeY7NYNXUni8XHnnusFoem7mW0uHjK1eLftY0sFrcnTmZ04PS4fO0is8f7G63sHqt2rmP2
        aDnyltVj06pONo/+vwYenzfJBbBH6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZ
        mSrp29mkpOZklqUW6dsl6GVMWbONteC8akXnp4tsDYxz5boYOTgkBEwkFv407GLk4hASWMoo
        8ergJNYuRk6guIzEyWkNULawxJ9rXWwQRe8ZJea++8IOkuAVsJNYfWwLI8ggFgFVicezXCDC
        ghInZz5hAbFFBZIk5u1dzQhiCws4SPT/fcMEYjMLiEvcejKfCWSmiEA/o8Tvo6fAHGaBV4wS
        N45PBesWEqiXaFh1B6yDTcBQoustyBWcHJwCrhLbp19jh5hkJtG1tYsRwpaXaN46m3kCo9As
        JIfMQrJwFpKWWUhaFjCyrGIUSS0tzk3PLTbUK07MLS7NS9dLzs/dxAiMy23Hfm7ewTjv1Ue9
        Q4xMHIyHGCU4mJVEeG24NyQJ8aYkVlalFuXHF5XmpBYfYjQFBsZEZinR5HxgYsgriTc0MzA1
        NDGzNDC1NDNWEuf1LOhIFBJITyxJzU5NLUgtgulj4uCUamDa7V61Ypr207dJPQuNzdlaNiU+
        tnnN9ynvu/ziS/07t1Tlr7kw6e2ayPKz+1lunvsWq2Aw4/YdyeLTT8XnuLY+yfz/VeXQ2qOZ
        ou5Hxf/eZLlg1bHReeJ2oS3bVos9jDix2ebr3idSHCZRkUkux1w+Tkh7otjpvkq/hF3198u/
        VydHvQz66RO3qO2k3TFDnU9Kpxev3nfBoXmbQb3H36yTGcw/Glbeskr7sqBetj1vccOW7gMR
        9il+bxYclju0+vMDjcz125JOdkuEWhpP1hFfbFAcl/qGS2rfRGvGA3NlA9T2H45c5ZvWLMTF
        /6VIJyF3ytmZ7umXO/XVvE9Zfrdztoj0v/HDkq3TZs28FIMmJZbijERDLeai4kQAv95LHFQD
        AAA=
X-CMS-MailID: 20220620152612eucas1p2bd95bcec491a02c486d0a5f6b97864cd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220620152612eucas1p2bd95bcec491a02c486d0a5f6b97864cd
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220620152612eucas1p2bd95bcec491a02c486d0a5f6b97864cd
References: <20220520075737.758761-1-u.kleine-koenig@pengutronix.de>
        <20220520075737.758761-3-u.kleine-koenig@pengutronix.de>
        <CGME20220620152612eucas1p2bd95bcec491a02c486d0a5f6b97864cd@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Uwe,

On 20.05.2022 09:57, Uwe Kleine-König wrote:
> Allow to add an exit hook to devm managed clocks. Also use
> clk_get_optional() in devm_clk_get_optional instead of open coding it.
> The generalisation will be used in the next commit to add some more
> devm_clk helpers.
>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Alexandru Ardelean <aardelean@deviqon.com>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

This patch landed in linux next-20220620 as commit abae8e57e49a ("clk: 
generalize devm_clk_get() a bit"). Unfortunately it has ugly issue, see 
my comment in the code below.

> ---
>   drivers/clk/clk-devres.c | 66 +++++++++++++++++++++++++++++-----------
>   1 file changed, 49 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
> index f9d5b7334341..c822f4ef1584 100644
> --- a/drivers/clk/clk-devres.c
> +++ b/drivers/clk/clk-devres.c
> @@ -4,39 +4,71 @@
>   #include <linux/export.h>
>   #include <linux/gfp.h>
>   
> +struct devm_clk_state {
> +	struct clk *clk;
> +	void (*exit)(struct clk *clk);
> +};
> +
>   static void devm_clk_release(struct device *dev, void *res)
>   {
> -	clk_put(*(struct clk **)res);
> +	struct devm_clk_state *state = *(struct devm_clk_state **)res;

This should be:

struct devm_clk_state *state = res;

otherwise it nukes badly during cleanup:

8<--- cut here ---
Unable to handle kernel paging request at virtual address c254f810
[c254f810] *pgd=4241141e(bad)
Internal error: Oops: 8000000d [#1] PREEMPT SMP ARM
Modules linked in:
CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.19.0-rc1-00002-gabae8e57e49a #5239
Hardware name: Samsung Exynos (Flattened Device Tree)
PC is at 0xc254f810
LR is at devm_clk_release+0x1c/0x28
pc : [<c254f810>]    lr : [<c05c93f4>]    psr: a0000053
...
Flags: NzCv  IRQs on  FIQs off  Mode SVC_32  ISA ARM  Segment none
Control: 10c5387d  Table: 4000404a  DAC: 00000051
...
Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
Stack: (0xf0845dd0 to 0xf0846000)
...
  devm_clk_release from release_nodes+0x5c/0x80
  release_nodes from devres_release_all+0x7c/0xc0
  devres_release_all from device_unbind_cleanup+0xc/0x60
  device_unbind_cleanup from really_probe+0x150/0x404
  really_probe from __driver_probe_device+0xa0/0x208
  __driver_probe_device from driver_probe_device+0x34/0xc4
  driver_probe_device from __driver_attach+0xf0/0x1e4
  __driver_attach from bus_for_each_dev+0x70/0xb0
  bus_for_each_dev from bus_add_driver+0x174/0x218
  bus_add_driver from driver_register+0x88/0x11c
  driver_register from do_one_initcall+0x64/0x380
  do_one_initcall from kernel_init_freeable+0x1c0/0x224
  kernel_init_freeable from kernel_init+0x18/0x12c
  kernel_init from ret_from_fork+0x14/0x2c
Exception stack(0xf0845fb0 to 0xf0845ff8)
...
---[ end trace 0000000000000000 ]---


> +
> +	if (state->exit)
> +		state->exit(state->clk);
> +
> +	clk_put(state->clk);
>   }
>   
> -struct clk *devm_clk_get(struct device *dev, const char *id)
> +static struct clk *__devm_clk_get(struct device *dev, const char *id,
> +				  struct clk *(*get)(struct device *dev, const char *id),
> +				  int (*init)(struct clk *clk),
> +				  void (*exit)(struct clk *clk))
>   {
> -	struct clk **ptr, *clk;
> +	struct devm_clk_state *state;
> +	struct clk *clk;
> +	int ret;
>   
> -	ptr = devres_alloc(devm_clk_release, sizeof(*ptr), GFP_KERNEL);
> -	if (!ptr)
> +	state = devres_alloc(devm_clk_release, sizeof(*state), GFP_KERNEL);
> +	if (!state)
>   		return ERR_PTR(-ENOMEM);
>   
> -	clk = clk_get(dev, id);
> -	if (!IS_ERR(clk)) {
> -		*ptr = clk;
> -		devres_add(dev, ptr);
> -	} else {
> -		devres_free(ptr);
> +	clk = get(dev, id);
> +	if (IS_ERR(clk)) {
> +		ret = PTR_ERR(clk);
> +		goto err_clk_get;
>   	}
>   
> +	if (init) {
> +		ret = init(clk);
> +		if (ret)
> +			goto err_clk_init;
> +	}
> +
> +	state->clk = clk;
> +	state->exit = exit;
> +
> +	devres_add(dev, state);
> +
>   	return clk;
> +
> +err_clk_init:
> +
> +	clk_put(clk);
> +err_clk_get:
> +
> +	devres_free(state);
> +	return ERR_PTR(ret);
> +}
> +
> +struct clk *devm_clk_get(struct device *dev, const char *id)
> +{
> +	return __devm_clk_get(dev, id, clk_get, NULL, NULL);
>   }
>   EXPORT_SYMBOL(devm_clk_get);
>   
>   struct clk *devm_clk_get_optional(struct device *dev, const char *id)
>   {
> -	struct clk *clk = devm_clk_get(dev, id);
> -
> -	if (clk == ERR_PTR(-ENOENT))
> -		return NULL;
> -
> -	return clk;
> +	return __devm_clk_get(dev, id, clk_get_optional, NULL, NULL);
>   }
>   EXPORT_SYMBOL(devm_clk_get_optional);
>   

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

