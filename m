Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4161318146;
	Fri, 13 Mar 2026 07:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773385667; cv=none; b=AaLWHJQ4VYthm/umGd7NZnR0ZORUTiv5U7cfKhNwuUKk6AQDQ9PI4EmBxzcHqwK4dY2tVOekCUQTLDJygH3U3d1aVszsGcCQFuh3sQz1dJ3lCN7beNv2ESBCZlIYCDUUha7mmGhrIWswxm6rLaSizGLqjJCCcc0lMVHo4AKY5p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773385667; c=relaxed/simple;
	bh=vMr1oZvF7jb5/63YSaEnET8Eop/fJZCTx7zN1/cDFic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HkAruCw23P3Cfa0cQXqKGfqW4qq01rGJwDvNtZFLVX33YE+3raWvDxW2zeQmZ5up0dnp4H1l1st9WjKnYTIDLRWyMwYtE+X/9IugBlylk88w3s/eQrmyVn2cVgdtLLUJ8yKFhR2WLAAEOwtdpLoDPm82wb+oZ8A6ildp11tCiIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=mZ3vl0PS; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="mZ3vl0PS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=2G2+7E4OZr6a8UGqF32h4K7HFEK0pdzuC9zxUMQjz/Q=; b=mZ3vl0PSTm7XQAZj85HUESBd3q
	PQtYnhMzLn/Z7d268hhbq1pZsU6HtsAWbJ4gkbvwbfJlqSaauq64Js2QXAitfSpq/vxQJTukFFrM3
	2xaY/E9Wn0V+0US9GqBEM+ACITRoFrH0l5eo76DlZHqFuQt2SXxOX/66Xk1dICLwJwKzuQ8rLwjg9
	U905g7HXmiaWVaH0oxhadVH3GMF+lHSKrMg6cmo781BqfGRhEHsgM4JUHyMCIPdH3jgirFusp14Qb
	ctYPaOnegSHRZGKKpp9l20opYZxxHScbdcZPQeCDT+TW7zlNtJ0R2k3xkemHo/1uynx0HO5bJYoKI
	jcGZtZtg==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wca-000CUo-1M;
	Fri, 13 Mar 2026 08:07:44 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wcZ-000IYT-2V;
	Fri, 13 Mar 2026 08:07:43 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 1/6] clk: imx: fracn-gppll: Add 333.333333 MHz support
Date: Fri, 13 Mar 2026 08:07:31 +0100
Message-ID: <20260313070740.585043-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313070740.585043-1-alexander.stein@ew.tq-group.com>
References: <20260313070740.585043-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27938/Thu Mar 12 07:24:01 2026)

Some parallel panels have a pixelclk of 33.30 MHz. Add support for
333.333333 MHz so a by 10 divider can be used to derive the exact pixelclk.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* None

 drivers/clk/imx/clk-fracn-gppll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
index 89ed7749bf47e..fe6ee77ba1485 100644
--- a/drivers/clk/imx/clk-fracn-gppll.c
+++ b/drivers/clk/imx/clk-fracn-gppll.c
@@ -88,6 +88,7 @@ static const struct imx_fracn_gppll_rate_table fracn_tbl[] = {
 	PLL_FRACN_GP(445333333U, 167, 0, 1, 0, 9),
 	PLL_FRACN_GP(400000000U, 200, 0, 1, 0, 12),
 	PLL_FRACN_GP(393216000U, 163, 84, 100, 0, 10),
+	PLL_FRACN_GP(333333333U, 125, 0, 1, 1, 9),
 	PLL_FRACN_GP(332600000U, 138, 584, 1000, 0, 10),
 	PLL_FRACN_GP(300000000U, 150, 0, 1, 0, 12),
 	PLL_FRACN_GP(241900000U, 201, 584, 1000, 0, 20),
-- 
2.43.0

