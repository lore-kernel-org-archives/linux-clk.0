Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D646F19E96A
	for <linux-clk@vger.kernel.org>; Fri,  4 Jul 2025 15:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751643400; cv=none; b=t7VfhPHNg70dF4w0LUccmuK3PLiE9rdfzAHNCSvNe19i68zOx6Jx8HQNub2rt5SLLNyZu9X864ddofC+MmSBY+816aCo7bZv5O41xExyKzlK/dlmSQCGfb47YKIwE1us13K7k+d1NdM97zBNZEzcRojcnYrPpGz2yrpYHvhSRsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751643400; c=relaxed/simple;
	bh=6AfWGwf1ZO1nnsP9pbeq6kHrKdZ3X+JnWuL1iOaAIl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ozLw0hkvV7uuMPUMz6F+8E2OhrWSz6XZbi+1vTr9fQ4zdDEwTktO0TzOPdO+jdYZiA9+Y+/4Vm0rpQ/b77OqZgmobbp4pe0uJMSw5BcRC2kNM64uJUggTkLehLLs53KcFvrmuduJoRSSv6yhQY/tDrHoDlsOwI4e7tyMVSFEY6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kdZcvAoS; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kdZcvAoS"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-453066fad06so7556065e9.2
        for <linux-clk@vger.kernel.org>; Fri, 04 Jul 2025 08:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751643396; x=1752248196; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kHBPVkZ3WjeAxBR0NM1nNct+JGgFP9fCRsYhnveiIng=;
        b=kdZcvAoS4+c0wNiaQxI0cdpQ3HtMGXDnvmVsnhzCyCHR24nhMZGJBhehmGb8H8IK5A
         x0zv8G7ETUYsQ1qCCUav1eUSGTQ2puRDofJfbZHkSNrpCCU+dnamWfkzebTVg/YbHcvM
         o63VFdkZq5DLNRVhmPI5aiamlrquYT+InP2jCGPdqFR+K6lzBtphZBxEui3jR3vqhqAo
         vZgabk8kdCna6s+A8wPdy4hX2vxjnuUkgs+THJGNcxF1qLDFzCMVpaMImGkjMduLc0jL
         y/TGWRVLjZnMe1PVBb+s60DHuTGyUBL/y4b7kNA9pyUMqfMXmFi77WjwSDoTMzpVQZGI
         Coig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751643396; x=1752248196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kHBPVkZ3WjeAxBR0NM1nNct+JGgFP9fCRsYhnveiIng=;
        b=bMgU+2D7iz/MKI43oXkTD2wKFVd7+oQbOzrJUXU0MBVquX8WG5RAVr033nPoPTgGAK
         GW9dw/K3DvHAF3pqw0Jt68XZhyO+aFciompekMP/3c1v1ZqNgz/mCJsGt4yD5wwjNZEk
         eF/jSpZ03iLzwII2sDnlha1tL1N4v9CnyvibKlVAFNvyd51fmqBvILKy11QcPceq3Z+5
         QfckxdY4sWIVCYxJT2e3z9WV6m8ILyNLk5ctsahxuUvQiib95lijQEiy/6KBRxIP8K9g
         JlPp/5wiuo0+K0d83sDMUR/ly8azkfZaXsnOUD+U40UuSsnzt9qQo1b0Cxe9mKcCtUst
         YYwQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1bpZvjo8+u4oZfmESCiH20LejduuaQW12xITqWWvFDfvtxF6oBExXh2EzAVRznDwYU3MPQTK1ERk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4/K5Wohkmx795iRhz4rJIHH75YZ30wqYZbHoEVVugagNsODwG
	Hx3ppiopykz8WC30t7/UQeVkOTmmQTS0RMPL6gTLZJpOKOrow9BAihysPYl10fp7uO8=
X-Gm-Gg: ASbGncsuR2jBHmBwZF1t2BWC7+hG8gt1hCZqiaJGKwVBHlmhebcgzEsnWcuAlbgeIzm
	T5VaR8gjhqxDD6Zspxh76iuNzFMTANyQPKjhowiEu0i4JWLTKgu9Qnhu+0lDt6mynRlRk5vrXiK
	b1zC2nyQMXA7gmX+dQPtGYN0PfM61tHSNVFah8FmclaTqDBvTnzEpDwfCD+f1tggaWkc/wMcndY
	vNYdiHX5kIy4N3IOlzx4WT2NIiXtEVrMP0GoagjSawt6Chj8CB0DwtnfdMbzzXvghtFeKo04x9J
	ReiDKeZAO/oKFUH5hg/p/2oeUtEPw4Y4DYoAlrmW9kiKUrGI2u17aidLpmedcrGT3+DgYazsM3l
	cWXy7dKqzmQCHmxbEmiNx2X6QmqUS
X-Google-Smtp-Source: AGHT+IFEx8OdICe2iWVaKFmaTDM9y5WPRJfONxEgUkTyX189wA7oj4eE7u9yAmgrJC3PDONXWLAXgA==
X-Received: by 2002:a05:600c:c0dc:b0:43b:ca39:6c75 with SMTP id 5b1f17b1804b1-454b32084damr28968955e9.16.1751643395749;
        Fri, 04 Jul 2025 08:36:35 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b162a3ccsm29397725e9.12.2025.07.04.08.36.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 08:36:35 -0700 (PDT)
Message-ID: <86a1f012-6640-48af-a6e4-0eda7d02b914@linaro.org>
Date: Fri, 4 Jul 2025 16:36:34 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] clk: qcom: gcc-x1e80100: Add missing video resets
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Johan Hovold <johan@kernel.org>, Stefan Schmidt <stefan.schmidt@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250701-x1e-videocc-v1-0-785d393be502@linaro.org>
 <20250701-x1e-videocc-v1-5-785d393be502@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250701-x1e-videocc-v1-5-785d393be502@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/07/2025 18:28, Stephan Gerhold wrote:
> Add the missing video resets that are needed for the iris video codec.
> Adapted from gcc-sm8550.c (with adjusted addresses).
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   drivers/clk/qcom/gcc-x1e80100.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
> index 3e44757e25d3245e455918e9474c978c8dacaa5e..301fc9fc32d8e6e1ddf59c1d3350d84f6c06e4b6 100644
> --- a/drivers/clk/qcom/gcc-x1e80100.c
> +++ b/drivers/clk/qcom/gcc-x1e80100.c
> @@ -6674,6 +6674,8 @@ static const struct qcom_reset_map gcc_x1e80100_resets[] = {
>   	[GCC_USB_1_PHY_BCR] = { 0x2a020 },
>   	[GCC_USB_2_PHY_BCR] = { 0xa3020 },
>   	[GCC_VIDEO_BCR] = { 0x32000 },
> +	[GCC_VIDEO_AXI0_CLK_ARES] = { .reg = 0x32018, .bit = 2, .udelay = 1000 },
> +	[GCC_VIDEO_AXI1_CLK_ARES] = { .reg = 0x32024, .bit = 2, .udelay = 1000 },
>   };
>   
>   static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
