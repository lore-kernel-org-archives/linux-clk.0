Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C1FC433F5
	for <linux-clk@archiver.kernel.org>; Mon,  3 Oct 2022 09:59:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbiJCJ7Q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Oct 2022 05:59:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiJCJ7P (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Oct 2022 05:59:15 -0400
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D43033340
        for <linux-clk@vger.kernel.org>; Mon,  3 Oct 2022 02:59:13 -0700 (PDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20221003095909euoutp0126ad4649a884c6c22a29f260195b7517~ahrr8iVmc1919319193euoutp01H
        for <linux-clk@vger.kernel.org>; Mon,  3 Oct 2022 09:59:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20221003095909euoutp0126ad4649a884c6c22a29f260195b7517~ahrr8iVmc1919319193euoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1664791149;
        bh=31IU1R/owI4YnJgSPCl3aC96BwFJsSeCfokCeUjyblI=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=aWtUe2bgw3FucrYOgRLg0oKvESnoPuikHukc13YuRi2be5DRBDlrtmm9ZhOqLRa0p
         bGVGJdZtk3KC5nAa4k9gwFHsrukb3Yt2uQ4IQj+8WrKDo8iJAmvPcrPIii6wxRk3aG
         jSDiyj6XDtoxuQN91+F9zADYCG37/qKVR6LzJzBg=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20221003095909eucas1p1f7c4a82cf72e29b3491ea2c245c1f309~ahrret2C53150731507eucas1p1F;
        Mon,  3 Oct 2022 09:59:09 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id FA.6C.19378.D62BA336; Mon,  3
        Oct 2022 10:59:09 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20221003095909eucas1p1a4583b6812d198b2b68ef38f0bcfa291~ahrrGi_Hg3148131481eucas1p1I;
        Mon,  3 Oct 2022 09:59:09 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20221003095909eusmtrp1d0a077a566dcdacdabf1dc014ecb93ee~ahrrFt0dS0108101081eusmtrp1H;
        Mon,  3 Oct 2022 09:59:09 +0000 (GMT)
X-AuditID: cbfec7f5-a4dff70000014bb2-e7-633ab26d6309
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id F5.6C.10862.C62BA336; Mon,  3
        Oct 2022 10:59:08 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20221003095908eusmtip22e893a3168b2e6161481bba6a1ec25f5~ahrqYIwhH1939119391eusmtip2h;
        Mon,  3 Oct 2022 09:59:08 +0000 (GMT)
Message-ID: <0acc7217-762c-7c0d-45a0-55c384824ce4@samsung.com>
Date:   Mon, 3 Oct 2022 11:59:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v9 13/25] clk: Set req_rate on reparenting
Content-Language: en-US
To:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20220816112530.1837489-14-maxime@cerno.tech>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfVBMaxy+7zmn09nN5ti1+t3udU2LncFI4Y+TDDeXcQbjY8YYQzOsdSRq
        y55KGdw1qbttq7ai1jKUQU2ScWjzWSxKmlEMSbq5+p6lmmhTKOye697+e57n9zy/j3deCpdX
        ePlTkbo4Tq/TRKlIKWGvGq6bHS0s0AZVnlIyb49exJisumGSedd6H2f6zS1ejHVoFDFPHi1j
        mt6PZxwZm5nRhssEU/lsBfO8NMv7dx920JVNsH2NKd5s8+M6ku22jGKsUJxGss0Nt0jWnCpg
        7Afht7XUJunC7VxUZAKnn7Noq3SnWahCsdWJiecH+3ADerXNhCQU0PMhvb+LNCEpJaeLELRY
        /sFFMoDgXn6Kt0g+ILDWfyR/RJzGMuTGcroQQYV1iWjqR3Dnqx13F2T0Iih4U4OZEEUR9DQo
        NRCiPAFqjrd7sJLWwrDpjqen4rv9RWGbpydO+0FT+2nM3XMinYmgs6PRy01wuhwDk1F0kXQw
        mHpMnrSEXgBlA63/pqdAec9Jzw1AZ0rg0N0BTFx7Kbi6CnARK8BZfdVbxL9CbY6ZEAN/Icj/
        /BoTiQWBoasJia5QaH78iXTfg9Mz4NKNOaIcBm0Z6R4ZaF9o7JkgLuEL2fY8XJRlYEyVi241
        2KpL/xt7t/4pbkEq25iHsY15ANuYc2z/z81HRDHy4+L56AiOn6fj9gbymmg+XhcRqI2JFtD3
        L1Y7Wu26hoqc/YEOhFHIgYDCVRNlRwNCtHLZdk3SPk4fs0UfH8XxDvQLRaj8ZKR1plZOR2ji
        uN0cF8vpf1QxSuJvwE6lbHPuDneqV/kfKe5tzNGV2WUl17r3CHb+D9NQwLH68u7pykhGXbVu
        /9+z+lYNGpYkzHZ9ORFaM7R/V+GTNQrfVNVZH0e+YgY5Hj7ezI7PyRt5Oy5s9e28jihr2HK7
        cIMvPmg+18kGIYnzeOVnS9qZPO51eMh1Miln9bK5mjdyy+SVApOV+cK4NYsr29ghPXvwwv2E
        P53BRzSRLRU9Dxau700umWpAk3a8ylU09PoGxV3PfXqFxkPPN4wM6Ft/grba7vnDJbOS8X2d
        D5vB+PPitGfhy7XWqYb2NfBgR+wG84F5FemnDxe8PKlOptS6kEtJ2a6YkZGwImX5mQzlUJKK
        4Hdqgmfiel7zDVOWAOXRAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRmVeSWpSXmKPExsVy+t/xe7o5m6ySDab+MLV4PWUtk8XE8z/Z
        LN48OsJs8bHnHqvFjB//GC0unnK1uPWJ3+JQX7TFv2sbWSz2X/GyuLpuIrsDt8e3r5NYPN7f
        aGX3uHPuPJvHiwn/mDw2repk87hzbQ+bR0/bJiaPz5vkAjii9GyK8ktLUhUy8otLbJWiDS2M
        9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DJ6Nh1jLDheUbHs23vmBsbbSV2MnBwS
        AiYSrzq2MnYxcnEICSxllPhz7QMLREJG4uS0BlYIWxgo3sUGUfSeUWLjw+fsIAleATuJhQ9P
        MnUxcnCwCKhIrGtggQgLSpyc+QTMFhVIlnj5ZyJYuTBQ+fXljxlBbGYBcYlbT+YzgcwUEehn
        lLh0cBIriMMssJNJYuqiB8wQ2/YwSsy4sZkJpIVNwFCi6y3IGZwcnAJWElu/PIIaZSbRtbUL
        ypaX2P52DvMERqFZSC6ZhWTjLCQts5C0LGBkWcUoklpanJueW2ykV5yYW1yal66XnJ+7iREY
        t9uO/dyyg3Hlq496hxiZOBgPMUpwMCuJ8E5RtEwW4k1JrKxKLcqPLyrNSS0+xGgKDI2JzFKi
        yfnAxJFXEm9oZmBqaGJmaWBqaWasJM7rWdCRKCSQnliSmp2aWpBaBNPHxMEp1cA0577v0rpA
        +V0/WEptfc71Xn5zPrwzbsYnz4Nxz6+uEHPq+rHx6KS5i6tTntVNnMXou31yn7sKx6JjB7Rq
        5Z66/LY6mLOM0fPHY9XHPef2118wzQuc1Otjmd+xyDNZJPzm1Pti4uJMgVVcaSfn64g/nNrA
        GW5+nFGiZtvrdWL97O/Kti9R2BN3xWrnAjZ9yeKifzoZUfUy5iwO+1mvxJX6uwSbbtjd3uqy
        VXtFPPOWHwt8Q2T2z++f/iHi1oFH55z42TIT1rXcnXJB/d6Z6VYzZvBsPL7W4vfb+UtzThw8
        YvFoqUOw6ovd5pO+2flWivaubCl2n/inJXvdhIav77Z6tW1xiBS1jurknyXBxXFViaU4I9FQ
        i7moOBEAXnhwzWQDAAA=
X-CMS-MailID: 20221003095909eucas1p1a4583b6812d198b2b68ef38f0bcfa291
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220816112640eucas1p271d97cbe81481a8083fa6540c26fb324
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220816112640eucas1p271d97cbe81481a8083fa6540c26fb324
References: <20220816112530.1837489-1-maxime@cerno.tech>
        <CGME20220816112640eucas1p271d97cbe81481a8083fa6540c26fb324@eucas1p2.samsung.com>
        <20220816112530.1837489-14-maxime@cerno.tech>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Maxime,

On 16.08.2022 13:25, Maxime Ripard wrote:
> If a non-rate clock started by default with a parent that never
> registered, core->req_rate will be 0. The expectation is that whenever
> the parent will be registered, req_rate will be updated with the new
> value that has just been computed.
>
> However, if that clock is a mux, clk_set_parent() can also make that
> clock no longer orphan. In this case however, we never update req_rate.
>
> The natural solution to this would be to update core->rate and
> core->req_rate in clk_reparent() by calling clk_recalc().
>
> However, this doesn't work in all cases. Indeed, clk_recalc() is called
> by __clk_set_parent_before(), __clk_set_parent() and
> clk_core_reparent(). Both __clk_set_parent_before() and __clk_set_parent
> will call clk_recalc() with the enable_lock taken through a call to
> clk_enable_lock(), the underlying locking primitive being a spinlock.
>
> clk_recalc() calls the backing driver .recalc_rate hook, and that
> implementation might sleep if the underlying device uses a bus with
> accesses that might sleep, such as i2c.
>
> In such a situation, we would end up sleeping while holding a spinlock,
> and thus in an atomic section.
>
> In order to work around this, we can move the core->rate and
> core->req_rate update to the clk_recalc() calling sites, after the
> enable_lock has been released if it was taken.
>
> The only situation that could still be problematic is the
> clk_core_reparent() -> clk_reparent() case that doesn't have any
> locking. clk_core_reparent() is itself called by clk_hw_reparent(),
> which is then called by 4 drivers:
>
>    * clk-stm32mp1.c, stm32/clk-stm32-core.c and tegra/clk-tegra210-emc.c
>      use it in their set_parent implementation. The set_parent hook is
>      only called by __clk_set_parent() and clk_change_rate(), both of
>      them calling it without the enable_lock taken.
>
>    * clk/tegra/clk-tegra124-emc.c calls it as part of its set_rate
>      implementation. set_rate is only called by clk_change_rate(), again
>      without the enable_lock taken.
>
> In both cases we can't end up in a situation where the clk_hw_reparent()
> caller would hold a spinlock, so it seems like this is a good
> workaround.
>
> Let's also add some unit tests to make sure we cover the original bug.
>
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meson g12b

Well, I don't have good news. This patch has my 'tested-by', but this 
version again doesn't work properly on Meson G12B.

Linux next-20220929, which contains this patch as commit cb1b1dd96241 
("clk: Set req_rate on reparenting") fails to boot on Odroid-N2. I only 
see a freeze once the modules (I see some messages from meson drm and 
cpu_freq) are loaded. Could you remind me how to help debugging this 
issue? I will try to identify which clock causes the issue. Reverting 
$subject on top of linux-next fixes/hides the problem.


> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>   drivers/clk/clk.c      |  22 ++++
>   drivers/clk/clk_test.c | 239 +++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 261 insertions(+)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 53b28e63deae..91bb1ea0e147 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1765,6 +1765,23 @@ static void clk_core_update_orphan_status(struct clk_core *core, bool is_orphan)
>   		clk_core_update_orphan_status(child, is_orphan);
>   }
>   
> +/*
> + * Update the orphan rate and req_rate of @core and all its children.
> + */
> +static void clk_core_update_orphan_child_rates(struct clk_core *core)
> +{
> +	struct clk_core *child;
> +	unsigned long parent_rate = 0;
> +
> +	if (core->parent)
> +		parent_rate = core->parent->rate;
> +
> +	core->rate = core->req_rate = clk_recalc(core, parent_rate);
> +
> +	hlist_for_each_entry(child, &core->children, child_node)
> +		clk_core_update_orphan_child_rates(child);
> +}
> +
>   static void clk_reparent(struct clk_core *core, struct clk_core *new_parent)
>   {
>   	bool was_orphan = core->orphan;
> @@ -1834,6 +1851,8 @@ static struct clk_core *__clk_set_parent_before(struct clk_core *core,
>   	clk_reparent(core, parent);
>   	clk_enable_unlock(flags);
>   
> +	clk_core_update_orphan_child_rates(core);
> +
>   	return old_parent;
>   }
>   
> @@ -1878,6 +1897,8 @@ static int __clk_set_parent(struct clk_core *core, struct clk_core *parent,
>   		flags = clk_enable_lock();
>   		clk_reparent(core, old_parent);
>   		clk_enable_unlock(flags);
> +
> +		clk_core_update_orphan_child_rates(core);
>   		__clk_set_parent_after(core, old_parent, parent);
>   
>   		return ret;
> @@ -2506,6 +2527,7 @@ static void clk_core_reparent(struct clk_core *core,
>   				  struct clk_core *new_parent)
>   {
>   	clk_reparent(core, new_parent);
> +	clk_core_update_orphan_child_rates(core);
>   	__clk_recalc_accuracies(core);
>   	__clk_recalc_rates(core, POST_RATE_CHANGE);
>   }
> diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
> index d3e121f21ae2..d1b1372f7aaa 100644
> --- a/drivers/clk/clk_test.c
> +++ b/drivers/clk/clk_test.c
> @@ -594,6 +594,41 @@ clk_test_orphan_transparent_multiple_parent_mux_set_parent(struct kunit *test)
>   	clk_put(clk);
>   }
>   
> +/*
> + * Test that, for a mux that started orphan but got switched to a valid
> + * parent, calling clk_drop_range() on the mux won't affect the parent
> + * rate.
> + */
> +static void
> +clk_test_orphan_transparent_multiple_parent_mux_set_parent_drop_range(struct kunit *test)
> +{
> +	struct clk_multiple_parent_ctx *ctx = test->priv;
> +	struct clk_hw *hw = &ctx->hw;
> +	struct clk *clk = clk_hw_get_clk(hw, NULL);
> +	struct clk *parent;
> +	unsigned long parent_rate, new_parent_rate;
> +	int ret;
> +
> +	parent = clk_hw_get_clk(&ctx->parents_ctx[1].hw, NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent);
> +
> +	parent_rate = clk_get_rate(parent);
> +	KUNIT_ASSERT_GT(test, parent_rate, 0);
> +
> +	ret = clk_set_parent(clk, parent);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret = clk_drop_range(clk);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	new_parent_rate = clk_get_rate(clk);
> +	KUNIT_ASSERT_GT(test, new_parent_rate, 0);
> +	KUNIT_EXPECT_EQ(test, parent_rate, new_parent_rate);
> +
> +	clk_put(parent);
> +	clk_put(clk);
> +}
> +
>   /*
>    * Test that, for a mux that started orphan but got switched to a valid
>    * parent, the rate of the mux and its new parent are consistent.
> @@ -625,6 +660,39 @@ clk_test_orphan_transparent_multiple_parent_mux_set_parent_get_rate(struct kunit
>   	clk_put(clk);
>   }
>   
> +/*
> + * Test that, for a mux that started orphan but got switched to a valid
> + * parent, calling clk_put() on the mux won't affect the parent rate.
> + */
> +static void
> +clk_test_orphan_transparent_multiple_parent_mux_set_parent_put(struct kunit *test)
> +{
> +	struct clk_multiple_parent_ctx *ctx = test->priv;
> +	struct clk *clk, *parent;
> +	unsigned long parent_rate, new_parent_rate;
> +	int ret;
> +
> +	parent = clk_hw_get_clk(&ctx->parents_ctx[1].hw, NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent);
> +
> +	clk = clk_hw_get_clk(&ctx->hw, NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, clk);
> +
> +	parent_rate = clk_get_rate(parent);
> +	KUNIT_ASSERT_GT(test, parent_rate, 0);
> +
> +	ret = clk_set_parent(clk, parent);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	clk_put(clk);
> +
> +	new_parent_rate = clk_get_rate(parent);
> +	KUNIT_ASSERT_GT(test, new_parent_rate, 0);
> +	KUNIT_EXPECT_EQ(test, parent_rate, new_parent_rate);
> +
> +	clk_put(parent);
> +}
> +
>   /*
>    * Test that, for a mux that started orphan but got switched to a valid
>    * parent, calling clk_set_rate_range() will affect the parent state if
> @@ -658,6 +726,43 @@ clk_test_orphan_transparent_multiple_parent_mux_set_parent_set_range_modified(st
>   	clk_put(clk);
>   }
>   
> +/*
> + * Test that, for a mux that started orphan but got switched to a valid
> + * parent, calling clk_set_rate_range() won't affect the parent state if
> + * its rate is within range.
> + */
> +static void
> +clk_test_orphan_transparent_multiple_parent_mux_set_parent_set_range_untouched(struct kunit *test)
> +{
> +	struct clk_multiple_parent_ctx *ctx = test->priv;
> +	struct clk_hw *hw = &ctx->hw;
> +	struct clk *clk = clk_hw_get_clk(hw, NULL);
> +	struct clk *parent;
> +	unsigned long parent_rate, new_parent_rate;
> +	int ret;
> +
> +	parent = clk_hw_get_clk(&ctx->parents_ctx[1].hw, NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent);
> +
> +	parent_rate = clk_get_rate(parent);
> +	KUNIT_ASSERT_GT(test, parent_rate, 0);
> +
> +	ret = clk_set_parent(clk, parent);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret = clk_set_rate_range(clk,
> +				 DUMMY_CLOCK_INIT_RATE - 1000,
> +				 DUMMY_CLOCK_INIT_RATE + 1000);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	new_parent_rate = clk_get_rate(parent);
> +	KUNIT_ASSERT_GT(test, new_parent_rate, 0);
> +	KUNIT_EXPECT_EQ(test, parent_rate, new_parent_rate);
> +
> +	clk_put(parent);
> +	clk_put(clk);
> +}
> +
>   /*
>    * Test that, for a mux whose current parent hasn't been registered yet,
>    * calling clk_set_rate_range() will succeed, and will be taken into
> @@ -724,8 +829,11 @@ clk_test_orphan_transparent_multiple_parent_mux_set_range_set_parent_get_rate(st
>   static struct kunit_case clk_orphan_transparent_multiple_parent_mux_test_cases[] = {
>   	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_get_parent),
>   	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent),
> +	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent_drop_range),
>   	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent_get_rate),
> +	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent_put),
>   	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent_set_range_modified),
> +	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent_set_range_untouched),
>   	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_range_round_rate),
>   	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_range_set_parent_get_rate),
>   	{}
> @@ -1021,6 +1129,136 @@ static struct kunit_suite clk_orphan_transparent_single_parent_test_suite = {
>   	.test_cases = clk_orphan_transparent_single_parent_mux_test_cases,
>   };
>   
> +struct clk_single_parent_two_lvl_ctx {
> +	struct clk_dummy_context parent_parent_ctx;
> +	struct clk_dummy_context parent_ctx;
> +	struct clk_hw hw;
> +};
> +
> +static int
> +clk_orphan_two_level_root_last_test_init(struct kunit *test)
> +{
> +	struct clk_single_parent_two_lvl_ctx *ctx;
> +	int ret;
> +
> +	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +	test->priv = ctx;
> +
> +	ctx->parent_ctx.hw.init =
> +		CLK_HW_INIT("intermediate-parent",
> +			    "root-parent",
> +			    &clk_dummy_single_parent_ops,
> +			    CLK_SET_RATE_PARENT);
> +	ret = clk_hw_register(NULL, &ctx->parent_ctx.hw);
> +	if (ret)
> +		return ret;
> +
> +	ctx->hw.init =
> +		CLK_HW_INIT("test-clk", "intermediate-parent",
> +			    &clk_dummy_single_parent_ops,
> +			    CLK_SET_RATE_PARENT);
> +	ret = clk_hw_register(NULL, &ctx->hw);
> +	if (ret)
> +		return ret;
> +
> +	ctx->parent_parent_ctx.rate = DUMMY_CLOCK_INIT_RATE;
> +	ctx->parent_parent_ctx.hw.init =
> +		CLK_HW_INIT_NO_PARENT("root-parent",
> +				      &clk_dummy_rate_ops,
> +				      0);
> +	ret = clk_hw_register(NULL, &ctx->parent_parent_ctx.hw);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static void
> +clk_orphan_two_level_root_last_test_exit(struct kunit *test)
> +{
> +	struct clk_single_parent_two_lvl_ctx *ctx = test->priv;
> +
> +	clk_hw_unregister(&ctx->hw);
> +	clk_hw_unregister(&ctx->parent_ctx.hw);
> +	clk_hw_unregister(&ctx->parent_parent_ctx.hw);
> +}
> +
> +/*
> + * Test that, for a clock whose parent used to be orphan, clk_get_rate()
> + * will return the proper rate.
> + */
> +static void
> +clk_orphan_two_level_root_last_test_get_rate(struct kunit *test)
> +{
> +	struct clk_single_parent_two_lvl_ctx *ctx = test->priv;
> +	struct clk_hw *hw = &ctx->hw;
> +	struct clk *clk = clk_hw_get_clk(hw, NULL);
> +	unsigned long rate;
> +
> +	rate = clk_get_rate(clk);
> +	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_INIT_RATE);
> +
> +	clk_put(clk);
> +}
> +
> +/*
> + * Test that, for a clock whose parent used to be orphan,
> + * clk_set_rate_range() won't affect its rate if it is already within
> + * range.
> + *
> + * See (for Exynos 4210):
> + * https://lore.kernel.org/linux-clk/366a0232-bb4a-c357-6aa8-636e398e05eb@samsung.com/
> + */
> +static void
> +clk_orphan_two_level_root_last_test_set_range(struct kunit *test)
> +{
> +	struct clk_single_parent_two_lvl_ctx *ctx = test->priv;
> +	struct clk_hw *hw = &ctx->hw;
> +	struct clk *clk = clk_hw_get_clk(hw, NULL);
> +	unsigned long rate;
> +	int ret;
> +
> +	ret = clk_set_rate_range(clk,
> +				 DUMMY_CLOCK_INIT_RATE - 1000,
> +				 DUMMY_CLOCK_INIT_RATE + 1000);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	rate = clk_get_rate(clk);
> +	KUNIT_ASSERT_GT(test, rate, 0);
> +	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_INIT_RATE);
> +
> +	clk_put(clk);
> +}
> +
> +static struct kunit_case
> +clk_orphan_two_level_root_last_test_cases[] = {
> +	KUNIT_CASE(clk_orphan_two_level_root_last_test_get_rate),
> +	KUNIT_CASE(clk_orphan_two_level_root_last_test_set_range),
> +	{}
> +};
> +
> +/*
> + * Test suite for a basic, transparent, clock with a parent that is also
> + * such a clock. The parent's parent is registered last, while the
> + * parent and its child are registered in that order. The intermediate
> + * and leaf clocks will thus be orphan when registered, but the leaf
> + * clock itself will always have its parent and will never be
> + * reparented. Indeed, it's only orphan because its parent is.
> + *
> + * These tests exercise the behaviour of the consumer API when dealing
> + * with an orphan clock, and how we deal with the transition to a valid
> + * parent.
> + */
> +static struct kunit_suite
> +clk_orphan_two_level_root_last_test_suite = {
> +	.name = "clk-orphan-two-level-root-last-test",
> +	.init = clk_orphan_two_level_root_last_test_init,
> +	.exit = clk_orphan_two_level_root_last_test_exit,
> +	.test_cases = clk_orphan_two_level_root_last_test_cases,
> +};
> +
>   /*
>    * Test that clk_set_rate_range won't return an error for a valid range
>    * and that it will make sure the rate of the clock is within the
> @@ -1729,6 +1967,7 @@ kunit_test_suites(
>   	&clk_multiple_parents_mux_test_suite,
>   	&clk_orphan_transparent_multiple_parent_mux_test_suite,
>   	&clk_orphan_transparent_single_parent_test_suite,
> +	&clk_orphan_two_level_root_last_test_suite,
>   	&clk_range_test_suite,
>   	&clk_range_maximize_test_suite,
>   	&clk_range_minimize_test_suite,

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

