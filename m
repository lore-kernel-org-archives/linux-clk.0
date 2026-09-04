Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3582F5324;
	Fri,  4 Sep 2026 07:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788508246; cv=none; b=rDz083OBsyQONXUzV8wKwxqZWhDEZRfd8uyU+Iwv5hu0D1v4mt+tMJBI9CBzSms7FzO5lz0IdifaLaA8u7KRyYhwiYUkDp4XJItuWjp5AF8+ZibNhComrzzVZAN6HqQkFRIpYRyLvk6LV+knCfTMMg1XPKmK1b70ib9rlNYFzyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788508246; c=relaxed/simple;
	bh=AuFq6vj0HWfBeQdPH6e56xHar3EgB7CDEn3y8Z7NVAA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rTPhaWvO/kWLULHY4RH837CsIq9g7pxQJzrl4VLLhsN7BtYzeqvxr84tQM+bdP2A0T0lS6d45AcJQtNh8GRDlM9mo4TcbjYgrkoGC4AYkMomHPWCUK3Ih+wiheSzrrbqNIV6i9m1drvlLAtZKVsZ7HaPvz2i/Ye6dgmgz1KCc0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=UKz29b/k; arc=none smtp.client-ip=109.224.244.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="UKz29b/k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1788508231; x=1788767431;
	bh=DP+KKxO1Vk/CrsOb5gTvjJM/pwYjU0AI9zSslb0hys0=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=UKz29b/kGuBfJTYVOvLdhIStW6l+ePOcfwc3J4WcZ4TdG4t7KMdKLy9/BYLs+HTei
	 NxdNiZtqgkjAp79AgsDhrIuKI0v4wi6N62WdVvGnGC3mHJWChYV/cETv5cVzCoG2A6
	 7ok8hBpzaALlIBdo9zGudBAn0INP+4PbaGjGtQFt6h9PMkDCfnz/ESVw21pkP5wDkx
	 eoPNCDxM8B71XiC6xZUM0KLbQMZm9SHrvD7rJDOscEaHNSIijc5TXoB3tNAvEbDFyN
	 Ykklxr/JPJ8aphY+jaWwt6olDq4jSIdwrahlT8yC6Ev0RWLvHZ7M961t7ThNgVy2wM
	 kYSpNdI1b3eGQ==
X-Pm-Submission-Id: 4hbpY21JXNz2ScNZ
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH] clk: devres: make clock cleanup explicit on failure
Date: Fri,  4 Sep 2026 10:50:16 +0300
Message-ID: <20260904075026.60793-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use devm_add_action() and explicitly disable and unprepare the clock if
registering the action fails to avoid smatch warning.

Link: https://lore.kernel.org/all/apmUPdYtdIM0dQbF@redhat.com
Closes: https://lore.kernel.org/r/202608090025.dwxdfqFr-lkp@intel.com
Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 drivers/clk/clk-devres.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
index 4cc3863bd7da..9ed9a7b7b23f 100644
--- a/drivers/clk/clk-devres.c
+++ b/drivers/clk/clk-devres.c
@@ -123,9 +123,11 @@ struct clk *devm_clk_get_optional_enabled_with_rate(struct device *dev,
 	if (ret)
 		goto out_put_clk;
 
-	ret = devm_add_action_or_reset(dev, devm_clk_disable_unprepare, clk);
-	if (ret)
+	ret = devm_add_action(dev, devm_clk_disable_unprepare, clk);
+	if (ret) {
+		clk_disable_unprepare(clk);
 		goto out_put_clk;
+	}
 
 	return clk;
 
-- 
2.51.2

