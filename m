Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A182DC32C;
	Sun, 12 Jul 2026 03:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783825893; cv=none; b=uWeF9iqOpW0VOoMHZb7QCu7eEvwg8gNU9T4b541H0xAC4O4KatZKfu4zg50QhKsQfweYyDgoN73qNtzKRJUrid62wwLtTkm12mpHhuf7gBFvJnQzpL80phMG/aOfNuMcq204T4dzgVwumiQZbG8X7YQtbVGUDiH2C0HgCrpYhFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783825893; c=relaxed/simple;
	bh=B29H+U+1LjMs/wUCNbZFPdXBSrzHHixAvE4yWLt60IQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GDCag8YLliV1u4FUX1s3PL2XftC7TbGCB1s8eIkGPkhxNnCGrCEWCUz/lask+ohFX0ZrAUbqHzWqQO/uF8m3u+LRfLJBDGyxEGnh6n286Es0wGIYjQUQn2jx3zQgd2+rm2LPex+Xi9hWPvpM8DqhUVmjCA9jQmXaZljAE8eNfqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CmHklcsZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CmHklcsZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22013C2BCF5;
	Sun, 12 Jul 2026 03:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783825893;
	bh=B29H+U+1LjMs/wUCNbZFPdXBSrzHHixAvE4yWLt60IQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CmHklcsZxjy/bH1dZ1p2aat3NDssdSIVOkipjTX+IiX5ESQ9VG4dwSYoeNrRmT/aN
	 /KK1h6S2AU9DXAIwc9v+NRYaJP31qNGK09tzAtkDONnCjOczlI9Q2hs21u+EnScUh1
	 0k0cSbWtJ2+hQA1DE5JIfu1cHkoqCPQp09wlQ4Bt5GTl0bNtNgHncfMxO/0gxlcOI8
	 h4Z4ULc3bj3pTFsY24fW8s3U0yWam/CvhPwTuK+znbI0nRse1NpAAUNn2CaZImr/6b
	 oWOKqXBCo3D3ldHOv8aYBXR/bx2Cz3s1oLA3VbFPu6jjEtHzxE14MizPWfMw8/Y68y
	 guhshv8QNho+Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 029A2C44506;
	Sun, 12 Jul 2026 03:11:33 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Sat, 11 Jul 2026 23:10:35 -0400
Subject: [PATCH v2 1/3] clk: qcom: dispcc-sm8450: Fix
 disp_cc_mdss_mdp_clk_src ops
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-sm8450-qol-dispcc-v2-1-fc1a07ac5601@proton.me>
References: <20260711-sm8450-qol-dispcc-v2-0-fc1a07ac5601@proton.me>
In-Reply-To: <20260711-sm8450-qol-dispcc-v2-0-fc1a07ac5601@proton.me>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Danila Tikhonov <danila@jiaxyga.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783825891; l=904;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=hS4a1nL7vtDd38+h02lWuV/41dvOpOZ27ua71QXzKRU=;
 b=YYuSwzjliP3WYJJYB+n2z2/X4z3ZGGPhihZdXDZ83HLiaC0nsMH+N5k4FZhC0kiURSgpb4OvQ
 INpALlmIVueDz8haY6+7lNWq++52SfQ07XY4Utd7NTG54BGIij/ljqw
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


