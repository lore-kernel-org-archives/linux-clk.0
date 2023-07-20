Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B47D7EB64DA
	for <linux-clk@archiver.kernel.org>; Thu, 20 Jul 2023 14:53:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbjGTOx7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Jul 2023 10:53:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbjGTOx6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Jul 2023 10:53:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E32FC6
        for <linux-clk@vger.kernel.org>; Thu, 20 Jul 2023 07:53:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EFA5961B47
        for <linux-clk@vger.kernel.org>; Thu, 20 Jul 2023 14:53:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0024BC43397;
        Thu, 20 Jul 2023 14:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689864836;
        bh=vPdlcql91Tvc0vuK6u+CcJg9CIOKyN3ucH82Mb4I9gY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cR4HNjp2Su59riKtgiJdFJZ210wOYqfZC+jW0/kf0hm2+246Xqdh3YPziMjZgc20G
         LwDrWLyoYgYmtVyaxXMLhSVCc91BnVkSiBm46jQWRUp9lfGjmYk11VXm4e5r07Xhqr
         l4Ya7kkRNpbFaexWqY3hLW8d2Fi/95nSyMlP2m7QIFJLtiCoVK997BrsPnc5+msJ/f
         ow1Y2i74oJr01xPyLtf5OaHAKICpUltOGbRb63BlCp7b9hF7iA6ftRcpxs7bD9P0VM
         jZBftJ7y3n4hLhCV0K5tIAOUHfQpDsDmRXz86MdGBMwg0LFvt7RtyQ/TD31qWDFCht
         PkS0d1PGNZ9FA==
Date:   Thu, 20 Jul 2023 16:53:53 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Subject: Re: Backtraces with CONFIG_CLK_KUNIT_TEST=y+CONFIG_LOCKDEP=y
Message-ID: <jwiigf6ed7hwcnjmboimioq6pfll2gtw446w3z2vthgbc5nv6c@qeoeguqcm64q>
References: <2b594e50-2bbf-4a2d-88e6-49fc39f3957a@roeck-us.net>
 <0a13bc5364ea3cde3724c1e7a1d700d4.sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4avzdt5kwt73fzng"
Content-Disposition: inline
In-Reply-To: <0a13bc5364ea3cde3724c1e7a1d700d4.sboyd@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--4avzdt5kwt73fzng
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 19, 2023 at 05:01:45PM -0700, Stephen Boyd wrote:
> Quoting Guenter Roeck (2023-07-19 16:11:36)
> > Hi,
> >=20
> > when booting a kernel with both CONFIG_CLK_KUNIT_TEST and CONFIG_LOCKDEP
> > enabled, I get a lot of warning backtraces such as the following.
>=20
> Is it the same as
> https://lore.kernel.org/r/202301310919.b9d56ee3-yujie.liu@intel.com or
> something different?
>=20
> >=20
> > [   11.119313] ------------[ cut here ]------------
> > [   11.119797] WARNING: CPU: 0 PID: 155 at drivers/clk/clk.c:708 clk_co=
re_get_boundaries+0xdc/0xec
> > [   11.121064] CPU: 0 PID: 155 Comm: kunit_try_catch Tainted: G        =
         N 6.5.0-rc2-00046-gccff6d117d8d #1
> > [   11.121580] Hardware name: Generic DT based system
> > [   11.122046]  unwind_backtrace from show_stack+0x18/0x1c
> > [   11.122429]  show_stack from dump_stack_lvl+0x38/0x5c
> > [   11.122712]  dump_stack_lvl from __warn+0x7c/0x134
> > [   11.122978]  __warn from warn_slowpath_fmt+0x7c/0xbc
> > [   11.123247]  warn_slowpath_fmt from clk_core_get_boundaries+0xdc/0xec
> > [   11.123569]  clk_core_get_boundaries from clk_core_init_rate_req+0x5=
0/0x90
> > [   11.123899]  clk_core_init_rate_req from clk_leaf_mux_set_rate_paren=
t_determine_rate+0x60/0x264
> > [   11.124287]  clk_leaf_mux_set_rate_parent_determine_rate from kunit_=
generic_run_threadfn_adapter+0x1c/0x28
> > [   11.124702]  kunit_generic_run_threadfn_adapter from kthread+0xf8/0x=
120
> > [   11.125017]  kthread from ret_from_fork+0x14/0x3c
> > [   11.125345] Exception stack(0x881a5fb0 to 0x881a5ff8)
> > [   11.125710] 5fa0:                                     00000000 00000=
000 00000000 00000000
> > [   11.126084] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000=
000 00000000 00000000
> > [   11.126531] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000=
000
> > [   11.127384] irq event stamp: 1047
> > [   11.127717] hardirqs last  enabled at (1057): [<80166cb4>] __up_cons=
ole_sem+0x68/0x88
> > [   11.128177] hardirqs last disabled at (1066): [<80166ca0>] __up_cons=
ole_sem+0x54/0x88
> > [   11.128553] softirqs last  enabled at (0): [<80110cc4>] copy_process=
+0x810/0x216c
> > [   11.128941] softirqs last disabled at (0): [<00000000>] 0x0
> > [   11.129327] ---[ end trace 0000000000000000 ]---
> > [   11.129704] ------------[ cut here ]------------
> > [   11.129991] WARNING: CPU: 0 PID: 155 at drivers/clk/clk.c:1595 clk_c=
ore_round_rate_nolock+0xec/0x214
> > [   11.130455] CPU: 0 PID: 155 Comm: kunit_try_catch Tainted: G        =
W        N 6.5.0-rc2-00046-gccff6d117d8d #1
> > [   11.130891] Hardware name: Generic DT based system
> > [   11.131160]  unwind_backtrace from show_stack+0x18/0x1c
> > [   11.131446]  show_stack from dump_stack_lvl+0x38/0x5c
> > [   11.131721]  dump_stack_lvl from __warn+0x7c/0x134
> > [   11.131987]  __warn from warn_slowpath_fmt+0x7c/0xbc
> > [   11.132266]  warn_slowpath_fmt from clk_core_round_rate_nolock+0xec/=
0x214
> > [   11.132594]  clk_core_round_rate_nolock from clk_leaf_mux_set_rate_p=
arent_determine_rate+0x6c/0x264
> > [   11.133001]  clk_leaf_mux_set_rate_parent_determine_rate from kunit_=
generic_run_threadfn_adapter+0x1c/0x28
> > [   11.133397]  kunit_generic_run_threadfn_adapter from kthread+0xf8/0x=
120
> > [   11.133699]  kthread from ret_from_fork+0x14/0x3c
> > [   11.133962] Exception stack(0x881a5fb0 to 0x881a5ff8)
> > [   11.134238] 5fa0:                                     00000000 00000=
000 00000000 00000000
> > [   11.134592] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000=
000 00000000 00000000
> > [   11.134943] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000=
000
> > [   11.135244] irq event stamp: 1131
> > [   11.135473] hardirqs last  enabled at (1141): [<80166cb4>] __up_cons=
ole_sem+0x68/0x88
> > [   11.135828] hardirqs last disabled at (1150): [<80166ca0>] __up_cons=
ole_sem+0x54/0x88
> > [   11.136203] softirqs last  enabled at (0): [<80110cc4>] copy_process=
+0x810/0x216c
> > [   11.137215] softirqs last disabled at (1169): [<80118fb0>] __irq_exi=
t_rcu+0x12c/0x164
> > [   11.137649] ---[ end trace 0000000000000000 ]---
> > [   11.137993] ------------[ cut here ]------------
> > [   11.138279] WARNING: CPU: 0 PID: 155 at drivers/clk/clk.c:1467 clk_c=
ore_determine_round_nolock+0xc0/0x134
> > [   11.138732] CPU: 0 PID: 155 Comm: kunit_try_catch Tainted: G        =
W        N 6.5.0-rc2-00046-gccff6d117d8d #1
> > [   11.139164] Hardware name: Generic DT based system
> > [   11.139423]  unwind_backtrace from show_stack+0x18/0x1c
> > [   11.139703]  show_stack from dump_stack_lvl+0x38/0x5c
> > [   11.139996]  dump_stack_lvl from __warn+0x7c/0x134
> > [   11.140273]  __warn from warn_slowpath_fmt+0x7c/0xbc
> > [   11.140563]  warn_slowpath_fmt from clk_core_determine_round_nolock+=
0xc0/0x134
> > [   11.140909]  clk_core_determine_round_nolock from clk_leaf_mux_set_r=
ate_parent_determine_rate+0x6c/0x264
> > [   11.141323]  clk_leaf_mux_set_rate_parent_determine_rate from kunit_=
generic_run_threadfn_adapter+0x1c/0x28
> > [   11.141758]  kunit_generic_run_threadfn_adapter from kthread+0xf8/0x=
120
> > [   11.142112]  kthread from ret_from_fork+0x14/0x3c
> > [   11.142422] Exception stack(0x881a5fb0 to 0x881a5ff8)
> > [   11.142696] 5fa0:                                     00000000 00000=
000 00000000 00000000
> > [   11.143061] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000=
000 00000000 00000000
> > [   11.143386] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000=
000
> > [   11.143674] irq event stamp: 1223
> > [   11.143910] hardirqs last  enabled at (1233): [<80166cb4>] __up_cons=
ole_sem+0x68/0x88
> > [   11.144277] hardirqs last disabled at (1242): [<80166ca0>] __up_cons=
ole_sem+0x54/0x88
> > [   11.144645] softirqs last  enabled at (1174): [<80101494>] __do_soft=
irq+0x224/0x3b0
> > [   11.145053] softirqs last disabled at (1169): [<80118fb0>] __irq_exi=
t_rcu+0x12c/0x164
> > [   11.145398] ---[ end trace 0000000000000000 ]---
> >=20
> > It would be great if the problem can get fixed so I can enable
> > both options in my boot tests. I'd be happy to submit a patch
> > (or patch series) to fix it, but I have no idea what is actually
> > wrong.=20
>=20
> The problem is that clk_leaf_mux_set_rate_parent_determine_rate() is
> calling __clk_determine_rate() without the prepare_lock held.
> __clk_determine_rate() is a clk provider API and the expectation is that
> it is called from clk providers with the prepare lock held.

Ouch, yes, indeed.

The call to clk_hw_init_rate_request() in that same test has the same issue.

> The simplest thing to do is probably make a kunit test API that can
> manually grab and release the prepare lock and then call it from the
> test.

I did it for both and it works indeed. I didn't have the time to finish
writing the commit logs today, expect them by tomorrow.

Maxime

--4avzdt5kwt73fzng
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZLlKgQAKCRDj7w1vZxhR
xbDbAP950Jxa9Tu8Jto4rRKfC2jvCjB7c/SjMcE3kVyBdf5WDAEAuhB2QVnyBL2O
bZ+G3RvFgmzCqyOdJ9yfPL94t6AIwAo=
=686r
-----END PGP SIGNATURE-----

--4avzdt5kwt73fzng--
