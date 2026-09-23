Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5D4495030;
	Wed, 23 Sep 2026 11:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162145; cv=none; b=gH3RkXkr+mBm3hUPuajR3cTkWFiPbrgBNyr5GsHeA8qHd276+3fmGhOiI7bxQ9PHoU/u0F0+oZx/sCIZULuM23+rq7QJsaE6qjHCF7SmTPb3E912B/9mYP1oxjyR+YR+KTKXtGCaeM+YatWRoJiK7qqhiLL/NONHUEJgUkzQY6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162145; c=relaxed/simple;
	bh=bqP8YA42hWQqWkIXy1FVgmJ12q2wrxR9OYJQppEs/Uk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LxSipJzUJrNbkUtQWPJRsACn36hjjXzqxrf5Krv3d2++cH+53upfa86wXmzVPZH7vNysVTSPev18r2wRSYmOvRkVV4GVv16odiqxobfltHSbUTJBbWp99vIAJADyq2F+RSTf78MvDJzUeGWCHPTm8rgVmvtC4MCIk+gXBWZkwrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dJjC2anh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dJjC2anh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 66A14C2BCFB;
	Wed, 23 Sep 2026 11:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790162145;
	bh=bqP8YA42hWQqWkIXy1FVgmJ12q2wrxR9OYJQppEs/Uk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dJjC2anhcVyMwIC1G4OLRCia4y+JfJhGhEtcwMWg+VOrv4Phdfk2NFjfoQrNbW4kZ
	 Hk4sg1nIdD6TjrD9OxxY9thkHw1qQDSP01beLgcok52CPSlFszMfNEabZnPTOrwgI8
	 Nibz+zN6sh7w9zoaldqeH87br0btn4o1yrEReajjoaUiPdChSHuFJSqBzcn+ZDTkAR
	 jPk/4mwYZQNoG7zp4T39TfnNxDiktvfesjEIGJU6/0YstgtGVCsHS0lbG4QM4d7GDU
	 lakTau7LiR37ejZHDtYWoRRtArl6OaJL7tnOnFZ+lvgH6uPk8/XMTZL+KBmiFQIH3E
	 TOLbewP/AdtyA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46279C982FA;
	Wed, 23 Sep 2026 11:15:45 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Date: Wed, 23 Sep 2026 19:14:48 +0800
Subject: [PATCH RFC 2/3] dt-bindings: clock: amlogic: Add T7 pre-divider
 clock IDs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-meson_refactor_n-v1-2-3a8ce27121a2@amlogic.com>
References: <20260923-meson_refactor_n-v1-0-3a8ce27121a2@amlogic.com>
In-Reply-To: <20260923-meson_refactor_n-v1-0-3a8ce27121a2@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790162143; l=1524;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=y0MWbUJ0faMiTivhM85sj5J18sYEBszLSGsO+sIOCFA=;
 b=9o8QfE60g+bIqq/2wkTFt/FkpyfPD2otY1SnuQcmVu8S+UxF0kzuuLZ0zwDw0KR6rsycd0FFI
 4FTSu5UE/c3DSAXtZcRUDeqdhFYcaQMTLiR0/hR+AiwKWXztK20mW2G
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
Reply-To: jian.hu@amlogic.com

From: Jian Hu <jian.hu@amlogic.com>

Add clock IDs for the T7 PLL pre-divider clocks. These IDs are
required for the subsequent conversion of the PLL pre-divider
into a standalone divider clock following the PLL framework refactoring.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 include/dt-bindings/clock/amlogic,t7-pll-clkc.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/dt-bindings/clock/amlogic,t7-pll-clkc.h b/include/dt-bindings/clock/amlogic,t7-pll-clkc.h
index e2481f2f1163..69c90bc0be0a 100644
--- a/include/dt-bindings/clock/amlogic,t7-pll-clkc.h
+++ b/include/dt-bindings/clock/amlogic,t7-pll-clkc.h
@@ -9,20 +9,24 @@
 /* GP0 */
 #define CLKID_GP0_PLL_DCO	0
 #define CLKID_GP0_PLL		1
+#define CLKID_GP0_PREDIV	2
 
 /* GP1 */
 #define CLKID_GP1_PLL_DCO	0
 #define CLKID_GP1_PLL		1
+#define CLKID_GP1_PREDIV	2
 
 /* HIFI */
 #define CLKID_HIFI_PLL_DCO	0
 #define CLKID_HIFI_PLL		1
+#define CLKID_HIFI_PREDIV	2
 
 /* PCIE */
 #define CLKID_PCIE_PLL_DCO	0
 #define CLKID_PCIE_PLL_DCO_DIV2	1
 #define CLKID_PCIE_PLL_OD	2
 #define CLKID_PCIE_PLL		3
+#define CLKID_PCIE_PREDIV	4
 
 /* MPLL */
 #define CLKID_MPLL_PREDIV	0
@@ -39,6 +43,7 @@
 #define CLKID_HDMI_PLL_DCO	0
 #define CLKID_HDMI_PLL_OD	1
 #define CLKID_HDMI_PLL		2
+#define CLKID_HDMI_PREDIV	3
 
 /* MCLK */
 #define CLKID_MCLK_PLL_DCO	0
@@ -52,5 +57,6 @@
 #define CLKID_MCLK_1_DIV2	8
 #define CLKID_MCLK_1_PRE	9
 #define CLKID_MCLK_1		10
+#define CLKID_MCLK_PREDIV	11
 
 #endif /* __T7_PLL_CLKC_H */

-- 
2.47.1


