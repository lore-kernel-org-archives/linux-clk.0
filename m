Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D380D156661;
	Sun, 16 Nov 2025 11:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763292802; cv=none; b=LAQikhnvbeNelj5LUkotxY63oI8QpSPmBDAEIhmtVZXyxkYp3hjfiGs1GQSuCtyH8Kwst58sIAO7KiLKqRjsU1QoDnboiNdDGuems+QfwgaIYn+p4COpmhp2MQCDThjKe97xMzWgI0l+PfAJsRw0PFWt55pTYeaFSBQyNhZTiIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763292802; c=relaxed/simple;
	bh=aTVKcWg8+7e+j27IM4wyG63oyRGSBSps9hXBl5rry+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lQ8RWr9fyTZiAgICFRLIdRwUGmoUVzOp/4XxbjHYB62le2bng1KY/lhOs2Qu0q0tkrPCJ3zKdbLJIefql94kiZO2K+8EElFYxceD/j4xKTGD1JERcoZSlbEVIKNflcyomcdR3tuf4JcaEtLDcVXilc2NmPE3epQZmzMsEl/AHWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O9lwb9Mt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O9lwb9Mt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A80B7C4CEF1;
	Sun, 16 Nov 2025 11:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763292802;
	bh=aTVKcWg8+7e+j27IM4wyG63oyRGSBSps9hXBl5rry+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O9lwb9MtrAwaMgWxarcIBMhbs88fyByN1BXLpUCIMMB9VGpbHAI70G8h6pfD8VPMh
	 elnjiiZFkkuJlAohkMpH3CJr9VOmJ3ZtZfrB+HAy0/p+kXeaQcXjHpa5JC0bqeyFJA
	 2YGALecHiW3KJV4NejWLA4Oq6BSoTDsOp69+AuqEb3a+DASnPHhQH5vbFCoJsIcFSA
	 mIY66abzLRKzkOeIs36AzO9AvLG9h1xpzpJcCGWkcK3xYlfgaiWpLfYksTYv9zOsOx
	 JT+pdLB0NdaAwU+awik54ZLMs2lh3XHJi6wH/k/4bZGlQPOzmEs0e1jGY6QzfT6Fr0
	 PwW+fxwZuD+HA==
Date: Sun, 16 Nov 2025 12:33:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: wens@csie.org, samuel@sholland.org, mripard@kernel.org, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 6/7] dt-bindings: display: allwinner: Update H616 DE33
 binding
Message-ID: <20251116-pigeon-of-optimal-blizzard-2cb3b3@kuoka>
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <20251115141347.13087-7-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251115141347.13087-7-jernej.skrabec@gmail.com>

On Sat, Nov 15, 2025 at 03:13:46PM +0100, Jernej Skrabec wrote:
> As it turns out, current H616 DE33 binding was written based on
> incomplete understanding of DE33 design. Namely, planes are shared
> resource and not tied to specific mixer, which was the case for previous
> generations of Display Engine (DE3 and earlier).
> 
> This means that current DE33 binding doesn't properly reflect HW and
> using it would mean that second mixer (used for second display output)
> can't be supported.
> 
> Update DE33 mixer binding so instead of referencing planes register
> space, it contains phandle to newly introduced DE33 planes node.
> 
> There is no user of this binding yet, so changes can be made safely,
> without breaking any backward compatibility.

And why would you configure statically - per soc - always the same plane
as per mixer? If you do that, it means it is really fixed and internal
to display engine thus should not be exposed in DT.

Describing each IP block resource in DT is way too granular.

Best regards,
Krzysztof

