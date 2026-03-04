Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6713337C92C
	for <linux-clk@vger.kernel.org>; Wed,  4 Mar 2026 18:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772647900; cv=none; b=cXxe4NMopM5SkwNzXCH5/14BpuL/VZJvwuSgI48z36dZS3bV8myQHDbneB0O7MMGbbOOQP4xTLzxh8vrYU/J1jiRJah6vU+Y1tapupdLw8bICOg+Rp2jG9ZjvxLzh8Use3C70nYZUXOpI8loP0AVA76z+LW15j3Iycvj6cAcfBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772647900; c=relaxed/simple;
	bh=JOs6Hru9e1pyzmoSC+Fu2HzEj09qTOnEBQH8YB/TK0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CUzsuqt1YdWviVUkQgMS1iPTwzkad7NaSMCseM62p8qKONTebRz0f4J6xzgb8pwERrYuHOsCKDOExjygIiAPGPWfvZhi7x5d+v3YHeRMkCQSLoYCHNJq3ko8kajQNitWSlrOSGf3BtGBlWkxh80wyV1fpuFGvThtjxz9MirpgyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NiMwoFpe; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NiMwoFpe"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8272c559597so7158835b3a.1
        for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 10:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772647898; x=1773252698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IbrHSPPxep6X+vivH1+ezOTNFT57/EKHgyG9LJdna2A=;
        b=NiMwoFpevUQPMXIoE/7+Sju6sxscBm6LnsUnnLKdmFu9D1/4UKXiiX5T0z89/iI62z
         iLBnUmc9G9etO3w+S7UKLue9an84ToOWz6nyODK7K43u6s9QPjC6oroGUSCrnfbx1ri4
         /J+QFdnVPok7HMYR3zJt0cyHXfQvW3k7N1ppdJsE5+gZGddMbpo1CiJd1JusKj4pUFQ3
         gHxbaXN6xr3vZRO5g7suXOgAf40j+WytciyMpOnBlKVoTCL4i7hHt0NH7okp3TscTYon
         XXmI0QOTaZgxZU0HaSz4wxriKinx7h4Huk4fhJX1k4JM09IY8GVituS6TXJdDFx46Ykd
         N/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772647898; x=1773252698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IbrHSPPxep6X+vivH1+ezOTNFT57/EKHgyG9LJdna2A=;
        b=eSVIPjdaNWyDNtUZ2m+F0Yq0YwcaMq3BldvTFm5mWUkj7VWCeXJTZPzL3EELTSKYX8
         7xNGOppJuN2B3bnnyzKXTkRBFhFJugmOvLiFkAGLADu1fbtjBCWV3U25cLoRkhszkJAb
         zYanY45mS+xlqjnkZQcWbFHfhlvnp2vzFKvWf467uCHPwzpbZ/+SBAcqrO1nyuq6w3pz
         6YdIFtyTwjW7BU9gdH8s9HZOQ1IInV9H3oYhZ354nH+UgBDsDwVsMtAFy12TZLZJvPGf
         vmrxBSsWxyIQCUGxpMoWyMWl9YQPJXjKqn9Uc77FG3jC6O5pHZsMniK9ia2t/szpTZdL
         VNpA==
X-Gm-Message-State: AOJu0YzoI8BnywVBUOMidwY0jDwulrsPztKllDKEoLv6uLjjMFLfq+R9
	UrhOKa/eb/pXRgQlF1AEhXf2fSiwwyFgYkopPVMIvSjhjIs2I9h7Hqm/I4+dHl4R
X-Gm-Gg: ATEYQzx79dM+HXqdKNSg1BcseO69BFnAPxTOALfG4FM9VieAeSo96zQpAzJXWBQ73U9
	epXndSazHHBxLa3g4ewQm2tWYAlfmKOPG/qp3uIIAxhcnYGJlI4MsSE0p2aShmGM0HNQZpDFtbw
	hk2H/RdmtWDcoIW7haA2tPx+nuceNTGkOh7utaV8DoFOA8Uckg+qoj+FRr3llRBOybI1k5FaCz/
	fW7MAY5YocDvEoZplW3jF/cV+ZVwV0ouXR8F08G0rZUqfdg5c6B3Y+ZU4XD+/OkzSrx9uuTzQRz
	6+swAiyNyIFivM6UStJDZQB2DvW0Xgi3+MrKdFHWNKIrRECjFG9K+4x8VoQ1IAuWM7ZDNFiZHvZ
	UaZ25ExphzZE+lDomm9fbWUoUVg/30L0Nd5bLu7E8XYGB5Yxk+kj8pJ8CZrtNzuWw5XK/I1+pvA
	8yfxXgH9KKEXdT7Jwtk37dA9Sog8g25o47CNKV4eczqlW9q68kU4jlICTwfDh0MUJU0hP6rX7wa
	qdjsCuRx+VwxG3eIg==
X-Received: by 2002:a05:6a00:130f:b0:81e:2bca:d133 with SMTP id d2e1a72fcca58-82972b49983mr2518364b3a.24.1772647897597;
        Wed, 04 Mar 2026 10:11:37 -0800 (PST)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829713825efsm2503835b3a.51.2026.03.04.10.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 10:11:32 -0800 (PST)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 1/3] clk: mediatek: clk-mtk: Add cpumux support to common probe/remove helpers
Date: Thu,  5 Mar 2026 03:10:22 +0900
Message-ID: <20260304181024.738391-2-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260304181024.738391-1-akkun11.open@gmail.com>
References: <20260304181024.738391-1-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend __mtk_clk_simple_probe() and __mtk_clk_simple_remove() to support
cpumux clocks. This reduces boilerplate code in drivers for SoCs that
require cpumux registration, such as mt6795-infracfg.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mtk.c | 18 +++++++++++++++++-
 drivers/clk/mediatek/clk-mtk.h |  2 ++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 3dfdd3a422f8..8148c21e6099 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -19,6 +19,7 @@
 #include "clk-mtk.h"
 #include "clk-gate.h"
 #include "clk-mux.h"
+#include "clk-cpumux.h"
 
 const struct mtk_gate_regs cg_regs_dummy = { 0, 0, 0 };
 EXPORT_SYMBOL_GPL(cg_regs_dummy);
@@ -513,6 +514,7 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	num_clks = mcd->num_clks + mcd->num_composite_clks;
 	num_clks += mcd->num_fixed_clks + mcd->num_factor_clks;
 	num_clks += mcd->num_mux_clks + mcd->num_divider_clks;
+	num_clks += mcd->num_cpumuxes;
 
 	clk_data = mtk_alloc_clk_data(num_clks);
 	if (!clk_data) {
@@ -542,6 +544,13 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 			goto unregister_factors;
 	}
 
+	if (mcd->cpumuxes) {
+		r = mtk_clk_register_cpumuxes(&pdev->dev, node, mcd->cpumuxes,
+					      mcd->num_cpumuxes, clk_data);
+		if (r)
+			goto unregister_muxes;
+	}
+
 	if (mcd->composite_clks) {
 		/* We don't check composite_lock because it's optional */
 		r = mtk_clk_register_composites(&pdev->dev,
@@ -549,7 +558,7 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 						mcd->num_composite_clks,
 						base, mcd->clk_lock, clk_data);
 		if (r)
-			goto unregister_muxes;
+			goto unregister_cpumuxes;
 	}
 
 	if (mcd->divider_clks) {
@@ -605,6 +614,10 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	if (mcd->composite_clks)
 		mtk_clk_unregister_composites(mcd->composite_clks,
 					      mcd->num_composite_clks, clk_data);
+unregister_cpumuxes:
+	if (mcd->cpumuxes)
+		mtk_clk_unregister_cpumuxes(mcd->cpumuxes,
+					    mcd->num_cpumuxes, clk_data);
 unregister_muxes:
 	if (mcd->mux_clks)
 		mtk_clk_unregister_muxes(mcd->mux_clks,
@@ -643,6 +656,9 @@ static void __mtk_clk_simple_remove(struct platform_device *pdev,
 	if (mcd->composite_clks)
 		mtk_clk_unregister_composites(mcd->composite_clks,
 					      mcd->num_composite_clks, clk_data);
+	if (mcd->cpumuxes)
+		mtk_clk_unregister_cpumuxes(mcd->cpumuxes,
+					    mcd->num_cpumuxes, clk_data);
 	if (mcd->mux_clks)
 		mtk_clk_unregister_muxes(mcd->mux_clks,
 					 mcd->num_mux_clks, clk_data);
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 5417b9264e6d..02fab4b166f2 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -252,6 +252,8 @@ struct mtk_clk_desc {
 	size_t num_factor_clks;
 	const struct mtk_mux *mux_clks;
 	size_t num_mux_clks;
+	const struct mtk_composite *cpumuxes;
+	size_t num_cpumuxes;
 	const struct mtk_clk_rst_desc *rst_desc;
 	spinlock_t *clk_lock;
 	bool shared_io;
-- 
2.52.0

