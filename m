Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C832FF657
	for <linux-clk@vger.kernel.org>; Sat, 28 Feb 2026 20:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772311649; cv=none; b=Oe1t6cbaCx/oM7Pjbos6EsCOZLPF1Jvmd5Y9Sh+bsOndiV36UYoBaocSsICeqn4Mw7UgrvEgZzpPyMbMm58WevjFWUKUVcFzZ8PD7JKSqZ0BGcuiCHq+B5W/EAS5UBo37NrshAcMuvDmCapvznsH9EHH8poNpDHPKCwMKJVUpzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772311649; c=relaxed/simple;
	bh=XUGN+GnOejal3C8oiuZa9mM7ZV/xkp7Jj6M5/UwS7M4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K8AzyaMKo/g6CZHnfpaIBI4tdcrsqi74sqaFypi9EWjPk5MCjXh/kzDbH3KuOAXL1IrDa3UsjhWZj/7SDH89DvocHBRUt3ebPuXr2peM9wlCyHlBMOw/j17Lo8zp/SJqKudvmt5NPkHxhWcpSOvafY0MB7lwzT6vxST2KdIop6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=p0kA8oKH; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="p0kA8oKH"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1772311645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GjzkTi2eTl1DSbdR7B9YM2t9btgxa+XI7HMUFcZbvJ8=;
	b=p0kA8oKHfIvc3UHi9pPildv1J/1dXlYpiJdj1JSxwmhNB+YLHPu69PbJNLW9GCV5LqJKY2
	dUtlV1prEWtrak8ucrD3gDkkoxRfHadowT5U04JPSb84Bckk08upj54jMbRyYcFNdrbdy+
	xoSKBn+hTUAtPUXcekid2x3Y191E0PFiQZjTmAQoVkauSe3j6DLBa/THamEQCbBgk9JEW/
	GtC2nm3ps67XqvbKoJO3NAQ0Hr8Aw0UMzoOOoxkb4hUuHA6YazBSwg8ko96f7Nw9f4R2v2
	DyJ15/Jh90rKqghJrg73spOLpNMqE3olmHZwDpqb2TclVGut2goD8ksXSNV4uw==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Martin Botka <martin.botka@somainline.org>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Val Packett <val@packett.cool>,
	linux-arm-msm@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 2/6] dt-bindings: clock: qcom,dispcc-sm6125: Define MDSS resets
Date: Sat, 28 Feb 2026 17:41:28 -0300
Message-ID: <20260228204638.11705-3-val@packett.cool>
In-Reply-To: <20260228204638.11705-1-val@packett.cool>
References: <20260228204638.11705-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add the missing defines for MDSS resets, which are necessary to reset
the display subsystem in order to avoid issues caused by state left over
from the bootloader.

While here, align comment style with other SoCs.

Fixes: 8397c9c0c26b ("dt-bindings: clock: add QCOM SM6125 display clock bindings")
Signed-off-by: Val Packett <val@packett.cool>
---
 include/dt-bindings/clock/qcom,dispcc-sm6125.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/qcom,dispcc-sm6125.h b/include/dt-bindings/clock/qcom,dispcc-sm6125.h
index 4ff974f4fcc3..f58b85d2c814 100644
--- a/include/dt-bindings/clock/qcom,dispcc-sm6125.h
+++ b/include/dt-bindings/clock/qcom,dispcc-sm6125.h
@@ -6,6 +6,7 @@
 #ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_SM6125_H
 #define _DT_BINDINGS_CLK_QCOM_DISP_CC_SM6125_H
 
+/* Clocks */
 #define DISP_CC_PLL0			0
 #define DISP_CC_MDSS_AHB_CLK		1
 #define DISP_CC_MDSS_AHB_CLK_SRC	2
@@ -35,7 +36,10 @@
 #define DISP_CC_MDSS_VSYNC_CLK_SRC	26
 #define DISP_CC_XO_CLK			27
 
-/* DISP_CC GDSCR */
+/* Resets */
+#define DISP_CC_MDSS_CORE_BCR			0
+
+/* GDSCs */
 #define MDSS_GDSC			0
 
 #endif
-- 
2.52.0

