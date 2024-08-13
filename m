Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC7A2E416
	for <linux-clk@vger.kernel.org>; Tue, 13 Aug 2024 20:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723579313; cv=none; b=mRVGYo5+dikeTu0YCRWrvxuf9QcgL0cZoP5fWxXmzbJuZDCy7kBISfpRaWshLDowAdd0h3LuZLfp7LPW3XoWv7WsV2sz1lLihXFOLNoOCnchJu6bOGi++Y9ugtkwcwI97n3kqwLI187odbKEw8/r/Q2S3UoL6LLHibT5On4cBv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723579313; c=relaxed/simple;
	bh=S4mnivLfaC6CBnZ9vA9MBqgg+x+E3rHUM2iJioJ/fN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rML0ZeMzyHXJIML/3hWQwSHj9AV88ZrbVBIotaBYqZUGJ66L96AhqhL4y3ydCgZayVt7A3x1gT8kJqbtn+xKUlcRkwjBAsHlXfLvopATpJE1wjg14RBxeOYnfcm0pq4OYQpO/tVVi64vVB/VanE8kvthd+t2vZ/y6eJRN98Tvpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hEbU9YwA; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hEbU9YwA"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52efcbfacb9so589848e87.2
        for <linux-clk@vger.kernel.org>; Tue, 13 Aug 2024 13:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723579309; x=1724184109; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=05yxfIPzb+vpmSjZ9OYifCLd7i3CDlpKM0BKHiz5UCQ=;
        b=hEbU9YwAuUKEftUXuV5Hih/D4iujHrKgJD7aCOnvUZVpV+M1VNa1uI/kLLCb+8eqcs
         RGfSExHXxDzFpu+wrLtZqJpDN5TAyF5nTJ73wRAeX8ioBL3b2c1DeozK2pbdtHs9oV/Y
         HcO7zUp+POE/9/xJQznPmMSVoQ1XTsSQDzF+71B2lFUu+/b2tjdVRUBSiwpz8IA8QWxo
         nckSm2rpk3DMxCsW9hrzZWghB2RYdVlfvdb+ZAEF8sPPkX8XlyI+ktMxtsfGejxaObNq
         z+yjn5u5JfOjYgLxD9d9xEOLr54mUJpTFwKLmDkVqcrOcSiHDgiewsBJr3xh2PVfh9M5
         tgFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723579309; x=1724184109;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=05yxfIPzb+vpmSjZ9OYifCLd7i3CDlpKM0BKHiz5UCQ=;
        b=eSXvpae5EHaO4kU8aGc6MrJcvbbYWAPc55cF5uo5xEpJo+zsW0vPWqFIkOjLnoiKhk
         cnyX7jbK1mQdfIZdQ/2F3fkLKL54cZd7sNtEEQu8lGtfHeezKyJd90UT3OA6ZQ8kdzjd
         vq5QdX99P1oXJjsGVvwInFSJTBp+EBohe02A/SNDeMamy39cW2ri2n6VJ17zwMAStiQO
         2410+LwmUzAcT0iy6Or/u0fMDezGN0YbgCuIiOCrZmt1NgtncH1rsxlfUkNpfOyrUmMk
         rWz5nK5fr2LVzN6T/7ql1cpDujHJP/ZgneD+P36NgnETFm8vs1KnsvGit2eHpfeXTp55
         dXvA==
X-Forwarded-Encrypted: i=1; AJvYcCW/8tdyhpHaxLKe+sw7y7V6/4OF1z49afAIwhNhuyDfLO/Z+o3Pf/YSDdRrmPt4ap5Jgwkz8MlD/0nnuT12s3IPLVvd0fw4gu67
X-Gm-Message-State: AOJu0YyG8FMFH1xvMv8ow6qxp0ZhhtH2nw1yxFGVrgtU5BZMoxqjd44L
	I7VGrNjjSiN6pPG4lu7I3qh9uVwVf0Oz83BOWmIscE1af6ZX+hXmENDjohHhIpA=
X-Google-Smtp-Source: AGHT+IEy2HUeh4eHrPS74gTyv0LL8fkr5nwO3fJw8lDbNGJBQEugQTA2bj4xmGTeJyDShLmEXgiiAw==
X-Received: by 2002:a05:6512:3c84:b0:52c:ce28:82bf with SMTP id 2adb3069b0e04-532edbb2d5amr162410e87.5.1723579308586;
        Tue, 13 Aug 2024 13:01:48 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53200f4220asm1053557e87.261.2024.08.13.13.01.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Aug 2024 13:01:48 -0700 (PDT)
Message-ID: <4d314b61-7483-4ceb-ac72-10dbd7e4522a@linaro.org>
Date: Tue, 13 Aug 2024 23:01:47 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: clk-alpha-pll: Replace divide operator with
 comparison
Content-Language: en-US
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, kernel test robot <lkp@intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <20240813094035.974317-1-quic_skakitap@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240813094035.974317-1-quic_skakitap@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/13/24 12:40, Satya Priya Kakitapalli wrote:
> In zonda_pll_adjust_l_val() replace the divide operator with comparison
> operator since comparisons are faster than divisions.
> 
> Fixes: f4973130d255 ("clk: qcom: clk-alpha-pll: Update set_rate for Zonda PLL")

Apparently the change is not a fix, therefore I believe the Fixes tag
shall be removed.

> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202408110724.8pqbpDiD-lkp@intel.com/
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
>   drivers/clk/qcom/clk-alpha-pll.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index 2f620ccb41cb..fd8a82bb3690 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -2126,7 +2126,7 @@ static void zonda_pll_adjust_l_val(unsigned long rate, unsigned long prate, u32
>   	remainder = do_div(quotient, prate);
>   	*l = quotient;

Since it's not a fix, but a simplification, you may wish to remove
an unnecessary 'quotient' local variable:

remainder = do_div(rate, prate);

>   
> -	if ((remainder * 2) / prate)
> +	if ((remainder * 2) >= prate)
>   		*l = *l + 1;

*l = rate + (u32)(remainder * 2 >= prate);

I hope the assignment above is quite clear...

>   }
>   

With the review comments above implemented, feel free to add to v2

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir
