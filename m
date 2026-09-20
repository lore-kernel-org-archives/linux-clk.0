Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D2C4F5E0;
	Sun, 20 Sep 2026 03:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789875595; cv=none; b=gCfncWnW6I+3Racdlridt9yO8bTtJZqTWhovlvrTuSExHFMzCxxYqEdQhw0CugUaMZzh0+jqz7WC6wRMNwcyqq1PPk8EU/eAlDYbvlEqfYQ7fsZIymHqsqZpHl4o/VUns50sYIEkY6Qd89k/EzzrFT8iARk480v2qqOfF05frm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789875595; c=relaxed/simple;
	bh=VwLh9ojHiJGzaCD6EaQgvfhdHqrFhBxzHXs+TiKuj/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JZGo+3iQi99VdkADtNlJX/Aq+syLJ++vhfkpL909nUa8hMefoZYhsHzYuV+4JsFAOzqwF87yCugKvJ6B25/vTOkibMs51qiBQZLEdeUmQxl2c5FLA1jbXOHJB+Ws/dFhrqGSW8dahR9bjNgcoZgFheFbD77a+MsyKvt4NIdwf58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=DvI0d0lE; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="DvI0d0lE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=RI
	vcTPFYE3aQ9Nymg3YXBN3gmsQHf70bigE3TOQ8foc=; b=DvI0d0lEKat1le90R+
	2fDnn4bjph2PG9JOkoD5t/U6s1AvDc7ieGZC47UdVEzgFF5PWCycMNrHH3Nw+GTq
	G8ddSBeqsX8mKqQh3b25Q4aD+aBFSGc1uT9seQzEYFnnXhGZRxEWcbog0bIP2C/j
	ov0Ro68xyEZaeCD9dPJM9Nh/Y=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wBnL+9RVa9qow10Bg--.3374S2;
	Sun, 20 Sep 2026 11:38:58 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: sboyd@kernel.org
Cc: bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	sam.shih@mediatek.com,
	daniel@makrotopia.org,
	hppiscas@163.com
Subject: [PATCH v2] clk: mediatek: mt7988-apmixed: publish the OF module alias
Date: Sun, 20 Sep 2026 11:38:56 +0800
Message-ID: <20260920033856.14518-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBnL+9RVa9qow10Bg--.3374S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7trWDuF13XFyDurykGw1UGFg_yoW8Xr1DpF
	WktryUCFW5tw4fKFWxC3Z3ua4akan3ua4rGr13Xw1UZas0vFWxtFyFya4qgw1UArW5G34x
	tr12grWxAr4rJFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zitrchUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7hPvuGqvVVOPTQAA3r

COMMON_CLK_MT7988 permits a module build, and the apmixed driver matches
mediatek,mt7988-apmixedsys through its OF table. The table is not
exported, so the module does not publish the corresponding autoload
alias.

Add MODULE_DEVICE_TABLE() for that existing table.

The issue was found by our static-analysis tool.

Fixes: 4b4719437d85 ("clk: mediatek: add drivers for MT7988 SoC")
Reviewed-by: Daniel Golle <daniel@makrotopia.org>
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
Changes since v1:
https://lore.kernel.org/all/20260905133417.64373-1-hppiscas@163.com/
Use the full author name in the submission identity; retain the code
reviewed by Daniel.

 drivers/clk/mediatek/clk-mt7988-apmixed.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mediatek/clk-mt7988-apmixed.c b/drivers/clk/mediatek/clk-mt7988-apmixed.c
index 416a4b88d100..24f4e7b87a31 100644
--- a/drivers/clk/mediatek/clk-mt7988-apmixed.c
+++ b/drivers/clk/mediatek/clk-mt7988-apmixed.c
@@ -75,6 +75,7 @@ static const struct of_device_id of_match_clk_mt7988_apmixed[] = {
 	{ .compatible = "mediatek,mt7988-apmixedsys" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt7988_apmixed);
 
 static int clk_mt7988_apmixed_probe(struct platform_device *pdev)
 {

base-commit: 518e5b794c06c0f0eb40df3e202274a66202c137
-- 
2.50.1 (Apple Git-155)

