Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B50D8C433DB
	for <linux-clk@archiver.kernel.org>; Sat, 13 Mar 2021 20:38:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8AA1C64E40
	for <linux-clk@archiver.kernel.org>; Sat, 13 Mar 2021 20:38:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234706AbhCMUiK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 13 Mar 2021 15:38:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:36862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234535AbhCMUhi (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 13 Mar 2021 15:37:38 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9329164ECD;
        Sat, 13 Mar 2021 20:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615667857;
        bh=GNCDFaFL+SZINsnQRBfqyhfwiU74fF4HPy/tnPq5Q6w=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=udUGIe3yA+Sl8LhUQ8iHyQXS6UKO1vZUUHxGpaxYVwy/RKD9V/CYufUOKOVqgEAQ9
         J0cQa/UdmTknlPPqjCFLx28J6S24SThyVlPam41EDK8HsK/Qtt/EW4zX7/TiGyZs5w
         JhnlmHS/2lEj77CJgJkvMC02TJ4HiEs2E7JljOkNot5EGXNEp/bS2NXnyefv4Mw8eJ
         K2q2NBAiq+DfhMoEoufJU3tDCDtp4abBOxFh/4993lAFMnPOotYogmmC6Py1A126jk
         KTd/ZkHPJsKp7KzHja2cuAUuM3g9YLIQunnPaFXPHt0mkZMw4EFsTwST5eohWPbvdP
         T2Nz+3UGE841A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210305191307.15915-1-lb@semihalf.com>
References: <20210305191307.15915-1-lb@semihalf.com>
Subject: Re: [PATCH v1] clk: fix invalid usage of list_for_each_entry cursor
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, upstream@semihalf.com
To:     Lukasz Bartosik <lb@semihalf.com>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Sat, 13 Mar 2021 12:37:35 -0800
Message-ID: <161566785522.1478170.3268340283624516294@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lukasz Bartosik (2021-03-05 11:13:07)
> Fix invalid usage of list_for_each_entry cursor. When list
> is empty then list cursor does not point to a valid entry
> and therefore should not be used.
>=20
> The issue was dicovered when running 5.12-rc1 kernel on x86_64
> with KASAN enabled:
> BUG: KASAN: global-out-of-bounds in clk_notifier_register+0xab/0x230
> Read of size 8 at addr ffffffffa0d10588 by task swapper/0/1
>=20
> CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.12.0-rc1 #1
> Hardware name: Google Caroline/Caroline,
> BIOS Google_Caroline.7820.430.0 07/20/2018
> Call Trace:
>  dump_stack+0xee/0x15c
>  print_address_description+0x1e/0x2dc
>  kasan_report+0x188/0x1ce
>  ? clk_notifier_register+0xab/0x230
>  ? clk_prepare_lock+0x15/0x7b
>  ? clk_notifier_register+0xab/0x230
>  clk_notifier_register+0xab/0x230
>  dw8250_probe+0xc01/0x10d4
> ...
> Memory state around the buggy address:
>  ffffffffa0d10480: 00 00 00 00 00 03 f9 f9 f9 f9 f9 f9 00 00 00 00
>  ffffffffa0d10500: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 f9 f9
> >ffffffffa0d10580: f9 f9 f9 f9 00 00 00 00 00 00 00 00 00 00 00 00
>                       ^
>  ffffffffa0d10600: 00 00 00 00 00 00 f9 f9 f9 f9 f9 f9 00 00 00 00
>  ffffffffa0d10680: 00 00 00 00 00 00 00 00 f9 f9 f9 f9 00 00 00 00
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Fixes: (b2476490ef11 clk: introduce the common clock framework)

This fixes format is wrong. Use pretty format of 'Fixes: %h "%s"'

>=20

And this newline shouldn't be here.

> Reported-by: Lukasz Majczak <lma@semihalf.com>
> Signed-off-by: Lukasz Bartosik <lb@semihalf.com>
> ---
>  drivers/clk/clk.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 3412a7cc03fd..bd90de885392 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -4360,6 +4360,7 @@ int clk_notifier_register(struct clk *clk, struct n=
otifier_block *nb)
>  {
>         struct clk_notifier *cn;
>         int ret =3D -ENOMEM;
> +       bool entry_found =3D false;
> =20
>         if (!clk || !nb)
>                 return -EINVAL;
> @@ -4367,12 +4368,15 @@ int clk_notifier_register(struct clk *clk, struct=
 notifier_block *nb)
>         clk_prepare_lock();
> =20
>         /* search the list of notifiers for this clk */
> -       list_for_each_entry(cn, &clk_notifier_list, node)
> -               if (cn->clk =3D=3D clk)
> +       list_for_each_entry(cn, &clk_notifier_list, node) {
> +               if (cn->clk =3D=3D clk) {
> +                       entry_found =3D true;
>                         break;
> +               }
> +       }
> =20
>         /* if clk wasn't in the notifier list, allocate new clk_notifier =
*/
> -       if (cn->clk !=3D clk) {
> +       if (!entry_found) {
>                 cn =3D kzalloc(sizeof(*cn), GFP_KERNEL);
>                 if (!cn)
>                         goto out;

How about using list_empty()?

	if (list_empty() || cn->clk !=3D clk)

Then the diff is very small.
