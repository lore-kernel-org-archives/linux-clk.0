Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60149340282;
	Sun, 30 Aug 2026 17:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788110982; cv=none; b=Sr40EAnBZVK9tX1t4r6kyUJensYz0m9xCRHw8AccH44W3osVHIpqnIrw2v9SIj+BTx2AbDwRJpyEh6mASo1QWBipuoZWqmrSj/ovAm3YyFI9G45/Oh70f6GYoyDmfp691BPSUTaGHc73880nikrCWkrZxT9QGkNCpCxJQHMDCHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788110982; c=relaxed/simple;
	bh=7mZhCSlLWzot9SAVOkb7Yd/v9zqlyaXu2WWRQ3+CS9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jhDJ9+y5vFufpkN5c2yCqlpv8Hi4LIvNsVFbDU0cNivDFoeyhrxYMBB3039Q38qFcWkwMfC5U1jtyO0pnjKnaCdLiCt4Mvpg4WwuUJGM2ccmhj4O1c1N/aRdhbCtFDosfs1fDHyaQmq3+I+Lpn/Tj447B7pUISmy2K7g1EvaHDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=VJ2Y3h/s; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="VJ2Y3h/s"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=y8EWALKMsn0yqDus0dEK4QAKpzd7V5rJBTqkM69q4yw=; b=VJ2Y3h/sKsuShouVP+qsI5feF8
	07lGE4m9SSc3zoeeIiPkTebNEkflogG4Tl1LVrJuS+Asx0tCrqqdUFuipcSUQ59nhz30/WVOEngjP
	QEpCvWiab4PwtoWhEJR2G0Ya8G2JOfUE5yFa9viPgRpjL1O/EGfq70w7ZdQ95hS/OMtMa5KHl26uD
	GZD+MC18iBWox9uZ5Pn5u830EH1Kpza/hw/fAdVxrHbrkdGc8xaVKe1kxtdmEWh7Pwd1Q+kZXUTfQ
	OlMXXOi5s/QiOSOMsHZc9CAu/HxVSqn36iJL13Z1IPzFsAQfd5JuQhMbsd40TaMzaYqSk1qRpObre
	kMBKl7wA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1x0jLd-0000000AClZ-1vsa;
	Sun, 30 Aug 2026 19:29:37 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Yixun Lan <dlan@kernel.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	stable@kernel.org,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH] clk: spacemit: k3: add 2.0 GHz PLL3 and PLL4 rates
Date: Sun, 30 Aug 2026 19:28:54 +0200
Message-ID: <20260830172925.3245444-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Starting with version k3-br-v1.0.7, the vendor U-Boot configures the C0
and C1 CPU clock domains (X100 cores) to 2.0 GHz instead of 2.2 GHz.
PLL3 feeds C0 and PLL4 feeds C1, but their rate tables currently contain
only the 2.2 GHz overclocking operating point. This causes the linux
kernel to hang at boot.

Add the 2.0 GHz configuration in both tables to fix the issue. Tested
with both k3-br-v1.0.5 (X100 running at 2.2 GHz) and k3-br-v1.0.7 (X100
cores running at 2.0 GHz).

Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: stable@kernel.org
Fixes: e371a77255b8 ("clk: spacemit: k3: add the clock tree")
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 drivers/clk/spacemit/ccu-k3.c | 2 ++
 1 file changed, 2 insertions(+)

The related U-Boot change is available at:
https://github.com/spacemit-com/uboot-2022.10/commit/274f664150dade144df265baf7dc8e15dd9cce52

diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
index d676a692bccb4..40a2dab1a2a71 100644
--- a/drivers/clk/spacemit/ccu-k3.c
+++ b/drivers/clk/spacemit/ccu-k3.c
@@ -30,10 +30,12 @@ static const struct ccu_pll_rate_tbl pll2_rate_tbl[] = {
 };
 
 static const struct ccu_pll_rate_tbl pll3_rate_tbl[] = {
+	CCU_PLLA_RATE(2000000000UL, 0x0b292aaa, 0x0000ab00, 0xa0558686),
 	CCU_PLLA_RATE(2200000000UL, 0x0b2d3555, 0x00005500, 0xa0558787),
 };
 
 static const struct ccu_pll_rate_tbl pll4_rate_tbl[] = {
+	CCU_PLLA_RATE(2000000000UL, 0x0b292aaa, 0x0000ab00, 0xa0558686),
 	CCU_PLLA_RATE(2200000000UL, 0x0b2d3555, 0x00005500, 0xa0558787),
 };
 
-- 
2.53.0

