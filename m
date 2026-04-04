Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4682338595;
	Sat,  4 Apr 2026 18:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775327672; cv=none; b=l63eoD6vtj9p7m3g65DODZnWC0rzHaZ63IHFvNr4g/wjlTDJyo5vPd0ZwfCzcFNiBcAUB+tID7cLv+XC4kuaLgS5oYdXv40VMGQO/3apw9vfIAZ0Am/LH3ur0RCX8VlXJWM41iAOZiXVZs6LBnGiIonyi5Q00tXtvhY+h20lp0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775327672; c=relaxed/simple;
	bh=1SZmpUqxGWnmT/F6zCdGbSzSaIw7Qqnt5NDMsxdR5Sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IclpcTYjBxUj1yZrUmC7AAjC6cEJ9VphTJ0RgkFdGDHC5KTgEFqRTvQpebqKa4B/I1bMs9rvsEkOu4+WRsizy2nfEzAOQg6tPdAwgCX5F92DylVMgL+zbYluHZ7NC4nWXd97tOh02SKZL/FZdG7dhLYTr0pXUyig6Z+rHUe6aaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=Dbm+WsMX; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="Dbm+WsMX"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8A338113217;
	Sat,  4 Apr 2026 20:34:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1775327669; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=wI06xUWbyz2NJv+VHVYYCjzVkpdpzmfPJ/2uS0008+E=;
	b=Dbm+WsMXHhVcxinym0oOe77jv/SHulj1RAuL+8541eIseY7tIN302y6xMKMPaJZuPX7CpC
	x1DCopbTJ07pIbGFsgrL+JfmB/tw/1Lzgr0l1++YWJSETWfHfUnpgjmlG3dOrx8iZexZkk
	9KjB++Kdq55nOauk0hOMFj4qoxGijF33gik9C3MVN6uNzo7FmOtmoJLPn89RZVv4OsuEtL
	L0ktfEt1daMiEB50T77lrXUO8LEwR8/+J1Fokh7VPa9Hs1SyPYq0Hfo0etw/YYl2Tw0p8g
	0A+5x0e7jXu1Czl7Fj2VLQlyZB69Fn3HaDCjo6njEHAMZSMtackI+fBrf16Nkg==
From: Marek Vasut <marex@nabladev.com>
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marex@nabladev.com>,
	Michael Walle <mwalle@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Michael Walle <michael@walle.cc>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] clk: fsl-sai: Add MCLK generation support
Date: Sat,  4 Apr 2026 20:33:28 +0200
Message-ID: <20260404183419.46455-4-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260404183419.46455-1-marex@nabladev.com>
References: <20260404183419.46455-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The driver currently supports generating BCLK. There are systems which
require generation of MCLK instead. Register new MCLK clock and handle
clock-cells = <1> to differentiate between BCLK and MCLK. In case of a
legacy system with clock-cells = <0>, the driver behaves as before, i.e.
always returns BCLK.

Note that it is not possible re-use the current SAI audio driver to
generate MCLK and correctly enable and disable the MCLK.

If SAI (audio driver) is used to control the MCLK enablement, then MCLK
clock is not always enabled, and it is not necessarily enabled when the
codec may need the clock to be enabled. There is also no way for the
codec node to specify phandle to clock provider in DT, because the SAI
(audio driver) is not clock provider.

If SAI (clock driver) is used to control the MCLK enablement, then MCLK
clock is enabled when the codec needs the clock enabled, because the
codec is the clock consumer and the SAI (clock driver) is the clock
provider, and the codec driver can request the clock to be enabled when
needed. There is also the usual phandle to clock provider in DT, because
the SAI (clock driver) is clock provider.

Acked-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Michael Walle <michael@walle.cc>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
V2: No change
V3: - Rebase on current next, update mail address
    - Update commit message according to clarify the difference between
      SAI audio and SAI clock driver
    - Pick ancient AB from Michael, although this may be outdated
      https://patchwork.kernel.org/project/alsa-devel/patch/20241226162234.40141-4-marex@denx.de/
---
 drivers/clk/clk-fsl-sai.c | 74 ++++++++++++++++++++++++++++++++-------
 1 file changed, 61 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/clk-fsl-sai.c b/drivers/clk/clk-fsl-sai.c
index 336aa8477d0ea..f00b49edb2e9f 100644
--- a/drivers/clk/clk-fsl-sai.c
+++ b/drivers/clk/clk-fsl-sai.c
@@ -7,6 +7,7 @@
 
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/of.h>
@@ -15,21 +16,37 @@
 
 #define I2S_CSR		0x00
 #define I2S_CR2		0x08
+#define I2S_MCR		0x100
 #define CSR_BCE_BIT	28
+#define CSR_TE_BIT	31
 #define CR2_BCD		BIT(24)
 #define CR2_DIV_SHIFT	0
 #define CR2_DIV_WIDTH	8
+#define MCR_MOE		BIT(30)
 
 struct fsl_sai_clk {
-	struct clk_divider div;
-	struct clk_gate gate;
+	struct clk_divider bclk_div;
+	struct clk_divider mclk_div;
+	struct clk_gate bclk_gate;
+	struct clk_gate mclk_gate;
+	struct clk_hw *bclk_hw;
+	struct clk_hw *mclk_hw;
 	spinlock_t lock;
 };
 
 struct fsl_sai_data {
 	unsigned int	offset;	/* Register offset */
+	bool		have_mclk; /* Have MCLK control */
 };
 
+static struct clk_hw *
+fsl_sai_of_clk_get(struct of_phandle_args *clkspec, void *data)
+{
+	struct fsl_sai_clk *sai_clk = data;
+
+	return clkspec->args[0] ? sai_clk->mclk_hw : sai_clk->bclk_hw;
+}
+
 static int fsl_sai_clk_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -54,37 +71,68 @@ static int fsl_sai_clk_probe(struct platform_device *pdev)
 
 	spin_lock_init(&sai_clk->lock);
 
-	sai_clk->gate.reg = base + data->offset + I2S_CSR;
-	sai_clk->gate.bit_idx = CSR_BCE_BIT;
-	sai_clk->gate.lock = &sai_clk->lock;
+	sai_clk->bclk_gate.reg = base + data->offset + I2S_CSR;
+	sai_clk->bclk_gate.bit_idx = CSR_BCE_BIT;
+	sai_clk->bclk_gate.lock = &sai_clk->lock;
 
-	sai_clk->div.reg = base + data->offset + I2S_CR2;
-	sai_clk->div.shift = CR2_DIV_SHIFT;
-	sai_clk->div.width = CR2_DIV_WIDTH;
-	sai_clk->div.lock = &sai_clk->lock;
+	sai_clk->bclk_div.reg = base + data->offset + I2S_CR2;
+	sai_clk->bclk_div.shift = CR2_DIV_SHIFT;
+	sai_clk->bclk_div.width = CR2_DIV_WIDTH;
+	sai_clk->bclk_div.lock = &sai_clk->lock;
 
 	/* set clock direction, we are the BCLK master */
 	writel(CR2_BCD, base + data->offset + I2S_CR2);
 
-	hw = devm_clk_hw_register_composite_pdata(dev, dev->of_node->name,
+	hw = devm_clk_hw_register_composite_pdata(dev, "BCLK",
 						  &pdata, 1, NULL, NULL,
-						  &sai_clk->div.hw,
+						  &sai_clk->bclk_div.hw,
 						  &clk_divider_ops,
-						  &sai_clk->gate.hw,
+						  &sai_clk->bclk_gate.hw,
 						  &clk_gate_ops,
 						  CLK_SET_RATE_GATE);
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
 
-	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, hw);
+	sai_clk->bclk_hw = hw;
+
+	if (data->have_mclk) {
+		sai_clk->mclk_gate.reg = base + data->offset + I2S_CSR;
+		sai_clk->mclk_gate.bit_idx = CSR_TE_BIT;
+		sai_clk->mclk_gate.lock = &sai_clk->lock;
+
+		sai_clk->mclk_div.reg = base + I2S_MCR;
+		sai_clk->mclk_div.shift = CR2_DIV_SHIFT;
+		sai_clk->mclk_div.width = CR2_DIV_WIDTH;
+		sai_clk->mclk_div.lock = &sai_clk->lock;
+
+		pdata.index = 1; /* MCLK1 */
+		hw = devm_clk_hw_register_composite_pdata(dev, "MCLK",
+							  &pdata, 1, NULL, NULL,
+							  &sai_clk->mclk_div.hw,
+							  &clk_divider_ops,
+							  &sai_clk->mclk_gate.hw,
+							  &clk_gate_ops,
+							  CLK_SET_RATE_GATE);
+		if (IS_ERR(hw))
+			return PTR_ERR(hw);
+
+		sai_clk->mclk_hw = hw;
+
+		/* set clock direction, we are the MCLK output */
+		writel(MCR_MOE, base + I2S_MCR);
+	}
+
+	return devm_of_clk_add_hw_provider(dev, fsl_sai_of_clk_get, sai_clk);
 }
 
 static const struct fsl_sai_data fsl_sai_vf610_data = {
 	.offset	= 0,
+	.have_mclk = false,
 };
 
 static const struct fsl_sai_data fsl_sai_imx8mq_data = {
 	.offset	= 8,
+	.have_mclk = true,
 };
 
 static const struct of_device_id of_fsl_sai_clk_ids[] = {
-- 
2.53.0

