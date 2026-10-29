Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793266271;
	b=TWPaYjeuR/GJmuyohaO0EzWQCbeXUZd5GtPNP+ZFErXIcOM6F9Hobx5Ga/V9Ft136mV1
	 1GuWx4/OmovaqDcALtTIhijKLMqhJtCLH6A+SUAu/gyWszz4Reu6MNctpejswrzwF0BPj
	 ITfQ93wMP1otFqJ8h1BoVeQcasJsc9jwhFoRhKORy2P4FagSQ5pKqWfzJ08WQFawXIc0w
	 fUvOcpQBrrCJ40wA9wckI0OKSmCcGDZkr+3lmcazaYfMekcfqTwzTT4z0uTTwufBUf0RG
	 C8/oGdG/4kmAFRd+N/iV/AIQhDsutnzohYB+AzKBgK7ISsF9A6qPilW5F8c/eUbKI/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266271;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=lRK+vR5DapZgqS0HuHWspANx/juMaX+qmJujqAN6Rqo=;
	b=quSQAi0gc10cdyhTzSIDDdU0zy5WPNA1HABF3S/2dRSYWbVKtLLCNMx0Cz1j28We86js
	 QojCAVu+k8j1W46q3BANAT0hyJzEvBWwOTxjO10i3aCzpJILIjwBvY+KJPaHcAzeFuEGG
	 PvU8fjO5iTNLv26XdM5dLE+0XE6ONHAXvm8TZwYXifB1lcceEhbgvz5TaX9RDi1HhMmHa
	 K6iDSsC2mPUQlpVpzRbAYnUWGe2YtnPQod1fEHqESiOCOb8WcSlS81x18e7xet3F5Gito
	 OGeFNNDhTWI9hiv7nyii1EZuyq0l8W7h48A2xfvwgLAwJjfkRuXTX06/OrRepS9fQRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DEXYskPS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC795606A324;
	Thu, 29 Oct 2026 09:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DEXYskPS
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793266270;
	b=ftLTyQZDEsdyH0Sz7Ubxv+60Z4ZQV9pkxl7b+XXrteunBa2iRnXP/Kzz1V4HPMT42eUF
	 IPutoWScgq7p40QuDcOz58coJtwus8JQwt4DuKo8VSrxBGcNHctIDnA/XRYaYX/X9z/KR
	 rflPFcXnPuPU6WDo2rzsjnmWBtthM+fWxF/db33UsZs1C+LEJVYPVmhBVwPFhFBhkWfhp
	 DJ806ggpLC6eYlM/dy9JxQ4lQ8eN8ZPZAK5Qvj85bo/jh4TfRicvmesJIYFPHvsO5/I2x
	 9lAxtrWXqyp6DBCS9YIrWivhP7Cd3w91XWq2ageFaDthNZ8l9V7IsPk9QanPbIsqqhQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793266270;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=lRK+vR5DapZgqS0HuHWspANx/juMaX+qmJujqAN6Rqo=;
	b=UgsBMAXIJI2PclW0Tc6wQjM1sJ75wMsDmWBdif/QLliyv4x6cNbJdFA4qkZBGu2Qavnt
	 ANkLN1Bix4hGgR8J26/1LfTgBWBY8JBtBBPcG+u8AcZBpbfxmw0DQSfYTeyhiDOlvjzWK
	 NwUvNG/uXhJTk7seg1DfJaClf2l0dWrH9EGERUnHt8Fe0zzNy3184tEH+nyT4wPNiaTYM
	 kME+O2QwDYdgy1ksuRxf3DcHsYJ3htU+S5hssSl4P589jdkTLza51mI8WglVw5lk+OLh/
	 ycusWKfwZn0VU+9FKqDJE9oalqQHNJSmw7YRXDfZlaBpO/RyLkfviIrPfEzQ/FjrBrw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A0BDA1F031E9;
	Thu, 29 Oct 2026 09:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793266270;
	bh=lRK+vR5DapZgqS0HuHWspANx/juMaX+qmJujqAN6Rqo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=DEXYskPSDmCO5wb3o7F1LKgNTAJ+QD+Q5DlwGhifui1pLhA8qxCVUBQEn2+S6KgEX
	 o0Y1tTqglhc0EXC+GrlaJuMP8r/KQ4+QYVquHxP7auvBlxN29bmygMz91VSiETrXSf
	 Z/OAZMBjGoEg+togOxQ+eqbnsB0kt5p6FaAupJ8QizibJHb/SiaIeJDcMB9m/Ghx5P
	 qxRe6puU5KAW6MWc2DOiz3AuzK1PlUkspCefOmW7bOZXhUU33uM5X/i7hZ/0WxdaYd
	 aFkg47qAJABIKynnmpAWO5Jj48UBHP/Xh66nu2kSq/bINv19e7D2cxT1CHgFOJ/SMU
	 ddBgEoq82R8oA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 32CF9457C0;
	Thu, 29 Oct 2026 09:31:09 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Date: Thu, 29 Oct 2026 17:30:53 +0800
Subject: [PATCH RFC RFT v2 2/3] clk: divider: add CLK_DIVIDER_INVALID_ZERO
 flag
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
Message-Id: <20261029-meson_refactor_n-v2-2-ff4ac74e527b@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793266267; l=2646;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=erjQIBkjDA84dTVLTzuE89941kvEx6V1M15mAHbEPe8=;
 b=M75Y/COMa5W9P7iRc1XOwuaQfgaKCQJcQkJtXFEVpP2ZItZa3Z3j5x4GpxtgBUsuhYOXxfLUk
 EUICoiNiwyoD68vezXaTQdTyxvh7+B/yg7YLCsnpmyKeXtnwg69fDeW
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
Reply-To: jian.hu@amlogic.com
Content-Transfer-Encoding: 7bit

From: Jian Hu <jian.hu@amlogic.com>

When a divider register reads zero, divider_recalc_rate() currently
emits a warning (unless CLK_DIVIDER_ALLOW_ZERO is set) and returns
the parent rate.

This behaviour assumes a zero divisor acts as a pass-through, which
does not apply to all hardware. Some dividers, for example PLL
pre-dividers on Amlogic SoCs, come out of reset with a zero value
that does not produce a usable clock. Returning the parent rate
hides this fault behind an incorrect, plausible value.

CLK_DIVIDER_ALLOW_ZERO only suppresses the warning while still
reporting the parent rate, so it cannot represent this hardware
behaviour.

Add CLK_DIVIDER_INVALID_ZERO for dividers where a zero divisor value
is invalid. When this flag is set, recalc_rate() returns 0, making
the faulty state visible to the clock framework rather than hiding it
as a pass-through.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 drivers/clk/clk-divider.c    | 3 +++
 include/linux/clk-provider.h | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index f68216c65d3d..6c1523d22477 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -143,6 +143,9 @@ unsigned long divider_recalc_rate(struct clk_hw *hw, unsigned long parent_rate,
 
 	div = _get_div(table, val, flags, width);
 	if (!div) {
+		if (flags & CLK_DIVIDER_INVALID_ZERO)
+			return 0;
+
 		WARN(!(flags & CLK_DIVIDER_ALLOW_ZERO),
 			"%s: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set\n",
 			clk_hw_get_name(hw));
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index dc8e161f9c2c..fe2dbbba49e3 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -744,6 +744,11 @@ struct clk_div_table {
  *	big endian.
  * CLK_DIVIDER_EVEN_INTEGERS - clock divisor is 2, 4, 6, 8, 10, etc.
  *	Formula is 2 * (value read from hardware + 1).
+ * CLK_DIVIDER_INVALID_ZERO - a zero value read from the register is not a
+ *	divide by one / bypass but an invalid setting which does not produce
+ *	a usable clock.  recalc_rate() returns 0 so that the broken state is
+ *	reported to the framework instead of the parent rate, without
+ *	triggering the CLK_DIVIDER_ALLOW_ZERO warning.
  */
 struct clk_divider {
 	struct clk_hw	hw;
@@ -767,6 +772,7 @@ struct clk_divider {
 #define CLK_DIVIDER_MAX_AT_ZERO		BIT(6)
 #define CLK_DIVIDER_BIG_ENDIAN		BIT(7)
 #define CLK_DIVIDER_EVEN_INTEGERS	BIT(8)
+#define CLK_DIVIDER_INVALID_ZERO	BIT(9)
 
 extern const struct clk_ops clk_divider_ops;
 extern const struct clk_ops clk_divider_ro_ops;

-- 
2.47.1


