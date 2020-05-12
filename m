Return-Path: <SRS0=sCEi=62=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C510AC2D0FA
	for <linux-clk@archiver.kernel.org>; Tue, 12 May 2020 21:14:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A500120769
	for <linux-clk@archiver.kernel.org>; Tue, 12 May 2020 21:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589318072;
	bh=x1ykHtB8kdv43MjNrYv9yTL3vvMHxeEtb7SiOF0zGCU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=x3/h39XpHpSzgAE3/WwrpcYLtWSrKNv9Bu5zSIwUTc1wTfPt16T4R/GWMSR4jnizz
	 Qy+CxHd73LvUsdwQlZ5860FN597WF3h2R+NaTgIg6NNc0TVmiXUucrMWSb/VYOxX24
	 fOyG8OqyBmsdm7H3YnSdx4chwESYHNykcd4tTWLI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731359AbgELVOb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 May 2020 17:14:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:57824 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725938AbgELVOa (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 12 May 2020 17:14:30 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 67FBD205C9;
        Tue, 12 May 2020 21:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589318070;
        bh=x1ykHtB8kdv43MjNrYv9yTL3vvMHxeEtb7SiOF0zGCU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Pv5FECfH4MEL49Ziffkh69EhmYLpg5SWgUrcrg5TL9PAbMKVc6QCiub6LH4mfUgIr
         ZDxGTDKrNNEq6JhDZ6qngawYA+caVw7TiI9gUe+6vBP4Vg9Ye7eHDISQHuzA3ztOs9
         5YsNSYlb7LOt+sXP1pogE+NbKZEaJTYvCiOFDubQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200506120204.31422-1-geert+renesas@glider.be>
References: <20200506120204.31422-1-geert+renesas@glider.be>
Subject: Re: [PATCH] soc: mediatek: mmsys: Drop <linux/clk-provider.h>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     CK Hu <ck.hu@mediatek.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Matthias Brugger <matthias.bgg@gmail.com>
Date:   Tue, 12 May 2020 14:14:29 -0700
Message-ID: <158931806972.215346.15226593152103612182@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Geert Uytterhoeven (2020-05-06 05:02:04)
> After the split, the mt8173 MMSYS driver is no longer a clock provider,
> and thus does not need to include <linux/clk-provider.h>.
>=20
> Fixes: 13032709e2328553 ("clk / soc: mediatek: Move mt8173 MMSYS to platf=
orm driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
