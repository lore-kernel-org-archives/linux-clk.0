Received: from mo-csw-fb.securemx.jp (mo-csw-fb1121.securemx.jp [210.130.202.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA83A2FB61D;
	Fri, 14 Nov 2025 08:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.130.202.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763108969; cv=none; b=Zm2OjWiyECmamxPX7KBZT9Yi0UKx0p61XlQ6q6kjE3tvQ3VvviUcvP0aCIajqaWcJ9gaNabjwNFXou4lzDrY6ToSniS/LaA4+3fQ0hUPXDDe6y+jQd4/XGQro6D7T46CnCvX8pg6krHJCZEbEA2UM/f/hqfzkQNipO0f9SqivsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763108969; c=relaxed/simple;
	bh=RkjkL1vTmRSsskEuv1JjpCnNXYvSjrn8TEee9cXREwQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UhyhPGjBpbdTHQI/vqtlJhRrXaInaGNfhoS2cr5NyFm4cIfACK4OA0Rcc8i2GOk3kjDX4B678CQWTm8AZ4M76Azra5WBmki/s6oaN6CtkPxMPSs8Ihpe3kr7MiK/21Eg4rqkM73jFgPxOdQvPGJNmvb2fXCudJXzAa7yxy/Al+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=C2YF23G/; arc=none smtp.client-ip=210.130.202.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="C2YF23G/"
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1121) id 5AE7Ap924013192; Fri, 14 Nov 2025 16:10:52 +0900
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:Cc
	:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding;i=yuji2.ishikawa@toshiba.co.jp;s=key1.smx;t=
	1763104223;x=1764313823;bh=RkjkL1vTmRSsskEuv1JjpCnNXYvSjrn8TEee9cXREwQ=;b=C2Y
	F23G/zKVaBI245F3Gxq6OO8TBYTg8jnJvgBxyabu3n3FyTNJbr4xxXn1RFnl0InvsMgTeOgVlh7kO
	rZah/1q6tcBT5BK0RlEabXpWoV2QxPv++NMVsgtDzUCyCYia8NvlWfL7zIER8ZSugJUD9K6E1Mm7g
	FKhDj3p+8jf/RgvCm2TKsmwhT7VB9nkiqbVDGUq5LPWl7qBZ3X2QIS06aUmN7b+d9ixYBa4kB7Abh
	TfuGPG4yY65vmuqGvh0StRKw9W7rz5y1mNwk3N6SEPrt4RdQZ7rx1SzmI+erny6NT/0ZTKIgOE+dX
	5K1GkuSRr/sG+Q7xDFkSLO6/QzxfuNQ==;
Received: by mo-csw.securemx.jp (mx-mo-csw1122) id 5AE7ANDZ1120230; Fri, 14 Nov 2025 16:10:23 +0900
X-Iguazu-Qid: 2rWgZy3EWuTvE7J9fQ
X-Iguazu-QSIG: v=2; s=0; t=1763104222; q=2rWgZy3EWuTvE7J9fQ; m=BS9Rx66ykcVuZRBAYmLYJa6t6LsP1Yi8jLCmfbPcZAg=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4d77ZQ4P8hz4vyk; Fri, 14 Nov 2025 16:10:22 +0900 (JST)
X-SA-MID: 54823657
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Subject: [PATCH v3 1/2] dt-bindings: clock: tmpv770x: Add VIIF clocks
Date: Fri, 14 Nov 2025 16:05:11 +0900
X-TSB-HOP2: ON
Message-Id: <20251114070512.855008-2-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114070512.855008-1-yuji2.ishikawa@toshiba.co.jp>
References: <20251114070512.855008-1-yuji2.ishikawa@toshiba.co.jp>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add clock and reset identifiers for the Video Input Interface.
These identifiers support two instances: VIIF0 and VIIF1.

Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
---
Changelog v2:
- Do not modify existing identifiers to avoid breaking ABI.
  Keep existing identfiers for VIIF0.
  Introduce new idenfifiers for VIIF1, following the same naming conventions.

Changelog v3:
- Only add new clock/reset identifiers.
- Remove TMPV770X_NR_CLK and others in a preceding patch
---
 include/dt-bindings/clock/toshiba,tmpv770x.h | 11 +++++++++++
 include/dt-bindings/reset/toshiba,tmpv770x.h |  8 ++++++++
 2 files changed, 19 insertions(+)

diff --git a/include/dt-bindings/clock/toshiba,tmpv770x.h b/include/dt-bindings/clock/toshiba,tmpv770x.h
index 89189c4f6..a36c89266 100644
--- a/include/dt-bindings/clock/toshiba,tmpv770x.h
+++ b/include/dt-bindings/clock/toshiba,tmpv770x.h
@@ -140,6 +140,9 @@
 #define TMPV770X_CLK_PIREFCLK		124
 #define TMPV770X_CLK_SBUS		125
 #define TMPV770X_CLK_BUSLCK		126
+#define TMPV770X_CLK_VIIFBS1_L2ISP	127
+#define TMPV770X_CLK_VIIFBS1_L1ISP	128
+#define TMPV770X_CLK_VIIFBS1_PROC	129
 
 /* Reset */
 #define TMPV770X_RESET_PIETHER_2P5M	0
@@ -174,5 +177,13 @@
 #define TMPV770X_RESET_PIPCMIF		29
 #define TMPV770X_RESET_PICKMON		30
 #define TMPV770X_RESET_SBUSCLK		31
+#define TMPV770X_RESET_VIIFBS0		32
+#define TMPV770X_RESET_VIIFBS0_APB	33
+#define TMPV770X_RESET_VIIFBS0_L2ISP	34
+#define TMPV770X_RESET_VIIFBS0_L1ISP	35
+#define TMPV770X_RESET_VIIFBS1		36
+#define TMPV770X_RESET_VIIFBS1_APB	37
+#define TMPV770X_RESET_VIIFBS1_L2ISP	38
+#define TMPV770X_RESET_VIIFBS1_L1ISP	39
 
 #endif /*_DT_BINDINGS_CLOCK_TOSHIBA_TMPV770X_H_ */
diff --git a/include/dt-bindings/reset/toshiba,tmpv770x.h b/include/dt-bindings/reset/toshiba,tmpv770x.h
index bedfe253f..9452bef31 100644
--- a/include/dt-bindings/reset/toshiba,tmpv770x.h
+++ b/include/dt-bindings/reset/toshiba,tmpv770x.h
@@ -36,5 +36,13 @@
 #define TMPV770X_RESET_PIPCMIF		29
 #define TMPV770X_RESET_PICKMON		30
 #define TMPV770X_RESET_SBUSCLK		31
+#define TMPV770X_RESET_VIIFBS0		32
+#define TMPV770X_RESET_VIIFBS0_APB	33
+#define TMPV770X_RESET_VIIFBS0_L2ISP	34
+#define TMPV770X_RESET_VIIFBS0_L1ISP	35
+#define TMPV770X_RESET_VIIFBS1		36
+#define TMPV770X_RESET_VIIFBS1_APB	37
+#define TMPV770X_RESET_VIIFBS1_L2ISP	38
+#define TMPV770X_RESET_VIIFBS1_L1ISP	39
 
 #endif /*_DT_BINDINGS_RESET_TOSHIBA_TMPV770X_H_ */
-- 
2.34.1


