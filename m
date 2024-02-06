Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08EE14008
	for <linux-clk@vger.kernel.org>; Tue,  6 Feb 2024 19:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707246349; cv=none; b=NMjG7Cn1Arlkzd4GKQxnKJTHbi4HAXt9NReA09uYFuXseaxDoed3Vd2Toi9mUf0+BzRO7YnqXfoWFOREn1hkYEiuhcNh5VAOJhw+zFq7wycsyhzpMbsXVNz5QufW9G1sP0MWNdkQiGm7ZLDmpouJuLuJz1o805h0InKm86A9XT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707246349; c=relaxed/simple;
	bh=tLf76VBI47i8mxSjWIyp4XFB2x2wxC+BdrM9gEPh+d0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pcbK8+FMEx589JW43pXp6O1hNiC2AWwzbfbM+UKV/aDrFxdCUxCxMnH5ScljRja7NnKDzvj35yfeZkdCXij8/FD0WB1z+GJRROdO63BJXOf0/64l1Ju8jHZOOxgDWOzda6JH70tjzAZfgsNHO/p1cTB/y4WBVmguprv9lNEjjRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uoxxFw/9; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uoxxFw/9"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a36126ee41eso760261566b.2
        for <linux-clk@vger.kernel.org>; Tue, 06 Feb 2024 11:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707246346; x=1707851146; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZBBrwB9U9Tzxgi3TNto8OnNlGgI+IEs5RhRkUEill9U=;
        b=uoxxFw/92oIBheBPOdi/LT3g37i7RMwn8kE8TS9Uc/N69EgTQL6IxX8+qzeBz20gXw
         MQpvBKil6Wb9AfOxeg5yVXwjSsB21nFSrV+qemKT9j8YSvbB7SIQqpK5GVNjjhOwhnja
         GiI65tL2nbxXJZeG+7m+jbiK2yPYeHyynslx++HKWEmJgvADYPhNwZmvEfJ6VfLrKt+j
         ZZ7BDBQnjh79v2vTHsSbUAsiDCkrNYbP3NO/HmzWILaZVCHXar6Qap7443iIIfP4sG5c
         xNGqpxAOIIaXiwPscXVyDILFpoPR5z254Ld/wq540kw//xIvmzjnpAybKV4lMGiGDPZv
         /KRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707246346; x=1707851146;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZBBrwB9U9Tzxgi3TNto8OnNlGgI+IEs5RhRkUEill9U=;
        b=nQQSBKvCSHDB2iJWgfNZImXLUIfaF/90m367vSNyOVEybL+Ko13ms0IlX0/rq83+Uc
         650WKg/qzKpHX9nAL+ncySH99Xz0PW2nmJ/ZgrHx4DayYOCS4v4R+oRjEBqT4KkGWpss
         sznJh+Om0jZLFcNJghNQfgmtKid1TahfUQuPYfL/A0XbZJ2+ZyZZbgUgd37ONpwPc3JS
         Apc7D7usVyOUnR90CRxMGCtAxZvmPZFdZoLRPErgaMh3+x7arrVKF4hEHpoc0DF25neS
         any4zsiNobNgfP99hJhszPR8JCquwnH2NJjl+24rxSufUESCHb3C2LeuiMIbnD442rzW
         mnqA==
X-Gm-Message-State: AOJu0Yw0gB0pBr+Acn+Xvv2xAm34qQj36c9sZcm28jl6f6LnFGR05puv
	NOEEAoOUpaxUT2dPpT7acPN5v6+PNqEcBIqiyyf+5val5Ev4D29/PJu2eLXAS2I=
X-Google-Smtp-Source: AGHT+IHiJ8Vgyu3EUuS24F5A0uJMHF2x9uqJ2+uExidU5sLJ2ig9I8AI5oemZAdP2PqlthiCTdNHlQ==
X-Received: by 2002:a17:906:b886:b0:a37:b9ed:33c0 with SMTP id hb6-20020a170906b88600b00a37b9ed33c0mr1951512ejb.16.1707246345877;
        Tue, 06 Feb 2024 11:05:45 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUhzBXKGh/P2ZmjocoTlK/0ka4ppH4v/HcTDfH2u3QstaBlB7S9iPJTEypHexGSJ166RHv0+U2hpi3nsK3nU0K6+vbk7OfowX2n1Wf50IDvfq3qS++OwTIY+IgVsPSQYpo7wgW30MiLc9xE77z1IuEwGkPJsmVRcKYWnk7S147IStOcJG9Z1iXbv5cip3LTKvxqAJHGQelGL6RSojHzWlc+lw==
Received: from [192.168.192.207] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id h16-20020a17090619d000b00a385535a02asm224018ejd.171.2024.02.06.11.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 11:05:44 -0800 (PST)
Message-ID: <baf5e695-b03e-4a66-84a9-cfd3199e2065@linaro.org>
Date: Tue, 6 Feb 2024 20:05:42 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] clk: qcom: camcc-*: switch to module_platform_driver
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20240206-clk-module-platform-driver-v1-0-db799bd2feeb@linaro.org>
 <20240206-clk-module-platform-driver-v1-1-db799bd2feeb@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240206-clk-module-platform-driver-v1-1-db799bd2feeb@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6.02.2024 16:25, Dmitry Baryshkov wrote:
> There is no need to register camera clock controllers during subsys init
> calls. Use module_platform_driver() instead.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
