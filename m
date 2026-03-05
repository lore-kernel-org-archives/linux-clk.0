Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A98396B9B;
	Thu,  5 Mar 2026 12:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772714790; cv=none; b=jwL2jNYUb1qsXl0tagKfWBD2ZwTtYWUBZ5iawRuwSDKMUJzffqeRINT5wXj4/HbyZifoqAQ/BMsULYz4gtHduovHg/Yyo91NPOg/eTxmDJDr4aG9GFkyHCQsFtrlDLBQptXcCaRW0zjVYhWwqC/cFrd5rFOQkkwhCdyYDSBIGrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772714790; c=relaxed/simple;
	bh=YT5BdtExYpZoNv3snHWHiJP/l7vrlzxoC2+/p1/Mtzc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HjIpzPn5Gl8mTzag/anXFyy2Mcb2AVcrM0rAoYuB+5mIpDjZJ9qpDyO/Dod+zh5ulVV879UZR5WklqGiS0iEQwxMa6k13Ja4dSmE11Pz0yu761tqfvE1GsmyyaAW7EF7MhoGvh4bhGZ88CBggeYwHylJVvnXLcqyfIMtWR/rb+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=NUErKxvY; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=S0YYrqZk; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="NUErKxvY";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="S0YYrqZk"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fRTmz4R30z9twV;
	Thu,  5 Mar 2026 13:46:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1772714787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pUlhsxKJln+rW8kzW1QZ1WnxvxiGGsR+VgHvKa+y9ns=;
	b=NUErKxvYverSGgEFZAMqpAl51M8lmsZAzl8neGuXaLf2ylHgQ+6NgZdZdUdLkE3a5pzQaD
	XoDtL8qB4jBH86wwBKxUREeM8hcY3VIi1Do+rdE3Hy3yoctuV5kLX8ccpQdXYEwQDUEj8J
	x+03jCjl3fDtQFjCkW6cemFIdkthYpZ140ko6KxmMOUO6zJT0S+/TO77a44Wos4zaEZ0co
	yjNZSAnXn7SuOF4BdDRQ4k22val/VvYm1e5d6J1NmUH5Ex/eTDjQObkHvszQUs+DpqRhLR
	vIm41m1qrmGjtgDTdJ/tkOK0MOfzf72osyy4w7HJTJBSjrAaBYkkpFg/ksQxvw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=S0YYrqZk;
	spf=pass (outgoing_mbo_mout: domain of shuwei.wu@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=shuwei.wu@mailbox.org
From: Shuwei Wu <shuwei.wu@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1772714786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pUlhsxKJln+rW8kzW1QZ1WnxvxiGGsR+VgHvKa+y9ns=;
	b=S0YYrqZkhp0fW//w8EMIRvU7g0BRjzA14DICNRCxj7pKMyytiYQilQE/6lxExTOUjhRCoN
	NV9241/jLrtF1EN18mOh88piPzFYdinZ+pEE8cIDB5qLkzd80j678qWl0vXGPOC5RAEqWZ
	fkIth8nr8VGujeem7pB3lJDVojFE8TfbMxWA6s51mGfWqVXi0sQbGjaZ3lqEAucPP/CZoA
	/tPXBs9m8+5GfDsjehoFyHtFhgnVmXzL0ApDcBlNqdGH9X/7V5/EJhNJo6LLLqjDNQXQ83
	44G1S89htEqaaZfGbUuWvsUBXJbYtT7hnEajWdIrj0KyGmF12kGk2Klv2Pd0oQ==
Date: Thu, 05 Mar 2026 20:46:08 +0800
Subject: [PATCH] clk: spacemit: ccu_mix: fix inverted condition in
 ccu_mix_trigger_fc()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-k1-clk-fix-v1-1-abca85d6e266@mailbox.org>
X-B4-Tracking: v=1; b=H4sIAA97qWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwNT3WxD3eScbN20zApdI9MkQwPDZAsLE1NLJaCGgqJUoDDYsOjY2lo
 APR4xe1wAAAA=
X-Change-ID: 20260305-k1-clk-fix-25b101c88459
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Haylen Chu <heylenay@4d2.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Shuwei Wu <shuwei.wu@mailbox.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772714777; l=962;
 i=shuwei.wu@mailbox.org; s=20251125; h=from:subject:message-id;
 bh=YT5BdtExYpZoNv3snHWHiJP/l7vrlzxoC2+/p1/Mtzc=;
 b=36mh8wH7swNyMaDMB2jq1M36Hh06A8zDF/sNvVR9RrOowacqTfENWpmnlUbaG4V2Bt5IL974K
 ePwW2mAC+DCB9RBNFcg6iPERESS7VWegWhhbK1rLdvQzo91VQzGKl9Z
X-Developer-Key: i=shuwei.wu@mailbox.org; a=ed25519;
 pk=qZs6i2UZnXkmjUrwO5HJxcfpCvgSNrR4dcU5cjtfTSk=
X-MBO-RS-ID: b904c4551ad57a56bb1
X-MBO-RS-META: 19wj5p3km5xs7jumhi65q5cj9u8e17eh
X-Rspamd-Queue-Id: 4fRTmz4R30z9twV

Fix inverted condition that skips frequency change trigger,
causing kernel panics during cpufreq scaling.

Fixes: 1b72c59db0ad ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>
---
 drivers/clk/spacemit/ccu_mix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/spacemit/ccu_mix.c b/drivers/clk/spacemit/ccu_mix.c
index 9578366e9746..a8b407049bf4 100644
--- a/drivers/clk/spacemit/ccu_mix.c
+++ b/drivers/clk/spacemit/ccu_mix.c
@@ -73,7 +73,7 @@ static int ccu_mix_trigger_fc(struct clk_hw *hw)
 	struct ccu_common *common = hw_to_ccu_common(hw);
 	unsigned int val;
 
-	if (common->reg_fc)
+	if (!common->reg_fc)
 		return 0;
 
 	ccu_update(common, fc, common->mask_fc, common->mask_fc);

---
base-commit: c107785c7e8dbabd1c18301a1c362544b5786282
change-id: 20260305-k1-clk-fix-25b101c88459

Best regards,
-- 
Shuwei Wu <shuwei.wu@mailbox.org>

