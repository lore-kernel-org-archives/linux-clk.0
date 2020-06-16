Return-Path: <SRS0=U6aT=75=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A090C433DF
	for <linux-clk@archiver.kernel.org>; Tue, 16 Jun 2020 16:32:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 638A320882
	for <linux-clk@archiver.kernel.org>; Tue, 16 Jun 2020 16:32:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="SXPTSklM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729167AbgFPQcj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Jun 2020 12:32:39 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:18568 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730588AbgFPQcj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 Jun 2020 12:32:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1592325157;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=2OUjss8yQVXHEhs9rPhZssQVMH5EL8SZm/7jUhiDHtA=;
        b=SXPTSklMVrOdRXCAZZqMtZ4WYNroOiI5w21GP+nOTffgzbFnBIrAEzLPBq9QbyvcO/
        bS7xu8S179O2agPhmgO2LCPngIaKZ7izQzQlJc5O9b40HIFf1ynuMAO/QePUI5ThWG27
        7OCL4zLuQ8NfjDYcRumzC2eC26O9wPi21IY1ZEwM3ApO7n78dtHQViYIuEyOBHdG0KYb
        ZCprSTo3f3pXqZhW1lVfsuS2NJhuvEUDXaOQZud2Nc+YoTpQxScN5TeKdHGF5A5j0IwI
        DB8DZpzMNc9MGhd5F+l5zQ2NunFaU0ntcKIfN2aTun27wa4hbub79bwW2hPlC//NckL9
        tTGg==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8WdEaEuFwQ=="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 46.10.4 DYNA|AUTH)
        with ESMTPSA id a0ab6bw5GGQdFwU
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 16 Jun 2020 18:26:39 +0200 (CEST)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, wsa@the-dreams.de, geert@linux-m68k.org,
        magnus.damm@gmail.com, Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v4 3/3] clk: renesas: rzg2: mark RWDT clock as critical
Date:   Tue, 16 Jun 2020 18:26:26 +0200
Message-Id: <20200616162626.27944-4-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200616162626.27944-1-uli+renesas@fpond.eu>
References: <20200616162626.27944-1-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Ensures RWDT remains alert throughout the boot process if enabled.

This patch applies the change to the following SoCs: r8a774a1,
r8a774b1 and r8a774c0.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/clk/renesas/r8a774a1-cpg-mssr.c | 1 +
 drivers/clk/renesas/r8a774b1-cpg-mssr.c | 1 +
 drivers/clk/renesas/r8a774c0-cpg-mssr.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/clk/renesas/r8a774a1-cpg-mssr.c b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
index e05bfa200480..fd54b9f625da 100644
--- a/drivers/clk/renesas/r8a774a1-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
@@ -237,6 +237,7 @@ static const struct mssr_mod_clk r8a774a1_mod_clks[] __initconst = {
 };
 
 static const unsigned int r8a774a1_crit_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
 	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
 };
 
diff --git a/drivers/clk/renesas/r8a774b1-cpg-mssr.c b/drivers/clk/renesas/r8a774b1-cpg-mssr.c
index c9af70917312..f436691271ec 100644
--- a/drivers/clk/renesas/r8a774b1-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774b1-cpg-mssr.c
@@ -233,6 +233,7 @@ static const struct mssr_mod_clk r8a774b1_mod_clks[] __initconst = {
 };
 
 static const unsigned int r8a774b1_crit_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
 	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
 };
 
diff --git a/drivers/clk/renesas/r8a774c0-cpg-mssr.c b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
index f91e7a484753..9fc9fa9e531a 100644
--- a/drivers/clk/renesas/r8a774c0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
@@ -238,6 +238,7 @@ static const struct mssr_mod_clk r8a774c0_mod_clks[] __initconst = {
 };
 
 static const unsigned int r8a774c0_crit_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
 	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
 };
 
-- 
2.20.1

