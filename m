Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476228;
	b=k2LqQzW86iIRtRO+W1N+WFNDuRG68sxWAcEZqdQDAQ1eMMvvME0WNQK1YHoCDtgt7NMu
	 H1phM/T1BnSKNm93C7O/b0RcpopSuOMTRWfTvS4rmFlTX4pwEhPQhLh2G7EC8RDXnV0aq
	 q5gjxnxyh5X4mIoffcBIbD2MeVe6DEPk+a7PdRc3fV55tin9r/Y+eJmUGKCkERgPsKJ6q
	 pGAu/2AJx0XuuNAHUrreLoxfMtMtwXu9sdK20MT2FI9q5PiK3LQzzrzzf94w2UczQGOuX
	 yoKXUPSQIwstWnEx7sV7D37rwBgORsLjRpseVJWjXy0QuYdmCrvOTohq3FaHSKW509A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=HqsgP35vUysjHO2n5LSkBodI0tY85BkRFMws+nyKhe8=;
	b=FYSyHeRX5yIdjyl0CErfz0xIoh1Pli5nlyqk2aWogva/nnKZHe+Z3oNRfFoEoeKxjCAz
	 xJiVX1PGf0/8uormNhd6miJYDq8UiA4v7q4SrbUN2GdQOohjFd5nUnJTmSluJq9STMGpU
	 iAB46CgjiB3wgMEeZOQR97D4RqFHGFPHDvGXVEGEFi9ePbdBFllmL84pWvLFfTLaL2ciG
	 Qu7DtQ4wJt6IVHvJKh1j5IeS6Ncv6hGH315JX0rOJgAKxk57809SNS6bMbVGK/Kd28zov
	 XWqMmSyNCKNRJ1zieV6XdzJN/Ge4ab2W+TxGsHDPkwNp03sfoKsU8C+POhQ9tHitkXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WkaF6h9J;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5E8606A331
	for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 09:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C5E8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WkaF6h9J
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so2653557f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 01:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794476226; x=1795081026; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HqsgP35vUysjHO2n5LSkBodI0tY85BkRFMws+nyKhe8=;
        b=WkaF6h9JurTRVTc08N135vasYLKJ/qoChtCycJzVtG1lYJV6t8FVHatj4m826g1mfB
         RD59yS73DEsTkiYxf2eQi9K3kg0fkgOORnjnJkOKZaBLGCk+Ofg53bJYuc1jWJBQsXhP
         3L2G3r44b2JwA1HFu+FOQweJOlQnYOGbCQLVwfmwzZOCaQaIqHpDhHgNXtmXwk/DJPlw
         XD9uZFVnSKd8j19SnH484ywdmK9gGGHEMBA4IRtcSCl0BxBsqjaWDELhg+k9i52a6cW3
         XAcXBiJ0ns0gavBYPDS0AMySsrBu343SJs6gmfgGCmbZ9m0HRnS4s+EPE+GeZKLKTXKK
         uK4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794476226; x=1795081026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqsgP35vUysjHO2n5LSkBodI0tY85BkRFMws+nyKhe8=;
        b=a5kEk2tRNLFWE6OBl2a9bIBkQkLbQA/kd3g7+0/Z18Cib7FA/TBYRWi0cD7lP6ncW4
         HTiipM3/jjmdPGAD87rI+CRPCNoDuVeeC4S6E5fUzuiTS/0Lh8u154URKsv8iIfF8H+q
         qaQbcG6oDW1rQXBzpbMvD2gMcuS1ztzEVjCxrZG+LEIuLkM9QmcdfjOE6O+hiXUSJFcw
         y+q8U6aW48PUDtkhTzWxCxvE/XXsTnl4ek9/Ac6E4bZX1Q4rQHdT2rzkrj+7OFj9Nyle
         1/SmAqcwhGuNAuURQyGnqH663xGm4KmmoishLyLfKsmUkeDCtJTTKkzqu5DA7p4HNCa1
         h0sA==
X-Forwarded-Encrypted: i=1; AL+hErGiSzmQNvMoxh0oC1wR4SPcsvYFQV1GvvZicVIr02FlTzI97ZJ0nMvIW/RSqYKi9mTCD1HggQ2+F38=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AlEDsy693jO5AjA2FEVf4FqoFYkLBYJkrwkQvP6yj569ehX5x
	kUYwi8oJBgCAf/8d6raP2hVNlnXbuMqyIOTTZUtvpFzmIXgPhKOFZN55wW618VJv28k=
X-Gm-Gg: AYBFou3AsuLc6Q/rvDt9NpAeSM5hYrW9gl088rZ55Lpzc2uVFnjHUyWv5B5FuoqBzqE
	pc3o8GdORBrASKsMvKha5CJrsIvJTa8w6kLJvwAG7SScJ1ONGSYnzzv4LPU2+FtXZjmS3rpbejv
	NOJgkfhi4rfgidddIITBL2FcF5T3U0ZeztNSIeKuefE2E9BKPH2fJmumG6E2ct/mZc3yCmMcUFe
	Dp59Xddh0XzYqvLC5+Zn3WwNLiwRJuYLd6A1BpKBXvHEco1XRPIyIw/5DrgEPHolIp1sFd/DdnY
	OfZC8SUjYFGDpdKfT4/3spyOZUzRQbncMMwToClEgTr4D9X2I9eFQ6axg8g8FQVtKYSJpU4vERs
	MksKr96iWn8ljfkPLsi95exhjdImCunmqJ4aRa61j3QZbdPl0b7j+VWR4CAE0CTIKig3GFfp2tD
	t7P1TXaNW77E8laQsNP+dtf1ULJMAOYkv+wu5x24rklkc/KPbZAP/uqf1Lx0P/F/rPvIg0/alFm
	9JUUTz5rM5jJXujuA+63q5iyzlOfanGKD0SOJcJzXiPwV1pCdOwVNCWSY/VXNzckjrHDWH+5bkK
	ldnlLbEeUN7FpVwc4veU3/69IpGL+DvhODXN26rFVIo7qHFYsPBITJ9N07BsZT2GkY6yydQLVmb
	6evnj9tVbpEqUYw/2ruwtDpYQiIHKAOfC0mUoxWsmcrd8wA==
X-Received: by 2002:a05:600c:474f:b0:4a2:47:b79c with SMTP id 5b1f17b1804b1-4ba093abb32mr92123265e9.32.1794476226357;
        Thu, 12 Nov 2026 01:37:06 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08de826asm85413905e9.0.2026.11.12.01.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 01:37:05 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 12 Nov 2026 10:36:59 +0100
Subject: [PATCH v2 1/3] clk: divider: Fix the divisor for rates above 4.29
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
Message-Id: <20261112-upstream-clk-divider-large-rates-v2-1-18f3bb888b0c@baylibre.com>
References: <20261112-upstream-clk-divider-large-rates-v2-0-18f3bb888b0c@baylibre.com>
In-Reply-To: <20261112-upstream-clk-divider-large-rates-v2-0-18f3bb888b0c@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Maxime Coquelin <maxime.coquelin@st.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Michael Turquette <mturquette@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, 
 David Laight <david.laight.linux@gmail.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>, Carlo Caione <ccaione@baylibre.com>
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
2.56.0

