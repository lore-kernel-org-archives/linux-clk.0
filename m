Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795121414;
	b=4Kb/0qfDecDf8zsOszrPdqI03hrFT0j5zWdpsuxIjUIK3rah+vNyJt0T4CoIuIfZ9X8P
	 Z8pwH8QUwBA0ptVr6fjKignxSf4H2keqwa8O3+NqlM4d5GkduqUQkZXP5SY7C65yZ1feZ
	 CmXMwxh0/hsqyakRz8xCM8XBCf2qbLhWP4qpp/m7lhR2AHd1nMub6RxDMJ8rOrCPA+8Oc
	 /k1Jdz5TR3D6sbyJCW6TKwh/y3MFbVWn+Ioq/vRgsEadXEkYSH4gGXbhzVUnd6Z9WAG9t
	 VBmYaylCbG418faQRxBWhgBf8RRO5izcFXzEy2/+ZNpvUP9mUyt7quHnFPG1+DIWE/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795121414;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=DoAkqf2UHxVwIhJyiDdJZes2yVams8ApJDurC9rnpNI=;
	b=MLqxv7yfccrrd57WCjSZuF7ocCCr7w8LUv0bm/f3x9AN7UvGgG1ZCYCVb0GawR98PDEv
	 CPIUtFVeZ5ykQFidf7LMQiCzIbm4+Xu3JYWhcAQuhZmeHOtf1gHKNojmTVU7Y3KH/5K5v
	 L2V/Vx6ZfrPaa5FYHC8VwxseQeV0SfH3N07ZwxSgJiB5CE7zgC1vVM65if3RRggHRHhTh
	 kF3v+Sl+Z+T60e1Ln1X6QnkUXYopK+1H5DyloBpk/x9wkuJVN96vuO89mNUEycQFzftX8
	 zS7uGjH9c/E798vMAytr/JEFoKuTvLDs9Z1WniWc5uDBH9FORJw7bDpOQtP7Im/d6zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=cK92y7nC;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCC3606A904
	for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 20:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DCC3606A904
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=cK92y7nC
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so16846f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 12:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795121411; x=1795726211; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DoAkqf2UHxVwIhJyiDdJZes2yVams8ApJDurC9rnpNI=;
        b=cK92y7nC6jsM2N0p3OUqA5SHQHJneZfEIytU4LRo9L335uTxu+4KkZvwTv2wJrv4nn
         0BZmHn/fKdeWgiiGZf9NwnvSu7mmiOSBzmd+fNMNs6Jv+agCPTHzpQNj2cPeZ/qHrUSS
         neHMP0BnK21Ym+aGNzGPF0wvJljHS42aDBFLnZs1rvLA8Zcnkk3LvW+7mVtODaBAtQ6L
         MWuJHJr/u68J2Y2d+MaSgUK0c7uYAtvyBkU8B7hZSbl5JtLjL6/tCF5Q7x7hIAb5D04C
         XYk51YhHzAIawLl8Ne3hQNEvGOlXgXhDDTicrHX566TUuNtq01MQeqsCA/dkvuikPGoQ
         wN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795121411; x=1795726211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DoAkqf2UHxVwIhJyiDdJZes2yVams8ApJDurC9rnpNI=;
        b=XU0xVqTe4Z7pgVY2jWanTOFmccz7bp0LBvFuKdiW3bTlcFt/xMVPbUT5aFy8hPT7H0
         En9b1/EfRDuQC67efXqybGyDLGtAOybMtRJUtJzEjmpnG9kVJn5fprZQHSqSpiU+wb8W
         4C8XCpm+QtFC2K2vDCoAPxJQdgfLheoC/Jg4ZJTV8f8miasIHcfMPZAzr6W4O+FOT8g0
         4aninSnHgpVtc8fsZc5u+C7CUoVr4CQ6ZoRadJA71e66F49e8uwFixYNrWoJG6IULSHw
         gjwrrsERU93Fk7FhVckZ4WpHixPHTN3mq4w+PTbtJOGNeYWT+nQADGr98nZQ7Tryl+S5
         k0CA==
X-Forwarded-Encrypted: i=1; AL+hErEAiNKRuzR7lkJMuLeSjeuiVtj0jyYLpwZSA/YGGSM5sr4uWRiLMQpMM1m1JKYfwCozuoT7/x/Y94A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dacOc/Qgco6pypahPesQshfKQnpIkWQLH/3mafu5ilFoYEV8R
	Vd4Zlu6ekOZb6TXKik6qVcT+9IBjiyK8aIOe1/NUcRTEgCkbROLrUQ8i86+ftu4Ete4=
X-Gm-Gg: AZFdTZewZYTf7mmHo32ztw+LvINjWTXViA9H9p1kLKeb2PNAFSVXcFOVmZM5bizt8ul
	1DMG1Q9oZ/zCwmryRvXv2Fjsve0+dsMK5tLYJh/jlXoPbh15fSERsy78c8DpCn4axdyOTCS6UMP
	sHjgrbETmuMqXeI9vz9YEML5EGYOwyKhqpQof8wIz48XljthhWIrJo4GMvyGbyi6LbXPKHgIh6j
	DBFZCAEIj6a1iJuRiqz/fW0TpAxDc94Su88dwiqlVaPQF5+aKCXnD2jZMRwkvCKxflPLm1zlHKs
	amdKTSkw43M1mEDbAQeCFDx9rkNp2NeHOfg/rm2tYLLMa1B4KrqUPTH2HiNs5TI7R2z4Gb8A+7O
	BsJ4aCwPNRGkNzdsDMq0YAPdXh/dBd5y5y8NGn2xCmWxAVedZNIQanl75ddbK2LKSx012vwPnFJ
	jCduT+XAPiWKPhsHt3iI6t2q3IiztE+7g/Dc53YtoYR8xlAXEcZH8KDWbJq3ZMkbjlDiLuwNXUO
	OgSQgaOhQ6nlTzeEkd0b5KpkEgt3WelX6gRDfoSW588TYMwzRpPqcqpM+bn3xy3+AVPXo6VJoh0
	zIK2lMfUizHiFddxVbnWbYpYLW02BZY0FSnDRrup8yEq91n9u1nzeQRCDud+VZBaBmm0CDu5+ac
	YKofNChoUZfdmoj6WEQ==
X-Received: by 2002:a05:6000:1a8d:b0:4a6:7ce6:4afb with SMTP id ffacd0b85a97d-4abaab633ddmr1508427f8f.6.1795121411544;
        Thu, 19 Nov 2026 12:50:11 -0800 (PST)
Received: from [127.0.0.1] (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b1ebsm1654826f8f.33.2026.11.19.12.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 12:50:11 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 19 Nov 2026 21:49:31 +0100
Subject: [PATCH v3 1/4] clk: divider: Fix the divisor for rates above 4.29
 GHz
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
Message-Id: <20261119-upstream-clk-divider-large-rates-v3-1-838eccd2e497@baylibre.com>
References: <20261119-upstream-clk-divider-large-rates-v3-0-838eccd2e497@baylibre.com>
In-Reply-To: <20261119-upstream-clk-divider-large-rates-v3-0-838eccd2e497@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Brian Norris <briannorris@chromium.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 David Laight <david.laight.linux@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, 
 Brian Masney <masneyb@kernel.org>, Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

DIV_ROUND_UP_ULL() takes a 32-bit divisor, so on 64-bit platforms a
requested rate above 4.29 GHz is truncated. A divider fed by a 5.94 GHz
PLL then computes a divisor of 7, not 1, for 5.94 GHz.

Round up with (parent_rate - 1) / rate + 1 instead, building on an
earlier fix by Sebastian Reichel. It divides by the full rate and does
not overflow with clk_round_rate(clk, ULONG_MAX).

Fixes: 9556f9dad8f5 ("clk: divider: handle integer overflow when dividing large clock rates")
Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
Suggested-by: David Laight <david.laight.linux@gmail.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Brian Masney <masneyb@kernel.org>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/clk-divider.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index f68216c65d3d..c3f46f9ee451 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -223,11 +223,21 @@ static int _round_down_table(const struct clk_div_table *table, int div)
 	return down;
 }
 
+/*
+ * DIV_ROUND_UP() without the addition, which overflows for rates close to
+ * ULONG_MAX, as with clk_round_rate(clk, ULONG_MAX)
+ */
+static unsigned long _get_div_round_up(unsigned long parent_rate,
+				       unsigned long rate)
+{
+	return parent_rate ? (parent_rate - 1) / rate + 1 : 0;
+}
+
 static int _div_round_up(const struct clk_div_table *table,
 			 unsigned long parent_rate, unsigned long rate,
 			 unsigned long flags)
 {
-	int div = DIV_ROUND_UP_ULL((u64)parent_rate, rate);
+	int div = _get_div_round_up(parent_rate, rate);
 
 	if (flags & CLK_DIVIDER_POWER_OF_TWO)
 		div = __roundup_pow_of_two(div);
@@ -244,7 +254,7 @@ static int _div_round_closest(const struct clk_div_table *table,
 	int up, down;
 	unsigned long up_rate, down_rate;
 
-	up = DIV_ROUND_UP_ULL((u64)parent_rate, rate);
+	up = _get_div_round_up(parent_rate, rate);
 	down = parent_rate / rate;
 
 	if (flags & CLK_DIVIDER_POWER_OF_TWO) {
@@ -423,7 +433,7 @@ int divider_get_val(unsigned long rate, unsigned long parent_rate,
 {
 	unsigned int div, value;
 
-	div = DIV_ROUND_UP_ULL((u64)parent_rate, rate);
+	div = _get_div_round_up(parent_rate, rate);
 
 	if (!_is_valid_div(table, div, flags))
 		return -EINVAL;

-- 
2.56.1

