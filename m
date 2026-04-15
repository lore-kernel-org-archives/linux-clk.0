Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B9530ACE3;
	Wed, 15 Apr 2026 23:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776296007; cv=none; b=Ey1IEtwTuQQg5evHV2W7IQgbj5S6xufHigXNpaSNVLoUdKcmrCJ9ioUAUVq9tzcWZYo8wP+uLyneVCdgTpK5KPAlOy5kMA/xVBMfwLoUFPhuBThdCiUsUe5f+m/2S1j9sM8+JrbckmDVpMjTCMrIMyuS1nO0pdF/p7Sj849gfmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776296007; c=relaxed/simple;
	bh=TVrrjeIf7lce1ZvWOsoJbFgbaoIfZkYISOCvtI0L/dI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xblv3T6k3swOUaky0ky/MKrScQPAChHUANPOCkVgSA/Z/XIuaSCPtsf4iCQzXv4ojA4UjTei19aNlGuLQ0oalKwkRYwcE9pDIIp4ou9xpdEKFXGOCOCzc3Iisn5pNfxiWADgPwlBokaDGDwsFyfZmUTVVw69R240vb5Ogx7odu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=OP26vKUg; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=S+RzvFLU; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="OP26vKUg";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="S+RzvFLU"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4fwyBX1Q2Mz9tMx;
	Thu, 16 Apr 2026 01:33:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776296004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6F3yeHMy8k25IIcLnYtW7efe2hdiABS+2+40RvkQPK0=;
	b=OP26vKUg94ZqB/QvEdD8yWrTgN+fPL8+qKHSy5om4XvnxX2HFQcb7+VmpycG2sNTtw9At+
	am1h3N6vngmYigfANbULAVLVXSYJn5ZLBVgh1yd+Q6twoXCYWUujgpEqett55nYJqbH+t2
	+oG0YPreBVMD7VRwmtUsMu0/wkdE67z3GQiWKIniChlCdoYYNo55774Rr+krBaym+a8oW+
	zMk8dKAdhrmQRydbIhk+LS+eUlUXZYmt6CJ+/ZfsOeXt4HqdKgTzT1OC5O3fH40Cayiv7C
	bCTs51ab2KWO5adwyYmNRua3i6ZZ2tbynVtXrqQAiGosYxJ3rNaq83SBT4jeDw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=S+RzvFLU;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776296002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6F3yeHMy8k25IIcLnYtW7efe2hdiABS+2+40RvkQPK0=;
	b=S+RzvFLU/hIIasb9u/MYjs1BdO1bQp04VevVabJ5E/ngJ2x3dQmXc4ItwQsVTnOZTdP53E
	OS3rAj+W2JDqtTI5hUdEVJzVCEwJcG1JaP/5vZ+MUDLnqIY30l5zCHxdDrdjg86nVOiTsT
	Ku7NZSi8FHOVECbmjB6uxH7XLhzNHV0hIf62p5TR9CF6EU0+pqWa6GJbSFhSbFexS7loR3
	uYvJK7IyMZWljWsdjze0bejUDZpaZMq1pAqfwXRFLgNp26BURsiXosI60W8mmHxoLP78Ik
	UXVjXwADn0A581LbVVTIl177NllAXyIvFvNZrmISgma9CjstGJf+3afA/+tKuA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 3/4] ARM: dts: renesas: r8a7740: Add ZT/ZTR trace clock on R-Mobile A1
Date: Thu, 16 Apr 2026 01:31:40 +0200
Message-ID: <20260415233300.457892-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260415233300.457892-1-marek.vasut+renesas@mailbox.org>
References: <20260415233300.457892-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: tofh1r39zydi3jr553sf6yg73abnifyf
X-MBO-RS-ID: 03c2ac607c39a231650
X-Rspamd-Queue-Id: 4fwyBX1Q2Mz9tMx

Add ZT trace bus and ZTR trace clock on the R-Mobile A1.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: Add ztr/zt clock at the end of the list to match bindings
---
 arch/arm/boot/dts/renesas/r8a7740.dtsi    | 2 +-
 include/dt-bindings/clock/r8a7740-clock.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7740.dtsi b/arch/arm/boot/dts/renesas/r8a7740.dtsi
index d13ab86c3ab47..f7136db7a2eae 100644
--- a/arch/arm/boot/dts/renesas/r8a7740.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7740.dtsi
@@ -553,7 +553,7 @@ cpg_clocks: cpg_clocks@e6150000 {
 					     "usb24s",
 					     "i", "zg", "b", "m1", "hp",
 					     "hpp", "usbp", "s", "zb", "m3",
-					     "cp";
+					     "cp", "ztr", "zt";
 		};
 
 		/* Variable factor clocks (DIV6) */
diff --git a/include/dt-bindings/clock/r8a7740-clock.h b/include/dt-bindings/clock/r8a7740-clock.h
index 1b3fdb39cc426..8a8816b2ff6ac 100644
--- a/include/dt-bindings/clock/r8a7740-clock.h
+++ b/include/dt-bindings/clock/r8a7740-clock.h
@@ -24,6 +24,8 @@
 #define R8A7740_CLK_ZB		14
 #define R8A7740_CLK_M3		15
 #define R8A7740_CLK_CP		16
+#define R8A7740_CLK_ZTR		17
+#define R8A7740_CLK_ZT		18
 
 /* MSTP1 */
 #define R8A7740_CLK_CEU21	28
-- 
2.53.0

