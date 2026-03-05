Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B17347520;
	Thu,  5 Mar 2026 10:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772705557; cv=none; b=fXzLkOzHjrSmbDY/8Gfd9hJL7q9MQZ0u2pGG7YkTznwXO22DDRMMIQCMuIS2RqH9keLO+QYcCFwFS043+GzXEIEgKpObRV2thJnASXG8VcpskxvZGlvK82ZAIbwkY44vRwBXREFKKTUtFXeBmtj9Xf/4NJvJZMgd32ZzTdrM4NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772705557; c=relaxed/simple;
	bh=+rNPKVcX6CyOpqPzfqHeRXJdvlc7d6zaI1Kdv1p4IzY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lLqN0xfFC1vNBG3PViJ1Xxq67HepGTgxzrB74YkLIJ1YdRs0Rp+DZ9RUDeff8ZrMaOMGIzRtdiEJYSKVA0qWM989GOg4JasjIqa7CrKbqZ8v4wENMVp1UnI4M+fX3liy45oVlwRBjTsjcJE06dp2E4ncbJn8ZLqcE00yfBM/NTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F9FC19425;
	Thu,  5 Mar 2026 10:12:35 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: Simplify clk_is_match()
Date: Thu,  5 Mar 2026 11:12:33 +0100
Message-ID: <703be6fe95cad2e738c712877fcdaa63a7809802.1772705499.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linux style is to handle early-on failure.  Inverting the first
condition lets us simplify the second, and improves readability.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/clk.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 47093cda9df32223..1a73e9c4e752a85c 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3259,11 +3259,10 @@ bool clk_is_match(const struct clk *p, const struct clk *q)
 		return true;
 
 	/* true if clk->core pointers match. Avoid dereferencing garbage */
-	if (!IS_ERR_OR_NULL(p) && !IS_ERR_OR_NULL(q))
-		if (p->core == q->core)
-			return true;
+	if (IS_ERR_OR_NULL(p) || IS_ERR_OR_NULL(q))
+		return false;
 
-	return false;
+	return p->core == q->core;
 }
 EXPORT_SYMBOL_GPL(clk_is_match);
 
-- 
2.43.0

