Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795125382;
	b=qOjDLKP9ZoINOhQp3W8b5MP0b4M7r+tt8xbvLBAFOziICEqK+a1uGZYtI2H0G8lYidUf
	 z9vnxRFbmGFbVUvoO11FVKWE153eONE2i72OOZtsGBo7iT4oJGtUAWyqaYLL+lOhT++ti
	 0b3/aWTQxmUgRDNJpwAckPM4hLejD2/Whrkwbijjm7bH3IX1stBNchvBltxooQMpYEOns
	 eI9o3XWYfcM2PYRTUBFuiu7+f/BYG48oKDTZaHMZz55+yEaTGwfMjexD+sqU+9GUQ1I2z
	 pghVQNoey+qZuxEjmcpCXdeOjlxJbgr9LNmfCvkFEYZf/s8Ki3kHd4AoSySxWpmLvlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125382;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ZblwJK2iHe3k2L0afzyclmJ3D3hFoCfU14y9a0Jk4KI=;
	b=A7DlFSWh9gdfvyMD/IoGWJOOqeN0d3SFT45oY5VHVkox1HSvFdIy56ykSe02cyQzNQWd
	 xwvEvKmXWMiEFuYYlkGVmpJU+UdvbLhfXiohVBkVRrDY7xeYxNDFwDMUKk1bSXXhygwRZ
	 rdltTVuXb2EEyqlgiWpmW7eNyITwCLBQKlkl/eFAhanJsNrelF7brXoOhKxfnIn6Xmse2
	 14lLG+xRg+sQUbIGGjiddFEHtasCKp5jt21l4FIM2yfIkGw5v8+trbidIjScn7CkEfASP
	 29iuFWtkiy9JY1WrspJYEP15VIcfGN9JVKXx+EsOPkflMcoqkfsMvdaweIoOsMY8YMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O7VHQ3Ge;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DFF606A320;
	Thu, 19 Nov 2026 21:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O7VHQ3Ge
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C43B31F000C0;
	Thu, 19 Nov 2026 21:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795125382;
	bh=ZblwJK2iHe3k2L0afzyclmJ3D3hFoCfU14y9a0Jk4KI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O7VHQ3Ge88oxXPXSTvsSMKH11AYkgambL5GxCxnG7cQ7ln98mUWNYUPlWKpHg7tGp
	 YEOY4VbFbAncGubEClbHKkmOEND8ILkRC9Ege+tIxS8aCDZI5UpnqWksqlfrIpjg4L
	 1raBv3xwjzllh2TsOLN/LG/Vmjxoo8P3mioR0+ezjdQoE8tKXX8NwHSihtzzQk8+Oz
	 O9ywBwe+hNQgeTqu4kzmDn9rEemPtCAPhH/iV+bEuH4bwk1rNKMjYB8pvtCPDySDC+
	 1Tf3+PmOfvmZX1AWNYsu5hqj87qQnli+VzGUWz3vS4a3AnLss0GPFGPuUxtx387kzH
	 uE3S0LoIyM9JA==
Date: Thu, 19 Nov 2026 15:56:20 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Demeter Barna <me@fromdisposition.org>
Cc: linux-arm-msm@vger.kernel.org, Brian Masney <bmasney+clk@redhat.com>,
	linux-clk@vger.kernel.org, Jerome Brunet <jbrunet+clk@baylibre.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, linux-sound@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH 4/7] ASoC: dt-bindings: qcom,lpass-tx-macro: Add SM8350
 LPASS TX
Message-ID: <179512537987.817801.2666339607222751683.robh@kernel.org>
References: <20261104-b4-sm8350-sound-v1-0-4c872df294fa@fromdisposition.org>
 <20261104-b4-sm8350-sound-v1-4-4c872df294fa@fromdisposition.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104-b4-sm8350-sound-v1-4-4c872df294fa@fromdisposition.org>


On Wed, 04 Nov 2026 18:07:12 +0000, Demeter Barna wrote:
> The SM8350 TX macro is LPASS v9.2 as on SM8450 and takes the same
> clocks, so add it with SM8450 as the fallback. Use "contains" in the
> clocks condition so that it also covers the fallback form.
> 
> Signed-off-by: Demeter Barna <me@fromdisposition.org>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-tx-macro.yaml       | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

