Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170D5416846;
	Fri, 14 Aug 2026 10:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786702613; cv=none; b=ResxFzxdv7Bn+b43fWoy+KoaqAPQc3Y7X5qIn5iZuJQ2gmyoRndKZ2a3eGq1HyemjdRBN4ppzx0o0UwKQ1J+mrDC71ZIio4BnWYgV4S71XWW3cYn9XG09053Z3O0oOtxD8XuTetfEzk6mukJAcVsWgRhnznC1SzYl2EJzBnFZco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786702613; c=relaxed/simple;
	bh=hBun/CVDKvlfd0KjLVluZEHYgPG983q9RugJJszmEZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tnlQgp70b9p0Z4qpg8J4kcBiynznt4kZPGqr6zUjtqGRC/RsRrjIl+b8mUwBiu0MFhDflc2jO0hnnXvuKl03FfbWMknJdGoJvSVFr7KLrHGW5Y357DrWmBNPAgLoltSA56YhmauUbnE07ftnvIk5//sjhxp/LWGlxPJdOG84I7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lyai1pzS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lyai1pzS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C3D91F000E9;
	Fri, 14 Aug 2026 10:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786702585;
	bh=KVLmiUVwLhBElmfmfrG97lSASocUhgv+wrJHYKp1MJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Lyai1pzSyh6s9n0wv9Z1fJOJ/hgHiWa4xosn5hJSODAL/GoFlNJvLjJEw/XLH7jXE
	 +HzS2CjzcW1tIrdzjUZ0GhIZWL9LhqAGNQeQX/I/JxYNWSpiEzveJyMT09a7ikexm+
	 HLKcXmT77XtuDsNVlnTxazunMITSKwG2wUPE43z8Z19W/FGYKJU6IWWq5T2m0Lep6A
	 LyirC0DSADskhKflQY3oimPzVeYDFWXDC1MG88aI7bG8kC7+OPi1t2p1fC4mJVovoy
	 Cur6Mk1tBF+CRzloY1xrQeprOhsSr67OZFLGFVVXuUuTgatfVaTNvbdS93lQjerpoq
	 9a1toyz4/o0RA==
Date: Fri, 14 Aug 2026 12:16:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vladislav Leonov <vlad@zlab.su>
Cc: linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Simon Glass <sjg@chromium.org>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 03/25] ARM: dts: rockchip: Add reset bindings to RV1106
Message-ID: <20260814-dexterous-immortal-sponge-ec5d2f@quoll>
References: <20260810121121.210040-1-vlad@zlab.su>
 <20260810121121.210040-4-vlad@zlab.su>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810121121.210040-4-vlad@zlab.su>

On Mon, Aug 10, 2026 at 03:10:54PM +0300, Vladislav Leonov wrote:
> Include the RV1106 CRU reset-ID header so device tree nodes can
> reference reset lines by name, matching the reset controller support
> added in the previous commit.
> 
> Signed-off-by: Vladislav Leonov <vlad@zlab.su>
> ---
> 
>  arch/arm/boot/dts/rockchip/rv1106.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/rockchip/rv1106.dtsi b/arch/arm/boot/dts/rockchip/rv1106.dtsi
> index 70d3da6bd03e..fa5d0d7f4dcb 100644
> --- a/arch/arm/boot/dts/rockchip/rv1106.dtsi
> +++ b/arch/arm/boot/dts/rockchip/rv1106.dtsi
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <dt-bindings/clock/rockchip,rv1106-cru.h>
> +#include <dt-bindings/reset/rockchip,rv1106-cru.h>

Dead code, why adding it?

IWYU.

Best regards,
Krzysztof

