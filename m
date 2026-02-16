Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C3727A92D;
	Mon, 16 Feb 2026 23:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771285106; cv=none; b=NrZN/TjO71abOl4UJp58UMX6sSi19dv5/k+1FCVTwS/QvuNOqD35kEttKeonJ4Z9AM0E1Tn1YoN1b+rSiivapaPsqK6gJu0gLECjH9ygpnV4XCsULBfPNGIxVCuTdnvAEKABef2beAruGQTPSUQLwjBLF9w7x2OChmPqfck1hcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771285106; c=relaxed/simple;
	bh=kCuopfLu7Oi0EzM4wixJtyFkRBVwm7HLABObJtpowC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=brdDRQDQhvtnV8u0kOA/iyKG/6q6pH9c+z5+t1whI/Y2RXQz+ZEHD41WI9ZRh1Fp8augRFh1zbbAlfgmOkyfCzcOv2YJ8Pggjdptf0DnpN+ig6HRUc6kQTZ8XL3EaN7Tfc7h8nJa2MX2IWzgknIspJjqAuGoBSZEo/zFsCtWe1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=Dk+62Vat; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="Dk+62Vat"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1771285102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NWnN6+c5xsBb3tOefcLzO1lu0M8RbBtdH+rnfm5Rppk=;
	b=Dk+62VatWm82DrmIg6ZI12X5VxYgb087vuPYvLrZSrcT5plDzZLXdtJJQi20LKPASPxzqi
	WdwmO0UWXPCzX7G8v08Lr05w/ha9vlA9lVAlDCeTyZDLSYMctyL5GMFO18ahJat6WjOAjp
	UkwoXxjSWcx/hjsjisTCTHj4vNGZFUMAPqZ4sRtjmHrWeRWmshmtaeCVYgrBOVlscAKfKJ
	sAs0IS1584FoeWW9rkCgrbUs6lmkmfL3AcshcMGSh6y+PsLtBc9iwN1v27lE10QzWkSoB1
	kX+R11gbHb2fJyjtelxChxRmMDxcdqEBTtm5C3bzpHJIm+QHXrjauBuQoT0lUA==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adam Skladowski <a39.skl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Val Packett <val@packett.cool>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] dt-bindings: clock: qcom,sm6115-dispcc: Define MDSS resets
Date: Mon, 16 Feb 2026 20:25:19 -0300
Message-ID: <20260216233600.13098-3-val@packett.cool>
In-Reply-To: <20260216233600.13098-2-val@packett.cool>
References: <20260216233600.13098-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add the missing defines for MDSS resets.
While here, align comment style with other SoCs.

Fixes: 38557c6fc077 ("dt-bindings: clock: add QCOM SM6115 display clock bindings")
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

