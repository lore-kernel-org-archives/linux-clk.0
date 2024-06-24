Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB8C1BC40
	for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 05:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719207569; cv=none; b=AffbUBrjURFA5/bRse36sTxzLeKCKYgNxEKXKlPv4GWxpeQLCp9zVDlAR4JBdC94Nffx13vesrJI8lbCSHF0Kx4s/Sz8CjPQfvEoCVLmtZxRv7sR83VQwQqn0r0XdxS+U1dI1MhSgkxiWPUfJODTyi9X7sluLg1mi0x+VqVqZjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719207569; c=relaxed/simple;
	bh=68opku4OyG6OmJwgb6WH++M2tbYDZdg7dZF2Gk20wkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bcA0CUY4pMLqCjKIvaHizJJr7obl6zEEJeiFK1ny5lGPj1xiP0/KcHzuYTR8NmLaBmEK9LcPB6l4ratV3eLoTejAACDR1bLq5Fm97azEIv4dmbXPabQitxHWV//2kRk7SvfUMkrBInnStCk1OkAAyH0slNxE9z8stubpfqfgnq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AT3H1Pc+; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AT3H1Pc+"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52cd9f9505cso2731100e87.0
        for <linux-clk@vger.kernel.org>; Sun, 23 Jun 2024 22:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719207565; x=1719812365; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BSa3xTd57H9MrjDOBYM0uRtrP8SSrHpws0N+sRWwWEY=;
        b=AT3H1Pc+pOd4i9M1+SA5LdJQceg9EswoCnCLQVGpFV05+NoUsqefh3t0SWtow211RC
         y16eBRbzIs1hNAyvZPD9NeGFDYeEn6qvD+lhVjuZ5Sk3ulWcr4S/GmhlTTx8xeNcufrm
         HSU5PO/kBCKVb7JfOBp79pVPM8s8r0ACnMAJhQMNTZRC+tZiu/YWFzO2jwjPRupysY1s
         f3xjl3sxzrU1LTXsJUfSss1v9TNaF7woFvpVMmalBgV9evUZb608DUr0on1TZWkMwaD8
         dO+oLYy+zTwAewOgTICGlSQflkyajP0pIb3arMAthP/NbY9I5rr6OLIrHyZUU/c7ZvYq
         Ekog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719207565; x=1719812365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BSa3xTd57H9MrjDOBYM0uRtrP8SSrHpws0N+sRWwWEY=;
        b=A7SEUbb6EXHo8NCvSU4PjKwGn6U37s/bRZqVKOZLHbGIM1MXh74Z/FJN23yg98FxEg
         nlYux3g1NGXwmyYSkJm+UMGl3FRxBSso6o8jnfRSFaP87rVmiRsNcjnJIdlbr7EZoWQV
         itgMuoOa2PWb7TifX+bprKQ7FSxGKRFG/idlVCFq2qaoQTNJSNJIo3lVbvqmfBkfcT7n
         Z9KhWoBNLOjgdfX/6dfZdHRzd+Xny5upSjzNSOlcus+0jJEyok7NjL4wQ7JbLG4ozAe0
         9AwifT2dMuc3Zw9YVKHAg3uh4A+7sXP3Ae7i0hYgc9ucmUKR1eIzTuoe21HkIWu0+ToV
         rW8w==
X-Forwarded-Encrypted: i=1; AJvYcCUU1R+Ikgeg+QGjcZZC4fdFBzAky0IdzoRymPJ+vkZvTFWchZwFD4R7X9mEbgEw8LQheZMDfY6EuC9lbystX5hP9UzvSjnGRXl7
X-Gm-Message-State: AOJu0Yyl41hKvEeU47H7FXKFcYtJYfyOtmtrYTIqzovvoZC6p4MMVmYG
	WZCSqyQm1v3NZyMTNlMn/iamh6IwgdEybkDjai/noYl1gjGiMLTiSRkW3HteUbA=
X-Google-Smtp-Source: AGHT+IFcbWt2iEMxFWb84NrSYaeoaf1H+jGCDGgH4AmthdWc7vARt5ywIshEOxo5cQDQxUNAQoIB5g==
X-Received: by 2002:ac2:5a51:0:b0:52c:df5b:fd9a with SMTP id 2adb3069b0e04-52cdf7f6657mr2579793e87.32.1719207565384;
        Sun, 23 Jun 2024 22:39:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ceb37df50sm26079e87.75.2024.06.23.22.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 22:39:25 -0700 (PDT)
Date: Mon, 24 Jun 2024 08:39:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	angelogioacchino.delregno@collabora.com, andersson@kernel.org, konrad.dybcio@linaro.org, 
	mturquette@baylibre.com, sboyd@kernel.org, ulf.hansson@linaro.org, quic_sibis@quicinc.com, 
	abel.vesa@linaro.org, otto.pflueger@abscue.de, quic_rohiagar@quicinc.com, 
	luca@z3ntu.xyz, quic_ipkumar@quicinc.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 6/7] soc: qcom: cpr3: Add IPQ9574 definitions
Message-ID: <vohhbc7al2wsozjkjzqmejz7jbiokxjbv3vgiysjwaejddvloa@xars5kak3t2m>
References: <20240624050254.2942959-1-quic_varada@quicinc.com>
 <20240624050254.2942959-7-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624050254.2942959-7-quic_varada@quicinc.com>

On Mon, Jun 24, 2024 at 10:32:53AM GMT, Varadarajan Narayanan wrote:
> Add thread, scaling factor, CPR descriptor defines to enable CPR
> on IPQ9574.
> 
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v2: Fix Signed-off-by order
> Depends:
> 	[1] https://lore.kernel.org/lkml/20230217-topic-cpr3h-v14-0-9fd23241493d@linaro.org/T/
> 	[2] https://github.com/quic-varada/cpr/commits/konrad/

This should be a part of the cover letter, not the patch itself. And it
looks like From: is missing here too.

> ---
>  drivers/pmdomain/qcom/cpr3.c | 137 +++++++++++++++++++++++++++++++++++
>  1 file changed, 137 insertions(+)


-- 
With best wishes
Dmitry
