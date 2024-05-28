Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CABF1667D3
	for <linux-clk@vger.kernel.org>; Tue, 28 May 2024 12:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716900136; cv=none; b=SdHWP4S+09LxIkH7znCckfmNhR6dAi+t8qIgjY7u5DbVbLVSiOcQ7kf0UmjVRz7LMnAAG1LhbC+s1fZxMAvVTv1HjMOIlvYRt3AFWMJWVthLSmEGO+5sI8bhf3wimSd8Gz9ZfA9ewntkC7tpkO5bklkAhZpcWhQZnNJ80pF3+cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716900136; c=relaxed/simple;
	bh=jy4TleX0TGr2sJ+SCNvVgTUrHI0s4BJuMp0j60gElKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rLvhRNbIFGpXFzfcTIqHgWvabGOf1oVWUGtEcAWJZf427oLKA9+6raLIFK5RBWbZv/YvVsUahIS2jmmfHBqNSQpzO4ASdurLJVMFBQnyPAupEQY3NzBO48X/Zcdjc8e4T+1dAMTjZir2TQdowHe2iakVkf+RYcO0TGKTUOo7qD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YKeW5RCz; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YKeW5RCz"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-523b20e2615so895985e87.1
        for <linux-clk@vger.kernel.org>; Tue, 28 May 2024 05:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716900132; x=1717504932; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ga2T6XeCoElWphUxptYnP0YlDqCUOZmRYJH6lTvOF0o=;
        b=YKeW5RCzDkd8kgX0Ekapg+VjQPWoeddQS0izaS4kki0yOnlgsFSpqwjcHlWqXgFZZX
         Pq16Cckawxb1C24J6lRCZO8B33YFnR53D/R02S/NHhCs/L5J3Bb/2vbbto8sUi64Si6c
         J3G474rYEjSQdGIx7kdmTanFC5l8lCCi73l9M2IaNI22b+ofrQlpxR4JkwbwEHLippTX
         pC3ftglmLznclm94Wd50pFMUJD0qcQB93Al532LkX1EKGRZGLajtMmQ8fXeigErz9qEo
         NJgRV6xOQ34ex9wYURr/hJjL5zQHAD5WpnH7AZxCmKCywY8xx0Da61IR5MtuRse0Zz0y
         FPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716900132; x=1717504932;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ga2T6XeCoElWphUxptYnP0YlDqCUOZmRYJH6lTvOF0o=;
        b=xA1Xe7T2CwQzc6ZSN/g9hphktd2Tc8exuWfrp7KBuBLrNDLPd4mWBioIV1F2H26buU
         Ky2N1s1dYqqFM3upfh1ObgWOeIA3P/xUEEGfusPu65Ct/NssxAh1kruCXdvgRZmt17jA
         xwuRijgLOlzhi9qV6DlcUgdmbsCYKqFW1FcDNG7AzzIFu9haxXArK4N5Ilk/q+VEpvV1
         IPPU6IuvABRgBJ54m9GseQA09LA90MjhPzJxlHb9xZOWbAH/NmhBJX/fCfhdp88EJdpl
         prq9PbN4Fib+GA5jn4JAwqOAkaY8FkH3WAwcWklgOCZ6Us9R7zU15bcB3RLgQnItPSY4
         9NMg==
X-Forwarded-Encrypted: i=1; AJvYcCWmp5polSou4JlwOTWhvveTOGIJvJJ9DFNyJoPGlaroxdlLHXI7Z3jwE8WsKoD7GOOSV2gKBHe5r3flMuUzLadSaM+RsJRk+lvZ
X-Gm-Message-State: AOJu0Yx3GrRFWhKnHlq/SUZvBCHsIs/vNKjJLL2rkWqACgiyctWL8Gif
	CiGfSKBBbFpcdftGnslMjI+IQmp30I9JGM4EcrvAXbdIhbfZYQrZPktzBLK0gl0=
X-Google-Smtp-Source: AGHT+IEKKv3xDNv3NAqFduP1EFyw6pzWR6Vp8uFAEDeCR4NfYt5ZwVfqN9sWu3DZSG6ton8htkks7w==
X-Received: by 2002:a19:6912:0:b0:51d:998e:e0c1 with SMTP id 2adb3069b0e04-5296410ad52mr8276027e87.13.1716900132197;
        Tue, 28 May 2024 05:42:12 -0700 (PDT)
Received: from ?IPV6:2a00:f41:c97:23a9:35bc:df2e:d894:2c76? ([2a00:f41:c97:23a9:35bc:df2e:d894:2c76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5296e887a3esm920622e87.13.2024.05.28.05.42.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 05:42:11 -0700 (PDT)
Message-ID: <a48d87a5-0271-46cb-b5c7-3c5e0334bfd2@linaro.org>
Date: Tue, 28 May 2024 14:42:08 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] arm64: dts: qcom: sc8180x: Align USB nodes with
 binding
To: Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
 Bjorn Andersson <quic_bjorande@quicinc.com>
References: <20240525-sc8180x-usb-mp-v1-0-60a904392438@quicinc.com>
 <20240525-sc8180x-usb-mp-v1-7-60a904392438@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240525-sc8180x-usb-mp-v1-7-60a904392438@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/25/24 20:04, Bjorn Andersson wrote:
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> Add the pwr_event interrupt and rearrange the order of the other
> interrupts to match the binding.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---

The new numbers look correct as well

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
