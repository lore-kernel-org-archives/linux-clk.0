Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3556641166B;
	Tue, 30 Jun 2026 12:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823999; cv=none; b=Vua1Ca8T7EUF+h28RtYG2B23w6pJ87Cmkg0E3alFsNKFT/tNkl/31+HQ/KqEaQxvoOLXd9WpKjA4/CqtfT+mecnn/bdqzW/pkx3L8ygrk4306OkxdWHA9j5cfK3+1kAulw2/vvJ3SyjGkYGyxPrHao3Ato78crOvUBonxJ0op2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823999; c=relaxed/simple;
	bh=cnv+dro6g/o2f7nGM4zI5C5UpZYNAQtm/R+vGOgu5mg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uRhm38y/RDlFrN1TMp61K/I64UQnPboPvz1P/+ipuRqo/Gc8TP49LMIHES6CfFOk2s0H5cyPFFXu49jUnJasprbhZmALDwEBTetS9yfu5YWOaVUXBgp6xoxaboedx+4K1xbpKfmNDk5sxYJEWfStnCXBsIWCFtH+2+QlRLg554w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TLv/UWN3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TLv/UWN3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD2F71F00A3A;
	Tue, 30 Jun 2026 12:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782823998;
	bh=quqKXaOY/defIjRmqlpmFrrkZp9Qyvv8wvLYUfMRkgc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TLv/UWN3CAeV6uXwH3EbVRAnpgw6kiMg7Yq8UqcDNmbUtPqP63zj7rrzQCmUojzKt
	 M0qIbVH2l43eT0MkIKElK5XG9040QFhd9XlhNZ2JNXq4oKwFf6EBdYTVHNyW8Vpfyi
	 u3Vh0adnLjhQ4OfuOlUpr0VGcPgBcqTm3isO4QPMFXTQxPmNlvnyR0tHSTYUygrFMo
	 NF62V08ySqx+8yYCIEF3uhsvUeaUxnbhd2nYs+hYCM/UiD9/RhtrKTtFn993Bcra/H
	 GBET2e+Civfwt2D7Q1chPDqxH9ynxxy19CDkxY00Zri0tpSFfoR5dVeFy+SBDItlWR
	 c5Li+PZXWUQ9A==
From: Yixun Lan <dlan@kernel.org>
Date: Tue, 30 Jun 2026 12:52:47 +0000
Subject: [PATCH 3/3] clk: spacemit: k3: Add UFS refclk clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-06-clk-ufs-support-v1-3-cf7521d1d0fe@kernel.org>
References: <20260630-06-clk-ufs-support-v1-0-cf7521d1d0fe@kernel.org>
In-Reply-To: <20260630-06-clk-ufs-support-v1-0-cf7521d1d0fe@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218; i=dlan@kernel.org;
 h=from:subject:message-id; bh=cnv+dro6g/o2f7nGM4zI5C5UpZYNAQtm/R+vGOgu5mg=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqQ7wsYcTfVh9d/UL94SxpyG3obN2aao1WIBGwj
 GtVg1z+n4KJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCakO8LBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2xxw//cr0AfxHPxyn4fD5bkV+IHBESEcc8l0lbe/ajtvkD0oRE38o9f9B9V
 MHYwIJjIS+wIJZBGdf5m07pXDtwf422sqPBJqH5qlz28FSxzYTCK9r2SndzUz0lEyf5mWnx/KH9
 2bUs3uTgeDiKv7rRcJBA8lyktZ583yfAsJTrjiaHodhbPTeUed+ICTmIPxs5L+owohoGHMRR5fv
 f49lQtt1sfkA1eKtHGWf76U//XLAam3wg7mGYeu+v5j1sXVGztcr2gHeF4J+/M28lH5DQUMa57K
 ngnS7Kt24jdzh98zuHvpgx0rfOnUzz+roi9HjlmamdwEHxauLgfR58ArrwZgL+AyHMQIpXersA9
 Qwmt9QKD1X9o4kMtckXiEMNGKAITWKWgXRq/l4vn2II5QfXBOqwIZp7wvc3W++dt2jWvVRw7VvG
 9TOksiiXMOAe8kpm9abAzf6S2G4mzIWs52PpfpIIlLk50TQsGr/sHbkRRC6/nu9SdLi30wB4LMx
 4h221xXKCMd7fX6K0oia+TyChOXJay0dpkzgEx7jwuiLc6wBt/gxIkh56CO+StB85s78/lRbNcA
 v6ske83tWiM79Yt75D7SO0tZpf3nFN9wIjKBt+dUa8nL2wxLc8T4gPE9snT9N5wNl6NCQGVRFnq
 /1hjg7bCkVWBO2s0m1MjhzLGJATnmY=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Add the UFS reference clock for SpacemiT K3 SoC.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 drivers/clk/spacemit/ccu-k3.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
index 42293a38b098..f47d26e1d642 100644
--- a/drivers/clk/spacemit/ccu-k3.c
+++ b/drivers/clk/spacemit/ccu-k3.c
@@ -934,6 +934,8 @@ static const struct clk_parent_data ufs_aclk_parents[] = {
 CCU_MUX_DIV_GATE_FC_DEFINE(ufs_aclk, ufs_aclk_parents, APMU_UFS_CLK_RES_CTRL, 5, 3, BIT(8),
 			   2, 3, BIT(1), 0);
 
+CCU_FACTOR_DEFINE(ufs_refclk, CCU_PARENT_HW(pll1_d64_38p4), 2, 1);
+
 static const struct clk_parent_data edp0_pclk_parents[] = {
 	CCU_PARENT_HW(lcd_pxclk),
 	CCU_PARENT_NAME(external_clk),
@@ -1391,6 +1393,7 @@ static struct clk_hw *k3_ccu_apmu_hws[] = {
 	[CLK_APMU_DSI4LN2_DPU_ACLK]	= &dsi4ln2_dpu_aclk.common.hw,
 	[CLK_APMU_DPU_ACLK]		= &dpu_aclk.common.hw,
 	[CLK_APMU_UFS_ACLK]		= &ufs_aclk.common.hw,
+	[CLK_APMU_UFS_REFCLK]		= &ufs_refclk.common.hw,
 	[CLK_APMU_EDP0_PXCLK]		= &edp0_pxclk.common.hw,
 	[CLK_APMU_EDP1_PXCLK]		= &edp1_pxclk.common.hw,
 	[CLK_APMU_PCIE_PORTA_MSTE]	= &pciea_mstr_clk.common.hw,

-- 
2.54.0

