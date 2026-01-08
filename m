Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A85D4F29BD
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 12:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767875680; cv=none; b=jt734CwkkepU2VRbW+Ar2eQOgLk8nFjRW0N5P5/gwD7JWqY+mVIhHY8C0UU6hRLtGFrMBJk8u7l3QdB+JFz34hBh39XgcgmyQkJ2l4S17yzOJc3i/VKxN/+n4O+EfEYyv90tuJ0G3X7b1s89xAYd7a7IQxYfcVMS5oeV77SCssI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767875680; c=relaxed/simple;
	bh=VFIU6oRaDH9Q5I6u83icDPhX1E3PIl7DXyKWm0LGw7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z5ojdlndwdqI8OND1wwbivBN5OeeewP0exmEmuSmnlG5G67Ch9LTH+yQ6mowG05R2kf3Nz5eNs1mpqq6sAdHlYfeO+MkdWIKfBRDi+6y0SWNBQkSlry6xILc6FHij7ctu3x8mlls/KugVP3jNjujthr8y3V7HrcLJNTU9ZuEDIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JXrAUs97; arc=none smtp.client-ip=209.85.208.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JXrAUs97"
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-64dfb22c7e4so3260483a12.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 04:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767875676; x=1768480476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWpdF/L1lGPO4cNpY+tbEjaN0of/AygjMtoXE8dzuSc=;
        b=JXrAUs97wMSdFRyYng+BqDMx8QmizXXQY1Iv8PI6lFAM317xdY/vWE0Ve85ILLasCd
         04doTZxbw5CxEsfh5AOHj7YwMZbpf5QPXVU23YxEbTkPWQOHYKQ9jl8ulewJRz4ve0/z
         PAAda5OPSBIFd9vmgIsV4AZouIKUc+HEr+qVgrnkp5hq+MsbPzShrsInSVc281BSrdUZ
         oQkPSvuH2poaEg5UoFAisQouAcikcsa/qNlyX3UKxBaLBDBixXSQDza8YuyLvXb1TQqi
         L4wGq0ITOYF0MWbVCpd3/I4VpubwU3JjR2+gssy17+usIUCp1/Nikgz8Zc84beUshQJn
         rHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767875676; x=1768480476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fWpdF/L1lGPO4cNpY+tbEjaN0of/AygjMtoXE8dzuSc=;
        b=ASna2nUTBDFJ7jy6teSMotCDeUmWaWT0MhQ0YD0PRH0BOIn0GUW+rw8IEdfzpeasqE
         25rm+/5mN3usoowW3IIPYD8uv3RUdLCJyP4dXCZH0uwDdsGu53yjREfvK+k2dNsdnbm9
         bYrBqpKrYrLwW/mHt1U7JdxEy43UfyXJw1buCAXpkXlrKD3k/3RW9SyZgvPN1zGEUyD8
         woymWRmeqPmitH/bvmPr6whMTe2hdmcigWp3HmDa26Eo32zeHg4p7LmqPjajTeIh7YpP
         1a9teJj2dl3QyJx4E76nWIEFpEnQ2cmDlbNkv8DCoGCDYwDaFKhkJN3t1b8ZIEk8JwZD
         7fSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk7dAsH2iVPCpIRNa4PmcvIYeIE5ZKzuTGIljE28LGg7MeFpVDi6Hn9Dn1DTTqbjeSdYpPzoex0vs=@vger.kernel.org
X-Gm-Message-State: AOJu0YylQZoxRIjaXufPr8T1PxA7/5/palySbPQy0TZqsNzMxrkKfS1+
	i63EnTWn9c5ug8gPwReT1LwAFrok2o5TCUIxIxbbBDsK2hrETbRa4sD9gXu4k+D7
X-Gm-Gg: AY/fxX4laP166ycnSo0runSKuVf5aqdsAKc9MgoIwiCKJMA5Vik5JlznafOOVBSUAmV
	4mpYsAS69n0SNlFQgOv1FvWDeXBtGxNOOWV0l6YRHAn5y5k5vVdCNuyPBdeBbrThP48BvLlLvaq
	MyNBNSWTbM6JPTf74BcYjlSa5PTB1Qhu7Ol4Dvkdn/+75Rv4DKAYifTKPbOG9Av33zFRsrPkl/P
	MnUbbA+jxjMHZrl+MuM28/0IueJeuwU/93fIsXXRlnAoBGkayl9a8JPZoZGMDE/z0ixk1BUsg7O
	kZoo/crphElhJW4apPIQok2VLYh1KuJPEGC9HZ93/23FEWurAJIXIfbFDXRQtoE+VvzcogdOJTw
	IMUcZOaIjfPFdA0dvSItSPTDRkr0Yvn8Vu3lJ5HvekNS0NilYXeCINQT1zvSH8bDwvPvImZUiCy
	YgZ4OcnJKIOzncfHimgZE02KTmqQXgYF/XzV4=
X-Google-Smtp-Source: AGHT+IGig9B7upsLQy2U4wXWc33e3+oUXUybZoUQZ8HJCrrwThoX1DnTNrMbMy5YFQG+q8WoWyq+OQ==
X-Received: by 2002:a17:906:ef0c:b0:b71:ea7c:e501 with SMTP id a640c23a62f3a-b8444c593c2mr701325766b.4.1767875676040;
        Thu, 08 Jan 2026 04:34:36 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:a172:15fe:21c8:edf5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a56db21sm780412166b.71.2026.01.08.04.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 04:34:35 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 1/2] clk: renesas: rzg2l: Deassert reset on assert timeout
Date: Thu,  8 Jan 2026 12:34:27 +0000
Message-ID: <20260108123433.104464-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260108123433.104464-1-biju.das.jz@bp.renesas.com>
References: <20260108123433.104464-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

If the assert() fails due to timeout error, set the reset register bit
back to deasserted state. This change is needed especially for handling
assert error in suspend() callback that expect the device to be in
operational state in case of failure.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
 * Added the variable "mon" in __rzg2l_cpg_assert() and used in
   readl_poll_timeout_atomic() instead of reusing "value".
 * Dropped the assert check in error path and simplified value using xor.
 * Added Rb tag from Geert.
---
 drivers/clk/renesas/rzg2l-cpg.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 0bcf64b152e0..f670c6408ea1 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1647,6 +1647,7 @@ static int __rzg2l_cpg_assert(struct reset_controller_dev *rcdev,
 	u32 mask = BIT(info->resets[id].bit);
 	s8 monbit = info->resets[id].monbit;
 	u32 value = mask << 16;
+	u32 mon;
 	int ret;
 
 	dev_dbg(rcdev->dev, "%s id:%ld offset:0x%x\n",
@@ -1667,10 +1668,10 @@ static int __rzg2l_cpg_assert(struct reset_controller_dev *rcdev,
 		return 0;
 	}
 
-	ret = readl_poll_timeout_atomic(priv->base + reg, value,
-					assert == !!(value & mask), 10, 200);
-	if (ret && !assert) {
-		value = mask << 16;
+	ret = readl_poll_timeout_atomic(priv->base + reg, mon,
+					assert == !!(mon & mask), 10, 200);
+	if (ret) {
+		value ^= mask;
 		writel(value, priv->base + CLK_RST_R(info->resets[id].off));
 	}
 
-- 
2.43.0

