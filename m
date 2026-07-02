Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0983ECBD5;
	Thu,  2 Jul 2026 23:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783035662; cv=none; b=ZFLszjZqE6ueuxcsj7EGrVGUqODphUVK2c3JrKl5fZnctKK1FLeCTDeI0AMO5qSkuFzX9qg1JJ0MxeRJhnf82+osTUZlf2hmJw49Qij43djC+YeXFIL2TvwvUxHiyoSkQ6GWZ2PDYyyNBuSqP0sklGJC0QDdof/z7i7MIOQWPE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783035662; c=relaxed/simple;
	bh=kp1bZzZkgtKS6EZMdqK9zRj2/5v6KZCMj2BJsvIUSrM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z2kFX2ADIbW+Vjr+SAAH/tAH8xwGmYT6V/RlVbYiG2X/MUazc70G76zjKpkHrFYyJkZhLLaiD97plzbibphbz8ixoCTasPFJtmnxhxsuzcwCNATLTk041F7uxPGW+Zq2iGN6lohLTGbLyy0YDxvpDQMTS9iWsi9bI9s5ABphW7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k+dhNcy7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k+dhNcy7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B08451F00ACA;
	Thu,  2 Jul 2026 23:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783035661;
	bh=nlSVIhwXK7vi/mR6K/qx6Hx1Txgkz8b29I7NXrDnkNI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=k+dhNcy7gZFGxtqxPBz/tD5t9cs3cAO0wpeYeqiGJWe3t25YJnfU7upPWYCia8vKA
	 kzAQdB6JRy6tYBhanl9L/BlGQ3ZSaRBsT6FZ6ASQUfrMpKs+oKPytNo5VjfGCzgWA9
	 RjzhijRYpbraHcucy/nje33A2gKFQt/0jzZkdQKdhquuhvy1N79N3G36BjXfm2GBiG
	 9bGLnTJAPbTMbPrwBeWqSaPlq5FPoHALmg8aH5uiy6eJOa3PiwB6NdNz8HP+6znMt5
	 BTMIuGt4iOo7BQFMWJmsBoqStZl2F5aKoa3ALAXoJjoWsX2mzOFnwZc1Np+mOQUiLT
	 XOPyRCvuRxL1g==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: dispcc-eliza: Fix disp_cc_mdss_mdp_clk_src RCG stall on Eliza EVK
Date: Thu,  2 Jul 2026 18:40:35 -0500
Message-ID: <178303563648.359079.1744512655726897827.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623115644.392477-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260623115644.392477-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 23 Jun 2026 13:56:45 +0200, Krzysztof Kozlowski wrote:
> Eliza EVK (eliza-cqs-evk.dts) does not have display enabled, however its
> Display Clock Controller is enabled and references parent clocks from
> DSI PHYs, which causes clock reparenting issues during probe (init) and
> warning on Eliza EVK:
> 
>   disp_cc_mdss_mdp_clk_src: rcg didn't update its configuration.
>   WARNING: drivers/clk/qcom/clk-rcg2.c:136 at update_config+0xd4/0xe4, CPU#1: udevd/273
>   ...
>     update_config (drivers/clk/qcom/clk-rcg2.c:136 (discriminator 2)) (P)
>     clk_rcg2_shared_disable (drivers/clk/qcom/clk-rcg2.c:1471)
>     clk_rcg2_shared_init (drivers/clk/qcom/clk-rcg2.c:1540)
>     __clk_register (drivers/clk/clk.c:3959 drivers/clk/clk.c:4368)
>     devm_clk_hw_register (drivers/clk/clk.c:4448 (discriminator 1) drivers/clk/clk.c:4672 (discriminator 1))
>     devm_clk_register_regmap (drivers/clk/qcom/clk-regmap.c:104)
>     qcom_cc_really_probe (drivers/clk/qcom/common.c:418)
>     qcom_cc_probe (drivers/clk/qcom/common.c:445)
>     disp_cc_eliza_probe (dispcc-eliza.c:?) dispcc_eliza
>     platform_probe (drivers/base/platform.c:1432)
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: dispcc-eliza: Fix disp_cc_mdss_mdp_clk_src RCG stall on Eliza EVK
      commit: 2ef00630c5c0b7b2c08aba7643f47594952d357e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
