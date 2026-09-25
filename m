Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D22A4EA368;
	Fri, 25 Sep 2026 16:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354650; cv=none; b=T0DzaFjydSSx6uv/omFBqqaXHw86JnMIRYz353KuaKRkmWdxjdUOSvAKLBv8MlZNxU11LCiBv+oLgq71PyVq92n75Kixwt0jzaZohGYPkt7P1SodA3Ok6/ycqpYwdUeYiML7P3bgwDkeSroIybs2R+axkQvSpU9A1SvLtF/dX7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354650; c=relaxed/simple;
	bh=0QjSPUV2mLNIMJVpzn7y22XNazVaWOpw8QtUVslXs4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xv3XIXEQTRAXHs4zIYVpEIkT84XhItgwW652cCt9nepu0cqGiuS3CDEx9Jv1FKVR25vqFk+8ijivCjtUacTjN90kuFIuo9wqSXnwTIXHTrWsh7MhqPEFyiecDo25S0x2PFiVizxtO3f/vHboRcpG0LOfK/xTn3LXyiQUHY64Bjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=glnhtDTC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="glnhtDTC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 969D11F0089C;
	Fri, 25 Sep 2026 16:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790354633;
	bh=UfJj5X35VFR0hL/9LFgD4EpW4YjXuL8mq6Rrb6Mt1y8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=glnhtDTC+BxTNZ6ND0KBpyRBq1cSpiwoGHgWIZl086uLvBdmVjw87X6Wp1QnY+P1m
	 NHP80IErETdU4GijrpDx/8m80GDR4IM2Ta95GErn0TsIrjb+/a5jMa/J3L7tNLOBNm
	 pQ90g+2uTOGi1H43AOsx3PrvwhaZoHXKCUwyGNEkzhSp6wePKHQtu7TfyTSx2YeEwi
	 LJDjOFU9F20bsP44pP8vE5MZk1yEPal7jAdgHbBO0E6G1vOn5dB01gZWsr5TBaZCWH
	 5boOSNzUhQvJHwr+JeR39KjLAiS84qekzsWUQgiU70szNkqVZF11+pqO1iA8gxe3Xz
	 vO6TqpbY7bF5Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] clk: qcom: glymur: Add rpmh LNBB clks support and update UFS mux ops
Date: Fri, 25 Sep 2026 11:43:26 -0500
Message-ID: <179035461235.1296652.9489845377688945023.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915-glymur-ufs-clk-changes-v2-0-d0aa1c60c269@oss.qualcomm.com>
References: <20260915-glymur-ufs-clk-changes-v2-0-d0aa1c60c269@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 15 Sep 2026 17:37:30 +0530, Jagadeesh Kona wrote:
> This series adds support for rpmh LNBB clocks and update the clocks
> ops of UFS muxes on Qualcomm Glymur platform.

Applied, thanks!

[1/2] clk: qcom: rpmhcc: Add LNBB clocks support for Glymur
      commit: 8021bdc3f4fb8d9eecbe01cdde0d3b99fd76e37b
[2/2] clk: qcom: gcc-glymur: Use clk_regmap_phy_mux_ops for GCC UFS muxes
      commit: a1720f3eac0f32ae7079103f57d8aad3fa816f10

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
