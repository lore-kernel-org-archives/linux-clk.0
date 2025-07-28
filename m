Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B85212B2F
	for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 17:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753722667; cv=none; b=T88okCvcKQZ672cmWXXwW3HF/H/Dzn4P54F0Vth2WXi7dBUpLghT7qdkPP9fPyRASDmzuZomMgk6KpuC8T3gfD3FNYlQNajf9VSuVR+yTqf7QwmI6ndD0ytlqlIBuvmjAHnWHcmCzpN1xlFkqt9ZTOf/NaQ8PBNweE3yK1stvTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753722667; c=relaxed/simple;
	bh=bKx7T1DLQcbdvNXKkdxjhh9o20FMdCO0YBI0USo5qRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mO9Qsk1kJCaXXxR7ToKtecfHFxt0PRV6Z+rI8EayxWmIKpHPF7xQdF+FQ/hTTei85zi5tHSi30SooVQ6tTBRA4A/o7RI2l24gE10NqMbLmZydYTEVPNGUxn0P7UjTGbp+UTSEQAtCV+61y+oyCJl3FCZ650Arr6qduNROH/v330=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WxAHBuzj; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WxAHBuzj"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ae0bde4d5c9so911807966b.3
        for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 10:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753722664; x=1754327464; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QR1arBx0XvaSp1oUXc3PyontAThuSk/8jS2zweGYDNE=;
        b=WxAHBuzj/5k9vPu0wCo7mPeSQvYKrJIm7erozXLuNjSfF4PmjuO+72WfufvbcrFhiI
         JfUCB+W8t0wtkf9OogyKUFcHiAMjTQlMAgG7sjW0DriH87kFpSC1Giv+5D+nB48ql+9+
         LdIc308cu3Sp7e28RA/kHTbHNOOXRRa/p6FIwlcFsTAqRg+4YHrfI2k6jMa7Yx/yZsPZ
         wmq351hrSbbf5sx7Ew3qor4YTG22RbC+GMvcKNkh1AOIj7xlED5HOJRQee9lNswW2Lhq
         fU3NaIbo3ZTejCgXB5oEn0Y8FTu4ImiZYjd7PnGzZ8bxvIF5URNuYTu5HrIIGStV9bQ7
         ywmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753722664; x=1754327464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QR1arBx0XvaSp1oUXc3PyontAThuSk/8jS2zweGYDNE=;
        b=Bo2hgbsG/QFIBdngRBvCCVpEB26lyu6Ie8xxC+1qTXdb1j5o5ftYkQLurTsZ+xgnUK
         ul9qGYocAhYhs0ovGKkyYOi8p3Etlx9bhhlJy2F0JgjQVvCSnhbENLsZcHPk4iACv/Of
         Q7sIbHsXOfnct/sfrPo5DvBjMR4NQh7gBCAh5GIoUgGO+cfkrTxUBUJaULx0E1H7LAWN
         zuNBJ2Cqv3aCHfX3xB7r9dxFf4WgWpRJwkgyFkJyefRh7MCM1aCpfLaynCJe7tHHxUSc
         iPbO3ZX2/RySP6LzXZ7PBNtSsJesqsg3IzpRV/gxBRE2pDbS/SDKEy2qyQ9fynJNWKrv
         9WUg==
X-Forwarded-Encrypted: i=1; AJvYcCW8X11lClJBcSA9lbdyvrt0FitkglUc7jcBel0999M4WiaEjrLfJC5MmeKpfiVa0BrB+jZtHzFxGhM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT4zuZ2XLcl/M6tYCetAK/Cb4TgWjcPMJQjxJ9Gs2kFy2nQj5h
	pBrL1F3MRFDZ4DCj1XTkDPWtP9tF/VCUX1dbx6gsijMo3S3K1X/lmn8hUAahL1dNkDc=
X-Gm-Gg: ASbGnctt0fy8D8+tupJT7TZL1CHiJmsqmz+K9VL5gVWBQX1Ock48pci+zViqmPc5+4w
	BZ514wGdyfkf2BGoS9IJcaZ/M0Hn1rulSH6prTTD4VXSaENHqwwlbq4jyTzX+kMJs9qcjVK6QJI
	lz3KWhgsNdeiOwq6qMMCrXmiEgjI3Es3704VONeAaO3775rnHmI0eTlcWxx5wk6Tct8chWAj3kb
	p1rr4vNCBScGVSStmBFX5RUuM2I742sjFwyDJkT9LX4r3j9sn0Tls4FlgDM1+HSMBP6SqUCjn9Q
	sXBmXgbCUcsqSB1YWtD7sIJQK3I9H/MkP8zi0tupgHqqkIHVtQnHNJNfKWDie8/7TSIHXH25aXX
	Qqs7R1y0BX7fzw8ne6q8yi4Ge948PR6ug6g==
X-Google-Smtp-Source: AGHT+IFd/ukbJWEyAyiMoVr3cixjoIXsXy8y7hQtFjRtY748SHCa7Gi1Pqlg3oMU0d8uaJRO6rYQqw==
X-Received: by 2002:a17:907:1ca3:b0:ad4:d00f:b4ca with SMTP id a640c23a62f3a-af619a0795cmr1251448066b.50.1753722663537;
        Mon, 28 Jul 2025 10:11:03 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:e460:c4f3:f28e:97ef])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af63585ff5asm452983566b.11.2025.07.28.10.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 10:11:03 -0700 (PDT)
Date: Mon, 28 Jul 2025 19:10:58 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Douglas Anderson <dianders@chromium.org>,
	Vinod Koul <vkoul@kernel.org>,
	Richard Acayan <mailingradian@gmail.com>,
	Andy Gross <andy.gross@linaro.org>,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Jonathan Marek <jonathan@marek.ca>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC 24/24] arm64: dts: qcom: x1e80100: Describe GPU_CC
 power plumbing requirements
Message-ID: <aIevIuMDA5R8igmi@linaro.org>
References: <20250728-topic-gpucc_power_plumbing-v1-0-09c2480fe3e6@oss.qualcomm.com>
 <20250728-topic-gpucc_power_plumbing-v1-24-09c2480fe3e6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728-topic-gpucc_power_plumbing-v1-24-09c2480fe3e6@oss.qualcomm.com>

On Mon, Jul 28, 2025 at 06:16:24PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> A number of power rails must be powered on in order for GPU_CC to
> function. Ensure that's conveyed to the OS.
> 
> Fixes: 721e38301b79 ("arm64: dts: qcom: x1e80100: Add gpu support")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 5e9a8fa3cf96468b12775f91192cbd779d5ce946..6620517fbb0f3ed715c4901ec53dcbc6235be88f 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -3928,6 +3928,12 @@ gpucc: clock-controller@3d90000 {
>  			clocks = <&bi_tcxo_div2>,
>  				 <&gcc GCC_GPU_GPLL0_CPH_CLK_SRC>,
>  				 <&gcc GCC_GPU_GPLL0_DIV_CPH_CLK_SRC>;
> +
> +			power-domains = <&rpmhpd RPMHPD_CX>,
> +					<&rpmhpd RPMHPD_MX>,
> +					<&rpmhpd RPMHPD_GFX>,
> +					<&rpmhpd RPMHPD_GMXC>;
> +
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
>  			#power-domain-cells = <1>;
> 

To repeat your own message from a couple of months back [1]:

> You shouldn't be messing with VDD_GFX on platforms with a GMU.
>
> Parts of the clock controller are backed by one of the MX rails,
> with some logic depending on CX/GFX, but handling of the latter is
> fully deferred to the GMU firmware.
>
> Konrad

Please describe somewhere in the cover letter or the individual patches
how this relates to the responsibilities of the GMU. I searched for
"GMU" in the patch series and couldn't find any note about this.

Also: How much is a plain "power on" votes (without a corresponding
"required-opps") really worth nowadays? An arbitrary low voltage level
on those rails won't be sufficient to make the GPU_CC actually
"function". Do you need "required-opps" here? In the videocc/camcc case
we have those.

Thanks,
Stephan

[1]: https://lore.kernel.org/linux-arm-msm/2dae7d88-4b3e-452f-9555-05f10b42dabc@oss.qualcomm.com/
