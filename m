Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728682797A0
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 15:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752162710; cv=none; b=kTYqWkyfY1+L2dM/1qLuCTt58QoaBaGbsvDfw/OnkyiyEHgvTqeiRp4447K2opAu2bl54kZGkupARm8mUe9pIRzQpBFZttb7WdmaXLgHeAwcNLH0i5+vyZqis96CK7n9CdFS3kF6/uTz5QvcudK3XeOiiqgSR89Pjkw51TknRTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752162710; c=relaxed/simple;
	bh=vLmJmRC+9bzkFJmLST4jSrv6MV1rviG/pwzLdY7NBcI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P/BmCIe6xyf+cIrgfj5E24ffqEgWcYD+iJMWGkXSx2lPRVvQPZk3Ujmn3jwwYR73xFBrJG5QB0DJzLKN2S03rSkr9x+AFa7PWfHusZ2896rAEDloOVAcSLiWbnmgfAGGJL5T4dbcUX8eSCE2WyvP98nD+kbXv8KnjTyu8l5hReM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dYwEQCMp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dYwEQCMp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752162707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uPmO2oQ+ynlDeJxb9Am/uG3bA7syL2BNHimRk7a6rO0=;
	b=dYwEQCMpfXwNW9vLWd1yWihGkTaSJyNZj32XUsYvyw62RnJCbGM39jWZ6ilmAPmgnR6Jyb
	3ZS5X07WZ//Ma4HWjZa05QukTmg03NWZk7DfpjSvkWVYkigL1QEesWvmZEB3rl1xPO8EjC
	tkECYYcMzM6BBAcSPD8IfDZBke2G+m4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-lfHM1Ib3PZGK6LNgONOk4Q-1; Thu, 10 Jul 2025 11:51:46 -0400
X-MC-Unique: lfHM1Ib3PZGK6LNgONOk4Q-1
X-Mimecast-MFC-AGG-ID: lfHM1Ib3PZGK6LNgONOk4Q_1752162706
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3e90c3a81so101016985a.1
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 08:51:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752162706; x=1752767506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uPmO2oQ+ynlDeJxb9Am/uG3bA7syL2BNHimRk7a6rO0=;
        b=gmy4RUKgxJR+j4W/1LdO401pgVeX74BZTBM0rmm+aMkt8hygehqWhdnjfV/BYzEX87
         JBxHEtK9bfaiv6NH6+kSqtNz0ERjX7Inf1xy2zWEeXrZCt2H1kgSmLP7SGt4eO/guYWc
         YHWRstahhHDETGFH50xuoEfki+LaaYZ91VH8CTQaWlHDZFJ0DUqbbBYRK+/nqYIhVUnv
         fKycRy3NTbClr+wafSXIxTlXlrGEF46Ny/qzYVwZfZ/+y7sjE0pbtUxdjZPFLLzImu+z
         VdUV1GqmtLuEinIq5ckq0A5NJhU22y4jIVrrYW50vd7jSBe1NdaGK3+sPxOyWQBbef9h
         ZUVA==
X-Forwarded-Encrypted: i=1; AJvYcCU82JZ61Jb4dFZaoiLCuUAv2iWVTyybEM3qkO8q9cseJts/ykaWxplok6dQLyOxRN8ktALHeJJiAms=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd7oxVeoRhC/LT7IEYMgNQ2749mLJrFG4KO1nMvzxg+3o9te0r
	mh0X83QA1YhH0p4mRD5+TutfpfleHU8ErbzIWIYnwWrtx7S2mE+InmpAMu7F7gJ6wvqqpZ+kvZQ
	u3Y3xv3kIs+7M3qZMHddIiPi8GWKYVnZEYpknnUNbwIAvwzqX+P04HB4WgDAhxA==
X-Gm-Gg: ASbGncvIFtw8Q3myjaQfzIoyG+SUjFhVKZ3RIjwW6BoxwHvcI+4SX9sxG6uOqXnghwO
	HMi22TT09OkAWSARxPvkaTT0LG/LymmM7lbv5FDZUN7FFJqqjjFOVYUrZOGSOY3sww9zYn5dQ+m
	aJh7CAVKTr7kuIII3aA0EzWkUYcJvmPcuESJbbgqaKfiKXp2DkHu4lx+oqwwYtP5RGp3hfV/szw
	Fa7Kb9tGxG91cP+H/uECIsbiDGnojf7D4VsGKMne6x4EGRxejax7XSNEN4oACfUEPPlg2x+E3eB
	DP0aTj5WGNqC7DDg5VQsbV/0BRp6ZGIZaFD+sNfgI9Wb2QUp0xGniEhaYEyw
X-Received: by 2002:a05:6214:27cc:b0:702:ce4a:849b with SMTP id 6a1803df08f44-704982360b5mr39084316d6.43.1752162705569;
        Thu, 10 Jul 2025 08:51:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkuqPel6v0c9oLWEAy3uC+hrgIsFPdla2ArZn2bXT5IJXXP8ZdH6ZBnGUgw1dx0j1MhfYDcw==
X-Received: by 2002:a05:6214:27cc:b0:702:ce4a:849b with SMTP id 6a1803df08f44-704982360b5mr39083756d6.43.1752162704970;
        Thu, 10 Jul 2025 08:51:44 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d3940asm9475456d6.73.2025.07.10.08.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:51:43 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:51:07 -0400
Subject: [PATCH 1/6] sound: soc: codecs: da7219: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-sound-clk-round-rate-v1-1-4a9c3bb6ff3a@redhat.com>
References: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
In-Reply-To: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Oder Chiou <oder_chiou@realtek.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752162699; l=3957;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=vLmJmRC+9bzkFJmLST4jSrv6MV1rviG/pwzLdY7NBcI=;
 b=Whbfgc0vqEfbD1+TqJhMdUQrpnzHP0K9B9S+FRtvZgCJnqYxlve3+jWZvpTSIWePANUgtkvX7
 faBzXT5+lP7DDmWOWcvnzTKOy6haiXPgyE+uiaAkDiRx/3YzQGQaLXs
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 sound/soc/codecs/da7219.c | 64 +++++++++++++++++++++++++----------------------
 1 file changed, 34 insertions(+), 30 deletions(-)

diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index 221577574525a5fd60180a4441331d7db88f50e2..1742f91c788c62a34f35aae44fcfd1d7fbea007c 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -1982,8 +1982,8 @@ static unsigned long da7219_wclk_recalc_rate(struct clk_hw *hw,
 	}
 }
 
-static long da7219_wclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
+static int da7219_wclk_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct da7219_priv *da7219 =
 		container_of(hw, struct da7219_priv,
@@ -1992,28 +1992,30 @@ static long da7219_wclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	if (!da7219->master)
 		return -EINVAL;
 
-	if (rate < 11025)
-		return 8000;
-	else if (rate < 12000)
-		return 11025;
-	else if (rate < 16000)
-		return 12000;
-	else if (rate < 22050)
-		return 16000;
-	else if (rate < 24000)
-		return 22050;
-	else if (rate < 32000)
-		return 24000;
-	else if (rate < 44100)
-		return 32000;
-	else if (rate < 48000)
-		return 44100;
-	else if (rate < 88200)
-		return 48000;
-	else if (rate < 96000)
-		return 88200;
+	if (req->rate < 11025)
+		req->rate = 8000;
+	else if (req->rate < 12000)
+		req->rate = 11025;
+	else if (req->rate < 16000)
+		req->rate = 12000;
+	else if (req->rate < 22050)
+		req->rate = 16000;
+	else if (req->rate < 24000)
+		req->rate = 22050;
+	else if (req->rate < 32000)
+		req->rate = 24000;
+	else if (req->rate < 44100)
+		req->rate = 32000;
+	else if (req->rate < 48000)
+		req->rate = 44100;
+	else if (req->rate < 88200)
+		req->rate = 48000;
+	else if (req->rate < 96000)
+		req->rate = 88200;
 	else
-		return 96000;
+		req->rate = 96000;
+
+	return 0;
 }
 
 static int da7219_wclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -2070,15 +2072,15 @@ static unsigned long da7219_bclk_get_factor(unsigned long rate,
 		return 256;
 }
 
-static long da7219_bclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
+static int da7219_bclk_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct da7219_priv *da7219 =
 		container_of(hw, struct da7219_priv,
 			     dai_clks_hw[DA7219_DAI_BCLK_IDX]);
 	unsigned long factor;
 
-	if (!*parent_rate || !da7219->master)
+	if (!req->best_parent_rate || !da7219->master)
 		return -EINVAL;
 
 	/*
@@ -2088,9 +2090,11 @@ static long da7219_bclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * parent WCLK rate set and find the appropriate multiplier of BCLK to
 	 * get the rounded down BCLK value.
 	 */
-	factor = da7219_bclk_get_factor(rate, *parent_rate);
+	factor = da7219_bclk_get_factor(req->rate, req->best_parent_rate);
+
+	req->rate = req->best_parent_rate * factor;
 
-	return *parent_rate * factor;
+	return 0;
 }
 
 static int da7219_bclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -2116,12 +2120,12 @@ static const struct clk_ops da7219_dai_clk_ops[DA7219_DAI_NUM_CLKS] = {
 		.unprepare = da7219_wclk_unprepare,
 		.is_prepared = da7219_wclk_is_prepared,
 		.recalc_rate = da7219_wclk_recalc_rate,
-		.round_rate = da7219_wclk_round_rate,
+		.determine_rate = da7219_wclk_determine_rate,
 		.set_rate = da7219_wclk_set_rate,
 	},
 	[DA7219_DAI_BCLK_IDX] = {
 		.recalc_rate = da7219_bclk_recalc_rate,
-		.round_rate = da7219_bclk_round_rate,
+		.determine_rate = da7219_bclk_determine_rate,
 		.set_rate = da7219_bclk_set_rate,
 	},
 };

-- 
2.50.0

