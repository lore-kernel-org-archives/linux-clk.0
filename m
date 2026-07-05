Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6682DF136
	for <linux-clk@vger.kernel.org>; Sun,  5 Jul 2026 16:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783269340; cv=none; b=cSNuCVdfxTtOQpb6jyL0KCc0E9wmNI2QUwxPwys1gY157LFURIIbcT9A285wMHFZWAFtXT/WhCTDzojUWviLuVZNlcNE1zymQ3ghErgR9UnT1c+ddoMYgmcCkihjmZIdub7kxeaZVE6bC9js2TsifVTZq/iXv4+Svpyk0NT+7cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783269340; c=relaxed/simple;
	bh=2VT6C5jURoRPZYDFHBow6toGTd8bBc8zSV4K43DYPTk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s2pIQIuoD10qoU/QW3J4i5krFdy3QXynOF8RjIRGL/6ZzC9Ibw6f0KUq1zsuziC4QuEDa8dKVXlVK8hOSzDCA7JVLxNOEDPmQlmOfRg5HyUF6Xdrk0G3BimKLXTrTNkR9lP36jDjPPXuPaxqxD3/CCr8KYTkC90mJhed9zDwpzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Mb9xW01A; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Mb9xW01A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=R4nai0spS4xz/s
	y9X2FqTj+eO3xeqrH21m//XxXvR6k=; b=Mb9xW01AMDeQmGNCk/doumAlIlkjGD
	roB5XhSPIwOCCU7lqGRk48xN+ova6KodZkaNC3hgYJYeGwWA0FGH08IBIwV5YUID
	qcmYIxwtVxJIelKE7clOHJJXYZDu2s+ppaivdcdurq150jCz2WV7klrveqyVaEPT
	uphMP3MvY97OZZfFWMl8MJ+Eui9LXvbB6FhWy4HaNzWFEo7XsosLKxxMTQaPhcz1
	OYWMi9XedufpUsQKe+kX26jObb6bzWJdMJwyZarGQNBK7ICj5AMcv1ojNibZ2kB+
	75Z0MKWFyZfXZrT+edUxJGLgHU+dPqW3v8MMEP1N9Nol0uqQPJufWH4g==
Received: (qmail 2287049 invoked from network); 5 Jul 2026 18:35:27 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Jul 2026 18:35:27 +0200
X-UD-Smtp-Session: l3s3148p1@1N/Lvt9V8XdtKjFj
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] clk: mediatek: remove unneeded 'fast_io' parameter in regmap_config
Date: Sun,  5 Jul 2026 18:35:24 +0200
Message-ID: <20260705163523.1797-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using MMIO with regmap, fast_io is implied. No need to set it
again.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
No dependencies, can be applied directly to the subsystem tree. Buildbot is
happy, too.

 drivers/clk/mediatek/clk-mt8196-vlpckgen.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8196-vlpckgen.c b/drivers/clk/mediatek/clk-mt8196-vlpckgen.c
index 7dcc164627c5..ee88dc4a231a 100644
--- a/drivers/clk/mediatek/clk-mt8196-vlpckgen.c
+++ b/drivers/clk/mediatek/clk-mt8196-vlpckgen.c
@@ -629,7 +629,6 @@ static const struct regmap_config vlpckgen_regmap_config = {
 	.val_bits = 32,
 	.reg_stride = 4,
 	.max_register = 0x1000,
-	.fast_io = true,
 };
 
 static int clk_mt8196_vlp_probe(struct platform_device *pdev)
-- 
2.51.0

