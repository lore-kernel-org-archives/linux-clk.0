Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D08402439
	for <linux-clk@vger.kernel.org>; Wed,  8 Jul 2026 08:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783500064; cv=none; b=c16WeaJRguBuePKgUkzTsKqe84A4KdgKINjDFkaqIOJnjsipbTHNA+2NQipPR/J6TLtig6FeQAsRjQCF5CTOgsJCvIj3W5m4QJ5FmouphgbmW8Vwai87XyuWXRMlrciNVwUFmKtPv2BAXv/yoEVGbVJjkhQ5EN16hZwE/1BzfDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783500064; c=relaxed/simple;
	bh=HMIkcGovMIK5HBYSwOvz9nEZhW0Xpi5/+T/SYmvGwo4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YodeIJS2WMSh9zHvg3VDgwmoYLDTACCI9YfDDYVsr1MYKbbZtT6Jys6tKQxzKareTLMlm3IALXI5OAu/5zzonnL2R4IX26CSE3B9g22geC0BC1J5yw4d6/qEsc7CV7pT9JqbUGziV6qrYr8KOg+S0kP+WmZcICaHmiUE2SfGJ1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FyHAxpmE; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FyHAxpmE"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso228319f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 01:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783500058; x=1784104858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PFUbGAbj6TxelhY2q9PxoNeHT9wFrs9L1fXhvh78EM8=;
        b=FyHAxpmE8tHZuRyWJ9uKR3WCy5qj1fU91/y4ROQR4NVdOICbUnUFr+MEgCDaNBFEAy
         d59LxPLolxFXqT4rjYKRaKE0IAAiH9CxDpSyJkyaQqk9lQoDJc5GHAcIfs/L/AseAf8k
         5vPk8yxAdCwRrlBaIAjNIbWXpLb/upDG39B96vetI8GZxyWs3gvc8pQOeWvxNNSX1vif
         nGBg6HrhW4QIgOB5NX0T6lA1S8xK5bmFpyGBiqgBWlUaS60RE/vgFwFG62/CmeMJ2hzi
         Awkb2M77yMEXaS+F8RCIeoG1tg+P2+3AQ1jh7TZBPvUcQm9r5uMUesL351Z2u3Bno36j
         6cHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783500058; x=1784104858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PFUbGAbj6TxelhY2q9PxoNeHT9wFrs9L1fXhvh78EM8=;
        b=jp04w7YGySnFKQ5jIj8MKIh7f80QzOCXSSRsm0V4uQ/Perp2nZXn1DeKsaW6W5yfPB
         /qEoy+xx+KRLSWzBppz2q2K+RXZdgZDACJMJPWpooSSPjUrN8JqlDsAq0oU72DP3A6Lx
         m9O1Ko1Ek7tZQHOx835xt4urnoh3qvoTH+p+cmXuO8FL9+LDOtCQfRcZJOse6/i8EECd
         AbRrvLOk5ABvb76FFSoSj7gi67SzJCwXKRvStAO0RSkSyf7azRuv27CNO/vp3j+dmUmR
         HOidPx1GRU9qa4jS9GEGx90lxC9TVG333xRrSE+bqt4AP8inNG9YpbpRmUxpSLpWIHXB
         SDrQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp4fGaBH5vnLmlb8q9WV3vd49Kq6T1kvv6Udhy2FX5GOY+UlPSf4XlVcNeFfjLJ5EZk1udC/CKfIKM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWLc0zXKNvNoPgWYgqCUXj7RBbGEfJ777JihPGlbS8d0CRfQLY
	P6HYfcWaRqDg0yfgU2Xuwd5UOGcCo2LYD9kbs9EvsopU8CnFRUDvWC4F
X-Gm-Gg: AfdE7cmp/ePx/krwpH0cqtRvn72B9MeMRfoeS+LlvgAhF+kmX+6+fQsnBn+IZHIwEAP
	ONciSe97FJFfLVyM/G8tD8cuwpQrM6oh+wEKAfVNy8lbS3mXDL0ov/fcH7LqGIEd+1BqPBve0Bd
	roav64RtHsvsGRWacLHCxv+uWManVTzbrFRm5tX15UYZUL+efgBsnQzOy1KlBNJQXkZMGhdFW+Y
	9HPYRJ+JulAOYIrzRJNE9wMcXfyoQDAj57LXkdNVelQlw6fGA+3dbbVl2IjPRT+1Bf+A7tjJIfL
	6+1/DzNNb1x5+D/1VHXZJ0dIzzuKyPnOQuacCGF+CpzMuwyyscKrGAFBAn4Yv5upNlENMUVEAhP
	J6SlPmxX32PXYDNgV+++5c7RquuCD9E6H8GifwMPnH/B+fJ98Xs1oDLnGaYG3+Q4gOgNcxsGKgR
	OduEKOUq7nNUt4o89XsPR+oC8/43PpjnKd4FkicAxFclNmLNvyNdSiyEtFfQ06qasIyIYXal4OT
	IvDtZ7i
X-Received: by 2002:a05:6000:4b05:b0:47d:eedc:2f16 with SMTP id ffacd0b85a97d-47df081c8d4mr1465424f8f.53.1783500058288;
        Wed, 08 Jul 2026 01:40:58 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47a9de1d910sm39802377f8f.6.2026.07.08.01.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 01:40:57 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH] clk: en7523: reset PCIE HB on init for AN7581
Date: Wed,  8 Jul 2026 10:40:44 +0200
Message-ID: <20260708084045.8380-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It was reported that PCIE HB should be reset for AN7581 or some instability
or link training issue will be present on warm boot scenario.

Reset PCIE HB on clk HW init to handle warm boot problem with PCIe.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 1ab0e2eca5d3..c450d89bfa96 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -57,6 +57,7 @@
 
 #define REG_RST_CTRL2			0x830
 #define REG_RST_CTRL1			0x834
+#define   REG_PCIE_HB_RST		BIT(29)
 #define EN751221_REG_RST_DMT		0x84
 #define EN751221_REG_RST_USB		0xec
 
@@ -853,6 +854,12 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
 	val = readl(base + REG_NP_SCU_PCIC);
 	writel(val | 3, base + REG_NP_SCU_PCIC);
 
+	val = readl(base + REG_RST_CTRL1);
+	val |= REG_PCIE_HB_RST;
+	writel(val, base + REG_RST_CTRL1);
+	val &= ~REG_PCIE_HB_RST;
+	writel(val, base + REG_RST_CTRL1);
+
 	return en7581_reset_register(&pdev->dev, base, en7581_rst_map,
 				     ARRAY_SIZE(en7581_rst_map),
 				     en7581_rst_ofs);
-- 
2.53.0

