Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B122E7F06
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 15:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813441; cv=none; b=OaeKN3rDoubogwr+jlB8Qx0K5i3spet8Uf1j7oggZXR7M6+ckanj2TRWs2Nz8G0mmYYgShxczJqY/4EbLGyzhPJlXK36jg6owJCmmvtK7fA5rgxn6eyxw9Fe1rjTlP5v6m1pVPrz7QAe8XrEgylzFE0VLVNBtOhDo0tQTI1+VUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813441; c=relaxed/simple;
	bh=FZOaPk/XiWFhkp3zMB+0dvCF3erehg3z6+zK/HzLAY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vBrsFSxcazQt5sIr+9f/9/8vT+sLxJDhhzQ9KIVA+T5NDe7P+m0h+a2gCKAfgOIuR8GpGJzwIfEuPjMFms2LS4ysb2wqiDIvsRzQKNoimBNqtsK7CR6p9yk85eDfjNFAK7pqgbpmRBfgMc8kirJ7p4NHp7oNG/o5ysXHZx8Xf9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fKEfCl7A; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fKEfCl7A"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5688ac2f39dso1245254e87.3
        for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 08:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813437; x=1759418237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pg0HJx9UF6cc43KSohy1sFUTcyD1/BLQvc4mTLXMxcE=;
        b=fKEfCl7AVmJHQqhbtbf0R4rOqSa4No3ujMoQQUO4+qZ6MnivJ0ps65I9HNv38/87eC
         lB+ITMbyBYmBuupoEKppIyNcezWWfZsqDIz54H+0Psl3L+OGm5KbZLfLpRrNxBj9IgdY
         MOwGYtPbuT9wBz9E3iJl67ufMRzeWfRE3WCyRHXXndMipQNphpcuv8ip34fMD46Cw+i2
         aEu4m+FcrjFbrnUEjm+8VuHonMRs1JRZfh5PVolg/zh/IAyJrIT9wDUYXfU6C578Q3gJ
         fmoiimzEow/g7wz/tVP5OLh4ZTTbz6PGhRfq/drTYD0a2X+hxLurRH+WTSlm8BeYUsj+
         taKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813437; x=1759418237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pg0HJx9UF6cc43KSohy1sFUTcyD1/BLQvc4mTLXMxcE=;
        b=PtD1a2Vh7uW89JZrYPEhP0Uqps9PXPlDRWX3htQriKaJDexkm4By9aqanTDLzGMh6j
         FBwXy9Z9bgeUnIxtFMrdDwoOMRH+RXK9HT0WLRr74Ra8FJzSIrLqD74KoGY2Awb3HuAd
         SgZtfViDPxGPVRO1v+SHhabPF8Wi9qcbqdWCZHmD0v4DPwhVwZm/p86eULq6uBJdgqbY
         AmyS8dDuMo/pVw7cZTR5RXOhocgJqv2w48Io38SjneLrQf6hZx3Hh7z+JdqEjQ09S0fp
         1LSU8uJ/x17cyeJl8/RYEDP79neSx4ieYQAukOXp4bFtz2PBAZDNWGKR1kKgUsxAX3lP
         Crqw==
X-Forwarded-Encrypted: i=1; AJvYcCVFiC7Ma5opgX8VdDEbsE3Sfea5MD3iD6LUZAClMdUi8l5IuPNMV0/96GplzgMCyOqdgDBmtP2vicA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2lZ2/CbigCWGZgRDXb8iPrsI/LyrCa+In/ishnq66719GPTPW
	7EewaYOjgHf/Y8d3/gAvthyKUHEIBpWCdSfiu81g3neLL5MTjCjMAIfV
X-Gm-Gg: ASbGncsohUnh8iUr2B+ka0IHiIxJkRhn2Ron2KyHGwrDdBEQl19ueLZ236rEBn/r/d8
	Tm4WbINYAaM80JuftZZhlXX3Q+Y/bCA5f88/fOf9MZI7p5T2vm9SkVwOTMEssNTcCs3gTDFDDAG
	Y+QSqhzef5WKdalVym6fbumTSUEHdtxi3GyXB6acf7LWoYiwD5r9CSTki3SSuD2PmAZ6ggJzlZN
	XBs/y/rKLHZ5WzuAaQozYPanxi0IQOOgzVUTG4RDvySnBQC/BMQGge/BM+icwb2b0LtghzqFAEw
	ouGok545irYxuQI8VoLdz0oNkIsaKbCViYqso7C0/ymy4q/DkY/q8nXpCIyr8NSrQ0LwJWrQho/
	oM6qe+qOwCol9dHiIuigcox+O
X-Google-Smtp-Source: AGHT+IE0utS+jecb/LkEfFuQRpDoO+zVGhi+NkEAr1FLNmKoWaS6Wce1hEkVKYRO90wTwE672u05Dg==
X-Received: by 2002:a05:6512:3e11:b0:57a:de0d:d9ce with SMTP id 2adb3069b0e04-582d2f273a4mr1035976e87.44.1758813436654;
        Thu, 25 Sep 2025 08:17:16 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:16 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
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
	Linus Walleij <linus.walleij@linaro.org>,
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
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 03/22] clk: tegra30: add CSI pad clock gates
Date: Thu, 25 Sep 2025 18:16:29 +0300
Message-ID: <20250925151648.79510-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925151648.79510-1-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tegra30 has CSI pad bits in both PLLD and PLLD2 clocks that are required
for the correct work of the CSI block. Add CSI pad A and pad B clock gates
with PLLD/PLLD2 parents, respectively. Add a plld2 spinlock, like one plld
uses, to prevent simultaneous access since both the PLLDx and CSIx_PAD
clocks use the same registers

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/clk/tegra/clk-tegra30.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index ca738bc64615..61fe527ee6c1 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -154,6 +154,7 @@ static unsigned long input_freq;
 
 static DEFINE_SPINLOCK(cml_lock);
 static DEFINE_SPINLOCK(pll_d_lock);
+static DEFINE_SPINLOCK(pll_d2_lock);
 
 #define TEGRA_INIT_DATA_MUX(_name, _parents, _offset,	\
 			    _clk_num, _gate_flags, _clk_id)	\
@@ -859,7 +860,7 @@ static void __init tegra30_pll_init(void)
 
 	/* PLLD2 */
 	clk = tegra_clk_register_pll("pll_d2", "pll_ref", clk_base, pmc_base, 0,
-			    &pll_d2_params, NULL);
+			    &pll_d2_params, &pll_d2_lock);
 	clks[TEGRA30_CLK_PLL_D2] = clk;
 
 	/* PLLD2_OUT0 */
@@ -1008,6 +1009,16 @@ static void __init tegra30_periph_clk_init(void)
 				    0, 48, periph_clk_enb_refcnt);
 	clks[TEGRA30_CLK_DSIA] = clk;
 
+	/* csia_pad */
+	clk = clk_register_gate(NULL, "csia_pad", "pll_d", CLK_SET_RATE_PARENT,
+				clk_base + PLLD_BASE, 26, 0, &pll_d_lock);
+	clks[TEGRA30_CLK_CSIA_PAD] = clk;
+
+	/* csib_pad */
+	clk = clk_register_gate(NULL, "csib_pad", "pll_d2", CLK_SET_RATE_PARENT,
+				clk_base + PLLD2_BASE, 26, 0, &pll_d2_lock);
+	clks[TEGRA30_CLK_CSIB_PAD] = clk;
+
 	/* csus */
 	clk = tegra_clk_register_periph_gate("csus", "vi_sensor", 0,
 					     clk_base, 0, TEGRA30_CLK_CSUS,
-- 
2.48.1

