Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4503AA1B5
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 23:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778110554; cv=none; b=lk0cGakgyUIEI0ZhmWNK5bnXpNKlTc0KTAF7n4KBZNYbrXFQaa/In3h3mO/q3zt0lW9fFPCI23WuYCeLoOvt0lTh/YBZDSe8FG/0EBQYjQfrNjIh9oqGfrQ1gmWX12EQraSNpbkQeo5EYkbeIFoKnDR0OVSCghfvW76yuQpm6VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778110554; c=relaxed/simple;
	bh=GmYDlpqwpDdKe37tqZS+sDyT+KtS7LQzo13KylSxoFs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=icBuCvO9NKXjIEeR7ldfoJwUTAdcocO5lsHB206jfUas8CA+p7m+1kgX1QwxFcRSvyInKZ/kpZju8Im8rC5VEDPhD+bj4hM0cPX5u4njXOZgVEJ7IpOWHoA/EV0D/CAURad4jPpZZPMS4DDQn6VsyHb3AW+tD/o4Uzo24/5SwfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EkE/BZs+; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EkE/BZs+"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-366087480d8so73107a91.3
        for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 16:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778110553; x=1778715353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eB4O/ATINYGyNg85SLaEAEaMf7em3sOInmWwQolQgBk=;
        b=EkE/BZs++WgPHhhb49Z3iJ8W6QCCV/SsNi8gLOI8mO0lnA+POR22rOZUfZPpmSBpjc
         Ht8QQbYh4rzFejy3JTkKhpu4MmhhWRHTpvSk9lGsJvIQAljyIDgI3w+0vd+rVaF19bbQ
         MTEI2NySDanIIdqAQ5EwzN7178yX2s+xJnJnNsV+wJbAQ4lwCfgOPfPw0FoTVI9No7ET
         KtkopKJomXLVKHqlvzbfMFw1xHh+zMZfSBc31q5R5AH8HjLSWin18Hf0d2cZzx+FWz3r
         58Dkm2o7A7BgXkJUQToYol93e4cQG7Y7yQUE3QArQH2rHKHm/Wqc/WX9MTqtLYuExuyj
         5qrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778110553; x=1778715353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eB4O/ATINYGyNg85SLaEAEaMf7em3sOInmWwQolQgBk=;
        b=f2EhmwoM5I+uFHg1ImlVSVqEt+32IgzGYR8OkGtiKlMNOxs8wZB1R/eHAbAu2bfGNS
         rWwYWaY8Z1o2hgRHt8BV0nppQgWpUUgp4XRjwNvTSQq1gckF0XVKO3s13Hv1aqMffVjm
         Eww08yi6Fc2MzR5ztvzCUK4IkZWsXnKaOEqEa0bpHycmqeop9AigNRIoP8EaZrpvZFQe
         VGpNYmmX9/++hOoGSdwlnPAxYEhVXT1yBwtNBiaQXZTUAhOzslzSff2jLrYtD40Rmb3R
         kArIMkRaF+Xvh2UP9cY8kDzR6k6KIjgzRxpctF4TPa3RkSQb3PT3ar9EIbsZ8+ovbC1W
         htmg==
X-Gm-Message-State: AOJu0Yz6AzxvSTPr17ikvcnNV0MKXENTrLJJgTfh3e/syI2mfFceKsHl
	IUWJVj7VcZfMNamzaO2y5TelxvSR4B848ASHY3Eo75sNY4nqkXgrhmK9dZGr2K0J
X-Gm-Gg: AeBDiesSAuTaM4BcZNE8Xgx/zMSNBlxspCpQOBbeUqRv4m2dZeW3YVVt5VxtprECtX9
	RmfV/Oza9ea5VgurSx/lcWTutzvzkwjECAYgGN2/E63jTemdIvtzpBgJmQN2569gc70qk2WI4vn
	o0ZRyXmPHtnuzSX9tNM4te/9XxrkP96Gtc8xB3Y5Vx0fO2DCOKDs4Fb9D19t1XKasOdvt3mjdms
	If3V1859ItAN9Cvwm/+LhBjFNN0vbwg0ru1t2EZ3OPoEMtr7+33R2EN1WNZ4rgSt0oP65U+422G
	XCktMUEZYiSt/zW8cr/D32JOjfxy2r/JfanW1v0wASA9YtRUij/4/bTJN65i5QSPF2TYQxSD5/H
	M1JsMp3REqT71Zh8EiMB1aYv8xXTeMN5qARyfofL+kxwTV0OjpyubEs0R+3GtOXDVr0/D71EPEe
	t1wMuL+weAoIctFwLVgZswzzZoHReQOYXsZ7Hz2JwB7URT8b1fvKnTBpEo8dMKHr+2PJmeej7XZ
	7FX9IETtUr7wG0HF44EjOiBGYVJm0AtaOO287a4EH8/910isJ1Ssvwj
X-Received: by 2002:a17:90b:224f:b0:364:6f27:43ea with SMTP id 98e67ed59e1d1-365ac47ae1dmr5692779a91.21.1778110552743;
        Wed, 06 May 2026 16:35:52 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365df6f88cesm1697466a91.3.2026.05.06.16.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 16:35:50 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] clk: lan966x: use devm_platform_ioremap_resource()
Date: Wed,  6 May 2026 16:35:32 -0700
Message-ID: <20260506233532.176285-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use it as another instance is used above. This one is optional so treat
it as such.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/clk-lan966x.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/clk-lan966x.c b/drivers/clk/clk-lan966x.c
index 3c7a48c616bb..8c7b273eb756 100644
--- a/drivers/clk/clk-lan966x.c
+++ b/drivers/clk/clk-lan966x.c
@@ -253,7 +253,6 @@ static int lan966x_clk_probe(struct platform_device *pdev)
 	struct clk_hw_onecell_data *hw_data;
 	struct device *dev = &pdev->dev;
 	void __iomem *gate_base;
-	struct resource *res;
 	int i, ret;
 
 	data = device_get_match_data(dev);
@@ -283,12 +282,8 @@ static int lan966x_clk_probe(struct platform_device *pdev)
 		}
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	if (res) {
-		gate_base = devm_ioremap_resource(&pdev->dev, res);
-		if (IS_ERR(gate_base))
-			return PTR_ERR(gate_base);
-
+	gate_base = devm_platform_ioremap_resource(pdev, 1);
+	if (!IS_ERR(gate_base)) {
 		hw_data->num = data->num_total_clks;
 
 		ret = lan966x_gate_clk_register(dev, data, hw_data, gate_base);
-- 
2.54.0

