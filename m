Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C4436215A;
	Thu, 26 Feb 2026 07:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772089632; cv=none; b=tgSr0BSWwTMR2kBMtmTGKnc74IAyFLCO2vziAeVgXBQ6b8Y/2sf9eY0CxEAZvyqqbpQk7DJiCw35Q2dnW6zgLrOi6A4XNEWsw84Mnd3kVUHBnWMWCzGaL3zS0XOoNw1CyPsp78lJ0KtSu+WaCEtRBkdvBDCOEP8/icTXpGE0gMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772089632; c=relaxed/simple;
	bh=AylNgwICxepLB6UZgoEZD/7/lypOxsc3O1VYwovI09Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dV6puV2tO0U97fY0DXNv74+2mTJoOfRxrkDB4p89arNuJsHrlbRHfk2SPatjw0pLtVl3282+iPn171BxKR3d5PmNXlCEbGAA9LYaQC/93G2VUrB6NQSn1IGDWCNPfwIe0EVctwqdiHKwQr5vOXcO2NyWTKY13siPnOsJlmPJyM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qSnq7EBM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qSnq7EBM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE735C19422;
	Thu, 26 Feb 2026 07:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772089632;
	bh=AylNgwICxepLB6UZgoEZD/7/lypOxsc3O1VYwovI09Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qSnq7EBMVOHFwOji0ctLm9FL1HenrB+ofeB4xNpTErQoF7Z65SFm+o7Ncxik0YiFU
	 Xy7DgGwciAsdhGkrg5zn0yf0RX7fy72/v+VtGkeRKwuM+yh9sEJMOvRiWLViwbdXpm
	 lNr6M3SrQVai7cQWunaKQQzvr22INp8kPs383GLCWls8AO6qNMsuwRPMCkzIIUQTf2
	 CIlHqAWsHRxjD+jJAa1Uz9yRdUFJDvOEpbAIDhRsBmkGgSBGF2FYpf6aGc2Qn65vdJ
	 k1DnHShoBZBd+2GAWaP30QFGTf7JkbTGT0MAGq3WHdjF4EHaYcjujUHUJn7/0vhj50
	 jQZgcP3eCO+8A==
Date: Thu, 26 Feb 2026 08:07:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH v8 02/18] dt-bindings: media: qcom,x1e80100-camss:
 Convert from inline PHY definitions to PHY handles
Message-ID: <20260226-fluffy-complex-malamute-7ecec6@quoll>
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-2-95517393bcb2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-2-95517393bcb2@linaro.org>

On Wed, Feb 25, 2026 at 03:11:19PM +0000, Bryan O'Donoghue wrote:
> We currently do not have an upstream user of the x1e CAMSS schema which

We have. It is in released kernel v6.16, so almost a year.

> allows us to make this the first platform to treat the CSI PHYs as separate

No, it does not allow that. You cannto change the ABI.

That's why I reminded multiple times before reviewing new CAMSS bindings
for Milos and something more. Because once it gets accepted, you cannot
change it anymore without valid reason. And there is no valid reason
here provided. I kept these patches in staging/waiting for long
enough...

Best regards,
Krzysztof

