Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A433BD64A;
	Thu,  8 Oct 2026 21:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791496166; cv=none; b=UJsTFy43LVsWDxTWC49L4JbdgtBQHPX5kFWz+GSWIIA0nxyCo3exPfTC8bW3FeKTBxI/kDQdBV1DANFyNH90fNs0nC8Wjm7GpIjF2jQbTdI+MVq3J2VxorQVofk56RDRdlU40zgokB3bXeTivEAGOARnKsfOYzEI5U5bmwBzm/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791496166; c=relaxed/simple;
	bh=kUr5WLS3/NS86dn4okmxyawl/ihwQrfE84KiHi/fXc4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PiUknuRlsspOJB87OHbv0ymm/esmZDVCMUK/pH6yMMyxMTocO3mHZlPkgfHASqbpunR+xgBma9SjBZ2nhYGfmDnliQRlw9a2timtp0ddAQpp8/dqIu9rMHBX7ijxV7Dd5RL165DFtSpER9ZVfCrETzbtg9y1/yVqw+uz7R6ZHOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zv8weXQV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zv8weXQV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E17ADC2BCC7;
	Thu,  8 Oct 2026 21:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791496166;
	bh=kUr5WLS3/NS86dn4okmxyawl/ihwQrfE84KiHi/fXc4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Zv8weXQV7CctIIeoMPsqS7HUme1BJA79ZmxzLK498nAV4v1z3PCgJZWwiGBvVuM96
	 1DJ3YwIzuuwajxiNxlWhNRreCSOv6auLBuHhdEMeX7tXbHS9/9TRbqxyw52K9s9KR9
	 qZo8w91vwUyutWvV2v+s+sgL93ViIiVHvqfF9D2pP9f9Tn9Kc6eNGN4fUWvkRsT9N0
	 O71pNFKpRBaLlxr3Cvu3vB5e6of1zUJgaO7F3HxjzVzzwrfDUdZYm/ii9ApgVMUDfj
	 55PN06BhewaHER0L/rtkPAjgPkZfejtNjwGUAukzIxjNpbuEsdelpJ5i+6FGhl8Hn+
	 v94tXEWwhJR0A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F88CA6017;
	Thu,  8 Oct 2026 21:49:25 +0000 (UTC)
From: Fabricio Akio via B4 Relay <devnull+fabricioakio.gmail.com@kernel.org>
Date: Thu, 08 Oct 2026 18:49:18 -0300
Subject: [PATCH] clk: qcom: mmcc-sdm660: Do not keep the video core clock
 always on
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mmcc-sdm660-video-core-v1-1-3a772ad6a436@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQqDMAyA4VeRnBeIlRXZq4wdbBpnhNrRTBHEd
 1+3Hb/D/x9gUlQMbs0BRTY1zUtFe2mAp2F5CmqsBkfOt0Q9psSMFpP3hJtGyci5CFLsrz6EsXO
 DQI1fRUbdf+P7429bwyz8/t7gPD9QGgHGegAAAA==
X-Change-ID: 20261008-mmcc-sdm660-video-core-0d856bbf32ae
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Fabricio Akio <fabricioakio@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791496164; l=1532;
 i=fabricioakio@gmail.com; s=20260928; h=from:subject:message-id;
 bh=geC/qp10mNx09GEN8J1SfnH1K7aO8l0Ey/TJA7nUjhg=;
 b=jM8aDSTTm673lKKyryvGnzUFUG2OJF3aMSQ8Gw3qyqgxTMeEuRTjH+kOGNJLEh6E3mq9U/7N9
 HIy9+xyMPp9CkqiScUUSnw9PvnQNQRIwhHJv6CkrYUL5cMTnS50hcMH
X-Developer-Key: i=fabricioakio@gmail.com; a=ed25519;
 pk=TlMUT8bPI/ZQzp2q24BIQTb2qSx/jdUTBlGEXIRCm54=
X-Endpoint-Received: by B4 Relay for fabricioakio@gmail.com/20260928 with
 auth_id=1076
X-Original-From: Fabricio Akio <fabricioakio@gmail.com>
Reply-To: fabricioakio@gmail.com

From: Fabricio Akio <fabricioakio@gmail.com>

video_core_clk_src is marked CLK_IS_CRITICAL, so it is kept prepared and
enabled from boot, and with it its parent XO, which the RPM then can
never shut down. Nothing records why: the clock only feeds the video
codec, whose driver enables the core clock it needs, and the same clock
is not critical on MSM8996 or MSM8998.

Drop the flag.

Fixes: 5db3ae8b33de ("clk: qcom: Add SDM660 Multimedia Clock Controller (MMCC) driver")
Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
---
Tested on a Motorola Moto X4 (SDM630): with the other votes that hold
XO removed, the SoC shut XO down in every suspend with this change and
in none without it. With the video codec enabled for the test, it
probed and loaded its firmware, and the clock was off while the codec
was idle.
---
 drivers/clk/qcom/mmcc-sdm660.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/mmcc-sdm660.c b/drivers/clk/qcom/mmcc-sdm660.c
index 9f8b8e29fa0f..a38631889797 100644
--- a/drivers/clk/qcom/mmcc-sdm660.c
+++ b/drivers/clk/qcom/mmcc-sdm660.c
@@ -1086,7 +1086,6 @@ static struct clk_rcg2 video_core_clk_src = {
 		.parent_data = mmcc_xo_mmpll0_mmpll8_mmpll3_mmpll6_gpll0_mmpll7,
 		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll8_mmpll3_mmpll6_gpll0_mmpll7),
 		.ops = &clk_rcg2_ops,
-		.flags = CLK_IS_CRITICAL,
 	},
 };
 

---
base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
change-id: 20261008-mmcc-sdm660-video-core-0d856bbf32ae

Best regards,
--  
Fabricio Akio <fabricioakio@gmail.com>


