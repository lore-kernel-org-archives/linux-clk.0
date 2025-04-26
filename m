Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79EA8489
	for <linux-clk@vger.kernel.org>; Sat, 26 Apr 2025 13:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745673886; cv=none; b=WKqEOJe5lkPqSZMN4RFlbaRWIjrB4qYojxn1esx44c5UG2pHzi17coZmnx2mBW7oliAlE5ZelPk5KQNEjNyTM1z9T35w/9+m+Rcx5sMTdnB6jefsR1xkjCtQYl/4ipYIQ+nEjxjoJlMAALEA4tWR3uI72lnoAfZkjgsOLg4x0eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745673886; c=relaxed/simple;
	bh=tZrzBs+5KSTISL0+0tdu476ycFVsQ3yWPlqzvxyEX7A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Enxxv2icrTZLlF1dcAAW0bQRbHtElHmlBTtiWr9HvMOVXIgUTw7RdavN/+DONYBE9kMCTy4ETyId5dtaRT6qRFFMEVFVAgZsemsHNbe36aPaTcop42n9fOJv4OSlxzfxYt9oqUaGA6sOyYVnb7mqXh2PucyDYMxsIvy09GjlI8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LylrYFqX; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LylrYFqX"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30bec442a25so4347491fa.3
        for <linux-clk@vger.kernel.org>; Sat, 26 Apr 2025 06:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745673881; x=1746278681; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QQG9jLEj+tO2aSttA8hsqJxeNwgpKy02jcXHZLWHWYk=;
        b=LylrYFqX8JhaoKBD1OR5rnbi78J7tgG3jhwf3v5L3tFuV05WDL0hh+2stvRHXAGOFD
         GofCscA0q9i7Pvg/UuRgo883100VjDP75zgN8XamvwKiytzxHU7S+BtLFo5frYe8vq7B
         wz2st8KbVlNUVDg7fprZRP8weM7erdFtFkZSTOgUz9N7vc9CyQZNLxmkxVwbOw2PeXw1
         nhOdtybEBqXsQPdOPgiA3nHCnktsazLVqbhMnaY1W7L+mLXB6W7usx0LQVnwu39DgWiH
         AdewOSgz7aGWS92K0SsVBBe/qap2ahrakhAD43EkJB1hoEbRQawEWknqV3T9hngRvdmN
         bOXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745673881; x=1746278681;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QQG9jLEj+tO2aSttA8hsqJxeNwgpKy02jcXHZLWHWYk=;
        b=ZcV22w6NDInwnElld6YA8pjzju9WJnJFfJQhFQCe/aGrljxeem+8JQ9jcuyW6dWby2
         pvkID9YEIo/BFEAo1J8Sk7V3tGXfWXpWUKcl0vpRNP6b6mr9k8mtPypbwIuYk/2lL6wU
         BIsCmXx+dKvmjY/5LteaqJAw7DwBs5tDkNNpeM8qhoDkOIilTQtiqQkHZIKHtcxArWS+
         etC7Qq9HelNBXIY72bk0dmQ+3G5Yg+xzGvPexgVamRBkgqWzozdVV5VAE5QMUXDrDQ6U
         Gn/sZmTuNwqxzM5d5PGSrtv2/pXdjfa+VGznDw8CILwPacKAAGM/ciRVEkn2YeRfR8MC
         m3tg==
X-Forwarded-Encrypted: i=1; AJvYcCWoG7rtO+ZhZgnq68YJlV1IYeMXzRG5pi1iIiWQgnYnhtK5t3PRx1vquyFIb1S7IB/crzKEF8/gYnY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqSP+5HjsmQHXG8p2wkCEo6pW5212U8CLx8BZ4ERVLjj62Jj0O
	DMwWqcNHZPE5WpzMis4WweZXHbZEZjWiiFKIKDHt3H0gaJT+vqV53lGSsYOxJ1s=
X-Gm-Gg: ASbGncsurwtf/YkinjZScsyJnrrFKxAVgvYgQ0lGNZWL8dA9k/nDuvrfvIqd3vigETR
	Dx0RyJJgSBWtxHis+ATzkGi5dWczt0C4mDnaCuHJfnKi3VGu1Tex+49y8YTmSnZIeGg97matfTx
	cX3oDlEOqIqpi7MYZe9gRam9oqfFTBfA39O6uLoy0ISDrG+Em7aCH0MFKifVa0USP6PV2bSTC0C
	yetgrA77vlNPMnQ2plZgo9zhiS9192eA3cTrSzshC4xqlAl4xeJBazXTGIghahxPE5i5K74yPd3
	0mlV/8uHPYiHHPL6QQi8qPe6zUybMYDbA45b2vSvYIDhpOpPdBTgMwaLhxqFOcWqvGX806uV2au
	VOEFItx4xWcDbkK+Yc7BeLd2klXQVcQ==
X-Google-Smtp-Source: AGHT+IHb8l2addQYB4al3pbhLlsunPxduYsEgASDcksjCU6KVJAuZBA2p82b2h9QpR3+htyHY0Fq8A==
X-Received: by 2002:a2e:b891:0:b0:30b:b852:2f5d with SMTP id 38308e7fff4ca-31907ed64d7mr5838961fa.11.1745673880982;
        Sat, 26 Apr 2025 06:24:40 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317cf659e34sm12460111fa.22.2025.04.26.06.24.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 06:24:40 -0700 (PDT)
Message-ID: <83cc86cc-2cdf-41c2-8e00-61a607b713d5@linaro.org>
Date: Sat, 26 Apr 2025 16:24:39 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clk: qcom: camcc-sc8180x: Add SC8180X camera clock
 controller driver
Content-Language: ru-RU
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250422-sc8180x-camcc-support-v1-0-691614d13f06@quicinc.com>
 <20250422-sc8180x-camcc-support-v1-2-691614d13f06@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250422-sc8180x-camcc-support-v1-2-691614d13f06@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/22/25 08:42, Satya Priya Kakitapalli wrote:
> Add support for the camera clock controller for camera clients to
> be able to request for camcc clocks on SC8180X platform.
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
>   drivers/clk/qcom/Kconfig         |   10 +
>   drivers/clk/qcom/Makefile        |    1 +
>   drivers/clk/qcom/camcc-sc8180x.c | 2896 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 2907 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 7d5dac26b244bfe785370033ad8ba49876d6627d..42b64e34b3fcc4bae7c559f34a34f9452307ae9a 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -900,6 +900,16 @@ config SDX_GCC_75
>   	  Say Y if you want to use peripheral devices such as UART,
>   	  SPI, I2C, USB, SD/eMMC, PCIe etc.
>   
> +config SC_CAMCC_8180X
> +	tristate "SC8180X Camera Clock Controller"
> +	depends on ARM64 || COMPILE_TEST
> +	select SC_GCC_8180X
> +	help
> +	  Support for the camera clock controller on Qualcomm Technologies, Inc
> +	  SC8180X devices.
> +	  Say Y if you want to support camera devices and functionality such as
> +	  capturing pictures.
> +
>   config SM_CAMCC_4450
>   	tristate "SM4450 Camera Clock Controller"
>   	depends on ARM64 || COMPILE_TEST

Please add a new config section preserving the alphanumerical order.

The new section should be placed between SC_CAMCC_7280 and SC_CAMCC_8280XP,
like it's correctly done for the Makefile below.

After fixing it:

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir
