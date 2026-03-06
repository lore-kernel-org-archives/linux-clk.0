Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E48F32FA18;
	Fri,  6 Mar 2026 08:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772784699; cv=none; b=jXBgSFowUAp4/2dOzjtnUGHUYUZZwiO0PzNDntKB6jf5AEvFfNjQFuWyQzx943y4hiYe7OR0upnOnvNYJtyPMG4L+VPOfc0cXqib0bDxqC3No7F+YMfbq3wMOLLJy/rqz1QBueH0clIeDKI+b9PtRdy4YW6CGywDArO8FLX/vRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772784699; c=relaxed/simple;
	bh=z9VBi6pOx8Va4AA4xwcH/uPaUx+DgL/34IOWs+N6mLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dCqWHdjSmnvcPwrjW4LcqtaeIhW6tfHYCWHPeBjaJnSNfv0HOFC+y0xxT8p7RCVRSB/WNC/c2Ymbxbb+fVXCy9SQ5WeQ3jwUKkpkKvEjYN5WrzEzIweiF9GFY5xolk9N7BrenuOrqSur2peQ4+G9Z0S8iootsRbtC8e+WmPXuVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cBjr3coq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cBjr3coq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FD4AC4CEF7;
	Fri,  6 Mar 2026 08:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772784699;
	bh=z9VBi6pOx8Va4AA4xwcH/uPaUx+DgL/34IOWs+N6mLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cBjr3coqedIIM6OuBzN2FI+ExSsr3RFCudu+q9X34MRrL74sG63KuhtUd7d8QdcSM
	 BWKJcq9HvTuubpyD5WGJM8JGcqxVC6elr3ELNXo99TRJ1IrgxoQAuR6GQGIOlxCpng
	 BFUDgOJSqYW2lN93LwQTrtk5B77bVfEoP2jdSp5IKNW8Z1wsRykX2tamStvHv9t023
	 yYyN95tjzyJWSZIzXCOm3Eglrrp0Y2iUM2yUqIm/DjXYxppCD9N1oGAx0S2uD5/0aU
	 v5TrYO9vCUZRaLzhYj3Ag1TANXlyu4s1FIBbRsqZhgAJAHBIhN3fXl7dZf1H69HMyi
	 0y31qrvoRxESg==
Date: Fri, 6 Mar 2026 09:11:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
	linux-amlogic <linux-amlogic@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH 1/3] dt-bindings: clock: amlogic: Fix a typo
Message-ID: <20260306-primitive-lilac-catfish-fbbf9e@quoll>
References: <20260305074328.639993-1-jian.hu@amlogic.com>
 <20260305074328.639993-2-jian.hu@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260305074328.639993-2-jian.hu@amlogic.com>

On Thu, Mar 05, 2026 at 03:43:25PM +0800, Jian Hu wrote:
> Fix a typo for T7 gp1 pll.
> 

And also Fixes tag.

> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  .../devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
> index 49c61f65deff..b488d92b7984 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
> +++ b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
> @@ -72,7 +72,7 @@ allOf:
>            contains:
>              enum:
>                - amlogic,t7-gp0-pll
> -              - amlogic,t7-gp1--pll
> +              - amlogic,t7-gp1-pll
>                - amlogic,t7-hifi-pll
>                - amlogic,t7-pcie-pll
>                - amlogic,t7-mpll
> -- 
> 2.47.1
> 
