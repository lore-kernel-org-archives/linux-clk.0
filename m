Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3195C2F12AF
	for <linux-clk@vger.kernel.org>; Tue,  3 Mar 2026 03:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772509762; cv=none; b=r6pZN5w97OSQbu8L2swBGOo9LJJhDBBW2FTJD5zH/29xUh3i/Vnn9dE1X/tUoonDKDql6dmGwi2XSz34vUhtA8GFNzvYI+61Kv5iUJYrcv2SLdmA/0hKTJyk3/Nsmf9BPqhKqmfjRlQ0xcQItIGwPpZqnRPH+TT6R4SVzvY/8s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772509762; c=relaxed/simple;
	bh=PihsNO0K+58AmyOvT+8NT63epKHoVK+kCgGzUQhRDgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fxKsF3KuiWhBGpavYh4IWKoBHPsl8vUl5ESd0cl5sRHm1ZbsKFJOLJuqHvGWa+zWt0Gn5zsvIQSvd2/WRiC9sgqMBZs04e3gG6VcisBCmxWcTMk7zMW/+S3o1MTT5/YR/+24U5B1YyC7pyvjvGky2OR6rFU9AXx3Kaf4PlQ4TcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=E7Kmu9yX; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="E7Kmu9yX"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1772509757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jsfisfPitjxmyl+3oICy+Pnnbsp+I1m60qBMNOzfFBM=;
	b=E7Kmu9yXP8JO+NWJaYd/kWZnUOVdnJxlWLlP8p0dYkWghZucboiCEzUh6hc/UzHdrx2HuS
	XAObRZe3Mh7ihE4SNo0gQgX++4+GgfIoq6OcHfeTXmf3LeglYJAiBH7rhCGVw+ZnMvrBsV
	HjvUEF640qRlbTsSf1e8XpVZxnO7fcwEOX+V0bhu6HvsCfIQqwQ70+McsDqdDKscZt68Lg
	8MS9WpYFu38NeOmIXgpXE+arWWJol0x9miyD+glk8xZb/R2sr3oyiteIgz+U4EqztOF17i
	gQsWIO3fWPECs8CzdBCtwhERTdOmKYxUPOsLLUMpgmiwsccetsQnM6ks0WXigw==
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
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/6] dt-bindings: clock: qcom,sm6115-dispcc: Define MDSS resets
Date: Tue,  3 Mar 2026 00:41:20 -0300
Message-ID: <20260303034847.13870-2-val@packett.cool>
In-Reply-To: <20260303034847.13870-1-val@packett.cool>
References: <20260303034847.13870-1-val@packett.cool>
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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Val Packett <val@packett.cool>
---
 include/dt-bindings/clock/qcom,sm6115-dispcc.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/dt-bindings/clock/qcom,sm6115-dispcc.h b/include/dt-bindings/clock/qcom,sm6115-dispcc.h
index d1a6c45b5029..ab8d312ade37 100644
--- a/include/dt-bindings/clock/qcom,sm6115-dispcc.h
+++ b/include/dt-bindings/clock/qcom,sm6115-dispcc.h
@@ -6,7 +6,7 @@
 #ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_SM6115_H
 #define _DT_BINDINGS_CLK_QCOM_DISP_CC_SM6115_H
 
-/* DISP_CC clocks */
+/* Clocks */
 #define DISP_CC_PLL0			0
 #define DISP_CC_PLL0_OUT_MAIN		1
 #define DISP_CC_MDSS_AHB_CLK		2
@@ -30,7 +30,10 @@
 #define DISP_CC_SLEEP_CLK		20
 #define DISP_CC_SLEEP_CLK_SRC		21
 
-/* DISP_CC GDSCR */
+/* Resets */
+#define DISP_CC_MDSS_CORE_BCR			0
+
+/* GDSCs */
 #define MDSS_GDSC			0
 
 #endif
-- 
2.52.0

