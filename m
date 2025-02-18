Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3518426F44F
	for <linux-clk@vger.kernel.org>; Tue, 18 Feb 2025 17:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739899086; cv=none; b=kY5Ok2dqnpznuuJ9msteCq+tXUcwSWD0QRcfaSF7Bq1eSwTK3jwE3HoLsf8UxGKlI9pwVxZhaR+yKYCNVX23XJttLadRZmG3EJMOho6xNb+IrpkJS9ntRhkhtciT9VMTCwOTI5rWkWxLWANc6OCxTVlxr6iNhR10q11U1ns8GGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739899086; c=relaxed/simple;
	bh=+HqbUx3NMhsdQmv5gJG5aY4LXcTPtScM4DxHwm+OZQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AYoTA9wI2ta9oBqhhVKfmyF0m0yhqg5h4H95YquWadQDnnBGFMPL+LW++F4JPuRhme7lDZufU3XNJbeLzHOnzndEDQ7IjgMhbXOzJU3TfUX79pMRgCm8VekpYYFIOhMgJuTkNdWB+srBI3wJis4XxkKGbTFEvgMlJHxw6oWMTuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EVNvjlRT; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EVNvjlRT"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30737db1aa9so54484511fa.1
        for <linux-clk@vger.kernel.org>; Tue, 18 Feb 2025 09:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739899083; x=1740503883; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vFCpXaDjW046OAnqXzChWWxg9c6BmmKNGNdZCuQPouY=;
        b=EVNvjlRTUjkWqiPgbRWJw+S1FY9HkvT9IlDK2h1m0AJwDk16lysLtGRpnmF6DDGZ/u
         wA1eVgnaopeOtemJJSeb+neL4Xf+y63zfagZhIEiSEzYDwlXQiabOLHkJ5DQdR+vkglT
         RATECJW+hfCEci9yB+imfuLfJen7QC6TP2si8Vc86GA0FauTPr6rzMWaTw+hKJFkV+DA
         8x3PvFxtfec23ZKgOPtaRvQzj7gUXJgaXuFDdecqiowCO4AmkaUjfXPtYb8g+MCCbL4+
         LEtn6VylQrUhQc8Dg+BwO12JvMA/IiByyvbaNotBh+gTHGqHzgULgOqpRDYfaCqzfbsC
         YDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739899083; x=1740503883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFCpXaDjW046OAnqXzChWWxg9c6BmmKNGNdZCuQPouY=;
        b=pQn8CKg50/PjWs6PGPzJ29EQgDVkfAmGQw9N6vnX/G3Akype7nasIt57Wc1CrSBmGz
         Q3cHGoioRVMGa4rguF2Qj+5AXHYJxqMhQ0GPBeunWhLJW9Ldb9nZVXBr8Pby+QZkzimf
         SeJByVKFAs+GCsb+2qmKHjxphf80YU0OASIKV9CzzpdYLnbdvV7tPYL+Fag4OMi4P+Fy
         iwQWp66vspRV2jhZ55ETDs1lOirFiBbCRjMnbyDLxndoqhRLB6v6QYkGTzRvpj2Xg3/r
         I6afwPP3BwSA4aJKgHIJALVIq5uVw1MS9Dz43TYgyof8IdtzPSZ5Xrh28d++LCRM4w8p
         8PDg==
X-Forwarded-Encrypted: i=1; AJvYcCWt4c8+5tYM5Bygjoa73kGuOw7o/Jiyj1v1FAbb9+fm+1uB/1JTK6T27TPb/bT7U+ujxc08uSMgyDY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPu7kr0deQvBfK57elSypQGZUDFuX0YCFH+Y2wTGFphoMB1T9W
	c1EqZPbXK4/6kpPv+qUGHITwJCHxLyEWw7MBwjxNh5Wbx/bGRvu4ubN0cAAy3nA=
X-Gm-Gg: ASbGnct+RJTDnifCn80f0YjlqMnb8/QtVyVUQU829wPvOMTd/FNmy0r25xeVAnltGkW
	Wc4qtof5QYVla9dmsfRyXXM6WHWDCGrzHaZUgrdpsW5thwk4NqZmgFn8e2XkU1NS2lQZDH1EUTp
	HL+IA5JlPkPuW3Pf7eEQOgRyEeMmYBUeST/Pd5CV7m1pXLQ2wgFMHU0g9bqg2XhTQXw3bWGYP3R
	2mCbAbabmP3LZxcoyjxevcUSzylVJgsGpOxz+G3S9D0ErUssk3da2ATpcac4s/pElvqKb+qIJZc
	h9GThXnqD1sUL0wkkTrd0ve8XwGg2x8Tvdd+ZN4tZP/wx+vd3DCAFm4q15XfnLdsytmxCDw=
X-Google-Smtp-Source: AGHT+IE6rXImPRtO7WIVZArsGTCop6s7h35hJORLydABfahalgPYT5N99LSGxqzFHXrjk0jBaudiMg==
X-Received: by 2002:a05:651c:94:b0:309:1c03:d2d3 with SMTP id 38308e7fff4ca-30a45035a02mr559491fa.25.1739899083255;
        Tue, 18 Feb 2025 09:18:03 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-309311777a8sm12756301fa.25.2025.02.18.09.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 09:18:02 -0800 (PST)
Date: Tue, 18 Feb 2025 19:18:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] clk: qcom: common: Attach clock power domains
 conditionally
Message-ID: <2c5rbbpe5muw53oemyq6vhsmhzpzcpn7on4ujl5v7i7s3fdlob@eh37gy5dpfnp>
References: <20250218-videocc-pll-multi-pd-voting-v1-0-cfe6289ea29b@quicinc.com>
 <20250218-videocc-pll-multi-pd-voting-v1-3-cfe6289ea29b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218-videocc-pll-multi-pd-voting-v1-3-cfe6289ea29b@quicinc.com>

On Tue, Feb 18, 2025 at 07:56:48PM +0530, Jagadeesh Kona wrote:
> Attach clock power domains in qcom_cc_really_probe() only
> if the clock controller has not already attached to them.

Squash this to the previous patch and call the new function. No need to
duplicate the code.

> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  drivers/clk/qcom/common.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index ec27f70b24bdec24edd2f6b3df0d766fc1cdcbf0..eb7e2a56d1d135f839fd9bd470ba6231ce775a8c 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -300,9 +300,12 @@ int qcom_cc_really_probe(struct device *dev,
>  	if (!cc)
>  		return -ENOMEM;
>  
> -	ret = devm_pm_domain_attach_list(dev, NULL, &cc->pd_list);
> -	if (ret < 0 && ret != -EEXIST)
> -		return ret;
> +	cc->pd_list = desc->pd_list;
> +	if (!cc->pd_list) {
> +		ret = devm_pm_domain_attach_list(dev, NULL, &cc->pd_list);
> +		if (ret < 0 && ret != -EEXIST)
> +			return ret;
> +	}
>  
>  	reset = &cc->reset;
>  	reset->rcdev.of_node = dev->of_node;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
