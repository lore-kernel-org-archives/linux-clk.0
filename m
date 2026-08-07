Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E353A9851;
	Fri,  7 Aug 2026 21:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786139448; cv=none; b=JiYagISlzY9xKx/M4a4DOJFBmZ+uS5I4eI0whHEOag6JTFxcinSpc9tCDiFFEMW3V8monOV47ejBGBQQNtaolbbfsP2FNVIpNlDCrxD2vobj0+anwtb8eCI835JbkRkgVvaA4ROTBwK9dH03wqCwoE24ndNgdpe3KKpmPEVke0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786139448; c=relaxed/simple;
	bh=KAO4mzSrvbVLiLzsEbKxy01n3MJZPt07iCtj5W7UiPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r19ViHiyUHuUIcyy/ydWxzT6MnkXYF3dKD51JYXmOX6nkMd7fQEXJ8YB+bQWjj6kpdxtOMe/rTG/hxbOvcfq+o+JvqbyJ9TNybF1qy60yL7umcdDHsiBAPtZDHS9NCwzZEfX7sUpMFIvqeWkm0r15gb+0GJc5XNFjJoD9AZWPc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S+Sh8CXq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S+Sh8CXq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4D451F000E9;
	Fri,  7 Aug 2026 21:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786139447;
	bh=TRWWokPRG/+EXHuXleH02rqZuTaX2jULOJRH0xT4mSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S+Sh8CXqKzPH3VqNZlKU22IBzIHRCItajs+sSyGAxmimzxma1s9+PL1ZQXxbIZ3Dc
	 CZcjSs/yWy/gu85YYRs2CZ+9AOY2qhbToKK/uGybGvDt6ifsztvAQNroFTeFSe1npf
	 62Kb4pAHrxFN8ngRwsnf42xZ3mF/c2VmcCl+/MP9cstpqIqatwNhqihUf9wuFsZY/a
	 f6lPlUQY5lR+M09vAcH6BAKe7qyA9G1PkswkbslRpRvNwGxWcU2Z5jmvaNGc/PgGRc
	 esr1BWlFBaM2mDajUy1y6tssesFB0oT2CnUDlmawqJl1DrTjCp40Qt0fXxychBfbem
	 gvDW5vaFl/sBQ==
Date: Fri, 7 Aug 2026 16:50:46 -0500
From: Rob Herring <robh@kernel.org>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: Add Hawi camera clock
 controller
Message-ID: <20260807215046.GA2074060-robh@kernel.org>
References: <20260723-camcc-hawi-v1-0-7057658c5c47@oss.qualcomm.com>
 <20260723-camcc-hawi-v1-1-7057658c5c47@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-camcc-hawi-v1-1-7057658c5c47@oss.qualcomm.com>

On Thu, Jul 23, 2026 at 02:38:57PM -0700, Vivek Aknurwar wrote:
> Update the compatible and bindings for camera clock controller (CAMCC)
> support on the Qualcomm Hawi SoC.

That's obvious from the diff. Explain how the block is the same or 
different in Hawi.

> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8450-camcc.yaml          |  36 +++--
>  include/dt-bindings/clock/qcom,hawi-camcc.h        | 165 +++++++++++++++++++++
>  2 files changed, 192 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> index b41247b257b1..cdc19418c064 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> @@ -16,6 +16,7 @@ description: |
>    domains on SM8450.
>  
>    See also:
> +    include/dt-bindings/clock/qcom,hawi-camcc.h
>      include/dt-bindings/clock/qcom,kaanapali-camcc.h
>      include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
>      include/dt-bindings/clock/qcom,sm8450-camcc.h
> @@ -26,15 +27,21 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,kaanapali-cambistmclkcc
> -      - qcom,kaanapali-camcc
> -      - qcom,sm8450-camcc
> -      - qcom,sm8475-camcc
> -      - qcom,sm8550-camcc
> -      - qcom,sm8650-camcc
> -      - qcom,sm8750-cambistmclkcc
> -      - qcom,sm8750-camcc
> +    oneOf:
> +      - enum:
> +          - qcom,hawi-camcc
> +          - qcom,kaanapali-cambistmclkcc
> +          - qcom,kaanapali-camcc
> +          - qcom,sm8450-camcc
> +          - qcom,sm8475-camcc
> +          - qcom,sm8550-camcc
> +          - qcom,sm8650-camcc
> +          - qcom,sm8750-cambistmclkcc
> +          - qcom,sm8750-camcc
> +      - items:
> +          - enum:
> +              - qcom,hawi-cambistmclkcc
> +          - const: qcom,kaanapali-cambistmclkcc
>  
>    clocks:
>      items:
> @@ -67,6 +74,17 @@ required:
>  
>  allOf:
>    - $ref: qcom,gcc.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          not:
> +            contains:
> +              enum:
> +                - qcom,kaanapali-cambistmclkcc
> +                - qcom,sm8750-cambistmclkcc
> +    then:
> +      required:
> +        - '#power-domain-cells'

This makes #power-domain-cells required on existing platforms. That's a 
separate patch and needs to be explained.

Rob
