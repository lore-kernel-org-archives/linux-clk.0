Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347E9355048;
	Sun,  9 Aug 2026 09:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786269274; cv=none; b=ly7bHH8vvhH09MML9qiCt01ba27Zns/PyVLzXNXHOaEehnfUBCZ4xGDVjgnHt96f/Q3WGM/0LQcmCwY7RKWWPlUqLf3HR6s6vQ2z+WYfzwvDYCCYfGmNpgWdoPTBKmdCP6QfvnlwziL6GOjvN+Exs6wpr7i5WpyWqJnVHs4BNpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786269274; c=relaxed/simple;
	bh=sPT0/v1DGwi66cnM0JgovaL+VLFudMPNC87frGkfBjo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TuXQF9HioJZnhF1eLUY8Tx1vLy18aCrvAyXekpZhHFS+LabBIyZ8514lL1LPbGna8/YJHFnrh9TKoeQ8gBS8cycBA+yNXu+oF3mF/XU3BOTGYawsmJhKp/Zqf0hj5s+hJWUuPsmZokDVXVh6a8zo/aA17z8PceXCoJdiVahgSGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=P3iP1O40; arc=none smtp.client-ip=79.135.106.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="P3iP1O40"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1786269262; x=1786528462;
	bh=n5mlQ9XMWOAeV8WNqgMsSA4apiL4Sn1nlh/hzOQb86c=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=P3iP1O40JaElHnpX6YZThNsRId4kHuz+6WocmREdjZI9DN4jbgUTDSXW+huVxsU/A
	 I68L2xpnilxac7pTHVcPbooXcSrcsMCeAbSgGcns5AHaZFzlz68wW5kBnHhtbX07wM
	 oFCVO+TScIPBrvfWgrnLVFdJb763yZObKw4iNi2yRSFKFm+DljbxpItM8a3DAAhsIv
	 SZhN+aIZKnVxcrH1WF6R33cOQE5h5eqB/k9qDCADaZvXDT4E5engz1+EGQvr57WaF+
	 6FG4789njy8IsBY7aLFB823LxVGMi2aWpa+P8MvtgiUmoC4oLj0eeLarE/b/DXMIj5
	 YqeBT1JPb+QxQ==
X-Pm-Submission-Id: 4hHtWx3L7Nz1DDrZ
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com,
	daniel.almeida@collabora.com,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v2] clk: devres: fix cleanup in devm_clk_get_optional_enabled_with_rate()
Date: Sun,  9 Aug 2026 12:54:04 +0300
Message-ID: <20260809095413.150069-1-work@onurozkan.dev>
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
Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Onur Özkan <work@onurozkan.dev>
---

Changes since v1:
	- Explicit cleanup to avoid smatch warning.

 drivers/clk/clk-devres.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
index 994d5bc5168b..66c35201104c 100644
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
 
@@ -119,6 +123,12 @@ struct clk *devm_clk_get_optional_enabled_with_rate(struct device *dev,
 	if (ret)
 		goto out_put_clk;
 
+	ret = devm_add_action(dev, devm_clk_disable_unprepare, clk);
+	if (ret) {
+		clk_disable_unprepare(clk);
+		goto out_put_clk;
+	}
+
 	return clk;
 
 out_put_clk:
-- 
2.51.2

