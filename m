Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E748C32771
	for <linux-clk@archiver.kernel.org>; Tue, 16 Aug 2022 09:50:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233529AbiHPJum (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Aug 2022 05:50:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234054AbiHPJuW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 Aug 2022 05:50:22 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF758923E6
        for <linux-clk@vger.kernel.org>; Tue, 16 Aug 2022 02:24:23 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id C378D3200313;
        Tue, 16 Aug 2022 05:24:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 16 Aug 2022 05:24:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1660641861; x=1660728261; bh=FwCBT5Fgpt
        Gj3xxsZlIIWiFvTEbC510MOIzrzIcORbw=; b=nPCJM8Y+fw0hAcuiTW27f/ELI+
        JCzzuvGUM7fENI2NvauO7aGB6ePiTLJD04jdJI7uSgWXxzOj/fuodW+L+kEVASNc
        eVbYdb/gWiM1D0JhXnhy8lwP+7KctHCii1SGVbNUfPd+OiPw00lkEauk9l5FrW7p
        /SoMvFeC9YOkDb1R7BKWHCB6bg4uC1C+cWDZolGOQHFJJHeQHBFztSttnwe/6egV
        p9dImLHQISxpiT5yOivvWEhFMAatfSSxno1a3rl1dge5pNyInlw4/MMIm+T2pAw5
        zPwVGtJh9/ehnt1jWfYEs3+tM1AxqwueFv5dku3udjUDmhVVNdb0msBw+gxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1660641861; x=1660728261; bh=FwCBT5FgptGj3xxsZlIIWiFvTEbC
        510MOIzrzIcORbw=; b=t0Xoc7mk/NyPyWfDNbGQTlVZryeCbNP0+DnsB5jtZM80
        Rn8aRKmDMYUTJI/FmC9OpsMeBD82NTT2OMLGLUc4qmZg+ytS3a7uwT/mEP0jKLMq
        AsUF6hfs/xTfAN3aaoiXInLLDWT88n5OrCxrXGzsxwF/TzjzXgy83twPZHWFrluf
        GtabqV2Ll73L4Q8vnQFbZLV0/AwnREMwvt75k8TUocFKfaYWXcx0D8Li3Y4uY13F
        0A6QvodsE4cMQNJ4AZE3rAZeAuYOLg4btifWOzQtXs+Wdqo7i2xxi8elcDEqskzk
        kw3spRaU+z8hut9IjpCnflSQCOoJHqCM/PCHX8OaxA==
X-ME-Sender: <xms:Q2L7YimhIRZS4ijLG1_4hTs7f7YgsbIJN4mZTFUTCp6Z7WKrMwlrOA>
    <xme:Q2L7Yp2Q3gqnovMq13HetNihj-y5nIwivt1utx1q-9sipaIWOGkN0xYygFBXXcCJu
    cQLnZBefy8Hz-Q3IAo>
X-ME-Received: <xmr:Q2L7Ygr5zASRNKTc8pIIlSsqqt18zseC9UHNlw1q5_fWSaAG9Md83xrsiLk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
    hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Q2L7YmlxILlOgDe7p6zq5Cq_kpi4KDczDgemSSDUrfMuwgxObM6Mog>
    <xmx:Q2L7Yg1kxM9POvfh6j_1aRPJxDdWO8jRAKyVC7ggijgGaa_qHeAEhA>
    <xmx:Q2L7YtvjZOsLxSIILqY0Oy7NzxgYvNDD--XGF6aJGa2ITakKk-r86g>
    <xmx:RWL7Ymy-yCKJ7Z6v7eOEZnWJoc643G9mw1ks2emJWWLMhvUQSEPyEw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 05:24:19 -0400 (EDT)
Date:   Tue, 16 Aug 2022 11:24:16 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
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
Message-ID: <20220816092416.uofjed254rvrb4tn@houat>
References: <20220815154147.1631441-1-maxime@cerno.tech>
 <20220815154147.1631441-14-maxime@cerno.tech>
 <3660057.R56niFO833@steina-w>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2vetoogtpfj447oa"
Content-Disposition: inline
In-Reply-To: <3660057.R56niFO833@steina-w>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--2vetoogtpfj447oa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

On Tue, Aug 16, 2022 at 10:30:47AM +0200, Alexander Stein wrote:
> Hello Maxime,
>=20
> Am Montag, 15. August 2022, 17:41:35 CEST schrieb Maxime Ripard:
> > If a non-rate clock started by default with a parent that never
> > registered, core->req_rate will be 0. The expectation is that whenever
> > the parent will be registered, req_rate will be updated with the new
> > value that has just been computed.
> >=20
> > However, if that clock is a mux, clk_set_parent() can also make that
> > clock no longer orphan. In this case however, we never update req_rate.
> > Let's make sure it's the case for the newly unorphan clock and all its
> > children.
>=20
> This works with my basic board DT, but adding an I2C attached audio codec=
=20
> (sound/soc/codecs/tlv320aic32x4-clk.c) I get the following error:
> > BUG: sleeping function called from invalid context at
> > kernel/locking/mutex.c:283 in_atomic(): 1, irqs_disabled(): 128, non_bl=
ock:
> > 0, pid: 217, name: kworker/u8:6 preempt_count: 1, expected: 0
> > RCU nest depth: 0, expected: 0
> > CPU: 3 PID: 217 Comm: kworker/u8:6 Not tainted 6.0.0-rc1-next-20220816+=
 #521
> > ac6fe0b093ec56bf12af4f3eda948091742739aa Hardware name: TQ-Systems
> > i.MX8MPlus TQMa8MPxL on MBa8MPxL (DT)
> > Workqueue: events_unbound deferred_probe_work_func
> >=20
> > Call trace:
> >  dump_backtrace+0xd4/0x114
> >  show_stack+0x14/0x4c
> >  dump_stack_lvl+0x64/0x7c
> >  dump_stack+0x14/0x2c
> >  __might_resched+0x124/0x154
> >  __might_sleep+0x58/0xcc
> >  mutex_lock+0x20/0x70
> >  regmap_lock_mutex+0xc/0x1c
> >  regmap_read+0x38/0x70
> >  clk_aic32x4_div_recalc_rate+0x34/0x70 [snd_soc_tlv320aic32x4
> >  4f2256fee3bc49277632fba80c047a2b8a3ad122] clk_recalc+0x44/0xe0
> >  clk_core_update_orphan_child_rates+0x28/0x60
> >  clk_core_update_orphan_child_rates+0x48/0x60
> >  clk_core_update_orphan_child_rates+0x48/0x60
> >  clk_core_update_orphan_child_rates+0x48/0x60
> >  clk_core_update_orphan_child_rates+0x48/0x60
> >  clk_reparent+0xa4/0x14c
> >  __clk_set_parent_before+0x40/0xa0
> >  clk_core_set_parent_nolock+0x11c/0x27c
> >  clk_set_parent+0x3c/0x140
> >  __set_clk_parents+0x114/0x244
> >  of_clk_set_defaults+0x20/0x50
> >  platform_probe+0x38/0x100
> >  call_driver_probe+0x28/0x140
> >  really_probe+0xc0/0x334
> >  __driver_probe_device+0x84/0x144
> >  driver_probe_device+0x38/0x130
> >  __device_attach_driver+0xc8/0x17c
> >  bus_for_each_drv+0x74/0xc4
> >  __device_attach+0xa8/0x204
> >  device_initial_probe+0x10/0x1c
> >  bus_probe_device+0x90/0xa0
> >  deferred_probe_work_func+0x9c/0xf0
> >  process_one_work+0x1d0/0x330
> >  worker_thread+0x68/0x390
> >  kthread+0xf4/0xfc
> >  ret_from_fork+0x10/0x20
>=20
> The audio codec driver provides clocks as well which can't be used in ato=
mic=20
> contexts.

So, this is due to clk_reparent() being called with enable_lock taken in
__clk_set_parent_before(), and enable_lock is a spinlock.

The other call sites of clk_reparent() are __clk_set_parent(), that
takes that lock too, and clk_core_reparent() that doesn't.

__clk_set_parent() is used exclusively by clk_core_set_parent_nolock()
and has the assumption that only the prepare_lock (mutex) is taken.

clk_core_reparent() is used exclusively by clk_hw_reparent(), which is
then used by four drivers (clk-stm32mp1.c, stm32/clk-stm32-core.c,
clk/tegra/clk-tegra124-emc.c and tegra/clk-tegra210-emc.c)

All but tegra124 use clk_hw_reparent() in their set_parent
implementation. The set_parent hook is called in __clk_set_parent() and
clk_change_rate(), both times without the enable_lock taken.

tegra210 has it in its set_rate implementation, called only by
clk_change_rate(), without the enable_lock taken too.

So I think that if we move the call to
clk_core_update_orphan_child_rates() to the clk_reparent() call sites,
after the enable_lock has been released if it was taken, we should be
safe.

Could you test the following patch?

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 5bdfd645f1dc..453e2ff10961 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1941,7 +1941,6 @@ static void clk_reparent(struct clk_core *core, struc=
t clk_core *new_parent)
 	}

 	core->parent =3D new_parent;
-	clk_core_update_orphan_child_rates(core);
 }

 static struct clk_core *__clk_set_parent_before(struct clk_core *core,
@@ -1987,6 +1986,8 @@ static struct clk_core *__clk_set_parent_before(struc=
t clk_core *core,
 	clk_reparent(core, parent);
 	clk_enable_unlock(flags);

+	clk_core_update_orphan_child_rates(core);
+
 	return old_parent;
 }

@@ -2031,6 +2032,8 @@ static int __clk_set_parent(struct clk_core *core, st=
ruct clk_core *parent,
 		flags =3D clk_enable_lock();
 		clk_reparent(core, old_parent);
 		clk_enable_unlock(flags);
+
+		clk_core_update_orphan_child_rates(core);
 		__clk_set_parent_after(core, old_parent, parent);

 		return ret;
@@ -2654,6 +2657,7 @@ static void clk_core_reparent(struct clk_core *core,
 				  struct clk_core *new_parent)
 {
 	clk_reparent(core, new_parent);
+	clk_core_update_orphan_child_rates(core);
 	__clk_recalc_accuracies(core);
 	__clk_recalc_rates(core, POST_RATE_CHANGE);
 }

Thanks!
Maxime

--2vetoogtpfj447oa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYvtiQAAKCRDj7w1vZxhR
xeROAP9PjDKO1c+xcnBZFQQEpPithXZnPauu9pjrZJdsDqpniAEAoS/Sbw332wYh
05bfvJAXUcE4xXls5zxkObf+sG/1QQM=
=5nmP
-----END PGP SIGNATURE-----

--2vetoogtpfj447oa--
