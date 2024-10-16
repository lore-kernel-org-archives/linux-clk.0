Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2E5207A14
	for <linux-clk@vger.kernel.org>; Wed, 16 Oct 2024 10:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729074074; cv=none; b=HRT7khYoiyg17lCgb/jVxaYYIXJGWU6fIqIeLhdHOo3eiYjb4h/mCNcALq4E/kEzlbhKymLb0nIiYk10KM4TgVxs0h2uSurqogwAhq1OngCkD3WcQoLy7F4VAp94+WZwo81pIPDBYp4+AKzq3NGZnn9x18+gQaFT6wP8EZu6xCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729074074; c=relaxed/simple;
	bh=+vjxN3bVpSF0tBOfRjKZ6xoE3GHMSenDIePKfHckiZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MFWZrDONR3F9x2sVba097qSXnymKqec30EgPRI5jnCwb1/22wndkgh6DOZ9yc1r0jSK7T2fi59vHojMPhp6y9bYdIzPeSGo5Z2RmCvEdaoepvKFlBcc717eU4pFZTmIj+rOgHQyXgqNW/QDGzgZD0whHwpudNEgbvta28F8vlDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f2G/BbQF; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f2G/BbQF"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539fe76e802so2209429e87.1
        for <linux-clk@vger.kernel.org>; Wed, 16 Oct 2024 03:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729074070; x=1729678870; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OLdut8E3E3NtKT42b9sOuPXdXDsonyxQjz/a9BL8yAE=;
        b=f2G/BbQFpmBXJBbkDNZNNXk6xlbfgCDEpT+bXHf5tDm9aY7/5X/+xwlC9VE/rTSTjG
         VyZKPloBJecLWl29tdZiahgcRhi+4xQQ0uYocJ574gsrtgTbQinTQqFKJAujp0Uw+YJo
         6ImkbHoGzYhwBLAZNh//Ksw8af9+Bcovm7vu2Yg+HXHWSwOKppg42UY9EXMlva+RrOWe
         mHIAO5wdxDvM2HYqEFwF6wxS71TuZhLZ3lzhy6lAkSsO4BIPjGVXJT+YFqaIDo7q+Ea1
         ljf4hAmAVTZNn0I7NGI1vid4IiE2Sta7WYMYXgQIN/QK/IW2s07WCGMslg4UHEH3cSJY
         H9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729074070; x=1729678870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLdut8E3E3NtKT42b9sOuPXdXDsonyxQjz/a9BL8yAE=;
        b=pWv9eEiJG2TgygpoBgtDhCi/dL9CG1AtLkUpnn1QSHDWZnuCLF5T2XzCc/mvM8pwZb
         yYMu38UXApCpHDJactvjYSz6klNvYbuAYi7cFEk0lDz2xlhXhYDi/T0kWmJowQQyx4oU
         KfrUGBQI9cXXHEHjHKMPACJOrsD906IDof1CVySb1A/Z3zfBErDxkrxmPui9Y8ZTh2iI
         8Uu7l48nvisBDvetm31BmnVXD17mSvLfGZsYGp6PJUI//9PZfRf+uD/8cPzQgbRMVVQ0
         zwGHZYV7k+yx0GF92I6yvglM2XGZHjbMFmJDkVnP7wslzHzELPkTGLhzf9+HAI46PpjH
         92Vw==
X-Forwarded-Encrypted: i=1; AJvYcCXj88X4T46gHmSzjtrGrYUpyxITYbgySAH4DbNu1F0S28laaZ7hqKSpmQcmmth8ZSWNjVZilSgu3mw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk+jfeuWuJwl2LKbifGLU8eIbDDqR4eQvmEQXkbDREuofb4VNr
	3n3Tkc4BiNPe5ksYe0gGM3udigtXpozOFgypWjUxnBWHa04I8DSC+0n1FDSUQSY=
X-Google-Smtp-Source: AGHT+IHfqISBcwOLeSQZDV2YK8lfIG4NYRGTSreBdpNCo7LHjqixn5TrNwC4CIw/gihbpSQ4m5WEBw==
X-Received: by 2002:a05:6512:3d23:b0:536:7b74:ef50 with SMTP id 2adb3069b0e04-539e54e81c1mr7747993e87.18.1729074069649;
        Wed, 16 Oct 2024 03:21:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539ffff366esm407072e87.168.2024.10.16.03.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 03:21:09 -0700 (PDT)
Date: Wed, 16 Oct 2024 13:21:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 0/4] Add GCC and RPMH clock controller for QCS615 SoC
Message-ID: <6y6bb3vbxaffmaakxv6m4l652rinbbhtzyekxeupdfdvtqooil@e5bjlq7rh2y7>
References: <20241016-qcs615-clock-driver-v3-0-bb5d4135db45@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016-qcs615-clock-driver-v3-0-bb5d4135db45@quicinc.com>

On Wed, Oct 16, 2024 at 10:59:42AM +0530, Taniya Das wrote:
> Add support for Global clock controller(GCC) and the RPMH clock
> controller for the Qualcomm QCS615 SoC.
> 
> The QCS615 SoC is added as part of the below series.
> https://lore.kernel.org/all/20240913-add_initial_support_for_qcs615-v2-0-9236223e7dab@quicinc.com/
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> 
> Changes in v3:
> - Update the gcc_pcie_0_aux_clk_src to use clk_rcg2_shared_ops. [Dmitry]

Please don't send the next iteration unless all the comments are resolved.
Sending your reply to the ML and sending next version at the same time
isn't really a good way to work.

> - Remove an extra line [Dmitry]
> - Link to v2: https://lore.kernel.org/lkml/20240920-qcs615-clock-driver-v2-0-2f6de44eb2aa@quicinc.com
> 
> ---
> Changes in v2:
> - Update the compatible in alphabetical order for RPMHCC bindings and driver.
> - Remove the extra ":" from the GCC bindings.
> - Update the GCC Kconfig for some required configs and move the GCC init
>   from module to subsys_initcall().
> - Link to v1: https://lore.kernel.org/r/20240919-qcs615-clock-driver-v1-0-51c0cc92e3a2@quicinc.com
> 
> ---
> Taniya Das (4):
>       dt-bindings: clock: qcom-rpmhcc: Add RPMHCC bindings for QCS615
>       clk: qcom: rpmhcc: Add support for QCS615 Clocks
>       dt-bindings: clock: qcom: Add QCS615 GCC clocks
>       clk: qcom: gcc: Add support for QCS615 GCC clocks
> 
>  .../devicetree/bindings/clock/qcom,qcs615-gcc.yaml |   59 +
>  .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
>  drivers/clk/qcom/Kconfig                           |    9 +
>  drivers/clk/qcom/Makefile                          |    1 +
>  drivers/clk/qcom/clk-rpmh.c                        |   19 +
>  drivers/clk/qcom/gcc-qcs615.c                      | 3034 ++++++++++++++++++++
>  include/dt-bindings/clock/qcom,qcs615-gcc.h        |  211 ++
>  7 files changed, 3334 insertions(+)
> ---
> base-commit: 55bcd2e0d04c1171d382badef1def1fd04ef66c5
> change-id: 20240919-qcs615-clock-driver-d74abed69854
> 
> Best regards,
> -- 
> Taniya Das <quic_tdas@quicinc.com>
> 

-- 
With best wishes
Dmitry
