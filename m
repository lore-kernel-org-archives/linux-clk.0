Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC1437C112;
	Mon, 18 May 2026 02:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779073139; cv=none; b=BSThpnpkWESOrxmJ8DzCMTHxhmvUlezdHFf53az1p0uVxZ5lNtAiBetsPa7wZH5cALn4hOb4a28ccdmxppvgvPe+0t970g0zsGIUDP52j215P0EKNiy+Vt/fNz/zh9+j4JD2IYomaQvgbbof2suQXJQ1Dcon7yFgfabsK/6b9Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779073139; c=relaxed/simple;
	bh=glMTiY++tgALwLhBNGfpjYuRggBZLhInFSckW+5Ix54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IWE5zishPdEl65/HqIXhh5sIiL6P1VEOWuTpPo89k/9XyRz5O4qJDhN2BFfMUzW1CPZjgDK0rxIanTleDTx2j9AzOisQNFO24i/ivn1u0lFF6QIhjUyRyM2NUFd3W2aD3KGboR7Av+G+y+uvKoVWfzFNGIGxfr5fzN9N5VosZbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jdn4qGUJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jdn4qGUJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F4A5C2BCB3;
	Mon, 18 May 2026 02:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779073139;
	bh=glMTiY++tgALwLhBNGfpjYuRggBZLhInFSckW+5Ix54=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Jdn4qGUJ093iqa6byfUuPKv+ZEfIiA15pvmTXxxuGoAkEew7EWOLaZEYn2ETiVQLS
	 2/T9tliso6CLyox925kQUIQyRS1ui97ShUwXnoAqpBVBwnjWEwJBJHf2czV1T7jbE5
	 pl/oY81XrqNnmUN0EGXmvcdH1Lr+SmEM0ti60OJRhioyCgfdjr9MngNssjwSSi4HqV
	 FfuOp5t/n+/yGvOtoxq5FfGHk/qhnMQ9teatGIWj2rTLKSjZKdEi37Cq/1/cFtK+UP
	 VoKtuRz+zqtuZL9Z+K5wFFC4aoDWR7Rprx/hoGf6LJVVuYQRVDQJ7J6PzCbj+vgdHT
	 Q9AwTwIYKSSKQ==
From: Yixun Lan <dlan@kernel.org>
Date: Mon, 18 May 2026 02:58:36 +0000
Subject: [PATCH 1/2] clk: spacemit: k3: fix USB2 bus clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-06-clk-reset-usb-fix-v1-1-14fc235e692b@kernel.org>
References: <20260518-06-clk-reset-usb-fix-v1-0-14fc235e692b@kernel.org>
In-Reply-To: <20260518-06-clk-reset-usb-fix-v1-0-14fc235e692b@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>, Junzhong Pan <panjunzhong@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1380; i=dlan@kernel.org;
 h=from:subject:message-id; bh=glMTiY++tgALwLhBNGfpjYuRggBZLhInFSckW+5Ix54=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqCoBnvVc5VsIJY3iE7FPBru751ARzOjXHZta3g
 EHS7zkv1NWJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCagqAZxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0lRxAAjzNNR56QG+N0hHf62fCU46L0GxPSLvwT7VcYBb/LLr7AuTJYWBV4B
 pW6hC1Nv6mw8e2AMyV2awse1vGq2jsvN2HRpSFpg2S9c660o844B4pagh8sj5HZA0jKFKgGEufy
 s4O8t6I+604uJ8TN5FSjBZn42rlUS3bXE0zNGJIsqQENFp3eR7U+SwIOsJuyVnMMc5olaJ82/lq
 8UTO9fSxjNjwiV1PPAopa5/VbBmu468pybNPuRfFBCyDU0ZsvOKGmcGWV/+fvXMGk7j1Q5VeWrB
 SGVox32S/Qge6gI4OZBNp8YSK4+9wgi54jv1a4IJvUjwoTyUS2WNr4bjT9NblDQsLGiHBIRaIPt
 I4dEpjdAegU0GB/AEI+aWrqteb4VQ6BRB1PsOsu+8jG/SV6kgT35pMVsbmLq7boOgC6w2jT1OaV
 YEcCiCYR2Rf8O7TWA7EUTf3KT1luOTBSyLI8GF3qYNqNgltiWzOpmBw4Pv0VUY1BitciFVW29aa
 5N/h5MML++IuKZ/onDaIi4QvMVnxlXtqZMKksZ/zeTQmp8wHYiVYBMNw1zehTqmh9O2P67sIV6M
 nwYicZDGkj5fa/xBXdX7tZvOjjk+utWV53Qgc6XnQtRD+bUVTers1uBZd3e29abCv+EhfVblMAj
 80S8aio8BojPVrVeVpo+GM7HKsGqIE=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

According to SpacemiT K3's updated docs, the USB2 ahb reset and USB2 bus
clock enable bit was wrongly swapped, the correct one should be:

Register : APMU_USB_CLK_RES_CTRL
bit[1]   : usb2_port_bus_clk_en
bit[0]   : usb2_port_ahb_rstn

Fixes: e371a77255b8 ("clk: spacemit: k3: add the clock tree")
Reported-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 drivers/clk/spacemit/ccu-k3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
index e98afd59f05c..3d430f11d608 100644
--- a/drivers/clk/spacemit/ccu-k3.c
+++ b/drivers/clk/spacemit/ccu-k3.c
@@ -777,7 +777,7 @@ static const struct clk_parent_data sdh2_parents[] = {
 CCU_MUX_DIV_GATE_FC_DEFINE(sdh2_clk, sdh2_parents, APMU_SDH2_CLK_RES_CTRL, 8, 3,
 			   BIT(11), 5, 3, BIT(4), 0);
 
-CCU_GATE_DEFINE(usb2_bus_clk, CCU_PARENT_HW(axi_clk), APMU_USB_CLK_RES_CTRL, BIT(0), 0);
+CCU_GATE_DEFINE(usb2_bus_clk, CCU_PARENT_HW(axi_clk), APMU_USB_CLK_RES_CTRL, BIT(1), 0);
 CCU_GATE_DEFINE(usb3_porta_bus_clk, CCU_PARENT_HW(axi_clk), APMU_USB_CLK_RES_CTRL, BIT(4), 0);
 CCU_GATE_DEFINE(usb3_portb_bus_clk, CCU_PARENT_HW(axi_clk), APMU_USB_CLK_RES_CTRL, BIT(8), 0);
 CCU_GATE_DEFINE(usb3_portc_bus_clk, CCU_PARENT_HW(axi_clk), APMU_USB_CLK_RES_CTRL, BIT(12), 0);

-- 
2.54.0

