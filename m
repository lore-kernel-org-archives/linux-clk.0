Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D0678676
	for <linux-clk@vger.kernel.org>; Sat,  6 Jul 2024 13:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720273187; cv=none; b=InElUrxaTk37hZoqVEPPY1xLLirWFM1r155wB2UwqASzm+D5rDsY/SHwsfkluLhKuz0vEHORs8H+7QnL1Vi94JtFh3DoZieWLXDGHt+fFzGhalwJrlWpJqldYsBzoNpBf4SGvaIW3Dy5nDjURv+EY1GQ7M87C35+Hka/f4TE3h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720273187; c=relaxed/simple;
	bh=jqIO9PtF3Kc1L3VYD56gt6cNcLUYYBsDSS5jH3CuGo4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=js9QRdHa20pBt2G4Ggsn2Tc7NKS/W6YBrxN6zLXjxd/sjuyH4ZAh5/b0g4fGxNq8dljDsXk+UA4fVZ3g9UO7AaBk6wXptiL9yXH8E3912XcY+LmtdS6bwesvXrsv4zTVzCayzqaBVWQCPScTl3XCHEZq2CpEU9Ei0PitQhweCOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oUxT4UJy; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oUxT4UJy"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-57cb9a370ddso3229916a12.1
        for <linux-clk@vger.kernel.org>; Sat, 06 Jul 2024 06:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720273184; x=1720877984; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aLaGeABuo22IKbCJ19S9kGM6QaZsE7VgK9tDKh+bfiY=;
        b=oUxT4UJyxbWqgA4xqi8eQNqdq48gNwemhC+4aVFaK+/XO0AThTg55SRhj37yZvmF6C
         B6M/vx8JDaYYhc0lmhHRDvllO5MFQogcXd3oD7y7LNB9vZoPEbhYWTBb+yynYvsfPsz7
         k3ZHEgFwvpbM4coz1ctBRQONbEWU+G37jf/EnkpApT04a7VSzZkj43z3BLs02NTQbmNI
         Fe5NqB6lRloe9CZuRq4sr1nHwXr2y705PSVLj9aFfi3m/8RoDnnHvIHTUqsLuZbEYSJA
         xy63TKo4TUpD5qzEnVe6i9Nkr3LvzcYl3cYiZSiUwUcvK5TanBPf4WLStsGYoXs2UzKx
         xbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720273184; x=1720877984;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLaGeABuo22IKbCJ19S9kGM6QaZsE7VgK9tDKh+bfiY=;
        b=RKAHd5gvFnAYLkVIdPQ/0V+TLeEdfgj8u8xY7bV5rM1VG0q1xmoBpEt1p/XS1WHqsn
         AhmQow8MOzcu3vYrKKJL7CAxzFYcRYivhKBWirQ8mT93D/3ThiD3K1rqjjhFchYs3uCa
         Zqej1EQM6iKtyIzzDih37B4Xa0dbq3T4diXN5poYKkRMsVpBYH8ypcj29a449rap/cCe
         m9Hxt0kvhLp/uQme5UIlKYI6IFZTI3YxMA04UgA5RtSOqbSrOnWq+WeuL1XH9Yn2rb+3
         HQGKuAfwaFsz9ysSbkau/SMwCutxSMPX3HOGZSCqmLElkVUJ3spCB2RtVTQj/nJDluXz
         cCjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVl+Tz5B6aCiKQdsvEb4Egf1nxMItCUB5IfjACUp9pT9TRFWGZhig622Pi9mv4M+/PTyPhBMnPWqg0roz9LrkQVwUpnLdoaF8NH
X-Gm-Message-State: AOJu0YzREzHaoiODb/bCBvwbY8RSy1f5b7D/lG8fS3YMqwUGepVUZarP
	X4Mi4ysfanqLz0r0ge/1a/nX6ccDjHfy2s+LtNAvgmQPBU+zgQkVdSMCZxk37yk=
X-Google-Smtp-Source: AGHT+IFAoehJjp/+4dx7+u2sPKkChGIxTTTUsqzPOJ2ThVjyIiUITZKYrBakHLo9QU6SlWhvQYmPeg==
X-Received: by 2002:a17:906:7704:b0:a77:c96b:a113 with SMTP id a640c23a62f3a-a77c96ba1b5mr309327266b.60.1720273183969;
        Sat, 06 Jul 2024 06:39:43 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab0900f1sm763063066b.168.2024.07.06.06.39.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jul 2024 06:39:43 -0700 (PDT)
Message-ID: <eb71f14d-bf27-4f23-870e-7dfa01e44e80@linaro.org>
Date: Sat, 6 Jul 2024 15:39:40 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] clk: qcom: clk-alpha-pll: Update set_rate for
 Zonda PLL
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>
References: <20240702-camcc-support-sm8150-v2-0-4baf54ec7333@quicinc.com>
 <20240702-camcc-support-sm8150-v2-2-4baf54ec7333@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240702-camcc-support-sm8150-v2-2-4baf54ec7333@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2.07.2024 5:50 PM, Satya Priya Kakitapalli wrote:
> The Zonda PLL has a 16 bit signed alpha and in the cases where the alpha
> value is greater than 0.5, the L value needs to be adjusted accordingly.
> Thus update the logic for the same.
> 
> Also, fix zonda set_rate failure when PLL is disabled. Currently,
> clk_zonda_pll_set_rate polls for the PLL to lock even if the PLL is
> disabled. However, if the PLL is disabled then LOCK_DET will never
> assert and we'll return an error. There is no reason to poll LOCK_DET
> if the PLL is already disabled, so skip polling in this case.
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---

[...]

> @@ -2077,9 +2089,15 @@ static int clk_zonda_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>  	if (ret < 0)
>  		return ret;
>  
> +	if (a & BIT(15))
> +		zonda_pll_adjust_l_val(rate, prate, &l);

A random check for a seemingly random, undocumented bit only confuses the reader

Konrad
