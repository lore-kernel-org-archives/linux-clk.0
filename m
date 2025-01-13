Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C801A1FBCB6;
	Mon, 13 Jan 2025 23:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736809865; cv=none; b=r/1Z1Z6HevREhIKyjRUZ3Pimjfk4UFg7EJPaupx027cyZTxeqWZkwpkmAfFkr6fF8pRr2h8bRF+y8+TjYFZ3ZyULiHn6plw3mK5Im0w7qLbzFjVJwQ3rf3ysCAeK3YBHDGuY/3gPRiP0jc7zp+9d+gqak8sYUvgDPuc5bBcZp5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736809865; c=relaxed/simple;
	bh=FloLwnsydALG9DWp3x3cdg0I6IWnX1uauQMK+s6dyUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NoaYJ4CVzUWFa0snRXDQKQQ3wax2p6VFYjUQxLCx2E//hCk8clnKwpxYwGLJiWe7lWKZms3mEi3F8E/zL1QE4zEFFSq6GoWfgJXaorOhlsFUOFHj+HJoWuczyhkRgKDQO6tpSnPqpK3XJtWBsDUATXwOYi/V6ZOVTiY9Pbza5TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJ93zlQ4; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJ93zlQ4"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38632b8ae71so3483001f8f.0;
        Mon, 13 Jan 2025 15:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736809862; x=1737414662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HtfMtrOtq29iez+tmvkbjmrH2ZD30DiNbYNJfGXFPHM=;
        b=OJ93zlQ47njQYxIc/GBbpHmO7zEg2Uoiq/IfWwaG2oYcAXlIhlplDPq5jcyGDwrW/P
         9x/ey3IveW/vvtU72pF++yj4cwyW2tP2rubB1SxucyXXF0S9BIQK50+uUaAyNnXpZuAf
         DFg7EqywNz0FCV76fAzWPhsxTaL4qe1DnDKuZBeT2/sjYBmd6G4JvD1dbieyuCP7KTBb
         AQhJLhynG7EBCSARwQyTI8Dlnjc6wvb2VH/zvDRDJA5gff1k281ZSMqSFpyOrL8zLX6n
         H0z4w4o4yKqTXXiPLTdoLHz8dKCE/EYmPlzynQL1LqaPARIUq6KP24hESxHGgA1lDBEV
         K6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736809862; x=1737414662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HtfMtrOtq29iez+tmvkbjmrH2ZD30DiNbYNJfGXFPHM=;
        b=tArSEO6AGLNGyE/wj8RvMFb2B06HJLcCVR0zrVsBlbsevLlPSiByzkvpppfhrLTd9H
         Xu6U84lnpz9xjhnPOxM94jnu3gJ/MRxzQB40rXnc97z+0OasiAM+wYKBFietPwKmkRXW
         J5EjKG+QfxwPEU2+VfZ8tEjAah1Mid7tYGFRL42XtQDNbE5g3WYfG2JReGII8EmHUzLc
         lwsxG64mddpfGkJ6dcLcuYmaXkVblYJuAlHr/sE2cLQy+aQ+swOxCB8ooWMVsrojVBBc
         DC/E2prslyozuVlTkH3K1I1jyaJGLnwm1c7mzEKiXgk66idqkhE7EFd9beb3AefmRdc/
         mPlA==
X-Forwarded-Encrypted: i=1; AJvYcCUSQ2ALZQWsuRdNAsxIVDP6q8MSanz/SRdV9zXUajYMSIUviDkFEtjGZS8otIC3UZhut+iV8IaPDwCu@vger.kernel.org, AJvYcCWjr69mp0/xvqd+SHu5YacaZ0LGRV9pBAoVZr5INuwBprB4m2zzJvwOCpNIdUdjtNOWCZHDsF4yvmAd@vger.kernel.org, AJvYcCXjhsKoqLhc6dEmOZfdiBAkXRPhRMd5E/RUzraOuLraJD8SHjjvTRr+f9haIIkLSb6W3BTI+gtPlDXoXsYc@vger.kernel.org
X-Gm-Message-State: AOJu0YwKS6tLGpUX6U0mbr8egsim8dLO0fkOAWl69VSF2Sn45y9/zB0a
	i7gD23B8U45FESTBr3MXAo2xRFqXW/NRTe2IN1CEUrsSywjCND/F
X-Gm-Gg: ASbGnctNxfA7wR72+34Zf2ICHbMLb+wqla/Lvxz1SSt33lrpHVrb4mv7XytKq6kSnjN
	i1uXV2uKavhzEL/ziakk20pD0+wDCIdW1RV9KZ/xjH0GSt5jj9KyawDS2ksmuMUiiI+np92ES03
	nxLjjt1kXcyQYKGBPgyw2PRvcWhbFBa6uEQdiFqUeTIo6M9zqoo/Cjwi7WYVdu+lks5XZfYtvmt
	Aeb/+vaK0vl8Qh7Q//LCHLyhgPGma4xf6WUMDwV9kuAObb5HkNiyaFNdP/cunQItsLk6hnwDElS
	Pxgz9Wh+N1HUDAbCJX8bSIpuNw==
X-Google-Smtp-Source: AGHT+IEW5PxcJkAyB11SX6cfzx5zT0Sl2H3iqrYPIG17QunlSue81Hy4daKRkHG3nHrB+lC0MD5l3Q==
X-Received: by 2002:a5d:6d01:0:b0:385:faaa:9d1d with SMTP id ffacd0b85a97d-38a8731508amr18277913f8f.35.1736809862065;
        Mon, 13 Jan 2025 15:11:02 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436e9dd1de9sm156091075e9.15.2025.01.13.15.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 15:11:01 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	upstream@airoha.com
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v6 4/4] clk: en7523: Add clock for eMMC for EN7581
Date: Tue, 14 Jan 2025 00:10:05 +0100
Message-ID: <20250113231030.6735-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250113231030.6735-1-ansuelsmth@gmail.com>
References: <20250113231030.6735-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add clock for eMMC for EN7581. This is used to give info of the current
eMMC source clock and to switch it from 200MHz or 150MHz.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 3a4b7ed40af4..6a763bc9ac1a 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -91,6 +91,7 @@ static const u32 emi7581_base[] = { 540000000, 480000000, 400000000, 300000000 }
 static const u32 bus7581_base[] = { 600000000, 540000000 };
 static const u32 npu7581_base[] = { 800000000, 750000000, 720000000, 600000000 };
 static const u32 crypto_base[] = { 540000000, 480000000 };
+static const u32 emmc7581_base[] = { 200000000, 150000000 };
 
 static const struct en_clk_desc en7523_base_clks[] = {
 	{
@@ -281,6 +282,15 @@ static const struct en_clk_desc en7581_base_clks[] = {
 		.base_shift = 0,
 		.base_values = crypto_base,
 		.n_base_values = ARRAY_SIZE(crypto_base),
+	}, {
+		.id = EN7581_CLK_EMMC,
+		.name = "emmc",
+
+		.base_reg = REG_CRYPTO_CLKSRC2,
+		.base_bits = 1,
+		.base_shift = 12,
+		.base_values = emmc7581_base,
+		.n_base_values = ARRAY_SIZE(emmc7581_base),
 	}
 };
 
-- 
2.45.2

