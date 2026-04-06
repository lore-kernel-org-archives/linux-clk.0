Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F33839F191;
	Mon,  6 Apr 2026 21:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775512324; cv=none; b=NzH8o3SiAqO2woDsYjid314X4TfYr/arE/Munkk7bN9gNsao4fgc4QMJBRETN4m9V2PtblEA4BncvdX18qOWkjIajXV41w1siIXMLYNeykCp+32Wpry38JNo3zDeUvAyK8fuLT9iGjoi77q692zDfP3RQfSuppVb/+tczf+AEdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775512324; c=relaxed/simple;
	bh=Tsp2VR5a/BVqXUS+D6uD9YZ7wmoTWc4ZoawX+HsZmis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Es1ZgA7SzT0/jaBuRXqVkn0KYDjPTDugyzsv1XqT1znsJy6NCU/iREPG+ODc8kNwjUhtTCU2VQ8g/A/c3Clcit06PxvKNSGYRLG+1e1s0deUR7fR8Kb0h8+uiQJFmIhB89xOJajNKaTUXSJN5NL/1HBn/TGupOpDhUlczgEenbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=jeB/Umwg; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="jeB/Umwg"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4F0AE1132E6;
	Mon,  6 Apr 2026 23:52:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1775512321; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=HtflVnw78gzl8NQ0LARrYiBGFxsQ0zJadwHDRpFcL2A=;
	b=jeB/Umwgfl4qWkWwH6ZVgWmDjNgPfQ8IphMQcj0pBY7HGtKGDzsLZHP9MUQEA0X5RQ/pNv
	mwHKqDYD2bCmSveRn6KN1F4tBC3SbQ/xImKRyhoZNsUDcCBRzZiEjEitPWefshm+lZL103
	o8JPoJt9NwVu2oyWcFC4u4oRRHCorRnzIClKvj0mbOI4CKrK87zadvmVB3EaVt3WaEed/7
	ko/ymSCtgH568AakSm0don813ieJbhksE3k8bkBdSYpBTNS0STDAvP6F/CQ/eQnALzKCIC
	uO9GdzQBAdzfIdzloben5yyFdSatUFM4zGLoWYfrKybtRfbjfr7qr5imq5xcpg==
From: Marek Vasut <marex@nabladev.com>
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marex@nabladev.com>,
	Michael Walle <mwalle@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Michael Walle <michael@walle.cc>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/6] clk: fsl-sai: Add MCLK generation support
Date: Mon,  6 Apr 2026 23:49:46 +0200
Message-ID: <20260406215150.176599-6-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406215150.176599-1-marex@nabladev.com>
References: <20260406215150.176599-1-marex@nabladev.com>
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
Cc: Brian Masney <bmasney@redhat.com>
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
V4: Use the fsl_sai_clk_register() helper.
---
 drivers/clk/clk-fsl-sai.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-fsl-sai.c b/drivers/clk/clk-fsl-sai.c
index 7ec9a4f22735c..386ee5f77a986 100644
--- a/drivers/clk/clk-fsl-sai.c
+++ b/drivers/clk/clk-fsl-sai.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -15,22 +16,37 @@
 
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
 	struct clk_divider bclk_div;
+	struct clk_divider mclk_div;
 	struct clk_gate bclk_gate;
+	struct clk_gate mclk_gate;
 	struct clk_hw *bclk_hw;
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
 static int fsl_sai_clk_register(struct device *dev, void __iomem *base,
 				spinlock_t *lock, struct clk_divider *div,
 				struct clk_gate *gate, struct clk_hw **hw,
@@ -104,15 +120,28 @@ static int fsl_sai_clk_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, hw);
+	if (data->have_mclk) {
+		ret = fsl_sai_clk_register(dev, base, &sai_clk->lock,
+					   &sai_clk->mclk_div,
+					   &sai_clk->mclk_gate,
+					   &sai_clk->mclk_hw,
+					   CSR_TE_BIT, MCR_MOE, I2S_MCR,
+					   "MCLK");
+		if (ret)
+			return ret;
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

