Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FED369D74;
	Fri, 31 Jul 2026 03:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468294; cv=none; b=UZmBb1yWIWOkbSKcqCd9J2zlft2rlLJJgNfGI6HUZXOGvAFF3jiZqkryLm+oxMHw2/aj4xO0HK8OfLBWDSv5HmuoxFFBy9i5blWJ1RtJHYwp7xbCCxk2Y2CTJvvC4bBgmaQCP6xItVFojhRfFwarW0dQn1WG7OO07tXcCkvjj78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468294; c=relaxed/simple;
	bh=8x4srScgOSWmBEhslmDhTAtnbR77PkH8wS0966MJVdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MO0wt5aVq4mo+DWuaYqxPyK2gc117hkWGbVm8hZX6nbPUp5a8knE4VzVj2ks4VE7zTxkT52rAbt7FPSAvD4NydkfHC8aC8iUWNy+pvpzvUmdGk0ttS5m72FRro+SZFOYDgm+yvsdjmzgPVdsh2WiPzXk+507xBTTPmbugMW7/F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b304yF3t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b304yF3t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A3F61F00A3D;
	Fri, 31 Jul 2026 03:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785468291;
	bh=58Q92a1GNUUOMZKxtM0vBvuHkH99IPGYJd8aqMeRaus=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=b304yF3tpI0U42PdqjUGNmcGxLGoWtDNC96YnDuGGnMLkD08+VoKUxT8yLx3oi+S4
	 XeT+byYwWVpAa/brlpoVtYgfNex0XXXFFpxDXBb4L+xvP5OKtyTQT8WL/7aZ3mPqXy
	 jJcBgpwI7uIxQE/vh/dRMoI4equTH7dwSK+ZvKSUDIP3sREnXsELcR0YC7CkNYmznm
	 4c2VTknXoyFxctn8LWMHIUPNi/7uE5hkuga/FLKtkKVBtXbSM2WN/ZQd6HfgSQk9gC
	 P7G354iwuipl6PENYvIHUdHvUqiYLY8E1L9NCU6JapXa7ZKwHJjoXLi8r60Q3XLkdB
	 IjCBboJGZC1Yw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexander Koskovich <akoskovich@pm.me>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/3] Add support for GXCLK for Milos
Date: Thu, 30 Jul 2026 22:24:24 -0500
Message-ID: <178546826805.316815.6397600298624001818.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260417-milos-gxclkctl-v3-0-08f5988c43a2@fairphone.com>
References: <20260417-milos-gxclkctl-v3-0-08f5988c43a2@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 17 Apr 2026 09:07:43 +0200, Luca Weiss wrote:
> Similar to other new SoCs, Milos also contains the GXCLKCTL block that
> we need to control for GPU. Add support for it.
> 
> 

Applied, thanks!

[3/3] arm64: dts: qcom: milos: Add GX clock controller
      commit: 882bb27c61610f16e54caa2dc75bacf977f614c9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
