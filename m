Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2A3285072;
	Thu, 30 Apr 2026 10:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777545077; cv=none; b=gDUFZw7boEgS8Mn5xvXvWgLDWSyboyD4lsqM8ESVv7LsqMrIPWpaxBhjkHQXzWK64mLbBTVFZtuyUFRaplc0ajqt7IIzTWG6F5xowCd/gd4FZeg5QfzsivCh79+1e08yMHZJdFcnPGsgMvcXHJxzl9oaOkBwR1/DZT+j8Fipk3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777545077; c=relaxed/simple;
	bh=0hL8QmJznMFL7fjhjp0jS5VvDwviOUJ8jc36396/SQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YaIAHSmM+vDAMjzd8gR5SMkLZSffP8h7l0J8GQuFAn5W5n0oKnJnamI6OoN8L6bshaCsn3DxwM2LrmxEFTL2OnRxqMfmCDVZ3J+a2dg0ZSzZCfLz5MZeTnkj1KS6V1LrbrxVqW95zHi51/qOCbY/UjwgXiK59EdnuyCK0Gqbljc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KRd3tdRa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KRd3tdRa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7933EC2BCB3;
	Thu, 30 Apr 2026 10:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777545077;
	bh=0hL8QmJznMFL7fjhjp0jS5VvDwviOUJ8jc36396/SQM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KRd3tdRalN0wvzVqkdTxcN68y724lsVZ6msGTkoqj9fg955iv86PS120Rte7lLcmx
	 XBo8F3KKOrvzdt+niuP2NALCnw+BrlQWnrxol75t1vwiuj0ggPPpVbxzT6FtyPBhJw
	 FxnMkUBx2fl7E2F8hyhk+31QbikrYUOR6p9MHaJIGQUY70S0u59kmxn2iL/y/a+vrU
	 kowpZBXj77ILXddOO/XEWTpXvJgv+MD3Sy8SsRJMvTSfnH4iwZYgTRZQoUH+I3oqgq
	 xHOSyrh+tkOK/11KNfynTStVSXglioI34U9E0dlqahFjg7hpNmqQy/B886KalE+ng2
	 LtE/pueZE9O3w==
From: Yixun Lan <dlan@kernel.org>
Date: Thu, 30 Apr 2026 10:30:28 +0000
Subject: [PATCH 3/4] clk: spacemit: k3: Switch to pll2_d6 as parent for
 PCIe clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-06-pci-clk-fix-v1-3-32fdc77c02ab@kernel.org>
References: <20260430-06-pci-clk-fix-v1-0-32fdc77c02ab@kernel.org>
In-Reply-To: <20260430-06-pci-clk-fix-v1-0-32fdc77c02ab@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3177; i=dlan@kernel.org;
 h=from:subject:message-id; bh=0hL8QmJznMFL7fjhjp0jS5VvDwviOUJ8jc36396/SQM=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBp8y9ZNVwEggvuhhjAjcA+7744Uek7q8h5cIG00
 zCqqYMo43+JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCafMvWRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2nWw/+KGor7vBHizlsZkVuvectfrs5ZQdGJqxyECFf1DCN05f4C052E0ayn
 vxt8jkVBzmCLNq0NEWBsODmvywYfmQH56xZANZBqmR57VRS1LIxzlnu/cvLuFnTjybp65wBAvnE
 PqWuGlnZwzlbTgifrY8Qkgnh3p3SknXZtWgaQDaoGQ+zijO70aBZLHdbWRsAHhpGPxtVd/wHuvM
 YenocpUyMZtlcE9Wsj7t7GzPfJDqKrrBI2Xj/MLFWnEmHMvTi3uLvuh4/JKQoXXx4B1d8W/7H13
 7CyX9dT1nafcshh6Kzve1IF8fehmXxjt0qaCHDgb1aNUWL8fHT2beiuJNO+EdIaY6zfZYIwWkX/
 TmvDkh7doL/y8HZsLNO42gqeLLiZA2in7C4NRX4fPWkVrqjO6auOx2dI/WLbmNqa8+mvcKFDsHA
 O63/V+PRWTUleE3e87q0dt/NqPoE8isxS9xadOYqt9TiqrSaUZvKx+0m5vnXDm7AZ82M47L2v6r
 bjt8n2+b7P4SsI3OCG8e9/SPYVRZIaYoRxH4LU0nBnE+Cc6+fHvPxte6kOJZjlTUESJsEKpY8bb
 BR4zQRfQ/UAtdKcN4UJTxVb5gQM4QYr2UBVJV7xo+GeFts8/GVO1KRHS7WolZtP7wUqI3tW4cWW
 igwRnSf5G3ep0EMX/POSX62esp2WJA=
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
index bd60c0d776b4..196d32194125 100644
--- a/drivers/clk/spacemit/ccu-k3.c
+++ b/drivers/clk/spacemit/ccu-k3.c
@@ -947,20 +947,20 @@ static const struct clk_parent_data edp1_pclk_parents[] = {
 };
 CCU_MUX_GATE_DEFINE(edp1_pxclk, edp1_pclk_parents, APMU_LCD_EDP_CTRL, 18, 1, BIT(17), 0);
 
-CCU_GATE_DEFINE(pciea_mstr_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_A, BIT(2), 0);
-CCU_GATE_DEFINE(pciea_slv_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_A, BIT(1), 0);
+CCU_GATE_DEFINE(pciea_mstr_clk, CCU_PARENT_HW(pll2_d6), APMU_PCIE_CLK_RES_CTRL_A, BIT(2), 0);
+CCU_GATE_DEFINE(pciea_slv_clk, CCU_PARENT_HW(pll2_d6), APMU_PCIE_CLK_RES_CTRL_A, BIT(1), 0);
 CCU_GATE_DEFINE(pciea_dbi_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_A, BIT(0), 0);
-CCU_GATE_DEFINE(pcieb_mstr_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_B, BIT(2), 0);
-CCU_GATE_DEFINE(pcieb_slv_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_B, BIT(1), 0);
+CCU_GATE_DEFINE(pcieb_mstr_clk, CCU_PARENT_HW(pll2_d6), APMU_PCIE_CLK_RES_CTRL_B, BIT(2), 0);
+CCU_GATE_DEFINE(pcieb_slv_clk, CCU_PARENT_HW(pll2_d6), APMU_PCIE_CLK_RES_CTRL_B, BIT(1), 0);
 CCU_GATE_DEFINE(pcieb_dbi_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_B, BIT(0), 0);
-CCU_GATE_DEFINE(pciec_mstr_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_C, BIT(2), 0);
-CCU_GATE_DEFINE(pciec_slv_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_C, BIT(1), 0);
+CCU_GATE_DEFINE(pciec_mstr_clk, CCU_PARENT_HW(pll2_d6), APMU_PCIE_CLK_RES_CTRL_C, BIT(2), 0);
+CCU_GATE_DEFINE(pciec_slv_clk, CCU_PARENT_HW(pll2_d6), APMU_PCIE_CLK_RES_CTRL_C, BIT(1), 0);
 CCU_GATE_DEFINE(pciec_dbi_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_C, BIT(0), 0);
-CCU_GATE_DEFINE(pcied_mstr_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_D, BIT(2), 0);
-CCU_GATE_DEFINE(pcied_slv_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_D, BIT(1), 0);
+CCU_GATE_DEFINE(pcied_mstr_clk, CCU_PARENT_HW(pll2_d6), APMU_PCIE_CLK_RES_CTRL_D, BIT(2), 0);
+CCU_GATE_DEFINE(pcied_slv_clk, CCU_PARENT_HW(pll2_d6), APMU_PCIE_CLK_RES_CTRL_D, BIT(1), 0);
 CCU_GATE_DEFINE(pcied_dbi_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_D, BIT(0), 0);
-CCU_GATE_DEFINE(pciee_mstr_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_E, BIT(2), 0);
-CCU_GATE_DEFINE(pciee_slv_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_E, BIT(1), 0);
+CCU_GATE_DEFINE(pciee_mstr_clk, CCU_PARENT_HW(pll2_d6), APMU_PCIE_CLK_RES_CTRL_E, BIT(2), 0);
+CCU_GATE_DEFINE(pciee_slv_clk, CCU_PARENT_HW(pll2_d6), APMU_PCIE_CLK_RES_CTRL_E, BIT(1), 0);
 CCU_GATE_DEFINE(pciee_dbi_clk, CCU_PARENT_HW(axi_clk), APMU_PCIE_CLK_RES_CTRL_E, BIT(0), 0);
 
 static const struct clk_parent_data emac_1588_parents[] = {

-- 
2.53.0

