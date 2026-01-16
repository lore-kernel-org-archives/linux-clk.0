Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546C030FC03;
	Fri, 16 Jan 2026 09:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768554124; cv=none; b=WGjJRFiP21x/xELKzwjj69RkCSUPqtw0e4VUFXvpVeYyiTwNWSYoHxJOPaGPDgkP5Ci3Yw+1mnnUR54QGRloMbQLpTmmeIco9l4jS68SriYG6icaCIsFkp7Bpogh0KempUiGylnZyjfuAaywlQKkkRodLtVlTgVlN5eeiQ/UmUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768554124; c=relaxed/simple;
	bh=Dz3h1fZVhFYfJiCKG8iNbuul6rn4NYsHgDTFjl58x3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fiAt94On4jFHIfIvQdVRPi78SxujRib26y/+80+Rl2USA7NJT8Mcq5fNJ1GHIMEjazAt7d/VkNeOHmdT+9qapLNAelafgEKVJOOdtwnXkgjzrUaBvarEKfmlLf4pB/AsjRmuofFyY/O4572HExs/66UOFpcmLYskynT/g1PXjqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UL3TpwTs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UL3TpwTs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A1A4C19421;
	Fri, 16 Jan 2026 09:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768554123;
	bh=Dz3h1fZVhFYfJiCKG8iNbuul6rn4NYsHgDTFjl58x3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UL3TpwTs5BMq57aRYARVRFOGew4aYeLQ1BakJegpMb+f7u46aw3iyauumigNO5jYK
	 XQFzUFl5EHXAgP4b5Tw1FRL3kTcUbdZ4+8T+0EzqJtFr2NeBPuZiAEeIMWfJ2rxmZk
	 1h7bZ8R6pxk3kauFcNlJkriwncXv9GbM+4soJZRsyqp0ZaTWL8yX5flsYSDnHHikRI
	 omMlFH9eikdL5oMPFRjf7HIuEMpYRsayRHdVnHboWQxWFDquj+NrCFmND/OBPFp9Bq
	 fqHpVtOLRBWNt5K4uRefP4U9vv31eH1s9rj8CXHP4fvP1SaOjVFv5chAXm/Kd8Jv8Y
	 b3Jmn+1P1Unyw==
Date: Fri, 16 Jan 2026 10:02:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, 
	Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, 
	mpe@kernel.org, mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, 
	agross@kernel.org, agross@oss.tenstorrent.com
Subject: Re: [PATCH 4/8] dt-bindings: soc: tenstorrent: Add atlantis resets
Message-ID: <20260116-unique-devious-elephant-e9de6d@quoll>
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
 <20260115-atlantis-clocks-v1-4-7356e671f28b@oss.tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260115-atlantis-clocks-v1-4-7356e671f28b@oss.tenstorrent.com>

On Thu, Jan 15, 2026 at 05:42:03PM -0600, Anirudh Srinivasan wrote:
> Document resets from RCPU syscon for atlantis.
> 
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> ---
>  .../tenstorrent/tenstorrent,atlantis-syscon.yaml   |  5 ++++
>  .../clock/tenstorrent,atlantis-syscon.h            | 34 ++++++++++++++++++++++
>  2 files changed, 39 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml b/Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml
> index 3915d78dfeda..7e9c8d85ba9e 100644
> --- a/Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml
> +++ b/Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml

There is no such file in linux-next.

> @@ -31,11 +31,15 @@ properties:
>      description:
>        See <dt-bindings/clock/tenstorrent,atlantis-syscon.h> for valid indices.
>  
> +  "#reset-cells":
> +    const: 1
> +
>  required:
>    - compatible
>    - reg
>    - clocks
>    - "#clock-cells"
> +  - "#reset-cells"

Why aren't you posting COMPLETE bindings on first posting? This is now
ABI break for no good reasons - you knew your device has resets.

Best regards,
Krzysztof

