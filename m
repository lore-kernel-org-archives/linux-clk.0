Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A791F3D56;
	Tue, 25 Aug 2026 05:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787635098; cv=none; b=n34qpddvKKv8BL+e22pC9PWiwWGKWbviJAipFmCBwleazk6yDL7C19wea1qJ02PiYAvkTmtLgDbh2fWOCPADJTUzmGQecf/oiyXN5tUMFBUu1uktHmaImz+GAn1geFk8SNQuXTB+r2kGsw9vhDAD/9Z4ZFnuWYdInf6aD99b5hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787635098; c=relaxed/simple;
	bh=1vJXSwb71+DIkIBLQxNtwxCWQXMAvT77Lw0qeqLFOm4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U5Esl3aki24X0S3uXwscGuYqyP1I0aFhDV4+L+qmagqcTFwhjVPectWgWkzBaXfttm6WS/K9w3YrXy3J8ahAH29QNAppKfTTILAWZt2qOuDbpaD2c0r053ud1Ff91PDpLHCHkVi+lrCIpTGXAvQHYZR/Wirnbwt43y5wy2CGFf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EpJklauP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EpJklauP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 99D95C2BCFA;
	Tue, 25 Aug 2026 05:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787635097;
	bh=1vJXSwb71+DIkIBLQxNtwxCWQXMAvT77Lw0qeqLFOm4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EpJklauPLAqPyoFLSLdBB6FXWQbFMgl5529wAVYn7xoFbeY/v/yakHMueEi+6sMkC
	 fvQWQc6pkp4k3D3bHX0p8gJEyMP4J1e9wsJWIRznfZfMJV8wTOLS3BUdIf7wGq4O8l
	 NDa6TCgWiq4+d0RcGq4aqAgbFNv/RC6PBAbgZAX70P9j67uTppXJ5+9/GKzYOShpaz
	 z+Z1cHXbKdzjNsFYyoDFaQX6DYIgTYKBn0KKi9+lc6485wD9+1Vk7gO0tMiZZnaZHy
	 VuTqvv45SK6bnboNDoGmk52LaEMSx1VT38d4xJ98imM5Ix8LBrVmFWJIXeULvO4TW4
	 2lxxfgdHP87og==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 859CEC61CE3;
	Tue, 25 Aug 2026 05:18:17 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Mon, 24 Aug 2026 22:18:17 -0700
Subject: [PATCH v2 2/2] clk: rk808: Select the clock function of CLK32KOUT2
 on the RK818
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260824-ppp_connectivity-v2-2-a4b0e11cd62c@gmail.com>
References: <20260824-ppp_connectivity-v2-0-a4b0e11cd62c@gmail.com>
In-Reply-To: <20260824-ppp_connectivity-v2-0-a4b0e11cd62c@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>, linux-clk@vger.kernel.org, 
 mfd@lists.linux.dev, Martijn Braam <martijn@brixit.nl>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787635096; l=3455;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=btBxv1+lK3NuJ3bLMeNAP2UZMK2asFecMzZxkL+Msaw=;
 b=hc3J13W/s34ea0bH6JLfnQLZaWIagLwAHIyZadpZ16gudpVF+ttaRbDdXkMoHA+ARJ6eYeZ0m
 tdH+itjfuWeAqhiMtIVBnJgnrFLkeqGRqL+4Xo8BRLA3st+1wFsA2iB
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com

From: Martijn Braam <martijn@brixit.nl>

On the RK818 the CLK32KOUT2 pin is shared between the 32.768 kHz clock
output and a recovery function, selected by bit 1 of RK808_CLK32OUT_REG.
CLK32KOUT2_EN only takes effect on the clock function, so the output can
be enabled and still be silent. The datasheet resets the register to
zero, but that cannot be relied on: on the Pine64 PinePhone Pro it reads
0x03 once Linux is up, leaving the wifi and bluetooth without their
32.768 kHz reference.

Select the clock function when the output is prepared, so that it can
also be given back, and report the output as prepared only when it is
enabled and on the clock function. The bit is not defined on the other
variants, so give the RK818 its own clk_ops. Boards that never take the
clock are unaffected.

Based on an out-of-tree patch by Martijn Braam & Kamil Trzciński,
carried by Ondrej Jirman.

Signed-off-by: Martijn Braam <martijn@brixit.nl>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 drivers/clk/clk-rk808.c   | 46 +++++++++++++++++++++++++++++++++++++++++++++-
 include/linux/mfd/rk808.h |  1 +
 2 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-rk808.c b/drivers/clk/clk-rk808.c
index 5a75b5c91555..4aabe0234769 100644
--- a/drivers/clk/clk-rk808.c
+++ b/drivers/clk/clk-rk808.c
@@ -71,6 +71,49 @@ static const struct clk_ops rk808_clkout2_ops = {
 	.recalc_rate = rk808_clkout_recalc_rate,
 };
 
+static int rk818_clkout2_enable(struct clk_hw *hw, bool enable)
+{
+	struct rk808_clkout *rk808_clkout = container_of(hw,
+							 struct rk808_clkout,
+							 clkout2_hw);
+
+	return regmap_update_bits(rk808_clkout->regmap, RK808_CLK32OUT_REG,
+				  RK818_CLK32KOUT2_FUNC_MASK | CLK32KOUT2_EN,
+				  enable ? CLK32KOUT2_EN : 0);
+}
+
+static int rk818_clkout2_prepare(struct clk_hw *hw)
+{
+	return rk818_clkout2_enable(hw, true);
+}
+
+static void rk818_clkout2_unprepare(struct clk_hw *hw)
+{
+	rk818_clkout2_enable(hw, false);
+}
+
+static int rk818_clkout2_is_prepared(struct clk_hw *hw)
+{
+	struct rk808_clkout *rk808_clkout = container_of(hw,
+							 struct rk808_clkout,
+							 clkout2_hw);
+	u32 val;
+
+	int ret = regmap_read(rk808_clkout->regmap, RK808_CLK32OUT_REG, &val);
+
+	if (ret < 0)
+		return 0;
+
+	return (val & (RK818_CLK32KOUT2_FUNC_MASK | CLK32KOUT2_EN)) == CLK32KOUT2_EN;
+}
+
+static const struct clk_ops rk818_clkout2_ops = {
+	.prepare = rk818_clkout2_prepare,
+	.unprepare = rk818_clkout2_unprepare,
+	.is_prepared = rk818_clkout2_is_prepared,
+	.recalc_rate = rk808_clkout_recalc_rate,
+};
+
 static struct clk_hw *
 of_clk_rk808_get(struct of_phandle_args *clkspec, void *data)
 {
@@ -134,11 +177,12 @@ static const struct clk_ops *rkpmic_get_ops(long variant)
 	case RK809_ID:
 	case RK817_ID:
 		return &rk817_clkout2_ops;
+	case RK818_ID:
+		return &rk818_clkout2_ops;
 	/*
 	 * For the default case, it match the following PMIC type.
 	 * RK805_ID
 	 * RK808_ID
-	 * RK818_ID
 	 */
 	default:
 		return &rk808_clkout2_ops;
diff --git a/include/linux/mfd/rk808.h b/include/linux/mfd/rk808.h
index 7ffc904c864c..e3cb586d34a0 100644
--- a/include/linux/mfd/rk808.h
+++ b/include/linux/mfd/rk808.h
@@ -1051,6 +1051,7 @@ enum rk806_dvs_mode {
 
 #define VOUT_LO_INT	BIT(0)
 #define CLK32KOUT2_EN	BIT(0)
+#define RK818_CLK32KOUT2_FUNC_MASK	BIT(1)
 
 #define TEMP105C			0x08
 #define TEMP115C			0x0c

-- 
2.55.0


