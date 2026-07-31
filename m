Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482D136F8F0;
	Fri, 31 Jul 2026 20:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785528649; cv=none; b=XNN7qMUGRTnLBm12Y16O1/vDT6+fOK4C3VUp5rLr9zjyaOookLa4w/XXIFbvZ8iOPI0CFhhfBeKABZqPjVc0CSoNkcl/rYMnT8dNu/2saGrXV5dIo9FGGRQtVw2Q1ZoYks1dde+l6eG9IL5dE4FZogbeeVDj5jZOhAlV48uf0vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785528649; c=relaxed/simple;
	bh=v/Wwhs9C29QjHbW1bSV59yh/8/MBs9P70QIe3ou74F4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vc0oTXNnOqgODDcDTOHkrtTMByVgO9x53gcUJTEkEEL/y6ilo18ZEnYVUaMWYK0ln7JQcsAMYDGIazFqUvLyRafIT5kAPez3qXfQ0o8K++B8zkckR/N10EPzHmO2vTu19f8DKzT8iny3dPG32TdbcGe/LCA3o4UfcQ53SvomrUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X0CVfZ/H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X0CVfZ/H"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E5725C2BCF6;
	Fri, 31 Jul 2026 20:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785528649;
	bh=v/Wwhs9C29QjHbW1bSV59yh/8/MBs9P70QIe3ou74F4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=X0CVfZ/HYyyU3HqxsUCn4043H9MvZG1+i2lXLFT3jNiAr4dzyusdR5sS/T6klhnqY
	 AFpowgDh8YreRyN/H4Wd7j2FoVas7cIwgOSFTfMxbpgL56ZkuI6dsEAMKk0Mfl+Dhf
	 CrNeGgDdLPXpFywK+U+DzKi/tNmq77oA9gVrWz7juma6syhYopfoASAsS4GSmGKxfv
	 dplaMWvOssL++sa8QKglNmVKABSQ4oK4Eoshb+mr8DLpOPU+YkXmnhiY0j5urjRgE6
	 27XECFViOT9Nn6OooBwqxRAAU5pGoLf9jrpYxh7VZV2CRKf99y0YceANv4qce1EpYc
	 S9p1nABExW6Ww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4363C55174;
	Fri, 31 Jul 2026 20:10:48 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Fri, 31 Jul 2026 22:08:20 +0200
Subject: [PATCH v10 1/4] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260731-msm8939-venus-rfc-v10-1-9ac503250fc7@apitzsch.eu>
References: <20260731-msm8939-venus-rfc-v10-0-9ac503250fc7@apitzsch.eu>
In-Reply-To: <20260731-msm8939-venus-rfc-v10-0-9ac503250fc7@apitzsch.eu>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: Erikas Bitovtas <xerikasxx@gmail.com>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785528647; l=1606;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=Zcl6BS6NSRBxGBTBPqhiSvFlL/mbr0G2alrt9SBdJ5A=;
 b=rzIaEPt57WcdIZPW/V7tFMVty/ab0yGQppF0pJQBFCgUbg0XTEJLE23TySOmDqtOtTOGeUrKN
 fqM0Q/SpiB6DNaV+pjibLKrv78wwQDVk+UWM2X0WCHZ9bQnCNtv3f0c
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: Erikas Bitovtas <xerikasxx@gmail.com>

Allow Venus core GDSCs to have their control passed to hardware, so they
can be powered on by Venus firmware and explicitly state that the vcodec
clocks' halt bit should be checked.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
[André: Update commit message]
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/clk/qcom/gcc-msm8939.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index ffd7f14fcbaf..3900a06189ff 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -3665,6 +3665,7 @@ static struct clk_branch gcc_venus0_vcodec0_clk = {
 
 static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
 	.halt_reg = 0x4c02c,
+	.halt_check = BRANCH_HALT,
 	.clkr = {
 		.enable_reg = 0x4c02c,
 		.enable_mask = BIT(0),
@@ -3682,6 +3683,7 @@ static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
 
 static struct clk_branch gcc_venus0_core1_vcodec0_clk = {
 	.halt_reg = 0x4c034,
+	.halt_check = BRANCH_HALT,
 	.clkr = {
 		.enable_reg = 0x4c034,
 		.enable_mask = BIT(0),
@@ -3754,6 +3756,7 @@ static struct gdsc venus_core0_gdsc = {
 	.pd = {
 		.name = "venus_core0",
 	},
+	.flags = HW_CTRL_TRIGGER,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -3762,6 +3765,7 @@ static struct gdsc venus_core1_gdsc = {
 	.pd = {
 		.name = "venus_core1",
 	},
+	.flags = HW_CTRL_TRIGGER,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 

-- 
2.55.0


