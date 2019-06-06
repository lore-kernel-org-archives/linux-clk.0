Return-Path: <SRS0=srpp=UF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7AE6C04AB5
	for <linux-clk@archiver.kernel.org>; Thu,  6 Jun 2019 18:19:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B30612089E
	for <linux-clk@archiver.kernel.org>; Thu,  6 Jun 2019 18:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559845181;
	bh=k0U/cV4ToF8sV6+jzIadFS/4j0lrin0TjDKsuv3/2VQ=;
	h=In-Reply-To:References:To:From:Subject:Cc:Date:List-ID:From;
	b=GJHFdgkZpmpyJzdvMrPR/T2aNM09kS/Wp/ygKae1g2/pHegFvRAkgHR2bVvp7+XK7
	 pWM8CEtbrV2QEQRNCN7gutCB4eNzTb58L66a+Mw8E020CsVKVlnh7k31sPT+4HpvR/
	 JroRFv/EEzPv8LAw+AfwdUdIoWRAlPqtHq7jrkU8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729373AbfFFSTl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 6 Jun 2019 14:19:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:57394 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727559AbfFFSTk (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 6 Jun 2019 14:19:40 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 33DC72083D;
        Thu,  6 Jun 2019 18:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559845180;
        bh=k0U/cV4ToF8sV6+jzIadFS/4j0lrin0TjDKsuv3/2VQ=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=tRmd9B5du30UIJKGe/JIpCfE7RsI7ISa5dowGpEkn9JN3SAuBLS7CMQ4mpajw3GQi
         Y9DMKWDbtcsmCbjBqrsHQG44LCaRK/DuPCHbkdp9VZsGKpQxtR7NQqwyaoUCHsdNCJ
         gY7dO668aNXpDfNopLwdqoKqWLbnq6AL+StjGCDg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190530065557.42741-1-tony@atomide.com>
References: <20190530065557.42741-1-tony@atomide.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: ti: clkctrl: Fix returning uninitialized data
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
User-Agent: alot/0.8.1
Date:   Thu, 06 Jun 2019 11:19:39 -0700
Message-Id: <20190606181940.33DC72083D@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Tony Lindgren (2019-05-29 23:55:57)
> If we do a clk_get() for a clock that does not exists, we have
> _ti_omap4_clkctrl_xlate() return uninitialized data if no match
> is found. This can be seen in some cases with SLAB_DEBUG enabled:
>=20
> Unable to handle kernel paging request at virtual address 5a5a5a5a
> ...
> clk_hw_create_clk.part.33
> sysc_notifier_call
> notifier_call_chain
> blocking_notifier_call_chain
> device_add
>=20
> Let's fix this by setting a found flag only when we find a match.
>=20
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reported-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Fixes: 88a172526c32 ("clk: ti: add support for clkctrl clocks")
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

Applied to clk-fixes

