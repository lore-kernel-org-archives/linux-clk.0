Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FBB3812FE;
	Tue, 14 Jul 2026 03:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783999718; cv=none; b=hOZuY9OYmIZBWIIjeC2COgFEe2HyP84yObiZ/62Y2FDTXZ1pWwf8dpX+HBtLwcjXlSo5j6mGUVd+u1gfSHTWdM+BqfSZRiLg2TxR+WJmwEHLCFvkX0l38okSWLHKcbh4+6CeY67JZwpI6XpIweWEOIvHJtA5kxwS6/N5pVpAPyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783999718; c=relaxed/simple;
	bh=PbOq557Ft8YIJ9bXL+Q3CTGy+D0w/GsR+9j5qySpM+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Oy7JdeqKCmdSr0taumuIx4k8+jR4bVlk/9cVaVR/2g+S//3nRz9c3QVl76oR4WPF5yzMtA6hAJg9nNJU9QUu3CqcN62Uxxkz8jacE+dzdItrZUY878T3OWS1YybcGq7unPUdkJtXdUZFdN4F50xo1wPu4sDYdNXJDGqIpehOy9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vHh3+chi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vHh3+chi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 63F2DC2BCF5;
	Tue, 14 Jul 2026 03:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783999718;
	bh=PbOq557Ft8YIJ9bXL+Q3CTGy+D0w/GsR+9j5qySpM+4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=vHh3+chiv/sBRNehBe6ZuPUWfoEST7kLght1ib+EOF7rTkekDrrzdwrYLhDdBsOBK
	 tb3NGTULFc/BYo6hb3oPlxhByeh8AJepk24FBQ8aaBBfjDT6j3EtW58OJc3EnQ0mCG
	 cO+ibNYJ7cRlw7F1EkKgZ1eEfbO5/WyWtsuC9QEcRXx771wc+35gp5CUzk/TXEePtE
	 gGtptSEzkNc+/YAYKaJQyqen9hayATlJgKch3k8y9Vt8aFeDRlqm1bt2NZgU5JECs/
	 yu+x2cY1FbbHJJGytdzr6i87r8lBkil1frcdc+awL0eBTXopAAsja25zcezwima7f2
	 jDARUlzcq98Eg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42656C44508;
	Tue, 14 Jul 2026 03:28:38 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Mon, 13 Jul 2026 23:28:17 -0400
Subject: [PATCH v3 1/3] clk: qcom: dispcc-sm8450: Fix
 disp_cc_mdss_mdp_clk_src ops
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-sm8450-qol-dispcc-v3-1-56fd05822270@proton.me>
References: <20260713-sm8450-qol-dispcc-v3-0-56fd05822270@proton.me>
In-Reply-To: <20260713-sm8450-qol-dispcc-v3-0-56fd05822270@proton.me>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Esteban Urrutia <esteuwu@proton.me>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783999716; l=965;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=vJQi+hh68A/9zQqjnQhNDpQToorMCC98uuTiE+EDBpg=;
 b=69njIyVN6Bg2SvOWougSW0JtbBOvtf3urGyNAIUgO/GiYz3QE7Gjn7oPJftY574hrUhlFgpWq
 OM0+hhhZ52HC4qZ2Ez2AgHHHoRF7TOQrBd627rZTfAzrqWyk9lS8RFz
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me

From: Esteban Urrutia <esteuwu@proton.me>

If the clock frequency is changed at registration time, a flicker will be
visible at boot.
Switching to clk_rcg2_shared_no_init_park_ops fixes this.

Fixes: 16fb89f92ec4 ("clk: qcom: Add support for Display Clock Controller on SM8450")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
 drivers/clk/qcom/dispcc-sm8450.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-sm8450.c b/drivers/clk/qcom/dispcc-sm8450.c
index 3af120e54cdd..c7e04bd315d5 100644
--- a/drivers/clk/qcom/dispcc-sm8450.c
+++ b/drivers/clk/qcom/dispcc-sm8450.c
@@ -613,7 +613,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
 		.parent_data = disp_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_no_init_park_ops,
 	},
 };
 

-- 
2.55.0


