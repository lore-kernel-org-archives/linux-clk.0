Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F1937DE9D;
	Tue, 14 Jul 2026 03:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783999718; cv=none; b=BDWbywsa/8oQwfmtTcVvkjlqduETy4Ae68qKcjqekFpYM6Fmecs2Grlg1yBlhlOeSpBtB4EWMr2L61SZlzVGtL7aSyRW+JBAXUZhg3CkmFaMRvVmDy6m3l4/cr+ZvqHnllXaqDE51amZpJ4wMDJoMBNvVcGehLOQs9R98BX8pQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783999718; c=relaxed/simple;
	bh=JdOoLbfe0MaF2NMru1U5JBxp1QJaJwlAcDS/AaomInI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RPaIGJ84xqHW63270B/4Zl1pLjuFLydh7HloaZhX5sYsywRoNnoNPvO3IA2w9Q6RwT4WPU3Hpyjd0hcFsOi6zbM7J/Ns91NVZ5n6aSQLtqJQF+M+YCzsNIOkcpfUYXuv3lTEHc73XofLUqvCklgGB1ABsypTSGqono9IHIcL1x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NRSaQTGQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NRSaQTGQ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40EBEC2BCC9;
	Tue, 14 Jul 2026 03:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783999718;
	bh=JdOoLbfe0MaF2NMru1U5JBxp1QJaJwlAcDS/AaomInI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=NRSaQTGQORxLTdkodmACTkdAPB14KAc4EV92Dl7Tu0bzkTVK3oKZX7dI9uJuA+uJv
	 qdyhObKS2pFbccleQoO4igb8ZuQQZDIg/wsNUD8LxaLRkvw/vUW8R/sHj2/OOQVBjT
	 HIajvfwOpt1EwU4bch/i/cFy9LGb3IzZPaO5QQz36Xj1xvpj2kSUvY2VBUEsgidryH
	 YtaIYQfztop8E4UcXz76PSRHLCvsfWQGowQFFEdFI1WHxUwCdD5MX8JCa5ejVTRJz0
	 h31yJqWIZJUklFpTZG5i+x/jO3q4T5X4BLtQvGj1MKPwc6Y7nHJKcKffYnb+gpP7Ed
	 1kgAMQgQfeTLQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30E7AC43458;
	Tue, 14 Jul 2026 03:28:38 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Subject: [PATCH v3 0/3] SM8450 QoL changes (dispcc)
Date: Mon, 13 Jul 2026 23:28:16 -0400
Message-Id: <20260713-sm8450-qol-dispcc-v3-0-56fd05822270@proton.me>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23OTQ7CIBAF4Ks0rMXAVPrjynsYFxSmFqOlQiWap
 ncX2oVduHzJe9/MRDw6g54cs4k4DMYb28eQ7zKiOtlfkRodMwEGBSs5p/5RHQSjT3un2vhBKcr
 qBmrBNYiGkbgbHLbmvZjny5r9q7mhGhOUGp3xo3Wf5Wjgqbf6BcDWD5wympcIiJVuay1Pg7Oj7
 fcPJAkO8Jv+fy1AFFrFJSulEgXjW2Ge5y/b+/eL/wAAAA==
X-Change-ID: 20260711-sm8450-qol-dispcc-09b2951d25b0
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783999716; l=1177;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=JdOoLbfe0MaF2NMru1U5JBxp1QJaJwlAcDS/AaomInI=;
 b=B+1ZcpSdJMfXW2NFB/f1nGzhhq0xUceCDKASb0H43sdOqHf+HQf22wUfgQcRPYyT+t3r6QCcV
 A06wQ0ylBX3BejDF/BchCCBL6Wc0ZbyLg42uD+YC7+FT3kzgTFy1/jE
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me

These patches are mainly focused on getting a flickerless boot process
on SM8475 based devices.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
Changes in v3:
- Apply suggestions from Konrad
- Link to v2: https://patch.msgid.link/20260711-sm8450-qol-dispcc-v2-0-fc1a07ac5601@proton.me

Changes in v2:
- Split series in subseries (dispcc, dts, qmp, smmu)
- Migrate to qcom_cc_driver_data (Konrad)
- Split mdss patch into 3 patches
- Use Fixes tag where applicable (Krzysztof)
- Link to v1: https://patch.msgid.link/20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me

---
Esteban Urrutia (3):
      clk: qcom: dispcc-sm8450: Fix disp_cc_mdss_mdp_clk_src ops
      clk: qcom: dispcc-sm8450: Migrate to qcom_cc_driver_data
      clk: qcom: alpha-pll: Check Lucid Ole PLL status before configuring

 drivers/clk/qcom/clk-alpha-pll.c |  9 +++++++++
 drivers/clk/qcom/dispcc-sm8450.c | 40 +++++++++++++++++++++++++++++-----------
 2 files changed, 38 insertions(+), 11 deletions(-)
---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260711-sm8450-qol-dispcc-09b2951d25b0

Best regards,
--  
Esteban Urrutia <esteuwu@proton.me>


