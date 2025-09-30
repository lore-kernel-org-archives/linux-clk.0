Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C81D283FEB
	for <linux-clk@vger.kernel.org>; Tue, 30 Sep 2025 10:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759227445; cv=none; b=hjSPa13GyzgSi/F0cfyTdojERBE9IuJLkSJ/BGznGh1bOK/7lZoFaAfgBB3/97nVqkPJxtiKiDeH1T5wCtnTJ23jPIw1ajHjFg3ssQMj9Iiw/b0U3jYovr5ZrrDf3QTDFlJNGVgaI645TrYmgbAvLhI8Ld4L5mA0B+95zkDYk0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759227445; c=relaxed/simple;
	bh=+5za5JUaLN0Sg+IT9qT/KHfihRy0IEDnGr1cDJ4uB7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Eddw63tNyGq6SRfLnY8uaL5PQ3dvvyNKkTKnRAZW0KOy3LDzebTpi69/93xJnllE4g8BazEiZT9NKkoZpad01o1jokqaSwBqhYQSPNo+rABb+uPl7EqlMhbsGhXIEp3GzftniOCn+/HWSkteA1fQu70mcKqcfi4tUMQ1WYZD9pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZrNq+nrx; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZrNq+nrx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ePKEx+u78sTlBDV2SI8ge68ycN2xPpY6ldmedjbXsoc=; b=ZrNq+n
	rxZDBUH5LEK8KZdJQpbd9wl8N2lLE6DYGFAe5+izBhKItR1ShbUKooM9SLs0Jvg1
	1MGn1drqovMqlUbs/7xz0sEr03a0vuRwgF14l5L22Nel/ELqiFtLvGMudaaSitV0
	coiHuqqXkZcbUL9TwIQuzELwP4m3Moa894Ui6o5LHBzpcgXXuTGV+ymH56ymYdc+
	bFfqWnNUvYBZmnP92b5r6RvsPsHtsZoRhuDsqI+5r1t82IrbXeU8lPRkMr/ckjmn
	75SgikzRgNIqMKaB5DOm5B1JJRl0qiEGkD/jzKV6P+YWhJOh/gtEj5LzrV1DWNJl
	x0bu7sm8AZl+iTpw==
Received: (qmail 3595849 invoked from network); 30 Sep 2025 12:17:15 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Sep 2025 12:17:15 +0200
X-UD-Smtp-Session: l3s3148p1@KBBUDgJALosgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Subject: [RFC PATCH 1/4] clk: renesas: mstp: mark 'spibsc' clocks as critical
Date: Tue, 30 Sep 2025 12:16:57 +0200
Message-ID: <20250930101656.33435-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250930101656.33435-6-wsa+renesas@sang-engineering.com>
References: <20250930101656.33435-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

They can be used for XIP (grpeach) and we cannot define them in the DT
because MTD physmap does not allow clock properties.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/clk/renesas/clk-mstp.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/clk-mstp.c b/drivers/clk/renesas/clk-mstp.c
index 2f65fe2c6bdf..5601e104d167 100644
--- a/drivers/clk/renesas/clk-mstp.c
+++ b/drivers/clk/renesas/clk-mstp.c
@@ -157,8 +157,11 @@ static struct clk * __init cpg_mstp_clock_register(const char *name,
 	init.name = name;
 	init.ops = &cpg_mstp_clock_ops;
 	init.flags = CLK_SET_RATE_PARENT;
-	/* INTC-SYS is the module clock of the GIC, and must not be disabled */
-	if (!strcmp(name, "intc-sys")) {
+	/*
+	 * INTC-SYS is the module clock of the GIC, and must not be disabled (r8a73a4)
+	 * SPIBSC<x> is for memory-mapped flash which might be needed for XIP (r7s72100)
+	 */
+	if (!strcmp(name, "intc-sys") || !strncmp(name, "spibsc", 6)) {
 		pr_debug("MSTP %s setting CLK_IS_CRITICAL\n", name);
 		init.flags |= CLK_IS_CRITICAL;
 	}
-- 
2.47.2

