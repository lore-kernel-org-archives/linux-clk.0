Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CE23F1ADD;
	Thu, 24 Sep 2026 16:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790267102; cv=none; b=aiI3kc5ySKb/GFbMy8b/pjUjwe/Bdv0cfS8EJszAkN8SSOAFQ8R2lrhAIp5n/N70nDDSF/2YwecDZel1uQJEtpu18XSVbnXLyIy78abQMZM37NC1BItr09ngROc2T1sx7523BelkXXci5DXdV3oLim6tRFxJb+4bLyOR3iHwetA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790267102; c=relaxed/simple;
	bh=rnWKkLWVqul37ItmEcRUsIQdjq5RQQAKxdR8ULav2BM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MJBYEeK+QCDqyilR3dknsQjMMd9J2pWzTnUetuI12ujBJ8fN58paJ4EVFDHJkGl+soDOze+Zx4fRvL3gfUL8xA+53EClTFcnlJ6W8/IFbRYJ6a7lwYjegy4m1RpP98YToCS0qG6HapbYlKh4foyYV10Fmkc5G9YhSl1hpBYlB8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EN3cSyho; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EN3cSyho"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C92FC1F000FF;
	Thu, 24 Sep 2026 16:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790267101;
	bh=GASL7Kwrv0LavJs98T3yfSLMzXEKGRm08E8L0fz64Ag=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EN3cSyho5qcCGBdTc+0iV3uJNhG+B/pLfFmIyq0xyI08ATX9NeOno891W6XfIddqe
	 yfRTFMwrCabaXiG8jq71gxJbXy8HUh/T0KdDs9xILfvdNexc7BkscTHBVJXWZA7MrA
	 /0ifiUep6O7DhJ/kdVxqkEeIPTx7jzt/0VdWb+t8T+DwBdj4vvv4YlIHclSOSi67ti
	 AF67FV1OEuVXpSn5DXLVXMcRZfecfFXU9L+ncjfgn99uvoJPU3VwXrBSA84WTHRuts
	 6XBUFPrHdAyCL//G0131Vhej5xXBnfQlK1mOaxiEfm+55OeJR2f1y1rARuKAx0FudV
	 WBZjl42mnxeOA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom,sm8450-videocc: Fix clock
 inputs for Glymur
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260924161152.1162301-2-shengchao.guo@oss.qualcomm.com>
References: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
 <20260924161152.1162301-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 16:25:00 +0000
Message-Id: <20260924162500.C92FC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: hallucinated qcom,nord-videocc omitted from top-lev=
el enum
--

commit 0ca2f034154349c48cdd7a693b1d8282d6886964
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

dt-bindings: clock: qcom,sm8450-videocc: Fix clock inputs for Glymur

The commit updates the clock inputs for the Glymur, Nord, and SM8750
variants in the bindings from exactly two items to up to three items. This
change allows device trees to supply the sleep clock input required by
these drivers, resolving an issue where it would register as an orphan
clock.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.=
yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> index 910c6d5672b86..dc01c37dcd0e3 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml

[ ... ]

> @@ -77,6 +76,27 @@ allOf:
>      then:
>        required:
>          - required-opps
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,glymur-videocc
> +              - qcom,nord-videocc

[Severity: Medium]
Is qcom,nord-videocc missing from the top-level properties/compatible enum
list? When a compatible string is introduced in the allOf/if conditional
logic but omitted from the top-level enum list (under unevaluatedProperties:
false), any device tree node using it will unconditionally fail validation.

Additionally, the commit message mentions that videocc-glymur.c handles
qcom,nord-videocc, but this identifier does not appear to exist anywhere in
the kernel tree. Could this compatible string be an LLM hallucination?

> +              - qcom,sm8750-videocc
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Board XO source
> +            - description: Board always-on XO source
> +            - description: Sleep clock source
> +    else:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Board XO source
> +            - description: Video AHB clock from GCC
> =20
>  unevaluatedProperties: false
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924161152.1162=
301-1-shengchao.guo@oss.qualcomm.com?part=3D1
