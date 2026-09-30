Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C897E3C1D50;
	Wed, 30 Sep 2026 10:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762938; cv=none; b=hvFs4TddArvrdLGVSK5LvWYSIaMGX7Erc1HecA8xmFXbLwR38YfNfL6JL/ocKFA41XsYgBcPRnx+lpDgCnkaT9msbz6o8OQEC+KBrKLSJzdLj44798hkUYK6iJfH6dT1MC4j8Quac9HdnMFCw3wJ2Fe/rGasU/h8zlZx7CmtVvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762938; c=relaxed/simple;
	bh=buCFauJ8I1YR713FwXqzSWSJ1tE97/QhQ/t03u4hOEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wr4VV2zU5tkDY6kLfAmJkdTEywKdKzJFNNqma6D/Z35kBefnA5HIRmP6UpLz/vMbC14RDxWHHqChtfJx3u0/jrxNLWQ8ygw+Ed/wYEuAKpOq/jGc/diMdDF+sXIckFMqbxEMBCN5lCzwa9xTbTz8RkmXwxlT4A1TLpMU9DGEaFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hZxfu/o6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hZxfu/o6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 741F51F000FF;
	Wed, 30 Sep 2026 10:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790762937;
	bh=pBwNF67IVGVLonh6bLp06bYjXyfvFFbgj27kTxohZtg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hZxfu/o6KtJngutnETKwZaEKPZvZmscsFdJ0RqI679tuJ3B3JqqutWA4FvU2opCri
	 ZeSGAuIgyYddWDwHdsD3E727rSlm5ZZ5rbzhUN70iDvNT387n+gi6hsSVvmmUy1fCM
	 fVUg9Fv+acBsdK5TWlZTJ5Lx4thvPUA5gKLSoLgce6XbhCff2y9LSnXiDBo/8RoMnD
	 07rlqnYShBDGMS1nIsyqnES7HC6WPp1MeE528xYhlsMPKofGxH3Obr0/2vc35Vgvjg
	 TovKlNY7qT/bVUXZE+Zv/l6qzmtHs5ahAIsBONBgPK1DYFR47ftKfexxIcTemWOqMM
	 Jp9sHmwHhEW2A==
Date: Wed, 30 Sep 2026 12:08:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Brian Masney <bmasney+clk@redhat.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 01/11] dt-bindings: clock: sun4i-a10-ccu: add
 Allwinner B288
Message-ID: <20260930-controversial-pastoral-raven-dd05fc@quoll>
References: <20260927151016.186493-1-pmazzini@gmail.com>
 <20260927151016.186493-2-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260927151016.186493-2-pmazzini@gmail.com>

On Sun, Sep 27, 2026 at 04:10:06PM +0100, Pablo Mazzini wrote:
> The B288 (sun8iw10p1) is a dual Cortex-A7 SoC used in e-book readers.
> Its CCU needs only the two oscillator inputs, so it fits the existing
> schema without changes.
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

