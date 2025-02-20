Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDE31DE885
	for <linux-clk@vger.kernel.org>; Thu, 20 Feb 2025 04:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740026713; cv=none; b=HqSVmrxNLwNu8dSib3+qsnIMeSrd9jGDLhllYuP6o881hnOOuxaI+fGuBZco+UL6XWjkv9zRQiXsSKwptXOSkfYfJeHDq/TSKLMlb+lcYvyCo1NhdSSt2qiGRwHgt+UfeO94kfRsSHbYujT2j7/kxW/Wemv6DW1qB9/NjjS2PqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740026713; c=relaxed/simple;
	bh=KCZWGTmNI8QIdlHQfPCl4TcaF/VtA6DkYi9Xq78zeIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gcNaKslMKGUpXV7iTsJPMnadbYEB5csXzuWE//Qs0Pq/4QyiSLgq/uwnJg322NUUWv65Y0GyWuM/obQZmUD/Hnf5JjBfzs0W/FOAX/C1CmA3vz6V0+YccL/FfVHWVLz8hmSDvX5LUmNWddW7si9VgUcF8hl62kdUytUZwSXvI40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yeoH+eTf; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yeoH+eTf"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5461f2ca386so490024e87.1
        for <linux-clk@vger.kernel.org>; Wed, 19 Feb 2025 20:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740026710; x=1740631510; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=65LK1GfoPK6Ow7cclrATVzkjUCOxCmHzKKc+sYiStOk=;
        b=yeoH+eTfJc7gEd/B3Yio3eNAjxd+5GwwO7ZJzbOejBdGVCu7DUrEwYdShdKZkvUkOM
         w7j4tfMFiL01PwnfUfSvFex0AaRfyZei9M9Sw3DvFVp0Egz8IpRnY8MXThSD3ETOinYV
         s6WNdYZVwLjRM2wogGN/RTVP4DPLpjfWTGHz6EudNad6dubrEa2PU1x+ZaWi3X+pj3kh
         1Qidy3HgZIrO9DBNqxdvZkBwsEDvleg5n6GEbgm02wfkI3P3BuXkaGZdFzNL7y+KAWwP
         tmskH+9gb3TDdans1PFpdLuJWZSJyOPwm9Fqp21MY3SCw0uQBayGve3fcxSeFHVLXzSX
         VRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740026710; x=1740631510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=65LK1GfoPK6Ow7cclrATVzkjUCOxCmHzKKc+sYiStOk=;
        b=K5X3rXMWLOG8x36I0EsITA9+toTarcI5J+hQFOfAmO6iZuE6RtS2JbjCIaWCXOCpz/
         4FHFAXL04X93hFh4DiNFFkI2slOuAl8UqHZuncCj8mY6N2IeqoicMf8M9f82N8hmUMQB
         K0Lwe8rSJyS6XWgmKfhRJxDXvjuT/bi6yuhBux1gINhmNUcwjBU7RyUOAMd3xg3tiBd0
         4EhCwCRfSqCo9DXs3iJ2e5BwDJKH4DV+cirWRFGWUAUpw4yWqBkjpH917aP+XoEPI2uI
         t4e6aMjUFYBas/2yGnGw3nWYk0pSjtBRbLCZWKYkf+dn0sW1iWsGDcoZ17wV0vRk9FvZ
         i2LQ==
X-Forwarded-Encrypted: i=1; AJvYcCX00px3XoBTf35nh5U2HdgWeiarq3fOlCitSPkaeZybNEx4qZwqtRvgcPvUajPEKlDXCYn0bNx/gVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgjDLAIHP9qR9o+tRiLFWl8Obr+yokFVHuGSW93DTgfK8ghoMx
	VZDo1fN4nSc1fT6bOshr6NI8dlV5TJNY5rnrgDEU5GOQK6C4DGMBISPYOMuSJig=
X-Gm-Gg: ASbGncutfXeOMxzJ22NjHZuIR8jLciI4KyU2R+kM2tBF+nJYZnCVpK9UENkljEpuH02
	QA3LKfz1ULn6fG9tHe9zkxfRo7YPylDcjshIoCgj9U+d9oFc0kt8wKiZIung6lFELAEArMTitqt
	tYzqFun0PY14py22bMdRoO0Vm+VarhpT3TNdHECOng2MtOWmV8dnBHyxQDJLqScZhwlY8Y31tTg
	ctAdLtzoZWsdBSGl9J+opzkw2A0o7B/jQ9LGeDQnssQofjaBj+G8ss91YpWDBLBqhyNJ9nSizyz
	sfiRBNvJNhuSWpjnD65voqRpA+5CeQejvVuHAT7nmWLOEY+6jKFSCjaLeW07IHoIkNhh7lE=
X-Google-Smtp-Source: AGHT+IF67NcEhyD52/u3RW2Suj2R6HsnYhFEljP4J+B/BN8q4hAx8dayZAKsUhRTCIOJraE7WVC62A==
X-Received: by 2002:a05:6512:158f:b0:545:aa5:d455 with SMTP id 2adb3069b0e04-5452fe3aa72mr8207164e87.15.1740026709630;
        Wed, 19 Feb 2025 20:45:09 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5461e731f02sm1305340e87.192.2025.02.19.20.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 20:45:08 -0800 (PST)
Date: Thu, 20 Feb 2025 06:45:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: qcs6490-rb3gen2: Update the
 LPASS audio node
Message-ID: <ykysfqf6vcg7tbma7cxhbdvmi6zkwpmub75yazylqng3767yqx@u7qklqyrfjsr>
References: <20250220-lpass_qcm6490_resets-v4-0-68dbed85c485@quicinc.com>
 <20250220-lpass_qcm6490_resets-v4-4-68dbed85c485@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220-lpass_qcm6490_resets-v4-4-68dbed85c485@quicinc.com>

On Thu, Feb 20, 2025 at 09:52:53AM +0530, Taniya Das wrote:
> Update the lpassaudio node to support the new compatible as the
> lpassaudio needs to support the reset functionality on the
> QCS6490 RB3Gen2 board and the rest of the Audio functionality would be
> provided from the LPASS firmware.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
