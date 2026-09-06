Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D4039183B;
	Sun,  6 Sep 2026 03:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788666002; cv=none; b=L8bY69p8HP0jLWcL3KdPYruSjm7UKiYxpROlZcKMHj6yO73l5GAg3h4YPLhaO4+fR5YRoT+QEHXxp4G6GOk8xcQeq/tgmoZRm9D55BEhOWFYHw3F1lJoJFAlvb93Qn9YTMWcdEACtfCk8Hh3pEW9KAkosGcMqjR2oC/JwDRaRH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788666002; c=relaxed/simple;
	bh=vzkAnz+6EYeyUnGnZnIWxwrD+AOVOdoBL6rk6szskmM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q7VNWLVBtM9ymBKsthA49L1y2t473u5HRy1aV/FkLUNUnazjJuzhfOZEagYJK9yc3oqxKY8aahsWA9qGdC4vEnIVL77kFCNlxjCgM4G6Dv7mwvTv9cWjQFf6iDMwt0ve7CqORnvjYtupti52gFSwInmNYR2+5ogLkcsbDSfZLQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ZzL7WsKZ; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ZzL7WsKZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=h5
	UtvNOj7koMAg3tl5lCsazgNOBs9X9XUd+uAthO1zE=; b=ZzL7WsKZfbSSZziDgt
	4R46THA1km+q4DtKteyjxEQnCqf7N/2Ln1UDrYJkSz70/KMZ7GbY11YM1z7rLgIU
	MeQ8/ml1qB7BJXHR7cp8zMwmjwDJ5fHrhjrGIEaLNnYTqx6qM3nqLC1pjAk+wqAi
	lrFZv3O6VG4qPOptpVBs8LoRU=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgC3X2lu4Jxqh6TERA--.30651S2;
	Sun, 06 Sep 2026 11:39:27 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Pengpeng Hou <hppiscas@163.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: milbeaut: Return divider update timeouts
Date: Sun,  6 Sep 2026 11:39:24 +0800
Message-ID: <20260906033924.84982-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgC3X2lu4Jxqh6TERA--.30651S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFWrGw15uFyxXFW5AFyDAwb_yoW8Zr18pr
	WS9398tFWjqw4UG3ZxtF42gF95Gasrta43GrZrK348uF15Xay5tF1Sv3s29a1UtFyxWF4f
	J3yIvr48AF48tFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UDEfOUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7Q8V3Wqc4G+l-AAA3K

m10v_clk_divider_set_rate() logs when the hardware does not clear its
write-valid request, but still returns success to the clock framework. It
also uses the sleeping poll helper while holding the divider spinlock.

Use the atomic poll helper under the lock and return its timeout so the
rate change is not reported as successful before the hardware accepts it.

The issue was found by our static-analysis tool and manually reviewed.

Fixes: 6a6ba5b55a72 ("clock: milbeaut: Add Milbeaut M10V clock controller")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
 drivers/clk/clk-milbeaut.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-milbeaut.c b/drivers/clk/clk-milbeaut.c
index 4265bc442dfd..b3bf569ef747 100644
--- a/drivers/clk/clk-milbeaut.c
+++ b/drivers/clk/clk-milbeaut.c
@@ -410,8 +410,8 @@ static int m10v_clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 				unsigned long parent_rate)
 {
 	struct m10v_clk_divider *divider = to_m10v_div(hw);
-	int value;
 	unsigned long flags = 0;
+	int value, ret = 0;
 	u32 val;
 	u32 write_en = BIT(divider->width - 1);
 
@@ -433,8 +433,10 @@ static int m10v_clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	if (divider->write_valid_reg) {
 		writel(M10V_DCHREQ, divider->write_valid_reg);
-		if (readl_poll_timeout(divider->write_valid_reg, val,
-			!val, M10V_UPOLL_RATE, M10V_UTIMEOUT))
+		ret = readl_poll_timeout_atomic(divider->write_valid_reg, val,
+						!val, M10V_UPOLL_RATE,
+						M10V_UTIMEOUT);
+		if (ret)
 			pr_err("%s:%s couldn't stabilize\n",
 				__func__, clk_hw_get_name(hw));
 	}
@@ -444,7 +446,7 @@ static int m10v_clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 	else
 		__release(divider->lock);
 
-	return 0;
+	return ret;
 }
 
 static const struct clk_ops m10v_clk_divider_ops = {
-- 
2.50.1 (Apple Git-155)

