Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19BB171A2
	for <linux-clk@vger.kernel.org>; Wed, 24 Jan 2024 12:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706099726; cv=none; b=I5QV5+evMKco6fy9B1JLhfApJQW7Lk6bRaDnQRp4oIQxKmX8ubuuipbzc3Fvbfmx1CF0Ln3AdAku6Dym1buiJOkrZXsnhmKO0hSs63DcJ/Fu4ngNjuzw8yb4AAlniYRF+wTsdPRjXd2PDDt8lPg1WzJueiANN8mQyMcEmDeDgCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706099726; c=relaxed/simple;
	bh=c/wbv776yHXlcIjGaa1CUq07U8UdLr6hbZt1Z8dRt+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m9pmryeo/Ynh0o8uVlc3zsc6NAMODqoxl3fs6HpUzBQi8s8B7CfEITiqQpKLMXNz9aLPDlFzrCieafZ9oaL+Kr/4rdBDgmZS06Nbx8qGPIFp6/19dbJv1k0LhWPQU50JJ4IN9gH4vHT8Vc8AAx7/YXfBLFcZuDij9Zjb8Zp03QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vnOffR6i; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vnOffR6i"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5100cb64e7dso1482596e87.0
        for <linux-clk@vger.kernel.org>; Wed, 24 Jan 2024 04:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706099723; x=1706704523; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CJmAdCvO6+tFmNrPTtHuSYeZGmOUYLVSRqizHwM/BN8=;
        b=vnOffR6i0VHWTT9Xi3kz3p5WXGJ5U0oRyGZgqbB6mQ9oZoyzJ5lE5UjjUp2miOK4jU
         Vvjg6jQY0aK56xs/K+mVFBvKE30I29jiEcVZt18VroWqcLbxmbVjF2OE8HJ0HZdr65vN
         6qrL/tURLCX6XpLiVXnAc6zYzf8avBHh19ENKPy05/CO+g7fSlcT2C1wtPoOp3t+GD/T
         vK3IBoJUEZOoYlAjeHEO+7WWK8S1y1JMwwCGKj3Gxz4y4NMTfx/hidWq3gm0giqDxPJo
         py55VGJFPRWm4SyW2Y22nKUkhBVkrHAcfHI2LIsW+QCUfrnm512SWGCmFdQf26PQwprG
         gicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706099723; x=1706704523;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CJmAdCvO6+tFmNrPTtHuSYeZGmOUYLVSRqizHwM/BN8=;
        b=Q2xieOWwqFaLu346/yaS0Q45bMi5Yx5QA71pzKswiml2AO7CinymOBTcdID92NDeG4
         D7doH9TnZsSPhayk/Kqyb4HUFI+lp77aMwdm1Wx2phyHPrPZ+BtULpmC7eOVRLaCSs7c
         iwf+OwgSYE14ghCNDiW+lFeV2zDMtiJB0q0lsrahI9q9fBB0dopYQnbL783SVpTC6Z/m
         9K/NmImIqTpJrrcU6hHVxaTevMLMmgykGixbvg51kojGyerGZ4MCFyqPyCiFjaXNJN5y
         zLQCvANVWLuj5fDGn3BS+LLilildcPNOYzva8Atj8Rg9iAjQ3GeXIzCyPfRx6FahWVly
         MkkQ==
X-Gm-Message-State: AOJu0YyFxWFQ6JMOHMaqcLVERGdDaGloHp/6SdWMFoFgWiOUjE2dnfob
	90IwgTKWicISe0vzsAqyyTpAbuxNLjazASH6l+MAUH2v9Rd4+gm+TQeN6FDWErw=
X-Google-Smtp-Source: AGHT+IG/RAqUc+nQAB0NUWmj2/eeOO3TTTYg07Lqf04FmywtcbDbjvXf27Zz9Ub6B0SlPtqeFVlS9g==
X-Received: by 2002:ac2:55bb:0:b0:50e:76b8:e754 with SMTP id y27-20020ac255bb000000b0050e76b8e754mr1401740lfg.141.1706099722880;
        Wed, 24 Jan 2024 04:35:22 -0800 (PST)
Received: from [172.30.205.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id p26-20020a19f01a000000b005100ed58b76sm207756lfc.308.2024.01.24.04.35.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 04:35:22 -0800 (PST)
Message-ID: <b52017c5-683e-404e-8165-c393f6224095@linaro.org>
Date: Wed, 24 Jan 2024 13:35:20 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] arm64: dts: qcom: sa8295p-adp: add max20411
Content-Language: en-US
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Johan Hovold <johan+linaro@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240123-sa8295p-gpu-v3-0-d5b4474c8f33@quicinc.com>
 <20240123-sa8295p-gpu-v3-6-d5b4474c8f33@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240123-sa8295p-gpu-v3-6-d5b4474c8f33@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/24/24 05:25, Bjorn Andersson wrote:
> From: Bjorn Andersson <andersson@kernel.org>
> 
> The SA8295P ADP has a MAX20411 LDO regulator on I2C 12, supplying the
> VDD_GFX pads. Enable the bus and add the maxim,max20411 device on the
> bus.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Missing submitter signoff, but I'll trust you're the same Bjorn
Andersson!

> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
