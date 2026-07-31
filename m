Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFEB357CFE;
	Fri, 31 Jul 2026 03:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468301; cv=none; b=JyanVo/3+NUhA6F1xUJYVSNXG1A4HwTETeTTdCQ1YERyoy5rbwSVC85jben7C6YzSO32KQF+ace+1J9PLPM4cRYqvV8Pf/jneMhPzMNW1HYo/MdWm2vDRxXml4SMBwCc2X0nAxuZCwpMsVLF/uysTUOjqLlWfdF00wF7JI+0DMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468301; c=relaxed/simple;
	bh=r9fv34jI6KCYZK3WmfedJbrd+zWuJtCeoJfEXijt8T4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YG3db0j9Gr6mK5PqQKV/sU9o3ah8ZbjKABUnzRX38TXrBzXNSFgatcBNHu5t20EfrSlKtbmlJr6Z0jgqfsSTOivaTbzjBKSXUFyqewl431NFNm400ORy+zeT5GJN2UVzn0MoDinZRhuERouc86np7oiH9KDMqndlApWQx68bqSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N8UFt76b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N8UFt76b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0A5D1F00A3E;
	Fri, 31 Jul 2026 03:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785468300;
	bh=4/8fBvsyv4cTUVWppsKy9XA/YuaoOznhYJT+ZKCHSLM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=N8UFt76btDPeU5xjo7opjBAfCTGSyZivTWzybEddbcpwVjB9Yr3PFyy6LWh0e98Df
	 nPGt/x4uEM0Yg0iARKUJaX5VH7Vvgn8h5YE01cDMFhu6QoxlB8WVJesNpN+XHvivEU
	 +cQfB8/EKJu8YVO5MskyxqNXmkMgzGu6JaxaXRulLFbo+9SsYcFZTug8LKlQHngMTT
	 QIMUXCy9+7A+XboTJk0qrYpdOK9G7YRxW4HsMGeYOZJOngGyhUJL3QkcHfy3Nml4yF
	 Ns3qMFdNpz/SzhTmcE6AFo0icH1NAhjmp2BW5OYPJL5nIgf1P3+JnpalnQObOnw1oT
	 TEiGjvSbcS1Qw==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Georgi Djakov <djakov@kernel.org>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/12] clk: qcom: Assorted fixes for gcc-mdm9607 (and gcc-msm8916/39)
Date: Thu, 30 Jul 2026 22:24:32 -0500
Message-ID: <178546826819.316815.10244056067929412727.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
References: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 06 Jul 2026 17:02:07 +0200, Stephan Gerhold wrote:
> The gcc-mdm9607 driver was originally based on gcc-msm8916, with register
> addresses/frequency tables - where available - replaced with the values
> from the downstream clock-gcc-mdm9607 driver. Nowadays, gcc-msm8909 is a
> much closer match, so comparing the two drivers revealed quite a few
> mistakes inside the gcc-mdm9607 driver.
> 
> This series fixes them, together with a few other related bug fixes in
> gcc-msm8916, gcc-msm8939 and the dt-bindings for qcom,gcc-mdm9607.
> 
> [...]

Applied, thanks!

[01/12] clk: qcom: gcc-msm8916: Fix enable_reg for gcc_blsp1_sleep_clk
        commit: c5339edc6abb601ea10df910ea0b1592fa1016f3
[02/12] clk: qcom: gcc-msm8939: Fix enable_reg for gcc_blsp1_sleep_clk
        commit: fc611445b021262b0d4ace6f716a360663816287
[03/12] clk: qcom: gcc-mdm9607: Fix enable_reg for gcc_blsp1_sleep_clk
        commit: 944d0fb38cffe57a1d1ebf82c5c077bad82dcdbb
[04/12] clk: qcom: gcc-mdm9607: Fix halt_reg for gcc_apss_axi_clk
        commit: ca7e6cc30cde4f0cbeff2e205a84bedf431e9156
[05/12] clk: qcom: gcc-mdm9607: Increase delay for USB PHY reset
        commit: c99bc8e83848358bd4a0436e4bdae5b7919babb2
[06/12] clk: qcom: gcc-mdm9607: Drop incorrect apss_tcu_clk_src
        commit: 38d06956f60675f906dc3f5b70b3b52103b86a7d
[07/12] clk: qcom: gcc-mdm9607: Drop incorrect system_noc_bfdcd_clk_src
        commit: 17784427df923a0573a7ea83f9198456ff1ec1a5
[08/12] clk: qcom: gcc-mdm9607: Drop incorrect BIMC PLL and related clocks
        commit: e111ddda092ad961870a634e4c9263c10a3e8485
[09/12] dt-bindings: clock: qcom: gcc-mdm9607: Drop SYSTEM_NOC_BFDCD_CLK_SRC
        commit: 1df0fa742c5a1a0409eb64cea2993748efc42591
[10/12] dt-bindings: clock: qcom: gcc-mdm9607: Add missing "clocks" property
        commit: 5c117709e7e1f1a53642f5704f29c3250a14c6f0
[11/12] dt-bindings: clock: qcom: gcc-mdm9607: Use proper address in example
        commit: 75ae68fcbddca8f093c3b561cc82f9615b867b3d
[12/12] clk: qcom: gcc-mdm9607: Drop redundant register update during probe
        commit: d4d2fcb3e3e929e71a7d1ca5443dbe08acd8f128

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
