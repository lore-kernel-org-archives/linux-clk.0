Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795125397;
	b=ixYn30mzpLw+XzYuAYl1zjNB2OaNQSn6wd33YF88wH7wbLcgES2OHUiNM3dSWnF+aDgU
	 nQWoi+dBZMFmnSuB1eqj1TwMwxkNo4wtc6siseVKUOyLsLzNnt62RC/w9/bWpJB8nZe0l
	 DyFtt0NvtwGRcvrORW4jtaUtbhEAVvS9m5yAX4FBJvBcNDZ8O3AFHg8WIF7c4ChqcXvWC
	 JLaqOhIdOMw0MeP4FDrteRrK27jb5bT4GoWlplimE/CZyq2XIVXHwJtVNiyw6t8xZau1w
	 BUVlncxmnUxl0IC1cbkwEaPbHBVZ3ZSUTM81wFPYFmOiaQmWCh1pCnVtPhdjkvE0x1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125397;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=L/Jy4V+PyZU34S/e3EUFRLndEkl/ZM2AUC+e50GkKc8=;
	b=H6A52UBK0Gy65UfSNrez7bZxGNThTecb6qqVByeOT2NVDVNd62XSDTxIxgViMcQ7yo18
	 U5ptTO5aFGloSceA94Wr6dy9g4YgRs4ZyA+TAeBVqfQmdK5woIqvMYdMVdWz+hinHIxu9
	 Vgi957zRew/7x2Kdl5lpsbpdodJADr6ZozlHwHta6tpXfToFDoK+FtvdjjqswPgh1Okp+
	 EYzbqkFdWGAI0MgIojRibfxSZRTWga8IF1dRvjz4DZEAotPAKbEBftJZJ09/NtETYTThH
	 lESenfRoL/J96gLSQ8vsFmVrSOS7KkDlhllr7uA2JCoxqc6yYp4WEgh5LzLeBhQlr2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fP3onf+F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DDB606A32C;
	Thu, 19 Nov 2026 21:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fP3onf+F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E91F1F000CF;
	Thu, 19 Nov 2026 21:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795125396;
	bh=L/Jy4V+PyZU34S/e3EUFRLndEkl/ZM2AUC+e50GkKc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fP3onf+FbUqotF6sO7L3gndNCNmAiUpDuZ0G4wNGid9KWAXO1s5rd32D3F02ztVLP
	 +0pPhLJ71+fHdMkflOhD8sVVeepCI5QkOm8WpDpHWyaGUMVrIkdYZArPPbW09FtvYI
	 0Lq9NzV782ElKhMgeeUKBSZzTmfhwNIvqhNnudc8V/3aXNecIeF36+ey/9KmIq9ARP
	 reh82zVKF2NUzu9hm4QhdFJ4RPiSuaWu7prGzUzEfpcfHVNVLeoZeHuGWtD+uUjBWc
	 2+VQ+vYzQQw6Gz2MnqBJwKZOMbqdYz4rElsQs1q/0f0OeuugrLTBNYMM7mGtcMIFfz
	 /OK9lMJ44Jb6Q==
Date: Thu, 19 Nov 2026 15:56:34 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Demeter Barna <me@fromdisposition.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 3/7] ASoC: dt-bindings: qcom,lpass-rx-macro: Add SM8350
 LPASS RX
Message-ID: <179512539445.819070.8981429621016186408.robh@kernel.org>
References: <20261104-b4-sm8350-sound-v1-0-4c872df294fa@fromdisposition.org>
 <20261104-b4-sm8350-sound-v1-3-4c872df294fa@fromdisposition.org>
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
In-Reply-To: <20261104-b4-sm8350-sound-v1-3-4c872df294fa@fromdisposition.org>


On Wed, 04 Nov 2026 18:07:11 +0000, Demeter Barna wrote:
> The SM8350 RX macro takes the clocks of SM8250, and the driver handles
> it with the same data as SM8250 and SM8450, so add it with SM8250 as
> the fallback. Use "contains" in the clocks condition so that it covers
> the fallback form.
> 
> Signed-off-by: Demeter Barna <me@fromdisposition.org>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml       | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

