Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A21CC25B0E
	for <linux-clk@archiver.kernel.org>; Tue, 16 Aug 2022 11:06:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235261AbiHPLGd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Aug 2022 07:06:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235271AbiHPLGN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 Aug 2022 07:06:13 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 267343ED52
        for <linux-clk@vger.kernel.org>; Tue, 16 Aug 2022 02:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1660643851; x=1692179851;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=94iD7x5bIzJpFwswRkFuW+dVLGBPNfAognNhNYBCTfc=;
  b=kdIa8smjwEC4M6+2UbagdTLsLTSWs6LJZKLHEzNBqHWuM6ougQdQeSNW
   SS7L2QUOux6HlLZOPNTFTqb5VjocynZw/UmVPJbarLIy1QfpUHPNoxEU+
   ZGH7qYQ0VcxyVdHhgX9+Mlm34lb6GDhRGC5YZtHxfKLY7VV+N6ZNkyBXh
   WqcoTla1SSJhrpmYgdKhyeOSZCyy09lwl+itZvDrmmNM43OFYWcHhQEoK
   T3vSCS4ZmJKXPs0F4YKK1QX5URBSbKakopehkROCFIsUrXyJBTFTRQHvH
   vkwE99eeqBf5hv45wc9aO2csl6OLoN1stKbYj95U2sCjCuiZeCslo9xiL
   g==;
X-IronPort-AV: E=Sophos;i="5.93,240,1654552800"; 
   d="scan'208";a="25624740"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 Aug 2022 11:57:29 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 16 Aug 2022 11:57:29 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 16 Aug 2022 11:57:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1660643849; x=1692179849;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=94iD7x5bIzJpFwswRkFuW+dVLGBPNfAognNhNYBCTfc=;
  b=jkjJ7AP2S73wefO3PvTyRWJKuC+TdHWiWQ19lPRBdYtRg6VkAr5oPphT
   9jmAYnDkWWtU+wQcxike0VJ9y/JHARvgKP3I3RGuikuVl22+sNiTLqFyK
   biqZu4mic+qMxRlEr/swJBhMDWPz4haVkHGYVaoYmC3/5U1w7vlWVzNao
   wIuCQd/W95fP6RgY+xj3N+Iq3lXzzXZkQOx87IwP1wFNhCghonyL25QXl
   UK2xTt4OZDfTinlCM26CGoEFNr9wpO0yuCvE3e+e/IySSEvxD6HpNPqO6
   s8GoiipSg74K6RKLa0U0QMM37VM5KtDmsP6ZONjQoPxsigmkgxxioMa4u
   g==;
X-IronPort-AV: E=Sophos;i="5.93,240,1654552800"; 
   d="scan'208";a="25624739"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Aug 2022 11:57:28 +0200
Received: from steina-w.localnet (unknown [10.123.49.11])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id A77D4280056;
        Tue, 16 Aug 2022 11:57:28 +0200 (CEST)
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
        Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: [PATCH v8 13/25] clk: Set req_rate on reparenting
Date:   Tue, 16 Aug 2022 11:57:26 +0200
Message-ID: <2024590.taCxCBeP46@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220816092416.uofjed254rvrb4tn@houat>
References: <20220815154147.1631441-1-maxime@cerno.tech> <3660057.R56niFO833@steina-w> <20220816092416.uofjed254rvrb4tn@houat>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Maxime,

Am Dienstag, 16. August 2022, 11:24:16 CEST schrieb Maxime Ripard:
> * PGP Signed by an unknown key
> 
> Hi Alexander,
> 
> On Tue, Aug 16, 2022 at 10:30:47AM +0200, Alexander Stein wrote:
> > Hello Maxime,
> > 
> > Am Montag, 15. August 2022, 17:41:35 CEST schrieb Maxime Ripard:
> > > If a non-rate clock started by default with a parent that never
> > > registered, core->req_rate will be 0. The expectation is that whenever
> > > the parent will be registered, req_rate will be updated with the new
> > > value that has just been computed.
> > > 
> > > However, if that clock is a mux, clk_set_parent() can also make that
> > > clock no longer orphan. In this case however, we never update req_rate.
> > > Let's make sure it's the case for the newly unorphan clock and all its
> > > children.
> > 
> > This works with my basic board DT, but adding an I2C attached audio codec
> > 
> > (sound/soc/codecs/tlv320aic32x4-clk.c) I get the following error:
> > > BUG: sleeping function called from invalid context at
> > > kernel/locking/mutex.c:283 in_atomic(): 1, irqs_disabled(): 128,
> > > non_block:
> > > 0, pid: 217, name: kworker/u8:6 preempt_count: 1, expected: 0
> > > RCU nest depth: 0, expected: 0
> > > CPU: 3 PID: 217 Comm: kworker/u8:6 Not tainted 6.0.0-rc1-next-20220816+
> > > #521 ac6fe0b093ec56bf12af4f3eda948091742739aa Hardware name: TQ-Systems
> > > i.MX8MPlus TQMa8MPxL on MBa8MPxL (DT)
> > > Workqueue: events_unbound deferred_probe_work_func
> > > 
> > > Call trace:
> > >  dump_backtrace+0xd4/0x114
> > >  show_stack+0x14/0x4c
> > >  dump_stack_lvl+0x64/0x7c
> > >  dump_stack+0x14/0x2c
> > >  __might_resched+0x124/0x154
> > >  __might_sleep+0x58/0xcc
> > >  mutex_lock+0x20/0x70
> > >  regmap_lock_mutex+0xc/0x1c
> > >  regmap_read+0x38/0x70
> > >  clk_aic32x4_div_recalc_rate+0x34/0x70 [snd_soc_tlv320aic32x4
> > >  4f2256fee3bc49277632fba80c047a2b8a3ad122] clk_recalc+0x44/0xe0
> > >  clk_core_update_orphan_child_rates+0x28/0x60
> > >  clk_core_update_orphan_child_rates+0x48/0x60
> > >  clk_core_update_orphan_child_rates+0x48/0x60
> > >  clk_core_update_orphan_child_rates+0x48/0x60
> > >  clk_core_update_orphan_child_rates+0x48/0x60
> > >  clk_reparent+0xa4/0x14c
> > >  __clk_set_parent_before+0x40/0xa0
> > >  clk_core_set_parent_nolock+0x11c/0x27c
> > >  clk_set_parent+0x3c/0x140
> > >  __set_clk_parents+0x114/0x244
> > >  of_clk_set_defaults+0x20/0x50
> > >  platform_probe+0x38/0x100
> > >  call_driver_probe+0x28/0x140
> > >  really_probe+0xc0/0x334
> > >  __driver_probe_device+0x84/0x144
> > >  driver_probe_device+0x38/0x130
> > >  __device_attach_driver+0xc8/0x17c
> > >  bus_for_each_drv+0x74/0xc4
> > >  __device_attach+0xa8/0x204
> > >  device_initial_probe+0x10/0x1c
> > >  bus_probe_device+0x90/0xa0
> > >  deferred_probe_work_func+0x9c/0xf0
> > >  process_one_work+0x1d0/0x330
> > >  worker_thread+0x68/0x390
> > >  kthread+0xf4/0xfc
> > >  ret_from_fork+0x10/0x20
> > 
> > The audio codec driver provides clocks as well which can't be used in
> > atomic contexts.
> 
> So, this is due to clk_reparent() being called with enable_lock taken in
> __clk_set_parent_before(), and enable_lock is a spinlock.
> 
> The other call sites of clk_reparent() are __clk_set_parent(), that
> takes that lock too, and clk_core_reparent() that doesn't.
> 
> __clk_set_parent() is used exclusively by clk_core_set_parent_nolock()
> and has the assumption that only the prepare_lock (mutex) is taken.
> 
> clk_core_reparent() is used exclusively by clk_hw_reparent(), which is
> then used by four drivers (clk-stm32mp1.c, stm32/clk-stm32-core.c,
> clk/tegra/clk-tegra124-emc.c and tegra/clk-tegra210-emc.c)
> 
> All but tegra124 use clk_hw_reparent() in their set_parent
> implementation. The set_parent hook is called in __clk_set_parent() and
> clk_change_rate(), both times without the enable_lock taken.
> 
> tegra210 has it in its set_rate implementation, called only by
> clk_change_rate(), without the enable_lock taken too.
> 
> So I think that if we move the call to
> clk_core_update_orphan_child_rates() to the clk_reparent() call sites,
> after the enable_lock has been released if it was taken, we should be
> safe.
> 
> Could you test the following patch?
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 5bdfd645f1dc..453e2ff10961 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1941,7 +1941,6 @@ static void clk_reparent(struct clk_core *core, struct
> clk_core *new_parent) }
> 
>  	core->parent = new_parent;
> -	clk_core_update_orphan_child_rates(core);
>  }
> 
>  static struct clk_core *__clk_set_parent_before(struct clk_core *core,
> @@ -1987,6 +1986,8 @@ static struct clk_core *__clk_set_parent_before(struct
> clk_core *core, clk_reparent(core, parent);
>  	clk_enable_unlock(flags);
> 
> +	clk_core_update_orphan_child_rates(core);
> +
>  	return old_parent;
>  }
> 
> @@ -2031,6 +2032,8 @@ static int __clk_set_parent(struct clk_core *core,
> struct clk_core *parent, flags = clk_enable_lock();
>  		clk_reparent(core, old_parent);
>  		clk_enable_unlock(flags);
> +
> +		clk_core_update_orphan_child_rates(core);
>  		__clk_set_parent_after(core, old_parent, parent);
> 
>  		return ret;
> @@ -2654,6 +2657,7 @@ static void clk_core_reparent(struct clk_core *core,
>  				  struct clk_core *new_parent)
>  {
>  	clk_reparent(core, new_parent);
> +	clk_core_update_orphan_child_rates(core);
>  	__clk_recalc_accuracies(core);
>  	__clk_recalc_rates(core, POST_RATE_CHANGE);
>  }

With this patch applied the BUG message is gone and the system boots without 
any issue.

Thanks
Alexander



