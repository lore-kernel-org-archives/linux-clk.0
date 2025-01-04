Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815C4199938;
	Sat,  4 Jan 2025 10:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735985805; cv=none; b=QuE1en8+cWLb6jZNGs8PMJ6cekyB70cDU9EbEHd/X0Y9qSYGZPUijaHlFMBs6Dbo9yPe9BVeez7guSL0em5PpsCppXwXmZwX/ov0bc/xJyUG7D9tiSqPIv82yVR91L/c491tFArneCtHdS+0u1AYjn+RTL0mcCV6ws6MjfNpci8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735985805; c=relaxed/simple;
	bh=2T3ciO6m0fCtPynwh9nbyV7VVGdi6rid7fRO8GjcpBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EAGmQAbefbd037N9kcJHs+Qxf6vS6qVWlCRxz5TRyOMjEPKFMxmdCGt++HlDqFppkdYyuwH3cHNdpcti2REXnt2ZgMKFiGPNAaiWyOJctLo2yAjX3DSdJkijI9OUJVVHtQP1cB5lRtYRfEHtc13ymppgWrqEQHzhdzRSD/+sJlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lowWq/CE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lowWq/CE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551F2C4CED1;
	Sat,  4 Jan 2025 10:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735985805;
	bh=2T3ciO6m0fCtPynwh9nbyV7VVGdi6rid7fRO8GjcpBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lowWq/CE7cZBlIwEINO9y5sbUhfF1EDr8EmDShKB3l5+8YdWIwMFM0tliVJO5Kw5R
	 ShhUSiOKMHWO99aY8bE6Y3KQhrMgZALSmmNiGtj2vtIK5+o37tczA3QqxZyYRZpKQs
	 laJiCm7XlP2bB6L8I8Hmkc9YD2TIvcwWAlJXEXXYtspOjEhTg/etPocPmrj/R34Isq
	 3Kj1E1iaiKhOYz42+VrGyo4DfByznGMx7ZBoUSmOsnL2PYJRfSxoKGRtaJs/6yaO1V
	 nQrDA2PkYdWKaECuKcaVaD/n7q0EKPEBdQYBuXNIArYDgzVThDZmcB0zVgwYXdphZ5
	 VjnYbfjQ5cZ2Q==
Date: Sat, 4 Jan 2025 11:16:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Roman Beranek <me@crly.cz>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, Dragan Simic <dsimic@manjaro.org>, 
	Frank Oltmanns <frank@oltmanns.dev>, Stuart Gathman <stuart@gathman.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: sunxi: Export PLL_VIDEO_2X
 and PLL_MIPI
Message-ID: <pc7en2jjvce6et6s22sdfooixxxos4u5bitcfhylt7ms65o7wt@bxdvnyeus7b3>
References: <20250104074035.1611136-1-anarsoul@gmail.com>
 <20250104074035.1611136-2-anarsoul@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250104074035.1611136-2-anarsoul@gmail.com>

On Fri, Jan 03, 2025 at 11:36:57PM -0800, Vasily Khoruzhick wrote:
> Export PLL_VIDEO_2X and PLL_MIPI, these will be used to explicitly
> select TCON0 clock parent in dts
> 
> Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux")
> Reviewed-by: Dragan Simic <dsimic@manjaro.org>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>

Where did this happen?

> Tested-by: Frank Oltmanns <frank@oltmanns.dev> # on PinePhone
> Tested-by: Stuart Gathman <stuart@gathman.org> # on OG Pinebook

And these? I cannot find traces on the list.

Best regards,
Krzysztof

