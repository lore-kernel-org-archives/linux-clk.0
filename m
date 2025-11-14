Received: from mo-csw-fb.securemx.jp (mo-csw-fb1120.securemx.jp [210.130.202.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989D527A904;
	Fri, 14 Nov 2025 08:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.130.202.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763108319; cv=none; b=VVvv8FDjek3oW6gq7xKNE1F/CtnCIGIYT/idJ7BimqyQIaYtwiwzAI1kTglMBHmMzstFStDhJ+gHxnkw+4DoSjr8RASGY/1L3BRVQlM7MbER8CCl9lQFDP+trsyfwO876d9phjjBxYTvEBXmkM/m6AwR/FQlQyuwAQ/RLlR/PZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763108319; c=relaxed/simple;
	bh=z5BT7iIb8HXMJQST0R7kR132Jpyv/xSzSV01+ipM/E8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NTTs88cTinErBBsjEOVFTLXksRTCfgnF70960ZJ8pE1DIusexVnnVyKoBml083nT+ghW8amSkpR0UBXUxXBLVwmYMRa8d7NqmICzBvLivegM0LgrRDs5h42Y/xgO53YTA4GzyhJqf7XZk1EwRKM3y5OSLoG8GCFvcOZoTFdM+z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=hMveXRFo; arc=none smtp.client-ip=210.130.202.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="hMveXRFo"
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1120) id 5AE6xkQS090837; Fri, 14 Nov 2025 15:59:47 +0900
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:Cc
	:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding;i=yuji2.ishikawa@toshiba.co.jp;s=key1.smx;t=
	1763103549;x=1764313149;bh=z5BT7iIb8HXMJQST0R7kR132Jpyv/xSzSV01+ipM/E8=;b=hMv
	eXRFord7LWrKJaWpflg51wHxSXWVf1AjvLAnwU8z8Y2rlNm74zSaTEND5r7rsngOZVYDn2qxPTLtt
	Yuurldmu8pkMUFbyQdiuq65w4LCI2xrEownb+7XLf9NJzQV2RE2okMHEclhkxVf2GVvL753Ilb1uM
	PNk4XHHSKQVrZKSIiu2lrTDKLukTK48+ho3zimRIPtG5II5fl4WWZU3hJq7KOPezmUtfNH3ZOzGk7
	lTDuml6TSOz+yiJetliFe+As+qY1J5oYtuosekezSRISyNz8Y3AUCHdQ8CGh3/6bxmpRnHf76UoY8
	zQXbNhj37NyEG7qQ882TYTQZl0lBawg==;
Received: by mo-csw.securemx.jp (mx-mo-csw1121) id 5AE6x96r3826728; Fri, 14 Nov 2025 15:59:09 +0900
X-Iguazu-Qid: 2rWgP4I4zWg0QagHnu
X-Iguazu-QSIG: v=2; s=0; t=1763103548; q=2rWgP4I4zWg0QagHnu; m=prYwrmW4qxhPFlh8iTyihJo96G3t7nIZABj+fSIVS/M=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4d77KR61f6z1xnZ; Fri, 14 Nov 2025 15:59:07 +0900 (JST)
X-SA-MID: 54822487
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
Subject: [PATCH 2/2] dt-bindings: clock: tmpv770x: Remove definition of number of clocks
Date: Fri, 14 Nov 2025 15:53:58 +0900
X-TSB-HOP2: ON
Message-Id: <20251114065358.854817-3-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114065358.854817-1-yuji2.ishikawa@toshiba.co.jp>
References: <20251114065358.854817-1-yuji2.ishikawa@toshiba.co.jp>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the definitions of number of clocks from bindings because they
prevent adding new clocks. Since the previous patch removed all refereces
within the driver, they can now be deleted.

The same for resets and plls.

Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
---
 include/dt-bindings/clock/toshiba,tmpv770x.h | 3 ---
 include/dt-bindings/reset/toshiba,tmpv770x.h | 1 -
 2 files changed, 4 deletions(-)

diff --git a/include/dt-bindings/clock/toshiba,tmpv770x.h b/include/dt-bindings/clock/toshiba,tmpv770x.h
index 5fce71300..89189c4f6 100644
--- a/include/dt-bindings/clock/toshiba,tmpv770x.h
+++ b/include/dt-bindings/clock/toshiba,tmpv770x.h
@@ -11,7 +11,6 @@
 #define TMPV770X_PLL_PIDDRCPLL		4
 #define TMPV770X_PLL_PIVOIFPLL		5
 #define TMPV770X_PLL_PIIMGERPLL		6
-#define TMPV770X_NR_PLL		7
 
 /* Clocks */
 #define TMPV770X_CLK_PIPLL1_DIV1	0
@@ -141,7 +140,6 @@
 #define TMPV770X_CLK_PIREFCLK		124
 #define TMPV770X_CLK_SBUS		125
 #define TMPV770X_CLK_BUSLCK		126
-#define TMPV770X_NR_CLK			127
 
 /* Reset */
 #define TMPV770X_RESET_PIETHER_2P5M	0
@@ -176,6 +174,5 @@
 #define TMPV770X_RESET_PIPCMIF		29
 #define TMPV770X_RESET_PICKMON		30
 #define TMPV770X_RESET_SBUSCLK		31
-#define TMPV770X_NR_RESET		32
 
 #endif /*_DT_BINDINGS_CLOCK_TOSHIBA_TMPV770X_H_ */
diff --git a/include/dt-bindings/reset/toshiba,tmpv770x.h b/include/dt-bindings/reset/toshiba,tmpv770x.h
index c1007acb1..bedfe253f 100644
--- a/include/dt-bindings/reset/toshiba,tmpv770x.h
+++ b/include/dt-bindings/reset/toshiba,tmpv770x.h
@@ -36,6 +36,5 @@
 #define TMPV770X_RESET_PIPCMIF		29
 #define TMPV770X_RESET_PICKMON		30
 #define TMPV770X_RESET_SBUSCLK		31
-#define TMPV770X_NR_RESET		32
 
 #endif /*_DT_BINDINGS_RESET_TOSHIBA_TMPV770X_H_ */
-- 
2.34.1


