Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=85.215.255.83
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792955940;
	b=UOZCOdBfXOvyoFHLRuiYS9eljnF6SXbZcHeP4FJtPiq/4KrQeQ/yebD8pMu8UGQKxXRS
	 pYd4+SqUYLLf1tXA7UHEGiWP7bEaarzvsY/hBNN9iOEZoO/dUGC2fBsVYlK53McMI5gS6
	 4Fk9D/55WIAV78evxObEG/wUxlFrQi+wIymDOOWVYBEzPnkP54j0xzM0pO9mDIzYY4BXC
	 cJF0FH4UF94VO/7vpEW45Z+MpwuGf9mY6PfbpG8bsuztLc75NBNj88am66CTGloi5gpgw
	 Ma8q7WNis2Y3zI+vebT269+d/+Oq839bR8s7NWS6LlNZhn6RrunQlEU6Gnu4PgJumkw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955940;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=h9v9mzP0tqY8fn2282IDMcsxTzv3Wudu66uiKy5P9Ec=;
	b=AVXUuMcoYMGvGAJV1L2Fnsi4C8vG+0VGAL9914Alj3wW8eOhVM/idpasPVmMqK5DYHaW
	 VGxn2Z/mr9XMSc+srFeu5YTIhemz3t74NQtmNMuQY9mB+IoUJ2dmb1a0JdF8JHifFTL0z
	 7JQKuEQNKNVFw7jwKIIZJQYdl5oEDDmra4DBTouK2qaT0cUA5W7hSUDoqS5IBtvr0k9TW
	 RA+Z1wFtw57uJsBe3d2fpxLt519061PyK1IwNdHfDgG/sLciB6FozJdKc33rIbVtm7SA5
	 pFpvqdUdrY7+3JVwpJSKSNJHiMbHyD/dAgOt7AGGgbb80T8ENQyRRDEtFDgNVypXRsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=CuDUrbyq;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=KFmhKFoA;
	arc=fail smtp.remote-ip=85.215.255.83
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C2E606A32D;
	Sun, 25 Oct 2026 19:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3C2E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=CuDUrbyq;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=KFmhKFoA
ARC-Seal: i=1; a=rsa-sha256; t=1792955914; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=ldrZ4jrBOsVSp4DR8V+FW9H1r1NG38llVAxc7QytAorIDgK+O9swXFzs28F1IE8wl6
    l2w51S/BU2gMADBdWYgUVaFjqqQ5Z82swASrXXmyEXxXtOhazuC5j2rcZHxP6lJUL4/E
    RwEmAN1w+Gsy2GLmeiUhzzKxwjBnnheTV6pwZ5xKebLjxLfAhJzFgrRiUVmniY5DYwyu
    rIvofJTOErdIsERK5IWkeDPY/9TGZgqoQg07HEi71oXSN10g4XXB5qSR603Fdr6vYe7e
    LyLRgKXB2WnsnU/4K0Ap4Luwzku/YmK0HBmRSaw2/r/sG9MB2hYpdLV2V0lCMij+YkUf
    Yr6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1792955914;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=h9v9mzP0tqY8fn2282IDMcsxTzv3Wudu66uiKy5P9Ec=;
    b=SQjrdX8ns0ckxdwTCp6iQt88m3fpcpjOt+P1Flr3oJFTABgiMoniJWxHI6vqAcESoO
    9Ix8agzauRtCESBVqoj3H69xtUI/hc4dBqQq/Sed6nfJUq5fVAKYnTzOLuP0lnlDszjq
    Um+mZNoL73Cly9nUDNzVmxkz3lcAIav+RpIH4ZbOgb8/FKUwoUJ2QD5PPEzGP1k3+e2u
    +fnlLsaaYZja4lHGInFxc5WLOoznHe7lJ0tYqyOAiOr9uhmhBcbvb+uUwM+dH2T/5S90
    lgp/beUWtAcg6O/k/EM9/wPNJcAbxiODr8GR+L2fjPTEbNxIADruigKNmtM1XylgjedL
    exwA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1792955914;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=h9v9mzP0tqY8fn2282IDMcsxTzv3Wudu66uiKy5P9Ec=;
    b=CuDUrbyq/vuubYZG19cPN8gx0/z6QUbXKQ/1FXcGlHtwHCqt5s/ygLBAzR5s8UErZw
    iTWQnW4/hGnTHERLX+dPV9ebTfGU+cMRWJrDyiyS7yGsN+pzFE05BoxcJsWAfCSsfHYI
    lYILfIxQzIZH5JWlbGw/HkE3QA2nkzdamHUUt5ddzLvF6gP40seryVVl6s2qIfUSuE0Y
    pEsW2OG8d8TdT9j20Bd/aQki+Yc5GqSuyRh5oPO1cnUtXRURvZi92rayR3xaJqkr282g
    j78+0X0l+bxo/wh9Pg86MTx9Qw/1jAwGDCtKdl+CFWJglm3YgXiOhpxbDKQGaVc7misv
    715g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1792955914;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=h9v9mzP0tqY8fn2282IDMcsxTzv3Wudu66uiKy5P9Ec=;
    b=KFmhKFoAE70qmFCSzD/JoDAElDGHoU3hVuUCshgj12zGncl/HCUAW98EplrfY3Gq7+
    Sb2Y6pZiRiCAFFGKvLBw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrS2poNy8iNoc+LWkugLIF0fnfvFgpgbBBt2w=="
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a229PJIYzQo
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 25 Oct 2026 20:18:34 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	letux-kernel@openphoenux.org,
	kernel@pyra-handheld.com,
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	Paul Boddie <paul@boddie.org.uk>
Subject: [PATCH 1/4] dt-bindings: clock: Add Ingenic X1600 CGU bindings
Date: Sun, 25 Oct 2026 20:18:24 +0100
Message-ID: <13abd95aaab56ce5c9dc565db7f0198162b0c166.1792955907.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1792955907.git.hns@goldelico.com>
References: <cover.1792955907.git.hns@goldelico.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

Add the device tree bindings and the clock ID definitions for the
Clock Generation Unit (CGU) of the Ingenic X1600 SoC.

The clock layout features specific I2S handling. To properly support
the I2S controllers on the X1600 without relying on complex compound
dividers that are not yet natively supported by the drivers, split
the structures to explicitly describe the additional I2S divider
fields. This design accounts for the current driver limitations
regarding division encoding while matching the hardware's internal
gating architecture.

Furthermore, introduce dedicated I2S0 RX and TX clock definitions to
allow independent and precise routing for I2S stream usage.

Co-developed-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: Paul Boddie <paul@boddie.org.uk>
Co-developed-by: H. Nikolaus Schaller <hns@goldelico.com>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 .../bindings/clock/ingenic,cgu.yaml           |  2 +
 include/dt-bindings/clock/ingenic,x1600-cgu.h | 64 +++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 include/dt-bindings/clock/ingenic,x1600-cgu.h

diff --git a/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml b/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml
index 509df06b9c9d8..c622131c5c49b 100644
--- a/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml
+++ b/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml
@@ -28,6 +28,7 @@ select:
           - ingenic,jz4770-cgu
           - ingenic,jz4780-cgu
           - ingenic,x1000-cgu
+          - ingenic,x1600-cgu
           - ingenic,x1830-cgu
   required:
     - compatible
@@ -58,6 +59,7 @@ properties:
           - ingenic,jz4770-cgu
           - ingenic,jz4780-cgu
           - ingenic,x1000-cgu
+          - ingenic,x1600-cgu
           - ingenic,x1830-cgu
       - const: simple-mfd
     minItems: 1
diff --git a/include/dt-bindings/clock/ingenic,x1600-cgu.h b/include/dt-bindings/clock/ingenic,x1600-cgu.h
new file mode 100644
index 0000000000000..a0001a63a6b54
--- /dev/null
+++ b/include/dt-bindings/clock/ingenic,x1600-cgu.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * This header provides clock numbers for the ingenic,x1600-cgu DT binding.
+ *
+ * They are roughly ordered as:
+ *   - external clocks
+ *   - PLLs
+ *   - muxes/dividers in the order they appear in the x1600 programmers manual
+ *   - gates in order of their bit in the CLKGR* registers
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_X1600_CGU_H__
+#define __DT_BINDINGS_CLOCK_X1600_CGU_H__
+
+/*
+ * beware of unwritten rules:
+ * - list must start with 0
+ * - list must not have "holes"
+ * - all clock parents must have lower number than a clock itself so that
+ *   parents are initialized before
+ */
+
+#define X1600_CLK_EXCLK			0
+#define X1600_CLK_RTCLK			1
+#define X1600_CLK_12M			2
+#define X1600_CLK_APLL			3
+#define X1600_CLK_EPLL			4
+#define X1600_CLK_MPLL			5
+#define X1600_CLK_SCLKA			6
+#define X1600_CLK_CPUMUX		7
+#define X1600_CLK_CPU			8
+#define X1600_CLK_L2CACHE		9
+#define X1600_CLK_AHB0			10
+#define X1600_CLK_AHB2PMUX		11
+#define X1600_CLK_AHB2			12
+#define X1600_CLK_PCLK			13
+#define X1600_CLK_DDR			14
+#define X1600_CLK_I2S0			15
+#define X1600_CLK_I2S1			16
+#define X1600_CLK_LCDPIXCLK		17
+#define X1600_CLK_MAC			18
+#define X1600_CLK_MSC0			19
+#define X1600_CLK_MSC1			20
+#define X1600_CLK_SSI0			21
+#define X1600_CLK_CIMMCLK		22
+#define X1600_CLK_EXCLK_DIV512		23
+#define X1600_CLK_RTC			24
+#define X1600_CLK_OTGPHY		25
+#define X1600_CLK_NEMC			26
+#define X1600_CLK_OTG0			27
+#define X1600_CLK_SMB0			28
+#define X1600_CLK_SMB1			29
+#define X1600_CLK_AIC			30
+#define X1600_CLK_SADC			31
+#define X1600_CLK_UART0			32
+#define X1600_CLK_UART1			33
+#define X1600_CLK_UART2			34
+#define X1600_CLK_UART3			35
+#define X1600_CLK_PDMA			36
+#define X1600_CLK_AES			37
+#define X1600_CLK_I2S0_RX		38
+#define X1600_CLK_I2S0_TX		39
+
+#endif /* __DT_BINDINGS_CLOCK_X1600_CGU_H__ */
-- 
2.56.0

