Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C70E4E66B9;
	Fri, 25 Sep 2026 16:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354636; cv=none; b=rH9yYf2PAKMTRlkxGkTvBuJpnU+QTD95Ui5q4DNG0FE4KpaMbvbcf/q9JPxkk5fpCSlSmGC4xmupFWaI4KYnhR2YcRgm+EpGaofmuc7cfXFqT/jCwikiQdYY31Q3XCVsdjtu5hS2LS8tZvLnoKLJG9xCDsFcHJFnJrn3RUvtDoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354636; c=relaxed/simple;
	bh=yHx8NwxzBnoFMrxYV//OhJX3kulcLV9B2su+k4CzTPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uTvWESz31m4yTZsRIxk6qfhs2zdGwBeGFCGPNjw7cxDpy4X2XrEumaS3YzZpVXcqs7HvY25CqX6iR1jBziJgyWsqwRz3TvbjZg+O7oQ+6KRfb4n+c9ZaLX0YzkUI+UN3EfWWPjbGa07q/stXc4sF57UvG9iQ879oJARA6iJMVGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DIjD3jbb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DIjD3jbb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 855361F0089B;
	Fri, 25 Sep 2026 16:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790354623;
	bh=+q5I5kgjvulP7YhC0nrJrUl6QJyFW607iPI2Z+CYqLg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DIjD3jbbOaJUNA88nIwzZS1hj2YTiBGOy7gvVyahFNotVwoh9b2iL7H7xU8j1TbTS
	 EICe4+qVPzRRs7CFYfqF+5R+MYL6p9N1N6vJbVHZKtey/tZClxwbRpdhFVgzk67JTF
	 kEKcDHBY0Q8AVEn8PYBEgr9Vny3FfXLh8DlK1Uh8fIz0QH3vzmXzYTEOdcoEL0tV/D
	 nuTqrR/g/F8NtelLnvxap0DdR3OI6BzRxSNJfe4uywGL2FppMB3KXCdkUrvKqBy+wf
	 1lju7qOYGNlFLlqTgGyQzEBwIjjA0Sjn6Sj2M/pSTlubbJBLEDruhdx+/pUPHeOm0a
	 QtVaYsgQ7K5bA==
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Martin Botka <martin.botka@somainline.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: mmcc-sdm660: Fix MDSS AHB clock HWCG register offset
Date: Fri, 25 Sep 2026 11:43:22 -0500
Message-ID: <179035461246.1296652.2086661675151126699.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916-clk-qcom-mmcc-sdm660-fix-mdss-ahb-hwcg-offset-v1-1-30dcf09d907c@oss.qualcomm.com>
References: <20260916-clk-qcom-mmcc-sdm660-fix-mdss-ahb-hwcg-offset-v1-1-30dcf09d907c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 16 Sep 2026 14:55:46 +0300, Abel Vesa wrote:
> The MDSS AHB clock HWCG bit resides in the same register as the branch
> enable and halt status bits, at offset 0x2308. The current HWCG register
> offset of 0x8a004 exceeds the regmap maximum of 0x40000, so regmap rejects
> the read in clk_branch_in_hwcg_mode(). Since the read error is ignored,
> the helper uses an uninitialized value to decide whether to skip the
> halt status check.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: mmcc-sdm660: Fix MDSS AHB clock HWCG register offset
      commit: dd867967e612719cc8c7a20065f03ae4ab4663ca

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
