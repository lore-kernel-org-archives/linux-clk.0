Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8CD33BBA7
	for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 16:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781798705; cv=none; b=Tu5f6fFJOUEpTaXOOdTPWzrWKYIcRhjU4AS+L1rGyNZ9TvEbcP7RxqgjyvJnHzT6Yay3JPaUT3y9W1q3dYXJAmn3odmlURjuryjvGQiEPWhXNSWjYkOaGXP9f3l9N/Js99hFAwEs1gccUkt52yMrsR4U5Di4uAuTLsnezf45SmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781798705; c=relaxed/simple;
	bh=CURlfTarocTR5tosxaot6j42X80TLAh8SWyFaztpvg4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LEvBn+iYeHZ9YP7aA/o7njVovxVa4Or7gJmyMVofEGmq2uh0sHgmaBYK6MkstuvAztXrJHNSvsRXJXgHUjujAzyrHHIGfZldj15V+INRQ7OK+7G3r7vtbq0msgl7hYEgwYZbzoPK8B5MI03EnmXrPnXjRFPWnkZLhPNRqXSjuAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=CcB9Ef72; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="CcB9Ef72"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c08922c23ebso21579766b.0
        for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 09:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781798702; x=1782403502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PnGQk9/+o7yZx0SmsZ9RN3I0YGb+pwc1bJacVtg+ogk=;
        b=CcB9Ef72dM6rjyQ0XlqEq5x+uuBZrwdQYRXV12Fn4OZPwRYeq9oUDbMmcdcmdQl6C3
         +pOc3VlycbWQmeglapCIPkLPrQ/2Iyuqsb1/HCcyy0ZyMJp8W7aGCbr+aozwi/oqzV+e
         AocPGppdvykadkGA89FGkof70IZYwx80QXxcQwAaSUHVlTiYJrYMDOBgaslaI+O6QEEI
         xF9/PUSYsxBzpxltiKL18JyIpI6hgDCE5x8txDBkbDZicksn8FIy2D4j9NY7CmKn7Cxv
         tdoOct1HD+XPzDJqMcWqS9Xr3ZjvTZKOz9bPpZvyndtXB5Zjp+76hOTcfF4TBM/MHav7
         SDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781798702; x=1782403502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PnGQk9/+o7yZx0SmsZ9RN3I0YGb+pwc1bJacVtg+ogk=;
        b=knvY0QeE3g+leg7KMdGT7D40oCtKFHaiI2YBVwWcB+Nd21BgReaJsvwFpcCA8r1JOt
         9M46aQ5agdh2AYdXW2zTjsKcLlo6hToNFcpAoOUj2tIPgt8ULRHe3wqSNZxwSVYK0rQ7
         7YH6/U1+hF5W91LdPsl+JVwTDbogGUBHHSksLs2DEDfXDVFxdx9RpWG7KxCa6rc/WK4u
         QZz7DKS3Gcg6MTUy/WIyS8oNVAyY996f1kznhLf8hRHrxqiQvRvVfTI0Mn+rNuDnmXC6
         Kkg+02RGYzyq2SKJJx/EK+M4qg4Y4PkCEqX2lM6kLpWpJjc7ETTrQJymQgq0m+Xn57su
         ugBw==
X-Forwarded-Encrypted: i=1; AFNElJ+h4Vs5bjg87yWdF6umwvwZKHpCzptsULV5E4lQehPt8ul81dqn7cTUo/m6GG+JxyQhoQslmphAqmo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG9ggKuenEnXeQkGTEF5wnKCxZHGez9HHkiVrJOYFm1FBXdfBI
	mZgjZ2grfGMORwqa4qeGiUA7+5GNpeC4FgZO6Ez+4UEscNHE/iQhob3cdbmDF+j/pjA=
X-Gm-Gg: AfdE7ckYJ9Vb3WoSH0thHOt3Opr2YqaixBKDRFYSrpJFl8bBfjP99UYXx69Y6L/Vx9x
	Cla9sk/D7VHdYY4WMfOMAsstxQrE6Z8T7Mwq79XofIQJEIuN7SRNOD5niRGriofWrvxMdOzSs1z
	bjHDgFwXpcn8v+sGKZT965HzGaHQ2CDR6DUjRz9QXwymx3fiFenMo3KvNYLs44QToyraSppKASs
	SfGrOfKrezMRHEsBQU9jxrjDHiSoXILAjhTjF4Lp3NtxlR5ekLiHxBR5MdO97ZvhzeJCV+3fApM
	2yaZe9VZ4X7x5f3HIjfcT5/5qG3mi6k+WmXH0QmjC7RKHjziXliIq2jsJOTRZZDcnvZBd2jTKZ0
	r7+dA3hnXgBrN02QYoms1mB3g5fKcYZ2BqIz3t2Zp9HMmXkFzl5/wZejeRA4o343tv6mwG4TGoV
	/77zLR0JGDrMjVbSjOpkXsb9Sj5YxCx4IWj9VUBFq+Xtr/w1q3kbWqyfUA5cygCRsa2rrLnssVk
	qkk
X-Received: by 2002:a17:907:3f11:b0:c03:ee1f:9d3b with SMTP id a640c23a62f3a-c05d2a4d04emr536671566b.43.1781798701457;
        Thu, 18 Jun 2026 09:05:01 -0700 (PDT)
Received: from localhost (p200300f65f47db04cea0a59ab11cac9f.dip0.t-ipconnect.de. [2003:f6:5f47:db04:cea0:a59a:b11c:ac9f])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4620b3ed0d2sm29125841f8f.22.2026.06.18.09.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 09:05:00 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] clk: clk-lmk04832: Simplify device abstraction
Date: Thu, 18 Jun 2026 18:04:55 +0200
Message-ID:  <5f4e100b3c2b5cf3ca1faac4ce1b0ffe5c9ea6eb.1781798524.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3063; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=CURlfTarocTR5tosxaot6j42X80TLAh8SWyFaztpvg4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqNBcnWvxgbsvyIgo/cCOwFrvkmVat/NbL7X8Vh y7an0JA1uuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCajQXJwAKCRCPgPtYfRL+ TgmIB/9xxndbjwzIGvglPUum8mZtvddJQJDa763jwaQTLgBEU7XzFLvmHStM1wQZGYMl+ESaG25 601wRt/IDspnbW6KJjyo0je7+uC5itjvO/G271vqbcvknrC6CmHeTWGRFd7lwxUP0oXpQwoLbTA w+Z5Gjzg4ewYqfJ0KYKfiAQxZg/KcCiFxvt7jPIMvl7WOJftN7CkRjFW524nu04P8RjFB+Fkhez /I680W9CUQxFuF6IdkuF6dY7nOtz8IXBDTs8c1GOT46koL07psAR6GZ5as98/0D0xTdzvLsOIKU GXu+vNzK/cJi/a3jQsgDdLJBoSSK9D8wa+YXNn8Telu2d57g
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver was introduced in 2021 and since then only supports a single
chip variant. Simplify the driver by hard-coding the device properties
instead of using the id_table's abstraction for a single chip type.

While touching the id table, use a single space in the table terminator
to match the most used style.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

my motivation here is to get rid of the assignment to .driver_data using
a list initializer. I want to move .driver_data into an anonymous union
which requires the member to be initialized by name (or not being
assigned a value).

Best regards
Uwe

 drivers/clk/clk-lmk04832.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/clk-lmk04832.c b/drivers/clk/clk-lmk04832.c
index 9bf86caad829..c644d31b223e 100644
--- a/drivers/clk/clk-lmk04832.c
+++ b/drivers/clk/clk-lmk04832.c
@@ -175,10 +175,6 @@
 #define LMK04832_REG_RB_HOLDOVER	0x188
 #define LMK04832_REG_SPI_LOCK		0x555
 
-enum lmk04832_device_types {
-	LMK04832,
-};
-
 /**
  * struct lmk04832_device_info - Holds static device information that is
  *                               specific to the chip revision
@@ -197,14 +193,12 @@ struct lmk04832_device_info {
 	unsigned int vco1_range[2];
 };
 
-static const struct lmk04832_device_info lmk04832_device_info[] = {
-	[LMK04832] = {
-		.pid = 0x63d1, /* WARNING PROD_ID is inverted in the datasheet */
-		.maskrev = 0x70,
-		.num_channels = 14,
-		.vco0_range = { 2440, 2580 },
-		.vco1_range = { 2945, 3255 },
-	},
+static const struct lmk04832_device_info lmk04832_device_info = {
+	.pid = 0x63d1, /* WARNING PROD_ID is inverted in the datasheet */
+	.maskrev = 0x70,
+	.num_channels = 14,
+	.vco0_range = { 2440, 2580 },
+	.vco1_range = { 2945, 3255 },
 };
 
 enum lmk04832_rdbk_type {
@@ -422,11 +416,10 @@ static unsigned long lmk04832_vco_recalc_rate(struct clk_hw *hw,
  */
 static int lmk04832_check_vco_ranges(struct lmk04832 *lmk, unsigned long rate)
 {
-	struct spi_device *spi = to_spi_device(lmk->dev);
 	const struct lmk04832_device_info *info;
 	unsigned long mhz = rate / 1000000;
 
-	info = &lmk04832_device_info[spi_get_device_id(spi)->driver_data];
+	info = &lmk04832_device_info;
 
 	if (mhz >= info->vco0_range[0] && mhz <= info->vco0_range[1])
 		return LMK04832_VAL_VCO_MUX_VCO0;
@@ -1405,7 +1398,7 @@ static int lmk04832_probe(struct spi_device *spi)
 	int ret;
 	int i;
 
-	info = &lmk04832_device_info[spi_get_device_id(spi)->driver_data];
+	info = &lmk04832_device_info;
 
 	lmk = devm_kzalloc(&spi->dev, sizeof(struct lmk04832), GFP_KERNEL);
 	if (!lmk)
@@ -1553,8 +1546,8 @@ static int lmk04832_probe(struct spi_device *spi)
 }
 
 static const struct spi_device_id lmk04832_id[] = {
-	{ "lmk04832", LMK04832 },
-	{}
+	{ .name = "lmk04832" },
+	{ }
 };
 MODULE_DEVICE_TABLE(spi, lmk04832_id);
 

base-commit: e2cae00c05d196491c318196792297f2dfbaa02c
-- 
2.47.3

