Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E119B39E6FF
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 11:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773314132; cv=none; b=dQ5mkYzPJhxxKedhGMzgCMjbklYmycCUT51jxp9u5vEjVur/QaXxtqAEuzwkrZMYtgEZKTIccvsKnFfiyqVpq1XoZCWj2U2c20ejZGS5bA/jrDg3F299VEYEdb+wRPUlQPVS8tWK95l+m1qP/B5IQodS+046eFgyY21+n/DI7Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773314132; c=relaxed/simple;
	bh=mVSTiklgT8j2fcLLBeE0uC2mMSd0YvRYVEMiGlYCFRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EQUlByyLjMkz7rIw8lgWUj3iuKroklC1fF9Ehg6RkML5ZmMHULP90KWeM+z48W0u5CbwM7kBr1+/d69poji/4XhlGobLMeRTyLfyaZ/00XAsUtQ7Aj7wlBbY+JRrprpBqfWdtdPhEb1ZOCsHtuPGegeKoatuoSS7eQ96Izr2e2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FKfL5WS0; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FKfL5WS0"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4853f2826f7so7940825e9.1
        for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 04:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773314129; x=1773918929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfRnDFh2VU0AWQY5oFOwQ40Dt8Qug7bA+xDy5JGD8pY=;
        b=FKfL5WS0SMNkxGZntTuKtrj52AOGiMvhboUJ69/l6qm3kJgAgbBvYyw3e6keBUt5CO
         pQpii9gzbfp4oMaD6DyNbyIvdWAD97CnTnR/OCCfo/UywLIzsL4byUo1VOoVEKH2kyBa
         8YZ8wKnM/2JsRexuMhRruj4V3kUwU+iozAoZqnokhUSa93Yd9ZaUmRRFv1Ib984dsWHS
         3LSB3lQRaDJYorF/jEJoZCc0nen3Ai0fcMmhMSjZHLbtaVjaC9smTi8OmwqbwRZNbBO/
         B/hfDauamYlwTRT6AqFvf9p5rV7IOT0SZCy9km1yUA9UTXiIHMfC5CSOHPoILeMFfTU9
         rvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773314129; x=1773918929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bfRnDFh2VU0AWQY5oFOwQ40Dt8Qug7bA+xDy5JGD8pY=;
        b=XQ1vO3ZeY1y46Q3d4qd0LWTy/kJH/jd2U3x80BnSh++PVwQoc2Cjxe/iqZPy/mWm6F
         IqqHQF3t1xnjs0A94ea2bEAiAhZyk3noZSmrbKseQ5ZONhkhLGeROj/+6h+gKLjWAaXh
         WSnBVDmVAFb73rWtLW/0Om8BognNrR8hv24nzmYlmBAOjIzUsZss//ChVe84RtR2PijA
         PVZiA634aY6t7R46avVIQfY4xAc+63btbGI2F56T/A+TtE8Jl5uZK5eyzvSywIy+YCVv
         ULv7PNUyFE715YlctMtpGr8TSiAe9yM6Zpk1kz0qRnZPu5fSCLN63ZYKayLvLu6QsG5r
         RaTg==
X-Forwarded-Encrypted: i=1; AJvYcCU3Z963g0d8Uq3BPEBxcy88WmtG2nRX68co0zsInOgdFRrQz9cmkaOR0/E8VhG/SdR/uSBjaPmadao=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywoi3ohUSlK4cuNCNd6YXvA4UK+agzxVXW9rq3m6pxDzj/rbcrl
	veROVSKJYxL6JBxZ2zXh9P3juottBNAhlQeT+Ar3+Ijc0x4lEtL4IzyB
X-Gm-Gg: ATEYQzzur5rVbdVhAKTZxFe+LBNsIv9rjpGNcWNHXQU3uv5ramw1gV3775wWgokM/Tr
	k2FVrFPGs0l6Z2b181GKViaXCv8DIcN9fyVenTeVFPDQmgpU+aAJdwzEo156OQmy+6c7kpmIxiP
	wn0jwjkzXYdZO0g5S4cAwzpRrTWAXgS4lQzOosDkUZ+cNTaXIr1VaAosRDex5TbvtR6N73vaOs2
	EaLUmfKpGO7N/7K+cf1vnxHJQZ8PidxjcUg94q6sNcDJvx7OJJimertXUqPeOWC8fnSDSHNvb19
	4loDToOhH2UITyBbqhozOf3v8TYknEK2rxW/mMc3Uc12T2XRm2lCos+1RHDRfbcMQtOP79SwjG0
	WtWtM/pUsql0PCsm+OKstwFeVxDAyMyHgElrS6Tg6HC0PkAizz9XVtzYiKfwj1h0NyBaZ83ZsFw
	nP2td5rIamClLqibrp/iMHBqMroTv7wXn3qJitIakseO7NYPtiWt+UMylMYpdhZEuXn860UdUTr
	LUBT76oyfpdzIfrr7S0YcvCOUQtxYPBjE8L8Q==
X-Received: by 2002:a05:600c:1e8f:b0:485:2ce2:4c8a with SMTP id 5b1f17b1804b1-4854b0a4c24mr99535165e9.1.1773314129024;
        Thu, 12 Mar 2026 04:15:29 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:fc52:7d64:32f4:e21e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f708sm311458385e9.11.2026.03.12.04.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 04:15:28 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/2] clk: renesas: r9a09g056: Add PCIe clocks and reset
Date: Thu, 12 Mar 2026 11:15:20 +0000
Message-ID: <20260312111521.115392-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312111521.115392-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260312111521.115392-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add clocks and reset entries for the PCIe controller.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g056-cpg.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g056-cpg.c b/drivers/clk/renesas/r9a09g056-cpg.c
index 549c882f9a18..6f9aefd5f069 100644
--- a/drivers/clk/renesas/r9a09g056-cpg.c
+++ b/drivers/clk/renesas/r9a09g056-cpg.c
@@ -505,6 +505,10 @@ static const struct rzv2h_mod_clk r9a09g056_mod_clks[] __initconst = {
 						BUS_MSTOP(8, BIT(6))),
 	DEF_MOD("gbeth_1_aclk_i",		CLK_PLLDTY_DIV8, 12, 3, 6, 3,
 						BUS_MSTOP(8, BIT(6))),
+	DEF_MOD("pcie_0_aclk",			CLK_PLLDTY_ACPU_DIV2, 12, 4, 6, 4,
+						BUS_MSTOP(1, BIT(15))),
+	DEF_MOD("pcie_0_clk_pmu",		CLK_PLLDTY_ACPU_DIV2, 12, 5, 6, 5,
+						BUS_MSTOP(1, BIT(15))),
 	DEF_MOD("cru_0_aclk",			CLK_PLLDTY_ACPU_DIV2, 13, 2, 6, 18,
 						BUS_MSTOP(9, BIT(4))),
 	DEF_MOD_NO_PM("cru_0_vclk",		CLK_PLLVDO_CRU0, 13, 3, 6, 19,
@@ -628,6 +632,7 @@ static const struct rzv2h_reset r9a09g056_resets[] __initconst = {
 	DEF_RST(10, 15, 5, 0),		/* USB2_0_PRESETN */
 	DEF_RST(11, 0, 5, 1),		/* GBETH_0_ARESETN_I */
 	DEF_RST(11, 1, 5, 2),		/* GBETH_1_ARESETN_I */
+	DEF_RST(11, 2, 5, 3),		/* PCIE_0_ARESETN */
 	DEF_RST(12, 5, 5, 22),		/* CRU_0_PRESETN */
 	DEF_RST(12, 6, 5, 23),		/* CRU_0_ARESETN */
 	DEF_RST(12, 7, 5, 24),		/* CRU_0_S_RESETN */
-- 
2.53.0

