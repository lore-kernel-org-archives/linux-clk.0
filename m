Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169439;
	b=D9zUvQj+hYFMfeyERTxhXVtDiwobXxwbrUjuj6ZPMaskIRvguE4JQixXqZFxxtcllVS7
	 pat6CO6CNnKv9en7I3Lh6grV6rRBO3vhzEiAP8Kxc4BHGs+mUQw7M6OKuNuiQkTg5TyOE
	 QNf0g8JHbNIgFV2BI5zfz8rQubqfkD75F5n4g7f9QwXSc7hMW4EpXqBmxgxmxJsXPR25d
	 Pc2hrKcBr99l0AmFi9ivOdPDHQ3mJFL0BjLwMS1d0PxYqxe4jnX34flxl7BQZL0Lygjl4
	 hnAuOPcNaWFiycP8BrBNLy5oh+Ddf7GpYaV90F833ygLx9N6yiM4p7l2kbkkSfs4udg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169439;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=BGcvcC81mrUpXWsEyb4n090+1/2hC7J0l5mwwAMJeXg=;
	b=Kvc7RB3ro+soOGklFONl5pe7q6b+a5qkAefklv5iAJzcmw6UtQtSdXTe8OEmtzpwOF1M
	 dIUiS4tF2s05ce60Or829odxQWDXX/uQPRbADkL1W9uGu3xN6D8qrFERSxBTzZ1cVCvLJ
	 mCiJpPkRO+t7nXO+udPp7o01ffebNeOjgya10N360oguIEbbBp4GXvRSAeOGUDj9tgLPF
	 ZHh2E++liTX08GM7fMGbZrcYGLhcwlBu1iNTS/+/C+rKq67jQbS5tTkf51RFGHTEtP5DZ
	 DH1B3RfnRChYJGbTRUSqV2LQ+sdnW8K2SjzboOEVRCT1T+dQGEWUoZVT9RD1e32NoQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=btqagmAa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04CF60762C1;
	Sun,  8 Nov 2026 20:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=btqagmAa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C222F1F008A5;
	Sun,  8 Nov 2026 20:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169439;
	bh=BGcvcC81mrUpXWsEyb4n090+1/2hC7J0l5mwwAMJeXg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=btqagmAa37j+JRG51H/Gd7Si2YqJ9h1QFMPSVwoPgE3JjwNJRPR7v0BV9aGqa3d9x
	 UYeOCBpN8NQKUcPGLSyUV2QORaupy8BlZFXpfFeXT2L0sQeCqmDiAcHn1ONVWYS4Be
	 f2dIT6/Dn6ffeoUcIybVCwZZxRQWaxjn9JhiyjP6Aa6pbGRhAIyJ19LrP48sjx1qLy
	 SFYWVib6+hv7+EDGtJvKjpKLzeQ8K8pnOJmlFTDMPzpXdTIN4rptIZ8dmJr4E17hiZ
	 uy97izoE5wA/+8ALeHb0vglFmUG5kgt1cQwEgdS/NZlA34KuJvsI7l2XJu5UZfln2K
	 xXCpHCEB983JA==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>
Subject: Re: [PATCH] clk: qcom: gcc-sc7280: Use retention for PCIe0 power domain
Date: Sun,  8 Nov 2026 14:20:38 -0600
Message-ID: <179416929508.628393.16454532877848877294.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261028223444.2683120-1-m.szyprowski@samsung.com>
References: <20261028223444.2683120-1-m.szyprowski@samsung.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 28 Oct 2026 23:34:43 +0100, Marek Szyprowski wrote:
> As the PCIe host controller driver does not yet support dealing with the
> loss of state during suspend, it keeps the link up and the resources on
> when an endpoint is active. However, only gcc_pcie_1_gdsc was switched to
> retention by commit 1a58ee1330b2 ("clk: qcom: gcc-sc7280: Update the
> .pwrsts for PCIe GDSC"), so gcc_pcie_0_gdsc is still powered off during
> system suspend and the controller loses its state.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: gcc-sc7280: Use retention for PCIe0 power domain
      commit: 32e7501b4ffe59905e8159eaf2b78fcfc1efaf0b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
