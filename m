Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2014021578F
	for <linux-clk@vger.kernel.org>; Thu, 12 Dec 2024 15:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734016059; cv=none; b=jvwt5GrvzYrvYATd5pLRUtMkcWkxXYkGCVHpWGQ2zlrBJXuF5PFI/URDIovrLGprwuGv/bfzEeI1dQv70olwoutuxdxKRgG/kEEUROqcPlwgf52FQ+6G3Nd0/Vq7ZcrRYwl6dDMeQhnkyzSGxN2fHc3G8zsxLO/IFKUDw3DyB20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734016059; c=relaxed/simple;
	bh=sb6oG9rE63TxzWEPgvSrhTFsRmaz/BfgO/7IjyWBxkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z+Et3QNytairVHE/d213Go1QbSiHMYAna+dnMngHqqiqT16ZvhfZqDO5ZoUPpvDZPLhoXe/CfVR5jpsPV+ceFRbC8JcBPHfUsGM7YIdx+VaNBSclnjJhgxN83qQ25Z6NctKIj3jR4R+f0WK3AOGe1EAORUePFn64HFSWmjX9U3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rdclVWOc; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rdclVWOc"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53e395932c6so106287e87.2
        for <linux-clk@vger.kernel.org>; Thu, 12 Dec 2024 07:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734016055; x=1734620855; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hu3ueXOcFQnrt5GB8STLjO2WhFAqrfft1MBKmKBry90=;
        b=rdclVWOcdvOIpczrCNuPFA4OfOQ6FfGgccisZapbTvdV5eJ8tBXd4P8agQK7c9K2/C
         bXW+A4BlTNvsUxlO4isuAYB48KS6s2BECs20jYdaHq35gOgovDvP2FLu1OQusmjURXam
         VKppx/tiTCDBFMtbLl06FChtJrwdV+M0YVsznn58owshe2H4Y8nGJMFeMdNYtUH8NRK/
         NONqhaOhy9YIE5Xwc9fNE4xb/w6GVKHJ3JXOIh1fwTVXXJ5bLwVJf8M2MSuMMFB5MDRI
         xYaz6uVFQVExjns/XQGusUyW/E/QR6QCCDbqLhmrAuvkmOo4TuLu3Tmw0oKHZ1vQ6og0
         0jrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734016055; x=1734620855;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hu3ueXOcFQnrt5GB8STLjO2WhFAqrfft1MBKmKBry90=;
        b=ZgVuu6Kl7zFrrqPhk1GJFOFqsPGzAuxT0OFMxE+vlICsCqael8O50mYCFpEUsrwc4o
         e4gHo3fvOpcktJqs970djSrb1y9yQZeVFtaNA/2LcGRTqOk1jRU5xrmVdOGS0Q3GTA9k
         MnAEmtht6cbD1SjN76VfbPnBMvSv7FVA4V/tCrNGsslen64fIqHrvghxfaP6Rty2nY9V
         9V7soH44JnMi4eS0tr4IAsJlvN+hjElXZYkTSFGrJ8myvJuFcYr6H62pYBtm7NUdRoi4
         UDc8Sg+DEyuNnJJ2dlrIxJt91OkJuNE93GPL7wWqEDyubI2EzU77REspigR5qU8MEm3D
         XvrA==
X-Forwarded-Encrypted: i=1; AJvYcCVUFtl6e6KEFZ710pQ6jlifWGBcuEtMAI3kr2ihc6LwZhTgop39jXGjXx1Ee3pWbVbTxxF4iX8volY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVxG21w+Y8zn9fpbjaCq2JHxFA/j84CWafY+x+3/RcYFdJzwpB
	GqfuvZE0G3BUaWQbaPQB7YDqlmmxCWLeQ1y7hhrj6Pb+E3PQBAvcwmlNv6FMRVo=
X-Gm-Gg: ASbGnctLtl+AetEJgjo4Kvig9PHCm/6A3cVa9Zl+LAV0IYSNp21AtsA/TXs7J9IH1AH
	3cCUl+kEfQE2CPB8iGPoPE55otiOnxNaXGUHUcK+VcMUxkarTK4YKHubWo8CnRMuOHpg9xytfhs
	pW13KIUXq+xNFTXEo+FDaF9zfah1mr0TtTFL8oRmxZa8l2myR8vEW4ADD6GXJjBqXd5Oy+RBx7M
	7MQC8gxi6wWi8tPTKEsP8qpDSE4d8+fgnCfuj0X6habGHIhLatZmiW1mkao4hK1ufEhV/POxyXR
	ovOXJ5MdphgovabQCSbA6AqlZKQhNmNnNwo=
X-Google-Smtp-Source: AGHT+IE6zBhOzaCS4vwQvWRGk/AAchQk2VGWvcXCo7R4mu53JG2+2MgWawKgUm9kDzPXuy4dX0Katw==
X-Received: by 2002:a05:6512:2342:b0:540:1f67:68ab with SMTP id 2adb3069b0e04-54034106475mr111958e87.5.1734016055060;
        Thu, 12 Dec 2024 07:07:35 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5401b5ef585sm1553996e87.233.2024.12.12.07.07.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 07:07:34 -0800 (PST)
Message-ID: <14aed353-70ca-4cf3-ab8a-b4b1068af160@linaro.org>
Date: Thu, 12 Dec 2024 17:07:33 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] clk: qcom: common: Add support for power-domain
 attachment
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v8-0-5d93cef910a4@linaro.org>
 <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v8-2-5d93cef910a4@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v8-2-5d93cef910a4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/24 18:54, Bryan O'Donoghue wrote:
> Right now we support one power-domain per clock controller.
> These single power-domains are switched on by the driver platform logic.
> 
> However when we have multiple power-domains attached to a clock-controller
> that list of power-domains must be handled outside of driver platform
> logic.
> 
> Use devm_pm_domain_attach_list() to automatically hook the list of given
> power-domains in the dtsi for the clock-controller driver.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/clk/qcom/common.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index 33cc1f73c69d1f875a193aea0552902268dc8716..b79e6a73b53a4113ca324d102d7be5504a9fe85e 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -22,6 +22,7 @@ struct qcom_cc {
>   	struct qcom_reset_controller reset;
>   	struct clk_regmap **rclks;
>   	size_t num_rclks;
> +	struct dev_pm_domain_list *pd_list;
>   };
>   
>   const
> @@ -299,6 +300,10 @@ int qcom_cc_really_probe(struct device *dev,
>   	if (!cc)
>   		return -ENOMEM;
>   
> +	ret = devm_pm_domain_attach_list(dev, NULL, &cc->pd_list);
> +	if (ret < 0 && ret != -EEXIST)
> +		return ret;
> +
>   	reset = &cc->reset;
>   	reset->rcdev.of_node = dev->of_node;
>   	reset->rcdev.ops = &qcom_reset_ops;
> 

Looks good, thank you for the update.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir
