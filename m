Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793012848;
	b=AP2rieqbicdDWLUZ/NEq5FBV/5lyEVFxkQRG/V1nHHBw1ClcFf1fsd2H6eTXNe2gQ9kp
	 1QYN8CTnN87EQaqehcUdVf5Oco1P4xm9ZY9sccJv5+yAq6K31rnGmOMYXNTnPXj6/1YLQ
	 HRfb/MtJUAcFFq5W4GBQWVVPNpQqQKZOavWIro5yKFqXsdyPEAUUTjNvcg57B6jkKaRkA
	 5Rddl2sa9m7ozHjmVruC5r/iGnxsDuN93mXP8RM3YYphCt9AfOOiyAsvkZQMWMvqp3UwN
	 MlhSkVpvbHM6lz6k3yFynrQdFyTFWPXdDRbay/vxjbr75TIFp7vLwjBKuCvICbvlMNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793012848;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UqQ6YN3C0My0ei2913fj4EsSC5xlag6VWjFK6Bm+zNI=;
	b=IbC43MWmjoTewouPJYRbgZxIFNxZaNAcmEq+SHIeITJhjCpua+Mtq1g25rLdj5pWSIIY
	 Xq1raiwiHwY7rjTLjIlk5oyAGYOwy+Hmh5HBazUdKfezvgyZGh0GFOeofD0wm4ZJC/83N
	 Lzkma07fROgEI2tIwxgp72R9KE8DXcjVJnxKhRFOiq6MiVU04UFKDjsd8rO9Zj40VVlXB
	 wArnLVvsP2eP8F6qydlZeuu8bI/OwA7u2Sc0kqH3fSmwJqHnhrtT3F4ADT+mEWq9cpS7h
	 Q30+k2CVoEw0YXrZHRv9AaK4u0Cb/Cj6jBtI3cP5HBmvqpzn3LKKv0xgrhn/RU82Vxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m+meOosx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA4A606A31D;
	Mon, 26 Oct 2026 11:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m+meOosx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4579B1F01825;
	Mon, 26 Oct 2026 11:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793012848;
	bh=UqQ6YN3C0My0ei2913fj4EsSC5xlag6VWjFK6Bm+zNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m+meOosxYEHJlg943p50ulC5iE079L9OGgPtW/odYLzLQg+0VGSol/hn4/fWuxD30
	 58wPrPe1F9NA125zZZ/Su2aPA9723xi+YV5jG8EnRysHeh3Q6FtMfWZK4MobquGTn8
	 DS1p4aZnwx7XcXfbVh8FFlfaSSGYY9bPjF22uIDB5teAonB8rKhEj/xz/uCrbr+i1f
	 cyBHOMny6jO6oCQadDn/8tIV/BLGrLYwLkM0JdaIogfSBR3/pugY2vaTvxmr/ZUFkn
	 mkaap2y8VfAV6Wt5H5mQd/cJNVuTBA9t48xCyGKweYT8N1ugIsgGgdcVXVrrna/d/s
	 XVCmDaF1YExuQ==
Date: Mon, 26 Oct 2026 12:07:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Robert Marko <robimarko@gmail.com>
Cc: andersson@kernel.org, abelvesa@kernel.org, sboyd@kernel.org, 
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, konradybcio@kernel.org, taniya.das@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clocks: qcom,gcc-ipq8074: allow CMN PLL
 bias clocks
Message-ID: <20261026-terrestrial-thankful-trout-8eea58@quoll>
References: <20261024103401.761125-1-robimarko@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261024103401.761125-1-robimarko@gmail.com>

On Sat, Oct 24, 2026 at 12:33:09PM +0200, Robert Marko wrote:
> CMN PLL in IPQ8074 provides 2 fixed clocks to the GCC clock controller.
> In order to describe this in DTS, allow passing them as the inputs to GCC.
> 
> This has a benefit that it avoids doing a global matching by name.

That's ABI break, so at minItems.

> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
> index 00d7df75b3d6..d489c6332e6c 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
> @@ -29,6 +29,8 @@ properties:
>        - description: sleep clock
>        - description: Gen3 QMP PCIe PHY PIPE clock
>        - description: Gen2 QMP PCIe PHY PIPE clock
> +      - description: 300 MHz bias clock from CMN PLL
> +      - description: 416.5 MHz NSS NoC bias clock from CMN PLL
>  
>    clock-names:
>      items:
> @@ -36,6 +38,8 @@ properties:
>        - const: sleep_clk
>        - const: pcie0_pipe
>        - const: pcie1_pipe
> +      - const: bias_pll_cc_clk
> +      - const: bias_pll_nss_noc_clk

Drop _clk. Names should represent the input.

Best regards,
Krzysztof

