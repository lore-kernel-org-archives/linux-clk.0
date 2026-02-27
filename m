Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD183603D1;
	Fri, 27 Feb 2026 07:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772177168; cv=none; b=rNlq6GWNw8iES9moKmZT7nqAHOKb0XIYbX7IeFhytQ4ZhvVeS+PDxeNDPQaXCXtefSihpHz57w/9TlTYZM+1h4oDPdp2PFv5bruFzHjhA94SUCL11/8cnjrUerF+gpd+DVdy7m3Axb5ko8Gx+h385cAp+svFcE+xphuChIgURko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772177168; c=relaxed/simple;
	bh=sX5sBkWLydTHKpsOg08qoX691Fq/azTiPaJgkb44dkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iwqPeCVvBTw9x8PsHG1w5L+dDqsSIZyPUpKLYnyI2Epe7pzFSBJseLbBCBv64yDMP3FgUc+i8mD+lj16uB/grpuY6MsSMfnFTXjZhOajAX/JntdnU6ME98+GM3D4HXaWZssbR2XG89abCLrdl1FlqQBYQccS+VSVUKMlUU9uofA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nEGKYrOn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nEGKYrOn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF30BC116C6;
	Fri, 27 Feb 2026 07:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772177168;
	bh=sX5sBkWLydTHKpsOg08qoX691Fq/azTiPaJgkb44dkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nEGKYrOnjft3vSu/WW/7YkuWLLGIghSfv7vD/4nOL3O4EKPIgISsLZrBWlZHCVeku
	 ehXHaqHYqsHq82yf76wEgFxgCEo8jRJ6aeWndoFPng+qUp9I1JjdPAnzNGNTlcEamX
	 wGBOLc4NxrZGZkAtbX6O1NkT/XL56zwfrGM1DMPFiZT1zgTZjzxyyRwVjSi6aawMCP
	 R+FPBY4Tnb1LmqTwGl0/aKOVxwuiYXTt/Q0TrphLY1ZXlc7VuWDFH6ZcQc1WPiAShh
	 N1Zr/h8bUMATFULHpjsPB7KXCkQWC2TChUZX0wlQcizNqCTRn9tHuUeP6fd8fn5eSB
	 C1fFqbtakuj/w==
Date: Fri, 27 Feb 2026 08:26:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH v9 1/7] dt-bindings: media: qcom,x1e80100-camss: Add
 optional PHY handle definitions
Message-ID: <20260227-hopping-gaur-of-discussion-50ddb0@quoll>
References: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-0-a59c3f037d0b@linaro.org>
 <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-1-a59c3f037d0b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-1-a59c3f037d0b@linaro.org>

On Thu, Feb 26, 2026 at 02:28:42PM +0000, Bryan O'Donoghue wrote:
> Add optional PHY handle definitions. This will allow for supporting both
> legacy PHY definitions as well as supporting the optional new handle based
> approach.

Please squash patches doing the same logical thing - adding children CSI
PHY nodes is one thing.

> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../devicetree/bindings/media/qcom,x1e80100-camss.yaml    | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index 2d1662ef522b7..bb18236b4f344 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -126,6 +126,16 @@ properties:
>      description:
>        1.2V supply to a PHY.
>  
> +  phys:
> +    maxItems: 4
> +
> +  phy-names:
> +    items:
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy4

This is fine in general, except that I thought CSI PHY is the child of
this node. It's not?

Best regards,
Krzysztof

