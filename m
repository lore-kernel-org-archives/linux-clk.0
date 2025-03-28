Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9986C1F2BAE
	for <linux-clk@vger.kernel.org>; Fri, 28 Mar 2025 21:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743195767; cv=none; b=nlo0qoJ/wjqDBXxec1xVCAfVDLxirNBytfaylzrG16To9HfHa5qQt0ujjkcYqj3PlvEbCULIMBMPp6oHhSyDSnL7YHhRS6GErD+7WFTka6bppjwlfrpd92hLUYOTX2s97ocYkT4sapl4hMLhOaye3ifdUYC+zruYl9dLM2f/rT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743195767; c=relaxed/simple;
	bh=W73Khioo6n4aH3dJXKfZOTvx1lMN/9LyAeMHDZJ+yK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sNNvP/p5w9BEiBchopue8nePh/VgwDFrQ/GwhZrLg8whRXEur4VvRB6lzcOopZFyEVFt5dnFeomHBQLUt0ZJ+uTIWJu5QcwiBUn1dYjlKY218KomccEbv2EPLeNS0Aa3P3/PDtPu/A1eB0y6BBCkiSZoPfZjbFG1/GaZ2FTTZIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=cXaI+LZN; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="cXaI+LZN"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-85b41281b50so74700739f.3
        for <linux-clk@vger.kernel.org>; Fri, 28 Mar 2025 14:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1743195765; x=1743800565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rerGx2TveORsLjDrW3hkWd+yAs+YmYyP0wNHZuEm2gw=;
        b=cXaI+LZN7Fnwc/AaWOcpChEIvFlw/zYC0jWpMNDh/c2zKebmwLFUuqYeIPJpsVkdxM
         N22oukGPaW2euVrHE0i1NvbeGQgQJPjNMcLARQQchS/7usAkcC5ZzeZ/JYuuM6j65Tvh
         nF3DWXw8bfKYnJfgubUcwOuOzYA16br1gAm+1Grq427GnI3mJjJbDva9hvehHnQPlwg+
         npo2nGkf834Jz3PiWI5qbnqctJw6IMpfnLhPleRtRg+0Q7fqXjqxLC9ClORKJJhQ1axa
         YUpQIe9txZmhYmuLjoh6P7u1rxtBIFv5KZxQTk0PVnTxWdPnmFHquwwUc2ockAx8ZxJd
         MzHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743195765; x=1743800565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rerGx2TveORsLjDrW3hkWd+yAs+YmYyP0wNHZuEm2gw=;
        b=QhVe5tN0GMGHzISjD29JNKS3X49rMvjmHk7nTCODhEdiiD/8toJvPRqC7a4Rw9Ihp0
         HqHvv75LkN9zTbtNGA2rRICpU4JJDjsMvUE3KqBQamx9YGiSKVYJxw+qXE4wo12Cc0qB
         +yiI2P4/rWtNd1t6eNDe4hHqpdfAQALF0U9C5i3LpU1Mx5TiFUoi6joRiSn5BZnn0WIF
         4djC5Nm7g44Q7nCaoMHH4nWPEr8/i5Lx9YWsbM39UPDEgcdqk31SQxPKgUl0/wZwpjMR
         CiNrgdd+w8RkvVK5ytiIXxAaL71lZH7Qy2oGd6p8syHqyWA3KEpTnwDdIwiAa2/0rDE9
         18mw==
X-Forwarded-Encrypted: i=1; AJvYcCXCqiJ4+VDFr51H4Lu/KKNxmcLCwKNvFlfUfFwZdVRfJY7aDa/w/GtlKN+7nvgJM46xawVSd4yLg3o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd+yAQyLc3TtRxNfXhljThzxZug+FWp+Movqup7G6qwsdchPHl
	at6kUm4nGYeWprtu+6rtV2EYqZN7jkt7zM9sZEDAbC9rm7N1GHL1y1ENSH7HaHM=
X-Gm-Gg: ASbGnctewUrrvPledY/tFRDc1zrCIweeudZinVgxtGjuXR40FjPhZ6igToOTnwmUVvs
	23vLlRsRuLAqlXN0SRPYzOtfU1xmfhelsKZpvtXUQSOnBLYKjnDbuhxAhKXOttHF+udgQH28mMX
	5SSATnFgRNNx2k2oDmV2y+SBAxrV1+d1p+wtSJDrGk4YIRnGQiVLICF4cOh45bswWsVNPmf0Xcq
	leqBRA4EGEhou+Ln/d+u+wTE/h4BKAzc7V7iXhKpfJaLnCuN0mVF+duB9/3Vbx8ZzU8L8U0a0nP
	m4SSz1/MuXJeflowGy+3xkZKLDCvcPjMhNmxCKSyw8yQnGpwJ53C5EvdIl5OB29IGa8XL4YDZJ1
	HDMp4t5xwC3b2NlZREQ==
X-Google-Smtp-Source: AGHT+IEkrPw2Xf+zBd0lVIv6FoNOsOZlQH+aK8mKUSksTkEV25RH9WtQ+nDLN/BB4g7AYZH94fGGSA==
X-Received: by 2002:a05:6e02:152e:b0:3d2:6768:c4fa with SMTP id e9e14a558f8ab-3d5e09fdbf6mr10526775ab.21.1743195764543;
        Fri, 28 Mar 2025 14:02:44 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d5d5a74286sm6769405ab.39.2025.03.28.14.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 14:02:44 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dlan@gentoo.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/7] clk: spacemit: make clocks optional
Date: Fri, 28 Mar 2025 16:02:30 -0500
Message-ID: <20250328210233.1077035-6-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250328210233.1077035-1-elder@riscstar.com>
References: <20250328210233.1077035-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some syscon devices that support both clocks and resets,
but for now only their reset functionality is required.  Make
defining clocks optional for a SpacemiT CCU, though at least one
clock or at least one reset controller must be defined.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - Comment explains constraints on match data

 drivers/clk/spacemit/ccu-k1.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index f837d2c2f31fc..6885fea81f6f3 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -1821,6 +1821,10 @@ static int spacemit_ccu_register(struct device *dev,
 	const struct spacemit_ccu_clk *clk;
 	int i, ret, max_id = 0;
 
+	/* Clocks are optional */
+	if (!clks)
+		return 0;
+
 	for (clk = clks; clk->hw; clk++)
 		max_id = max(max_id, clk->id);
 
@@ -1926,7 +1930,7 @@ static int k1_ccu_probe(struct platform_device *pdev)
 	return 0;
 }
 
-/* The match data is required to be non-null, and have a non-null clk pointer */
+/* The match data is required, and its clk or reset_data field must not be null */
 static const struct of_device_id of_k1_ccu_match[] = {
 	{
 		.compatible	= "spacemit,k1-pll",
-- 
2.45.2

