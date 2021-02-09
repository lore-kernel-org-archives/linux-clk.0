Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58B1AC433E0
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 18:47:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 046ED64EC5
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 18:47:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233011AbhBISpq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Feb 2021 13:45:46 -0500
Received: from mailoutvs33.siol.net ([185.57.226.224]:49800 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S233407AbhBISbu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 Feb 2021 13:31:50 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Zimbra) with ESMTP id 2AAB0523182;
        Tue,  9 Feb 2021 18:59:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id iCj0Jj0GTsju; Tue,  9 Feb 2021 18:59:08 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Zimbra) with ESMTPS id D8FAA522FAE;
        Tue,  9 Feb 2021 18:59:08 +0100 (CET)
Received: from kista.localdomain (cpe-86-58-58-53.static.triera.net [86.58.58.53])
        (Authenticated sender: 031275009)
        by mail.siol.net (Zimbra) with ESMTPSA id A5EF85233C8;
        Tue,  9 Feb 2021 18:59:05 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, wens@csie.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
        Andre Heider <a.heider@gmail.com>
Subject: [PATCH v3 1/5] clk: sunxi-ng: mp: fix parent rate change flag check
Date:   Tue,  9 Feb 2021 18:58:56 +0100
Message-Id: <20210209175900.7092-2-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209175900.7092-1-jernej.skrabec@siol.net>
References: <20210209175900.7092-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

CLK_SET_RATE_PARENT flag is checked on parent clock instead of current
one. Fix that.

Fixes: 3f790433c3cb ("clk: sunxi-ng: Adjust MP clock parent rate when all=
owed")
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Tested-by: Andre Heider <a.heider@gmail.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/clk/sunxi-ng/ccu_mp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu_mp.c b/drivers/clk/sunxi-ng/ccu_mp.=
c
index fa4ecb915590..9d3a76604d94 100644
--- a/drivers/clk/sunxi-ng/ccu_mp.c
+++ b/drivers/clk/sunxi-ng/ccu_mp.c
@@ -108,7 +108,7 @@ static unsigned long ccu_mp_round_rate(struct ccu_mux=
_internal *mux,
 	max_m =3D cmp->m.max ?: 1 << cmp->m.width;
 	max_p =3D cmp->p.max ?: 1 << ((1 << cmp->p.width) - 1);
=20
-	if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT)) {
+	if (!clk_hw_can_set_rate_parent(&cmp->common.hw)) {
 		ccu_mp_find_best(*parent_rate, rate, max_m, max_p, &m, &p);
 		rate =3D *parent_rate / p / m;
 	} else {
--=20
2.30.0

