Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D833EBF37;
	Fri, 23 Jan 2026 18:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769194614; cv=none; b=JzknLcFMSL2YxPaV2594ySekthXZNHPCPoREhZLK2zR+iLU/uTCwsyDClNnFaz1f3TnwiU6AceZRYdLMQfsgy2I8drpWHe1yKV+V0pmQqmHIgUtfNV84H1GEIySvm7a8o0VxNTV9UNaRwkPyaBSzoBdkh/yXmEI7/pa+AcTr0u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769194614; c=relaxed/simple;
	bh=cixswUpHfyZi3qpQCfZc/4dJqzaj+l66sMvUaGJa74c=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=QJporvX/ZFnZ+B5mCooTi9qZAVFaELVCHa3KANonYraPcR8ZHvgdN4H/d27ndKjHiwtMIGxEvtv+hYMngkZtPkbU9Akqb8Su2vU/diIOInjpQ6VnsvzeuP0mZemuZ0mXkIAwQUtpFSVYkHzKpRM+4zP57zrRcD1g4sItwk8oadI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OmwEA/CZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OmwEA/CZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D29C4CEF1;
	Fri, 23 Jan 2026 18:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769194614;
	bh=cixswUpHfyZi3qpQCfZc/4dJqzaj+l66sMvUaGJa74c=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=OmwEA/CZayJSVP0Nu4nVgkbCG7J0p4G+jeExjXX9NFo7xNT9AfyOFLhcWuPe/tQlr
	 EapuU4YnV0s3+CzAOv50WlJ5z26R0udbhdGAJMeygclGH+EIBg641Z0Wm+E+dsc3QT
	 wvpAMGRSogfK4VKNuvj0T3iTrjnsVA+jaFFbg8UZOVCCgNVWmrneXNSm3qJUOBWraf
	 aC9UCiL8yWDEZJyPRUUxNJjpyHRyBeDv74WFN/R2gwFHD8Y9Iz36w1trqwa6cmAoXi
	 jxz4ALJBOFy27uRU6ogq2xijPWveUH4gEOYb/qpKOYgSgrEjCLfxpuZOKDehN9yZgy
	 /wwEO/677vE7g==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251224114210.139817-5-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224114210.139817-4-krzysztof.kozlowski@oss.qualcomm.com> <20251224114210.139817-5-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] clk: zynqmp: pll: Fix zynqmp_clk_divider_determine_rate kerneldoc
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>, Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Michael Turquette <mturquette@baylibre.com>, Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 23 Jan 2026 11:56:51 -0700
Message-ID: <176919461113.4027.10346884199457325938@lazor>
User-Agent: alot/0.11

Quoting Krzysztof Kozlowski (2025-12-24 04:42:12)
> After renaming round_rate->determine, kerneldoc does not match anymore,
> causing W=3D1 warnings:
>=20
>   pll.c:102 function parameter 'req' not described in 'zynqmp_pll_determi=
ne_rate'
>   pll.c:102 expecting prototype for zynqmp_pll_round_rate(). Prototype wa=
s for zynqmp_pll_determine_rate() instead
>=20
> Fixes: 193650c7a873 ("clk: zynqmp: pll: convert from round_rate() to dete=
rmine_rate()")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Applied to clk-next
