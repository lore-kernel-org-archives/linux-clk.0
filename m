Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32048254B03
	for <linux-clk@vger.kernel.org>; Sat,  7 Mar 2026 11:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772882318; cv=none; b=lIuBJpwO0ZIRlBs1Oy5vLp8ZmMUD3Q4qhJyKZPCODxq1dlPgzrEbVVNkLMbYdHJUhlr2hhiE9/CsasL2wXLnUljnx12zohIP2zMaSVEjhDKxurfopTFeoY3oSpyQJygpRYcp95XiNB8rC+szv/bhkGeJpZZnBysNHHMybKuTR0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772882318; c=relaxed/simple;
	bh=gT4jnECQ4jqfo48LpAcy3o7sQ88z7nfyv6ZMqBx7lpY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rOHEHtsPDAe4YmK/fHcuwsPwa21h6eJLBuuChqz65QvQfkPA7soLGTfZWPSFH9Zn+h3B59a3fhBaChsLXQGuSt9SrKV9PBhEYBN8Ut07zlz25hQpreBZrOXGpeYM485VX6fnrcv+iH7H8oJDfqk5Evq1njVouC9G2G0rKPONlJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=lK9Jc3sq; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="lK9Jc3sq"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1772882313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4E2436h9TKhsl+fBDPz05CVcR7g0g2CQdRbP9EBSJ6k=;
	b=lK9Jc3sqTHSaXASC54/I+KqhpqJZZUlN4+7Z3VER9LM5qn+esfJv0Aba20Q0Yg983LfP8X
	rjHjZaKO4Rm8Vj49ZMXZk/NWOlZ6qU4rZtI+H0YTLSRgecTbRj+Gj3APcydtMGgmeVgoQI
	e+HEfRiqWlMqLmBD/7RYnCg74L2kaBIv8dFORQ4pE9s2cbg9f5BnMC2AIRmclhwPPEklpT
	wbZzoYAod7nefEOhNB3chKSUsl8Nkf4cVnAvGJIq6ZgOhiRztDN/hmv9K5MPpgoAeDoSbw
	7jWvOaQlC6hDLyWl3F2/w7WRTA5z1RKazGXebFlsKtxueZNwfW1KSE8sZ2Qqyg==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jonathan Marek <jonathan@marek.ca>
Cc: Val Packett <val@packett.cool>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] clk: qcom: dispcc-sm8250: use shared ops on the mdss vsync clk
Date: Sat,  7 Mar 2026 08:13:39 -0300
Message-ID: <20260307111801.631060-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

mdss_gdsc can get stuck on boot due to RCGs being left on from last boot.
As a fix, commit 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon
registration") introduced a callback to ensure the RCG is off upon init.
However, the fix depends on all shared RCGs being marked as such in code.

For SM8150/SC8180X/SM8250 the MDSS vsync clock was using regular ops,
unlike the same clock in the SC7180 code. This was causing display to
frequently fail to initialize after rebooting on the Surface Pro X.
Fix by using shared ops for this clock.

Fixes: 80a18f4a8567 ("clk: qcom: Add display clock controller driver for SM8150 and SM8250")
Signed-off-by: Val Packett <val@packett.cool>
---
This seems to help with the "mdss_gdsc status stuck at 'off'" issue on the Surface Pro X
(https://github.com/linux-surface/surface-pro-x/issues/51), at least I've just rebooted
like 8 times in a row (with this applied and without removing the panel enable GPIO) and
it's working fine, initialized every time.

I'm still kinda doubting myself though because I *only* saw it use shared ops on sc7180,
but not on *every* other SoC. What's up with that? o.0

Thanks,
~val
---
 drivers/clk/qcom/dispcc-sm8250.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index 8f433e1e7028..cdfdb2cfb02b 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -632,7 +632,7 @@ static struct clk_rcg2 disp_cc_mdss_vsync_clk_src = {
 		.parent_data = disp_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
-- 
2.52.0

