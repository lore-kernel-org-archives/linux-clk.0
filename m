Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6871362
	for <linux-clk@vger.kernel.org>; Sun, 27 Oct 2024 00:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729988588; cv=none; b=dt8cv4YEpvhrhGdj4vXD3gsuCG8hkcO3Nz2HWpCgZasJdkm5VvYrBEON3yPWgBCGdc3GLeEOgR3r2rFHcSK3hHDNXfD3Mg/HpNHFf9pmYee6beSolr/n3ndFZ8UX+h0dCgbIlU8YwH+wYX+GtUw85u6RsfvoGUipT3awGQzNCyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729988588; c=relaxed/simple;
	bh=5Pqui25DPlwIWMLdGTLyIk3J0Uf993iIacmKnnuy3Mo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZywuPRw7WYtf8iOHdrXcvKj5jxUNpkQmIzvf+r6vNGMpcg0EVAcfmfFwxGu0wEbkCP9MOevMzJrkzhRBP8dVl7lPE/Hb4Tu3nwKAuhVm1wwgU711u6M3bYwhaQANkAyFEteRIt4p6J+KcUhPCSmq0719f8WOBfIIha3Z1B3FRr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WDJgdSQT; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WDJgdSQT"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fb60277fc6so793081fa.3
        for <linux-clk@vger.kernel.org>; Sat, 26 Oct 2024 17:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729988584; x=1730593384; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lFbW2IR5f5096oBox+ScFmNcX3VP41oZ+AfH+USsxkg=;
        b=WDJgdSQTVgI9WqkJS4dNotgaakbY4G/r/cKN4Gzsn8dYqqi1H4gc3p0QaahEX3vRxy
         Aynxt7k97yK2CCZFsA7STlz/BpV+HWwfIW1ZYtWTVAhiX6/7Bdby95pSB1NKnhVaQo6I
         91RWYsPnp42GJz3vo+CtXFuH8eADg8laJz2SJlk7SK9lYhQlOE3N5kGStPzfrxJgFWWn
         GmZhjjinUXl2kVSBURYlRAv/YNO7ENFGAT7Y835esjUWDxRvrzsdB5QUAyAwmes8Xd/M
         phZGgHbjMiY5nsE0R6WNqMO7E00Fq0S/AKQqU5XyIqwtUO15voqwSlJQ775xXlQxs5m9
         gm2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729988584; x=1730593384;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lFbW2IR5f5096oBox+ScFmNcX3VP41oZ+AfH+USsxkg=;
        b=ZhRyn3+p/K/QCxGJKZ35RVne9rMH4DF7lz+TzKMGOoFebE4wwmuEQGKfz9Zqq4Kdjp
         9fTZQTCJnJ8YlKZcTJEOeyDgrrYh9frox9LVMzjwRBNg1VT7arXjWiQ8ZjKS0I06w6XO
         Cxdvq52rh5hZy5jO3zmBeIMd342/xaMiOoGdce10tYOR+OJqOH/VKUoTv082fMEkkzKX
         KwHJJZkEeCStgA0PTiq93dpVTo3cN1V4vJ1FaIv+u++inUF9rU5dpG92jFUklzN/7NJE
         uaBpwO2idGlYdvEOhVRZV2dUr8h0bx4QQvVgP2W6GKqEJCDURX5QbicthCavU3NxQgwK
         J08A==
X-Forwarded-Encrypted: i=1; AJvYcCX1vF0//3WvoCoY18l5IDhwtoRIPV+/0H0la26VGG8UXcLSlVepU22P43oHP3bqR7I+lXwqFFbqtwQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpKeZch5NPR1WfKLhaXORB+waOQ07FYhEvbEoX16Ggbzld/vPi
	33ao8e5mqVXs+Uc4LbEFHTFihHhjaB9CgEkwOejcYJZfOS7ftMu89np9EirG0qU=
X-Google-Smtp-Source: AGHT+IHdy29xwLOA70AzPMwplw9gzzYMMz/eIfCANOvEjDMYS3JoalrmNdgzM+1ItaoaGQam7GjFHw==
X-Received: by 2002:a2e:b8c9:0:b0:2fb:48f6:27af with SMTP id 38308e7fff4ca-2fcbe0676c2mr5270641fa.7.1729988584175;
        Sat, 26 Oct 2024 17:23:04 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb4618b4asm6893501fa.131.2024.10.26.17.23.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Oct 2024 17:23:02 -0700 (PDT)
Message-ID: <1039ff2d-a6ff-47b3-bace-7f2ba291f94a@linaro.org>
Date: Sun, 27 Oct 2024 03:22:51 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: Make GCC_8150 depend on QCOM_GDSC
Content-Language: en-US
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20241026-topic-8150gcc_kconfig-v1-1-3772013d8804@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241026-topic-8150gcc_kconfig-v1-1-3772013d8804@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/24 13:58, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Like all other non-ancient Qualcomm clock drivers, QCOM_GDSC is
> required, as the GCC driver defines and instantiates a bunch of GDSCs.
> 
> Add the missing dependency.
> 
> Reported-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Closes: https://lore.kernel.org/linux-arm-msm/ab85f2ae-6c97-4fbb-a15b-31cc9e1f77fc@linaro.org/
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   drivers/clk/qcom/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 953589e07c593fd49fab21c7cfcf466d33f99a27..c298d8e6700f6293f62269e5cc4ef518afc97a7a 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -1042,6 +1042,7 @@ config SM_GCC_7150
>   config SM_GCC_8150
>   	tristate "SM8150 Global Clock Controller"
>   	depends on ARM64 || COMPILE_TEST
> +	select QCOM_GDSC
>   	help
>   	  Support for the global clock controller on SM8150 devices.
>   	  Say Y if you want to use peripheral devices such as UART,
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir
