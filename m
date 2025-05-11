Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9789522D7A3
	for <linux-clk@vger.kernel.org>; Sun, 11 May 2025 17:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746984481; cv=none; b=Hy+2J7fGbDSFwI01mfC4DZ5uh5zjQeaWi/01Ra60JrOdRKuymAPU/Pn57zC8bf07mRllnS17lI+usSFWXoIzzD7r7TI+tP/Qvf1Jsk5+HvgNJX97JaWvJ9TvUUEPEeYyaBdyuUJIIOHYxMlvOaImlYYQQVHpyWl0XOGPLLSArYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746984481; c=relaxed/simple;
	bh=u8Ob+G3P6BviIfXvZ2FMgD6fVlQn8wTY2uh9z+JTQCo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=N0zYvRCZSWo0WHNHLV7iysNCM/Yb+wSpT/NhkGIXH9913BkevHerZpDQI0GQCvQR2HDP4WxTJV+7RA0z5zXWeFB7DCaEOXXLIAZ1sgNtvX3vZt6sUVkIkpUVEiNRbiiMBkcRayS+KA/pyLyCVCCS3X0LmlgxjNYlw8F0lLmvFuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=libre.computer; spf=none smtp.mailfrom=libretech.co; dkim=pass (2048-bit key) header.d=libre.computer header.i=@libre.computer header.b=E8Z+un9Z; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=libre.computer
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=libretech.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=libre.computer header.i=@libre.computer header.b="E8Z+un9Z"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6f5373067b3so56503866d6.2
        for <linux-clk@vger.kernel.org>; Sun, 11 May 2025 10:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1746984478; x=1747589278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PUIuHKm5CrgLUrfb0rxe39olGMFqadKbva67STDygLc=;
        b=E8Z+un9ZmPdPSMz1ByujP8l7EUJ5AEMxdr0TBu/k9Gl4dfdr8r771kB2icm/qWHEHO
         Em4ggo9By9jDX7VsKlvWzTMmMgKMCqTSUszKT5F7J0GIdsjakM2FRdoDs0Fj7zcX64Y5
         KZThpXDGiYWcI4hns0+Tg0Df9wdc0K5jrTAOhnrBtNBqcKzKm+2XmGPJctIpUFi5RnVw
         q4yNNaEmrvl5dckB8UZIa2qInYMbgfe5satZdp29RjWRtRALPCt9CFx7UFzkcmdOwf/4
         64aa+DklUxBe4lBNXe2gLAUPrLaBD/ZzFEeroI7XW4aBsVbO6LPTi/zzCZ8l8j60+bn/
         eotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746984478; x=1747589278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PUIuHKm5CrgLUrfb0rxe39olGMFqadKbva67STDygLc=;
        b=OxbF36OFBpmSu/qZH8bCgBXoX3NC6u5EPQQ0GQ+/yfpj6gVWI9lSTFmVPgrDSxNM/E
         Zw86NE+iwugUNMrrdJ9R3jM9cUsbhpAkmflADPoiQJSyKNCvGfHndfuNdG+DHym8sCvF
         h7uVBopFTW/6SpakYh82XMD/Qg4oMq6S+Bw50YICo8zz7n9Kw/avofaOlEph5lvIlu3z
         Fu+U/rcI7SpLUAXEfTO48NSM3DT9v3AhOX1AkhSz4vgGyo+NbsPM0kqLeVcVleAJo8TE
         TScer/y2yO8vDkXizAMElYIk8OBBELh8ijqP3gAptSDbP7ReoUdLkyv7UsJB6P3+2lfh
         Qp+A==
X-Forwarded-Encrypted: i=1; AJvYcCVhyFphWcVJOkXbUFz8K9n/yFbGzCICg3tFGqZ9AtXUsuYBn8tOiYyXp75WAk2GkkSCO5OHFF15rj4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhFRk32/mPNUmLgh9kQuJBvi8D9shXge5n515F7+InXHMfm46M
	V1y8IfAKbp3x/LaF1HDAXHCS5R2miZnGWpfiHcdMCUgGM7ohXN2mVrct2/OjPA==
X-Gm-Gg: ASbGncv40qmVUUmtX4SeT2AashpthaRXZ5wztt5i726xcTZIuws6F85nVqDxYaUmDgj
	tgqK2GyvDySULs4jI+AJbFyRhs318N6aa7oigF6RDGmdX/X3RnhM6106tOLnRvB+1arag0EEwl4
	Yl8Hk2iBWLTUXQlH7D6/myYzcbzDgBlCl6cC6WyS7sQHF26TMEneCSH9HElv4hkExnnaQjtOoFX
	aI3Hwi/nMfqgj+0Bq7VVoBgUHau3bubll3MuKhXOQ1R79mB3HKOCPtxg0ATJPKZHGVhYykS4UMa
	Mt9hH/hoob/95yz/TvFmZKGJUOkqzRvVRGQ8mO1poo80nkw=
X-Google-Smtp-Source: AGHT+IFlP5l0H31XlZsHA+W4Q93wZy0iO7ylnNI0g0kBW6+BKRL+6jyRI5gTxis2QFwWchN0XCtGaQ==
X-Received: by 2002:a05:6214:224a:b0:6e8:f770:5045 with SMTP id 6a1803df08f44-6f6e4801da4mr189887276d6.28.1746984478330;
        Sun, 11 May 2025 10:27:58 -0700 (PDT)
Received: from localhost ([2607:fb91:eb2:c0a0:10e4:4464:87db:3a66])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e39f47basm39766846d6.42.2025.05.11.10.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 10:27:58 -0700 (PDT)
From: Da Xue <da@libre.computer>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Da Xue <da@libre.computer>,
	stable@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: meson-g12a: fix missing spicc clks to clk_sel
Date: Sun, 11 May 2025 13:27:32 -0400
Message-Id: <20250511172732.1467671-1-da@libre.computer>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HHI_SPICC_CLK_CNTL bits 25:23 controls spicc clk_sel.

It is missing fclk_div 2 and gp0_pll which causes the spicc module to
output the incorrect clocks for spicc sclk at 2.5x the expected rate.

Add the missing clocks resolves this.

Cc: <stable@vger.kernel.org> # 6.1.x: a18c8e0: clk: meson: g12a: add
Signed-off-by: Da Xue <da@libre.computer>
---
 drivers/clk/meson/g12a.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 4f92b83965d5a..892862bf39996 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -4099,8 +4099,10 @@ static const struct clk_parent_data spicc_sclk_parent_data[] = {
 	{ .hw = &g12a_clk81.hw },
 	{ .hw = &g12a_fclk_div4.hw },
 	{ .hw = &g12a_fclk_div3.hw },
+	{ .hw = &g12a_fclk_div2.hw },
 	{ .hw = &g12a_fclk_div5.hw },
 	{ .hw = &g12a_fclk_div7.hw },
+	{ .hw = &g12a_gp0_pll.hw, },
 };
 
 static struct clk_regmap g12a_spicc0_sclk_sel = {
-- 
2.39.5

