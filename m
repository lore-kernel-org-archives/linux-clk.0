Return-Path: <SRS0=gleC=RP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B57C4360F
	for <linux-clk@archiver.kernel.org>; Tue, 12 Mar 2019 17:05:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E9D4E2083D
	for <linux-clk@archiver.kernel.org>; Tue, 12 Mar 2019 17:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1552410349;
	bh=PjufgGJygtD06tqBPFX/Lv3jHPSguUVkzcOJhWeQNgo=;
	h=In-Reply-To:References:From:Subject:Cc:To:Date:List-ID:From;
	b=pYLuKGjwEsqZ1b8vBJmoZECiHrTvjD6WszcyDdx5qo59akWwZzaGmEPLG3kG4JUFN
	 B5HqdCswAC5fcwD+KffsxujQ4XtDwRxHrjNUDZ+zDZ2XIZnfapaKCT289vC5kif0vk
	 qji99vsgLhFJXjXG+pavXSsH5XKqwdu20rt+R8dM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbfCLRFs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Mar 2019 13:05:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:39268 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726284AbfCLRFr (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 12 Mar 2019 13:05:47 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 01FFD2083D;
        Tue, 12 Mar 2019 17:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1552410346;
        bh=PjufgGJygtD06tqBPFX/Lv3jHPSguUVkzcOJhWeQNgo=;
        h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
        b=Kwu7+ALNTViasUfLeKuub1lz8Jv1TdqIobDhb1e+XEJ2u0IMEjoj0aAU4ptb2sQBT
         NUg4OMt/xLVTd/PUQ77djp5pKzbUQ6MFE1is4K6RoFzc9VNjA31MSLWFX2GfZJ4/vB
         f/lzvh6r2xRWraCR9Rs6soxCA6++VtQt5KBVNEyk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <201903090923.Uyt2rglj%lkp@intel.com>
References: <201903090923.Uyt2rglj%lkp@intel.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [clk:clk-parent-rewrite 21/32] drivers/clk/clk.c:2369:6-13: ERROR: PTR_ERR applied after initialization to constant on line 2361
Cc:     kbuild-all@01.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
To:     kbuild test robot <lkp@intel.com>
Message-ID: <155241034513.20095.13189003946725135843@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Tue, 12 Mar 2019 10:05:45 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting kbuild test robot (2019-03-08 17:02:25)
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk=
-parent-rewrite
> head:   6a6d2ba76f95f9e4f7afea765841f40eb33d55d4
> commit: 1dee7b91c5de9c8684a5deb13769505518040f35 [21/32] clk: Introduce g=
et_parent_hw clk op
>=20
>=20
> coccinelle warnings: (new ones prefixed by >>)
>=20
> >> drivers/clk/clk.c:2369:6-13: ERROR: PTR_ERR applied after initializati=
on to constant on line 2361
>=20
> vim +2369 drivers/clk/clk.c

I'm trying to figure out how to write the code in a different way to
make the checker happy, but the code is going to change anyway when
get_parent() goes away so maybe we don't need to do anything here.

-Stephen
=20
>=20
>   2334 =20
>   2335  static struct clk_core *
>   2336  __clk_init_parent(struct clk_core *core, bool update_orphan)
>   2337  {
>   2338          u8 index =3D 0;
>   2339          struct clk_hw *parent_hw =3D NULL;
>   2340 =20
>   2341          if (core->ops->get_parent_hw) {
>   2342                  parent_hw =3D core->ops->get_parent_hw(core->hw);
>   2343          } else {
>   2344                  if (core->num_parents > 1 && core->ops->get_paren=
t)
>   2345                          index =3D core->ops->get_parent(core->hw);
>   2346 =20
>   2347                  if (index >=3D core->num_parents) {
>   2348                          /*
>   2349                           * Overwrite with NULL here because we ca=
n't
>   2350                           * differentiate true errors in getting t=
he index from
>   2351                           * the case where the clk isn't found bec=
ause it never
>   2352                           * exists or isn't described as a possibl=
e parent.
>   2353                           *
>   2354                           * Note that we don't update the orphan s=
tatus to true
>   2355                           * in this case, because we can't really =
know for sure
>   2356                           * if the clk is truly orphaned or not. T=
o avoid this,
>   2357                           * implement .get_parent_hw or use the di=
rect pointer
>   2358                           * mechanism of struct clk_parent_data::h=
w to point
>   2359                           * to the parent clk directly.
>   2360                           */
> > 2361                          parent_hw =3D NULL;
>   2362                  } else {
>   2363                          parent_hw =3D clk_hw_get_parent_by_index(=
core->hw, index);
>   2364                  }
>   2365          }
>   2366 =20
>   2367          if (IS_ERR_OR_NULL(parent_hw)) {
>   2368                  /* Parent clk provider hasn't probed yet, orphan =
it */
> > 2369                  if (PTR_ERR(parent_hw) =3D=3D -EPROBE_DEFER) {
>   2370                          if (update_orphan)
>   2371                                  core->orphan =3D true;
>   2372 =20
>   2373                          /* Orphans don't have a parent, so use NU=
LL */
>   2374                          return NULL;
