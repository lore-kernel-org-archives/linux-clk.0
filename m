Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E433A16AB;
	Mon, 11 May 2026 12:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778503657; cv=none; b=JUyr+1roe0nRE6uW5li4GLBULI3aVeQSDAmHrtV6l8UwQPdCiXbanCfzBvxUEnnS+5ezkDkFbnp8qzy1c/LLMwhS8yVGHXDXTL4QgmyuARU8vTpaUohFqR+mKZEeNrR0iLeSVd0EPZ1lpF6J1aVm+sbt8n8SqV44bLCvrcxg8Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778503657; c=relaxed/simple;
	bh=Apb4S2Jq8LIpHTHjJayHCM7ik9Uly3uNsSNFkwFnHLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hTBVplHh97nwG1vozet1mImazrUu/+GJj20I8ALNkVN0g3RzatzE1qjnU7ULv1KjhSBl5sqqgcvWhD2PcRXVxbaiFZxWyUq+BLNqaBNEZLjrU0CbcUim84K/HvzcW5Wagx5iBM9Y99fWC4gJiA86dVThck2MnsHEzKdwRV32Mto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RV7qJIEy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RV7qJIEy"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8730EC2BD01;
	Mon, 11 May 2026 12:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778503657;
	bh=Apb4S2Jq8LIpHTHjJayHCM7ik9Uly3uNsSNFkwFnHLE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RV7qJIEyAxu9FeFI/E2hTCz/ZEaWajN2I9N/p6MCVuSc0xfufNGXALusiGHZR+v4m
	 zC+IU18CyV0nAvDYdCRoc/7xu8F5lUtr33ieMNqaNxlz3cduBb2hASq4Z1DNUR1Ddm
	 GUi7PISASTGUiM5OCAoAiK04Qy89XWpIAuhuq0BYIeOtFvKOvzcIQmqrTNt3rqxkOi
	 ENIBh9qEFi7SpJ+tmk6mYCj0AepKyq7DQKgxtgIC7BZCEPGxmuUXla/ugMKMgbVfHA
	 0efZ+A93WqJwA6L1kZJFFV2Fwty0FruXaMWIB1gKJzM40wDWUyWz/z/qF+MDpGRnwL
	 RqvmHMjLZ9Khg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E02ECD37AC;
	Mon, 11 May 2026 12:47:37 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Date: Mon, 11 May 2026 20:47:27 +0800
Subject: [PATCH 05/10] clk: amlogic: PLL l_detect signal supports
 active-high configuration
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-b4-a9_clk-v1-5-41cb4071b7c9@amlogic.com>
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
In-Reply-To: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Jian Hu <jian.hu@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778503655; l=1711;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=DXN+IQPJ4BKXUT+MsvhFjUrvj1rynvZ3xsZLA9vL75E=;
 b=xYUqx+WQEC8C0eWT8llqWOt68I4oN7NE6r3Glr5Ph/So3/wLTVAkTES95+7mvotxuaXyx8vQG
 SKinXt7bnDUBdwGt2ZpbVm4qaKXOnjov17nNSG0qVxzEjahD5ujrvak
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
Reply-To: jian.hu@amlogic.com

From: Jian Hu <jian.hu@amlogic.com>

l_detect controls the enable/disable of the PLL lock-detect module.

For A9, the l_detect signal is active-high:
0 -> Disable lock-detect module;
1 -> Enable lock-detect module.

Here, a flag CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH is added to handle cases
like A9, where the signal is active-high.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 drivers/clk/meson/clk-pll.c | 9 +++++++--
 drivers/clk/meson/clk-pll.h | 2 ++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 1ea6579a760f..5a0bd75f85a9 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -388,8 +388,13 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
 	}
 
 	if (MESON_PARM_APPLICABLE(&pll->l_detect)) {
-		meson_parm_write(clk->map, &pll->l_detect, 1);
-		meson_parm_write(clk->map, &pll->l_detect, 0);
+		if (pll->flags & CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH) {
+			meson_parm_write(clk->map, &pll->l_detect, 0);
+			meson_parm_write(clk->map, &pll->l_detect, 1);
+		} else {
+			meson_parm_write(clk->map, &pll->l_detect, 1);
+			meson_parm_write(clk->map, &pll->l_detect, 0);
+		}
 	}
 
 	if (meson_clk_pll_wait_lock(hw))
diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
index 949157fb7bf5..97b7c70376a3 100644
--- a/drivers/clk/meson/clk-pll.h
+++ b/drivers/clk/meson/clk-pll.h
@@ -29,6 +29,8 @@ struct pll_mult_range {
 
 #define CLK_MESON_PLL_ROUND_CLOSEST	BIT(0)
 #define CLK_MESON_PLL_NOINIT_ENABLED	BIT(1)
+/* l_detect signal is active-high */
+#define CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH	BIT(2)
 
 struct meson_clk_pll_data {
 	struct parm en;

-- 
2.47.1


