Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BAF482EB
	for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 08:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719216160; cv=none; b=CBQ96nmB73JsWrna+FBXEzBkudTaSP9ceqBDKBpszdnmBO0fe2DDWY6rW4KIcuXizK7Oq7ORc8cyWFDTTL6d6mRKf9QMTvZWH9IZGeqJxoz7aj+y9XJ9O7GJmL7zn0QJAkekderZJwm1L2EyxIhWRZxtGPA9InICw/m8Zf2CniA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719216160; c=relaxed/simple;
	bh=G5Qn//KYJurhujRB11lPeB8e+EIAyHg7xty7HjrrFDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kjOrZhHwGyJ87nLWHKmvbwRmLyRiOqfYpZgGZGGFpvLbgMLkPOhQFhInYHCC6ouxYkVu9i4yXIr16Af2n5Y+huz65uM039AJg0e01gKf0WsVLvky9wCEEXXAxdZ68RC9Bqe9+nZDjcPCg1benS4tCPIMThtuTZi0x4j35pFF4k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yirp48Dc; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yirp48Dc"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52ce6c93103so668589e87.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 01:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719216157; x=1719820957; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JmUODOqAFhfu/TumPgiUij2c8ZErNXIfL1HAYn6wNUQ=;
        b=Yirp48DcwotwFBZnapV0dbXOhIx4EeObQr5BiFCnvOJhHDgtvZNsi01jpwtYnw1eIc
         byDOjlIINAfpMs2Bm2nGMxjnHQvMhfmAcMM1FAkplIV/Ex9U+9hI0gxjegjA04oOizfC
         fE1cOLtKHL9SPtr8fnh74cJITt43bO9WFq/cgahcrR8NT4Cv+G2hUioLg/ygZSgwfx8+
         E/qpV2ErHPH1HZHuE5ylwgoYUP907iR8Zof6xAuJztttze2R94d/Yu5RfYKTDn2YfJPg
         f61IO6behS/MaqOoPlmy5trN/vyqXlAwhn7lo1Y9fFLb/sqhYs53EsRkKr7ooMrZBYXb
         nI2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719216157; x=1719820957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JmUODOqAFhfu/TumPgiUij2c8ZErNXIfL1HAYn6wNUQ=;
        b=ZULJGnk93N2+0RAg5NRkiW92adpi9SJT37H1/+cs4SWI8bHQmIjXLb/PBSnvwOGdjJ
         mltKDg+MXPE8IFloNpLQuex+eVKeT5aW7BYZOMHOQlu/RBUS2LSDzLYIcxmyIHo643xx
         +hE2HvhLDeUUGTzpF5+oR3m3K+EvkQTmF40Sc6FUdq2t2QO2Q4I4XnHANODMkxyQqOkk
         Onci7VsNEG8YUv2b1lZq5XDGR4uFmt/U0d24V3O+Ah77WMp0GWTMJKYbrCW1hKeIEq2v
         JT5Xst3p0zwZb01Hr8h/e8ZywYNI4VKHlxp021ayi5HMwciR6pYoQv+4TrB3hpEnlVlK
         5QoA==
X-Forwarded-Encrypted: i=1; AJvYcCVh0hV2i5VC7pmjB060KjdOxL0q9ZgPONCs0b2rsgPJ6HFdak/eiQjA2GIjpWpxmbuPN5y80xOQ7Clhr3qy5YFjBroigNoonX8f
X-Gm-Message-State: AOJu0Yz+liOt3ukrZiPNs5SEfzDskHxQvvlhgmrM4NK1p+4L7uN+fUkZ
	ppyftvjJca/yskkb3ujn2TEVwIgDJQihGqC8h5IsOXwXm1qfkRVGuerrYWorMPY=
X-Google-Smtp-Source: AGHT+IHkDR7XBX6FoBLurUZw+DeDGbXBvdgJUBU72fiBcGOXOwufGii4v3W5X9cULdPxdwBw73ZBfw==
X-Received: by 2002:a05:6512:158f:b0:52c:e091:66e4 with SMTP id 2adb3069b0e04-52ce18523ecmr3410756e87.44.1719216157179;
        Mon, 24 Jun 2024 01:02:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd63bcef1sm920765e87.72.2024.06.24.01.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 01:02:36 -0700 (PDT)
Date: Mon, 24 Jun 2024 11:02:35 +0300
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
Message-ID: <ncfhv75xjnuz4bdkhzqmiqrg3khez57bwcvrhp6unmwxrlol7o@etkokfnjuuru>
References: <20240624050254.2942959-1-quic_varada@quicinc.com>
 <5xgjszacvtnjftygwvtonb4npspaceutnvnnniebxntii4tmud@xag2c6j2svqa>
 <ZnkXJWXI/mfP/vG+@hu-varada-blr.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnkXJWXI/mfP/vG+@hu-varada-blr.qualcomm.com>

On Mon, Jun 24, 2024 at 12:20:13PM GMT, Varadarajan Narayanan wrote:
> On Mon, Jun 24, 2024 at 08:39:55AM +0300, Dmitry Baryshkov wrote:
> > On Mon, Jun 24, 2024 at 10:32:47AM GMT, Varadarajan Narayanan wrote:
> > > This series tries to enable CPR on IPQ9574, that implements
> > > CPRv4. Since [1] is older, faced few minor issues. Those are
> > > addressed in [2].
> > >
> > > dt_binding_check and dtbs_check passed.
> > >
> > > Depends:
> > > 	[1] https://lore.kernel.org/lkml/20230217-topic-cpr3h-v14-0-9fd23241493d@linaro.org/T/
> > > 	[2] https://github.com/quic-varada/cpr/commits/konrad/
> >
> > Please include [2] into your patchset.
> 
> Did not include them because Konrad has agreed to post them this week.
> And, I don't have an MSM8998 target to test those changes.

At least CPRh-related patches should have been included, so that we
could review and comment them.

-- 
With best wishes
Dmitry
