Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7ADA18037
	for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 05:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719207600; cv=none; b=f105lWLerGZccrnj1jtHgYUAV48spWR8hywd8SBneaoLntejhLSY/7JYG4C7eA8nOJ3EJf4qLcAyixy3jCLBcMP+qRrmS1hXKuwMv5zokM6SxcEX4x05XgzEHKLiAGOdFvgA0/HJTa/TJGHdjqo2yj16dKWNl2bbqmOsqN4CLrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719207600; c=relaxed/simple;
	bh=sB79L96chHPnNm0NFvdeCIIlAOMEQ6KrbxWuMu/JXyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o8O9usp9ULCfhiMEA0+pBnzWTOIqardbK28Yxnax9CsxCg4YLlX8p2bE5Ow/SGCowKTi/Azrd4u5sny0Z+LEykBe1duOIZo1aC6CeZjTvTBlPKWJ4V9vNEA9IxrT5R2SAtqmnf57Fp011t1YQ7lrlWpW1KwdI6zIwQZe24qjUqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ygb5B6Y2; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ygb5B6Y2"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ec5779b423so14621871fa.0
        for <linux-clk@vger.kernel.org>; Sun, 23 Jun 2024 22:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719207597; x=1719812397; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W2pTq14fJDQ5yGDwK5Gy7r+oFB9f/7Tfv11KtK9Jc7g=;
        b=ygb5B6Y2xGdwczHfGG0kw0C4UN6EsOQH7yKier2qAaW70biwhAk1lckHaUhSht4APV
         DeED0mbqvBdYu5JvVifHiHfWSd6u8Dh63szaRZRKVyalbE9W2EZ/ni+bHQXqhm1S0b8K
         WeZm83rQ2ZUp6yPASdz965sDY8aXC1K1V2O3VhuxKGNQXflzJ9juXdYaJ3rimm+5MOe9
         w3pyxFl5Y1YWU5mT/hk2xY33gMELI59O/wfgSmR5mc3Ml6BHPeA8M0DTvvmIT1FHNHzA
         Sv8I81L9r+rx0MRRGLQcUv+rOtzcnr37D4b0gOX2w0Fvo6IyjENpSh32PgEizwISSHIf
         6rPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719207597; x=1719812397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2pTq14fJDQ5yGDwK5Gy7r+oFB9f/7Tfv11KtK9Jc7g=;
        b=MLuiVXeFOmfnEK9DlE0R2PQvr6GsMSUkWwo7Hk1HDzTCLa6geyMSg8jm4iQajwq7Uf
         AOwMCEWoaqEM2mRg9t/ShdbZm3iSFOq7y+SEVypz5XLr/aYIUYQvQ2Hv+QBcPIgNF6jA
         ub141FTqEyMiuHsGlZ5aW1tHw6UAVmqhWPNt8ZXNa/F8Yzx1U1+INTMHE+oU55Z8wOGE
         Gpv8x/zuZS+mV0/oCmveUMCwK3x0mpKLJrdzgm+mdvoqUdQDzbjXDfBiUk6bD7eK4ufT
         E3S8kmsuNZkY9PO9KYEzJi49GVulTBdRr/3BLWp8Qe4LLU1qEzRdrhVphSThUjivjC5w
         hX6A==
X-Forwarded-Encrypted: i=1; AJvYcCWT+nIcyvCi7GhqPCeorvWU0xzhVp8wFHR7FKnvtn1y1fBvAsEoqmnLtyCqwb/eLLML6Tcm03uTo3yyeZmnFRQYtPKnh3RKGHNP
X-Gm-Message-State: AOJu0Yy6eqwcXnRalXiddeCu035Sq7qoY/xSxbSnwVvHxeklZKG4VsHT
	2srg0ejEBpxYMEb0txTtqByUGKAi2EnQDF3mBbNaaIeICNkrk1g1DI99xQEgUEA=
X-Google-Smtp-Source: AGHT+IFDXqAelN1o1aoynRbVBM3dlltX3PoMRNoTGMGeQsPIYe1hFOjXJgL2gSBMPpmrRfB9RgkUyA==
X-Received: by 2002:a2e:bc04:0:b0:2ec:5964:9c0d with SMTP id 38308e7fff4ca-2ec5964a0f6mr39924281fa.0.1719207597034;
        Sun, 23 Jun 2024 22:39:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec4d787ed2sm9038041fa.130.2024.06.23.22.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 22:39:56 -0700 (PDT)
Date: Mon, 24 Jun 2024 08:39:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	angelogioacchino.delregno@collabora.com, andersson@kernel.org, konrad.dybcio@linaro.org, 
	mturquette@baylibre.com, sboyd@kernel.org, ulf.hansson@linaro.org, quic_sibis@quicinc.com, 
	abel.vesa@linaro.org, otto.pflueger@abscue.de, quic_rohiagar@quicinc.com, 
	luca@z3ntu.xyz, quic_ipkumar@quicinc.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 0/7] Enable CPR for IPQ9574
Message-ID: <5xgjszacvtnjftygwvtonb4npspaceutnvnnniebxntii4tmud@xag2c6j2svqa>
References: <20240624050254.2942959-1-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624050254.2942959-1-quic_varada@quicinc.com>

On Mon, Jun 24, 2024 at 10:32:47AM GMT, Varadarajan Narayanan wrote:
> This series tries to enable CPR on IPQ9574, that implements
> CPRv4. Since [1] is older, faced few minor issues. Those are
> addressed in [2].
> 
> dt_binding_check and dtbs_check passed.
> 
> Depends:
> 	[1] https://lore.kernel.org/lkml/20230217-topic-cpr3h-v14-0-9fd23241493d@linaro.org/T/
> 	[2] https://github.com/quic-varada/cpr/commits/konrad/

Please include [2] into your patchset.

> 
> v2: Fix Signed-off-by order in 2 patches
>     Update constraints in qcom,cpr3.yaml
>     Add rbcpr_clk_src registration
>     Add Reviewed-by to one of the patches
>     Not adding Acked-by as the file has changed
> 
> Varadarajan Narayanan (7):
>   dt-bindings: power: rpmpd: Add IPQ9574 power domains
>   dt-bindings: soc: qcom: cpr3: Add bindings for IPQ9574
>   pmdomain: qcom: rpmpd: Add IPQ9574 power domains
>   dt-bindings: clock: Add CPR clock defines for IPQ9574
>   clk: qcom: gcc-ipq9574: Add CPR clock definition
>   soc: qcom: cpr3: Add IPQ9574 definitions
>   dts: arm64: qcom: ipq9574: Enable CPR
> 
>  .../devicetree/bindings/power/qcom,rpmpd.yaml |   1 +
>  .../bindings/soc/qcom/qcom,cpr3.yaml          |  35 +++
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi         | 269 ++++++++++++++++--
>  drivers/clk/qcom/gcc-ipq9574.c                |  39 +++
>  drivers/pmdomain/qcom/cpr3.c                  | 137 +++++++++
>  drivers/pmdomain/qcom/rpmpd.c                 |  19 ++
>  include/dt-bindings/clock/qcom,ipq9574-gcc.h  |   2 +
>  include/dt-bindings/power/qcom-rpmpd.h        |   3 +
>  8 files changed, 488 insertions(+), 17 deletions(-)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
