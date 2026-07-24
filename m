Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE773A63F2;
	Fri, 24 Jul 2026 07:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784877144; cv=none; b=PTb4MR8tvuIFxdz3EiPW9hwU8JpS1NymADVv0lEy+UBfCi/wKx0xa4cwSXSUc5L6YgNyVbdRYesbrF2sAfggFtQCnv86Z9v3qXZOtI/kaTxXHm8v8Kw21hEFT/nq4Y4ULbOdG4H9CnfxzdntnTXs9uyguMwBp58wG1Q7iN8TiGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784877144; c=relaxed/simple;
	bh=rEWzvv1GfCjawzXEzExywbzcCr1VJxAIckBRPMYzNGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G0lzX4MFFA2klwWIDjzrAyD6COceMH8NsaTTzWUxWNoprXvqS5oAmuW8F7/n8raRtGNis9jilvzgeB7AWDB2VFftmqLXJE2cS0v2eOZ0/fYTtjgrLPqL6R8cyVtmx3SyeUXqelXfum7tS3NAx/CczUhL3rSFZ3k1rJKW+fc9Tw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wqoe1mP7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wqoe1mP7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A088E1F000E9;
	Fri, 24 Jul 2026 07:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784877142;
	bh=v6nYx9y6dWRh6PicsBH/tR+T1Q1L5zz/k6rKVHSru6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wqoe1mP7pNSebiUhjwwY+j5b7Ct+KRaJJnhA3jE9CYq8jyNiC83Wdkf5/NNT+1hcw
	 tAf75swaviKnr8yABEikDkou6AC+uOF7TUJF7DCTVkBdKZ6Y7Gu5i6DUeeSX8aMH8U
	 8LdIHGUac5uo78S8H0GH2v7+jLqKJKy0/VrLOH9dTo28GWjUh9j6TwW+wtqfprdMEI
	 RPd57oBtAXHf2A0CaXH2/xQTyB/khPhpB0hvRoVgoqfRWPFBB2EdW7rlW1qSG5iKE3
	 ogkNocqf1LiekiOiYxnivdUE4p2XmMgScfToS7+AjeQFa4rYirpzRt9g3wl0pagLHP
	 y+S+MiQY3CunA==
Date: Fri, 24 Jul 2026 09:12:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aneesh Pradhan <aneeshpradhan2004@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Catherine Frederick <serenity@floorchan.org>, linux-clk@vger.kernel.org, 
	Aneesh Pradhan <aneeshpradhan@acm.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: qcom: add MSM8920 and Motorola
 Moto E4 (perry)
Message-ID: <20260724-dodo-of-satisfying-leadership-a2b6da@quoll>
References: <20260723012431.48499-1-aneeshpradhan@acm.org>
 <20260723014627.63310-1-aneeshpradhan@acm.org>
 <20260723014627.63310-2-aneeshpradhan@acm.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260723014627.63310-2-aneeshpradhan@acm.org>

On Wed, Jul 22, 2026 at 06:46:25PM -0700, Aneesh Pradhan wrote:
> From: "Catherine Frederick (coolguy)" <serenity@floorchan.org>
> 
> Document the Motorola Moto E4 (perry) board compatible for MSM8917 and
> MSM8920, and add qcom,msm8920 to the SoC compatible list.
> 
> Signed-off-by: Catherine Frederick (coolguy) <serenity@floorchan.org>
> [aneesh: split bindings into their own patch; add msm8920 SoC enum]
> Signed-off-by: Aneesh Pradhan <aneeshpradhan@acm.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index f8c37096df46..5556f81c0af5 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -261,11 +261,17 @@ properties:
>  
>        - items:
>            - enum:
> +              - motorola,perry
>                - xiaomi,riva
>                - xiaomi,rolex
>                - xiaomi,tiare
>            - const: qcom,msm8917
>  
> +      - items:
> +          - enum:
> +              - motorola,perry

Duplicated compatible. Same device cannot be both - msm8920 and 8917.

Do not attach (thread) your patchsets to some other threads (unrelated
or older versions). This buries them deep in the mailbox and might
interfere with applying entire sets. See also:
https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/submitting-patches.rst#L830

Best regards,
Krzysztof

