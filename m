Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3CB22308
	for <linux-clk@vger.kernel.org>; Wed, 20 Dec 2023 12:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YvQWosS+"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-55114c073b8so7053263a12.1
        for <linux-clk@vger.kernel.org>; Wed, 20 Dec 2023 04:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703074615; x=1703679415; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WJkVBfoxiqD1PlLE/3Y0GVSjWqb1nX3LX/NzhLRh3Cg=;
        b=YvQWosS+a1pLj4fJlHjZuDyqfcmBf9zOTTCc1dT0hEZI7ZHI1gft5W+MK3Vz7+pncK
         +gDUmIxo5MjhV1THYFt/h+U7Q3aXXTJoEVUu7INdMzGA7DscSsLByKGqTvafDBQG91Ks
         hK0mIDVsBO4vL74p2gAeJgeduLH0gTLmKmvnBILf4XWLF8PMYxOE4/seb7yOuzqqS2qq
         A5GEqRnfGHMV2qlGA+KdoOcW96KKsECJs6WkdtgvlBj2WEGYXIoT7+BwhXgqdBppAhEF
         mJ5q2+B7trS0sguODcXDkXoRxcR6nF4LikvDLP6JBKYrBcQwPXl4g8DCe5i8M2Aaxm9o
         Prcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703074615; x=1703679415;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WJkVBfoxiqD1PlLE/3Y0GVSjWqb1nX3LX/NzhLRh3Cg=;
        b=ajEz3ubfJso1KiWZm7jyO60UI5J2yLw1Q4Ek5Vq4DwbQTZ1kVEejpX6CbLsCrSKqi5
         LHUl375ReGv/nEEllkc9OGsKKGWdTOo5pCz+pG7Jf9YP1qHG2DxjBYAEx+1Xnvshtmu0
         XA5KEN3t6qivCdG0ArvO6HOxIOxc+G4ho6RNnw03Y1ntqYhUS4nQNjjIUzkTkGuqdUXa
         V3caeqzv9zTsjr8Vc5XvO/j2k2S73a711yABzpzGzg44YCAPO/TMDNagpJXDHnsDqgCT
         7VuGMyrVTGiyCw4NavY3FkNeTWvpLTamVzSGdBznnG2TD2Hz4oESLm4BfQUwHswo5Wdo
         WDdA==
X-Gm-Message-State: AOJu0YwGcu4A6i5M0Zc4cH7wnCqC7r4U5FOiONgq32P69Qa3JucKAEg8
	s5szqEm/tkyjTYeNeddTbTPKkA==
X-Google-Smtp-Source: AGHT+IFFTuhLgBZZKdbxw5Sp6toPpZ9bSkrJeFFdwbJwxdcpjwEmHJsRoUzchw9mqzzZfSQvnc5DEg==
X-Received: by 2002:a17:906:1c9:b0:a26:9924:cb1f with SMTP id 9-20020a17090601c900b00a269924cb1fmr182461ejj.141.1703074615239;
        Wed, 20 Dec 2023 04:16:55 -0800 (PST)
Received: from [192.168.199.59] (178235179206.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.206])
        by smtp.gmail.com with ESMTPSA id tg9-20020a1709078dc900b00a22f4736312sm10030738ejc.129.2023.12.20.04.16.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Dec 2023 04:16:54 -0800 (PST)
Message-ID: <9ebf0185-db0f-4395-b587-66fdb65e7921@linaro.org>
Date: Wed, 20 Dec 2023 13:16:52 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/15] clk: qcom: Use qcom_branch_set_clk_en()
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20230717-topic-branch_aon_cleanup-v3-0-3e31bce9c626@linaro.org>
 <20230717-topic-branch_aon_cleanup-v3-2-3e31bce9c626@linaro.org>
 <ZYKk6ohfkHpSIJN7@hovoldconsulting.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <ZYKk6ohfkHpSIJN7@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.12.2023 09:25, Johan Hovold wrote:
> On Wed, Dec 20, 2023 at 01:30:43AM +0100, Konrad Dybcio wrote:
>> Instead of magically poking at the bit0 of branch clocks' CBCR, use
>> the newly introduced helper.
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
>> diff --git a/drivers/clk/qcom/gcc-sc8280xp.c b/drivers/clk/qcom/gcc-sc8280xp.c
>> index bfb77931e868..1ba78990b9f4 100644
>> --- a/drivers/clk/qcom/gcc-sc8280xp.c
>> +++ b/drivers/clk/qcom/gcc-sc8280xp.c
>> @@ -7543,21 +7543,15 @@ static int gcc_sc8280xp_probe(struct platform_device *pdev)
>>  		goto err_put_rpm;
>>  	}
>>  
>> -	/*
>> -	 * Keep the clocks always-ON
> 
> I think you should keep this part of the comment in some form
> throughout, for example:
> 
> 	/* Keep some clocks always on */
> 	qcom_branch_set_clk_en(...);
> 	...
That's a good idea, it may not be entirely obvious for first-time
readers. I'll include this.

Konrad
