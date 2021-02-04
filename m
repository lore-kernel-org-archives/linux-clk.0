Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D732BC433DB
	for <linux-clk@archiver.kernel.org>; Thu,  4 Feb 2021 18:57:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7EE8C64F59
	for <linux-clk@archiver.kernel.org>; Thu,  4 Feb 2021 18:57:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239360AbhBDS4r (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Feb 2021 13:56:47 -0500
Received: from mailoutvs14.siol.net ([185.57.226.205]:35691 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S239388AbhBDSzm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 Feb 2021 13:55:42 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id BEBBC523FC1;
        Thu,  4 Feb 2021 19:48:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id idPup2N7xS9N; Thu,  4 Feb 2021 19:48:14 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 6D758523FC4;
        Thu,  4 Feb 2021 19:48:14 +0100 (CET)
Received: from kista.localdomain (cpe-86-58-58-53.static.triera.net [86.58.58.53])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 9BE10523FC1;
        Thu,  4 Feb 2021 19:48:11 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, wens@csie.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
        Andre Heider <a.heider@gmail.com>
Subject: [PATCH 1/5] clk: sunxi-ng: mp: fix parent rate change flag check
Date:   Thu,  4 Feb 2021 19:47:06 +0100
Message-Id: <20210204184710.1880895-2-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210204184710.1880895-1-jernej.skrabec@siol.net>
References: <20210204184710.1880895-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

CLK_SET_RATE_PARENT flag is checked on parent clock instead of current
one. Fix that.

Fixes: 3f790433c3cb ("clk: sunxi-ng: Adjust MP clock parent rate when all=
owed")
Tested-by: Andre Heider <a.heider@gmail.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/clk/sunxi-ng/ccu_mp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu_mp.c b/drivers/clk/sunxi-ng/ccu_mp.=
c
index fa4ecb915590..5f40be6d2dfd 100644
--- a/drivers/clk/sunxi-ng/ccu_mp.c
+++ b/drivers/clk/sunxi-ng/ccu_mp.c
@@ -108,7 +108,7 @@ static unsigned long ccu_mp_round_rate(struct ccu_mux=
_internal *mux,
 	max_m =3D cmp->m.max ?: 1 << cmp->m.width;
 	max_p =3D cmp->p.max ?: 1 << ((1 << cmp->p.width) - 1);
=20
-	if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT)) {
+	if (!(clk_hw_get_flags(&cmp->common.hw) & CLK_SET_RATE_PARENT)) {
 		ccu_mp_find_best(*parent_rate, rate, max_m, max_p, &m, &p);
 		rate =3D *parent_rate / p / m;
 	} else {
--=20
2.30.0

