Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405DD13D53A
	for <linux-clk@vger.kernel.org>; Mon, 16 Sep 2024 08:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726476924; cv=none; b=IxvhoAPE4ydE5ENzTQTWCHT1QYiEsvCBu0zVyGxSSXWAIQWcCGRjjeRw+/GiVFPrsyhPVRnDQx7TIcwvaDuOohtwStm40hTfrGl2SRmdEh2P/MCrmWmcdf8Gnzq0d8562GG8QfAmT+JJoHvFdG0vCsVknX96ZIVylAKVQeve6w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726476924; c=relaxed/simple;
	bh=E1VyYQAQurwU8p+dmCtqZx+FfsqwR9JKSuHmyzm/i8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nLNWGuvk4FP7tg75yx1PYevgmNALOzeROLYxA68rAMGaO7WUsmwE7tAh5esYE71mdVl6VCP2SAQwxmRSUw8yLhXeCOnuz+m13WIn/lW4rV1xkW0bCgRLH70H6JaPsHWafKA8QvLZ+L9gIcH+MQJp/ba/47MFPa3JCVpWcbRKKyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lW82FDGa; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lW82FDGa"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5366fd6fdf1so5215477e87.0
        for <linux-clk@vger.kernel.org>; Mon, 16 Sep 2024 01:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726476920; x=1727081720; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xR2jDKAsU3oH2uxMnF0+jo329Pwfq7dBz/E22uv0AZQ=;
        b=lW82FDGa3Xyz94la5QhkwSNbbQJupNC4HqxsS5tVX7d6oc6O8DnrARB/hcUppr4y+t
         qYrWQb+MkP8uliAyDBV1S45P89S8FS/G0MQljSb2zDbGIqOlnqfTiIEAE2H43njv9PzQ
         /qadxxUe3gdL+pHKBcl1Okv/tUwU00h4eVIoDWInC4/JgM8hiPzdqDfNQksyrsdRF/8M
         EDJCgUciXVmB1hydOlrmmhXo6krhWYN5QPcS230BHYdO1spSxGGelHg6zFegntk5bmsh
         AUIDEfZ3b4gf8VRJ5+gmR4LwCAd7iw+sKdBcSdBDSO7ymwYuF4l4W4OYlL8ueUdY9h8r
         E/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726476920; x=1727081720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xR2jDKAsU3oH2uxMnF0+jo329Pwfq7dBz/E22uv0AZQ=;
        b=U8OkN7crcDqKW69SPFIJzbUkmX7OaO+Hq9imHMTJdSR/JtcY5eEVrMYnOCH8THLY3U
         DCY4SF1D3htskcp/V9gFwHLLCeapg4j1r7wYlUK/A5vrpz8+3NTkVgcBMukCkh2ji29R
         ms17v0rGmJYbUgJk0Q/fRJGO2t8hBtt4RB0tzUDiXfBP/Yi3vtj53mdrSTKVmuiGLFQ9
         Sf89qkWtfGfd3f3HuGHZCV86EzZiC6kVtt9ZlqOS5IWPUt0I4joom7wyYLuhVjatjS+C
         Ftce5m9l1gOfYk2yFR+uzYuh+nOn7KsN/fIZYA/bOIDVXWLpRSj7l2TyL++Nz+u8A/LI
         ywgA==
X-Forwarded-Encrypted: i=1; AJvYcCVJDQfs6uQwyUJZ2/Quv6BvSJgxbgayWtgjiwNLtWJT/F6oaYvlKK4xgPbJTAMPiyTAl+es1nNKmiw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAq4+iK42bDXTv4LlAqbfJtdqKrfttNkfItR/EEeWCJ7NeyNVb
	1Fnrxt8K75jBD9Y9ENx74KtmynAninY56AyzMo1xa3CXHbxJwPDtTOBKBZ0a/SM=
X-Google-Smtp-Source: AGHT+IHDgMPI5T0jfG61Jbaz3vU73dD+DIaHA1ZXDycd61JvCkYD4pYWwuEBP/jGdSBOxVH4v/LUsQ==
X-Received: by 2002:a05:6512:2352:b0:535:3ce5:6173 with SMTP id 2adb3069b0e04-53678feb5e9mr8380576e87.37.1726476919287;
        Mon, 16 Sep 2024 01:55:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870466ddsm809521e87.25.2024.09.16.01.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 01:55:18 -0700 (PDT)
Date: Mon, 16 Sep 2024 11:55:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, quic_imrashai@quicinc.com, quic_jkona@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] clk: qcom: lpassaudiocc-sc7280: Add support for
 LPASS resets for QCM6490
Message-ID: <ya6aqhq27mizdozfhaa6evwt6kqjdryafozdxvwdm3l75cfd24@wloodcwrgkyu>
References: <20240816-qcm6490-lpass-reset-v1-0-a11f33cad3c5@quicinc.com>
 <20240816-qcm6490-lpass-reset-v1-2-a11f33cad3c5@quicinc.com>
 <67819a53-8e99-469b-a458-8c00034fec4a@kernel.org>
 <936f151e-6951-4dea-95ed-35374ab249cf@quicinc.com>
 <9b3350ba-eafe-4bb0-a6cc-f1b0a06d623e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b3350ba-eafe-4bb0-a6cc-f1b0a06d623e@kernel.org>

On Mon, Sep 16, 2024 at 10:33:21AM GMT, Krzysztof Kozlowski wrote:
> On 13/09/2024 07:31, Taniya Das wrote:
> > 
> > 
> > On 8/17/2024 2:55 PM, Krzysztof Kozlowski wrote:
> >> On 16/08/2024 10:32, Taniya Das wrote:
> >>> On the QCM6490 boards the LPASS firmware controls the complete clock
> >>> controller functionalities. But the LPASS resets are required to be
> >>> controlled from the high level OS. The Audio SW driver should be able to
> >>> assert/deassert the audio resets as required. Thus in clock driver add
> >>> support for the resets.
> >>>
> >>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> >>> ---
> >>>   drivers/clk/qcom/lpassaudiocc-sc7280.c | 23 +++++++++++++++++++----
> >>>   1 file changed, 19 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/drivers/clk/qcom/lpassaudiocc-sc7280.c b/drivers/clk/qcom/lpassaudiocc-sc7280.c
> >>> index 45e726477086..b64393089263 100644
> >>> --- a/drivers/clk/qcom/lpassaudiocc-sc7280.c
> >>> +++ b/drivers/clk/qcom/lpassaudiocc-sc7280.c
> >>> @@ -1,6 +1,7 @@
> >>>   // SPDX-License-Identifier: GPL-2.0-only
> >>>   /*
> >>>    * Copyright (c) 2021, The Linux Foundation. All rights reserved.
> >>> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> >>>    */
> >>>   
> >>>   #include <linux/clk-provider.h>
> >>> @@ -713,14 +714,24 @@ static const struct qcom_reset_map lpass_audio_cc_sc7280_resets[] = {
> >>>   	[LPASS_AUDIO_SWR_WSA_CGCR] = { 0xb0, 1 },
> >>>   };
> >>>   
> >>> +static const struct regmap_config lpass_audio_cc_sc7280_reset_regmap_config = {
> >>> +	.name = "lpassaudio_cc_reset",
> >>> +	.reg_bits = 32,
> >>> +	.reg_stride = 4,
> >>> +	.val_bits = 32,
> >>> +	.fast_io = true,
> >>> +	.max_register = 0xc8,
> >>> +};
> >>> +
> >>>   static const struct qcom_cc_desc lpass_audio_cc_reset_sc7280_desc = {
> >>> -	.config = &lpass_audio_cc_sc7280_regmap_config,
> >>> +	.config = &lpass_audio_cc_sc7280_reset_regmap_config,
> >>>   	.resets = lpass_audio_cc_sc7280_resets,
> >>>   	.num_resets = ARRAY_SIZE(lpass_audio_cc_sc7280_resets),
> >>>   };
> >>>   
> >>>   static const struct of_device_id lpass_audio_cc_sc7280_match_table[] = {
> >>> -	{ .compatible = "qcom,sc7280-lpassaudiocc" },
> >>> +	{ .compatible = "qcom,qcm6490-lpassaudiocc", .data = &lpass_audio_cc_reset_sc7280_desc },
> >>
> >> That's odd to see sc7280 reset added for qcm6490, but not used fot
> >> sc7280 at all. Didn't you mean here lpass_audio_cc_qcm6409_desc?
> >>
> >>
> > The resets descriptor(lpass_audio_cc_reset_sc7280_desc) is not part of 
> > the global clock descriptor(lpass_cc_sc7280_desc) as these are part of 
> > different regmaps.
> > 
> > On a non-QCM6490(SC7280) boards the resets are registered after the 
> > global descriptor is registered.
> > 
> > But on QCM6490 board we need to register only the reset descriptor and 
> > no clocks are to be handled/registered and thus passed the match data 
> > for QCM6490 boards only.
> 
> Yeah, but why this is sc7280?

Because it's more or less the same HW, different TZ and hyp firmware?

-- 
With best wishes
Dmitry
