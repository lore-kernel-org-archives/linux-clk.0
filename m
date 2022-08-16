Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B6ABC25B0E
	for <linux-clk@archiver.kernel.org>; Tue, 16 Aug 2022 11:43:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234024AbiHPLnp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Aug 2022 07:43:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233206AbiHPLnY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 Aug 2022 07:43:24 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3E3275483
        for <linux-clk@vger.kernel.org>; Tue, 16 Aug 2022 04:14:09 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 562093200913;
        Tue, 16 Aug 2022 07:14:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 16 Aug 2022 07:14:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1660648445; x=1660734845; bh=JaNHNQVRKx
        1olBfhn9E559Y42MkiaQ5Fw6Yf3w1MJ8s=; b=NSzYtPiZWjkBUzDstKavaY6371
        rr7YnkIJhbGWZHnf2BI+eBBt9ADma2HqD7nr/fAw/84VgaZCeIy/zGSY7F7Yxrgj
        r9a9yB8YlxumghfFuVuJ3VBN4bgnVnyTuVm/Hb2MGbME34jCr1jzZ7Hbet+1wtKj
        JTwTpdnIlQ4hlOutDVpoJ/TmHfNfGlredZSOuEmH3LBvV/BP771zsctzMhvud8ST
        RaOg6NZHAPcV678vewfem9dY5mAr9LEV1UaM6u3uUWkWjYXoLbXtMcMnSRFOTIYq
        YhkpgBklYxVypQWqO9t/dzOuGBqUCpVjZslavGHC37jUH0YeHH840x/6VVaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1660648445; x=1660734845; bh=JaNHNQVRKx1olBfhn9E559Y42Mki
        aQ5Fw6Yf3w1MJ8s=; b=lCirj1ixQK2hzLE27JF5OOlVzBfP4Ygp0XVRuikDVms7
        U3/RcniGy2gio7QAAtBSlD8utyFQoMvjIEX1lEeBfgZmVKHvIU3ll5dcuiYtTfWU
        U+qy0SJdvTlBm1a/3fRI9SafbZxbfLJkEMuBb0XZ6yD1hyKShFjZGuOvrA+jy30i
        44TcZOu8bG6YVb3XrfQZvtPdsklTo/zrKbLMrFEEmjDLkA+W3CqsHpeBpKpRMBC6
        Z2DigEZ9pXR/3h7+ytt5TgHgWLhEVQ1Rr/JYt3iyx9G8DenX/PmRrzTEr8ws7J6/
        6UNCVaYczyd3gzByp5iCKC+MyEDVbAtQ65kQN7oHTA==
X-ME-Sender: <xms:_Hv7YkTDRnVWEkBXkSxA1brdVDd2XgaAsHaVR3elpkISjfs9bb_Idw>
    <xme:_Hv7YhxYNsXHCVEZELIK-JMvRMmgbJwYYaKx7cHJcG9CKlgH5hUz5kSMN5uCSPjWf
    DfUcpNol0rxr411KUY>
X-ME-Received: <xmr:_Hv7Yh0EfUTHZx8MIexPbyDx26CG_bzo0CVqlHNIY_LB04yJJdA2eafeOag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedgfeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
    hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:_Hv7YoA6jLAiMxqX8IMaKZGu08dUnowP4OBOWEZSl36QCwP_J6sChA>
    <xmx:_Hv7Ytish1L72Az6AXHOXXMmXB9k3ZM_wuaBNI_iehTktvEGHrlUJg>
    <xmx:_Hv7YkpEFTGymibl661TkeIH3TQPbcZTf3UlWvv3jMmgbuJ2grhUnw>
    <xmx:_Xv7YkP7JIs15xokmaU76CXOJHX1IEHm-QT8X6iSl_4YJow2Y5snJQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 07:14:03 -0400 (EDT)
Date:   Tue, 16 Aug 2022 13:14:01 +0200
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
Message-ID: <20220816111401.tq5cvupjtshhdyew@houat>
References: <20220815154147.1631441-1-maxime@cerno.tech>
 <3660057.R56niFO833@steina-w>
 <20220816092416.uofjed254rvrb4tn@houat>
 <2024590.taCxCBeP46@steina-w>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="t6uypwh55xwykkbo"
Content-Disposition: inline
In-Reply-To: <2024590.taCxCBeP46@steina-w>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--t6uypwh55xwykkbo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2022 at 11:57:26AM +0200, Alexander Stein wrote:
> Hello Maxime,
>=20
> Am Dienstag, 16. August 2022, 11:24:16 CEST schrieb Maxime Ripard:
> > * PGP Signed by an unknown key
> >=20
> > Hi Alexander,
> >=20
> > On Tue, Aug 16, 2022 at 10:30:47AM +0200, Alexander Stein wrote:
> > > Hello Maxime,
> > >=20
> > > Am Montag, 15. August 2022, 17:41:35 CEST schrieb Maxime Ripard:
> > > > If a non-rate clock started by default with a parent that never
> > > > registered, core->req_rate will be 0. The expectation is that whene=
ver
> > > > the parent will be registered, req_rate will be updated with the new
> > > > value that has just been computed.
> > > >=20
> > > > However, if that clock is a mux, clk_set_parent() can also make that
> > > > clock no longer orphan. In this case however, we never update req_r=
ate.
> > > > Let's make sure it's the case for the newly unorphan clock and all =
its
> > > > children.
> > >=20
> > > This works with my basic board DT, but adding an I2C attached audio c=
odec
> > >=20
> > > (sound/soc/codecs/tlv320aic32x4-clk.c) I get the following error:
> > > > BUG: sleeping function called from invalid context at
> > > > kernel/locking/mutex.c:283 in_atomic(): 1, irqs_disabled(): 128,
> > > > non_block:
> > > > 0, pid: 217, name: kworker/u8:6 preempt_count: 1, expected: 0
> > > > RCU nest depth: 0, expected: 0
> > > > CPU: 3 PID: 217 Comm: kworker/u8:6 Not tainted 6.0.0-rc1-next-20220=
816+
> > > > #521 ac6fe0b093ec56bf12af4f3eda948091742739aa Hardware name: TQ-Sys=
tems
> > > > i.MX8MPlus TQMa8MPxL on MBa8MPxL (DT)
> > > > Workqueue: events_unbound deferred_probe_work_func
> > > >=20
> > > > Call trace:
> > > >  dump_backtrace+0xd4/0x114
> > > >  show_stack+0x14/0x4c
> > > >  dump_stack_lvl+0x64/0x7c
> > > >  dump_stack+0x14/0x2c
> > > >  __might_resched+0x124/0x154
> > > >  __might_sleep+0x58/0xcc
> > > >  mutex_lock+0x20/0x70
> > > >  regmap_lock_mutex+0xc/0x1c
> > > >  regmap_read+0x38/0x70
> > > >  clk_aic32x4_div_recalc_rate+0x34/0x70 [snd_soc_tlv320aic32x4
> > > >  4f2256fee3bc49277632fba80c047a2b8a3ad122] clk_recalc+0x44/0xe0
> > > >  clk_core_update_orphan_child_rates+0x28/0x60
> > > >  clk_core_update_orphan_child_rates+0x48/0x60
> > > >  clk_core_update_orphan_child_rates+0x48/0x60
> > > >  clk_core_update_orphan_child_rates+0x48/0x60
> > > >  clk_core_update_orphan_child_rates+0x48/0x60
> > > >  clk_reparent+0xa4/0x14c
> > > >  __clk_set_parent_before+0x40/0xa0
> > > >  clk_core_set_parent_nolock+0x11c/0x27c
> > > >  clk_set_parent+0x3c/0x140
> > > >  __set_clk_parents+0x114/0x244
> > > >  of_clk_set_defaults+0x20/0x50
> > > >  platform_probe+0x38/0x100
> > > >  call_driver_probe+0x28/0x140
> > > >  really_probe+0xc0/0x334
> > > >  __driver_probe_device+0x84/0x144
> > > >  driver_probe_device+0x38/0x130
> > > >  __device_attach_driver+0xc8/0x17c
> > > >  bus_for_each_drv+0x74/0xc4
> > > >  __device_attach+0xa8/0x204
> > > >  device_initial_probe+0x10/0x1c
> > > >  bus_probe_device+0x90/0xa0
> > > >  deferred_probe_work_func+0x9c/0xf0
> > > >  process_one_work+0x1d0/0x330
> > > >  worker_thread+0x68/0x390
> > > >  kthread+0xf4/0xfc
> > > >  ret_from_fork+0x10/0x20
> > >=20
> > > The audio codec driver provides clocks as well which can't be used in
> > > atomic contexts.
> >=20
> > So, this is due to clk_reparent() being called with enable_lock taken in
> > __clk_set_parent_before(), and enable_lock is a spinlock.
> >=20
> > The other call sites of clk_reparent() are __clk_set_parent(), that
> > takes that lock too, and clk_core_reparent() that doesn't.
> >=20
> > __clk_set_parent() is used exclusively by clk_core_set_parent_nolock()
> > and has the assumption that only the prepare_lock (mutex) is taken.
> >=20
> > clk_core_reparent() is used exclusively by clk_hw_reparent(), which is
> > then used by four drivers (clk-stm32mp1.c, stm32/clk-stm32-core.c,
> > clk/tegra/clk-tegra124-emc.c and tegra/clk-tegra210-emc.c)
> >=20
> > All but tegra124 use clk_hw_reparent() in their set_parent
> > implementation. The set_parent hook is called in __clk_set_parent() and
> > clk_change_rate(), both times without the enable_lock taken.
> >=20
> > tegra210 has it in its set_rate implementation, called only by
> > clk_change_rate(), without the enable_lock taken too.
> >=20
> > So I think that if we move the call to
> > clk_core_update_orphan_child_rates() to the clk_reparent() call sites,
> > after the enable_lock has been released if it was taken, we should be
> > safe.
> >=20
> > Could you test the following patch?
> >=20
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index 5bdfd645f1dc..453e2ff10961 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -1941,7 +1941,6 @@ static void clk_reparent(struct clk_core *core, s=
truct
> > clk_core *new_parent) }
> >=20
> >  	core->parent =3D new_parent;
> > -	clk_core_update_orphan_child_rates(core);
> >  }
> >=20
> >  static struct clk_core *__clk_set_parent_before(struct clk_core *core,
> > @@ -1987,6 +1986,8 @@ static struct clk_core *__clk_set_parent_before(s=
truct
> > clk_core *core, clk_reparent(core, parent);
> >  	clk_enable_unlock(flags);
> >=20
> > +	clk_core_update_orphan_child_rates(core);
> > +
> >  	return old_parent;
> >  }
> >=20
> > @@ -2031,6 +2032,8 @@ static int __clk_set_parent(struct clk_core *core,
> > struct clk_core *parent, flags =3D clk_enable_lock();
> >  		clk_reparent(core, old_parent);
> >  		clk_enable_unlock(flags);
> > +
> > +		clk_core_update_orphan_child_rates(core);
> >  		__clk_set_parent_after(core, old_parent, parent);
> >=20
> >  		return ret;
> > @@ -2654,6 +2657,7 @@ static void clk_core_reparent(struct clk_core *co=
re,
> >  				  struct clk_core *new_parent)
> >  {
> >  	clk_reparent(core, new_parent);
> > +	clk_core_update_orphan_child_rates(core);
> >  	__clk_recalc_accuracies(core);
> >  	__clk_recalc_rates(core, POST_RATE_CHANGE);
> >  }
>=20
> With this patch applied the BUG message is gone and the system boots with=
out=20
> any issue.

Thanks for testing :)

I've merged that patch into the original one, updated the commit log and
will submit a new version of this series.

Maxime

--t6uypwh55xwykkbo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYvt7+QAKCRDj7w1vZxhR
xUTUAQDN3ckTB3Z9MEp3WnMIJG8p4b2xR/6nICMpteRNtjQDeQEAkYmlzQW5W0Ar
XqEsCyzH9Ns5csYwdEIylPzgPxPQ+QI=
=tO3D
-----END PGP SIGNATURE-----

--t6uypwh55xwykkbo--
