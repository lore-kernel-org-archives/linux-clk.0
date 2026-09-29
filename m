Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5488E3DAAAA;
	Tue, 29 Sep 2026 03:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651752; cv=none; b=tkytvnW0LNuzTrBcFYa5huGyISrleqVAr4BABel0EAaxGGhBe/1TX+gFU9UVhN97cSGgKTuA0i/5svFevekftQDonZgtsDR4z7lZe9JgiRIuGvo/bPp8RncLB0Kn93j1QiwG7ekDt6Cp4c+Q4aiFThlU/TDZvCxGOI2/zuZPeTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651752; c=relaxed/simple;
	bh=CbVjQfizRLDfmRdI7gcmB1od3YMdoLKlV25JJrzM9Hs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XauB6OOi6BmbmYngc9xc61dJkFyYSMYDOo6GDGmf5ValVs/tHFmNOfAeMK26cijH7TCaYlsa5umcmeukglQMIfhpe5aTiN9ACacRxpAfoSvKj5vyV5UrEDEX3ukpTk2gBBmqaVBBwi4BCVhGiU25Vl+u6j25RnanY/CuXcSIEfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kudCjqJP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kudCjqJP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD3D61F0089A;
	Tue, 29 Sep 2026 03:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651750;
	bh=hA8LUWW3PtjcaCrXtbh0vfqqPBEJbVf3BoVC5KmmLFM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kudCjqJPceZR1C78VsRk7LleDgpsvmIV24SIVD3dZ+wRgnFekpOwTu3Ur6hD3TZUd
	 RiAxVuFsCVuuG19DT6Q/cSbsVBP3BP9gA3NyEk+b2/gOl2/FkUPg6Vgc/CoiML7v8o
	 U/7wJWokF6KAHW/eKkthRCq1CD6g5tMcoVQhAZTHet3B6qTuK9BCQQhI0vMpFzTvWG
	 3RSwc29tGg3KSVPJV+lyWFRg01s6iJerS4gBll85LACInhk62twOkIa9tlQRY6RoKJ
	 VSaDNXjJaWz7CFyG7PCEqpFVxa23LFPNdqWqXeKOzVcrsix5gBWJsi0LXPu/Rn7Y1D
	 YjG/clYMbBOVw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: Fix camera rivian PLL configuration settings
Date: Mon, 28 Sep 2026 22:14:47 -0500
Message-ID: <179065170918.2673486.12337942031233081331.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260801-cam-rivian-pll-config-fix-v1-1-6918d58cd823@oss.qualcomm.com>
References: <20260801-cam-rivian-pll-config-fix-v1-1-6918d58cd823@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 01 Aug 2026 01:15:07 +0530, Jagadeesh Kona wrote:
> clk_alpha_pll_write_config() in the PLL configure function skips writes
> to PLL registers when the configured value is 0. However, hardware
> requires USER_CTL_U and CONFIG_CTL_U2 to be explicitly programmed to 0
> for a few rivian PLLs.
> 
> Add a clk_regs_configure() callback to ensure these rivian PLL registers
> are correctly initialized on Glymur, SM8750, and Kaanapali platforms.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: Fix camera rivian PLL configuration settings
      commit: 3b651d946ebb756f922bed8a213919af17f58f43

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
