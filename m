Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7533FA5EF
	for <linux-clk@vger.kernel.org>; Thu,  9 Jul 2026 10:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783592310; cv=none; b=bK67dih52ZTyqHrWmDpxfpYSUmJcxbbxEtQGJ+JFSUbdF+oZpSh+Pp1lCxEMOASqkI7buihducgJ4BfIV1Y20ry30eNVZdUsKV25/LQVYjY0IH+Q2VPOXz3MzrSiQkt18c2c4W2o5ySe6ZL/Jy1oEJxH/TsZ/vXAn1WAXMpEKiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783592310; c=relaxed/simple;
	bh=yaj0W5X6oCbo4WUumWzVBVwkSEBMzMLAlQ6ucjWEMFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cMvi3YvGA/WE9CJgGA4bPj8qjUfXE+OXTEXwC6T5cDtAEWXdUMeniVA6JzcIhd9iWlQLm8gNs32ggWMWus4YWjt+80N7jJ1EBEShjkFF85SPFTzLuYJM9lje4fjxZ13pJ25YMv/h3/VLwVxGJRTrI4V8KhYagjF8gtyckIG/CrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fyb7d6Ju; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fyb7d6Ju"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aeb99bc721so179542e87.1
        for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2026 03:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783592307; x=1784197107; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zrROiXI0zNUVTumAeHoman/juLPQPZ/xLG3NWye+Z/c=;
        b=Fyb7d6JuGilbcpyaQj2EFT5YTxZNFhmWDMD7IAaQ4m7antd4YUJ+mmbnARpRawgm3q
         tebchlo6bQ8mcMikjqs2+92KovTTEsWsN6aGLp3lI0rqyDsvvAlilt6YYqXTaE8xvGMS
         qmCZHEnLT/CPrk93aJgsWF58cUTe0zW8thZUpdb+U9BpMipZhLPVnymNicwCRrduCka9
         BzjX6/MnjX22GGp4WePCwEUo62I1YuykEei80m4mcwMVoEZkIFeWcKEWS/Cf5ntE0I8F
         8aie6gvXzTdya8ZZPy2XewjxQwBeOBczeP9sz4AAUC2C62IMab1+eRPrkTkfT03bbax7
         AXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783592307; x=1784197107;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zrROiXI0zNUVTumAeHoman/juLPQPZ/xLG3NWye+Z/c=;
        b=dtTDl8EQop+4LVyhY2wyzb3NwG+WTC7RPb802lU12fLgjkjxTNSiWl3gaQ3zb9INFS
         qZkt19s5raH6DaGrUhFBq+kEKaAEH1XyUKvMXsuFIXHZsYtLhxha70oCBA+ii14LUVOH
         2WC1ElNnDGNn5AevIzsdGCGNcnnNd+QMtxiyn4GYlMNUlRkCM3IQ0skgZB1tXrMUaOE+
         GjInc7WflSpqD5FTDLvGsStqEK8MFGwPmcFexg6keH4w6AQqiM2Pa0MTeH5A9SOts0I1
         XiHtJN9R60GDqdr9ryQ2Om5uNYv5yTzbO2bLx5LmzSp2OGaONkVYwTYK9W5pDYwCfIPt
         Te7w==
X-Forwarded-Encrypted: i=1; AHgh+RoYKZNTkEOS6bGmPxGhJdxRX+1KDfgA4LjIQ41DrlXSGlxUDxWJYaz049pRIp5f7kmEXY8vbiGi5bc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIkKi/q+3KqPZpmX92gEVVb09dfUL/ztr8+OoJG7FF10ZxUIG5
	jQvGX8/8Pnx5cv8vsnTbDEp/2Dsz8uC5bfXD6dNIcns40hBn7txeWvaYI2qiHrGQ+c86W8i5J6V
	zOxBpWpM=
X-Gm-Gg: AfdE7cmmMGUwGfHEx9ar5o3AJbdKaDtojPtvA9qgu8wBha7TQOgX4L+FWiQCr4X8B8i
	IU5DfCCKUb3qmNjzNXOjE+gVks4FeYRNzBVk8Vewtwrwjz9/BjyGXfi0XLfapGUxz9x7qFBnUCy
	db1RqCwvIiw1rWqQdWyD4a/dYczWfIuzoXIWSW1fcUPeviK7cOT6nLa9CFR8wXKaOgsNm6N2APl
	91SgvXRH93+wRFFUHOqtg5azHPfL9NORCXigCf5CrCR4TcbFd805zTvT3mupKuSfjVj7jTDtdZK
	Grbg2r64SBvVKm9RRgyVTSzrIM/5fLBzES1NjkgSJxv+IwUjr6bSqnmrn+5RqC/pE5B8qtoB0e/
	PsVisz+S9ag8En6eziiAnpSt/QDCOdV+iNteOWRLFFkiBQL2k88Evu5vVJF8abzpJtNNwENh5if
	o05quJiZqRcqxHUGdZpn+/gRURW8lJP5HPpW6X/8o4fi7VIu8IHFhji8n3QvzoHAf+918=
X-Received: by 2002:a05:6512:a351:b0:5ae:bf93:d65a with SMTP id 2adb3069b0e04-5b01552c6bamr289400e87.7.1783592306874;
        Thu, 09 Jul 2026 03:18:26 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b0151b89cfsm531244e87.14.2026.07.09.03.18.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 03:18:26 -0700 (PDT)
Message-ID: <89cc9f43-891d-4ef6-948f-37341c04411e@linaro.org>
Date: Thu, 9 Jul 2026 13:18:25 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] clk: qcom: common: Register reset controller only
 when resets are present
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
 <20260708-shikra-audiocorecc-v2-1-b320d822cdd0@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260708-shikra-audiocorecc-v2-1-b320d822cdd0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/8/26 21:25, Imran Shaik wrote:
> Some clock controller descriptors do not define resets. Avoid registering
> a reset controller in such cases by checking desc->num_resets.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>   drivers/clk/qcom/common.c | 24 +++++++++++++-----------
>   1 file changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index eec369d2173b5ce24bc1ca860d2ac1bbdce04524..be9b6ebb2fffde05e3f209571c53b601d823d479 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -359,17 +359,19 @@ int qcom_cc_really_probe(struct device *dev,
>   		qcom_cc_clk_regs_configure(dev, desc->driver_data, regmap);
>   	}
>   
> -	reset = &cc->reset;
> -	reset->rcdev.of_node = dev->of_node;
> -	reset->rcdev.ops = &qcom_reset_ops;
> -	reset->rcdev.owner = dev->driver->owner;
> -	reset->rcdev.nr_resets = desc->num_resets;
> -	reset->regmap = regmap;
> -	reset->reset_map = desc->resets;
> -
> -	ret = devm_reset_controller_register(dev, &reset->rcdev);
> -	if (ret)
> -		goto put_rpm;
> +	if (desc->num_resets) {
> +		reset = &cc->reset;
> +		reset->rcdev.of_node = dev->of_node;
> +		reset->rcdev.ops = &qcom_reset_ops;
> +		reset->rcdev.owner = dev->driver->owner;
> +		reset->rcdev.nr_resets = desc->num_resets;
> +		reset->regmap = regmap;
> +		reset->reset_map = desc->resets;
> +
> +		ret = devm_reset_controller_register(dev, &reset->rcdev);
> +		if (ret)
> +			goto put_rpm;
> +	}
>   
>   	if (desc->gdscs && desc->num_gdscs) {
>   		scd = devm_kzalloc(dev, sizeof(*scd), GFP_KERNEL);
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
