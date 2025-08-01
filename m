Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D3CAD4B
	for <linux-clk@vger.kernel.org>; Fri,  1 Aug 2025 05:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754026287; cv=none; b=s1yGBpFEQ4Fy9xQFutFXz0dNkHFoKgBT0tSqhP1QPQ2gkVV5U388RJEJOMbq7CIeQeogVj3npCeUxtEpYm4i2SfcQ/0/dJNwRWWLzs3gM8ZxIVF/vDkaDmuxRyf+5hw08JFgoncrAV1pxYmI6hFsYXjKvldU5TkHcGgosHxlQSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754026287; c=relaxed/simple;
	bh=Mi0EJz0k9BDT73y9pKnwu2ug/iY7A8vmCWUIL9F4FBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FNXWpSf4b39RgoKUb697BWVx7kRQ0CHbkvzR3fzOH2wYP36g/afNmhijqKZqpUe4/ePqEI0Sxtw2NQGr5HUynCvLFt7wlH2XGpi2/h5e5Px24yPp8Hkv1h+Bau3eNjgB0iJ4g0IaMICs4afwEyuqvW5gkJTSgqJlHj2gxnIYvjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DFwAjjs6; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DFwAjjs6"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-af8fd1b80e5so275188066b.2
        for <linux-clk@vger.kernel.org>; Thu, 31 Jul 2025 22:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754026283; x=1754631083; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TaCQzaa2dwnZgyymkO8fe+rPIoXFap0GNWHfkgImPMc=;
        b=DFwAjjs6kUvh4a0XABMFKcmSL/abszKzeeRGG0IZroeaAQKLlOPQ77Rug6jERxe8mI
         G8IgIoMJYo1285f2oIgYzCQSgZrORuq1t34uZxKR43NxJ4UNjCqItngAYhxuYoGt6pEe
         H6+NSTffmdozME76C2Az0v093jYSKKfcztXtDxPvuDiS4Wn6Yhye1n/BrHRCgfhQTF6x
         jME5vq6OzEFkjLmOdRGIENRZOx1uCdhdQsYC8LW5clE+eR51Bap7/meY+F43Vc6v5YSi
         MeQM8E74xSbe6HPLj+qln6mnukZolyn6rKdYWYB/YikOfDIhXX9B19V0aLtTfEDuH263
         PRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754026283; x=1754631083;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TaCQzaa2dwnZgyymkO8fe+rPIoXFap0GNWHfkgImPMc=;
        b=TjpG0vbnNVDKPodE6JO5s2/3/DbddkmNNEdbd2astY/smUhF+8i/596S0eD6XS/e/3
         lZb9pGwPClpc743Ahgv1SM7ROw4a8OFGCnn3mnXqb8Y71k6Tn8L28X7ClcF1upZvDXhJ
         qO7/z9tRN5eQGu0hT7vjDCTAcCevfaBX4aeFycv4rAz8Jar41Fve6Q7p92PW6vAGSLsi
         LFlhQ6SGVrxTEyulv1Wif26cWVEkUQq44K7F1v6fTglRw534hm3KXHa8bAaw/JuYJZMF
         KWWxXE8vsx/6Dea1NQLUNQ/QSFXDgEBPmPlzTPDeqhrFJIsE9HOIWodDjd8+R5WUSLqa
         QiJw==
X-Forwarded-Encrypted: i=1; AJvYcCUkFvNCcNzObkcGX24KMWD20MhAmlwteOtdqrOktvw7QaLUjvEUU8OIzwrhK0I5YHYko+1F13PPMUY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYELcvTGwaJm3JzFxdqHWCIGg8lozILiC0KrBd21koUGJj+req
	oBP46KXXVONX7BWGRzXeMEDHwXdLs3Emv0PElPEziKQcrqFJvJ1A8p51omx7w1fLQ/8=
X-Gm-Gg: ASbGncsEcW5CXZ5mSoZPKOoJlfFchqhhkYKepEwu3RCrx9b9aid6ZHNSxn0CpKywL4s
	Nq6cqxDbKVgLDcCX7/pZM3BIGBsMJ6HJ2Vf+03dsBAedeXzhn1wRM+kLaepNf8xki/PDRHRyJVW
	O9L9erTFto12MRoPqChuUhqmt31nsM2QWvS9ocdMFWQOfeTpnrV3yxSR2JwYyWE/g7v2rDK4dx/
	CSs352c8Ib79QlpznJMKtG5nfAayiKf9PyDy9pIA4OUL5pNV752fWuTckdkcHZgZY7uwNRgJ88y
	N/LEI74MNMZMuj37RG0lVlliShLxltSQZXpBimemAjuTfgZeJpj1gvIVf0AVwRCOWMIpP0ToGyV
	FbDjcswUAoYkCqhEMFlk=
X-Google-Smtp-Source: AGHT+IEib5eiaxVwRs6/V1E29IVcZo3CV59wUTIddsg/LgmBOBUV6aR7agFxmqPxj4KqH6y5QX+9Fg==
X-Received: by 2002:a17:907:7b97:b0:ae9:876a:4f14 with SMTP id a640c23a62f3a-af8fda95ecfmr1117987866b.59.1754026282746;
        Thu, 31 Jul 2025 22:31:22 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a1e82a5sm232281666b.82.2025.07.31.22.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 22:31:21 -0700 (PDT)
Date: Fri, 1 Aug 2025 08:31:20 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: kernel@oss.qualcomm.com, Pankaj Patil <quic_pankpati@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/7] clk: qcom: Add TCSR clock driver for Glymur
Message-ID: <aIxRKHKdBHDefDs2@linaro.org>
References: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
 <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-3-227cfe5c8ef4@oss.qualcomm.com>
 <aIoBFeo00PPZncCs@linaro.org>
 <784545d0-2173-4a8b-9d5d-bee11226351e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <784545d0-2173-4a8b-9d5d-bee11226351e@oss.qualcomm.com>

On 25-08-01 10:02:15, Taniya Das wrote:
> 
> 
> On 7/30/2025 4:55 PM, Abel Vesa wrote:
> > On 25-07-29 11:12:37, Taniya Das wrote:
> >> Add a clock driver for the TCSR clock controller found on Glymur, which
> >> provides refclks for PCIE, USB, and UFS.
> >>
> >> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >> ---
> >>  drivers/clk/qcom/Kconfig         |   8 ++
> >>  drivers/clk/qcom/Makefile        |   1 +
> >>  drivers/clk/qcom/tcsrcc-glymur.c | 257 +++++++++++++++++++++++++++++++++++++++
> >>  3 files changed, 266 insertions(+)
> >>
> > 
> > [...]
> > 
> >> +
> >> +static struct clk_branch tcsr_edp_clkref_en = {
> >> +	.halt_reg = 0x1c,
> >> +	.halt_check = BRANCH_HALT_DELAY,
> >> +	.clkr = {
> >> +		.enable_reg = 0x1c,
> >> +		.enable_mask = BIT(0),
> >> +		.hw.init = &(const struct clk_init_data) {
> >> +			.name = "tcsr_edp_clkref_en",
> >> +			.ops = &clk_branch2_ops,
> > 
> > As discussed off-list, these clocks need to have the bi_tcxo as parent.
> > 
> > Otherwise, as far as the CCF is concerned these clocks will have rate 0,
> > which is obviously not the case.
> > 
> > Bringing this here since there is a disconnect between X Elite and
> > Glymur w.r.t this now.
> 
> 
> The ref clocks are not required to be have a parent of bi_tcxo as these
> ideally can be left enabled(as a subsystem requirement) even if HLOS
> (APSS) goes to suspend. With the bi_tcxo parent the ARC vote from
> HLOS/APSS will not allow APSS to collapse.

Is there a scenario where the APSS is collapsed and still the ref clock
needs to stay enabled ? Sorry, this doesn't make sense to me.

> 
> If any consumers needs the clock rate, the driver should take the
> BI_TCXO handle.

This kind of breaks the CCF design. If the ref clock is a gate of the
bi_tcxo HW-wise, then not marking it so in CCF is wrong. Passing the 
bi_tcxo to the PHYs separately because of this, makes the assumption that
the PHY drivers should know not to disable the bi_tcxo themselves
either.

> 
> 
> -- 
> Thanks,
> Taniya Das
> 
