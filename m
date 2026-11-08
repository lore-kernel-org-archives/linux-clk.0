Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169499;
	b=HkgcudmZVoLx+7AHhQJ0fckkZYgg6MbKHjwpEyIsazSOgNCUchi+tqMysFH6Tfl/1C9/
	 ixO0Feufmj1+rUy4VYmEHq5RzSN+T22vl8bwcghnM9oXZFKcDXzSrVAPtn2UirGCi7KNq
	 Llmy4BAnwWxFcOSOYncKADWSJo9qtKEkx1c0j3yOkIwTpILnN5L1xGvpBmaTnoFxKyXaO
	 unLiM0YZMgFXmDYaMboHGwzhvCWqLq99V1qPSBXzUDVHYKt4LvCQLHeWp0h5HHFjpz+r0
	 NYXJI4YGABKSwMYHyI2UINGdsxs4LXJEj8tGoqzklun+wUa5CPjzfxneTjRm93Y3FGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169499;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=lP8mpE85HDMBXvaAb9Nalc0HVWoFE0TAbp5Y6y9tAU4=;
	b=UA5XhavL+XY8CMKHmN6wv7BmAi7USekvZO3dtGXE5zYjevrM/TKqebjtQCrRnuSzMl98
	 RLWEMSGiBS/anC6w92+iVp5FA+L5stwS4SzzYwT9PVkXbCk8LgXR/H6QixYdJJM1X3G5A
	 QfVe7W7uSQ0z6hFLn8uS1xNkE8err68Xj1U/j8b+97PK/5FOUYbGrgWi5SV6soiDLReaI
	 pLpHm0kMOA1GrTnik/SGdRrcKF8lwlm8S0eVM8qbRHIrr0jtLMD067m+QrXSTZTxnPQE4
	 3yLXbInaayZT1jh1JFj6eGm88I+LvpuyvZFHObPsPD9zvp0JinIRf5d+MI+AZZg9zgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RRwttH+W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7CE6080C6A;
	Sun,  8 Nov 2026 20:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RRwttH+W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 770F11F008BC;
	Sun,  8 Nov 2026 20:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169498;
	bh=lP8mpE85HDMBXvaAb9Nalc0HVWoFE0TAbp5Y6y9tAU4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RRwttH+Wy2M4oHexM4VJghUlWsJEEoEPLl1Mxz9s9kvRho+QuPHjA3b9RVzyPZp/b
	 6VRgyUIc4739N2mWDDeTlGLiJJkbLsky8fF36wd4T05aQtpssI4NFDgWAu/SX4mTIP
	 Hi2OofPG9FOlEQMHuj0hYd3hWAWbGjDh3FIZ4d/L1AaAaIZpT3rLadnmsLiCHXMgb3
	 +JV8/yp5pXkPonFWAsnRqUTgJUTJSRNeBtsiJWOhNHO5VDwrck19fLAgxTN0fXrY0S
	 0LV3CxMp2l4ruvcT4eF+gvqxHY9gc5F3ECpoua3y2yLlZZy50i/33UTnbTPI3uSKxm
	 o0Ra9DKjUGiKg==
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-glymur: use collapse-voting for PCIe GDSCs
Date: Sun,  8 Nov 2026 14:21:24 -0600
Message-ID: <179416929499.628393.4374705363796025963.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261028-gcc_glymur_pcie-v1-1-a2163e1d2b9b@oss.qualcomm.com>
References: <20261028-gcc_glymur_pcie-v1-1-a2163e1d2b9b@oss.qualcomm.com>
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


On Wed, 28 Oct 2026 15:05:32 +0530, Taniya Das wrote:
> The PCIe GDSCs can be shared with other masters and should use the APCS
> collapse-vote register when updating the power state.
> 
> This is also needed to disable power domains that boot firmware enabled
> through the vote register.
> 
> Describe the collapse-vote register and mask for every PCIe and PCIe PHY
> GDSC.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: gcc-glymur: use collapse-voting for PCIe GDSCs
      commit: 60521e4ff9e7f1b41758f387842d73667a7f0410

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
