Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795808;
	b=LANgQVag1dnG/M6/8lor/CyKcqzgMYm7UnG+vfOaC6IQHhn/MzR8HRHIvvo2sydMK2Al
	 n1hDJLbPeAbaynmnDIYdPbpjITrN5RNIxvMvKn1ihaif6V8zlfxEmehhqz/e7YzwyJrH3
	 md4BLf98C/sZYheELzHyOGob1UYgnjg6QkzEY2NCZJTfcuE6syOoQXlx8c1uZdhXtrQAS
	 9Zs+tLgJpNyPxXwpQ53s4UtTq1X1kVC1W4FIximjQFKGnFUegtOcuUgl6qSgj1UswZBIH
	 d0DEdoUzRXtMBqPT8VNGiNee06P1HrAO0txI+I5MHdYp3778g5RQ5GR9HjvYmlcrEUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795808;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=4e5PKTjiW84n5jy4UhyLQl27v48Ri/xKF0c93x04o3k=;
	b=pCsBamJkIgrngQ+X/H6Kh2UUY/XONzxDiXR+eToCcojF4wX7ihpR2wgY+1DynFUdtSPk
	 2jwCrXTU34nTGggyp59HVsBJZCvS8UVF6fTNBlwfbx8AKGZtbWYapPatFF1OByl/d6NNx
	 q2fLWv9WkXWG0VbCCIxIplgOYTKD1UNhNtkM1l0VPBQI2MnSlJizyhlQWB4ovN9BZ9thu
	 wmaRllDCBEBZvpftTbGMpKeTm0i7PVXpeS15YsR8Sy8LMHFc/vAknHazjrYoKC8sfRXup
	 J09BJ7+zJdO/wfmz5/zGkkDwh3+IYMI4JdgaAgi0BECwSR9S+DRIKz80V4L1ArOkkLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mHKGPuVG;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FAE606A695;
	Fri, 27 Nov 2026 16:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12FAE606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mHKGPuVG
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EABCD1A1840;
	Fri, 27 Nov 2026 16:10:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B6F856049C;
	Fri, 27 Nov 2026 16:10:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 294B311E90D03;
	Fri, 27 Nov 2026 17:10:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795795805; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4e5PKTjiW84n5jy4UhyLQl27v48Ri/xKF0c93x04o3k=;
	b=mHKGPuVGEAHK9Jv+381mXRcmKUE4FCTgIjwuOUpzhiO3iWadOKQsbH24RKNDAP28VMHlN7
	VXK9oXdvaQW09nBGy8oZpqt/GxkKIJEuLF/zJM7JgbuDtaufblt3W4W2Trg8kvWXtpibTl
	VfhApTDMmGd0dD+ZuOWFPieofyd00bTYeLDQZkc9vLyENlHSsxgRK8OLPHZvnlHP9FIMEQ
	gy5dsMJBK/G9VU/c7EOqlT1/xgDkmf5RihAo5u8aWq9ufNlvjNM+Djm8SjMbj5gfYajJzE
	HnVG/fkve2vSmRyELi7BOao37opGsyWhLLRVcnXGFcvFZSZyJ33K6N/Y+np+7Q==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 27 Nov 2026 17:09:51 +0100
Subject: [PATCH 3/4] clk: eyeq: add EyeQ6H I2C clocks
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-b4-eyeq6h-i2c-v1-3-d3232984fe83@bootlin.com>
References: <20261127-b4-eyeq6h-i2c-v1-0-d3232984fe83@bootlin.com>
In-Reply-To: <20261127-b4-eyeq6h-i2c-v1-0-d3232984fe83@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Add the EyeQ6H I2C serial and peripheral clocks. The I2C controllers
need these clocks.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 drivers/clk/clk-eyeq.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index ae0faee316890..712824d6bb1b3 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -828,7 +828,10 @@ static const struct eqc_match_data eqc_eyeq6h_west_match_data = {
 };
 
 static const struct eqc_clock eqc_eyeq6h_east_clks[] = {
-	PLL_FRACG(0, PARENT_BY_FWNAME, "pll-east", "ref", 0x074),
+	PLL_FRACG(EQ6HC_EAST_PLL, PARENT_BY_FWNAME, "pll-east", "ref", 0x074),
+
+	FF(EQ6HC_EAST_PER_OCC, EQ6HC_EAST_PLL, "east-per-occ", NULL, 1, 10),
+	FF(EQ6HC_EAST_I2C_SER, EQ6HC_EAST_PLL, "east-i2c-ser", NULL, 1, 40),
 };
 
 static const struct eqc_match_data eqc_eyeq6h_east_match_data = {
@@ -1237,6 +1240,7 @@ static const struct eqc_clock eqc_eyeq6h_west_early_clks[] = {
 
 	FF(EQ6HC_WEST_PER_OCC, EQ6HC_WEST_PLL_PER, "west-per-occ", NULL, 1, 10),
 	FF(EQ6HC_WEST_PER_UART, EQ6HC_WEST_PER_OCC, "west-per-uart", NULL, 1, 1),
+	FF(EQ6HC_WEST_I2C_SER, EQ6HC_WEST_PLL_PER, "west-i2c-ser", NULL, 1, 40),
 };
 
 static const struct eqc_early_match_data eqc_eyeq6h_west_early_match_data __initconst = {

-- 
2.53.0

