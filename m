Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C83233943;
	Mon, 22 Jun 2026 07:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782113559; cv=none; b=KVTn2FvQu5s6fj6v+PGZo7YMtJHWTV5tVi1X4/eQ/PGHQ3oCr8umQJXhWB23wnPonun3t71fkiiCWS8dgLLA1XFDedyb/3A+9AQOQYP4fKdqIQPyTCyW/+KsxdzyP57MrEAT5Y7VaLrgD4JmGT+qKSuJDZAgAAcSYw0qLSGr4vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782113559; c=relaxed/simple;
	bh=ijgG65tdO61rFMLBtPiDDDUhmdMdJI++dkwo1OB8R1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QyVkZgWhsyP1qkiAY+yXjcVa5bI661RHkZ4HL29r/kSa4c71ZhoigbSe4WSsGyxeBJXtfeFJrSC+5RTBswR+yXZjLR9oL+64/Fr7Jb70aO3dHPFDUHxBO6TU8EoG3ClYcqDoeOjqy4OZCu7mawnwSCCoqRXaj1ipXntsZNm5CQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ESD8zO5o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ESD8zO5o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC77C1F000E9;
	Mon, 22 Jun 2026 07:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782113557;
	bh=u0Y39QVmO9UdgGlHpkWauDoEUy5DZkASTL7BsMXYV8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ESD8zO5ocx3zgIYmnUiRLa6O8/t1X751JrxdlzBfLcIynuc2bETHsBLVYSgOVqAJO
	 GELSL07InejHtmFXKZQFyNsQTgNsKhUbnFpcRIDnB1myUzgtKRWaRKJlQLbiMFpgJR
	 HnOw/C8N9Wc6oPIRsjfseiAfyeL+Vqxtxgu+vVmPHg1Uqt2coX4WbYwA7AJbjSjp/3
	 SrYGbUCEA5FM61zXGfV8n/xwstl2UhBumN+oswgB0Iw17K+T6D8HKaouSke2Euc+8Y
	 JO0qkKEjIrr3jRGkScqlcZbSe+k+umFjCe7igjqURbndYy9Kl+0BZDg3natrztoZt/
	 B/zczHIlXqS2Q==
Date: Mon, 22 Jun 2026 09:32:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v6 2/8] dt-bindings: clock: qcom,glymur-tcsr: Add mahua
 support
Message-ID: <20260622-legendary-graceful-goat-3b5d56@quoll>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-2-c939c22ded0c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260621-tcsr_qref_0622-v6-2-c939c22ded0c@oss.qualcomm.com>

On Sun, Jun 21, 2026 at 10:11:25PM -0700, Qiang Yu wrote:
> Mahua shares the same QREF TX/RPT/RX component naming as Glymur, but
> has a different topology: a single QREF block fed by REFGEN3 only,
> rather than the two independent blocks fed by REFGEN3 and REFGEN4 on
> Glymur.
> 
> Add qcom,mahua-tcsr compatible and document its required supply
> properties.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,glymur-tcsr.yaml           | 68 ++++++++++++++++------
>  1 file changed, 50 insertions(+), 18 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
> index 16fc6ab87f9b..2b6422627165 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
> @@ -20,7 +20,9 @@ description: |
>  properties:
>    compatible:
>      items:
> -      - const: qcom,glymur-tcsr
> +      - enum:
> +          - qcom,glymur-tcsr

You could have made this enum in the first patch, so you would avoid
changing the same line twice. Usually adding line in patch #1 and then
removing it in patch #2 is indication of something to improve.

> +          - qcom,mahua-tcsr
>        - const: syscon
>  
>    clocks:
> @@ -41,9 +43,11 @@ properties:
>    vdda-qrefrpt2-0p9-supply: true
>    vdda-qrefrpt3-0p9-supply: true
>    vdda-qrefrpt4-0p9-supply: true
> +  vdda-qrefrpt5-0p9-supply: true
>    vdda-qrefrx0-0p9-supply: true
>    vdda-qrefrx1-0p9-supply: true
>    vdda-qrefrx2-0p9-supply: true
> +  vdda-qrefrx3-0p9-supply: true
>    vdda-qrefrx4-0p9-supply: true
>    vdda-qrefrx5-0p9-supply: true
>    vdda-qreftx0-0p9-supply: true
> @@ -54,26 +58,54 @@ properties:
>    vdda-refgen4-0p9-supply: true
>    vdda-refgen4-1p2-supply: true
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,glymur-tcsr
> +    then:
> +      required:
> +        - vdda-qrefrpt0-0p9-supply
> +        - vdda-qrefrpt1-0p9-supply
> +        - vdda-qrefrpt2-0p9-supply
> +        - vdda-qrefrpt3-0p9-supply
> +        - vdda-qrefrpt4-0p9-supply
> +        - vdda-qrefrx0-0p9-supply
> +        - vdda-qrefrx1-0p9-supply
> +        - vdda-qrefrx2-0p9-supply
> +        - vdda-qrefrx4-0p9-supply
> +        - vdda-qrefrx5-0p9-supply
> +        - vdda-qreftx0-0p9-supply
> +        - vdda-qreftx0-1p2-supply
> +        - vdda-qreftx1-0p9-supply
> +        - vdda-refgen3-0p9-supply
> +        - vdda-refgen3-1p2-supply
> +        - vdda-refgen4-0p9-supply
> +        - vdda-refgen4-1p2-supply

It is fine, although this you could as well keep like that in first
patch and mention in commit msg, that binding will grow, thus you
already define if:then: block to accommodate future changes.

Best regards,
Krzysztof

