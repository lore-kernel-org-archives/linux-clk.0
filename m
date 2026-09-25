Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D2B4E80BA;
	Fri, 25 Sep 2026 16:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354657; cv=none; b=QYjbUtd5TrSntYcNADEY7m7KtuZZ+hi26ctnGQw+ClZ/cmWi8ZNh7gdDNNYpE8Ta6m0T4/04m2rkaDsTrlPFY2CRRK3ZTR76I9nO3nEixutsYqnOdx6FT3tZ2+heDmxKunhgmKdS+dLkUObw5eDdOjYO4DNnNU0mhiG6l9sx+jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354657; c=relaxed/simple;
	bh=hyK5J9mPPKwiX/dFgYJEZlLRuvfhsxSqE+XH9y9EtXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pWtHA1gFoHY7VGNAHioVvJ8uRG3dE0WpX34GgmysXxzEeap6jmiytSl5Cti3h/NDDiiKzGQptIlnJKkkbN75jlTJJNvMTWPDS8PUUmBOYoDDgT9XrgjESb9+KKPsrPJORARuvvtIC9dLTkIfMEXYAbCc5dIQtNI5JvjrFK5JMM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U6HMgdaq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U6HMgdaq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0436D1F0089D;
	Fri, 25 Sep 2026 16:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790354636;
	bh=auT01dKw9KoRKcdYjDZdalcmjamUWzwRdXmfsqdgIxI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U6HMgdaqcD+loPfu2k4ioIbTE12UhB7AWbGRyhOkKWksUe3G5a5lWUKXF/Y+GFLT4
	 aahac2FFbXJFDeOXyPhHTUo4SxXaPtRBkpMLgfAOsAogAOCehxvsVZbxGtMqU2S6Me
	 Ee4vcnt35/YQPZacUhcGmXaO6K1c6n8wFSWQukcBfY8YbKqWo9SCTMHPUT6YpyZJFW
	 ZE1Nqw3fN1XypiEhUaAOz4knNGXShmz3ZEH1d6pyHiyEu9HYjHJozaDuMFgfs7a/6Y
	 G62EiaQnB3jxmU2+yj9cI3P+fR2HiB/i7IPJFAHY9E5Kz7Cm99XXYbWZD9yBas1e0z
	 QZiw9nigcDVFA==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luo Jie <jie.luo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	quic_kkumarcs@quicinc.com,
	quic_linchen@quicinc.com,
	quic_leiwei@quicinc.com,
	quic_suruchia@quicinc.com,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 00/12] clk: qcom: ipq-cmn-pll: Add IPQ5210 CMN PLL support
Date: Fri, 25 Sep 2026 11:43:27 -0500
Message-ID: <179035461230.1296652.11291614603851605905.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com>
References: <20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 06 Sep 2026 07:18:06 -0700, Luo Jie wrote:
> The CMN (Common) PLL block of IPQ5210 is almost same as that of IPQ9574
> which is currently supported by the driver. It accepts a 48 MHz reference
> clock from the on-board Wi-Fi block and is configured to run at 12 GHz.
> The difference is in the output clocks.
> 
> This patch series adds support for IPQ5210 into the CMN PLL clock driver.
> On the IPQ5210, the CMN PLL block supplies a broad set of output clocks
> to the networking hardware and GCC:
> 
> [...]

Applied, thanks!

[01/12] clk: qcom: ipq-cmn-pll: Use devm_clk_hw_register_fixed_rate_parent_data
        commit: 02abccc8cbd496e41197ce49606d7e62e51e74ae
[03/12] clk: qcom: clk-regmap-divider: Support CLK_DIVIDER_* flags
        commit: a6c7b75f0a2841e996173183f03b1f660cdfe01d
[04/12] clk: qcom: ipq-cmn-pll: Register CMN PLL /2 clock
        commit: 2b7bf51437b3ca029bf1ce34c8bd0f6f31364262
[05/12] clk: qcom: ipq-cmn-pll: Add NSS clock support
        commit: 305945963fd7c1baf913b2d9899a3bdc1cbf9d37
[06/12] clk: qcom: ipq-cmn-pll: Add PPE clock support
        commit: 9d9326971cfe983e29050d3f4abdd236307d93cc
[07/12] clk: qcom: ipq-cmn-pll: Add PON reference clock support
        commit: e30664a4cee3096aad71f63e6d5e2b2e67248277
[08/12] clk: qcom: ipq-cmn-pll: Add EPHY-RAW clock support
        commit: c627e9d87bfcfb277082922863d2d139667fdc53
[09/12] clk: qcom: ipq-cmn-pll: Add clock gate support for fixed clocks
        commit: 0de5d615f1b698affec0c6050742c72240cc7fb9
[10/12] clk: qcom: ipq-cmn-pll: Add all output clocks for IPQ5210
        commit: 77bc1b834c53b4209b9ba3ec313caf9796367f9b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
