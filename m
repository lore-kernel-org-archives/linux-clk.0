Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784FA23F39A
	for <linux-clk@vger.kernel.org>; Fri, 28 Feb 2025 22:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740782335; cv=none; b=k+6A2h1akhRmIo9QqoiCCuYvzmrJvrMsvwh/1aWrCxtboxImOfB3IZCkDsFbDwqjmXHLLMfJIcO4D0fAdOw+7kulGCLtpY0c8YiECISk0a/DbLrFv6nQel/mxlwSAMGzxLmUrHqqQYJ07tWNa6lFc+0gLjZYpkB7A3MRjhio45Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740782335; c=relaxed/simple;
	bh=qxmpwgVoph1AElRgemrOMCNkM0UQR+WMiPiIC7BqPOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O1mYgMQb8n+V/ig1+Rb1z3auWEJFcIx6pE/fwkDSGNe9lKzjjCzRppZ/R7j2dWG2Lftv4kEMpTDsGeztec8Zm3NzQdqhCAW9AxzL9Cx1dO+JrGkGBvm3VNkwwd8sakxz5t0k3BogCdhu4fDhPWWo38qeDLsSi1W+TyQq2voRLCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XO/Y1l1p; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XO/Y1l1p"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54959d1a856so104885e87.1
        for <linux-clk@vger.kernel.org>; Fri, 28 Feb 2025 14:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740782331; x=1741387131; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jVLtEZWmEyfafXYzQagUTDqOcJoOxE4zFmdp+hx7MFI=;
        b=XO/Y1l1px9lPYSETYZ0dht9OL8qhdlVxau0kP6KT0GhMKh83TytQeVT5xvM8R5Jb6u
         SWjfhD9XmY+W0rFy2kZgd3KJbHJe/1gcRshO1fae8ajFJrAImeN9rt5KyMR/Fw5UmSMm
         Unu5u6aJdDV9qBB9s/MeVFAkEmRNbF7VcJZc3Bb10NNAkZpET1xgl5isg9uB9gz0QiXf
         lUv57wxZ1+j53BSaRN7W37/1/7mUUcL9HoSoQB3KvyxRDGY6Odk5aEdRhHOSftCRNkXd
         6IXf1qtw9wpqZMOKNjx7i9aVo/QCWPxvPJHsg9TPlZZDGd4WpvGc14+joUEy0ySM0+rz
         5PKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740782331; x=1741387131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVLtEZWmEyfafXYzQagUTDqOcJoOxE4zFmdp+hx7MFI=;
        b=rkufFQ5hPWyyCDfGddsiT4OGjUc8Y1/HEDrGOhty3EuLvIIjOwJXoPr8P8lwfEvUHr
         EpUghbioXUKfYrMeG4l4MyEJp113ZKWGy8dUPscd37HVcVbccM+uCxQTSvbvNN5y35NJ
         u05lXNtX/WRHebPScUu34C+Ehv4VZVdlaQT8/sfL4jlchnl94tHy9LeN+ECHBFPLysHR
         I8UpgjcVFDLuqNavTJUL94uMHbDQyg1iBA1s5lS8+gpt37AgZFW9iDnvAu7ETpgCImur
         lIS3tMRnJeb+8Pfxgek7AXSrLKh3dSaFJSFhMNuzTvqNE+vVg+HQB23/rZFDeUP123g7
         /RUA==
X-Forwarded-Encrypted: i=1; AJvYcCVS4RdV+MdPBfoIow+FAonAEgFODXPlVWyOo5ggaqEry3BdFQC2PspjlOc3xp642JGwK8PquajzAhY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzRDO56H8A4H+YaZN5k69ZslIf3//eTWij7N7KNhGMZNiAVVMg
	X5mOY9oBcQP+S+m0N1YyHPADhIOTIQrniREAuluKVjoyMCZxoni86/N3ocj4FgTu7iSSFfujgeT
	pkNA=
X-Gm-Gg: ASbGnctk+JiiDO3FnSk08V+KjSNxgGKN4Q2SpabdwEgTTnRBDwH6eEPWI/W57641vBn
	EJUgw3AAvgueCfmmfDzF+YgZp9gVtmjwf6+9zpkicufVt6aNhHRmkSiUOb3dAPGrfmNWMS0illF
	oIhKkpKCaBhHtYzYTnjPYW7LzxJHU9g2YsdN3zIJ+xVxyQ2+aMumSDMrgn2MQK+gUL8iYJr4qwY
	JgL3TP6hXNFe1CgehGhJ7ZLSD5P/bNXH5GIIa69jEQmZ6H5fk0oLPl93v6YRrSZuC5+09iYwhyH
	v3CjUXFQsXntJSKXrlgCQYdU7yS9wOO5EMu5uQEkdVO7grqtKovHFnL0OWnHclIx+7hjtEo85xP
	UHos2QA==
X-Google-Smtp-Source: AGHT+IG9mAgP7zVwIktUs/UBARKaqjA/kl0Vs6vq5xs6d+5Gc5O4KLLVSbymtcmIIJXCsZL/fle75A==
X-Received: by 2002:a05:6512:128e:b0:545:2474:2c9b with SMTP id 2adb3069b0e04-5494c35e0camr2328617e87.22.1740782331571;
        Fri, 28 Feb 2025 14:38:51 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549443b1286sm630135e87.158.2025.02.28.14.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 14:38:50 -0800 (PST)
Date: Sat, 1 Mar 2025 00:38:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] clk: qcom: Constify 'struct qcom_cc_desc'
Message-ID: <jzqxj6b5brslayz6crvgenjiynlkagszdve3w5ablm5yyimmtv@pf3slvisucbv>
References: <20250228-clk-qcom-const-v1-0-611ab80d45e4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228-clk-qcom-const-v1-0-611ab80d45e4@linaro.org>

On Fri, Feb 28, 2025 at 03:59:37PM +0100, Krzysztof Kozlowski wrote:
> Make static 'struct qcom_cc_desc' const.

For the series:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (4):
>       clk: qcom: camcc: Constify 'struct qcom_cc_desc'
>       clk: qcom: dispcc: Constify 'struct qcom_cc_desc'
>       clk: qcom: gpucc: Constify 'struct qcom_cc_desc'
>       clk: qcom: videocc: Constify 'struct qcom_cc_desc'
> 
>  drivers/clk/qcom/camcc-sa8775p.c   | 2 +-
>  drivers/clk/qcom/camcc-sc8280xp.c  | 2 +-
>  drivers/clk/qcom/camcc-sm4450.c    | 2 +-
>  drivers/clk/qcom/camcc-sm8150.c    | 2 +-
>  drivers/clk/qcom/camcc-sm8550.c    | 2 +-
>  drivers/clk/qcom/camcc-sm8650.c    | 2 +-
>  drivers/clk/qcom/dispcc-sc8280xp.c | 4 ++--
>  drivers/clk/qcom/dispcc-sm4450.c   | 2 +-
>  drivers/clk/qcom/dispcc-sm8450.c   | 2 +-
>  drivers/clk/qcom/dispcc-sm8550.c   | 2 +-
>  drivers/clk/qcom/dispcc-sm8750.c   | 2 +-
>  drivers/clk/qcom/dispcc0-sa8775p.c | 2 +-
>  drivers/clk/qcom/dispcc1-sa8775p.c | 2 +-
>  drivers/clk/qcom/gpucc-sc8280xp.c  | 2 +-
>  drivers/clk/qcom/gpucc-x1p42100.c  | 2 +-
>  drivers/clk/qcom/videocc-sa8775p.c | 2 +-
>  drivers/clk/qcom/videocc-sm8350.c  | 2 +-
>  drivers/clk/qcom/videocc-sm8450.c  | 2 +-
>  drivers/clk/qcom/videocc-sm8550.c  | 2 +-
>  19 files changed, 20 insertions(+), 20 deletions(-)
> ---
> base-commit: 8936cec5cb6e27649b86fabf383d7ce4113bba49
> change-id: 20250228-clk-qcom-const-4218c42710a9
> 
> Best regards,
> -- 
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

-- 
With best wishes
Dmitry
