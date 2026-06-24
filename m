Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E92388E50
	for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 07:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782284771; cv=none; b=nGmeO4/+zgwbwd4o2RacGWyW2E92HoeEN2hyizuN3PzZVJyn6tfs+zEqZrYfsdJgv6+CvMcchDLuWZSTfm+miY3XKVnjFFvq23DjgDO7+yxtSfdkD+YLAg7ptfQaFwKmhKKTRoo5Z5gY3l6EOsiy/eSjtJhW3lWoUGWWNr3XuGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782284771; c=relaxed/simple;
	bh=vO37nKWNggFQax7MCOi8c31bmHyC0P5Zcqzdh35oJXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AuO/ULGH1OQXyx1pWKJ63f2IPDXGu2vqa6+WmZYmdu+O93PeOFhrMac1NQTMrIWFYiuWq/44De1GT4NnL+Xd/7PbqdgYFzlkfYhQ4LGDBDQPUHLIN07LYBxeQry3QvdxzTWRQZ3LZMm6kkVlN5UgQbLquxmoZcttGWpLPVkOz4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YeWUGPIA; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YeWUGPIA"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c6bdb8a8bdso3309115ad.1
        for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 00:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782284769; x=1782889569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/E9Hk2LKss7XBEYuxylpcD6Bl9dpKGVhcdDLO/oIkQM=;
        b=YeWUGPIAGXdIul79lH5dDLHyk6klcT4fqQP3aVPxSvmXDO0hdoU59G8RmHQiBXyb+C
         FdF0dZAIdj/WIUUn7VRopqk5kypxYUCO2To+re7y2As4kmTxs8r3W5YTDfxm5Pn7RMNb
         CAg2d2+F4h2SIY1ZzXMDgTfUPZ4l/YYVFx4ijQ8yXlM4gF0GQmPM4BagH38zJpFjbrTn
         G0sFfvbhSluQ5XdXcNUj1h0aomWUB1TtQyXghCBZK4IAlQTmwsn5ltKMp7i222YtMK9/
         QUOTxO0PAlGdoF0ouLMOthNvUj9gD/KrxZ5BLAp/vYvNMkwCMNIStNd9xArVwUtNkJKI
         StjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782284769; x=1782889569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/E9Hk2LKss7XBEYuxylpcD6Bl9dpKGVhcdDLO/oIkQM=;
        b=lw6m2qyqUcSDREePtNRcXAaGcNr/ob9lQaRfQiD/QvxtE8yH8NHi9G7vTNHNJDDQCN
         TUE5CaPBlhC12TGIjM0iv/4XWys5JB5+dvg3P8cDcc1XJ11fYxRH/YNSYZo3rS9Ba6v4
         j/28Rk+WQsDe+LaXmKTDY9d0yiyR93+p6HbBzkbNGF3EDvXYzoZF4ErKAhtul3PEx82g
         EVp+3h5y2/dukDh4J80XDJm7J7NU8ugcS/lf4kkiR0mfxRypGS4ToqbhMr6VcJ3MFcLs
         pr0UZjaFk/GjWivkfHofEy8Va2wexSEMjYgT4aG9xTnLcdSYGNAy3Zvx/iyjqYZ1oZ3Q
         o1Gw==
X-Gm-Message-State: AOJu0YyvZwxHcDom9VQRF4iQ8Y5DnyYjkVXAe42ibPFiN+46g5w7xDJ0
	5X/1hzm4zXFt7C7GHG3LsG205tSo09flsn9+CJF9zWPY5gW2wP4rTLk=
X-Gm-Gg: AfdE7cl+GJQhqcGkLoIDVAWH9xT3e6uChdpn064+D3xJ+tKTCCdDEYUaqut5tVK8Tqk
	QBBMLmrPCj+43d/ofJtmLvKLSJfMj7ex3E15buqgKc3dtFn7AMASjAlbjqU7O1OCCMKJR976fbi
	ay7sqgAuTwgF1iNPGk98cdTFptiwTRf095cVlKPrUYNnMi4dujHjYWNk0jrnhKmtKPunF0vgM8Q
	1wCnXxQaXW3IZtcIsq2ELAyo/jfayvgR9hjmUYf7IQ6jon+BmtB7jgghEB5UlKCfu6lmPVsokjs
	Z3ovFzroIVYBbvVX3WGMDmKQjTWe9elHwefU25+a2dfrJEpbKOU0MhR+ujwSMmUCnEhS0bjWLej
	7GQ3XKu+/NLkcrU3nC3EIr14MxLbSOPM8FZ6SHScpDtqp7cSNal0T2WUraNe7t9JALS7ojhE7KX
	3Fog2DcusDYRtxbaOq0fANFuHFLqlP5KZBtKWB+nSQWIWxiL70ZxyIAfBttnlJwShXpDKFUFeZN
	R8=
X-Received: by 2002:a17:903:3bc7:b0:2c4:608:167c with SMTP id d9443c01a7336-2c7c759693bmr65587045ad.6.1782284768917;
        Wed, 24 Jun 2026 00:06:08 -0700 (PDT)
Received: from localhost.localdomain ([14.5.152.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c743bfdc97sm151451845ad.65.2026.06.24.00.06.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 24 Jun 2026 00:06:08 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2] clk: palmas: Balance external-control clock prepare
Date: Wed, 24 Jun 2026 16:05:42 +0900
Message-ID: <20260624070602.10328-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

palmas_clks_init_configure() prepares the clock when an external control
pin is configured.  The current driver only drops that prepare reference
when external control configuration fails.

If provider registration fails after that point, or if the driver is later
removed, the prepare reference remains held.

Use devm_add_action_or_reset() to manage the prepare reference.  Use
devm_of_clk_add_hw_provider() to manage provider registration.  This
balances the prepare reference on probe failure and driver removal.

Fixes: 942d1d674931 ("clk: Add driver for Palmas clk32kg and clk32kgaudio clocks")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Use devm_of_clk_add_hw_provider() for provider cleanup.
- Manage the external-control clk_prepare() with devm_add_action_or_reset().
- Remove the manual provider remove callback.

 drivers/clk/clk-palmas.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/clk-palmas.c b/drivers/clk/clk-palmas.c
index 39049f62db..fdbf8445eb 100644
--- a/drivers/clk/clk-palmas.c
+++ b/drivers/clk/clk-palmas.c
@@ -194,6 +194,13 @@ static void palmas_clks_get_clk_data(struct platform_device *pdev,
 	cinfo->ext_control_pin = prop;
 }
 
+static void palmas_clks_unprepare_ext_control(void *data)
+{
+	struct palmas_clock_info *cinfo = data;
+
+	clk_unprepare(cinfo->hw.clk);
+}
+
 static int palmas_clks_init_configure(struct palmas_clock_info *cinfo)
 {
 	int ret;
@@ -214,13 +221,18 @@ static int palmas_clks_init_configure(struct palmas_clock_info *cinfo)
 			return ret;
 		}
 
+		ret = devm_add_action_or_reset(cinfo->dev,
+					       palmas_clks_unprepare_ext_control,
+					       cinfo);
+		if (ret)
+			return ret;
+
 		ret = palmas_ext_control_req_config(cinfo->palmas,
 					cinfo->clk_desc->sleep_reqstr_id,
 					cinfo->ext_control_pin, true);
 		if (ret < 0) {
 			dev_err(cinfo->dev, "Ext config for %s failed, %d\n",
 				cinfo->clk_desc->clk_name, ret);
-			clk_unprepare(cinfo->hw.clk);
 			return ret;
 		}
 	}
@@ -230,7 +242,6 @@ static int palmas_clks_init_configure(struct palmas_clock_info *cinfo)
 static int palmas_clks_probe(struct platform_device *pdev)
 {
 	struct palmas *palmas = dev_get_drvdata(pdev->dev.parent);
-	struct device_node *node = pdev->dev.of_node;
 	const struct palmas_clks_of_match_data *match_data;
 	struct palmas_clock_info *cinfo;
 	int ret;
@@ -264,24 +275,19 @@ static int palmas_clks_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = of_clk_add_hw_provider(node, of_clk_hw_simple_get, &cinfo->hw);
+	ret = devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_simple_get,
+					  &cinfo->hw);
 	if (ret < 0)
 		dev_err(&pdev->dev, "Fail to add clock driver, %d\n", ret);
 	return ret;
 }
 
-static void palmas_clks_remove(struct platform_device *pdev)
-{
-	of_clk_del_provider(pdev->dev.of_node);
-}
-
 static struct platform_driver palmas_clks_driver = {
 	.driver = {
 		.name = "palmas-clk",
 		.of_match_table = palmas_clks_of_match,
 	},
 	.probe = palmas_clks_probe,
-	.remove = palmas_clks_remove,
 };
 
 module_platform_driver(palmas_clks_driver);
-- 
2.47.1
