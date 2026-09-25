Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1974E13FD;
	Fri, 25 Sep 2026 16:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354633; cv=none; b=bSNI97KkfS71ZoQ+ftza1uDqmgLnVtt4W57RdZk3dNFTZScpi9s2fK+LQMGK89rv24KRurwrbeua2FojcNOu284QrNqpVoq2oLIk27X4/kEJTnM4r6xm9/gi1IjNoPxQjfiCjvApkmFXcW4G8hbKdyDITBY5IYQuLyoN/AwbaTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354633; c=relaxed/simple;
	bh=e8a+GlQfkFvoTD3eLuvhwBxSliqfqa8NsmdDeC9ZJCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HkAtgIsN82zVU1tYlvHv2Znv6afvutAibFndB93ucJcu9CnMgCzcCDlaNf6s9q8q5Y2047TKpEGT48zUcAjuomjFnMYDY5RiyhCgwSsIkC9DErbZzBeVZ9hE12Dv6zvzytZw1NDvfLyGV9oXmkYvLo+VxFecwkYqxrjrghJxydk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TkwCGTQV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TkwCGTQV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D27211F00898;
	Fri, 25 Sep 2026 16:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790354625;
	bh=IS+QTVF4FhURL8YFeR0//GmmVF/1yHywO6EWg7NTWI4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TkwCGTQV+5rxNAJgrBAJMEJvmuN9j+OMWTwfs6ro1TaeacKARCWQPpeyrv/odYRbN
	 dUw3i/+T2j6RL8Ms6BkgTk3kiK2sSmQ1KvCg05Gj8MkdKpjalOdPg+u79hKt4KyFDX
	 WIADF9+GHoRNlZlKNi9XEYKAM9dkvCo1Pjia1KCrgn9yftv4nILvzDgZK4A91ewWvg
	 33D1jWOISQbRbNIiIFQITYxHZMwI/F/ymQzwVqthXWIZWUdrbu11MMnUzEwsh5UA1O
	 LVXq8Jsk9YNoZT3l4zuzidZ8VKmDGRK23fScX7TCG6n/Z4y7sFdTKK5tq+VPrC+fU9
	 juHUk9OmUxS+g==
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/48] clk: qcom: Use common probe data for always-on clocks
Date: Fri, 25 Sep 2026 11:43:23 -0500
Message-ID: <179035461254.1296652.17500076829102512539.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 24 Sep 2026 15:06:12 +0300, Abel Vesa wrote:
> Many Qualcomm clock controller drivers still enable always-on branches
> with individual qcom_branch_set_clk_en() calls in their probe functions.
> The common probe code already supports describing these register offsets
> through the clk_cbcrs and num_clk_cbcrs fields of qcom_cc_driver_data.
> 
> Convert the remaining users of these direct calls to per-controller
> critical_cbcrs arrays. This centralizes branch enable handling in the
> common probe path and makes the always-on register lists easier to review
> alongside the other controller data.
> 
> [...]

Applied, thanks!

[01/48] clk: qcom: camcc-sa8775p: Use common probe handling for always-on clocks
        commit: 7eb9459539d52538037d8eec9615313d6aecbf47
[02/48] clk: qcom: camcc-sc8280xp: Use common probe handling for always-on clocks
        commit: 7c930f77f887690218c4d17ec697d9db9dcc8a40
[03/48] clk: qcom: camcc-sm7150: Use common probe handling for always-on clocks
        commit: e63e4765c85baa65a20a42bfe27acf3536e3968a
[04/48] clk: qcom: camcc-sm8150: Use common probe handling for always-on clocks
        commit: befae2adef7273b64bade5df7f3309cb557dd490
[05/48] clk: qcom: dispcc-sc7280: Use common probe handling for always-on clocks
        commit: d8d527f0c0d99cce7d6746e2ea5bec628a2aab4b
[06/48] clk: qcom: dispcc-sc8280xp: Use common probe handling for always-on clocks
        commit: 7455a58f12d121e9a6f7077974bc1d693e171421
[07/48] clk: qcom: dispcc-sm4450: Use common probe handling for always-on clocks
        commit: 3e421998bf409ea3d6981af7285b7464d5256c29
[08/48] clk: qcom: dispcc-sm6115: Use common probe handling for always-on clocks
        commit: c493f533d5d35b85744c2d57794efabd6b6bddff
[09/48] clk: qcom: dispcc-sm7150: Use common probe handling for always-on clocks
        commit: ee4ce0f4fea673cdea8211f759106d49079958ec
[10/48] clk: qcom: dispcc-sm8250: Use common probe handling for always-on clocks
        commit: c0636033aa14a60c22d1d4a93346f0bb57644d8b
[11/48] clk: qcom: dispcc-sm8550: Use common probe handling for always-on clocks
        commit: be2a9494c2b5f0fcd344b5e9e57b38f5fa0de851
[12/48] clk: qcom: dispcc-sm8750: Use common probe handling for always-on clocks
        commit: d25deb9e17bbed30fc159cd7620ee0f234202340
[13/48] clk: qcom: dispcc-x1e80100: Use common probe handling for always-on clocks
        commit: fdb5ddde3caf8d4e6a6a62f878f32434d036c064
[14/48] clk: qcom: dispcc0-sa8775p: Use common probe handling for always-on clocks
        commit: 5f691b22bb6c754227566a20769c6851a675705d
[15/48] clk: qcom: dispcc1-sa8775p: Use common probe handling for always-on clocks
        commit: 1f866f76101d042002986562971739413e5f94ab
[16/48] clk: qcom: gcc-qcs615: Use common clock controller probe data
        commit: 551c084888fe6ca5f898712efbc6824062e0637d
[17/48] clk: qcom: gcc-qcs8300: Use common clock controller probe data
        commit: 24261c7a5d64e2277e9b560e4375eed1b2432e14
[18/48] clk: qcom: gcc-sa8775p: Use common clock controller probe data
        commit: 2b52742158c37b182c17dc935b15e10bc25f8901
[19/48] clk: qcom: gcc-sar2130p: Use common clock controller probe data
        commit: c4d24953658a53cb6bb81df06b8fa915baf12ad7
[20/48] clk: qcom: gcc-sc7180: Use common clock controller probe data
        commit: 88dab1941aa1ab252342170ec6c884e9fd0cea98
[21/48] clk: qcom: gcc-sc7280: Use common clock controller probe data
        commit: 383653f147a48d6eaf7becc909b355267cb1c4a2
[22/48] clk: qcom: gcc-sc8280xp: Use common clock controller probe data
        commit: 8094ef9696088129447224ca20b76304092c1c00
[23/48] clk: qcom: gcc-sdx55: Use common clock controller probe data
        commit: b3c909ed2acdbb8bb2a427edb3f0f79d3c04c46e
[24/48] clk: qcom: gcc-sdx65: Use common clock controller probe data
        commit: 393391a6d92f0e39f971f48a1fc9ab96fd71a9ad
[25/48] clk: qcom: gcc-sdx75: Use common clock controller probe data
        commit: 0821b268a8eb387340c18948ed76c4b95be621a4
[26/48] clk: qcom: gcc-sm4450: Use common clock controller probe data
        commit: fc759ed7b4453b3c8684dad4432dd10b5e7066e9
[27/48] clk: qcom: gcc-sm6375: Use common clock controller probe data
        (no commit info)
[28/48] clk: qcom: gcc-sm7150: Use common clock controller probe data
        commit: 53cda6d37c1aca4af24a23f28196e3d81828b5fc
[29/48] clk: qcom: gcc-sm8250: Use common clock controller probe data
        commit: bcb212df8e3bd92751d92045f70290facaa24df1
[30/48] clk: qcom: gcc-sm8350: Use common clock controller probe data
        commit: a60013ab5ee858b7595dbd3940d5ff417620b13f
[31/48] clk: qcom: gcc-sm8450: Use common clock controller probe data
        commit: f388ea59e5baa8921bf2bcd054e347ebf54fd277
[32/48] clk: qcom: gcc-sm8550: Use common clock controller probe data
        commit: 611dff26479c41c8696e08ea631ebfc3b8b8bf5e
[33/48] clk: qcom: gcc-sm8650: Use common clock controller probe data
        commit: 342130d88ff1a56e10f3ebd5ac838d6ed9d6b2aa
[34/48] clk: qcom: gcc-sm8750: Use common clock controller probe data
        commit: b6cd5183c3fd6a60c0ba018a665e437f4fd72f48
[35/48] clk: qcom: gcc-x1e80100: Use common clock controller probe data
        commit: 06d1ee4027e6fded9a1306beb7635f62afcb0e7f
[36/48] clk: qcom: gpucc-sar2130p: Use common probe handling for always-on clocks
        commit: ec0ca61b58d9240b85c0426a1a5a518b7dfc28fa
[37/48] clk: qcom: gpucc-sc7280: Use common probe handling for always-on clocks
        commit: 1695caf1a4c2dd59bd732e8e29b024661f244a31
[38/48] clk: qcom: gpucc-sc8280xp: Use common probe handling for always-on clocks
        commit: d158c3febddd902c7d30d5574cd03f925e96a75a
[39/48] clk: qcom: gpucc-sm4450: Use common probe handling for always-on clocks
        commit: 99548f35b5fa60455d75530e010fbe7767cbafe4
[40/48] clk: qcom: gpucc-sm8550: Use common probe handling for always-on clocks
        commit: 175a79271c0715036336537a49e1e7a0101adac0
[41/48] clk: qcom: gpucc-x1e80100: Use common probe handling for always-on clocks
        commit: e4f6a7b4a00e26b3c13b406b58f0126c9d6be6ef
[42/48] clk: qcom: gpucc-x1p42100: Use common probe handling for always-on clocks
        commit: d0c66a44fcc5f11783b2ec98b026a436a01ee19f
[43/48] clk: qcom: lpasscorecc-sc7180: Use common probe handling for always-on clocks
        commit: 9ccfc0568ead5413470124d3d25343c06356616a
[44/48] clk: qcom: videocc-sa8775p: Use common probe handling for always-on clocks
        commit: 0b439d08063fc0aa525c82528acdc45b28bc35a0
[45/48] clk: qcom: videocc-sm6350: Use common probe handling for always-on clocks
        commit: 16dbb56fd63ce02ee2b190de273641788a6c668b
[46/48] clk: qcom: videocc-sm7150: Use common probe handling for always-on clocks
        commit: b81602789b9de6f6145366f498f9411b423c1e7f
[47/48] clk: qcom: videocc-sm8250: Use common probe handling for always-on clocks
        commit: ec0454e13dc7fa01476e8630035ec4eac4bba1e7
[48/48] clk: qcom: videocc-sm8350: Use common probe handling for always-on clocks
        commit: 1fb6a543e7df78047afb07a58832fd4fa42151be

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
