Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3614EFFDF;
	Mon, 28 Sep 2026 17:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617367; cv=none; b=SlnrCe6rVF+UfSlIJjc/LS9t3ofQeVvakl2TrsuVwRw6Yeiwc0WJ1Km1X8fjITMhRLMz/H4TQDkvZ7ztxOSdE/YW+v8WOFMP7Ebb4j0U8K2hMlLHjgmxq1PKqZ0EIKTYPC5E1sdSb/xm3eMayhECQ4MdZBni/VjAtkyuuOHJPZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617367; c=relaxed/simple;
	bh=W2URczCmLdiuWZ87D8lvF17ekZhjI8ZDB4wY4UzDzPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QGK5gTgm+3GBfD1S3x7xBs+g+LLmu1mith2zGVvbM99MXK19/lKBO/PZ4AsYIFKOBNKHXh4kC0ArOO++GQpkal9+Kc9oh0sFKE5m7axNNEKDm32LdammpXh7+1NDG/yz+sYZgp+J1TKcC7F7h9tLWLqSdN3OHMAjA2rkZBzWvMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RM/pWcst; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RM/pWcst"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D259C4AF18;
	Mon, 28 Sep 2026 17:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790617367;
	bh=W2URczCmLdiuWZ87D8lvF17ekZhjI8ZDB4wY4UzDzPU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RM/pWcstWH4w2aX1NiMtmLOJapRKwgfd1HVgVDeQcX3Uxi5j/Bvk1+OTTrfejUH/Y
	 eKjMffsoqTzYEaOlyA6s35fbIEYqlNGsjK/pR4sddA2oxXqFLY45GCueK2bTCRifV+
	 0USQ9RRom1RJFW5PMUWp4ogugFYXagcrbgmOtm2yi9qfJqNzMcwq3ksJH0hpvGX8X9
	 o9SlixqEWom7z0hEx+4qVAllgbbxeJW3rT+5obAN5xDoPnftuCGlrDd+AvHcYiBFt/
	 bThIWsm4xN1+A4YbzASa1/JfejxzzFZQAUiLjfREF/6KYBDYpRCHMUhptssCYXtK+X
	 NeKdL0VaZ1W4Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FAC1CA5FA3;
	Mon, 28 Sep 2026 17:42:47 +0000 (UTC)
From: Fabricio Akio via B4 Relay <devnull+fabricioakio.gmail.com@kernel.org>
Date: Mon, 28 Sep 2026 14:41:44 -0300
Subject: [PATCH 2/2] clk: qcom: mmcc-sdm660: set num_parents on
 mdss_axi_clk
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-sdm660-clk-fixes-v1-2-5d5bb84e3258@gmail.com>
References: <20260928-sdm660-clk-fixes-v1-0-5d5bb84e3258@gmail.com>
In-Reply-To: <20260928-sdm660-clk-fixes-v1-0-5d5bb84e3258@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Fabricio Akio <fabricioakio@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790617365; l=1035;
 i=fabricioakio@gmail.com; s=20260928; h=from:subject:message-id;
 bh=E76jx8Xg+uatx7H1ZWR6OZh0it0AFLP8sb6gWPX154o=;
 b=omde6j8vrZlLSsRLdN9YtMrwk04vNyCekaKnMzoJplH7evhVL7piwyAvXhzLdBd2uO5h01x0s
 GPCyItcDNskCq5B4KiHhMV9hoMhGuV+U5LzB7fMr381sGsJREgLxS3R
X-Developer-Key: i=fabricioakio@gmail.com; a=ed25519;
 pk=TlMUT8bPI/ZQzp2q24BIQTb2qSx/jdUTBlGEXIRCm54=
X-Endpoint-Received: by B4 Relay for fabricioakio@gmail.com/20260928 with
 auth_id=1076
X-Original-From: Fabricio Akio <fabricioakio@gmail.com>
Reply-To: fabricioakio@gmail.com

From: Fabricio Akio <fabricioakio@gmail.com>

mdss_axi_clk names axi_clk_src in parent_hws but leaves num_parents at
zero, so the array is never read and the branch registers as a root
clock -- no rate of its own, and no reference on its parent:

  axi_clk_src   en=0 rate=384000000
  mdss_axi_clk  en=1 rate=0

It is the only branch in this driver missing the field.

Fixes: 5db3ae8b33de ("clk: qcom: Add SDM660 Multimedia Clock Controller (MMCC) driver")
Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
---
 drivers/clk/qcom/mmcc-sdm660.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/mmcc-sdm660.c b/drivers/clk/qcom/mmcc-sdm660.c
index 9f8b8e29fa0f..433f5954eb91 100644
--- a/drivers/clk/qcom/mmcc-sdm660.c
+++ b/drivers/clk/qcom/mmcc-sdm660.c
@@ -2064,6 +2064,7 @@ static struct clk_branch mdss_axi_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "mdss_axi_clk",
 			.parent_hws = (const struct clk_hw *[]){ &axi_clk_src.clkr.hw },
+			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},

-- 
2.55.0


