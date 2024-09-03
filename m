Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378A92AE66;
	Tue,  3 Sep 2024 15:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725375880; cv=none; b=i42NxPMGhSzdvk9zjZfN3RN19CJ8gY5sTplZ1umT352N2Ccfg9WhegNPOpPyOo5wzQ8lZKtn4rrTWrGfTkg91dYqIe20tE76XRXRd5hSckq3TyulexbRwOI3O50VYp8QdKp2xgauowdrfMShZCS+fgr+N1tS3OQpaM0ASbMpIz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725375880; c=relaxed/simple;
	bh=sf3xNg203/lr8nt9OtokONsd4BgI7GDuvGcxFo78X+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ilq462CgPvM8G42VYuAiHoFmHO5+vO8hzE6OEtRWmiUX5CEc1JJTXLC6RtHS9NowwKJAj0uz/sDp3WCB7HKmJib5iI9kcvuGCc1+2kFQDdp5Zx4jAMsiFJYT4DXCajz3sKoI22LeAjFcm42kgpBPvgysTeAjA+VIaLrJaBPPsjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JiGr66dR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JiGr66dR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F2FBC4CEC4;
	Tue,  3 Sep 2024 15:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725375879;
	bh=sf3xNg203/lr8nt9OtokONsd4BgI7GDuvGcxFo78X+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JiGr66dRo72VmOAc29W41ELqSFMOOqKgnA1OPWzIih5KTat9VKMC91k50pdB65QDc
	 yiVJn6AuPC8CPVBxQUqri90qDBy3D4CdfqqoFfuriBmycV0Ah8PWaRtOnz8J83Z1va
	 7Rmuhm1r3E8w+4G2d10XXLNsG2dl1tF1ckLXa6k4qv6f7MQlME3sETQAhKWlhQNYOJ
	 3BzYzrf6+ruGFfgs0FtIWtQsWWY4We2rNdQrA2BNMHQZ4TR5Zj/OvhLyffF4xkKuRO
	 daiNlB8OF+jPEP0mU9lSPRhsXAG+AC6Jwd3L/jl3SqqObpMFDBOHd7atGc0twCdCl/
	 wDPFqRC5hoo8Q==
Date: Tue, 3 Sep 2024 10:04:38 -0500
From: Rob Herring <robh@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org, lorenzo.bianconi83@gmail.com,
	ansuelsmth@gmail.com
Subject: Re: [PATCH 1/7] dt-bindings: clock: airoha: update reg mapping for
 EN7581 SoC.
Message-ID: <20240903150438.GA1008227-robh@kernel.org>
References: <20240831-clk-en7581-syscon-v1-0-5c2683541068@kernel.org>
 <20240831-clk-en7581-syscon-v1-1-5c2683541068@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240831-clk-en7581-syscon-v1-1-5c2683541068@kernel.org>

On Sat, Aug 31, 2024 at 09:18:43AM +0200, Lorenzo Bianconi wrote:
> clk-en7523 driver for EN7581 SoC is mapping all the scu memory region
> while it is configuring the chip-scu one via a syscon. Update the reg
> mapping definition for this device. This patch does not introduce any
> backward incompatibility since the dts for EN7581 SoC is not public yet.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../devicetree/bindings/clock/airoha,en7523-scu.yaml         | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> index 84353fd09428..ca426c328535 100644
> --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> @@ -34,8 +34,8 @@ properties:
>            - airoha,en7581-scu
>  
>    reg:
> -    minItems: 2
> -    maxItems: 4
> +    minItems: 1
> +    maxItems: 2

This should really have the 'items' list here instead of in the if/then 
schemas.
>  
>    "#clock-cells":
>      description:
> @@ -75,9 +75,6 @@ allOf:
>          reg:
>            items:
>              - description: scu base address
> -            - description: misc scu base address
> -            - description: reset base address
> -            - description: pb scu base address

And then this would be just 'maxItems: 1' and the other if 'minItems: 
2'.

Rob
