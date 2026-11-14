Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794699754;
	b=0ZSLFDsOixLkOAikz2/BrdDj/xoKtvWg5DzcZdkF7RswGng1REIIHdinuIJ3co8aN25X
	 o2n9Edq63Pv9cyNOE6QZ/1dAZOWOzei5qZrLBIZdFbrp4EJSIzeKV0168eq9VmDSn+JKo
	 uJoXVa92nDVgAErvSzqpsuCs0MZMMy6gOFFkli35IWQ5Dpn954YYvzpGwW7Pyp5jBYd5y
	 uin/7V2HXlwMjDNRHkOrOTs38ow7Eyl7BocbtNIyw2cdd1p2w1MGhBJZTVEFTvKxPdDc+
	 By9ZSiFNSQQ2mx6lEGmz/BKS4yQu+CfEZrnD3g2brhoetmqA7j/GiQEjy7gI5G6lhGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794699754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h02M7ZRT82vo2QN0ZQk0R2AefSd/VQlgbNcmA/89Arw=;
	b=sG8ZJQ4DjF4e4fZRsobz2gKJ83MIDX6MP44ABsMS2hsMYGmmlGfqdpUjzhO7XsWbWmC8
	 /GVmQiBC4db/KjnDOub84fbzy/mv0tD2r+c0ptmFgnEsVoNRYU5spcD8TaCHCleQBKwgg
	 U+ANaGvEs1LUbPArKNMgYIbMYoB43nbRO5zkGVknpfPwtKamwpQRGnPKvZxsCAeeZ+4z8
	 fo7wSTw/NoZmhUfBUZ4I9QRz9XHOp9akBgyNqzJ4L3KqNGaci1R7NyMRG6gd3RvkJs2GX
	 GC7iBSY4o6jW4536U0T5uvrHNdh0go05wc2a+pZlvsvbVK3fZcd6KDSfPpSQ5He82xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PzmXYQR1;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68471606A884
	for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 23:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68471606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PzmXYQR1
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e987a2ba0cso12146715ad.3
        for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 15:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794699754; x=1795304554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h02M7ZRT82vo2QN0ZQk0R2AefSd/VQlgbNcmA/89Arw=;
        b=PzmXYQR15cCChYYvbHvZmRtbxA+Vazpm1dPjD1puEWhx0NHS5zVYdgFvLCRrTrbMVu
         AbiPDGFXmUGW4rbpcSXBWDfd8I651GINKhQKGtP3z2j/DEVxNHkttCAoOCRIznTya9Ta
         tLj9nHU+bxyuLbuzU9kk8koKm7BgijjngQLYTr+A0yP2mGjXl8d3Cv9wFOWn9lUvS0PR
         iy5QRJ+VhwVrcvMN8wOo6s4y30qiALwZesI2H2UmSDC8wdet4p2Vo3BNUFtXMzhRLocr
         TkwxisJZcvi/ws25jc/IbIhPqlHaciw358MQKaPrD/0kWpl3RijFo0B0IMpRItR3rcSw
         kazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794699754; x=1795304554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h02M7ZRT82vo2QN0ZQk0R2AefSd/VQlgbNcmA/89Arw=;
        b=1ZYN6aFIo8tZOlh8uYCggB2w3kPNjACqdzIts+iny+xjyprxALotACG93xXKmtyX5F
         DViYTniwTGSzhwJQQST/ncl/SlgpgpPQXDJw28A5qJdqhR7ORiStZVO89EZV1l4msbwr
         pLkzeupkQqbWoITwLCVSq2MUUKbUuGjGG8Nz7UV8Ol1OYIbrJmu6YC0jyL/N4QA387Fd
         gJC4DgKeWHF/042YFZIBQLvcj2XfrjS8LLYBvesdxK+x3tTG8cGHxldeR2w0Ps2+C8bj
         AB2RrYtXhyrYYHEc3bD6EybiyIjZYPz0BxiNBLchVQcO9EP1AXKGYobeeXUVqoet/Mx8
         FlQQ==
X-Forwarded-Encrypted: i=1; AL+hErFDETmsGGcjNWwBNWht0Hgf0zRNJ0916g4Sl9QRKyQDfUAbhzhAYoZgCc9tq9wMBEdM3qsZZMGLWvY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/dwmQiLZshYmjxSJG0F6vyVNiDH8t6c/MjM9VnXwgjYYMfFua
	Q06uWmf7XFZ/rVcIemFgRnn6zF6qiRjdjdkd92Zj7B1RIH2RaEibOQ7E
X-Gm-Gg: AYBFou08gCSlY+KYQ1fNzi5dh9ZGsmtQkOZl/lmUzceXJ0u/XSkCDtuUmdfY6bFHYk7
	kpLfiGZB+JsDl0POYH9UZzSy+UeOopY3JgHd5hmjc0nTCZbFSBMq6ZiaOJ/3OWZAwnTD2ngK31I
	vjzH0rudTKt/Zw5wL9NssAx9tlxM2I5Ina+qND+ME7yrkn5tNxHu78s9FnlnVeIGc4WhWmmimyD
	1UhqqoSefwlRI1VO74JjlcoEFLbdRDhQdUPZzL1UE8fYJGoFTjCnYcV5O2owXu67xg8VWegNNGM
	UX0+ftRr9R/ug/8fOKwHqFzgDOV/jBpNt27BZtLoulkIc7KCPHugjoAd1KZd8pGsIa9MPsGcB5h
	po/iZXFHggCh3FTt20yB16Fzyzohssb8xGoo9F0ihZ0uCZIrr8QdGTUXINMfX3Oj6z0RUmG9spM
	hrlSvYBAV7tqGmVD67TAuckJwEhnW+YpnD7cZ4cblHBxMWBvhlY7xl/ZIL6210zvAVtAIMdN45y
	+aXNJQBBbd6MqyRi4DZDw+H2Uhg0H+PHLP2t8zj6iqZpcHkKDbAG+6IGb59SdbIstMHT8Me1mpb
	dz3E8zRGV0nfmANgfzi5iryVZxQUKhzgoQRRmVuBXPJ4o+/dPxbl+ZAyFZ9yb29eOsBtLOpZshV
	N7NdwNiWNJVfh4e1XGsV2pDLL4y/5QYVIClUE4CEVNkDMi7o/MRwbXQ9rySVZmz264keBMydC+v
	oTeA==
X-Received: by 2002:a17:90b:3c4e:b0:3b1:8380:a9a0 with SMTP id 98e67ed59e1d1-3b1b0b67c8amr6550886a91.46.1794699753758;
        Sat, 14 Nov 2026 15:42:33 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d04336sm15755574a91.7.2026.11.14.15.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:42:32 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 1/7] MIPS: ath79: apply the QCA956x timer workaround in setup
Date: Sat, 14 Nov 2026 15:42:16 -0800
Message-ID: <20261114234222.88337-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114234222.88337-1-rosenp@gmail.com>
References: <20261114234222.88337-1-rosenp@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qca956x_clocks_init() enables the MIPS timer interrupt in the misc
interrupt controller, which QCA956x needs before the clocks are set
up, or there are no jiffies. That has nothing to do with the clocks,
and it ties the clock code to ath79_reset_base.

Do it in plat_time_init() right before of_clk_init() instead, which
runs the clock setup. The order is the same. TP9343 boards use the
QCA956x PLL and took this path too, so check for both.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/ath79/clock.c | 10 ----------
 arch/mips/ath79/setup.c | 13 +++++++++++++
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/arch/mips/ath79/clock.c b/arch/mips/ath79/clock.c
index 050f6553f398..8c5eaa4ab6e0 100644
--- a/arch/mips/ath79/clock.c
+++ b/arch/mips/ath79/clock.c
@@ -523,16 +523,6 @@ static void __init qca956x_clocks_init(void __iomem *pll_base)
 	u32 cpu_pll, ddr_pll;
 	u32 bootstrap;
 
-	/*
-	 * QCA956x timer init workaround has to be applied right before setting
-	 * up the clock. Else, there will be no jiffies
-	 */
-	u32 misc;
-
-	misc = ath79_reset_rr(AR71XX_RESET_REG_MISC_INT_ENABLE);
-	misc |= MISC_INT_MIPS_SI_TIMERINT_MASK;
-	ath79_reset_wr(AR71XX_RESET_REG_MISC_INT_ENABLE, misc);
-
 	bootstrap = ath79_reset_rr(QCA956X_RESET_REG_BOOTSTRAP);
 	if (bootstrap &	QCA956X_BOOTSTRAP_REF_CLK_40)
 		ref_rate = 40 * 1000 * 1000;
diff --git a/arch/mips/ath79/setup.c b/arch/mips/ath79/setup.c
index 4e18cdcf65a0..d9e1cc77ad04 100644
--- a/arch/mips/ath79/setup.c
+++ b/arch/mips/ath79/setup.c
@@ -241,6 +241,19 @@ void __init plat_time_init(void)
 	struct clk *clk;
 	unsigned long cpu_clk_rate;
 
+	/*
+	 * QCA956x needs the MIPS timer interrupt enabled in the misc
+	 * interrupt controller before the clocks are set up, or there are
+	 * no jiffies.
+	 */
+	if (soc_is_qca956x() || soc_is_tp9343()) {
+		u32 misc;
+
+		misc = ath79_reset_rr(AR71XX_RESET_REG_MISC_INT_ENABLE);
+		misc |= MISC_INT_MIPS_SI_TIMERINT_MASK;
+		ath79_reset_wr(AR71XX_RESET_REG_MISC_INT_ENABLE, misc);
+	}
+
 	of_clk_init(NULL);
 
 	np = of_get_cpu_node(0, NULL);
-- 
2.56.1

