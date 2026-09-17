Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BB14A7C97;
	Thu, 17 Sep 2026 09:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789636050; cv=none; b=VrirCJeKtsjmx1eAwuvsGSzXzcJI6A//PK3cEPV9VnrHLVKggxj8It4HLjWjpohskS8KaBomh8IFzhdmHYHeFzmcnYLaWY8jVclOfAGEgzVyHWhkOQyBe06KogaKt6lih8jYcqXuHE/NBaIQJyjReowbeF3WU+RFzu0FBw2JCKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789636050; c=relaxed/simple;
	bh=jl1SET3aMU2rf5BYvCbgNwzyyOEysVrMLiay0sfUraU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MyMt6LiUd3Ev+HbBVRM5Wfkca0g/h0C6fSxiwjxJbfPj0a5n0GB9p/VEQ9oWsaxbdglZ0P8W3+/kdA/E7EXRilaxCoxK4wT0gq5mq1ekNcTU8zW4pcG0cBZoFcWam29CoeR2+iWQZNyDcm1TLD5Fqu6UmCFwYtidHsNf7AgIy5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tr/K9blg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tr/K9blg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED3D1F00899;
	Thu, 17 Sep 2026 09:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789636049;
	bh=DS6Tk7psUmOCja00oDnad5txvkzZohUhHFTHbS3dslE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Tr/K9blgWVh1KzXpZub2ejnqvHHYZRhTT9Mwh4dBX+l6KPrMMeRjzKxcLDkxJUw92
	 pyT1960pBsYprG9z6vqShi0BrrRy2W6jY+swluuaJovMbDxUANxxPmw1ivFT9ootBS
	 1VOgr3m9Y4Sw3wx5+UvFxNN4sUdOrehmWiUSPUeLJtsHrO0AUePTwJO9yZpgOw980j
	 6aMcMbCJWGpLFGGOx/z374u/YoY0zEzAbo+okvDlu0nX6fmkFp2+4sHrfYkVwm1H/J
	 k9+q29jfJ9cOL64onXLJ6Ds9CSSzpFW3JzwNtfU1KGkdPN9p7ijCeP93HjASLX4WBC
	 K/7UEusC5ocWA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 17 Sep 2026 11:06:54 +0200
Subject: [PATCH 2/3] clk: qcom: rcg2: Propagate force-enable status errors
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-topic-qc_clk_fixes-v1-2-5531cb00514b@oss.qualcomm.com>
References: <20260917-topic-qc_clk_fixes-v1-0-5531cb00514b@oss.qualcomm.com>
In-Reply-To: <20260917-topic-qc_clk_fixes-v1-0-5531cb00514b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Amit Nischal <quic_anischal@quicinc.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789636037; l=1169;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=QEd+weplDuuDvh09gpIOH6CC+ZLTmttPHaCiqYgZ0OE=;
 b=MFe6v2N879J9NkeBVPklnd6aTvNyBO0oy7zfe19ZU7JawgmwmXWPp4LTcYpG0EqSsr01JUVHd
 E8eAhzs+sSWDDPBgLcSQdipAFXFmlcPEokCuxT6iWUpDZaIFiqoXY6o
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

clk_rcg2_is_enabled() returns either a hardware status or a negative
regmap error. The force-enable polling loop treats every nonzero return as
an enabled clock, so a failed status read is incorrectly reported as
success and clock reconfiguration can continue with unknown hardware
state.

Check for negative returns before testing the enabled status and propagate
the read error to the caller.

Fixes: 7ef6f11887bd ("clk: qcom: Configure the RCGs to a safe source as needed")
Assisted-by: LLM
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rcg2.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index adb03c3aa0dc..54d122e2e0d6 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -1332,7 +1332,10 @@ static int clk_rcg2_set_force_enable(struct clk_hw *hw)
 
 	/* wait for RCG to turn ON */
 	for (count = 500; count > 0; count--) {
-		if (clk_rcg2_is_enabled(hw))
+		ret = clk_rcg2_is_enabled(hw);
+		if (ret < 0)
+			return ret;
+		if (ret)
 			return 0;
 
 		udelay(1);

-- 
2.55.0

