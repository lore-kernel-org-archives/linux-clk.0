Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D3D344DB7;
	Thu, 29 Jan 2026 16:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769705830; cv=none; b=XT6Oq7amH9LyEb+Dnzh74OK2oRA3ukyQUCjOULgkmInNcnf3SaiOH8KCu6JBDxTOlFQwZuyrI3j3hU7bcClQcdtPKpFmdWbu49I3pc0a+ummY7fG3sThCoqZZcTFn2o2jF2FoNTaJb91eqqZrCK/WzQ8QOs6oyetcQducUAHCmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769705830; c=relaxed/simple;
	bh=2nPxTv6LjlTvR12DUjaUr8rh0oOFIAjfRLDwDhN7uIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l2g3Dx3etROKMtyc9I34lrsI96y1VKv3xzqVei9qH3QZBgj42k81cWHcRv4y2iOE5GOYzWbBFMFziSNxBIlQLFwrHQ6FQPiUu9GWMARE8uP9/93K4gsPbeTpnrGAY5wZbjgbIEH4y3W04dBMrzxYAAIylO3SnRvuEbGS3vdqSo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U8C2Ntp+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U8C2Ntp+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFFA8C4CEF7;
	Thu, 29 Jan 2026 16:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769705829;
	bh=2nPxTv6LjlTvR12DUjaUr8rh0oOFIAjfRLDwDhN7uIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U8C2Ntp+Ek3/Qg/ntJZ+iPBT0LTqR2Ob20Ojrhg+jI292GyvCq5T1fnsEe5b0sbfb
	 pDVXTnSt5tWH8/cNU4NPtOr08gEylLIT/L6P4g3N78yBqlMRMyxH2EN6yJdXrmW9Yh
	 zTs+PcL3k1nbYegyXc1yHzoCIy4WWz1QQEkxuAmWGo9s1lrficJ/UMLRXJVMtfEuu6
	 BvlQiGA08lzxqcq4R/5lgbXuWw8tJBAY63c1mj4JbKMNRfOyEtFM0t6E8qrxIl52Cr
	 Szx7feMAPHLDazNzDCAK4PPxL9/Pk/pB0staNlm8vZrz9YQQCxD6ivfDfsdRb+BhVs
	 FZu72yx2tGYkQ==
Date: Thu, 29 Jan 2026 10:57:09 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lukasz Majewski <lukma@nabladev.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v4 3/4] dt-bindings: clock: vf610: Add definitions for
 MTIP L2 switch
Message-ID: <176970582841.1274070.1737722961522823668.robh@kernel.org>
References: <20260129095442.1646748-1-lukma@nabladev.com>
 <20260129095442.1646748-4-lukma@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129095442.1646748-4-lukma@nabladev.com>


On Thu, 29 Jan 2026 10:54:41 +0100, Lukasz Majewski wrote:
> This patch adds VF610_CLK_ESW and VF610_CLK_ESW_MAC_TAB{0123}
> macros definitions for L2 switch.
> 
> Those definitions describe clocks for MoreThanIP switch IP block;
> the switch itself and the MAC address lookup table clocks.
> 
> Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> ---
> Changes for v4:
> - Do not change VF610_CLK_END
> ---
>  include/dt-bindings/clock/vf610-clock.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

