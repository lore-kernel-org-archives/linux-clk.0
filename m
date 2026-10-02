Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E30A4AB1D0;
	Fri,  2 Oct 2026 13:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790949336; cv=none; b=I0lRDAim1vPNzmtKHLKuPDpZy3lgazKbYpIVLLbWclmmjZ16XpeeMsLZXtKaY0mP7E0tjLy+l9W9f4U/s/LqydoT1ILxTM6SLeML/ax89UeLiS+blAtidAxltsoVYd1dqNx+t2isMmt7Vq+t6rPjydM8AY0QdwJAqlTYAiCpag8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790949336; c=relaxed/simple;
	bh=2kzDVsObb9Ct7NqxEGSKl9YO7zCZZOw64eoh61FFWFE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fMO94VCZuuUi96fIzz6KlAW/5Qve/9BSRgQB/I7ZKdVCuqe/q+pr4i7qTKzZi8SCUtUDyaklgjbqwowsxEhnsXZPQs6YgxDnFQg+Uq4CykegZRJ/pjFPU8BTiOQBpPe2iw6GHa7GbGy6/IXu47k0G8Ly2/tLJEKu5vAevq6MdhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pW6YdM+W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pW6YdM+W"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AE8A8C2BCF4;
	Fri,  2 Oct 2026 13:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790949335;
	bh=2kzDVsObb9Ct7NqxEGSKl9YO7zCZZOw64eoh61FFWFE=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=pW6YdM+WvVGykGKjKzhZolfJ54Qxctosma1cJ9ajYvWBVQv9QpZF3dEzMR5tC4DAn
	 y0QT4fF3PmovpcqTlriTD9U6K8W7fpUHVm/FMl3u7+P1qGjKsKQ7PNHZ6wofo21Wzl
	 6DYvY8e8TwSJ3TCbYdzVKAfO8u+IxKY3zBtaQ8hlfcseXbZvZqGuQMXpuS4jxZT3Wr
	 IZmS9tzWQz7VwgJToRTWKGfSnh2kIinfZtKMHLlMugBrgQkvUK60KjTxuq99L8tB5i
	 9G33drQ9Lt+OX7BfEirt0ir9Hz4rhaQGqWsJVp2G3VKquoJKwbo795jkW8DYICoGJi
	 9mkfcjesF0oeA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D1C9CA5FC4;
	Fri,  2 Oct 2026 13:55:35 +0000 (UTC)
From: Fabricio Akio via B4 Relay <devnull+fabricioakio.gmail.com@kernel.org>
Date: Fri, 02 Oct 2026 10:55:35 -0300
Subject: [PATCH] clk: qcom: mmcc-sdm660: enable the parent when
 pclk0_clk_src changes rate
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-sdm660-pclk0-parent-enable-v1-1-d6ff889144e4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBA0auQWTtJW5MCXsW4KNNBR7CQDhgTw
 t2tuPnJ2/wNlLOwwqXaIPNbVKZUYE8V0COkO6PEYnDGeWuMQ40v7w3ONA6lIXNakFPoRsbGujO
 1gWobGyiDOXMvn2N+vf2ta/dkWn5H2PcvDq8Y634AAAA=
X-Change-ID: 20261002-sdm660-pclk0-parent-enable-8123c9ac71d8
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Fabricio Akio <fabricioakio@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790949334; l=2042;
 i=fabricioakio@gmail.com; s=20260928; h=from:subject:message-id;
 bh=UJ72pjAY0/NNTs1ZuCPwUI9TXq4wpNAkoyf3mD77/xY=;
 b=q2cfb5tDrUIFY55Z+7QVGgYP4ymbCdvNt/yDM1AvYKXiImd30fBS1SfmZrBLMZyH6mVSYOmVz
 jTqdTQ9cP7QB6CEHYpRhwCdDPyOpOji7iXh75dE1bDQt8n7omv5DrEI
X-Developer-Key: i=fabricioakio@gmail.com; a=ed25519;
 pk=TlMUT8bPI/ZQzp2q24BIQTb2qSx/jdUTBlGEXIRCm54=
X-Endpoint-Received: by B4 Relay for fabricioakio@gmail.com/20260928 with
 auth_id=1076
X-Original-From: Fabricio Akio <fabricioakio@gmail.com>
Reply-To: fabricioakio@gmail.com

From: Fabricio Akio <fabricioakio@gmail.com>

pclk0_clk_src is fed by the DSI PHY PLL, which
dsi_pll_14nm_vco_set_rate() resets and only clk_prepare() restarts. The
DSI host sets the link rates before it prepares the PLL, so the RCG is
updated against a stopped source, and if it is enabled at that point
the update times out:

  pclk0_clk_src: rcg didn't update its configuration.

Seen on a board whose simple-framebuffer node lists the pixel clock:
the RCG then reads enabled at msm's first modeset.

Set CLK_OPS_PARENT_ENABLE so the core prepares the PLL around the rate
change, as dispcc-sm8250 does for its pixel clock sources since
commit acf7a91d0b0e ("clk: qcom: dispcc-sm8250: Enable parents for pixel
clocks").

Fixes: 5db3ae8b33de ("clk: qcom: Add SDM660 Multimedia Clock Controller (MMCC) driver")
Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
---
Tested on the Motorola Moto X4 (SDM630, payton) with the sdm660-mainline
7.2.y tree, sdm660_defconfig, DRM_MSM=m: without the flag the warning
fires in most boots, with it never. At the stall the RCG reads root-on
and the PLL stopped. With the display built in, clk_disable_unused()
also prepares the PLL under this flag, and some boots then log "DSI PLL
lock failed".
---
 drivers/clk/qcom/mmcc-sdm660.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/mmcc-sdm660.c b/drivers/clk/qcom/mmcc-sdm660.c
index 9f8b8e29fa0f..bc95d0de75a3 100644
--- a/drivers/clk/qcom/mmcc-sdm660.c
+++ b/drivers/clk/qcom/mmcc-sdm660.c
@@ -984,7 +984,8 @@ static struct clk_rcg2 pclk0_clk_src = {
 		.parent_data = mmcc_xo_dsi0pll_dsi1pll,
 		.num_parents = ARRAY_SIZE(mmcc_xo_dsi0pll_dsi1pll),
 		.ops = &clk_pixel_ops,
-		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
+		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE |
+			 CLK_OPS_PARENT_ENABLE,
 	},
 };
 

---
base-commit: 9f24d789f03b22941b905ded43cb5ff8eea9ce62
change-id: 20261002-sdm660-pclk0-parent-enable-8123c9ac71d8

Best regards,
--  
Fabricio Akio <fabricioakio@gmail.com>


