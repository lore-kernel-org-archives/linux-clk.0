Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006C034C805
	for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 14:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142892; cv=none; b=HGRnGTfJHBrisDQY/XaLiwvxmKkKr2pCWZuRJ4KYiqRX0sBdQ/uPVpOp2KhVLuk7GeYK1GmE1F8sHimJY9AuvexWWMmhXHQr3o4ftgAHINRvCsjtz/zhAW2AkfvtWXqqsRHifH3F6m1z4SvVSxkPzcirozLWsNBveDgydSHQEu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142892; c=relaxed/simple;
	bh=7dAHRT2r7ftPVN1rS5b3fLL9XXBwlAPnHlEMfM9TlgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=InkRa+numYwzgkyHHFw6IRWo6L+PVjq2KLE7MDrW483n831ktyp2XlMBOuFnJzV3sKON5FUiA18ZQGAL0HF0DL7zn9UetBGqvXKRYLykZmAxve2hgsRR3bQ6ziOBiC/Qr1QHNFosYK55gMpPNfOPURphLDIiRk1GYxQTOU7+M2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gK6xSnc4; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gK6xSnc4"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3ece1102998so5676874f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 07:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142886; x=1761747686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/43znEe061f/mLeX5mGh0JaDqN09K9lxSSjlK2dh/Q=;
        b=gK6xSnc4kplXFq0FvB0OSozSxeUmexNZj3sclk+TPZN14oIEyEl/Tpx0iLLXClzemG
         9wyMGf4xs1EOzYGKchwspjuNrFOJGPIcIh+FaFiU7IAPxpF+IqINj6EXj4/O5bHk0oqA
         Hs6YYL/iPgbP9DDMrXy7qV0ic9kssFiP+G4NlVB2aS4dZZeKjMGiUQMK9EAkMEKoJd7l
         NizIqAs/QpH4MXnKdTct5CXnLfwsw3ox0Vyv0KOvMM0TJioBbRPvO1NNwSXloQHtpN/D
         Y9Xp+hT7NIXDcJdIP0nB1raNREj1xbKDtmK+jA6WutDRvrrnl+y/ue2MinxuRpp62Ybs
         K0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142886; x=1761747686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/43znEe061f/mLeX5mGh0JaDqN09K9lxSSjlK2dh/Q=;
        b=QMl8h58TPKHdWNQN/maCGKfPw6FS9zKIRj2GqHW65Y0/EshmugK0PTmbZpzu+J+oJy
         V5awM8ONeWNSW/wAU6F5kwY4NTqRwF5knTY6LTGX0Ish6uOvQzw3wu9pDK7/pC99sZ/T
         fXN8401VhiHMkdijPN/3jli/eP7zg/JVw9iPp0CoMmQbnh0CXp6KFnNjSQk/YQWyXfMK
         0n7E0xZOqhaDcErNeBX2DFZJJsgC6lYEeiYB3xHVIjAOkcg8wjbNSPQtA+pzIWEtT3j7
         1Nn5aVtHZ2jJHMMte7iFbUF9yPyS0Wq7iHgCjirFSy6QzjHSgSavdeGeI4AmQ8M+uEGP
         ytMg==
X-Forwarded-Encrypted: i=1; AJvYcCW9ZXRPHlUKrJQLMwlU4kFJ4yaLolxYbml4c1iEVsOPyjGTuRG1RoZok77cS/ZlNNt1XnM/jCHMLV8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpw1gBRh8zWzHFl1n54+u8xEhRTrT2/OL1LNz7Cn1OlhevcTib
	vyfi1JWohQUnpd8j9CoyY6lSVvWoAmIJs0BmMBcpn7tx5Av5UWsWUDpY
X-Gm-Gg: ASbGncvgixHjtVEfMuAk7QS6C3QLeX6fWoGE1eLRZ8XXEmMza4mp5lRsDAPv0bP1IMI
	Q0sxHUSM/rJjH1qfDss7WpfY1Z9gOhnHKrqcb6J2phLzjxTMbK3R6Ino6gEhz3fJVgKwfZxcsBO
	48ES/0bVITQFoVlJmFeZasScibOQn5/NkoMUlfTarH/l8effKbmH1uBZKdt8AxXV2daTCRC7vfh
	vRcJmvCnlJHaPPGXBpC7o9DZMkq42cXj3V9FVAFRj88HT606o9CBrX8wF2GSGGlJat0Vx6fM2r3
	+x+L16tZvYSrpwTSX+ndL5sdap1ge7HIl7HNHr6gaNXE+6HfUfJxG+qTmHfD9fqABK7GAwOwenM
	Nd5lKnlEKnEA5z4NRX9/WB7rV678cH/EAFR+mgA/hGok2bn7eneGy131An9U1rPQOY4hpQTsYhH
	dL0Q==
X-Google-Smtp-Source: AGHT+IFCY+Sxhr527k6+OJwXsM0mYpA87pB8vo+egXovwmlWxMOKiHZRGcuNGUJAN41+XF6ergNZUg==
X-Received: by 2002:a05:6000:3113:b0:427:7ec:ea41 with SMTP id ffacd0b85a97d-42707ecea7bmr13107185f8f.57.1761142886167;
        Wed, 22 Oct 2025 07:21:26 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:25 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v5 02/23] dt-bindings: clock: tegra30: Add IDs for CSI pad clocks
Date: Wed, 22 Oct 2025 17:20:30 +0300
Message-ID: <20251022142051.70400-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tegra30 has CSI pad clock enable bits embedded into PLLD/PLLD2 registers.
Add ids for these clocks. Additionally, move TEGRA30_CLK_CLK_MAX into
clk-tegra30 source.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/tegra/clk-tegra30.c         | 1 +
 include/dt-bindings/clock/tegra30-car.h | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index ca367184e185..ca738bc64615 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -53,6 +53,7 @@
 #define SYSTEM_CLK_RATE 0x030
 
 #define TEGRA30_CLK_PERIPH_BANKS	5
+#define TEGRA30_CLK_CLK_MAX		311
 
 #define PLLC_BASE 0x80
 #define PLLC_MISC 0x8c
diff --git a/include/dt-bindings/clock/tegra30-car.h b/include/dt-bindings/clock/tegra30-car.h
index f193663e6f28..763b81f80908 100644
--- a/include/dt-bindings/clock/tegra30-car.h
+++ b/include/dt-bindings/clock/tegra30-car.h
@@ -271,6 +271,7 @@
 #define TEGRA30_CLK_AUDIO3_MUX 306
 #define TEGRA30_CLK_AUDIO4_MUX 307
 #define TEGRA30_CLK_SPDIF_MUX 308
-#define TEGRA30_CLK_CLK_MAX 309
+#define TEGRA30_CLK_CSIA_PAD 309
+#define TEGRA30_CLK_CSIB_PAD 310
 
 #endif	/* _DT_BINDINGS_CLOCK_TEGRA30_CAR_H */
-- 
2.48.1

