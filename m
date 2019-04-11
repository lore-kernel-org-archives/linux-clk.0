Return-Path: <SRS0=5rVA=SN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF88EC282CE
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 17:36:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C2BEC217D4
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 17:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555004190;
	bh=IPvJyUmzXw+pk/vM6Yk8yoye59NBr3V8GrRyr4FsJ3E=;
	h=In-Reply-To:References:From:Subject:Cc:To:Date:List-ID:From;
	b=tuDXE9awlgWvwWpeBo2GoqYjAzwhCSg1q/Gma2a8co7lt/KKwyQg5H+UBC4fGbKLC
	 YYn8WS1egIN8sA5CqF5kgaevbZ+TMnKhSl5lGPgi0hDQvC9T5J98oBKzdaoIOgVaix
	 JPkjuUPPx2XCl/7XG7lrRJNtColad8WGiGpIAL58=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbfDKRga (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Apr 2019 13:36:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:45792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726912AbfDKRg3 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Apr 2019 13:36:29 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EE8112084D;
        Thu, 11 Apr 2019 17:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555004189;
        bh=IPvJyUmzXw+pk/vM6Yk8yoye59NBr3V8GrRyr4FsJ3E=;
        h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
        b=UzBCcvCmgXJH/xMVyPFtAAlTlmtPbDs4SjSuYuQ+Hyw2x344ZDRTNCDL48GheRaas
         0Nafmk5WTBHmXZyn7RjKaUGLf0OHWTJaR3LvGrG8oGcg8TDQQOOOQUc5cs/P2b6zic
         XnBLECfnywGM0TaOkMneplyfCIoS0Lbco1ijRlQI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190404113722.20634-1-geert+renesas@glider.be>
References: <20190404113722.20634-1-geert+renesas@glider.be>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [git pull] clk: renesas: Updates for v5.2
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Message-ID: <155500418814.20095.8564288702076959777@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 11 Apr 2019 10:36:28 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Geert Uytterhoeven (2019-04-04 04:37:22)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa23=
1b:
>=20
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/clk-renesas-for-v5.2-tag1
>=20
> for you to fetch changes up to b953eaaeb58efc944f51cffd3f6838657958f0f8:
>=20
>   clk: renesas: rcar-gen3: Fix cpg_sd_clock_round_rate() return value (20=
19-04-04 11:54:46 +0200)
>=20
> ----------------------------------------------------------------
> clk: renesas: Updates for v5.2
>=20
>   - Add missing PCI USB clock on RZ/N1,
>   - Add Z2 (Cortex-A53) clocks on R-Car E3 and RZ/G2E, incl. a new
>     helper in <linux/math64.h>,
>   - Small fixes and cleanups.
>=20

Thanks. Pulled into clk-next with the below fix squashed on top.

----8<----
From: Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH] clk: renesas: rcar-gen3: Remove unused variable

This variable is no longer used and the compiler rightly complains that
it should be removed. Drop it to silence the following:

drivers/clk/renesas/rcar-gen3-cpg.c: In function 'cpg_sd_clk_register':
drivers/clk/renesas/rcar-gen3-cpg.c:386:15: warning: unused variable 'i' [-=
Wunused-variable]
  unsigned int i;

Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Fixes: b953eaaeb58e ("clk: renesas: rcar-gen3: Fix cpg_sd_clock_round_rate(=
) return value")
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/renesas/rcar-gen3-cpg.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar=
-gen3-cpg.c
index dc62ed0dadc2..d25c8ba00a65 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -383,7 +383,6 @@ static struct clk * __init cpg_sd_clk_register(const ch=
ar *name,
 	struct clk_init_data init;
 	struct sd_clock *clock;
 	struct clk *clk;
-	unsigned int i;
 	u32 val;
=20
 	clock =3D kzalloc(sizeof(*clock), GFP_KERNEL);
