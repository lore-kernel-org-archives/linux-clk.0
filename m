Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64009C433ED
	for <linux-clk@archiver.kernel.org>; Sat,  3 Apr 2021 06:56:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 264606120E
	for <linux-clk@archiver.kernel.org>; Sat,  3 Apr 2021 06:56:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236109AbhDCG4t (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 3 Apr 2021 02:56:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:46782 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232178AbhDCG4t (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 3 Apr 2021 02:56:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 009BE6120D;
        Sat,  3 Apr 2021 06:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617433007;
        bh=dw1fbVnqDfOx0WRH9hI4Zzll4VBclFklWKbcF+TwmWY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=jizfnI0utbmsEBABJrU83MPNyRr9illbfCnktb+P2hdEIax1/GkYUdgTDozdGwie+
         dqYSw/WsHrxstRezAFyu/wnRlrNxoPMtfU9SMM/yg3l2PdyDZ51KHnAgWKoTOZOZH3
         qEyTuVdQ+32/RGbevXrZ8/dcasNZHPvXaOPGUiEmG+nxchT3ZRnPEV2nBtZrFwMGpN
         eFgyG2AV99xiTemF7rFEJ8EMCnX6oQDo+NEgtq5JluCn9NAAocywZ/dzivwiz8h0aJ
         1meyQWQuOTrny3CXLgJ7t6i9mW/uai4SI6A/v0E2OeJ9KVQ9eXJVD4wEBAtFAYTgyw
         IDviKlTNR0aFg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210401225149.18826-2-lb@semihalf.com>
References: <20210401225149.18826-1-lb@semihalf.com> <20210401225149.18826-2-lb@semihalf.com>
Subject: Re: [PATCH v4 2/2] clk: fix invalid usage of list cursor in unregister
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, upstream@semihalf.com
To:     Lukasz Bartosik <lb@semihalf.com>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Fri, 02 Apr 2021 23:56:45 -0700
Message-ID: <161743300584.2260335.425699097651087484@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lukasz Bartosik (2021-04-01 15:51:49)
> Fix invalid usage of a list_for_each_entry cursor in
> clk_notifier_unregister(). When list is empty or if the list
> is completely traversed (without breaking from the loop on one
> of the entries) then the list cursor does not point to a valid
> entry and therefore should not be used. The patch fixes a logical
> bug that hasn't been seen in pratice however it is analogus
> to the bug fixed in clk_notifier_register().
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
>  ...
>  Memory state around the buggy address:
>   ffffffffa0d10480: 00 00 00 00 00 03 f9 f9 f9 f9 f9 f9 00 00 00 00
>   ffffffffa0d10500: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 f9 f9
>  >ffffffffa0d10580: f9 f9 f9 f9 00 00 00 00 00 00 00 00 00 00 00 00
>                           ^
>   ffffffffa0d10600: 00 00 00 00 00 00 f9 f9 f9 f9 f9 f9 00 00 00 00
>   ffffffffa0d10680: 00 00 00 00 00 00 00 00 f9 f9 f9 f9 00 00 00 00
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Fixes: b2476490ef11 ("clk: introduce the common clock framework")
> Reported-by: Lukasz Majczak <lma@semihalf.com>
> Signed-off-by: Lukasz Bartosik <lb@semihalf.com>
> ---

Applied to clk-fixes
