Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1088D2737E3;
	Tue,  3 Mar 2026 03:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772509767; cv=none; b=az9H6zxPrjCmRhb5/o1og8fk3XAHWgIYYRdj3T+yDo9ECmbodrWAvUHLhwnkAfhAGNDYx8ZP1TRKHFZb/M1XRyxuF99J7IyaL/cxzg7jXG37G7YEE0PaBEWKXbj+Q5UnnxNc5c6iFOwre1Gjmgw3j+3DEEUjaVOZ7YtAVar74ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772509767; c=relaxed/simple;
	bh=Oxqq7FBPa89dFrlDTbFy880KjWCv9U30rlHaZMDlhHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HxjIDbbgXfvkSoLKjRlkzACMLYzLf73ubXjk/HKIB4+c9O5FaRd1oWJa/l4Bw7bvGK+TrdrKlAInR+oVAgOMTS+vSB/vCrP+ExfdqpTmx7TVnDDERoMJISy81i3yLyrYnLt/GSy1c06WGexL2mP4A1kCexkCWNzYP97ShgToPEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=QSbOUuvw; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="QSbOUuvw"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1772509764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lLIEZZ1zVezNjOyOb9t3XNEW1b9xk5httPJ3UUt/8x8=;
	b=QSbOUuvwhfBRzEiioxvVw6MlDgxLZ58pFHGOnVEog3+NocB/5LX98VJaVd6NGAETumroCu
	aZ9gZ4xgI/bp0FDi65xYbFtvMcMOeMQtAxvHw6+br+pn1ext+ClDic8tDq9gMm2tU1coNH
	mg0HReyfkaFBoRkbAGg+203QJwnodFyR27cnxRGxBfu64JUvEQFmm6rnfwEKew5d6YhDa/
	v3px/dfr7lzOISHvTLTiy6lOw5iruP3WadRSqNSD0PGtR7NMoC1TzVWMYV+UdvwS9Iehq/
	jQK0Pfg86frBa5wCs2IR8CKHDH9gVGRHpiTiOvw7SuZJQ4TeKhILqlyeeGRy1w==
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
Subject: [PATCH v3 2/6] dt-bindings: clock: qcom,dispcc-sm6125: Define MDSS resets
Date: Tue,  3 Mar 2026 00:41:21 -0300
Message-ID: <20260303034847.13870-3-val@packett.cool>
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

