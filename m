Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E70C0015E
	for <linux-clk@archiver.kernel.org>; Tue,  1 Aug 2023 20:38:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231740AbjHAUi0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Aug 2023 16:38:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232432AbjHAUiZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Aug 2023 16:38:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C5D0210A
        for <linux-clk@vger.kernel.org>; Tue,  1 Aug 2023 13:38:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8532B616D7
        for <linux-clk@vger.kernel.org>; Tue,  1 Aug 2023 20:38:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC507C433C7;
        Tue,  1 Aug 2023 20:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690922303;
        bh=K7dTvrA5Yvx4XVJe0r5mGCj4OqU4a8CaGI1Dw0s7EUg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=kNdyCKZN2ZLra7bk/juopOBj1QNKpttUlgvF1+XJng4Lz41ysXRP0EUgW4H9issr3
         qDjntEvdzLhT/d+/3gt7ozV2S3Hib8IofIVEdl3Na2AEQqswbbFm9J4hsG2gp4ItQ/
         W72NkZm1L85AYcDaAJ7pCL0r8w1ALhkPYRbKlll+GnR9KCQlOK+tF6fNM+/0GufNgn
         WOQnfG1iUeuYIG9dgVMjnUrikLQNX/T6SyUIST0qOKybCQD4NUnawO0pjlRSARzMG+
         hK0hDxJnjjkWT/4wmZpPVYDFq8vCLtbiqKXEAt0iR4jTxo2iIMvwU/npseVnAF+45p
         cEBzAZvzpoclw==
Message-ID: <edb4501ba28b2b4be8ef3d8fa7eeba9b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230731081803.vua6hyxhofasvrsm@pengutronix.de>
References: <20230721071846.111663-1-u.kleine-koenig@pengutronix.de> <20230731081803.vua6hyxhofasvrsm@pengutronix.de>
Subject: Re: [PATCH] clk: versaclock3: Switch to use i2c_driver's probe callback
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, kernel@pengutronix.de,
        Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Date:   Tue, 01 Aug 2023 13:38:20 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Uwe Kleine-K=C3=B6nig (2023-07-31 01:18:03)
> > Hello,
> >=20
> > this driver appeared in next today. It would be great if this patch
> > could be added on top to not interfere with the quest to remove
> > .probe_new directly after v6.6-rc1.
>=20
> my eventual plan is to send the patch removing .probe_new() around
> v6.6-rc1 with the intention to get it into next early during the merge
> window. So if this patch doesn't make it in before v6.6-rc1, I'd send it
> together with the change dropping .probe_new() for Wolfram to apply as
> in today's next-20230731 there are only two drivers left making use of
> .probe_new (and the maintainer of the other driver already agreed to fix
> their driver with a patch going in via i2c, too).
>=20
> So in my order of preference, the options here are:
>=20
>  - patch is applied via clk before v6.6-rc1

This option is now the plan.

>  - patch is applied via i2c together with change dropping .probe_new()
>    with a clk maintainer's Ack.
>  - patch is ignored and goes in without an Ack via i2c.
>
