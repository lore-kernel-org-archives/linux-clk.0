Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1601F099C;
	Thu, 26 Mar 2026 05:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774502874; cv=none; b=qfLew+dVfWOxSeKS7bUqI4F/GL4TkBHojnorF4Gwt7Lef7HU4hhyv6YYrmYcxcd4TKWpNqiS5ys7C7ax8086RLYiHevefprmdTnwyF8qVthcfhthfoXcdNbsiNRV+3gpa1yGGfQbYmvfBXMWPhw2OLVzezQZAadOXgzYpoGaE4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774502874; c=relaxed/simple;
	bh=oSXEBHk6oHtPV4iwErn/tDaiZ3+61Aq25rVE531jGEQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RJb6rEsbf9caRgibAHscVzYLQGAlfmwtyzIPNWR8FqtU8D1AvxsyR6GdG6q475wrllb2YyYdzlJjPfok+EAu2favyeq7rodmWOHu1J4GK9+1mvPGHVyP2dTOtAZsYdJ46wlJmqpXwFW8Fgq82cm9mEarEdEUMhjgkCSM3FxHgJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=kT+04YXP; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="kT+04YXP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1774502870;
	bh=gPXVxe4ANUtFdLLKPWp11SGeawgPJ2lvQwnd9v54erw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=kT+04YXPlRKFDvvUziOIQfXuDkgCsfS1eFgzZe2KSyxC6HjrP+oewnY7kk/IeO87i
	 flJF3N4C3PU9B+v9RoNy1sVeBzI0ENkwIC4B5Y9J4JUqmLARnkNv6xUUd6Pke/HFIn
	 FuIm7IS7I3o2dPQ8klFgikDcu3THMaj3oCFDZiLYOtufO0y4UAG5KeU3ia8+a2LTbw
	 E2EcVsqdP2cr5Uo2pBbkHMOaGrwJT6Tk7toeyE542RnA8D9+VJUrlKejklkHBQv0hj
	 BmUnf853E9alMZBLe8xHC8I+bmGNlju+ZBKac7X1JejtjYkUu16M8jVMIeK2oaUczu
	 Hf4RwvlxMta/g==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id AAF4065AE0;
	Thu, 26 Mar 2026 13:27:49 +0800 (AWST)
Message-ID: <7867c2bb2d3fa023d0a201ff1ca24d69916fb2cc.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: ast2600: Add reset
 definition for video
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>
Cc: Haiyue Wang <haiyuewa@163.com>, devicetree@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "open
 list:COMMON CLK FRAMEWORK"	 <linux-clk@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>
Date: Thu, 26 Mar 2026 15:57:48 +1030
In-Reply-To: <20260302011651.94682-1-haiyuewa@163.com>
References: <20260302011651.94682-1-haiyuewa@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Michael, Stephen,

On Mon, 2026-03-02 at 09:15 +0800, Haiyue Wang wrote:
> Add ASPEED_RESET_VIDEO reset definition to the ast2600-clock binding
> header. It is required for proper reset control of the video on the
> AST2600 SoC for aspeed-video driver.
>=20
> Signed-off-by: Haiyue Wang <haiyuewa@163.com>
> ---
> v3:
> =C2=A0 - Drop 'Fixes:' tag in header file patch.
> v2: https://lore.kernel.org/all/20260227151602.829-1-haiyuewa@163.com/
> =C2=A0 - Fix checkpatch.pl warning, and send dt-bindings as single patch =
as
> =C2=A0=C2=A0=C2=A0 the submitting-patches guide.
> v1: https://lore.kernel.org/all/20260227123837.70079-1-haiyuewa@163.com/
> ---
> =C2=A0include/dt-bindings/clock/ast2600-clock.h | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindi=
ngs/clock/ast2600-clock.h
> index f60fff261130..7b9b80c38a8b 100644
> --- a/include/dt-bindings/clock/ast2600-clock.h
> +++ b/include/dt-bindings/clock/ast2600-clock.h
> @@ -124,6 +124,7 @@
> =C2=A0#define ASPEED_RESET_PCIE_RC_OEN	18
> =C2=A0#define ASPEED_RESET_MAC2		12
> =C2=A0#define ASPEED_RESET_MAC1		11
> +#define ASPEED_RESET_VIDEO		6
> =C2=A0#define ASPEED_RESET_PCI_DP		5
> =C2=A0#define ASPEED_RESET_HACE		4
> =C2=A0#define ASPEED_RESET_AHB		1


If you would like to take this change I can apply 2/2 later when it
makes sense to do so:

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Otherwise, I'm happy to take both through the aspeed/arm/dt branch in
the bmc tree with your ack on this one.

Andrew
