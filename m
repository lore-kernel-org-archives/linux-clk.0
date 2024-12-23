Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08B1192B9A
	for <linux-clk@vger.kernel.org>; Mon, 23 Dec 2024 11:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734954596; cv=none; b=CLfPRhOqrT3Oi+k0zPnBfcdKU8BSkLCBwatPH805FwOpqBbLXEnmsOwM/yZV58w/i6BtNi9zAe67NOVUI5+GTtnga5zvgwgepjlwGNmzGe+KNde2va7D6Gt+Dp2nrMsciMiiH4mRkq/Po0Xm1GRYfu1Ke0fdXw8rhoXDn3UqxFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734954596; c=relaxed/simple;
	bh=6Yr21vDWuIkvsuZ47/NFrT8j3E23Ga5mNcpV2WGUrQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bT9STp0DD/ZL+/1ARs1eqMHM4VQVBoUoT5yKniBazpcT63yIfXU9xd6Y4PNubJM4w9t1j7FbLHjeqhUdYxq5xu2LdBGX7Z8GDdPl22mKtRvpQxBQVIqkg+nTQ66AG1FFHVYS28VJEDu7XdoG6Pau3f1Ik31rSE5+gQm6j3zfJQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LZbRvQnk; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LZbRvQnk"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30033e07ef3so47824761fa.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Dec 2024 03:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734954592; x=1735559392; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=81jl/t+cSQKe+ACOcy5lOOjJcqHObJWTUdY8j6yLjT4=;
        b=LZbRvQnkBcIvLFWESdukXqB5GwfJMAXe7IxQN4kSr+tgZvgsn1QABAjIp5urX8koa+
         TyFrV6MUmY3vIZtWyiNjdmsuHsmXvVTw2fqAxtGE2KyJG/ZEuP26dv7NXNPAQYnxe1EC
         mKzqnnXDv5Yo77wOwKCK+2YPKpp6vf5wS0k1+dLPvOr3eOwntkPYMZRpziz2FYq8lCiz
         f1K2nKNT5iMjyrXh8yye7SHJlhNP+zOO0YG6MUOeN1Evc4GRSKtDe+7nx/RqI2iU1IMC
         62NqQWgIr7JuVV6YShK+ODvMy6K3j3ujJNr8gKW7CdeYBXb2I5ZxhjAHraWJCbk88rWw
         2yWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734954592; x=1735559392;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81jl/t+cSQKe+ACOcy5lOOjJcqHObJWTUdY8j6yLjT4=;
        b=uUEG7ZqJGsqvI3SN5nI/3cLFNQym8tHTkCCP0BSiI0fTflKQ67IQDLfch8IYY8jmRZ
         FQrbAxNAgdIfdMjHwL1RebdBkd7KTtfh/kpmRVn8Djpd1OJvQSGC/8RhlW0am4coUmj/
         FVbwQOHU4Nj2QzFJL1ih7jD4rjAIJIGeMizi4gCUjfJtyewAf8NqqdouYMbMNOwdkjgA
         XcmGYJo5qzJ/6cEILrfj5Z4a2cl4Lye9GInj1B/arU9x97UXfHBWKnIp2NOvPzhtm3TY
         h3eagyTtJO/z1HSJs9loFdjOu7ATjLWlnSNlP/uP3Q56v6AUD0MGBzEvuK5KM+3ssYTk
         2glA==
X-Forwarded-Encrypted: i=1; AJvYcCUfKwzYGvJSI6h+/dIGHaD/5qWcLzySx08nFGxzqY9258p6iHajFekdF71iUftctgUq/KS4zy6RPMw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTafbo+1OZGJndPKszJcQiUFFMzUWMXuSamV/wvgDo99RVsYc+
	ekGvuyrn/bhwzxkSXdWNErCaBvaME664hXo1K2uTl1BagJoLRSwJcyLPhl8gINA=
X-Gm-Gg: ASbGncu/b6HtdEcGeNdOAw7CCfjbE83xQ2LDAGRtnxPddhimSMBIoSx40RLetv/b9i0
	zMrtGgKv6ESjOhfF0UA7ml8/pf29cc+zg5m6mwg6PF8IbhOxa+ICdT9CiQqnRhPENERRGGM7fLg
	ExyveQS3/3OeD09yIM+svphhgFGXTLF8f6tss4oPWhozEBM6muUYdSmjtKuMlSjUYNX1TOBly+4
	+Is06o7+/wUjDOP6nwsFgKrp63CXTw+0eMonqOOr3DguZwiW0UpDiDzjm5bZJH+mP99EHwGY8pm
	1VJD+cvZCpMG42+7RlADuBMgf7bmQOEhuumc
X-Google-Smtp-Source: AGHT+IHOzyQch22bff+q236NuBgW9EAlxYdWMJ7aLs2GLbKmy59AOI0ocsSlLrhAGSQfDmhwjLXuYA==
X-Received: by 2002:a05:651c:4ca:b0:302:1c96:858f with SMTP id 38308e7fff4ca-304583710a9mr38211651fa.12.1734954591742;
        Mon, 23 Dec 2024 03:49:51 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6c5a0sm13023751fa.22.2024.12.23.03.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 03:49:50 -0800 (PST)
Date: Mon, 23 Dec 2024 13:49:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>
Subject: Re: [PATCH v2 1/2] clk: qcom: videocc: Use HW_CTRL_TRIGGER flag for
 video GDSC's
Message-ID: <tvfe4inkpz3zg7k3eo2nqhcujy5weozfroyf4cgftsyrgbutkm@olh7t3qsn4dd>
References: <20241223-switch_gdsc_mode-v2-0-eb5c96aee662@quicinc.com>
 <20241223-switch_gdsc_mode-v2-1-eb5c96aee662@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223-switch_gdsc_mode-v2-1-eb5c96aee662@quicinc.com>

On Mon, Dec 23, 2024 at 02:32:41PM +0530, Renjiang Han wrote:
> From: Taniya Das <quic_tdas@quicinc.com>
> 
> The video driver will be using the newly introduced
> dev_pm_genpd_set_hwmode() API to switch the video GDSC to HW and SW
> control modes at runtime.
> Hence use HW_CTRL_TRIGGER flag instead of HW_CTRL for video GDSC's for
> Qualcomm SoC SC7180, SDM845, SM7150, SM8150 and SM8450.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
>  drivers/clk/qcom/videocc-sc7180.c | 2 +-
>  drivers/clk/qcom/videocc-sdm845.c | 4 ++--
>  drivers/clk/qcom/videocc-sm7150.c | 4 ++--
>  drivers/clk/qcom/videocc-sm8150.c | 4 ++--
>  drivers/clk/qcom/videocc-sm8450.c | 4 ++--
>  5 files changed, 9 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
