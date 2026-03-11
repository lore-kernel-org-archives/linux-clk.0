Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F843DD526
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 11:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773229952; cv=none; b=fdDjoZ3oQ2k0hbUFqDNpI12W53KL3EVHQaQ71dvv2NrWgqaXhJ8PDdUoNkq1dDd6quZKD+MW8XHGBdXpQ1bvfUQ9FqjEbCJbRZrIJGPubsQeX09xOBANKebrhknACaClw8dfIcEN9uRTUEkWd8bdTjlyv/Hp6hBMfY1nmqrs7yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773229952; c=relaxed/simple;
	bh=zmuII2CE089b9W7EKhXMtxf7CJ6EjO42fT346EMkFXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qw4XopJrqv9VXGvLVD4AgmVyU6wldy9QjpfENF11wvx7BzQeH1ZZkjWgIV5irzjaJjE8ovML4yIEJ0O87CkxyOI20jLdiZrzs9oR5jzYJZZxAGmpcQIzzewTrURkujNydUHoPSJWe8/Jl/3NX0yOPDVeyZNfRw8WrW2ehQf3GAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KpuloH/9; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KpuloH/9"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-485410a0a8aso25919645e9.2
        for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 04:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773229949; x=1773834749; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vww4V7//t3HQWzLUIJi03/VKV6aq+Kc1duLsEXpUW8E=;
        b=KpuloH/967lU1lXWeZpjaIOBgxutQUb4sf0BnkpVewDcl33teo5Yq1cbp27+AXHL01
         HYO2v+v/8zb82KjOVtbhlCqmUqJiWMeBH90MRvCRHde0Grr4vkkS9nX+q762RZaUTfqR
         lF1Y3zFEWGK6rfIrC2HrLscRaarnFovLH5uELH7TM6IbP7NZEpAUw26iWzCrwOpcjjgD
         o73y++M9EWMxGr5rYn/IXtywDP40hxj6ahdOh90yjeF9tn7TPOW1v+kKm0pSqNLbjfe7
         e71No1eRz4zutCTv5GPlVmQkAJcjZhVnsJJvMI97wJ8CCgB9OsuGgkihPVt1GB6DPhl8
         CX4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773229949; x=1773834749;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vww4V7//t3HQWzLUIJi03/VKV6aq+Kc1duLsEXpUW8E=;
        b=r2jNsCNKwtNAdBWEMZfDA93OyueGyhREI2R1R4QQ3CjRZXYxxZrVbhkUNuLaRUcTnS
         09TY5GHklEeRkNdq5lq3v8BRqck6abo4Kc4v5m6r42rvGpmP/5ktXZ5A4TpynQVsagWK
         FuvQyyEiUbU7cltOrl0nFc0kW1Ux7b3pjuX1eShzIdRa8Gw2vFougtetGOzO0zBxUl2a
         TzcoAoMUio8NpbtNP3v2pi8JsaaGpIhbbwREEvOeJ85FxImKjAS4ujJtg5m9b9+5zsJA
         1pUD3B5NUh9vPKj65cOoDSMV7IcGXsE7/EM91NFZtNwEJudIV94hWsQAA1uvZe6Fp7/E
         S6zA==
X-Gm-Message-State: AOJu0YwLQQg3cFabglynptFj+fcMQHDC10midUdLiPF/PV4C4sOkawy3
	Q+WuwhCTOVzbp8o7wfQFrqyIuNdStYxQ+IvgLMh3Ebt3QLeUe9hrgyatSslJP5XTvLI=
X-Gm-Gg: ATEYQzzxjIIzu/B2EJjQ+uPJmqC26p0l24FuaQM5RuouWWavWmQRyxc60zlS1qn2KDD
	rQ16h4iI9nNOdEaXRFO0IwuR3Vh/cxJTzkVIL6WcUssXXtNNqoTlL3e9sqtuFoWIj+rNHhkt4qz
	FpjsyZOFuyYIJ8poiNvKfD1DHQ9pCdAwMCLfCQIvq56IvA2ppXEQtuqLS2e7bm4T2EaPOAthB4D
	XiiJZyS2q/6j32A1A5Dza1ljdKYT71l1kiGqToCYi+lwvHZR5YnvfE8GWA9vlCHN1ElT7pq+lFG
	6wxEBCcqfPTvxi51afM8O3Ge+qq8w/Yx6MWzw5qbNMwqA+jf8ciEGxqrD7SIDQOusfkMlZBs5ja
	Y14M7Z9EAjgmT2KtLFlFyjR95yocBVN6erwEi8x4B7qqDjrXVx2Siiy8F/t4ii3noyUCAdCjspf
	7CEo5uzMp4o6FGEDFERe2gTd84CjqHhn4=
X-Received: by 2002:a05:600c:3b18:b0:485:3d00:f0a with SMTP id 5b1f17b1804b1-4854b0b329bmr37910965e9.8.1773229949065;
        Wed, 11 Mar 2026 04:52:29 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854a307bc4sm31082345e9.3.2026.03.11.04.52.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 04:52:28 -0700 (PDT)
Message-ID: <30142b6f-4578-4472-bbbb-2574f1c0288a@linaro.org>
Date: Wed, 11 Mar 2026 13:52:27 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/12] clk: samsung: acpm: drop determine_rate op and
 use CLK_ROUNDING_NOOP flag
To: Brian Masney <bmasney@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-samsung-soc@vger.kernel.org
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
 <20260309-clk-det-rate-fw-managed-v2-11-c48ef5a3100a@redhat.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-11-c48ef5a3100a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/9/26 4:38 PM, Brian Masney wrote:
> This clk driver has a noop determine_rate clk op. Drop this empty
> function, and enable the CLK_ROUNDING_NOOP flag.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
> To: Tudor Ambarus <tudor.ambarus@linaro.org>
> To: Krzysztof Kozlowski <krzk@kernel.org>
> To: Sylwester Nawrocki <s.nawrocki@samsung.com>
> To: Chanwoo Choi <cw00.choi@samsung.com>
> To: Michael Turquette <mturquette@baylibre.com>
> To: Stephen Boyd <sboyd@kernel.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> ---
>  drivers/clk/samsung/clk-acpm.c | 14 +-------------
>  1 file changed, 1 insertion(+), 13 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acpm.c
> index b90809ce3f882c489114c9d7299417d7fe373749..b79d973eaa0c275c508a51926ecde5349f00feba 100644
> --- a/drivers/clk/samsung/clk-acpm.c
> +++ b/drivers/clk/samsung/clk-acpm.c
> @@ -72,18 +72,6 @@ static unsigned long acpm_clk_recalc_rate(struct clk_hw *hw,
>  					clk->mbox_chan_id, clk->id);
>  }
>  
> -static int acpm_clk_determine_rate(struct clk_hw *hw,
> -				   struct clk_rate_request *req)
> -{
> -	/*
> -	 * We can't figure out what rate it will be, so just return the
> -	 * rate back to the caller. acpm_clk_recalc_rate() will be called
> -	 * after the rate is set and we'll know what rate the clock is
> -	 * running at then.
> -	 */
> -	return 0;
> -}
> -
>  static int acpm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>  			     unsigned long parent_rate)
>  {
> @@ -95,7 +83,6 @@ static int acpm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>  
>  static const struct clk_ops acpm_clk_ops = {
>  	.recalc_rate = acpm_clk_recalc_rate,
> -	.determine_rate = acpm_clk_determine_rate,
>  	.set_rate = acpm_clk_set_rate,
>  };
>  
> @@ -106,6 +93,7 @@ static int acpm_clk_register(struct device *dev, struct acpm_clk *aclk,
>  
>  	init.name = name;
>  	init.ops = &acpm_clk_ops;
> +	init.flags = CLK_ROUNDING_NOOP;
>  	aclk->hw.init = &init;
>  
>  	return devm_clk_hw_register(dev, &aclk->hw);
> 

