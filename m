Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8765A18784A
	for <linux-clk@vger.kernel.org>; Fri, 27 Sep 2024 09:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727427732; cv=none; b=WppSpLJOjsLDkM+9jSjhE6P1AikmhSA1jJqvwRv9jK0ZJWkTlf7ooACfDZIhJ8M+CxEta2MGM4XQD1ZOm8obrhS/xQfQHbW6v5lkbBmrjhC3S8iy2ft2EzxFK+t7I2VjDrq7CkyywC5stvr8+rkMSFSS/D7tTGOux2L30EEVcog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727427732; c=relaxed/simple;
	bh=OzTlkDrZ5UNBFj2egyQHy9ztwtmLwwcWSRs7QSGkC50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=suNqBVOmmbXsN7i3/8R0p4+gDcdrDSMoYbZn4Rhf1NmD5PWU3WRmK5bY6kyTyBOSsAqQOj34z/fUfZCXABaRxoFeyIx6pMGNDo8iPk3GKLoULtPrQ0Fn15A4fLw+VNeWZuv0xQaYMkYLQse+WfNusTkDg7R47XSuTLZ6UAzTZek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hg+L5Rs1; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hg+L5Rs1"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5365a9574b6so3029039e87.1
        for <linux-clk@vger.kernel.org>; Fri, 27 Sep 2024 02:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727427729; x=1728032529; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JWb73ryEVZ2J3BVL15FqHfUHxoOk+Qe9ibuCLa7loPI=;
        b=hg+L5Rs1pReWVvspjzeOE+foIQAtENSDFZU/5kgir7LJKflnOTlFKzbJoOnFgvNCbD
         cSamnnba7WGZfdYRguBTPftPWvnqP7Q7CXt1MnTW/LOxYDCTtAeUEa+IDDzyt9+BxCwE
         z2MVIuvjSmpSoMqWIM4YJXZf2qUX3hD9SxBtoXQvOYQP3qDoUT5OCYt3wXlga0oK2Nld
         c7GtRxXDydCFSR0alay70Co9JJYNOKTy1/smdh1fsyiX5z12QHcl/Yp3jXnbmOBfB8o4
         1sfITV7OT4KJmLq9yaahgi+RQaZRrCVbhtuAo4ne79kQQsrNxQ6NtlZcAjb/wrdzYpqw
         Kndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727427729; x=1728032529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWb73ryEVZ2J3BVL15FqHfUHxoOk+Qe9ibuCLa7loPI=;
        b=Edr4EzEXeHszDlAsEIYnFs6n/IlNu3619or9+6Zlf754A5CA4uw6HP3iAUqxbMMzHq
         /mw9upTbAGyBrujr2MBx1pxID3ZPuoBGvQEVu2T9qr2dMv7wBsLGt7SRfzs3VVr1HBI/
         Toxlhyc3zEcDy84RpQ00NfXEWnpSWPbcQ+NYQBmGY5NxWrKgsfzdgAr4yX2UYDJXQjKM
         y8X10NysLXnmjauz3iHJ7dLp6bJTo2ACofzXX8VOgqFTME9Y8LpmsRRuioPH3WqsDW0u
         YuZJChUOTszsk3nNoRVobKgfFI57Y5gy66e9BeZpG/eXQPzZdq7leS4vA9Ni7xioRRcE
         pp9w==
X-Forwarded-Encrypted: i=1; AJvYcCWgV4kqBEpyzdBZaQO8w6kKbGL5UWedMdrYRwvGZNxd1/SdwBxFG4cNpD+y0wT/41C5d0cDZQ88ESk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/azwHSwCsA1NVOhucmyZC72Cp+pqfLdNWRJoBJFpbLOp4wG5Q
	YT/R6Wfrx/MC7ywGEeE5nJJNtND9Pe7M9X0P4pnaRtC7d/8Z7TOHzy4rL2Ew6Jw=
X-Google-Smtp-Source: AGHT+IFdzeCd6YYS6wM/QqC+S3hSNA2f3XY8BHe1b5ScvCd2SfMlzBQM0TBaxSb+NfI+Cw6mQEmOgA==
X-Received: by 2002:a05:6512:eaa:b0:535:6a34:b8c3 with SMTP id 2adb3069b0e04-5389fc34366mr2411280e87.5.1727427728569;
        Fri, 27 Sep 2024 02:02:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5389fd5e3c5sm233552e87.106.2024.09.27.02.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 02:02:07 -0700 (PDT)
Date: Fri, 27 Sep 2024 12:02:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sricharan R <quic_srichara@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	ulf.hansson@linaro.org, linus.walleij@linaro.org, catalin.marinas@arm.com, 
	p.zabel@pengutronix.de, geert+renesas@glider.be, neil.armstrong@linaro.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, quic_varada@quicinc.com
Subject: Re: [PATCH V2 6/9] clk: qcom: add Global Clock controller (GCC)
 driver for IPQ5424 SoC
Message-ID: <hitzcz3gjp4mywesnoicjnv4sfy4sckgepbl43bjjndp74etpl@adnjplfj3pfg>
References: <20240927065244.3024604-1-quic_srichara@quicinc.com>
 <20240927065244.3024604-7-quic_srichara@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927065244.3024604-7-quic_srichara@quicinc.com>

On Fri, Sep 27, 2024 at 12:22:41PM GMT, Sricharan R wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> Add support for the global clock controller found on IPQ5424 SoC.
> 
> Co-developed-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> ---
>   [v2] Remove CLK_IS_CRITICAL for all clks
>        Added CLK_IGNORE_UNUSED only for gpll0 temporarily till

This should be gpll4, not gpll0 (no need to resend just to fix the
changelog though).

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


>        dependent consumers are enabled
>        Fixed probe to use qcom_cc_probe
> 
>  drivers/clk/qcom/Kconfig       |    8 +
>  drivers/clk/qcom/Makefile      |    1 +
>  drivers/clk/qcom/gcc-ipq5424.c | 3309 ++++++++++++++++++++++++++++++++
>  3 files changed, 3318 insertions(+)
>  create mode 100644 drivers/clk/qcom/gcc-ipq5424.c
> 

-- 
With best wishes
Dmitry
