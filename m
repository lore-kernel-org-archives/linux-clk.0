Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nBH1jcCi"
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7760D6C
	for <linux-clk@vger.kernel.org>; Fri,  1 Dec 2023 13:45:52 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a1a0fedd3a1so155458566b.1
        for <linux-clk@vger.kernel.org>; Fri, 01 Dec 2023 13:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701467151; x=1702071951; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8sn6TIMQGfSCwqnbYuewhqgGKU0sPXKc6S7oOa0pf30=;
        b=nBH1jcCiXs3HaRgxJJ0QMoKL7bPIQzjdXBjFmDeGC3KBEvs/zRf3TV0vsEKV6sW2Wg
         8ZXVBx2LLBQtAaAL7fSGNzgHWOwMw4+rwJnt1xxhgcBx+EMdn8LG6yha5OBW6d+ncmlP
         Dv7POHpFWOryrV2EUagw8Yj6BRLl8aBANIP4BcA8nmnuNUvK5FphZjNNGiLYyz/EbfLz
         H4L+7MWrMi6mOkNL/qfVOfYKxPElwqFBYglrxv8Ysf9D7RBm8dTc6ZLHg/7sdBONSgLU
         xLfMvyNJyr19CPreSYoSE+VsZvd4Fdn4/bYSMYZM8FCajMvNUwpg4bxaiQFj9J2jMxN1
         E5Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701467151; x=1702071951;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8sn6TIMQGfSCwqnbYuewhqgGKU0sPXKc6S7oOa0pf30=;
        b=WUD+QUAqA7G1WAPxzjMbnzzDqbQuJ7r2WUnD046SCoy77fImdd/0n8MPh5QcHZtUMv
         3xzFLlM86hjD6QPX8zUGIHlL+IaxIEP4bu+wzrEozH9WWGE7gfzRHZAXTuxVpSDNGqu4
         FudxU29Hv6RBqZYNvAAFlYDSKa2XC5u3L6ECGRlUGnAYtSl/RR2FtM+KvhACXRvd+QPS
         P4FE5epjvaEIhxhs5wF7FZbAKBCnjbh6rRkopwkKCPUn5K9FQSY6kpzZyejI7sgxGCfq
         AyHmH623kwVQ9UA4F7QueJEva6JlrAYxh/u0GwaNtM5ymYung/rvWiPaZy7SFODKDfBH
         Fy+A==
X-Gm-Message-State: AOJu0YzbV6uAyPx5B/AmDzaoh8UZQrN8v/YlYEc/r6OZ4h6o6llcwtzn
	7+KA5Lqm5EZeucEW51S7/o4dxg==
X-Google-Smtp-Source: AGHT+IEwdQx3qk30hc3NuMNho+pYuDCvbHivi7c1Kv4hAHmi7L90T8BZhGRCFodD8UzyTeAHY8dopg==
X-Received: by 2002:a17:906:109c:b0:a19:396e:99bc with SMTP id u28-20020a170906109c00b00a19396e99bcmr550273eju.39.1701467151471;
        Fri, 01 Dec 2023 13:45:51 -0800 (PST)
Received: from [192.168.209.83] (178235187166.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.166])
        by smtp.gmail.com with ESMTPSA id a7-20020a1709062b0700b009fc8f309183sm2339415ejg.51.2023.12.01.13.45.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 13:45:51 -0800 (PST)
Message-ID: <f1604d9c-663a-4778-87e6-53f8e4b8b25e@linaro.org>
Date: Fri, 1 Dec 2023 22:45:49 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] clk: qcom: videocc-sm8150: Add runtime PM support
Content-Language: en-US
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Marek <jonathan@marek.ca>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231201-videocc-8150-v3-0-56bec3a5e443@quicinc.com>
 <20231201-videocc-8150-v3-4-56bec3a5e443@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231201-videocc-8150-v3-4-56bec3a5e443@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1.12.2023 10:50, Satya Priya Kakitapalli wrote:
> Add runtime PM support to ensure the supply rails are enabled
> when necessary.
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  	clk_trion_pll_configure(&video_pll0, regmap, &video_pll0_config);
>  
>  	/* Keep VIDEO_CC_XO_CLK ALWAYS-ON */
>  	regmap_update_bits(regmap, 0x984, 0x1, 0x1);
>  
> -	return qcom_cc_really_probe(pdev, &video_cc_sm8150_desc, regmap);
> +	ret = qcom_cc_really_probe(pdev, &video_cc_sm8150_desc, regmap);
> +
> +	pm_runtime_put_sync(&pdev->dev);
> +
> +	return ret;
>  }
>  
>  static struct platform_driver video_cc_sm8150_driver = {
> 
