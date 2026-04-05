Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D342874F8;
	Sun,  5 Apr 2026 07:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775373860; cv=none; b=spPF+zJ8XZqjx6+8p4r/cgL+aEe4FfexI/GC7pkWs1b9edfaDTkMYu4bHcJaqjkachHry3MFVptIyvlIM/TPc3N5pJpSj0gCA/vMCg1sW9Nu1zLi03DRCsq2hKd7O6DisqGzYJTT8vzsdP4tSnFiIZ8csLbKyR0JKVNm16rOEao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775373860; c=relaxed/simple;
	bh=42DZ9rar70RXNUvx2S1gEIaFxTQbJSiqeamqnAWSqcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oac6lrv3JK4JqCawKdlcCSSY2so9ksHkizkWWLzw4TSNBIb298DkqejqG5nrAgfO/DDxm2FSAjA8q77zGt19fFHri17+sgbbj0zz4EO5K3eNqcd/fAymIzUtbM8T+VAflRcFiqRkmZXBFm7eT1gkeveYyWiConsgAi5qrwDfzD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gZeOq7YR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gZeOq7YR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93D30C116C6;
	Sun,  5 Apr 2026 07:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775373860;
	bh=42DZ9rar70RXNUvx2S1gEIaFxTQbJSiqeamqnAWSqcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gZeOq7YRjP1LVYl3Kflux+L7naoVUxdq0P0bSQ7Chd/ljnZliQdMZ7mN+zihk4dY4
	 QQpfRpcaL2TK+W2CFUXbyaW5/5T5gh9+p8Fi5iL3/ItVU05miHlw9QXgX9hmXSQ1BY
	 NJa5t0Bs1eBSBX6ndpQkbEkBZnOEUmxmZTQOsHGrVNII8Qc0py29GvU1YiDVBs2JTT
	 rIyWavDOl2KoRxRPlTJuqOKuasM/8iWiaDNUpbUXQLxW7WTcST4ClExJwxEVr9BjM/
	 0ijjER6GwKoBxktcbMOBPvBrSZgzwlurFl6kNMXc+JyutplXN3fZpoSmMSvnMvf4lQ
	 +uoMlz4xYWsnA==
Date: Sun, 5 Apr 2026 09:24:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: dongxuyang@eswincomputing.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, 
	huangyifeng@eswincomputing.com, ningyu@eswincomputing.com, linmin@eswincomputing.com, 
	pinkesh.vaghela@einfochips.com
Subject: Re: [PATCH 1/3] dt-bindings: clock: Add ESWIN eic7700 HSP clock and
 reset generator
Message-ID: <20260405-resourceful-amethyst-tarsier-0cdab6@quoll>
References: <20260403093459.612-1-dongxuyang@eswincomputing.com>
 <20260403093548.670-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260403093548.670-1-dongxuyang@eswincomputing.com>

On Fri, Apr 03, 2026 at 05:35:48PM +0800, dongxuyang@eswincomputing.com wrote:
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: HSP configuration top clock
> +      - description: MMC top clock
> +      - description: SATA top clock
> +
> +  clock-names:
> +    items:
> +      - const: hsp_cfg
> +      - const: hsp_mmc
> +      - const: hsp_sata

Drop hsp_ everywhere

> +
> +  '#clock-cells':
> +    const: 1
> +    description:
> +      See <dt-bindings/clock/eswin,eic7700-hspcrg.h> for valid indices.
> +
> +  '#reset-cells':
> +    const: 1
> +    description:
> +      See <dt-bindings/reset/eswin,eic7700-hspcrg.h> for valid indices.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +  - '#reset-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@50440000 {
> +        compatible = "eswin,eic7700-hspcrg";
> +        reg = <0x50440000 0x2000>;
> +        clocks = <&clock 171>, <&clock 254>, <&clock 187>;
> +        clock-names = "hsp_cfg", "hsp_mmc", "hsp_sata";
> +        #clock-cells = <1>;
> +        #reset-cells = <1>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 76e91d47d2f4..bcbb9578c043 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9506,8 +9506,11 @@ M:	Yifeng Huang <huangyifeng@eswincomputing.com>
>  M:	Xuyang Dong <dongxuyang@eswincomputing.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/clock/eswin,eic7700-clock.yaml
> +F:	Documentation/devicetree/bindings/clock/eswin,eic7700-hspcrg.yaml
>  F:	drivers/clk/eswin/
>  F:	include/dt-bindings/clock/eswin,eic7700-clock.h
> +F:	include/dt-bindings/clock/eswin,eic7700-hspcrg.h

Why this cannot be eswin,eic7700* pattern in each directory?

> +F:	include/dt-bindings/reset/eswin,eic7700-hspcrg.h
>  
>  ET131X NETWORK DRIVER
>  M:	Mark Einon <mark.einon@gmail.com>
> diff --git a/include/dt-bindings/clock/eswin,eic7700-hspcrg.h b/include/dt-bindings/clock/eswin,eic7700-hspcrg.h

Best regards,
Krzysztof

