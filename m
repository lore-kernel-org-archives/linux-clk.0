Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4254F0536;
	Mon, 28 Sep 2026 17:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617367; cv=none; b=GeG+T8x8uHkfBsV5o4Y0LLjQpMmDLTrK9L2DCwpWSqt5k4KkSSFYDCeX9TcXZoKHnumzJSMbSwLj/Gqdtszxx/+EsdaMA/lYFtpTOu168UKLVySN3CA9Meo1S9Hmr3j+aFIKou/ZADb9hXDCD0VOhnM+94CtPTKlgzXrJobem74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617367; c=relaxed/simple;
	bh=2W5g0hfuYat+p+Q+CPnKRQC7m+Y81VPzuJh1JMxXOxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DbUVc0I3x/vQniySgsa0GKdRdEd+EBFAbxJXSRU5TeJ0pLqJkPpkYPIqBnZxqgKiQGGNc0/lnvz1aS/FAtSliPcNDzI27nb11hoiSNHP2RYYBs87uNh1usKv58g6vtTyoal4X1vQBNvaJEJLKhlkAPwBEIk54tnqOAr/sRezt0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AUepVXph; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AUepVXph"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C13FC4AF0B;
	Mon, 28 Sep 2026 17:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790617367;
	bh=2W5g0hfuYat+p+Q+CPnKRQC7m+Y81VPzuJh1JMxXOxg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AUepVXph0QjBLidnsDjbMIMSca9d4oCCQq8DHFWCq2DPlUr+l20MaeR3GYmPPBg0y
	 6wcDziWDC5UGWiKirg/+NXPP3EzRDzyAt6cM3NrED2rKFFkzLNnHNdZvNV0s+c8oP7
	 E7zilHqj0N8o3d8BJYi6wMUgPlnH3NwjZT7P4v8N4XyFLAs9ShgRUqCxI3nZaRP6Ok
	 DiaOWRwMGaQVjCPdz4PjvFMV0FwOoIfYXNs/2r5uxEWdvuhiGJGigqE5Ozo6O2Q4NB
	 k+uZG5gf7bbFTRmD1sRkDYFedUBM33P+rWUdbiS51Njs9UDCENQfuPjQ/7e3Gqm3y8
	 cTsdMQatoWomg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C2A1CA5FA2;
	Mon, 28 Sep 2026 17:42:47 +0000 (UTC)
From: Fabricio Akio via B4 Relay <devnull+fabricioakio.gmail.com@kernel.org>
Date: Mon, 28 Sep 2026 14:41:43 -0300
Subject: [PATCH 1/2] clk: qcom: gcc-sdm660: Keep the USB GDSC in retention
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-sdm660-clk-fixes-v1-1-5d5bb84e3258@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790617365; l=1139;
 i=fabricioakio@gmail.com; s=20260928; h=from:subject:message-id;
 bh=HV7dwPBmvRBQNBJ98Zjm+LuO+57weRugd9Y05jqgzHA=;
 b=P8MWtpsxM/ZKUrdFimVn6YPgSU5QAohnQtv+C4BmsXTNhy4qsUh+SaUoIkTByKDrv9MXnvjSJ
 SJon2rK4PRjCMp2yZ9S7fck4/pix0+MQL3Nqf0JjavAXLU/hkRiL40D
X-Developer-Key: i=fabricioakio@gmail.com; a=ed25519;
 pk=TlMUT8bPI/ZQzp2q24BIQTb2qSx/jdUTBlGEXIRCm54=
X-Endpoint-Received: by B4 Relay for fabricioakio@gmail.com/20260928 with
 auth_id=1076
X-Original-From: Fabricio Akio <fabricioakio@gmail.com>
Reply-To: fabricioakio@gmail.com

From: Fabricio Akio <fabricioakio@gmail.com>

The DWC3 glue writes its QSCRATCH configuration only at probe. When
system suspend switches usb_30_gdsc off, that configuration is lost
and on resume the core fails to enable endpoint 0. Keep the GDSC in
retention, as is already done on:

  commit 78a2f2a04fb5 ("clk: qcom: gcc-msm8996: Update the .pwrsts for
  usb gdsc")
  commit 83fddbcc8337 ("clk: qcom: gcc-msm8998: Update the .pwrsts for
  usb gdsc")

This change should be reverted when a proper suspend sequence is
implemented in the USB drivers.

Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
---
 drivers/clk/qcom/gcc-sdm660.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-sdm660.c b/drivers/clk/qcom/gcc-sdm660.c
index 20253a06a583..5d00f1fd4d53 100644
--- a/drivers/clk/qcom/gcc-sdm660.c
+++ b/drivers/clk/qcom/gcc-sdm660.c
@@ -2302,7 +2302,8 @@ static struct gdsc usb_30_gdsc = {
 	.pd = {
 		.name = "usb_30_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	/* TODO: Change to OFF_ON when USB drivers get proper suspend support */
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = VOTABLE,
 };
 

-- 
2.55.0


