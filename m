Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE892FC887
	for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 14:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756132034; cv=none; b=c9ifPumroMInPJCRu0pkk7rMXyS9kl1Rld3aW6zZVqN9S1E6wfCy0UO6yaYWt0ipl3JzMqE5h4v1QLNFt/b7AVz596tOS57VSXS4Q9WfEW4P1nyMCf1pvsHP6JmCSQ+fQl1Wi5ZKCtTlnXD++r1D5Hq/9G6cfZMfHkEdsTEEjw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756132034; c=relaxed/simple;
	bh=5iKLGNRbAiiV7znNVkmV2nYu93DQzEVzWcxt59v2OQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EASWhSBhsPuaEsJNC1EVr6gyVJlwICpde4pw+knrjUe6IncjkdyIej9mm3JzYtU2FN6X3L6XUAi5DoE0qwLCJHbrQPp/Ws/eBlfHEW36glQBD7tQOn1x1sPXPMBWWlefEElQjiQ/K2Uybn6xaw7th/CHaJX3YIXqb1Q1kx3F70U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=CGbbosqL; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CGbbosqL"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45b5c12dd87so14190345e9.2
        for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 07:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1756132030; x=1756736830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q2GKlTQ+1w74j9oubIC+GWZcqnBFxLSwzSHXC6Ex1dU=;
        b=CGbbosqLriNzDvMfcmkgC8Kxg1Kmgh/PP6PXQ/k9+zGC6CKHChKVyiJWFmJ8XjegOx
         kljCnu1jLtlRrSNWjWtDJM97pTdTVRmpPaSE7PHZQv5xjmG4c7CBF9FQP3ERy7hn1KmM
         azcI8ZwzmtubGMdLZpFD0/hUsQ4PcR5AISGfzRNy8UWIKdqrSTOvNQVCan8jzBavq2FO
         BG+yC9K3ga39D/r+V6sS1bpudKcBeUF2LN8ktamkOst31U1yWETuWxgEDXVsB9RoJrI1
         rgtnQlggheNbaAjWTz4+2zf6UITQ8Oua6xE3FbpsF7YFbAkfSfKmaBD5sTxJDLgTqNH/
         xj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756132030; x=1756736830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q2GKlTQ+1w74j9oubIC+GWZcqnBFxLSwzSHXC6Ex1dU=;
        b=VSQXW0i3iUNFSTmUrDMhfhJhkC0ZLDoW2sXQ5rFHjHWrgQiqNdWO26i5nnNNmKg+qz
         WQM/2Nrr0XeMdqNEbANLsEfLJhVS/85V0zybEyS6psRetkWsGY/79C3vyTCHgk/ekTlS
         C4veIwz0DDYSwPWqkaQ3rW6A2AJAngRWQjZv2O0nteK2VI50aQt3R5jRCYqd52WeoCpb
         KIgGaxvxUVRiSrJKcxrcEItIqgPDCq2MvrotYtHn6EkiO90iTymYaf+R87wmavsTglmj
         1yYdYoX8mzUYgvxnEdr5JHLhrIzDYRo/2SpEy7eBYNQ7Na/IIeqMCZXa6Q/UXbWg0gjW
         yqLA==
X-Forwarded-Encrypted: i=1; AJvYcCVkIpDWiCLzMy8SiecHH1Z06tl+onroSCkAlwkbA+0ehlLX93NWvXPUxTrB3rhM9Iuu7aJhK2v+RJE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzOgwaV8wj13xMk6wuBFkX8ukt+K6wNpCHJcONOXzh1dyY2P+F
	JZmm2c4o2dD0dnVOqhLjnPSeHjVXsGI1vIyNu9ej08C4BjlAGe9GLx7cwK8o2AosFyk=
X-Gm-Gg: ASbGncuVbmljF+Y0BeR2Odtc0LMjTldL2+BFYylCmxXyvkgxnF7Q6Ybi6EvvL5LL7xP
	CcOasBLB9mgjl0tlC3QW+pfrF/tBLDKki1LxRLnDqIt7PVvSMlkcxEDv4hMNr5ofLdrEnCxxrvy
	dsB1M0sVcGh2I2brl7wzX/yHdldmwfA6pv1zb91uj4E2fkSzM+OvYCAyLXeWqNYcOad+jPMNN20
	lRVI5U+svaFj16cCECzXUgcruOkY9ZbxHAYs8xthMh7eA9zHDJZEFc0wY7Quh7LJpvn/II2YEBv
	cSi1XuidduK+vnmWOkkHj8Z9knccMm8y0syVk9tvO0sMWvttOaoyIweEEHcER08o7TH6x++JvAE
	dL4pW44lnh7Yiy9T3ZYM06/cRaUn9LOMtyVoC
X-Google-Smtp-Source: AGHT+IEPylErx21mcn6dCJV2kIoCD0AjzLCCsQU2klZrox1l+K+hy+rzX244+vSFz6N2S3mmScUSPg==
X-Received: by 2002:a05:600c:1c20:b0:458:c059:7d9c with SMTP id 5b1f17b1804b1-45b5d48ea24mr53620055e9.6.1756132029678;
        Mon, 25 Aug 2025 07:27:09 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:b261:baab:ed3d:3cb6])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3c70e4b9e1fsm12634462f8f.14.2025.08.25.07.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:27:09 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 25 Aug 2025 16:26:30 +0200
Subject: [PATCH v2 05/12] clk: amlogic: move PCLK definition to clkc-utils
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-meson-clk-cleanup-24-v2-5-0f402f01e117@baylibre.com>
References: <20250825-meson-clk-cleanup-24-v2-0-0f402f01e117@baylibre.com>
In-Reply-To: <20250825-meson-clk-cleanup-24-v2-0-0f402f01e117@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2901; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=5iKLGNRbAiiV7znNVkmV2nYu93DQzEVzWcxt59v2OQ4=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBorHKy/cxvrqriA5RdgyQ8kngzsTGP4zIGETSvr
 bPIwwN/D/KJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaKxysgAKCRDm/A8cN/La
 hU6YD/9847LKHLtfPFP+98FtM+A/KPHuOXabho5DnlqQ4CTQm7TeTEECumy3BR3ViDcUWqmul6J
 mOcnAQ4VD/PQx47DoisFdLoyRgVYGi41vm/px3GlkNoiAoMuIbOQ1S7mK7b6Yo3bd6TARrh1yxI
 b2bXFz9x0w3hWAGTTBsDXfCyBWlUdRvSRosLINDT4bw/hFcnRljMaFx0C+8oFUMrGeKc/tblNsW
 evuqJI1g7805n992YNyaRg5OxHvkNzgwese6m7LyB+o/q/DBxPLzJuXypikMS8Ua0zCnPMMP+eO
 n5tt6cqV5DhMhAVE0bLvTxxvCRmGJZFGpe4wXSUCxZWiY08A4hLI5PVUPlnvM6l+lUOmtXU8uL1
 lVd2y0PMtirwjQ7nyoy+FY5p8EeTpFii3D3a5Mq/tgwGDGIxQUE2C0FY85NTUFd6VedNMh1I3UF
 TnAqB5i+e8vakFIzBsJU4UQXdaVIYqfYkNTOKwq8YKN8s1TMTtFoYnH42Z4WqzK6aQ+KvoG74ZT
 PwROguP/QnE9zU1S4moPZwFjiYu7Kizf0I+hI5n5/TluEiSwbiXyLsUBYSbqzbdDvCYEDjqX09N
 zB7S+wUEQ/EO+L1pciA2bfTKsUvEZWtLYGqUyQ7LUn774lybqO7VWYI9hiMuUBE6AHgYh/C/37T
 pqUsLmEEHRMIMPg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

clk-regmap was always meant to stay generic, without any amlogic specifics.
The hope was that it could move out of the amlogic directory one day.
Even if this may actually not become true, it should remain generic.

Move the amlogic peripheral clock definition out of clk-regmap header.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/clk-regmap.h       | 20 --------------------
 drivers/clk/meson/meson-clkc-utils.h | 21 +++++++++++++++++++++
 2 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/meson/clk-regmap.h b/drivers/clk/meson/clk-regmap.h
index f8cac2df5755b0f894570305604485f54c17ea49..8e5c39b023e1334e37d5a9e0594436727f16c4f2 100644
--- a/drivers/clk/meson/clk-regmap.h
+++ b/drivers/clk/meson/clk-regmap.h
@@ -118,24 +118,4 @@ clk_get_regmap_mux_data(struct clk_regmap *clk)
 extern const struct clk_ops clk_regmap_mux_ops;
 extern const struct clk_ops clk_regmap_mux_ro_ops;
 
-#define __MESON_PCLK(_name, _reg, _bit, _ops, _pname)			\
-struct clk_regmap _name = {						\
-	.data = &(struct clk_regmap_gate_data){				\
-		.offset = (_reg),					\
-		.bit_idx = (_bit),					\
-	},								\
-	.hw.init = &(struct clk_init_data) {				\
-		.name = #_name,						\
-		.ops = _ops,						\
-		.parent_hws = (const struct clk_hw *[]) { _pname },	\
-		.num_parents = 1,					\
-		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),	\
-	},								\
-}
-
-#define MESON_PCLK(_name, _reg, _bit, _pname)	\
-	__MESON_PCLK(_name, _reg, _bit, &clk_regmap_gate_ops, _pname)
-
-#define MESON_PCLK_RO(_name, _reg, _bit, _pname)	\
-	__MESON_PCLK(_name, _reg, _bit, &clk_regmap_gate_ro_ops, _pname)
 #endif /* __CLK_REGMAP_H */
diff --git a/drivers/clk/meson/meson-clkc-utils.h b/drivers/clk/meson/meson-clkc-utils.h
index b45f85f630d7190fb6509b088f05f17ca91fa1c8..0c228a6723bb2bddc0b9a4f92515f05850a5613a 100644
--- a/drivers/clk/meson/meson-clkc-utils.h
+++ b/drivers/clk/meson/meson-clkc-utils.h
@@ -27,4 +27,25 @@ struct meson_clkc_data {
 int meson_clkc_syscon_probe(struct platform_device *pdev);
 int meson_clkc_mmio_probe(struct platform_device *pdev);
 
+#define __MESON_PCLK(_name, _reg, _bit, _ops, _pname)			\
+struct clk_regmap _name = {						\
+	.data = &(struct clk_regmap_gate_data) {			\
+		.offset = (_reg),					\
+		.bit_idx = (_bit),					\
+	},								\
+	.hw.init = &(struct clk_init_data) {				\
+		.name = #_name,						\
+		.ops = _ops,						\
+		.parent_hws = (const struct clk_hw *[]) { _pname },	\
+		.num_parents = 1,					\
+		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),	\
+	},								\
+}
+
+#define MESON_PCLK(_name, _reg, _bit, _pname)	\
+	__MESON_PCLK(_name, _reg, _bit, &clk_regmap_gate_ops, _pname)
+
+#define MESON_PCLK_RO(_name, _reg, _bit, _pname)	\
+	__MESON_PCLK(_name, _reg, _bit, &clk_regmap_gate_ro_ops, _pname)
+
 #endif

-- 
2.47.2

