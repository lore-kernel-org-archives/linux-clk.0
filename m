Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AF43E1CF8;
	Sun, 13 Sep 2026 12:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789303885; cv=none; b=N5sHGujqAAb7gjItuHVWPAScnmZQybPoINo745B1CEU7OGrUAm7i8IVSV+ScDJlNZDynVKT549M7hUGnSvEBwoAT9qSlG00tfBIR5LySjN9J9gGIoXmWjNFWvoE0jDBUlVrWNeH6Iq/WlZzYfbnmwLMyGqmTSViFdYaLAoFYWI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789303885; c=relaxed/simple;
	bh=pZMpwG1Mrm+8A3L/QoV75MmVA/DsTi1ko6Y0LHROny0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AuQBKoIgECjx7oivh4K1YGdb/YH+YtkEbZxhs1n0gYIl8kFOfAnF/7lPvWUOPmjxhL6dtnzMndhZBlAOelHSZOVoFN7tpPtTa77jIKJvr07Z+cX1ZNW5eDPJdVccKrwqWjgE4lIdc03DyZwLB4ypuemKQKYd4r09pGMeZqZSHd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=L1UdU4FG; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="L1UdU4FG"
Received: from seu.edu.cn (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d907a3c9;
	Sun, 13 Sep 2026 20:51:14 +0800 (GMT+08:00)
From: Slavin Liu <bolin.liu@seu.edu.cn>
To: kernel@esmil.dk,
	hal.feng@starfivetech.com,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bolin.liu@seu.edu.cn
Subject: [PATCH] clk: starfive: jh7110: reject oscillator lookup errors
Date: Sun, 13 Sep 2026 20:51:12 +0800
Message-Id: <20260913125112.109755-1-bolin.liu@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa09ad2623103a1kunmbe812dc7251120
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCQ0hNVh9JGkpPTh1CGkwYTFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhOQ0
	NVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=L1UdU4FGTWU0IrJuPQsuzBakZWG/+axcXYPNk1FMdZ1oHYgCxEGbCa5CX8dk73FDEyUy8cLXJqhvTrEy3H5E3i+C4Ek5tsEWK8aT3t3DmYnvjidDCwFrP61N7EiWXFdBQMmsOK8bnjLo516UJkYcJWPFFo+NTPLVt2uAl4ITZMA=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=bbW58gRY5G447RIaXEF89Kc7znk+Yp0tb1KI0uz/rQc=;
	h=date:mime-version:subject:message-id:from;

Clock lookup may fail while allocating a consumer reference. Return
a notifier error rather than passing ERR_PTR as the new clock parent.

Detected by static analysis and reviewed with AI-assisted source auditing.

Fixes: 538d5477b252 ("clk: starfive: jh7110-sys: Add notifier for PLL0 clock")
Assisted-by: LLM
Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
---
 drivers/clk/starfive/clk-starfive-jh7110-sys.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
index 03c17cd2032f..847c0a39e5ab 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
@@ -390,6 +390,9 @@ static int jh7110_pll0_clk_notifier_cb(struct notifier_block *nb,
 	if (action == PRE_RATE_CHANGE) {
 		struct clk *osc = clk_get(priv->dev, "osc");
 
+		if (IS_ERR(osc))
+			return notifier_from_errno(PTR_ERR(osc));
+
 		priv->original_clk = clk_get_parent(cpu_root);
 		ret = clk_set_parent(cpu_root, osc);
 		clk_put(osc);
