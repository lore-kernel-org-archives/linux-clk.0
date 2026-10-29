Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793266271;
	b=JQ2CfFyRsYX+3trnGPB2AeLLXQAfUqGeurzYFIPyfK28SgzGFDkdC3cRCTuamO/WLppo
	 6HptSd+82dNZA6RkRWq6tLFaEOXjMnpHS/n5Df+9KXpvfd8pVirqdsTvle3BtDOUBW0QE
	 omL1EiATZqAlNKvL7AjELhQx274B5oSapGjFxfbiB15I6FIw9Hxrjy5XlIiM/SpLVVNoj
	 P+bMAunJZE7QB6v4/FZm7fj04VGwhXDErUK/ZmSppg8dxvoA3YqedvtR7BbCiO9Rd15te
	 /6enC/x4XhCkpPXciRqcwAYDpbnOI9xZPnFXJiXh7E8TAMJ4Ywe+XCnePURmOTsxHgA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266271;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=WKoIHNQScpy/6jyYcISkmFBovpn5jhX4t3E1zsauVh0=;
	b=eCA8NZc67Nfs1zcwBEV44OqE2YIbyfxvsdsfkmmuX3pqLFkydIm4hbQZ2Iy/fDa/QdOH
	 V6DkmfG2o1DIWu8Xah+DBa6bL2ZSGENE+OHhtQNyW5+5QdLrLGWfVMDycVlEDsYBUS96F
	 9VPhHZu5aVAiyEMqi1Ow626/ic/QdJ1qAzZj1FKR3HzujaUEwPynbyt8bcGJs0dqFQ0q4
	 bjwfkDb0R1xSw9ka1hxLOkjQ9wcW+aTwSJ6d6gg6FEUKV4wbvhQezDrSMAS8kLKdQFrF7
	 ET/OjNB/e+1IdhV2XIiJ6ukK+hR8vUilrcAcevZM+TW5t3lfTp+j5oQjdKZswh84mfw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=km4EiAhP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7F4606A31F;
	Thu, 29 Oct 2026 09:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=km4EiAhP
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793266271;
	b=TXyNMuaCNeNaO8Qucc7LjDBuY7zMelV+v8QgpClXxeJns+SF9YdMl91uxMK/hXoO/PiG
	 I4Bwt25+59bbIX95YJDyrYbqQFOBGuR3f2jnH2VNui8c3MnuFkTwZgCqJ9A1IvwMPWV9x
	 0kKMVp9gjqZkfkHhjBdZKo3s4RwzhZxaGQKKK2MgtOEReiYfm4eybSKNHSX6jlaqU/h2y
	 TeAhMH+44zp8P8SMfumZnCQQPRIacNwgAB5OPzdGlGPTWxmw8Tp1FgH1Ddu37L5dREome
	 9srnce/LforvBidzZjQmDJdvrDIUlorDO8Gtp/iWmTKC/92o9DJ6Ba5bpryINPCThbg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793266271;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=WKoIHNQScpy/6jyYcISkmFBovpn5jhX4t3E1zsauVh0=;
	b=M+mMdog7vJZC6BXpCtNAXbPKW2DuncWbmDdDTN2k9QV/KXLVBzjGtrhmEXWNXq05UBsl
	 c/q4dr5eJGFegYC6vimv3DrE6tLK6NjPORXe188OLXkwkaIYmXpzAhF/7f+F2t9580wod
	 qelInBhl5IUMKwLiVYm+Yrd2JrgZDmoWHvC4NN7+lyS2ddKRwHP1aKQHga58Enk3uq07C
	 xabeNCi5CbvxiPvwaMH5C/VsR15XI0kMILiChkhHh52jr3LdAxjBKjE6Dd5OVDrqFBPGh
	 gANSx0yWDTi8lorTF5U/6eZ2jK7USvAdpovUd8nIREEJWkWXO41GsOOuxiqY38+L6iw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 944F91F031E6;
	Thu, 29 Oct 2026 09:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793266271;
	bh=WKoIHNQScpy/6jyYcISkmFBovpn5jhX4t3E1zsauVh0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=km4EiAhPzDgplHhs85Mbi1mEkL5f9DckOs5PV9ke8Obtgb7nilljYsYdFSRK1gRvH
	 JJO78ZM5GeEvCGJ4dLz2BU62LzYuxxZez3uOLhxDp/TxkMYWb/wyJR0BVGmqxAueW1
	 YfUc8jy8wCtv8DBFegzAYQyDrhdDZM0cG93fPoJRLZbS4zriMZVkXLlioFrX5Pj74Y
	 /NsDeAABzxqaQ4I6yC6HPW2ufqEp5+hKhMM4bq2FpCvIa3CJXIAE/ZkLbxKF8TfrXb
	 xuiIYIrDDaPC/OVt41Uo9YcS8CNIXBYYm8Kz6YHAXTMzZ4BxSSVTydEDG84PPpXiOz
	 qJ8ydD9HmdcFw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 27799457A7;
	Thu, 29 Oct 2026 09:31:09 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Date: Thu, 29 Oct 2026 17:30:52 +0800
Subject: [PATCH RFC RFT v2 1/3] dt-bindings: clock: amlogic: Add PLL
 pre-divider clock IDs
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261029-meson_refactor_n-v2-1-ff4ac74e527b@amlogic.com>
References: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
In-Reply-To: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793266267; l=6174;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=NhD9+CXL9tRSS4fVfLHNmQWwe4J418AMvGpnb3FP5WA=;
 b=qAdesZJO1XCIOuoxCthYPtYVCo//JFzOXPg6eLoiDq5SqM4tdOsTBeMKe903dUHAe45fXUDQH
 wR++V2WYoz3AzsI7KyeaGUYvUXtaJ43E210hr1gczcj0HSFwSrE6UXk
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
Reply-To: jian.hu@amlogic.com
Content-Transfer-Encoding: 7bit

From: Jian Hu <jian.hu@amlogic.com>

Add clock IDs for the PLL pre-divider clocks. These IDs are
required for the subsequent conversion of the PLL pre-divider
into a standalone divider clock following the PLL framework refactoring.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 include/dt-bindings/clock/amlogic,a1-pll-clkc.h | 3 +++
 include/dt-bindings/clock/amlogic,c3-pll-clkc.h | 3 +++
 include/dt-bindings/clock/amlogic,s4-pll-clkc.h | 4 ++++
 include/dt-bindings/clock/amlogic,t7-pll-clkc.h | 6 ++++++
 include/dt-bindings/clock/axg-clkc.h            | 5 +++++
 include/dt-bindings/clock/g12a-clkc.h           | 8 ++++++++
 include/dt-bindings/clock/gxbb-clkc.h           | 4 ++++
 include/dt-bindings/clock/meson8-ddr-clkc.h     | 1 +
 include/dt-bindings/clock/meson8b-clkc.h        | 4 ++++
 9 files changed, 38 insertions(+)

diff --git a/include/dt-bindings/clock/amlogic,a1-pll-clkc.h b/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
index 0dfc5e78a2d5..c09f215bf75b 100644
--- a/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
+++ b/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
@@ -22,5 +22,8 @@
 #define CLKID_FCLK_DIV7		9
 #define CLKID_HIFI_PLL		10
 #define CLKID_SYS_PLL		11
+#define CLKID_FIXED_PREDIV	12
+#define CLKID_HIFI_PREDIV	13
+#define CLKID_SYS_PREDIV	14
 
 #endif /* __A1_PLL_CLKC_H */
diff --git a/include/dt-bindings/clock/amlogic,c3-pll-clkc.h b/include/dt-bindings/clock/amlogic,c3-pll-clkc.h
index fcdc558715e8..771be7d53bc0 100644
--- a/include/dt-bindings/clock/amlogic,c3-pll-clkc.h
+++ b/include/dt-bindings/clock/amlogic,c3-pll-clkc.h
@@ -36,5 +36,8 @@
 #define CLKID_MCLK1_SEL_EN			26
 #define CLKID_MCLK1_DIV				27
 #define CLKID_MCLK1				28
+#define CLKID_GP0_PREDIV			29
+#define CLKID_HIFI_PREDIV			30
+#define CLKID_MCLK_PREDIV			31
 
 #endif  /* _DT_BINDINGS_CLOCK_AMLOGIC_C3_PLL_CLKC_H */
diff --git a/include/dt-bindings/clock/amlogic,s4-pll-clkc.h b/include/dt-bindings/clock/amlogic,s4-pll-clkc.h
index af9f110f8b62..e194185f5be8 100644
--- a/include/dt-bindings/clock/amlogic,s4-pll-clkc.h
+++ b/include/dt-bindings/clock/amlogic,s4-pll-clkc.h
@@ -39,5 +39,9 @@
 #define CLKID_MPLL2			29
 #define CLKID_MPLL3_DIV			30
 #define CLKID_MPLL3			31
+#define CLKID_FIXED_PREDIV		32
+#define CLKID_GP0_PREDIV		33
+#define CLKID_HIFI_PREDIV		34
+#define CLKID_HDMI_PREDIV		35
 
 #endif /* _DT_BINDINGS_CLOCK_AMLOGIC_S4_PLL_CLKC_H */
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
diff --git a/include/dt-bindings/clock/axg-clkc.h b/include/dt-bindings/clock/axg-clkc.h
index 442162822b88..798b92919f60 100644
--- a/include/dt-bindings/clock/axg-clkc.h
+++ b/include/dt-bindings/clock/axg-clkc.h
@@ -144,5 +144,10 @@
 #define CLKID_VDIN_MEAS_SEL			134
 #define CLKID_VDIN_MEAS_DIV			135
 #define CLKID_VDIN_MEAS				136
+#define CLKID_FIXED_PREDIV			137
+#define CLKID_SYS_PREDIV			138
+#define CLKID_GP0_PREDIV			139
+#define CLKID_HIFI_PREDIV			140
+#define CLKID_PCIE_PREDIV			141
 
 #endif /* __AXG_CLKC_H */
diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index fd09819da2ec..d2aa3df14149 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -287,5 +287,13 @@
 #define CLKID_MIPI_ISP_GATE			276
 #define CLKID_MIPI_ISP_CSI_PHY0			277
 #define CLKID_MIPI_ISP_CSI_PHY1			278
+#define CLKID_FIXED_PREDIV			279
+#define CLKID_SYS_PREDIV			280
+#define CLKID_GP0_PREDIV			281
+#define CLKID_HIFI_PREDIV			282
+#define CLKID_HDMI_PREDIV			283
+#define CLKID_PCIE_PREDIV			284
+#define CLKID_SYS1_PREDIV			285
+#define CLKID_GP1_PREDIV			286
 
 #endif /* __G12A_CLKC_H */
diff --git a/include/dt-bindings/clock/gxbb-clkc.h b/include/dt-bindings/clock/gxbb-clkc.h
index c0ce5e9c4151..e2e1ec60285d 100644
--- a/include/dt-bindings/clock/gxbb-clkc.h
+++ b/include/dt-bindings/clock/gxbb-clkc.h
@@ -212,5 +212,9 @@
 #define CLKID_HDMI_DIV		204
 #define CLKID_HDMI		205
 #define CLKID_ACODEC		206
+#define CLKID_FIXED_PREDIV	207
+#define CLKID_HDMI_PREDIV	208
+#define CLKID_SYS_PREDIV	209
+#define CLKID_GP0_PREDIV	210
 
 #endif /* __GXBB_CLKC_H */
diff --git a/include/dt-bindings/clock/meson8-ddr-clkc.h b/include/dt-bindings/clock/meson8-ddr-clkc.h
index a8e0fa2987ab..ce97a15c28a9 100644
--- a/include/dt-bindings/clock/meson8-ddr-clkc.h
+++ b/include/dt-bindings/clock/meson8-ddr-clkc.h
@@ -2,3 +2,4 @@
 
 #define DDR_CLKID_DDR_PLL_DCO			0
 #define DDR_CLKID_DDR_PLL			1
+#define DDR_CLKID_DDR_PREDIV			2
diff --git a/include/dt-bindings/clock/meson8b-clkc.h b/include/dt-bindings/clock/meson8b-clkc.h
index 385bf243c56c..c4fd127dca1e 100644
--- a/include/dt-bindings/clock/meson8b-clkc.h
+++ b/include/dt-bindings/clock/meson8b-clkc.h
@@ -221,5 +221,9 @@
 #define CLKID_VCLK2_EN		215
 #define CLKID_VID_PLL_LVDS_EN	216
 #define CLKID_HDMI_PLL_DCO_IN   217
+#define CLKID_PLL_FIXED_PREDIV	218
+#define CLKID_PLL_SYS_PREDIV	219
+#define CLKID_HDMI_PREDIV	220
+#define CLKID_GP_PREDIV		221
 
 #endif /* __MESON8B_CLKC_H */

-- 
2.47.1


