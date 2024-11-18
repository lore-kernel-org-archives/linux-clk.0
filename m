Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18723192B79
	for <linux-clk@vger.kernel.org>; Mon, 18 Nov 2024 13:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731935766; cv=none; b=Vb29Z/ybAnnK8hxHjyp/6lfw2PWyeF3kSZ3db+LHJ9gxUdI21vD/QqGszP4N3sKG7L9YHC3IMYGU1veV5JNnaLpU1NM7RTPFTVH9YiO3goqgZQKKEPaIFEte5W06df/FOXxScd6LtmNUqFBynH/X9s4qRU5qJ5TDPpt+ymkVyVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731935766; c=relaxed/simple;
	bh=isQfHjNvPZ+RBZD4jB18sz7oOCaJdhHyXcKs6SzwfXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WA41yoXO1EPdWdsKzp+zfN3Z+nECjKE3/19ygJ6jYTpiOzXRyhCS4elvlAHg4LTOBy2/qUm8I/eyQzgpC31a3fzQHNyrNU2QitbYaTjLkjZJqPUGoOrlDkNb7BiTGPYcXirYd//SlnZ+phMZxVwcdUO1I0ksmlco3os9ZsYdDNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CsbhSK0A; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CsbhSK0A"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53d9ff92ee9so4920808e87.1
        for <linux-clk@vger.kernel.org>; Mon, 18 Nov 2024 05:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731935761; x=1732540561; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5kn730F60GJ62g7uE1IWf9DYK/RMYmF9XpOCF21XHVw=;
        b=CsbhSK0A21Tt4hyctOM3kzhCPgq5GYEVI/h/lF0bDAbvTC04Dvy1aJXg5Xp+ktT5Et
         Q9bpS7YRZ/hDruQ8iH9fhm/H9zBonCOJUG7+Dr810s+aXy80pJjMoiOecCwl/j7AiVL8
         vqBQPG3q4lKeiVHJl9+2o2eTG8xdQLUDWLIFE4hI9uMvAa/CMBJ6v5WV0pLrO2+CYFdK
         IgfnBCpYIajOQXhEYiVviXlUXikh7SK2Cao0sMe08hebcZEv/x+sSdvIFDCSyPTw5Maa
         bxLmsZ/V0a9dSH4r3E11ptkcsIJaMP+PFpBGizclXtjCL551ht5Fr3X9ZfefXZQV4Uj9
         pL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731935761; x=1732540561;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kn730F60GJ62g7uE1IWf9DYK/RMYmF9XpOCF21XHVw=;
        b=a1IYUS+jHmWoR8DnZseOvMK3gWagdlMYbqtGXYkmQhztzZ2PLMsYGVmDpAOhi72Uva
         xVJMsARR/AArT5/qz7U6UfwOjcJcoY/8+vtj8q97Xqo7dZ63NnvveSkJTDS+pQGvmC8s
         GG3btLCDsOk9NRydqDy8Gl7xLOa2RsJMbUp6ER9spEruvRTFOQPPnHzyhOOdGIgtwIbT
         p+9vcrFYDXDYuIP+iDWp5MWilVHbgbahUfJzyt8sGG05yl3VlTYDIGtoyR/eiNXX/N1R
         TOa53rwlRRTXJtdlYuBWI+FUyYGaRJYcLj4EFU/P+gwsvJQ4R/y/SThaF2jS8yGHWoqt
         6esg==
X-Forwarded-Encrypted: i=1; AJvYcCUZV33S/RNhxS8XNwwQix7bMr7nxViR3ty5a4QholJoepwAwORwsrhcmTRpxi1JYaif7DobuIMI8gs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeX0YDgIst7JqCDXECIKJcOLnW2GHahMbFZMDoXczpj1p+ew9n
	rMo48cGv+jV348ygMtTlFLN8oRszHb1sVl0IUXgqsIMn4gs6ZTrGwzzMycUOLGA=
X-Google-Smtp-Source: AGHT+IFcO+4bXNWyrTDG1UHUoD/2vsE8HQkLwCjNKCdp11omfGZNuIumNW5L3zMzoTlTQbdUuyGd5g==
X-Received: by 2002:a05:6512:2823:b0:539:fb49:c47a with SMTP id 2adb3069b0e04-53dab290683mr4631909e87.4.1731935761293;
        Mon, 18 Nov 2024 05:16:01 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da6548ba4sm1605270e87.264.2024.11.18.05.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 05:16:00 -0800 (PST)
Date: Mon, 18 Nov 2024 15:15:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: qcom: Add support for multiple power-domains
 for a clock controller.
Message-ID: <cl4u42hzdwaj4dt5bponhnadou3uecaodtr7iopfu4vhmvttif@bxxvmwmzu5u2>
References: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>

On Mon, Nov 18, 2024 at 02:24:31AM +0000, Bryan O'Donoghue wrote:
> On x1e80100 and it's SKUs the Camera Clock Controller - CAMCC has
> multiple power-domains which power it. Usually with a single power-domain
> the core platform code will automatically switch on the singleton
> power-domain for you. If you have multiple power-domains for a device, in
> this case the clock controller, you need to switch those power-domains
> on/off yourself.

I think the series misses the platform-specific part. It is hard to
understand what kind of power relationship do you need to express. Is it
actually the whole CC being powered by several domains? Or are some of
those domains used to power up PLLs? Or as parents to some of GDSCs?

> 
> The clock controllers can also contain Global Distributed
> Switch Controllers - GDSCs which themselves can be referenced from dtsi
> nodes ultimately triggering a gdsc_en() in drivers/clk/qcom/gdsc.c.
> 
> As an example:
> 
> cci0: cci@ac4a000 {
> 	power-domains = <&camcc TITAN_TOP_GDSC>;
> };
> 
> This series adds the support to attach a power-domain list to the
> clock-controllers and the GDSCs those controllers provide so that in the
> case of the above example gdsc_toggle_logic() will trigger the power-domain
> list with pm_runtime_resume_and_get() and pm_runtime_put_sync()
> respectively.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
> Bryan O'Donoghue (2):
>       clk: qcom: common: Add support for power-domain attachment
>       clk: qcom: gdsc: Add pm_runtime hooks
> 
>  drivers/clk/qcom/common.c | 24 ++++++++++++++++++++++++
>  drivers/clk/qcom/gdsc.c   | 26 ++++++++++++++++++--------
>  drivers/clk/qcom/gdsc.h   |  2 ++
>  3 files changed, 44 insertions(+), 8 deletions(-)
> ---
> base-commit: 744cf71b8bdfcdd77aaf58395e068b7457634b2c
> change-id: 20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-a5f994dc452a
> 
> Best regards,
> -- 
> Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 

-- 
With best wishes
Dmitry
