Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E100207DEF
	for <linux-clk@vger.kernel.org>; Tue, 13 May 2025 21:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747173238; cv=none; b=dcBi6EYIsJLizn7Et52EC2S7Y1cOMvM2RI9KtSLLaauqNJiAv6SviH5Unz2SjZqx8G7CHi8FDn2rqCHWy6Uwhq9fgBvyV3IWDhyMbZWnMxDSM+sr+0eqvU2/6Dvp/4zS2vSQT376eqCt3cPL9j9Y33AEhkoYujUHf4K+BvV+2N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747173238; c=relaxed/simple;
	bh=xdzDwczN4n97NqtrDQa5z0IlAhOrsZ/pz/wXFFvPRjw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fwBbhWSCgz8sfIE/SwtrHhAabIYCDihDBsAcSZfGhXsoFK7Yk/1ZZF8E5ug92/DuLpXmX7hpxJhvrqthAuaeZTAP1o9I/ZKCyzjsphddU7PepqBYA0nEgr/y+8yDLyii0JbJq8pUlZVJR+Y4wUzl9ToSC7RsiZCjMKofTVfOjzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Tvlao9d7; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Tvlao9d7"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-8616987c261so197527839f.3
        for <linux-clk@vger.kernel.org>; Tue, 13 May 2025 14:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1747173235; x=1747778035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVooGR26bxqbC5iLeacMbQ0G9vLAHRMKZeClAxN+yvg=;
        b=Tvlao9d72prqsHamRCxi3eQhmHzCZSFpAVh3CIa2QS1L9W0WkaiFep9AOvIkvB2cWM
         AWkrGSihHQWREXnXTUVd/SfZBVUawXs+Veq/posY9biajhkl8MuxFnnNFwlty+T4iGWX
         JXJKcLnu0L3ROm+FfKLpm+xRjDYI621Mk7UYCrCHB7tn6GZBYwbF7701ORRvD5wbqp3u
         zwqJxRdz8bQhpzwMpSWnOA0lmAZn5RJr6cOH5hIs21/wqCmxeC0Mc6FgHZ2/kTN+3EtV
         KpR2Kpkjz51PaJmFxefYYrt7tCu72PLAzAoHOlnaSzfU1GWoAnZ4LM0hWv1GinN0k2XX
         nmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747173235; x=1747778035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MVooGR26bxqbC5iLeacMbQ0G9vLAHRMKZeClAxN+yvg=;
        b=XLq/p7r/m2WyuFRc3nqSwjbHhwH6TNXUBKkP3dv09U50IgqnDVrdGPG4xffpke2pLN
         3/etZmG2wqqQvsrnyVjuIbVevf0q71FtJk7s5zAGXCTv8B6fl0cDvTbFfG7zqoyXfw70
         /GccnHYMbUbTfnacr/NprB3vr30h2ygLQV2/6CnciYttx7f8ePjci+NQG4L4+5x67cGA
         7nZcq6pnh8vQffqRpMzHbouAIBEsy/BdU9dzu1goIQc7T8XjjQYgikcY8z6pEytl7RLF
         Gcd9wTNVOUzN2u3NFwbzABD9uadNVtTqFrXVN+MFqpaDhrKAq6j/C53VmHpLru8E8ebG
         7yZg==
X-Forwarded-Encrypted: i=1; AJvYcCU/hTZxDRd6j0HfbOJLsAC7PEWxDFbIk6wKXOy+C/rhZXpH42ECNHUNZzSbylUxtdCsdippoFFnXsM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrBtCWaKRW2Z9XV+XLOXQov+Q8f5pTGq+hRACnnEnC16izBjve
	0DdS6LlNp+OAAbtv2I+VP/69e4XmNUNsWK33bJS/Puenhqgcf3eOMN7cHeBnLyc=
X-Gm-Gg: ASbGncsC2wMaKs8cgmb41YV90SqjxeFSOPa7u7CjO/q1R2KpNDtnqXoWK1xb/t9idJ5
	nKpkm2Z3faYMggwPyZYzowSR+t17H9so5RINuLt5cHKW6AfTnKYKeJnib+BRn3wHk1wvTQHEU3X
	dBdIHj2cZQk1XwH99hqGJWRMO4/nMM2CEYCp2YWP0e6SVgUvClIIjAawrc9pgMaHjxAn/eBItma
	tP+cDjRTEF7y6PGuSj5t7xT92hEBteBKFch4ENcuzZWvkB4zIu0aYAiPIsRRlRSUPthAMBiOET/
	zJZeMQA4WM/sI04ww9UKlNjpaIjJOkpW7RJHS3jlDo1CfPYMu15SPSyKiI9Qsy7tjCWMX33+i8z
	ZHbWHHHZxtJjySjdeJCLBfuEN
X-Google-Smtp-Source: AGHT+IFgAAov0WDbucAa2d2uLkEZNpDggOUKIJvl7ysoc5mJk7YSXRkmxd0htIHYmS45AM68y0mEAg==
X-Received: by 2002:a05:6602:368e:b0:86a:870:67b with SMTP id ca18e2360f4ac-86a08dd24e2mr166204639f.4.1747173235161;
        Tue, 13 May 2025 14:53:55 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-867636e0dedsm239622539f.32.2025.05.13.14.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 14:53:54 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 4/6] clk: spacemit: define three reset-only CCUs
Date: Tue, 13 May 2025 16:53:42 -0500
Message-ID: <20250513215345.3631593-5-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513215345.3631593-1-elder@riscstar.com>
References: <20250513215345.3631593-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three CCUs on the SpacemiT K1 SoC implement only resets, not clocks.
Define the CCU data for these resets so their auxiliary devices get
created.

Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
---
v10: New patch, same code (extracted clock parts of patch 5 in v9)

 drivers/clk/spacemit/ccu-k1.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 1c9ed434ae93e..f9e2200d1fd04 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -943,6 +943,18 @@ static const struct spacemit_ccu_data k1_ccu_apmu_data = {
 	.num		= ARRAY_SIZE(k1_ccu_apmu_hws),
 };
 
+static const struct spacemit_ccu_data k1_ccu_rcpu_data = {
+	.reset_name	= "rcpu-reset",
+};
+
+static const struct spacemit_ccu_data k1_ccu_rcpu2_data = {
+	.reset_name	= "rcpu2-reset",
+};
+
+static const struct spacemit_ccu_data k1_ccu_apbc2_data = {
+	.reset_name	= "apbc2-reset",
+};
+
 static int spacemit_ccu_register(struct device *dev,
 				 struct regmap *regmap,
 				 struct regmap *lock_regmap,
@@ -1121,6 +1133,18 @@ static const struct of_device_id of_k1_ccu_match[] = {
 		.compatible	= "spacemit,k1-syscon-apmu",
 		.data		= &k1_ccu_apmu_data,
 	},
+	{
+		.compatible	= "spacemit,k1-syscon-rcpu",
+		.data		= &k1_ccu_rcpu_data,
+	},
+	{
+		.compatible	= "spacemit,k1-syscon-rcpu2",
+		.data		= &k1_ccu_rcpu2_data,
+	},
+	{
+		.compatible	= "spacemit,k1-syscon-apbc2",
+		.data		= &k1_ccu_apbc2_data,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, of_k1_ccu_match);
-- 
2.45.2

