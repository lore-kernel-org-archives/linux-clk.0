Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7F237CD21;
	Tue, 24 Mar 2026 01:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317388; cv=none; b=O3CuzcgvDTlq9Kttujnm+aZ4yxB46h3fZ3BdWhgjg4WRcx3uH3K0pVOyeTPBCObazWFPXRkNgc95p1GA0CUuzdF1h5gu0WjuGlkpvZdQgq7Gcb4EtQL2BDeTj+rERLeownUlkv8XcbHflHcTiyX2lEm+I99TECgbgZsB5a42TEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317388; c=relaxed/simple;
	bh=Q+UquOnuGYeW6MFQGrXSMFvP8yvv6a3VrHK4iYkzm7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QNdfqRivCr7/I93AUmgV/HtLwpfyax132EnZ8VkGPTjnCDEqUpkMz3Tlk9bSAcThsMnlkt5DHvBCI8fssnmba4JINL7RzBhc0F6e7PsPq4wWtczyb3ljl6MqUug48TfcXK6FhaoR9bVTsVg6DAtiKk19plSbG9LABbPsqN6RBnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uH2Ik1eL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uH2Ik1eL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B29D5C2BCB0;
	Tue, 24 Mar 2026 01:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774317388;
	bh=Q+UquOnuGYeW6MFQGrXSMFvP8yvv6a3VrHK4iYkzm7I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uH2Ik1eLx94l2EmD8Hbkaift3AhTjMMFcDeddYf490Ve+Z4mz0SdwgcCGVeTtNO+G
	 +2TJ252DbO8c1H6lAW0xWobys8kYPVKdGfn5yr8gSSw1lMOWo9Nnqytk/KkXD+d1xN
	 Vp8iLQy95IWFC1wP5FocHNj7scoXTb7KAsjX1yujprcd6GEtpqQ3vdPaHKSFwmr8La
	 /kPc5bWAlhjUIzA64Yi2Fa80CZXjIr9Y66YdyvNgK3M7w6e0ic8HFxC12a+zg5D2wQ
	 bV+Y5TaFhBSlFQVgUWIyYr5PQA8E+vOfYlIgUSV3sOlAck++jcWl/e20PuzaOyNs8Y
	 KMRs243ylgbOw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/3] clk: qcom: Add Eliza Disp CC
Date: Mon, 23 Mar 2026 20:56:18 -0500
Message-ID: <177431737469.23057.9064236435225913383.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319-clk-qcom-dispcc-eliza-v3-0-d1f2b19a6e6b@oss.qualcomm.com>
References: <20260319-clk-qcom-dispcc-eliza-v3-0-d1f2b19a6e6b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 19 Mar 2026 12:49:41 +0100, Krzysztof Kozlowski wrote:
> Changes in v3:
> - Patch #1: Use maxItems
> - Patch #2: Follow legal requirements, add missing disp_cc_pll0_config
>   usage (W=1 build and actually test), regmap_set_bits.
> - Add tags.
> - Link to v2: https://patch.msgid.link/20260318-clk-qcom-dispcc-eliza-v2-0-8c05581168d1@oss.qualcomm.com
> 
> [...]

Applied, thanks!

[3/3] arm64: defconfig: Enable Qualcomm Eliza SoC display clock controller
      commit: 263aaa90d8aa81310db8a754c86f7299c3df9d8f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
