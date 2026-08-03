Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A567384CFA;
	Mon,  3 Aug 2026 03:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785727470; cv=none; b=Y7xsGyF3q66EB4yzhzXMHccObfNPy/HU0HlzIqZAvZKjHPZez6vlO0FBYqQRhCyeoaMQwBBzhrGJMP2Ia/xVovLBwo6T8by3xdORNREA0iEYNz8e2UXbImrhCocDI7o5AIXzHaYYnbldPaErxXMUSi0GSn4ZO3S8oFy4GpZyBA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785727470; c=relaxed/simple;
	bh=7HNBJbFKxFM2eMUHTLpylRcce7MxNoTgOI13ndIq6iI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fxZQN/sD3+h+ae7FSvtpcSuH4VVIWGAkPGyfeskUzK96Gumm9r+0LwXv/USwx2lHj5St+6kL0lxTmZMDhso6X2AZV/8UBttSXhJLzAel5a/b6xjOm/9gi2nuPNgBZk0X+684f+43Vm29khmAVjBzFTaaRxW1UUnvSRFEfwCq+CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mXTfwahV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mXTfwahV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9CB1F00A3A;
	Mon,  3 Aug 2026 03:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785727468;
	bh=MQxlVw38aA79dqzuQNsyJyFGsPhaa6Aqu6+rT7IwlTs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mXTfwahV8ZqjTVt0Cyb0lZq+gwe6z+RtCVDZPijiOfvuUEi6zPQFXV6m3Ti6xsukx
	 y4KfYGm2/AdDeyWqlKuPdCQQl8Fgt9glj1OjmuGpXQUnzWvEHFqcD+mOeFo5mYPClY
	 LgGi2cyx50xboWEgUtcTznH9coloDvmgjGXMY+Dy2nt1DKtFFOy56p8tAbRVx1obTs
	 j67HmwC8T4p0sEYlHTG+I8EaVd29R9hmQ7D2DiYfUy4SdD5EedNGV+BeWxrRB4nxLB
	 RdGaBI4eZIsVhDtDl0dzERJh2hKiMVQQ1Y1ny6qCeynawFsr9qR7MAj/YNN4TCnWT9
	 WnO1VhOsCTKeg==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: qcom: nord: fix PHY pipe clock halt check and mux ops
Date: Sun,  2 Aug 2026 22:24:03 -0500
Message-ID: <178572744540.408250.15655167921821647311.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260716-b4-nord-pipe-clk-fixes-v1-0-e4f583633356@oss.qualcomm.com>
References: <20260716-b4-nord-pipe-clk-fixes-v1-0-e4f583633356@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 16 Jul 2026 16:29:10 +0530, Taniya Das wrote:
> Fix two PHY pipe clock issues in the Nord GCC/NE_GCC drivers: the
> PCIe and USB3 pipe clock branches poll BRANCH_HALT_VOTED, which can
> spuriously time out since the halt bit doesn't toggle reliably while
> the PHY is down. The USB3 pipe clock source muxes use
> clk_regmap_mux_closest_ops, which doesn't park on the reference clock
> when disabled. Switch the branches to BRANCH_HALT_SKIP and convert
> the muxes to clk_regmap_phy_mux_ops, matching existing conventions
> elsewhere in the Qualcomm clock drivers.
> 
> [...]

Applied, thanks!

[1/2] clk: qcom: nord: use BRANCH_HALT_SKIP for PHY pipe clocks
      commit: 3a8a7d597b07ffe388b47fb524827be52c9f7e0f
[2/2] clk: qcom: negcc-nord: use clk_regmap_phy_mux for USB3 pipe clock srcs
      commit: a5c2859ffe9c8e033e2df1ef62357fa5692008f1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
