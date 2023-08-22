Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F011CEE49AB
	for <linux-clk@archiver.kernel.org>; Tue, 22 Aug 2023 22:52:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbjHVWwu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Aug 2023 18:52:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjHVWwt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Aug 2023 18:52:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E0B7133;
        Tue, 22 Aug 2023 15:52:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B3C8B61C4A;
        Tue, 22 Aug 2023 22:52:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D004CC433C7;
        Tue, 22 Aug 2023 22:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692744767;
        bh=yWNdNH98z11k2f6XrB1ayhOgAMMe6RDCicH8KsnHT7g=;
        h=From:To:Cc:Subject:Date:From;
        b=Hiu4BvHGryw/cf0SMNOnRqWCAk6pjbHNi/br7X+APUbz5YDCOHKRIeqsHDXaduB2O
         k2EEdPgeoQAC0c4Sh2+/uGG32klYGK+SMSyfuEt7Vqlhy035HC68FgYlqED2SzFiNZ
         ExvAvTZyAR3RsifUyNdSGZIxCh5/EIiMZewXp2glvf+m/bPvqDhmdI4ee2hAE8YR+z
         uStNVtIgQzmlUrbMr+El1Fc2x1u+ZLxlts0MkOtDwN7Il0YHoB/KGa/sKfIHPfUvuV
         hD4Dg2zGUAMmQWQnI7O8pQ1e17noooK3jqLhQS4OQJluHLIskNpCfic2E+zgOBjH6K
         mZWKGQnHp6Vaw==
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        patches@lists.linux.dev,
        Andrey Skvortsov <andrej.skvortzov@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Subject: [PATCH] clk: Cleanup devm_clk_match() wreckage
Date:   Tue, 22 Aug 2023 15:52:42 -0700
Message-ID: <20230822225245.3624370-1-sboyd@kernel.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The 'res' pointer passed to devm_clk_match() is a pointer to struct
devm_clk_state after commit abae8e57e49a ("clk: generalize
devm_clk_get() a bit"). Update the logic here to convert the void
pointer to the right type so that this is cleaner. Note that this
doesn't actually change anything due to how struct devm_clk_state is
defined to have a struct clk pointer as the first member.

Given we're cleaning things up, split the WARN_ON() into two different
conditions to provide clarity about which condition is false. Also move
the WARN_ON to the conditional so that the compiler is hinted that all
this code is unlikely().

Cc: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/clk-devres.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
index 737aa70e2cb3..979562ee79ba 100644
--- a/drivers/clk/clk-devres.c
+++ b/drivers/clk/clk-devres.c
@@ -184,12 +184,14 @@ EXPORT_SYMBOL_GPL(devm_clk_bulk_get_all);
 
 static int devm_clk_match(struct device *dev, void *res, void *data)
 {
-	struct clk **c = res;
-	if (!c || !*c) {
-		WARN_ON(!c || !*c);
+	struct devm_clk_state *state = res;
+
+	if (WARN_ON(!state))
 		return 0;
-	}
-	return *c == data;
+	if (WARN_ON(!state->clk))
+		return 0;
+
+	return state->clk == data;
 }
 
 void devm_clk_put(struct device *dev, struct clk *clk)

base-commit: 66fbfb35da47f391bdadf9fa7ceb88af4faa9022
-- 
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/
https://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git

