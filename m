Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05942500A8;
	Tue, 14 Jan 2025 08:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736842435; cv=none; b=lKnB9zlFShKgOl+SPM9kJgg/vonWQQeaGux6A/3UOlw6060piHoF0CesBROpjbMU5jsMTrL2T6HXQKDdu3T6a472Haa9++8jFPj0IcOtvzQ1DrtBKOELd/o3zz1UFgRyH5KQHPggObRAP0+OdNuTGiH6CliasgGYvEivGzDMrgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736842435; c=relaxed/simple;
	bh=4ClXcc+yoIv8fGvL3au1hEk5msyMnUJUrObGjjguQyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kg1JqibPGmGKz9FNIKS08BqIr1fsj2BC4rCpB6xc23AhTNVNHvWSQGO/AyLG/EcF2G53n+aXTJd+FJj6j3kk921P2q1hmGK99/HgZ2BmgQ5hb+BsSgAGRd7+oPVvvPua7tqtJfiLoG2eg0h5Oc+Nah0Bx0fNYwrAOciqXPj4hEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vm5YCZZ3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vm5YCZZ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CEBAC4CEDD;
	Tue, 14 Jan 2025 08:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736842435;
	bh=4ClXcc+yoIv8fGvL3au1hEk5msyMnUJUrObGjjguQyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vm5YCZZ3GcIBaHzz/mEOWIW+kNpnIeg8Uh4vSPeihqA5xYxDV45GbSMuPBIGwyLE/
	 aZWbY+yaeYsCgfCrV4HZehUiD/X4mBuFTAjBkAeRwG38b1gOq2FXWrZJDuAsqG/Dal
	 DFyeDWROKY9hGDcjLLKB2naxnNY6laUqXxCee9Tathv4TVXNTL/1+SWBTYlWj9BLf5
	 6WSCWAbfplB/NnxPK6GcYshPqtoYYKpHLBy6oTojCZ33WsUN24EDKUGoTpfqfZQ6el
	 Dl3Z2q79kT553ZzbNvhaojIPdWBeDqqcyniBma8AdDGxlbV93Q+3HIgLs+Zyrv8eq5
	 eWiC4Pxo0qIKg==
Date: Tue, 14 Jan 2025 09:13:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Abel Vesa <abel.vesa@linaro.org>, Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org, 
	imx@lists.linux.dev, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: clock: imx8m: document
 nominal/overdrive properties
Message-ID: <v6bm2wnlsdbfvcvpo7p5azbe7rqrssjz6kehd2aex47mldot7k@45k622hphi7n>
References: <20250113-imx8m-clk-v3-0-0d6e9bdeaa4e@pengutronix.de>
 <20250113-imx8m-clk-v3-1-0d6e9bdeaa4e@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250113-imx8m-clk-v3-1-0d6e9bdeaa4e@pengutronix.de>

On Mon, Jan 13, 2025 at 02:42:51PM +0100, Ahmad Fatoum wrote:
>  
> +  fsl,operating-mode:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      The operating mode of the SoC. This affects the maximum clock rates that
> +      can safely be configured by the clock controller.
> +    oneOf:
> +      - enum:

Just enum, no need for oneOf.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

