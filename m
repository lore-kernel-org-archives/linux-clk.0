Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809C343B6CE;
	Fri, 14 Aug 2026 10:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786703078; cv=none; b=ta09k6b/w9evSpmzuRvISjL33SP6OciTZ2uao+4EYQoYfz1l0/XBF3Q9g9+wzz5yYL3r3whhDO1xIlJtioXs+dcPt8s9dX9aG8wqa9mFBT2M1O8DP1RRDFZopN7xVOf7g9nXpScZcov6mYIc6d4pqZiChkPkl2weqPc0HPHzryw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786703078; c=relaxed/simple;
	bh=dhYqjyR6vfKX9wUXZkyIBAVyIFj8F+cr9qw2EeOyD/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aqO2BmvPW5aBrKOVHG88168Xiiw4PP9rJe8Sg/6JJVxGIrMdToFjHKGSOQyogAxLyDrcpd4ixmorIrrc+Xjsk0uAANL1KfFf0R72EUyBGAD5+83uTLVvO8tXTIsfWhJPvktmTK/nb4exIZ582xNYwrBwTLnjVZc52PxHuVWRYXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EXCdrl9u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EXCdrl9u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 436591F000E9;
	Fri, 14 Aug 2026 10:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786703069;
	bh=LSS+43e2rqGIx4pb0BHZvPdbHb1/jO03BsnjXyl9qc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EXCdrl9utJkAORwBG5H25hX1EBlEagmtA3Y+QcJXW7940djo0uPId6n8vhpGdzAjW
	 sGXF8GTV92/fxeObdyoNv3kIORP35KQlWoeJE/KX2Aknm7F3YRt5SHLCy4xu+qtn7u
	 5hzljeugjhqx2q2iLwL37CYqfOcjuogvM4JzZ2ccMcuTiJLrDHBixOpTs5ezCApCug
	 K01VKAgpIW+bSKR30AxBcbKfUaDkJRNCt+U3iMozEKnWhT08OzJ81L2eqE+E4Bjg6j
	 IFnsBeWZk90s0v0v3v1gc0hVo5AofFtb+TyII25LwbdyFiechf1MDOSDfbSX9pVyT2
	 GPaHLyMUfc2KA==
Date: Fri, 14 Aug 2026 12:24:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vladislav Leonov <vlad@zlab.su>
Cc: linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Simon Glass <sjg@chromium.org>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 15/25] dt-bindings: clock: rockchip: Add SCLK_IN_SPI1 for
 RV1106
Message-ID: <20260814-proud-airborne-skylark-a71da7@quoll>
References: <20260810121121.210040-1-vlad@zlab.su>
 <20260810121121.210040-16-vlad@zlab.su>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810121121.210040-16-vlad@zlab.su>

On Mon, Aug 10, 2026 at 03:11:06PM +0300, Vladislav Leonov wrote:
> Add the clock ID for SCLK_IN_SPI1. This gate exists per the RV1106 TRM
> but is missing in the Rockchip BSP kernel. SCLK_IN_SPI0 already has
> a binding, so add the SPI1 counterpart for consistency.
> 
> Signed-off-by: Vladislav Leonov <vlad@zlab.su>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

