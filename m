Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DF936BCDA;
	Mon, 11 May 2026 02:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778468374; cv=none; b=ddQg11tzuOTeAweQvCY23uzmhDHhp0B99tGDpq5YkXzppFyWFDNtDc5lkEuoci23PtuU48hTWJJ3Kcsi3kaax3c+kzC8ya+YUZW+JC+JGQJ7r3ogoWuOdPhwpxBLsqjZdGIrfCEjEc6jHJwwnEoKndloHgTNMBg1wZGcYk5oi5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778468374; c=relaxed/simple;
	bh=UA/S9cLsNrwPIyQx/17ZpDqEZXlb8oCbwx2AeLnP4tA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tlgMomyZxhfjjQAnwscKti6nsSNDIjQcfiqJwCEFiQf5j9fRruWZAzpjrVXZKsbUIqR+B2cvgIBkTQWhewq2/BKVuEyszCPPZhQDLztMUug/SHlWIUcywZDmIl4QN2WXli2pE6G9EH65XIdVMZjpp3ws1QA9itNl3X1N80+mFPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QuhIsEQB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QuhIsEQB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2898BC2BCC7;
	Mon, 11 May 2026 02:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778468373;
	bh=UA/S9cLsNrwPIyQx/17ZpDqEZXlb8oCbwx2AeLnP4tA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QuhIsEQBhLGMtCcs5+wQCR28fPvTvIkMsUdiTCNUQXfs6wV8K0Y2Y8VtV6QXy/W8g
	 7k60BcM0DUWWJvDRRFANzg/AjvRsd/xquOZCt7o0jHvxDsesQMntmKk6EXZwntNjk6
	 H9IFBeoodxyqTYyqZ3K9bU4K0e1RXsBxGVqMW2OjvYDB8gHVzDzEwc+YC39hWSQ5Yi
	 NOjxtBnKB9DruyTfPmIxWSTf1TxaPxStFVG+/9LVHxDMDUpNVnTXrpvz4mHVYJ/WSS
	 6UTG/5rqhViX4Opbwz8MAlC4j/QdSUK7SgsG1DGKbsKXamnN6e2xcZBubh9VQhZehW
	 rp2fU9IuYHEQw==
From: Yixun Lan <dlan@kernel.org>
Date: Mon, 11 May 2026 02:59:09 +0000
Subject: [PATCH v2 1/4] clk: spacemit: k3: Switch to pll2_d6 as parent for
 PCIe clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-06-pci-clk-fix-v2-1-c9a5e563bab3@kernel.org>
References: <20260511-06-pci-clk-fix-v2-0-c9a5e563bab3@kernel.org>
In-Reply-To: <20260511-06-pci-clk-fix-v2-0-c9a5e563bab3@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2734; i=dlan@kernel.org;
 h=from:subject:message-id; bh=UA/S9cLsNrwPIyQx/17ZpDqEZXlb8oCbwx2AeLnP4tA=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqAUYDNADeAp9EG+/1Pm7EgKZgd1gfP4VI92uxz
 s/PZNf2hyeJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCagFGAxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3vYw/9FsunmNwj3qzz/V6ypxizxz5gTJXnTB9Pp3PpSdt+yEmfej1n4T5AO
 ycBXb7QuWLxoEfLWiJHvx2idO2SH9J1e5HBNyIGVpkBj2ELf93Qahwlbh4UjNhOaXmqRs8TZtY/
 uILLoKnN9c+F3C208Mv8qnHMmBxpVSlu66VhP+VjqV0MC+flUMM4wNSwTFbUa689nvN9sSwDnZh
 G/vx+hTqU9uA7fDcgSnxNJjKGPxdmo1FbJoSW3tWFWhllzRa44UbmB0Z3l4xv03DJE+lYEi+nxM
 CFHXSqJrnbAe0fbHqThpMgVnZRxT0wqJV7xV6NuAnGUpSf0piwSUaShcL+DYO5B8EMwssZX0rLz
 7FE2UCjvkq8+i12AuTujox3HQR7nU6WAhEUAJvyk2JRKp89eco1Khc4VPcGzcGmcIN5Ne0+Dhg8
 WjUSD/G5pkGWsaT1w6ULHskE2MOXBz88xVFoAAh2wwImt9oX2+ZzF/yusCct2J97AfNh3LNFcAF
 4TQQHWwYiitrO8rfKl883FJaUJAE2UwzZwES3au3e5/8afiOXh+ui5qCTpRgi4ngeTqAcGzj2ir
 1TNYJekoNhisqpxiwmXX2VHTYTDsjmvzqNNUzjDiofHALLj4vGzosPYld0aJKOSmhoO7mhOJHK9
 6oRV0bU5lBp+049Qti8tdAAkmkniso=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

According to SpacemiT updated docs, the PCIe master and slave clock's
parent is the pll2_d6 clock, so fix it.

Fixes: e371a77255b8 ("clk: spacemit: k3: add the clock tree")
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 drivers/clk/spacemit/ccu-k3.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
index e98afd59f05c..8f0b743046ab 100644
--- a/drivers/clk/spacemit/ccu-k3.c
+++ b/drivers/clk/spacemit/ccu-k3.c
@@ -947,16 +947,16 @@ static const struct clk_parent_data edp1_pclk_parents[] = {
 };
 CCU_MUX_GATE_DEFINE(edp1_pxclk, edp1_pclk_parents, APMU_LCD_EDP_CTRL, 18, 1, BIT(17), 0);
 
-CCU_GATE_DEFINE(pciea_mstr_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_A, BIT(2), 0);
-CCU_GATE_DEFINE(pciea_slv_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_A, BIT(1), 0);
-CCU_GATE_DEFINE(pcieb_mstr_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_B, BIT(2), 0);
-CCU_GATE_DEFINE(pcieb_slv_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_B, BIT(1), 0);
-CCU_GATE_DEFINE(pciec_mstr_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_C, BIT(2), 0);
-CCU_GATE_DEFINE(pciec_slv_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_C, BIT(1), 0);
-CCU_GATE_DEFINE(pcied_mstr_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_D, BIT(2), 0);
-CCU_GATE_DEFINE(pcied_slv_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_D, BIT(1), 0);
-CCU_GATE_DEFINE(pciee_mstr_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_E, BIT(2), 0);
-CCU_GATE_DEFINE(pciee_slv_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_E, BIT(1), 0);
+CCU_GATE_DEFINE(pciea_mstr_clk, CCU_PARENT_HW(pll2_d6), APMU_PCIE_CLK_RES_CTRL_A, BIT(2), 0);
+CCU_GATE_DEFINE(pciea_slv_clk, CCU_PARENT_HW(pll2_d6), APMU_PCIE_CLK_RES_CTRL_A, BIT(1), 0);
+CCU_GATE_DEFINE(pcieb_mstr_clk, CCU_PARENT_HW(pll2_d6), APMU_PCIE_CLK_RES_CTRL_B, BIT(2), 0);
+CCU_GATE_DEFINE(pcieb_slv_clk, CCU_PARENT_HW(pll2_d6), APMU_PCIE_CLK_RES_CTRL_B, BIT(1), 0);
+CCU_GATE_DEFINE(pciec_mstr_clk, CCU_PARENT_HW(pll2_d6), APMU_PCIE_CLK_RES_CTRL_C, BIT(2), 0);
+CCU_GATE_DEFINE(pciec_slv_clk, CCU_PARENT_HW(pll2_d6), APMU_PCIE_CLK_RES_CTRL_C, BIT(1), 0);
+CCU_GATE_DEFINE(pcied_mstr_clk, CCU_PARENT_HW(pll2_d6), APMU_PCIE_CLK_RES_CTRL_D, BIT(2), 0);
+CCU_GATE_DEFINE(pcied_slv_clk, CCU_PARENT_HW(pll2_d6), APMU_PCIE_CLK_RES_CTRL_D, BIT(1), 0);
+CCU_GATE_DEFINE(pciee_mstr_clk, CCU_PARENT_HW(pll2_d6), APMU_PCIE_CLK_RES_CTRL_E, BIT(2), 0);
+CCU_GATE_DEFINE(pciee_slv_clk, CCU_PARENT_HW(pll2_d6), APMU_PCIE_CLK_RES_CTRL_E, BIT(1), 0);
 
 static const struct clk_parent_data emac_1588_parents[] = {
 	CCU_PARENT_NAME(vctcxo_24m),

-- 
2.54.0

