Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367215C908
	for <linux-clk@vger.kernel.org>; Tue, 23 Jan 2024 11:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706009421; cv=none; b=rphO5m9eQUvbHQpoIu5i0MdBpdJDbc4r1il/XuoJZTpOZgGasRzgu7CzfiealG6ubozOYVHoqcpsgavNJbXRLoVxqaQ4/YjlYvUeAuxeLGEbi3dNFTnsW3XwhAhFwYvlTOuwdhAkNKwxBYB3avNOJE5jl3mw0lIm0wL1S/S4to0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706009421; c=relaxed/simple;
	bh=8qXdDuefajqjfJnGLGX3kBl3k5rQ69pq1uKi0EcKllY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XgmKhbs0FJZnMpoXG4f6rSr3g3lcPTIyZ8BVL14/PJYXz9IheoGfTKlI3TJT4UsgXI7vjwfJYKVwhKtLpWNRhdySSDGCwdkh9Kfi21NppfMkLD5vYuycO4elywiejx3f+HumRP5gF7SWMLFABMwm9ayQ+++WzRymLKey3iTq5Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lhVobTbs; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lhVobTbs"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-55a035669d5so4861724a12.2
        for <linux-clk@vger.kernel.org>; Tue, 23 Jan 2024 03:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706009418; x=1706614218; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Ztuc09k9XEhJQ02AL2HYqAF/bdpK94ISal8vRw8Rdk=;
        b=lhVobTbsFdMqdp7UrapKPsBiM8vizR0GcNzoXDhNHRe2dBegrUI1ZLqKNd3S2MclCm
         /de5kBeHEhVPUtW4f5e61ibUr37+QN7MrLZZHTN6WCw2RV0fsZepiOSDikfdh3jPTQIl
         zEdH/tPmfhO20MUoDvTgxoFPm0CTEzNshxpSkbA19CDXmxhmd6rQE3KA/AjVKCpIJ0jQ
         vshTU92+GOeXEKvCyJtWe+K27lDzQ+NpB6u84KcIRBbbJWx286s3X/5iu6HHKqemNPut
         m/iRMYP9HG2aR9CF/y4uYofoVBgp4zuiStAgQT9dbM8n1klGqTCMkHEOebgBJYSFitUe
         TAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706009418; x=1706614218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Ztuc09k9XEhJQ02AL2HYqAF/bdpK94ISal8vRw8Rdk=;
        b=Ybh/NSdUytWVXDXWTxY+EhS8+iRwGgcE8Qc2QzAkaSm0a/Gb96+Zrk0yqggB1NnXoC
         kjHDDceWlsR2xmVAY6AjgNl5bbXROOP9YD6B8lzU/6+ALR1hS+gtlWhtU0cea7jUds6K
         kkf0miFjAb37FfHjOqEVpOuiPoEwhOIgTgyJt24nHNxa/rMXhN4VLCHhFG3YepKwmFVa
         dHBWy7l1W0VkTt6zFdsAMBAvnV2x8TfEDFSX6C+tJAXjyJhrW3WibP7Bz3vstXczBtl7
         DOLOb7H0DT0fJfy9jVwD52kJ3Tx3OGMXmFvWGTBNe994LP0ZFnr22NuMwAb2CeFGDHUf
         siyg==
X-Gm-Message-State: AOJu0Yw8yeh0g5bS82iBUp1Tr9fMkpq0R3+v69JVaAPQRbIvl/pSSKT/
	Im+vcFYgKmgw4JMd537z6ZGqUxD9mV9dTmx6a/yXIL6U5hoogUO/uF4RBsNgUrA=
X-Google-Smtp-Source: AGHT+IFwIlT1lMB4ByCt9mLwJOwLsuGSAt+FQywblYcr61g2wF5iH1FRbTnf2W39FnDIo7d9BMxBMg==
X-Received: by 2002:a17:907:c70d:b0:a2f:df21:9f24 with SMTP id ty13-20020a170907c70d00b00a2fdf219f24mr2609314ejc.97.1706009418414;
        Tue, 23 Jan 2024 03:30:18 -0800 (PST)
Received: from linaro.org ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id vk6-20020a170907cbc600b00a2ea02e4162sm7969848ejc.214.2024.01.23.03.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 03:30:17 -0800 (PST)
Date: Tue, 23 Jan 2024 13:30:16 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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
Subject: Re: [PATCH v2 07/10] clk: qcom: Add dispcc clock driver for x1e80100
Message-ID: <Za+jSGEpa6sobVIU@linaro.org>
References: <20231214-x1e80100-clock-controllers-v2-0-2b0739bebd27@linaro.org>
 <20231214-x1e80100-clock-controllers-v2-7-2b0739bebd27@linaro.org>
 <27cc9438-d31f-41af-b012-adb77dd4da5a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27cc9438-d31f-41af-b012-adb77dd4da5a@linaro.org>

On 23-12-15 12:45:11, Bryan O'Donoghue wrote:
> On 14/12/2023 16:49, Abel Vesa wrote:
> > From: Rajendra Nayak <quic_rjendra@quicinc.com>
> > 
> > Add the dispcc clock driver for x1e80100.
> > 
> > Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> 
> > +static struct platform_driver disp_cc_x1e80100_driver = {
> > +	.probe = disp_cc_x1e80100_probe,
> > +	.driver = {
> > +		.name = "disp_cc-x1e80100",
> > +		.of_match_table = disp_cc_x1e80100_match_table,
> > +	},
> > +};
> > +
> > +static int __init disp_cc_x1e80100_init(void)
> > +{
> > +	return platform_driver_register(&disp_cc_x1e80100_driver);
> > +}
> > +subsys_initcall(disp_cc_x1e80100_init);
> > +
> > +static void __exit disp_cc_x1e80100_exit(void)
> > +{
> > +	platform_driver_unregister(&disp_cc_x1e80100_driver);
> > +}
> > +module_exit(disp_cc_x1e80100_exit);
> > +
> > +MODULE_DESCRIPTION("QTI DISPCC X1E80100 Driver");
> > +MODULE_LICENSE("GPL");
> > 
> 
> And we don't even do the odd underscore insertion consistently. For whatever
> reason "DISPCC" instead of "DISP_CC"
> 
> Just to reiterate the underscores should be dropped from these clock
> controller names and defines entirely, they just eat up bytes in databases.
> 
> .name = "dispcc-x1e80100"
> 
> ("QTI DISPCC X1E80100 Driver"); better but IMO we could just a complete word
> here
> 
> "Display Clock Controller" there's no need to abbreviate.

Maybe, but I think it's better to stay aligned with other platforms.
So please check SM8550, SM8650, and so on.

> 
> ---
> bod
