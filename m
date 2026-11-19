Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795121414;
	b=JmrgbSaj/BpBGcy2LcQMuFsAoMAE2Y3JUobLNtI5mYPwYAlxHOoXcNPPl664zU6bJ747
	 tNhu/zxk6sof+lDsluoshpeDtWdHoNCPUBqqipBLg6j8hXOjfgMqVCQIjjNR4NKKT79Zv
	 nBJND58qqNieaqB5cdCwFAqpMVoI1Hxa+ydpJHkHGbrqSr4NtnTeBES6Ik5oiDeT9Mk2x
	 9t73VJVxseohOXsM5wjwSTcv9TPGZ1i+tAl6eSXgkkSWcK9BwO2jyKdqhlQfIKBNzwoMN
	 MvgGsAyHVXojNlAsLyDnkiyEASwbAg3L+rvWvE4TS365ACuYaKUWGZN9o2BMu5M43wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795121414;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=NPApl66k4B33cmktd3InEPjUuliaw2Y0OFYQmnp0O7o=;
	b=xMgw/C+w2+/D4soLQkryBW/nnlxl+VMnO5qDo2oO16ZPbErqAc3YknKFIZXdI+XQE4nX
	 KzU3gXLnfGLNWv3ofPaWPQTyscK0ylN0AIRp8kHQgq2U7fU9aperaHQ+ZSYYcmuI9L78O
	 RTh18+UzD0XOmAN1LPKEpBFt+7mi94edWTWmV4sBXZGGxr3udNkHJjuyOKUsxhXFBgjPd
	 WUONVX9CnwucVBd4sGeFhniV/lr2CAtiD0gat8ihBbAR58Yp6hZzcWgNCfCBu2zX5eWc1
	 TwIgxv5oq2Y2Sfwmhx0INgSsHeQbjCm+2LpRBDbjBj8vOQ8p2e4nR2cFIhg4yjiCCjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dICpkitp;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03BE606A909
	for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 20:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F03BE606A909
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dICpkitp
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a42b34e930so108506f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 12:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795121412; x=1795726212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NPApl66k4B33cmktd3InEPjUuliaw2Y0OFYQmnp0O7o=;
        b=dICpkitp6U0AhhndJ0iCQRoYmh6OmMVJRAc26ubxWCj3TIlunk9I6G47LXE3fNDJJo
         8zhB9tOM8yKdTwiT3WWjTht92W70MXGO/P6pvGCyYHS5/1FmQqdZs1t0LkSzlitVNNhN
         V3VB7wOZeHQ/Cr6bJPWZsm0XOB12PEjayNqdgob3d/a2UnoVjlBeiFHK8un+14FZBN+i
         jwORZR6Z6jzeR9kBSKEca2dvHmOulMVKt7UdDM+OKfh9Hi4bazZWjp+UT9fP6nR+vPAp
         FbEtmxbFntG1f7afFY0olIMuITNtfwx8+E93rWNsXXZT9ohlk+tJI5IryU+S2WzH4JU+
         0j7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795121412; x=1795726212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NPApl66k4B33cmktd3InEPjUuliaw2Y0OFYQmnp0O7o=;
        b=FJ1yzRlGmvk+IwwqqvSyufQPNOmwvkcg/13XyD+FfFqLpJ6xChS8isu3L0QdL9HN1J
         pQAEa9WbQJ/sfET3y4lOWXYElzGa+7mV3wAv1+XOJlmPWqL4p2q6p+IdftS3gEzaWa07
         VUy2Bx66EVLmmTKKwrxJXdxMIfsNxFtWDUpmzTxfNcjEXmYOiOlvVVvJ0QkLr/SG120p
         HOVUkmLdhfp2UYokooEojtbMwpO5h6NMaUbjNIlwmKkh/VyejFqckBDEbTvNz1IOKf/g
         Tu1oZJ3ZfdpJjtvcqVyRT5DQ3w7I7s6QOxJn311tJVxcLCMF5ZYT7G6qNXXw7maHD3t6
         0RmA==
X-Forwarded-Encrypted: i=1; AL+hErGx50OyWdQLwkhRVbc3jF4DsFkaYGD9CtTcSzZeIgcy4utCE4EXVTrMsidwBnOf5RbFtnNmDzxRfCw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9m+wk/ryReUhIgZ88ZDs2vyOmMvveJEK7YmxTa9ToK60Re6IdB
	tA+BGaVNpW8MrntDqlkJsRDR2qehBmkp2gKm9HNZVR4hoJ9C+7ZHRqe+CFG3kxazo7c=
X-Gm-Gg: AZFdTZctBiKnj6Re60W+AhyJLEQu09Af331rdEtodnyAiO7a+fouIQMv+ld9N9kByc4
	M24i5gcvCqUxNaA2szF/geVt800YKaHowvnckjSO/RcjTn5nnnw/GTzwP82d9MCgZGVKyUNDcO0
	yfqHvPiTz3oUVwjaWMfVpN1SLogptmbllGeDj+i5pCGN16G8kW6kkEuEwYbCFyxcj9DAliYyAm/
	OKrT032+fGmZrh0Dyu3k1jaV7tR8ea6n1ChO3NSTIKOZnjoIxJ8tU8DihMNmHIYK8+tOgNoP161
	j1gxAtqBEYbCwV3rLij+brFpz98X1o61cIIC5Rpvwi7UhXXEC1kWk+MEujVAzBL0wZEk5u/KlOu
	3m0p/M8+YgXeLVPm+FuNdEmnWSIP8P3PQaO4WTm2A5g4pnUaXENozxJFt4GohJY2+WTZJEjteGM
	12TcjZAUMsyen4CRKexqJM+fX8TyC9riyXCh0sQ5/1+3o1BR2bv3eT3LgUCJuM2ccg/aFES8Vix
	LKFx3eO3WgYSSeb/IvaJOZN8nAYYQhLenM2fEfuoK/xi1Yq8hKXFUN6pN5g+FcsSwrdmOxOHL1W
	pgZBEg3i7Mcbz1o36RZORCxEIjabO/ziHUYljiUTuQJLfWOSVyU0wvIdXkJ5ShrYZrJy3JP1lrB
	pX5gKLhTBME4D2UX8bmujVWyYaxy6PlIMcrlFd48=
X-Received: by 2002:a05:6000:4b17:b0:48e:f47:273c with SMTP id ffacd0b85a97d-4abaac57a40mr1188682f8f.8.1795121412592;
        Thu, 19 Nov 2026 12:50:12 -0800 (PST)
Received: from [127.0.0.1] (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b1ebsm1654826f8f.33.2026.11.19.12.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 12:50:12 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 19 Nov 2026 21:49:32 +0100
Subject: [PATCH v3 2/4] clk: divider: Fix round-closest for rates above the
 parent rate
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
Message-Id: <20261119-upstream-clk-divider-large-rates-v3-2-838eccd2e497@baylibre.com>
References: <20261119-upstream-clk-divider-large-rates-v3-0-838eccd2e497@baylibre.com>
In-Reply-To: <20261119-upstream-clk-divider-large-rates-v3-0-838eccd2e497@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Brian Norris <briannorris@chromium.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 David Laight <david.laight.linux@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <masneyb@kernel.org>, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

When the requested rate is above the parent rate, _div_round_closest()
computes a down divider of 0 and divides the parent rate by it. Asking a
CLK_DIVIDER_ROUND_CLOSEST divider without CLK_SET_RATE_PARENT for its
maximum rate with clk_round_rate(clk, ULONG_MAX) then traps on x86.

No divider goes above the parent rate, so the smallest one is the
closest. Return it before dividing.

Fixes: 26bac95aa88c ("clk: divider: fix selection of divider when rounding to closest")
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Brian Masney <masneyb@kernel.org>
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/clk-divider.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index c3f46f9ee451..ed60fa9b04fa 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -254,6 +254,11 @@ static int _div_round_closest(const struct clk_div_table *table,
 	int up, down;
 	unsigned long up_rate, down_rate;
 
+	/* No divider goes above the parent rate: the smallest one is the closest */
+	if (rate >= parent_rate)
+		return table && !(flags & CLK_DIVIDER_POWER_OF_TWO) ?
+		       _get_table_mindiv(table) : 1;
+
 	up = _get_div_round_up(parent_rate, rate);
 	down = parent_rate / rate;
 

-- 
2.56.1

