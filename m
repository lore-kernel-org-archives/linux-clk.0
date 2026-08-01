Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD252D8DA8
	for <linux-clk@vger.kernel.org>; Sat,  1 Aug 2026 11:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785583014; cv=none; b=YfqW4HzOesXlp9zMe5kQy+IvlSSvwp+rQkWpY/rHe4a7HSecP6yYaTLkU/5a6SL9OJ0BaW8vcCVoYM/IeTVnuH2I8s/dU0XyQJKIaj6KRKviHUvoxthUFWoaf4wRp6zti4VPAsl/a3OExTCSUU7Dt3zJPNDABeKmL93e/Abhp54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785583014; c=relaxed/simple;
	bh=Q+SSnLihiqn0nfSxfR7YZwDrkiF1gdC66QiP3yUzk2I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VITrTaOFDq2Oczly/+f6rGI8glYRVCH9/A4y76Qv/8LpvQ+YwQXILiieFEFY0Zkhz/+aXCVBCpoHOU3YOvWJbcEUqv9pPYDzDzwAz1B19cFoBwOjruJnbyj1nQ7Ix204QH7fHAS8fmrXYr6lJ397N4GtEX5ajJGuBhQ+dX5qI6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=a0CE/o+n; arc=none smtp.client-ip=185.70.43.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="a0CE/o+n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1785583000; x=1785842200;
	bh=lr2SBKxuyNxXd5IXrNulxsVmQIfa23YcSe1ViS6zJnM=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=a0CE/o+n2FzFN6kvsJ984VSnWuSeNh1VEJmEISVbpyMCw2xb1xVUHYP1mPEEDgOq9
	 NqKLqv9+3tLZERS9wCTknnrSrYi/0fqPjTQINzJrmRgxAAQBa+b76enZ1k6Snn9as/
	 zw3n9MYMuDLdXkMnobn2hjNS7IQ8Uh4VNLbpVHHfyBpVrkygMMq5xKhpe4Lx9stgPB
	 RJ/ouKgJmdg1nWoo6WbN+ECXRxwjL+8rRBWBHDTYsX69RcSieaaoe70ikoq9+k+eC9
	 KVi1tW1mEbM1XErvv3QmwBNybqDgt39l8C2JIayiIkK4HNQETdm0RfNSYZhTCwPB/s
	 ySVyM9hXUOgZA==
X-Pm-Submission-Id: 4hC0kb276pz1DDr2
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com,
	daniel.almeida@collabora.com,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v1] clk: devres: fix cleanup in devm_clk_get_optional_enabled_with_rate()
Date: Sat,  1 Aug 2026 14:16:34 +0300
Message-ID: <20260801111637.304590-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

devm_clk_get_optional_enabled_with_rate() registers its cleanup action
before setting the clock rate. If setting the rate fails, it attempts to
disable and unprepare a clock that was never enabled. This issue was
spotted while reviewing "rust: clk: add devres-managed clks" [1].

Register the cleanup action only after successfully preparing and enabling
the clock.

[1]: https://lore.kernel.org/rust-for-linux/20260706-clk-type-state-v5-3-67c5f326a16c@collabora.com

Fixes: 9934a1bd45b2 ("clk: provide devm_clk_get_optional_enabled_with_rate()")
Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 drivers/clk/clk-devres.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
index 994d5bc5168b..697d102449c1 100644
--- a/drivers/clk/clk-devres.c
+++ b/drivers/clk/clk-devres.c
@@ -99,6 +99,11 @@ struct clk *devm_clk_get_optional_enabled(struct device *dev, const char *id)
 }
 EXPORT_SYMBOL_GPL(devm_clk_get_optional_enabled);
 
+static void devm_clk_disable_unprepare(void *data)
+{
+	clk_disable_unprepare(data);
+}
+
 struct clk *devm_clk_get_optional_enabled_with_rate(struct device *dev,
 						    const char *id,
 						    unsigned long rate)
@@ -106,8 +111,7 @@ struct clk *devm_clk_get_optional_enabled_with_rate(struct device *dev,
 	struct clk *clk;
 	int ret;
 
-	clk = __devm_clk_get(dev, id, clk_get_optional, NULL,
-			     clk_disable_unprepare);
+	clk = devm_clk_get_optional(dev, id);
 	if (IS_ERR(clk))
 		return ERR_CAST(clk);
 
@@ -119,6 +123,10 @@ struct clk *devm_clk_get_optional_enabled_with_rate(struct device *dev,
 	if (ret)
 		goto out_put_clk;
 
+	ret = devm_add_action_or_reset(dev, devm_clk_disable_unprepare, clk);
+	if (ret)
+		goto out_put_clk;
+
 	return clk;
 
 out_put_clk:
-- 
2.51.2

