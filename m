Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ACB34750D;
	Mon, 16 Mar 2026 07:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773646172; cv=none; b=fkCWO7D+NweZGH20QL5LQ9yeM1iv8w6BCp3mdvS/sLkcAntuWPVSDi1G+ke/5wIGcivFnKZX2qEGYQKVfQV7ec8GBCbslTHbEybCGm6cae0rF1AQDKXwiq+dTmlTqvyqMf5PEiqgL0VWZcxWnpDZgIuEN7jgmMs8Jvo9qyGcYKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773646172; c=relaxed/simple;
	bh=hBLYS00I4uBZkR08kxezWOH3/0u7seK+o8BwunEZzpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YOulIUNUmMRTBnu6oGvmudHQTbnWPzhn88PGXa5a+gtQ9x+AS+WR0QxDmTqBvS+8bm0/ApV2OVTYVHyP2hqVEfKfe+VNifxbRFlIIEib42cwmxXhMEWkr1aS0P/apSNrtn1uGKk2oKS9LhhlCDnD1ThoAdp6y08XRvHf/OaKfp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S2fXAAEj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S2fXAAEj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03B72C19421;
	Mon, 16 Mar 2026 07:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773646171;
	bh=hBLYS00I4uBZkR08kxezWOH3/0u7seK+o8BwunEZzpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S2fXAAEjgj7ieI9kcQIYjroPDrN4eAxH1IJaxpe0pUqRYR1Z+KhSwXEUYmkubzRDC
	 mZY4f+xi7EizbCWgBsAoSS3spm6QmwSXmUpMBN2gN13ukPhuk3X48JGwxXKmqGhTQT
	 1LSG6PwZqAw3N0xsFMOy4t/KuRzWo5QvRgZ/0Qfsmhhp51rHnAgRRu6I6Vtpt2ESaO
	 HoXNN+/J8DXUwhQar8uhpg4wC44R6T+j6kuZKogBuxYXJKM0ncLJGWdg2ISq29UZrH
	 wP61VeKQ/ivGwWTLn87kF1M7xW11R/VlMUS4eLzVm6FrknFjnRxpqt8wmWXCyp2lll
	 A6y6xfPf5R49Q==
Date: Mon, 16 Mar 2026 08:29:28 +0100
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
Subject: Re: [PATCH v10 1/7] dt-bindings: media: qcom,x1e80100-camss: Add
 simple-mfd compatible
Message-ID: <20260316-glaring-jaybird-from-wonderland-4f8fd6@quoll>
References: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
 <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-1-fdfe984fe941@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-1-fdfe984fe941@linaro.org>

On Mon, Mar 16, 2026 at 01:02:01AM +0000, Bryan O'Donoghue wrote:
> Add "simple-mfd" as a second compatible string to allow child nodes
> within the CAMSS block to probe as individual platform devices.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index 2d1662ef522b7..b5654ef71bd89 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -14,7 +14,11 @@ description:
>  
>  properties:
>    compatible:
> -    const: qcom,x1e80100-camss
> +    oneOf:
> +      - const: qcom,x1e80100-camss
> +      - items:
> +          - const: qcom,x1e80100-camss
> +          - const: simple-mfd
>  
>    reg:
>      maxItems: 17
> @@ -191,7 +195,7 @@ examples:
>          #size-cells = <2>;
>  
>          camss: isp@acb7000 {
> -            compatible = "qcom,x1e80100-camss";
> +            compatible = "qcom,x1e80100-camss", "simple-mfd";

You do not have any children here. And if you checked the DTS, you
would see this does not work.

Please post complete example and bindings.

I suspect that after posting complete picture we will see this is not a
simple-mfd device (child depends on parent).

Best regards,
Krzysztof

