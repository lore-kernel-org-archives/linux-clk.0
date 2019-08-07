Return-Path: <SRS0=sie6=WD=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9AD4C32751
	for <linux-clk@archiver.kernel.org>; Wed,  7 Aug 2019 22:34:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF2812171F
	for <linux-clk@archiver.kernel.org>; Wed,  7 Aug 2019 22:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565217271;
	bh=YCmEbZC0IvNbxtrB97sZ8Wb1n3BqOMJs7ZEla0sxQ7k=;
	h=In-Reply-To:References:From:Cc:To:Subject:Date:List-ID:From;
	b=SHacZ8sukXxekAVDywJpBOUsUuFrh+jNQzFAcr+YA6f4KQIig4juzXZ6gGfTwnrut
	 8l+mzsvpFzaLkLasADYbUMLQbh6xW1UmLPQEJOAGDbfU49nyf36Wvt43JpCT68hCcN
	 BJ1NSVbWpplQXsHS9M6SXOGzxA0zmYba/vIWsp+Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388945AbfHGWeb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Aug 2019 18:34:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:55800 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727213AbfHGWeb (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 7 Aug 2019 18:34:31 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3D803214C6;
        Wed,  7 Aug 2019 22:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565217270;
        bh=YCmEbZC0IvNbxtrB97sZ8Wb1n3BqOMJs7ZEla0sxQ7k=;
        h=In-Reply-To:References:From:Cc:To:Subject:Date:From;
        b=KxPxeTY5JgKjmjkRw6lKNZ1ggpSMV+LMu6M3T6jL2NNKSHR6smUvupQv9lVJwddxL
         3P1+sBpVmZw0aHpMCFAzd29xAUHJADc951XPzXVIvEqtbr78c63x8tuxUmoYoIb14q
         jcgK/Fy00eggXLyJbmv0DHAcc1brv9RZ4c0OMmTk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190804163328.6693-1-nishkadg.linux@gmail.com>
References: <20190804163328.6693-1-nishkadg.linux@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>,
        linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
        mturquette@baylibre.com, t-kristo@ti.com
Subject: Re: [PATCH] clk: ti: dm814x: Add of_node_put() to prevent memory leak
User-Agent: alot/0.8.1
Date:   Wed, 07 Aug 2019 15:34:29 -0700
Message-Id: <20190807223430.3D803214C6@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Nishka Dasgupta (2019-08-04 09:33:28)
> In function dm814x_adpll_early_init, variable np takes the value
> returned by of_find_node_by_name, which gets a node but does not put it.
> If np is not put before return, it may cause a memory leak. Hence put np
> before return.
> Issue found with Coccinelle.
>=20
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---

Applied to clk-next

