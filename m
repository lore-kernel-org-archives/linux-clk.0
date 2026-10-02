Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DB24FB9D7;
	Fri,  2 Oct 2026 16:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790959584; cv=none; b=og8ZnvEzm/NjujcLA4LzJ3wbTWd4OSKl9inwA72EftGTBOYKcnekQKGoX3OlbQaEiXYEf/zGYZZpD7z5RpV9GB4YF49mtr/PVRfkoCWpG3/ZzB6wNFPijyZFV3R8vARDjFn0muZzMOfcAY+ThdrBhKxY9bllMyApSbbRM8IEY7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790959584; c=relaxed/simple;
	bh=LG4B8H/JFW3y8OuWMRXnR/43MF87vZwCsTEpawcR5GQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=meE60PqHEKADdCTRnCyW4biZrSCDz9bzhsEmTBeFMjKjvoP5lLfTu/WqrRFM+htv8Sjn0GYeSW+AIIYzXU0ipnoQG/Z7yaVRYFGsv38DxddPF6Z8XLl6Xkd+YcPbAhJkwX7pJ0sBYsnu7s35WHwi9AQKSXCZkcVB7A4PT819OBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kor04R/6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kor04R/6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 13286C4AF0B;
	Fri,  2 Oct 2026 16:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790959584;
	bh=LG4B8H/JFW3y8OuWMRXnR/43MF87vZwCsTEpawcR5GQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Kor04R/69JCAaSdag/7+Xqj9d8R49g1Jorvc2QTXswpxccNNGwgalj36S26El7+N1
	 gujNwzwzBTC3eozKfHnQpiiaGOEWk9YLWfVAvJYkXL00FEGsJ5e0X8m+qFFIiSSNuU
	 ENjO4Yd6CLiJvpmHmHmK9lT7g6MrIyVxhWtriH99td3SYIl7Ibe7D9ncNmBWX+Nozq
	 6cRzdsWW2PuFYxw88OZvYhXdSSk9dRCyt2UCy0zKDalN+PETMWK3n+YajWJ8JpKCCV
	 HgpBz7uWQwJZDlHJkCWnljqqGbXZ3YYpMH8NK9Ir7RT5Qn+QS/Yj0mKBh3EET/rAwf
	 iuT/3lBxQXUHw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00805CA5FD4;
	Fri,  2 Oct 2026 16:46:24 +0000 (UTC)
From: Fabricio Akio via B4 Relay <devnull+fabricioakio.gmail.com@kernel.org>
Date: Fri, 02 Oct 2026 13:46:24 -0300
Subject: [PATCH v2] clk: qcom: mmcc-sdm660: enable the parents of the pixel
 clock sources
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-sdm660-pclk0-parent-enable-v2-1-b07f6c33e96f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBBFr0K6dkxbSS2uuIdhUdoBRqGQFomGc
 HcLXsDNT17y897KIgbCyG7ZygIuFGn0CeQpY7YzvkUgl5hJLpXgXEJ0g1IcJts/05qAfgb0pu4
 RtJAXWxh7FU6zJJgCNvQ+5Pfqx/FVP9DOu3F/dBTnMXyO+iL231+hRYAAp5pG60LkOeZlOxjqz
 3YcWLVt2xcB8Ktl1gAAAA==
X-Change-ID: 20261002-sdm660-pclk0-parent-enable-8123c9ac71d8
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Martin Botka <martin.botka@somainline.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Fabricio Akio <fabricioakio@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790959583; l=2766;
 i=fabricioakio@gmail.com; s=20260928; h=from:subject:message-id;
 bh=kzflGE+GMBXQHBY1TxBvdSXGEj0HNva0A5hK970gsxc=;
 b=ECK3P/V4x7sPrl9k06Vf1H+RcCFyHC7n6CRe9OlexbcWZOBxAMKBQW6jtvmStk7uOi43lfn2i
 aabiJIUzT12CSU0CUeLW4/0ogpT+kyqFrQ25qt6zr3IztmDPudDAT/D
X-Developer-Key: i=fabricioakio@gmail.com; a=ed25519;
 pk=TlMUT8bPI/ZQzp2q24BIQTb2qSx/jdUTBlGEXIRCm54=
X-Endpoint-Received: by B4 Relay for fabricioakio@gmail.com/20260928 with
 auth_id=1076
X-Original-From: Fabricio Akio <fabricioakio@gmail.com>
Reply-To: fabricioakio@gmail.com

From: Fabricio Akio <fabricioakio@gmail.com>

pclk0_clk_src and pclk1_clk_src are fed by the DSI PHY PLLs, which
dsi_pll_14nm_vco_set_rate() resets and only clk_prepare() restarts. The
DSI host sets the link rates before it prepares the PLL, so the RCG is
updated against a stopped source, and if it is enabled at that point
the update times out:

  pclk0_clk_src: rcg didn't update its configuration.

Seen on a board whose simple-framebuffer node lists the pixel clock:
the RCG then reads enabled at msm's first modeset.

Set CLK_OPS_PARENT_ENABLE on both so the core prepares the PLL around
the rate change, as dispcc-sm8250 does for its pixel clock sources since
commit acf7a91d0b0e ("clk: qcom: dispcc-sm8250: Enable parents for pixel
clocks").

Fixes: 5db3ae8b33de ("clk: qcom: Add SDM660 Multimedia Clock Controller (MMCC) driver")
Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
---
Tested on the Motorola Moto X4 (SDM630, payton) with the sdm660-mainline
7.2.y tree, sdm660_defconfig, DRM_MSM=m: without the flag the
pclk0_clk_src warning fires in most boots, with it never. At the stall
the RCG reads root-on and the PLL stopped. pclk1_clk_src is not
exercised here, nothing on this board drives DSI1. With the display
built in, clk_disable_unused() also prepares the PLL under this flag,
and some boots then log "DSI PLL lock failed".
---
Changes in v2:
- Set the flag on pclk1_clk_src as well, as Dmitry asked. v1 left it
  out because this board has nothing on DSI1 to test it with.
- Link to v1: https://patch.msgid.link/20261002-sdm660-pclk0-parent-enable-v1-1-d6ff889144e4@gmail.com
---
 drivers/clk/qcom/mmcc-sdm660.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/mmcc-sdm660.c b/drivers/clk/qcom/mmcc-sdm660.c
index 9f8b8e29fa0f..827741229dd7 100644
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
 
@@ -998,7 +999,8 @@ static struct clk_rcg2 pclk1_clk_src = {
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


