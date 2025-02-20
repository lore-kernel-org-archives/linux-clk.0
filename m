Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6594E1DF97A
	for <linux-clk@vger.kernel.org>; Thu, 20 Feb 2025 04:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740026076; cv=none; b=AKmtnQTUH6k1i+uNM8cW1TjAMUEPuN08P6OPEqqeJFGhbw1MOJb7EYMvo9YPSNWhaXA5sj/4U3qdobL3AQQSrw6CoN3/VT8UOE+Wre7yBHtYq7yzA2uBaPJSWltEMHtjC2tk5LJqb0mf1hxGBchTsnkaVzS2XLdE+pQjiTpal2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740026076; c=relaxed/simple;
	bh=jgwDoqy69Zoi+YVPD9FqEbg4CovWykgUn6vteBc7gB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RRr7UL2yZK8U6JGkPdS97Y0LIc1O4HAIqR85hQf2nWOsSUKeItriwfcdsdqSFZlZcEfRXuDlIHaA4zc4WMq+n64tD9jUXLeD8uHBi6UwVRYi+1qzHIDUcMebud13M87qPsIXrh8tTC4vT7wfFTgqPLWb8Vpy3hBt88LsmWLRHZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iOYThNhB; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iOYThNhB"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30930b0b420so3967061fa.2
        for <linux-clk@vger.kernel.org>; Wed, 19 Feb 2025 20:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740026071; x=1740630871; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zIgZ1R2fo/uZR08EAHjfTKiWP5NrtPRgl9O0Ta2Iyuo=;
        b=iOYThNhBlRaeNob5B4Vf2Ah8E4Uqn3Iu64625cWrT8f1B4OGSvucl4/kACnwVnZHAJ
         mff7LD6OwgqA8r7zKmTXUNOEwq5lwfUhtwD4a9UefC76FIVNc75ozwoV2pwicWccuupY
         LRd2aaAudci0NJN1CtuTqvjGEYCX+bx4lmMH4pWqZHR1THgYK6JmU3FpADNm/7YpJXmn
         OVFHrL+rXlGpkUX07dFzOoZG0F4z9a1piiJWrjCXHAPjfoM+SM3rj66FFVquzCOG8E8e
         +lQ9dsV21U0vz+7NctUXlD93RQxdiegWlfdLCunMuRecVkhYuGSoKO/S/WJloafVEPpe
         5NWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740026071; x=1740630871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zIgZ1R2fo/uZR08EAHjfTKiWP5NrtPRgl9O0Ta2Iyuo=;
        b=uR274KZqIsM9oY2EcciBcF9iJRXtcI38klWhe5+pyfFWt0yF8+ge7Eo9TZ0qomGPPE
         PLZ8UCtoStyty/LzP2S91GcUCJDkATGei9OhIAgOFt/fb0ol4obaT+Ea/cqKCEB+cDJf
         eWmZHxX0/xxclyEPrMZznZ5LKqKJVN7LtmyNp55H7emdEjat2ccd0Z/rJEOPOtntxcSH
         R1JYZRioqJENhSgwC95NmI1rYEl6xOge0XwEV9JFB6nqijaKKAI631Q3YL8t1B4UmQnz
         vJdrTWweIJ0PFjllBqL3/A6ZSBZxxXEH22ditmr7CQstzp7aK20q+tYminpWFyqjPw9p
         m7TQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoVpQy6BnXz4LE7pOFohsyiSBsKVaLvLbblgukMp7fLZ0gAbpNsxMg5utcQSUI87zvjmfNXlSyWUs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYsk4P43XvWJ0CskfDZXOuVgUa7YAx17Mk1V9wqQ0ePIbUHXLh
	p072HNx3FLXjd3G1FPXVcfYkpJkoQaQXFREGm2rgo4dEBY6JTw4DKAttOCcIZIQ=
X-Gm-Gg: ASbGncuZEWJ1C6h0vyH2CgbYxZ5k/ASJMMW0b6a5X7bppJf8pLYqdCFwVxJNUjzJf3R
	C0c6NA4clMlFwsJ7IDUrm5l8Dd0NL9qoUi7+ycFTyVVxTMJWxKB/jwNYs/++EaNeMv1zza1w9vs
	w5FvmOdzK3jvTZB9kmfjfRL1soGFyyxDCXerjQl4XZNtBHbcC6+mzz3+mLNKstgbr768X5oZXyz
	D5KvJA+NNBvswRNZuvMwizQwR0e48Ja0yocZAeQ1s0wKgSNxKU6oC9KxrD6r/KJ1iDrlBn5uxji
	thvY+oRXL97c0leVYXZ9+zcEcSMGl3kwmLpRucgN3Tp8ep6HeC2vZcrsid/XHoOl24qrmvE=
X-Google-Smtp-Source: AGHT+IE/wbNVeqMIzJ0mRBTmf4NCpaNwWVzHs+1/sXMuy2O8j/XZA2bHjBHzaK7WJJplOVmy6+jcMg==
X-Received: by 2002:a05:651c:20e:b0:306:124c:69d5 with SMTP id 38308e7fff4ca-30a450620b4mr22664261fa.34.1740026071154;
        Wed, 19 Feb 2025 20:34:31 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a2699d0f5sm15178761fa.78.2025.02.19.20.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 20:34:29 -0800 (PST)
Date: Thu, 20 Feb 2025 06:34:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] clk: qcom: lpassaudiocc-sc7280: Add support for
 LPASS resets for QCM6490
Message-ID: <mtfck3p6touzlsogv7xu2sqstfi4tapee7dqdhx76ktpgqhw5e@g45ralchrf5l>
References: <20250220-lpass_qcm6490_resets-v4-0-68dbed85c485@quicinc.com>
 <20250220-lpass_qcm6490_resets-v4-2-68dbed85c485@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220-lpass_qcm6490_resets-v4-2-68dbed85c485@quicinc.com>

On Thu, Feb 20, 2025 at 09:52:51AM +0530, Taniya Das wrote:
> On the QCM6490 boards, the LPASS firmware controls the complete clock
> controller functionalities and associated power domains. However, only
> the LPASS resets required to be controlled by the high level OS. Thus,
> add support for the resets in the clock driver to enable the Audio SW
> driver to assert/deassert the audio resets as needed.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/lpassaudiocc-sc7280.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
