Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7E217BDA
	for <linux-clk@vger.kernel.org>; Wed, 24 Jan 2024 09:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706088177; cv=none; b=TUR4sNOWJWQD42+unhh3lY1gp9+F+cJsZ/mrWClDIVrKdtgQtnyfgaTzrTK0bG3BffoFTV1L6t6OCHkwTfsV4XXjt28QWYnaeQPojHONRC5tlTQotoeM/c4x9HTwq8UiJPm5ZvfBKqUbK+FBo8YfCW/ufhsiAZSJGXbSEuF3/Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706088177; c=relaxed/simple;
	bh=RvnstN+NQtpHBGLJ1c4pR3cxTU/16Rx2Upex7re0PLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E6h04VEAeEyfgiaoQ0ynmnoa2scf+Et/aSR9siUVIwultqYJuCH7Eadfyeba2bPKYfwe9v8tj26Ms+cmOgmFeND3XUFKIwS24HD8/Kph+sxbz7ozI/vVuVN1n2PVs2IxSMij+O3gE00ytfGefmFU/n7ZIO2b0P6iHsvOq17Y0Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B2BGTB20; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B2BGTB20"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a31092083acso71220266b.3
        for <linux-clk@vger.kernel.org>; Wed, 24 Jan 2024 01:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706088174; x=1706692974; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sR9zPble25AhmUNn+7x39sNPQF5UdEiml7UIrsN5jbk=;
        b=B2BGTB20b5UXlN9sUOASVlxIooM9/v55LjQozjD8DCsgomzq0X92Q7aBEoYB+zHcXo
         CE/oI5iCe2IFg6LC+WRpRgQ56zFGGa6MJ+1mgQJZPA+HhVHOVe+7fluNtzjV0cLYt/yQ
         7FbBMocf3RVQGZLKRMQ7d9JhBC2teYMjwc+5SM50knfuE9W7imKvbYFTu9t/Ev8ryhIm
         CK4JPMHBz+idWPM1qDbEBrnzve8kMCXXiczBD+xC9B21yw7fl/c0XyUEPnoZPIb+gvvx
         nCb2b4gC/e/ynYUSGgC8IHDjEji982pXZ1nOhtjbszzGsGI6HCBzC6H86GUTF3P8Tiz2
         q23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706088174; x=1706692974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sR9zPble25AhmUNn+7x39sNPQF5UdEiml7UIrsN5jbk=;
        b=Id2X1j+Km5r08HJYdKk/ZucKkcWK9toBp5prm5BlWcj0R2DaNGgVCNmS9pcDa0GS+2
         1ZVcdB/1WSkzO73zXlfi2BNOHdm+KrNmLKIJEghUDozR8drmrB8FCpJVN8tCyllT0NKa
         mC32RZnsQZrtW/wxg5Ulp2+EIA0rPuX2dUCeHZdHv2NDRyv3P+/RH3WuFv/yXssVvwK3
         0CiAeka+7mMITKsul+UkV19aCM55e7/N/ecQfdEW4JIfluZXCMinfqpjzPJHMWIO8ehT
         vBqwp7CB7Hibw36Plkn1KmxSBD9bBj9+BLN8W0Thu0Hl+uGJaArRX83q+YJXS2sFUddU
         7B+g==
X-Gm-Message-State: AOJu0YwSk7cQXOkyVnkWrQ3YD2sdN0mOWWO4sr/2kRxJrNXaXweRfZG1
	mPtgRU/pa7Ao0J56b2WWdYRj9BNZnD10nCf/M9twWVW1rimv3Qffo9gVs5oXaFA=
X-Google-Smtp-Source: AGHT+IFdHK7IwG9O5huGr481sKlTD4E6DbBxhdu32Sit5PoGIT0INmXPy3MH1E6DiFAnsTKSOS6+Jg==
X-Received: by 2002:a17:906:c4c1:b0:a2f:68cb:dbe3 with SMTP id cl1-20020a170906c4c100b00a2f68cbdbe3mr627050ejb.75.1706088173863;
        Wed, 24 Jan 2024 01:22:53 -0800 (PST)
Received: from linaro.org ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id ss3-20020a170907c00300b00a2eb3d16fa9sm8688546ejc.144.2024.01.24.01.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 01:22:53 -0800 (PST)
Date: Wed, 24 Jan 2024 11:22:51 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
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
Subject: Re: [PATCH v2 10/10] clk: qcom: Add camcc clock driver for x1e80100
Message-ID: <ZbDW6zKX5FqG+6Qy@linaro.org>
References: <20231214-x1e80100-clock-controllers-v2-0-2b0739bebd27@linaro.org>
 <20231214-x1e80100-clock-controllers-v2-10-2b0739bebd27@linaro.org>
 <624956b6-d7ea-43da-bb8d-32d9166a0272@linaro.org>
 <Za+n4zfzoZFhhLIa@linaro.org>
 <f5784838-0386-4ef8-bc3b-195a0132a29d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5784838-0386-4ef8-bc3b-195a0132a29d@linaro.org>

On 24-01-23 18:56:03, Konrad Dybcio wrote:
> 
> 
> On 1/23/24 12:49, Abel Vesa wrote:
> > On 23-12-16 14:39:48, Konrad Dybcio wrote:
> > > On 14.12.2023 17:49, Abel Vesa wrote:
> > > > From: Rajendra Nayak <quic_rjendra@quicinc.com>
> > > > 
> > > > Add the camcc clock driver for x1e80100
> > > > 
> > > > Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> > > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > > ---
> > > [...]
> > > 
> > > > +enum {
> > > > +	DT_BI_TCXO,
> > > > +	DT_BI_TCXO_AO,
> > > > +	DT_SLEEP_CLK,
> > > > +};
> > > > +
> > > > +enum {
> > > > +	P_BI_TCXO,
> > > Please don't overload this define with DT_BI_TCXO_AO, add a new one
> > > for the active-only clock. Please also do this in other drivers in
> > > this series.
> > 
> > Nope, that needs to stay if we want to align the dt bindings between
> > SM8550, SM8650 and this. At least for dispcc. But I would like to have
> > the same dt schema for the rest of the clock controller drivers between
> > platforms that share basically the same ip block.
> 
> No, you're confusing the dt ordering enum (the first one) with the
> parent list enum (the one below that I'm commenting on).

Got it. P_BI_TCXO_AO it is then.

> 
> Konrad
