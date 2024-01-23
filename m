Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237F450268
	for <linux-clk@vger.kernel.org>; Tue, 23 Jan 2024 11:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706010187; cv=none; b=LaKIRL8HJiFa1EcqZXZPEkYm3s3URIxtjoDdxK1ak7lluEXS76bShPDQJhevG4kOmxRkLA06eMi+P0L+MiaAiEuu/P/Ft/q3oFE7kGXUnp050XNuVFKFtTsY6vZXrgkYOpZyuaCh8N+gC0qtMhdalkbUxdWGZDEBihPSQl/gkHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706010187; c=relaxed/simple;
	bh=yD5zgikaBnzqRFckUp4Iw29O6Q9Cu/bTBJbJ1D6g47o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xfx5kQSyE8b8j0tlaPdxu+c2u6Pq8wC6DcZXZRXZfb40Amj5w+UAFnyfhFLuqjV7GpfFMuk2uCJBgQHyhfEBAVd9zaPy6MsdDuqByMxQd1vhfZKM9ipHJAbj96Stg0Srffu8/X/1aeZjCqxkMGC4gxTQtD+nlRzGx2lPSXMY2Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V1h+dgnf; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V1h+dgnf"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a2f22bfb4e6so431785666b.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Jan 2024 03:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706010183; x=1706614983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rCBz3mYv0AakBZqsbV887sBgjYgjKky8SqdijPrpvLA=;
        b=V1h+dgnfOmdGp+fkvd/vqG/nSF2tHTDNQjcgkv+N4qbtZ55BenntJPRZxPifaAvYMx
         D/4XwKXBS/okr2bG5D2R5r9HG1eEK3XbLEz8N7SQH3HPbvvlpGTZ2a0HHp1M14+q5eFG
         kZmvq3J2eRWJJqVcNYHEA0W+HJp2EoDZZP3bGM3byOYK2av8hloVDIo8fa0W/RbAvpY/
         0yEOd2ZuVr+FuWXw8VmZ4dzR47mDoXYFqV4NgR5LDBymZpLEfMbVt6LDvMSdAiOEPT/v
         c7jQvWjtOPfAw2CIAXl/kRWM36ug8dLX2FW8CgUq2dwQqbyYtJ3QiQ7vfxTijIPGEC02
         3ByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706010183; x=1706614983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCBz3mYv0AakBZqsbV887sBgjYgjKky8SqdijPrpvLA=;
        b=jol7O0FOc2991ZaqdwoVan8DNJNLzAryDckZVRuVzi5Q8Vk+bd/9jl1ZHITdQbqWbf
         9nNQMgaVhttZ5imqM9kHW2mm0Ywt1E+ib9DMAQyG6aBizjbjgWQQFM3C4MbBJAhatIN+
         21rTidbgW2GyXj6JBh/MSzTWDPZ3JtE3igMgHZYrbUSiNRu22YfBgefLCrWyicp4AF2S
         VlQPC4xbQieF8F56jqZ2jDVY2bxzMplqBEQ6kdIdhTxasdxzfjXcCfRxihfcWQ+hTznT
         sc/aAxERgmy3Q/CO24hpb6nUDWjnQQjjvpNp8scLQ5oah2q3VOseidXjeQDnnFW2NO+I
         vzgA==
X-Gm-Message-State: AOJu0YxqYvkQ4wk/RYPZM0mOl7IJ/ARooMud9X7fyQIhIlH2QlOepGr2
	oWFIYusJ3032CsD5D3vlv65hSAErlHtKyIL2uSK2YodpQ28VVUB5hfOa9o1qvmU=
X-Google-Smtp-Source: AGHT+IFyov8dO82PiLmNVMmgfIb+vNpzx5fstoBpC7KEjzuH7yt3y/nlkS6ebQk5bLYliqGYMX2O7w==
X-Received: by 2002:a17:907:c001:b0:a2f:bf0e:ed99 with SMTP id ss1-20020a170907c00100b00a2fbf0eed99mr3629890ejc.86.1706010183301;
        Tue, 23 Jan 2024 03:43:03 -0800 (PST)
Received: from linaro.org ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id tl12-20020a170907c30c00b00a30abba5089sm730935ejc.206.2024.01.23.03.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 03:43:02 -0800 (PST)
Date: Tue, 23 Jan 2024 13:43:01 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	Rajendra Nayak <quic_rjendra@quicinc.com>
Subject: Re: [PATCH v2 08/10] clk: qcom: Add GPU clock driver for x1e80100
Message-ID: <Za+mRZD0v6zNZ27r@linaro.org>
References: <20231214-x1e80100-clock-controllers-v2-0-2b0739bebd27@linaro.org>
 <20231214-x1e80100-clock-controllers-v2-8-2b0739bebd27@linaro.org>
 <fc6f8e78-f704-4104-b3c5-bd10627c33b4@nexus-software.ie>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc6f8e78-f704-4104-b3c5-bd10627c33b4@nexus-software.ie>

On 23-12-15 12:40:45, Bryan O'Donoghue wrote:
> On 14/12/2023 16:49, Abel Vesa wrote:
> > From: Rajendra Nayak <quic_rjendra@quicinc.com>
> > 
> > Add Graphics Clock Controller (GPUCC) support for X1E80100 platform.
> > 
> > Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> 
> > +static struct platform_driver gpu_cc_x1e80100_driver = {
> > +	.probe = gpu_cc_x1e80100_probe,
> > +	.driver = {
> > +		.name = "gpu_cc-x1e80100",
> 
> I think these underscores are very unnecessary and subtractive of meaning.
> 
> .name = "gpucc-x1e80100"
> 
> > +		.of_match_table = gpu_cc_x1e80100_match_table,
> > +	},
> > +};
> > +module_platform_driver(gpu_cc_x1e80100_driver);
> > +
> > +MODULE_DESCRIPTION("QTI GPU_CC x1e80100 Driver");
> 
> "QTI GPU Clock Controller Driver"

Again, please look at other platforms (SM8650, SM8550, etc).

> 
> ---
> bod
