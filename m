Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E51337E2F8
	for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 10:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777543724; cv=none; b=Z0rfuX6qJ77eVc/huh6ATlr+gjsuHLXKqguI4jkP8bgMm0I8uGQzBz4VIvxO+Q0TmbnKmOlwJN8jr4Bigv8NZZfYGxzPN8pANBnsuHy2e9fQby1moKmrc21lpxPTPUAK5POnMIcdtPZ7z7yWjQO0gThndZKJnYaciPurK/+Juzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777543724; c=relaxed/simple;
	bh=CvWbtYBi8ENn+U8ThAwDO3/26YkOEu1S3TBFGLINxNI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PhfBDc9OaoufcbZngriNp5Ggwr0krKR84XDclNk2RK8IPju+zCJ3OH00OGrTadsfd+CqVds6jEnzj24C5N5RT0t1R0ru+kAIqD0ShesWhtCI9Kn5Tu7kWVFunxCClmgbxZ4V9zjFqyt/evm59WOZJBHMdh35QFfdXgpOtZVr/3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=il9l5Jln; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="il9l5Jln"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so7029855e9.0
        for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 03:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777543722; x=1778148522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1ChshJVS8LUKfqw0vxyMwMMt0DdEqRzBhSpf+u1agpg=;
        b=il9l5Jln6gt+vOQ+qmr4fQLT5Qq0qk8ddEfjWX7KObljQnCCf5qz9WsRt2p9KQk3rv
         bgcOhshi79vKd1FpZh90oM2L264neOo8aQ1OHhNUzBfbd3En3ahShkkYzf+GbnV/zwrM
         LylvLvSCg2LSxKGV0zrhyvh6Qwj2uRQBFDYpI/fNVfPD7IWpXNiKUKPxr/llbWp8/QV6
         QWHE+ghWLWfeZEL0ApN4apGvUYB0QDymizd1YRcWBrqoDPkWkmoN2TroHPtwsPfNKpdX
         IwsU0VFZf24kvJVMNnNmHrEmf1L4+PLaOvi8fCbAOdPMso69Ace3YC2d8lfcqkbeyp9Q
         xolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777543722; x=1778148522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ChshJVS8LUKfqw0vxyMwMMt0DdEqRzBhSpf+u1agpg=;
        b=gTe75A0grtv+fN8CmjmbYZUyBq+9A+bTIUq/0XH6/F5Zggcy6PXcaPoMv58oiERs7U
         FJ3kff62ma+VNvyD6SWxFNzior8CgD53J13lejWf/RL9ZUlkeUu+zbiB1bSUMNEIcbhV
         yHUu2S9H3287vdteHxAo50ulXcl5AWQlr03szpll4idWTG33d24IutxXSg+oSZsc3OHv
         52gTJUIkcvAANslPalA5p2qTSlAwWmVVGocmYP8fTW4metEB/N60zOpMXp9Lf+rMavdp
         s9U77wPtl4DnHarBqVFjLLgsc3ISNc9+aWijMIEIpMdj7a9mokR6LkRaSMYUwAN7tv45
         yeug==
X-Forwarded-Encrypted: i=1; AFNElJ/KP146lDMR3q8DQaBJ2WzS4gBk65P6a0fMj+a3I0m/J9+ALFb2T/1SixIoQFMI5DBn7AzwDcSJPFM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBROh5fT3TNimxZpArOcBrAcWlkCQ2IOtwbK+uaZJHE/92Lpl4
	uW3WBAZOwr44t4+5aUIR45lrCsxtHDiZEyFX7gK0p6gPUxM044JN1u9h
X-Gm-Gg: AeBDieveoythm2e6jpaGj5P9zWtBrKLFM2bOOpNhhlxr4utLPuwGFtZHVKIHozWkMHF
	S8ttJ7egtthH3NF84h8cZzl+ee3jOYm1b5Yk8qdDiulAMx0QkMus/yjGn3T3QckeEBcFlRkMAyC
	RGndjs2bePNnot7x7k27CA28Z3k/GPzG7UsO/zecCLkLv8PsQrwXXyLYiLMwZDLaeXyaGTNFEvx
	GwY0kIzwavsC/jZcw5/8IAHNG0VyLLQasEzh8g96RlyMK7j/ibXq7wuxtBDC3imzWW7geanldrP
	wP9CD9mN+XDoAKXAhjFx8+SzAjU+hso2SLMcTBR18a6uq/xQ9K56UfBztsSRK0k1IVs6hp9mHeX
	4A5O+M68frOO8R0X1B/OimSbFyhrB4SI268PXKozWiA0oX796L75hW7tlTK37lDp82m1jlUxaS5
	SYvBQY+7eS6nNxClsSM7kTw3MvFoee0Bku7RlGLIUt4FDgzSgIP8pc0jo1
X-Received: by 2002:a05:600c:3594:b0:488:c40b:c8bf with SMTP id 5b1f17b1804b1-48a83f6e20emr37376795e9.2.1777543721451;
        Thu, 30 Apr 2026 03:08:41 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:342:901:e785:f7d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a822bf3ffsm60925245e9.7.2026.04.30.03.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 03:08:41 -0700 (PDT)
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
Subject: [PATCH] clk: renesas: r9a08g046: Add IA55_PCLK to critical module clocks
Date: Thu, 30 Apr 2026 11:08:16 +0100
Message-ID: <20260430100838.157306-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add R9A08G046_IA55_PCLK to the critical module clocks list to prevent
the clock from being gated during suspend, as it is required for the
interrupt controller (IA55) to function correctly.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g046-cpg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index ce9503c3cfd1..0004b9516fdf 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -312,6 +312,7 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
 
 static const unsigned int r9a08g046_crit_mod_clks[] __initconst = {
 	MOD_CLK_BASE + R9A08G046_GIC600_GICCLK,
+	MOD_CLK_BASE + R9A08G046_IA55_PCLK,
 	MOD_CLK_BASE + R9A08G046_IA55_CLK,
 	MOD_CLK_BASE + R9A08G046_DMAC_ACLK,
 };
-- 
2.43.0

