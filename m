Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC19236F407
	for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 11:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769774337; cv=none; b=IaRLs0YFx/EXAciVq/ut7tJfB2lJCPxJNrbQx94jrwheC8PagA/I2LPIvneMQcfgyeDK2oxU2H4NutgQWIJRINb1BbkcOjpIZRav+mNZZ8YplXh1O2yRCY2T9+IX/gnPR/ICjPGy4Rua3KSOXgQNTg8WEHqSM8iitoPY9dqR5tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769774337; c=relaxed/simple;
	bh=KefAlO+NM/X4AH06AuNLpw4gAKi3rKcm5QO5l2tyg3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QCPK/o1Cc6zN9LEMUC9ngSzLs7pH6aDlF5HCVrGW3IfX+dmlJB3vvX+1/3wDbjUQB6puz05+eYiGO4yb1L+/f4PKCx/jDHD/6u6fy6isKTtlNitGF26URvjFUeckqTUbHeV6vI0DIsTVAEoCU+W5J9+BQQhqcZXC4xAPxmEOpJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RqIRWMFY; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RqIRWMFY"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6581234d208so3697204a12.3
        for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 03:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769774334; x=1770379134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JyG64XmyWIdVs7sZ4Rn6fZ3iJE9VgCVPcmxB8ieVcgI=;
        b=RqIRWMFYY2mlK92hrDZ4SYRSNxv+liMz7/9I09nkgnzU8l+njgNgfomp0lmqXyqIf8
         ww0se3gIvxAIltmwxCOjt4PjIhklMUyoWJFeQz1NLcmtVClXRxcysX80EyZ6qDdgiA5y
         lpWkLy7ngAlxvIiL2Gsq8VXdb79NCJQanDGDkSDkXVUVBDnQFdC+q7uBQRoCD65lMjU/
         G8UClom5x1FQQrIOv+a72IDpylXLpvkmuG+q2Diw8ss7irm4yaxcvu6rXwb9lonBFAff
         i787+ZjANTGLXVnN9VzU37e7ub/gc6xEUV3J4U+Bg2AhbnbeBjKeNsmqINh6iSEJxTyL
         fyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769774334; x=1770379134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JyG64XmyWIdVs7sZ4Rn6fZ3iJE9VgCVPcmxB8ieVcgI=;
        b=FRR+gnL9BJEHX4OWUq2NQlX4lvum0hFHRL2DbihjHVz0IbWqNBmHvUP9/el4NpNxjS
         bAqB8KHW22G4+j1UPTIR5LbqIHicfMKcWvGMYnhNtl/Z+oTXQegX60GQ4nBKfiGr4B8h
         HNu6GVoonx24m2PEYgWiOMbgm26B7bgAO3oCg05y/ieieBBEXmUW6T2OHlvMAqmSiUzU
         GhkXZY550X/0x0WIccaOdW5QZGuoAu0bf+LxYb2f3elpprTSVrNdjHjh5LPzki5I34ew
         D9E8mfkYA1x5R49nAExp2Xx/ZbC1Bw2VZYSpp2nxJB/6dfQL1AhLxjlhZss0u/BEv89f
         BKFA==
X-Forwarded-Encrypted: i=1; AJvYcCWWrf328P4KGpZ6YSR6Lh+YfJoDtRJkdgJ6JDD4oyGNMIlbNUHLPhoPcTUqqfCmRLV0HOyap9jbJb4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQjgIaUFdFmg22SvY1Bmj8oq611f8W3ovn63wrGQqsMSqe4Fio
	yx9rsCrv5ocZ0GbO7Yoa6EBxTo1075LdFW8CVmLJiJNOm1BpDRbOvo6w
X-Gm-Gg: AZuq6aKW/naMttRJG1bxt5/d085UhheMZDZlxTWpiob7lCLqTBxJmi/3njrdcAiIW4o
	jkUK+TY1Zeo9pBKE8fmVndsHhw9NvS/0WmOshVlMEiU3om05F8kDxEm61Mvamd+ryk5MeMKEIez
	42W0Dij4kUbq+NAwJ+xyoeidmTo2RfogvuMS0H7GIx/9wgLNNODQjwEQGRJ5p3rKdhHoXCGRopG
	o2YjjoIgxbMyBZ8gUz+uGybj9GsPwvRRo5Loo+RYUamYwfmffi4nD5ghtoQrFHm8ptypnDyPKex
	/Zz0HeNlnmQLlo0HzoA4hjYR/lC/NVU9FYJ/OCjcLe6c5OAzwt7LZtVCRAIA/RjRpLo+/yMBv2y
	Jq/5hddErlu0um9tmn3Z3UAEAULXrE7mZ/vEJEuTtPgBopAYVDhDl5r7df9o9RK9e88p3LU1oxF
	rhjVAW3DCK9yx0LC7F7esbEwwyc+gE8HdoZqc=
X-Received: by 2002:a17:906:fd89:b0:b87:711f:97a3 with SMTP id a640c23a62f3a-b8dff73a356mr143900366b.35.1769774333695;
        Fri, 30 Jan 2026 03:58:53 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:bd64:2984:fe71:7633])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbeffed15sm404671566b.31.2026.01.30.03.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 03:58:53 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 3/4] clk: renesas: r8a08g046: Add support for PLL6 clk
Date: Fri, 30 Jan 2026 11:58:44 +0000
Message-ID: <20260130115850.253555-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260130115850.253555-1-biju.das.jz@bp.renesas.com>
References: <20260130115850.253555-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for PLL6 clk by registering with rzg2l-cpg driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change
---
 drivers/clk/renesas/r9a08g046-cpg.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index d77934872cf4..cc7d3872e9e4 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -29,6 +29,9 @@
 #define G3L_DIVPL2B_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 5, 1)
 #define G3L_DIVPL3A_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 8, 1)
 
+/* PLL 1/4/6/7 configuration registers macro. */
+#define G3L_PLL1467_CONF(clk1, clk2, setting)	((clk1) << 22 | (clk2) << 12 | (setting))
+
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
 	LAST_DT_CORE_CLK = R9A08G046_CLK_P4_DIV2,
@@ -45,6 +48,7 @@ enum clk_ids {
 	CLK_PLL2_DIV2,
 	CLK_PLL3,
 	CLK_PLL3_DIV2,
+	CLK_PLL6,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -78,6 +82,8 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	/* Internal Core Clocks */
 	DEF_FIXED(".pll2", CLK_PLL2, CLK_EXTAL, 200, 3),
 	DEF_FIXED(".pll3", CLK_PLL3, CLK_EXTAL, 200, 3),
+	DEF_G3L_PLL(".pll6", CLK_PLL6, CLK_EXTAL, G3L_PLL1467_CONF(0x54, 0x58, 0),
+		    500000000UL),
 	DEF_FIXED(".pll2_div2", CLK_PLL2_DIV2, CLK_PLL2, 1, 2),
 	DEF_FIXED(".pll3_div2", CLK_PLL3_DIV2, CLK_PLL3, 1, 2),
 
-- 
2.43.0

