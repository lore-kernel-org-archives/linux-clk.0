Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FF83F88A2;
	Wed,  8 Jul 2026 08:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783500068; cv=none; b=oiKF3b4aVAEEnSUcc/zNCQgEIzkge2bgINm3IaGsYyBl8C0zNLDI8HK7Jv4uyY8TK9qfyAv8tyioVEUmAKbkVcVgiLisE3QzQt4MHnZK3LnwSWUmKe4DjZLGXpuoRNvYoTFVX55XUAqOaPAnNMlezaGz9jUA0SO0XKc5yLtFlDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783500068; c=relaxed/simple;
	bh=tgdwSCNLn2wQ6Ikb8ghWJ2z14hWLrZR94l2YIZFgbzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bb1lcDl8qgj3ZT77VrTcpLpsK9X1gfe+jWdtO02dM/GMFr/doSdtKBDrRVhbpqWQ/KpSNUs1B/ambD9OIQuzhrpvxcw1fJuuXlRKiVVympIeZGFf4e7bXO5Dz/zOt/hHPj4bmApOupj5Nzi9+vg+r0qA+C3QygOoAEpQLqfgcQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PiYGXqF6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PiYGXqF6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85D8C1F000E9;
	Wed,  8 Jul 2026 08:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783500064;
	bh=SEJpeMvB0wWVlb8tJ7FlpyUKoTyFiUvESFenDMrW9Yg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PiYGXqF6OzzCLEUHWxpS0Gj7sNsuF344kudUl+2D06OgXf99DbR8xRfPBjr9w7iVV
	 yeyNme4a2tSLajFYejIY3l0vCBsFIUKCQDfCKccM+tDmhui47v4J2vDAbCzdYD+K+T
	 6eZI+4zCaQ4mNgBKUfCs5Klp93kRO15ty3H71q2c7JKgj3e+Ce2p5ormB2s9taAhz+
	 CjFGuDsgT5zY/G+xWeyHT6MjQX0ZPJEZsQba9YHsAFFa1gv8h13Dooo+q23rHimeMQ
	 A99lqQrDl/VCeNEua3uAT3jD9Y/5LeqCi2OxujPe60K329TfjxNjtJ7+WOaKX1JqaO
	 6CZNR5v6jDLXA==
Date: Wed, 8 Jul 2026 10:41:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: clock: qcom: Add support for Camera
 Clock Controller for Nord
Message-ID: <20260708-mindful-alchemical-loris-5b6b3e@quoll>
References: <20260706-nord_videocc_camcc-v1-0-bae3be9e9770@oss.qualcomm.com>
 <20260706-nord_videocc_camcc-v1-2-bae3be9e9770@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260706-nord_videocc_camcc-v1-2-bae3be9e9770@oss.qualcomm.com>

On Mon, Jul 06, 2026 at 02:27:14PM +0530, Taniya Das wrote:
> Update the compatible and the bindings for CAMCC support on Nord
> SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8450-camcc.yaml          |   2 +
>  include/dt-bindings/clock/qcom,nord-camcc.h        | 167 +++++++++++++++++++++
>  2 files changed, 169 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> index 8492a7ef73245e4440d6e30c2fd942319126458e..8e460df9f7444e80be537f7b9544db519c775ae8 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> @@ -18,6 +18,7 @@ description: |
>    See also:
>      include/dt-bindings/clock/qcom,kaanapali-camcc.h
>      include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
> +    include/dt-bindings/clock/qcom,nord-camcc.h
>      include/dt-bindings/clock/qcom,sm8450-camcc.h
>      include/dt-bindings/clock/qcom,sm8550-camcc.h
>      include/dt-bindings/clock/qcom,sm8650-camcc.h
> @@ -29,6 +30,7 @@ properties:
>      enum:
>        - qcom,kaanapali-cambistmclkcc
>        - qcom,kaanapali-camcc
> +      - qcom,nord-camcc
>        - qcom,sm8450-camcc
>        - qcom,sm8475-camcc
>        - qcom,sm8550-camcc

Why aren't required-opps not required?

Best regards,
Krzysztof

