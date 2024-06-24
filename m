Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D41719DF53
	for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 15:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719242128; cv=none; b=Ut4e62lt3s98o9oao0vWjU5ZZYILRjTQtDneWPFJaOpslz5sIPIzP0OfHm4ZPRW/wxLZ1X5ZjWW+rRe+4NIrOF/WS09SrJtgiL2GBLJd0crWvhtiTJqXpkRFdo+UeP3yrI+XzSMEJOUuNP8Gl0VyQXYj2R41YBtR2NqNM7iSdb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719242128; c=relaxed/simple;
	bh=GAsy1hrmvNMsy+al1UKDpEJrsqmugZd4+qdldQYyXSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PgRAkBsTbaeVwbYWXb4gGu5255NuINf27LxLzrKCMIepo96F0+thJSBSKfFbN/yoDceXkA0YlBhwDjrCJen0r+8pEK8rU9GnR+iycFcUzw82CDZySGF3oVp+WuBrPqyPR1Hrw6l66XgDOVvcszBnFmYtn+IbamUcPoRUcr/G2W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D5HhcE4r; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D5HhcE4r"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52cd628f21cso3488289e87.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 08:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719242124; x=1719846924; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9gDB4H9hEb1ddKk08sFFh7SUVmxRRs8hMx/zYwxqCrw=;
        b=D5HhcE4rUbkgNTrPuWdRxMLlER6URmvc3dLoO6U6qqBUQwnNhdG7kSwtyAt/NQhF1C
         QExawB1ot4Y2idWTFDFCKFGRdFZuJgiuIaE9ztLe4ypsdUIjltLvofV3oCz0uCoacJLF
         ml9Tp0ex1SJJtM7P+KA0N+Kqe7N1OJkwo0WzqDDrUz+0ewnxMvn40QnIAzK1Kqa3+aJL
         M2Ki/dSRqgfgf/0qlhga0fPGrnQCHs1f2ec/omb3UaH1VXN3/Z34uVVvznJAdT3XZ5MR
         wvUGILo5/ZhJhPT8P0eK2jYrwozzp9KjKg7U4GcY/8FFN2t8Hn04QRr2ONMH64VitNtj
         HwsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719242124; x=1719846924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gDB4H9hEb1ddKk08sFFh7SUVmxRRs8hMx/zYwxqCrw=;
        b=OgnJ5keiL5ifrBTKlHDFZqRSCgbcoFsSUnGgg7QxK66BgytysFvT0l6fdKBFoI6Lsk
         r4m/EYpYfE1ltiSI1fqhuY5MKPFCUvf/lb8ZNP+BMk1srRi90fpylsP6tnHFwsCr+mOJ
         tOL0sx3PkgyhU4uQ6YCpLipK/PK10NJH9T2IOEbISiJ1rh39uRFWq7UvGZhsGUkIumUv
         xjnbTXiiKIEvB7tfBYLRLOpc3ZV0j8YKYgaVxGCBTs64pqBP5rxZEPeoPaWsI06Uo1V/
         /r6O1HfRLqDwb5FHmdYIed/zhgRA4yH6D6mXIrYpF4+QnM2BJPOFscJoZoF1cIIT/XtX
         ihrw==
X-Forwarded-Encrypted: i=1; AJvYcCVMzgjO2PM1Th5PpcLQ4lHHDezctDiVpD0gO5kZD+5RvlnaIZmpU396LA/GO75is0wDZJrdMXJG+YOthIA3gm3wc6jfPooc5u7a
X-Gm-Message-State: AOJu0YxPhVs2TV8g5lxcewsEOTxfuVVYy5/OBJ5BJPda/sP374LBtdZf
	kP41lVPyjBozpV31RfIV8eHEJwfHBPgc2BzJNxgxC00gNxCKpUxbwgcGDS/rVDo=
X-Google-Smtp-Source: AGHT+IGewbbtNYBe9HGO4cnqDGWmxOyzFNvsNZLeojJsAjYmh08AcYDCbzTBurLxo6pTj/6Sf3tmPg==
X-Received: by 2002:a05:6512:55c:b0:52c:d9c6:f934 with SMTP id 2adb3069b0e04-52ce18356e5mr2814162e87.18.1719242124247;
        Mon, 24 Jun 2024 08:15:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd63b46ecsm1004471e87.10.2024.06.24.08.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 08:15:23 -0700 (PDT)
Date: Mon, 24 Jun 2024 18:15:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: x1e80100: Add soundwire
 controller resets
Message-ID: <2lnbogqx2mxgyn47vgnbp4ameydjq6ajuauklgzslmfinpmnk5@ez2sz3nyd3wj>
References: <20240624-x1e-swr-reset-v2-0-8bc677fcfa64@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624-x1e-swr-reset-v2-0-8bc677fcfa64@linaro.org>

On Mon, Jun 24, 2024 at 02:32:35PM GMT, Srinivas Kandagatla wrote:
> Soundwire resets are missing in the existing dts, add resets for all the 4
> instances of Soundwire controllers (WSA, WSA2, RX, TX).
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
> Changes in v2:
> - fixed dt bindings.
> - Link to v1: https://lore.kernel.org/r/20240624-x1e-swr-reset-v1-0-da326d0733d4@linaro.org

Thanks!

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
