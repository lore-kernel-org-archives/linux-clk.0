Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1040348463;
	Wed, 11 Mar 2026 20:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773262605; cv=none; b=SjOsJQs1UjSNhch1BX50CjpT1AmAc64nMXogmMOWhY3TXxmFmxwqbpmrcHPMC8QryjQLN2Qc8dyfQQiu2A/QNufR3ZsVCKv7I6TdQEtwX4+/5xaH2aa4netoBFs5cBFqwVamrnFk/6dinqkdWtEsQQsSSfLCSay1If8scrIgp/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773262605; c=relaxed/simple;
	bh=OuI3zgUrUxZ8GbWt74n3/6bDnDwyhF9aZnibLJkStKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=agRCha4AWK+LiGxCdQpjjGSsjjcn7G71qkvf49AgvN9y3Ntbl4CpEA9ilOgUgRX0ZwTsE7BLIjKGZetu9qW/VF1fiy4v36WsevQMeo1ngg3gITUiUAOBo6siDV/Onq2h7TwCVFyvq48MllyPFx0Ypl8XPywZ2tFMuxioz/CgZIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XuSqAjLL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XuSqAjLL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 432F5C4CEF7;
	Wed, 11 Mar 2026 20:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773262604;
	bh=OuI3zgUrUxZ8GbWt74n3/6bDnDwyhF9aZnibLJkStKI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XuSqAjLLvCFx7r4STf0HoyxICkexxoh4IruW92thrvRpf3vMUdD2HQlyj4TPLtPTB
	 RetnCSgy3C9eEB0Pk6mx2BMRZvG7VuePKHStA5C09Njtt5kziJtPz9VB2+8+4CS6nz
	 8ncQ2u4vzvb7mLAssXxlXLJMiSK0lMRNBrYZZmy223imxnOxUc0HAuzIr0reC48NlN
	 HArv9EjR+fLK6Vh/UWrYFc7McjM/XcFyLnJeDNxvLXXLAxVRtGC8GOom0kkzLqTf/w
	 YQrzlV2SVojHv4Xl7mbJp4tpnzvQRgHfIgjrCXB5nUVrV49vQzCTXD3LU1G4jJEFR5
	 8LrN+JwbYSzMg==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH RESEND v6 0/6] clk: qcom: Add support for basic clocks providers on Eliza SoC
Date: Wed, 11 Mar 2026 15:56:34 -0500
Message-ID: <177326259462.44574.3228852589174701354.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260311-eliza-clocks-v6-0-453c4cf657a2@oss.qualcomm.com>
References: <20260311-eliza-clocks-v6-0-453c4cf657a2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 11 Mar 2026 16:46:30 +0200, Abel Vesa wrote:
> These are the bare minimum clock providers needed in order to
> be able to boot to shell and have the rootfs on UFS.
> 
> The multimedia-specific clock providers will come later on.
> 
> 

Applied, thanks!

[4/6] clk: qcom: rpmh: Add support for Eliza rpmh clocks
      commit: 76cbaa6557b1e685a268f08f892a35004bd4fdd2
[5/6] clk: qcom: Add support for Global clock controller on Eliza
      commit: 3d356ab4a1ec2d9b208f0d0020c79855097b1fc7
[6/6] clk: qcom: Add TCSR clock driver for Eliza
      commit: c69a586344758f0d9cf0526d2a4b14fb56941b10

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
