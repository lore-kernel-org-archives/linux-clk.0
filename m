Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42B814532C
	for <linux-clk@vger.kernel.org>; Fri, 31 May 2024 10:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717150648; cv=none; b=bovOQHkj0YoIbdcBisBkORCh8mF+iPi7RVUnhDInKMXAKvTPLNVN4ZY68UiQ7l5l+eqc/NyArpJBCcgdQiHXenTDMa0Jjag/PnGEL6zXXjre6o0PSZPdE7Br8Oumq1iW3qGn+q6Uw5e2Q/OZWtNLUS7S2ff4jH0bem8NAGUO82A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717150648; c=relaxed/simple;
	bh=Xm8eJEiJSbPv5KlOHAw0Bd4Up7PDqUcO0xG85MkhN18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WMDkXfXpCurQho/32o7Q64KwTOsI7R4DRfdUb/z5Ocwqjl6M4LDwanKQriEHRusNd/gflBCJMG/2HknFZSJFW8C66sG9JV2QJODIkzcyIPK8RTOLkTrcBO3LZeNI+IROcPbWRFCDovFggZHVq4YA0gmO+k7d9nMEOZ2xoHpQMvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t+x1qcij; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t+x1qcij"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52b80e5688aso2136859e87.0
        for <linux-clk@vger.kernel.org>; Fri, 31 May 2024 03:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717150645; x=1717755445; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wU2x+rC+rY1TexIw+35IsmnICmTlxsrRgP1OhOExHRU=;
        b=t+x1qcijfZQK6+tK2lb222T+MRztESq68W/coOuGgF1415dvrUQ4SZ9tmBVGc7uiqf
         gJCwml1KObOxgRB1V2FN1j03z7C7DBk0ilntkNG/KPYMcWaEIy05zmjgDcUsHXzn2kVU
         fWk8Vbc2mJOcqWA/m6ozOalZcvLVq4QxSjvXpBtpfoINq/Ruv5O8z9tGEpIsdJcn4klj
         +24IymLVGwAIdJPsH9sXQfQSw4YJ89arF9AaXblSoYDLsXkYqTNZNpRAiY56q5SzlXX9
         RscwOrErrkck08/egnws4zjhCqGOS6/ZZw5tnYjPa5Xeo7Q3PN26SJohXUHUhia2TydA
         UAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717150645; x=1717755445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wU2x+rC+rY1TexIw+35IsmnICmTlxsrRgP1OhOExHRU=;
        b=cV8wnROnk/85aTjYPws+4ONavwZVjpzsrpU/7IkLjWrNT83jt/H/LHHN3cK5dGkQzC
         acSJ56+1SYJSgBipWvdO7NDDi/ufpvFo054Qam6RbXLk/0Sr9EhULmHJYsbogDPgddLi
         nuoxqInEvc3apGm6ojMD89gyM2LukZFm+GjbRg0GMAhmdXCxcL4FVDfaYHMhdLJlkLe0
         QBSvXzn5X8/si12FxiCM5EbT+NJ682CyCHSROY0Q7OLFZsGgpmDrrSeeE5Zg29QQ7CS1
         tvUGRRbZIDYfpBSjREcn7LO0w4NKzeUJfT7BhXMH74fGYG+5G32YZGyeEzxG9Uie+fQa
         j8/A==
X-Forwarded-Encrypted: i=1; AJvYcCW33xa2P+yL/X4dsjavGLcySsKBxzjbZtTKahumx1JJlJN+q18BePpcvsoarWxJV/b3excz+hFREjNTNRSWKJ71Nr5Iw7TbgWEN
X-Gm-Message-State: AOJu0YwQWBBJHihA20urxz5fRVAe7UXyGOTJ78/JRB9QI5sWCugToH89
	oGBdVgJh18LQpZDOsBE7oRb4BuAM8DOxsUjr5KIVUAQZxC2WHd/UJns03xu5TGA=
X-Google-Smtp-Source: AGHT+IEENyeuMobIIP3O9emQj4DsBm+mT1b2exSWtrGGN3X/2E5CAATZZ9KTvisqbqNKE/5YhvzoPA==
X-Received: by 2002:ac2:59c9:0:b0:529:b718:8d00 with SMTP id 2adb3069b0e04-52b89521713mr1089746e87.8.1717150644844;
        Fri, 31 May 2024 03:17:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d898cbsm281293e87.265.2024.05.31.03.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 03:17:24 -0700 (PDT)
Date: Fri, 31 May 2024 13:17:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, quic_jkona@quicinc.com, 
	quic_imrashai@quicinc.com
Subject: Re: [PATCH v3 1/3] clk: qcom: sc7280: Update the transition delay
 for GDSC
Message-ID: <6wb3dyxebhgoimcxgcxovb7pyad4w3eipvvufef2jbvjbtqhwh@o27mbzvq6szs>
References: <20240531095142.9688-1-quic_tdas@quicinc.com>
 <20240531095142.9688-2-quic_tdas@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531095142.9688-2-quic_tdas@quicinc.com>

On Fri, May 31, 2024 at 03:21:40PM +0530, Taniya Das wrote:
> Add support to update the GDSC transition delay values to avoid
> the GDSC FSM state stuck issues without which it could lead to GDSC
> power on/off failures.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/camcc-sc7280.c   | 19 +++++++++++++++++++
>  drivers/clk/qcom/gcc-sc7280.c     | 10 ++++++++++
>  drivers/clk/qcom/gpucc-sc7280.c   |  7 +++++++
>  drivers/clk/qcom/videocc-sc7280.c |  7 +++++++
>  4 files changed, 43 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
