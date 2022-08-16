Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE33CC2BB41
	for <linux-clk@archiver.kernel.org>; Tue, 16 Aug 2022 10:36:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234766AbiHPKgg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Aug 2022 06:36:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234769AbiHPKgK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 Aug 2022 06:36:10 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CA14647FA
        for <linux-clk@vger.kernel.org>; Tue, 16 Aug 2022 01:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1660638653; x=1692174653;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3eskktmoQw2SRgTsO8Qk0airO++YVylUM1ug6LFCMNM=;
  b=ZBqyhMhd9uwr39DvU5iig/J0mQR5bXR/4PP/A0aeDM0YXVNNhMDmdHNe
   GyDwev4bup1dJe6dDD5ViltcNE/jDs9fIG6Bws17Q0wCvXQaw14VBVNow
   LZwoxdmIz0RPAKoyrsg3EDUQFrsEn1CG8UDQqXGx5KylEAgE/KfW5NRVQ
   fLIkSwOo2he4SIGTlaQml+ZeoEnGbr1+QyaU4011GWxJwEliYirsi6Vur
   0/lGkfhlP7rSbd1WmzdIn5t9u0HoFYtYkwJwkVkDmytOQ+geLs2ZBriRO
   FNl0pRT93pCFeaEJFTF6JVa/3CrcPWuLrtMtZFAeekrAndAzZ9AhqkusW
   A==;
X-IronPort-AV: E=Sophos;i="5.93,240,1654552800"; 
   d="scan'208";a="25621979"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 Aug 2022 10:30:50 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 16 Aug 2022 10:30:50 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 16 Aug 2022 10:30:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1660638650; x=1692174650;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3eskktmoQw2SRgTsO8Qk0airO++YVylUM1ug6LFCMNM=;
  b=E0RGgf6OLMaE66/nVuGj49AxOjnfrsh/S3H2xUV8Ua+AV/6d6FNHZuOZ
   uWv9oGUNpjjiV2wbWDbcgdu7IXRKhNyLQ5bXv8pIRx7ANd1A+mOZukoAI
   xGrRsIPnpLfs8NkioTWqpjehq/RxxUAE2ySy1MPt9bS0/yVZb6RXQgUKq
   0ekZnoN9aHrnnPv3e5Yf1SI7KzKpUCc35PlgSOrmgPqZ0s3OiKuDIhbJt
   Fb8grka19YzvLgFWfS0o2LaBtlvQP9qUyp8TPd/lZY+PHmT/mlEQOORAb
   cuLKrNcOtsS2FdMO4zzpsbPbHWQYuaXKAVfzYHv1GbG0Gyb8LrKIKsC/g
   A==;
X-IronPort-AV: E=Sophos;i="5.93,240,1654552800"; 
   d="scan'208";a="25621978"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Aug 2022 10:30:49 +0200
Received: from steina-w.localnet (unknown [10.123.49.11])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id B4BBD280056;
        Tue, 16 Aug 2022 10:30:49 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     linux-clk@vger.kernel.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v8 13/25] clk: Set req_rate on reparenting
Date:   Tue, 16 Aug 2022 10:30:47 +0200
Message-ID: <3660057.R56niFO833@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220815154147.1631441-14-maxime@cerno.tech>
References: <20220815154147.1631441-1-maxime@cerno.tech> <20220815154147.1631441-14-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Maxime,

Am Montag, 15. August 2022, 17:41:35 CEST schrieb Maxime Ripard:
> If a non-rate clock started by default with a parent that never
> registered, core->req_rate will be 0. The expectation is that whenever
> the parent will be registered, req_rate will be updated with the new
> value that has just been computed.
> 
> However, if that clock is a mux, clk_set_parent() can also make that
> clock no longer orphan. In this case however, we never update req_rate.
> Let's make sure it's the case for the newly unorphan clock and all its
> children.

This works with my basic board DT, but adding an I2C attached audio codec 
(sound/soc/codecs/tlv320aic32x4-clk.c) I get the following error:
> BUG: sleeping function called from invalid context at
> kernel/locking/mutex.c:283 in_atomic(): 1, irqs_disabled(): 128, non_block:
> 0, pid: 217, name: kworker/u8:6 preempt_count: 1, expected: 0
> RCU nest depth: 0, expected: 0
> CPU: 3 PID: 217 Comm: kworker/u8:6 Not tainted 6.0.0-rc1-next-20220816+ #521
> ac6fe0b093ec56bf12af4f3eda948091742739aa Hardware name: TQ-Systems
> i.MX8MPlus TQMa8MPxL on MBa8MPxL (DT)
> Workqueue: events_unbound deferred_probe_work_func
> 
> Call trace:
>  dump_backtrace+0xd4/0x114
>  show_stack+0x14/0x4c
>  dump_stack_lvl+0x64/0x7c
>  dump_stack+0x14/0x2c
>  __might_resched+0x124/0x154
>  __might_sleep+0x58/0xcc
>  mutex_lock+0x20/0x70
>  regmap_lock_mutex+0xc/0x1c
>  regmap_read+0x38/0x70
>  clk_aic32x4_div_recalc_rate+0x34/0x70 [snd_soc_tlv320aic32x4
>  4f2256fee3bc49277632fba80c047a2b8a3ad122] clk_recalc+0x44/0xe0
>  clk_core_update_orphan_child_rates+0x28/0x60
>  clk_core_update_orphan_child_rates+0x48/0x60
>  clk_core_update_orphan_child_rates+0x48/0x60
>  clk_core_update_orphan_child_rates+0x48/0x60
>  clk_core_update_orphan_child_rates+0x48/0x60
>  clk_reparent+0xa4/0x14c
>  __clk_set_parent_before+0x40/0xa0
>  clk_core_set_parent_nolock+0x11c/0x27c
>  clk_set_parent+0x3c/0x140
>  __set_clk_parents+0x114/0x244
>  of_clk_set_defaults+0x20/0x50
>  platform_probe+0x38/0x100
>  call_driver_probe+0x28/0x140
>  really_probe+0xc0/0x334
>  __driver_probe_device+0x84/0x144
>  driver_probe_device+0x38/0x130
>  __device_attach_driver+0xc8/0x17c
>  bus_for_each_drv+0x74/0xc4
>  __device_attach+0xa8/0x204
>  device_initial_probe+0x10/0x1c
>  bus_probe_device+0x90/0xa0
>  deferred_probe_work_func+0x9c/0xf0
>  process_one_work+0x1d0/0x330
>  worker_thread+0x68/0x390
>  kthread+0xf4/0xfc
>  ret_from_fork+0x10/0x20

The audio codec driver provides clocks as well which can't be used in atomic 
contexts.

Best regards,
Alexander

> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meson
> g12b Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/clk/clk.c      |  18 ++++
>  drivers/clk/clk_test.c | 239 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 257 insertions(+)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 53b28e63deae..6f5284f6cab5 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1765,6 +1765,23 @@ static void clk_core_update_orphan_status(struct
> clk_core *core, bool is_orphan) clk_core_update_orphan_status(child,
> is_orphan);
>  }
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
>  static void clk_reparent(struct clk_core *core, struct clk_core
> *new_parent) {
>  	bool was_orphan = core->orphan;
> @@ -1789,6 +1806,7 @@ static void clk_reparent(struct clk_core *core, struct
> clk_core *new_parent) }
> 
>  	core->parent = new_parent;
> +	clk_core_update_orphan_child_rates(core);
>  }
> 
>  static struct clk_core *__clk_set_parent_before(struct clk_core *core,
> diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
> index d3e121f21ae2..d1b1372f7aaa 100644
> --- a/drivers/clk/clk_test.c
> +++ b/drivers/clk/clk_test.c
> @@ -594,6 +594,41 @@
> clk_test_orphan_transparent_multiple_parent_mux_set_parent(struct kunit
> *test) clk_put(clk);
>  }
> 
> +/*
> + * Test that, for a mux that started orphan but got switched to a valid
> + * parent, calling clk_drop_range() on the mux won't affect the parent
> + * rate.
> + */
> +static void
> +clk_test_orphan_transparent_multiple_parent_mux_set_parent_drop_range(struc
> t kunit *test) +{
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
>  /*
>   * Test that, for a mux that started orphan but got switched to a valid
>   * parent, the rate of the mux and its new parent are consistent.
> @@ -625,6 +660,39 @@
> clk_test_orphan_transparent_multiple_parent_mux_set_parent_get_rate(struct
> kunit clk_put(clk);
>  }
> 
> +/*
> + * Test that, for a mux that started orphan but got switched to a valid
> + * parent, calling clk_put() on the mux won't affect the parent rate.
> + */
> +static void
> +clk_test_orphan_transparent_multiple_parent_mux_set_parent_put(struct kunit
> *test) +{
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
>  /*
>   * Test that, for a mux that started orphan but got switched to a valid
>   * parent, calling clk_set_rate_range() will affect the parent state if
> @@ -658,6 +726,43 @@
> clk_test_orphan_transparent_multiple_parent_mux_set_parent_set_range_modifi
> ed(st clk_put(clk);
>  }
> 
> +/*
> + * Test that, for a mux that started orphan but got switched to a valid
> + * parent, calling clk_set_rate_range() won't affect the parent state if
> + * its rate is within range.
> + */
> +static void
> +clk_test_orphan_transparent_multiple_parent_mux_set_parent_set_range_untouc
> hed(struct kunit *test) +{
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
>  /*
>   * Test that, for a mux whose current parent hasn't been registered yet,
>   * calling clk_set_rate_range() will succeed, and will be taken into
> @@ -724,8 +829,11 @@
> clk_test_orphan_transparent_multiple_parent_mux_set_range_set_parent_get_ra
> te(st static struct kunit_case
> clk_orphan_transparent_multiple_parent_mux_test_cases[] = {
> KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_get_parent),
> KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent),
> +	
KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent_dro
> p_range),
> KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent_get_r
> ate),
> +	
KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent_put
> ),
> KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent_set_r
> ange_modified),
> +	
KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent_set
> _range_untouched),
> KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_range_round_
> rate),
> KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_range_set_pa
> rent_get_rate), {}
> @@ -1021,6 +1129,136 @@ static struct kunit_suite
> clk_orphan_transparent_single_parent_test_suite = { .test_cases =
> clk_orphan_transparent_single_parent_mux_test_cases, };
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
> + *
> https://lore.kernel.org/linux-clk/366a0232-bb4a-c357-6aa8-636e398e05eb@sams
> ung.com/ + */
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
>  /*
>   * Test that clk_set_rate_range won't return an error for a valid range
>   * and that it will make sure the rate of the clock is within the
> @@ -1729,6 +1967,7 @@ kunit_test_suites(
>  	&clk_multiple_parents_mux_test_suite,
>  	&clk_orphan_transparent_multiple_parent_mux_test_suite,
>  	&clk_orphan_transparent_single_parent_test_suite,
> +	&clk_orphan_two_level_root_last_test_suite,
>  	&clk_range_test_suite,
>  	&clk_range_maximize_test_suite,
>  	&clk_range_minimize_test_suite,




