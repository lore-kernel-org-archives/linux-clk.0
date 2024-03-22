Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD4267A09
	for <linux-clk@vger.kernel.org>; Fri, 22 Mar 2024 18:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711132235; cv=none; b=tXkyBz4JLc8e59htqr48Aq9huxBv27bh5Na7xG0Di51fcZ2SVYimeE0xtDakPFtpJix+LoskV3ib5ooyDejRxyVlQ2BEfyfImgyu6RMoJIE9IY0QKJ51xS88iZY5yHbplZ/2wenqlOQyJuJ02vowXLHD4I8HW9Q90kyEWK1mN6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711132235; c=relaxed/simple;
	bh=6k/hI9VKU0vg7OSzoqkipq3rc4fNUx12EkOasVVwQZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R20J1i1baWNEAFI82WjWCSxZuTAYcK1VPes3tFpFg7ZnsQgoR89VpPkFLPt5jx4ZUIiLmEEqIbjiztRu6Vbsid/nuu95NJ4MNtB04I14nQWkmwHzNUxb0LVN/XRY4WWw8dazLCJq+KZDzpB3T0lxu2cD+epwtCgnO46jgG2sy68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UIENj+9L; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UIENj+9L"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d28051376eso48299861fa.0
        for <linux-clk@vger.kernel.org>; Fri, 22 Mar 2024 11:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711132231; x=1711737031; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Odz1V0jHlAEnYHOPUvuJFI8Il+hSKWfQUAwAyBiPNU4=;
        b=UIENj+9Lef3VpuHFS04IRKhPwMoFkQc+k39kplxRQ1JY9V5mccnxhrDiRxaI8yCnVy
         YXqM0dxWERu2t5qTSY4EwKbRQPKW0BPzorhO9gXK4jj+Et7h51W/TpKFO2YchXPM7eRf
         fyF64wnSLb8a3B0Hl/jDGRGdiNSZLr27kSRBD+7XXkyonHzvJOmjVwPu/5yKO5fMSoqI
         Qs4wL3r/h2Do0GHd678/cpwp7P8XqTKAbbbWq4/acc5vdKJVHuVIk/iQIOlEw/C5L2Ty
         d5E0U6+NwPcACCrN8MxlKxuPFCrHIrIexNrqC9g2U1YSLSym2KwEdxgDitc5F8hi0vU/
         FzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711132231; x=1711737031;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Odz1V0jHlAEnYHOPUvuJFI8Il+hSKWfQUAwAyBiPNU4=;
        b=EC2S4SgsdnkSGy+O0zDbnlDlPAtHLwzJmLcnOxr1PqmDYCgpfHcAz23x0/8uAMsVW8
         aEOlxiOtqI1hwSaxOhs7owUZTlpdqI46jVlZmoOXsvFOQk13VRHyaLUNP9FiNvcXLbN4
         8S9BEIEeFcNFwmzuoflacF+MNLi4RyETrdEsVxoFCoPgCS8hqpDBrmgwOR6WZhGUJX3b
         ZQBmd6dvZ02W7VEj+ZdfQCkFW/glCxKlJrS4o04JuDGDPz7Zgm6r+8X9CBOTb41JwYwM
         sJEdNj0hESBbOpurmt0y1peqyz8hxCk0jjpw4K3+tWQOOUaCmPuhJxAdtzNImremTeFz
         FsIg==
X-Forwarded-Encrypted: i=1; AJvYcCWLvAo/pYOdgnBn0RhPLtkmCDpjqxEXnbZHkOx/HK3RyZoVG8/1geeiXsinlCAqMwqLuA1+KFWXCNtm5xlgu5U3wu6EwCDjv0bp
X-Gm-Message-State: AOJu0YwKnVeq4Uwpjtf9REMcDEB358eBY0sYS8CqX/+QEeRPwsU8vbx0
	lhq3PdGI44JIKs/afqX84kLETMlSVjiVtfi4uO7mUg4j4KwUT3GHpsjOlzMEJ5I=
X-Google-Smtp-Source: AGHT+IEZKtBJ02fTaIWArwgXmYgqxM41gBHjTYDe5foPm1ZT3Qo3OpC6xjLJpVQ2JhcD1T4DFtsOcA==
X-Received: by 2002:a2e:9891:0:b0:2d4:22b6:eee6 with SMTP id b17-20020a2e9891000000b002d422b6eee6mr309834ljj.8.1711132231108;
        Fri, 22 Mar 2024 11:30:31 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id m21-20020a17090679d500b00a4739efd7cesm92418ejo.60.2024.03.22.11.30.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 11:30:30 -0700 (PDT)
Message-ID: <3f19eb66-1489-4604-b564-7e85b6b180e8@linaro.org>
Date: Fri, 22 Mar 2024 19:30:29 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] clk: qcom: apss-ipq-pll: move Huayra register map
 to 'clk_alpha_pll_regs'
Content-Language: en-US
To: Gabor Juhos <j4g8y7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240321-apss-ipq-pll-cleanup-v2-0-201f3cf79fd4@gmail.com>
 <20240321-apss-ipq-pll-cleanup-v2-2-201f3cf79fd4@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 xsFNBF9ALYUBEADWAhxdTBWrwAgDQQzc1O/bJ5O7b6cXYxwbBd9xKP7MICh5YA0DcCjJSOum
 BB/OmIWU6X+LZW6P88ZmHe+KeyABLMP5s1tJNK1j4ntT7mECcWZDzafPWF4F6m4WJOG27kTJ
 HGWdmtO+RvadOVi6CoUDqALsmfS3MUG5Pj2Ne9+0jRg4hEnB92AyF9rW2G3qisFcwPgvatt7
 TXD5E38mLyOPOUyXNj9XpDbt1hNwKQfiidmPh5e7VNAWRnW1iCMMoKqzM1Anzq7e5Afyeifz
 zRcQPLaqrPjnKqZGL2BKQSZDh6NkI5ZLRhhHQf61fkWcUpTp1oDC6jWVfT7hwRVIQLrrNj9G
 MpPzrlN4YuAqKeIer1FMt8cq64ifgTzxHzXsMcUdclzq2LTk2RXaPl6Jg/IXWqUClJHbamSk
 t1bfif3SnmhA6TiNvEpDKPiT3IDs42THU6ygslrBxyROQPWLI9IL1y8S6RtEh8H+NZQWZNzm
 UQ3imZirlPjxZtvz1BtnnBWS06e7x/UEAguj7VHCuymVgpl2Za17d1jj81YN5Rp5L9GXxkV1
 aUEwONM3eCI3qcYm5JNc5X+JthZOWsbIPSC1Rhxz3JmWIwP1udr5E3oNRe9u2LIEq+wH/toH
 kpPDhTeMkvt4KfE5m5ercid9+ZXAqoaYLUL4HCEw+HW0DXcKDwARAQABzShLb25yYWQgRHli
 Y2lvIDxrb25yYWQuZHliY2lvQGxpbmFyby5vcmc+wsGOBBMBCAA4FiEEU24if9oCL2zdAAQV
 R4cBcg5dfFgFAmQ5bqwCGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQR4cBcg5dfFjO
 BQ//YQV6fkbqQCceYebGg6TiisWCy8LG77zV7DB0VMIWJv7Km7Sz0QQrHQVzhEr3trNenZrf
 yy+o2tQOF2biICzbLM8oyQPY8B///KJTWI2khoB8IJSJq3kNG68NjPg2vkP6CMltC/X3ohAo
 xL2UgwN5vj74QnlNneOjc0vGbtA7zURNhTz5P/YuTudCqcAbxJkbqZM4WymjQhe0XgwHLkiH
 5LHSZ31MRKp/+4Kqs4DTXMctc7vFhtUdmatAExDKw8oEz5NbskKbW+qHjW1XUcUIrxRr667V
 GWH6MkVceT9ZBrtLoSzMLYaQXvi3sSAup0qiJiBYszc/VOu3RbIpNLRcXN3KYuxdQAptacTE
 mA+5+4Y4DfC3rUSun+hWLDeac9z9jjHm5rE998OqZnOU9aztbd6zQG5VL6EKgsVXAZD4D3RP
 x1NaAjdA3MD06eyvbOWiA5NSzIcC8UIQvgx09xm7dThCuQYJR4Yxjd+9JPJHI6apzNZpDGvQ
 BBZzvwxV6L1CojUEpnilmMG1ZOTstktWpNzw3G2Gis0XihDUef0MWVsQYJAl0wfiv/0By+XK
 mm2zRR+l/dnzxnlbgJ5pO0imC2w0TVxLkAp0eo0LHw619finad2u6UPQAkZ4oj++iIGrJkt5
 Lkn2XgB+IW8ESflz6nDY3b5KQRF8Z6XLP0+IEdLOOARkOW7yEgorBgEEAZdVAQUBAQdAwmUx
 xrbSCx2ksDxz7rFFGX1KmTkdRtcgC6F3NfuNYkYDAQgHwsF2BBgBCAAgFiEEU24if9oCL2zd
 AAQVR4cBcg5dfFgFAmQ5bvICGwwACgkQR4cBcg5dfFju1Q//Xta1ShwL0MLSC1KL1lXGXeRM
 8arzfyiB5wJ9tb9U/nZvhhdfilEDLe0jKJY0RJErbdRHsalwQCrtq/1ewQpMpsRxXzAjgfRN
 jc4tgxRWmI+aVTzSRpywNahzZBT695hMz81cVZJoZzaV0KaMTlSnBkrviPz1nIGHYCHJxF9r
 cIu0GSIyUjZ/7xslxdvjpLth16H27JCWDzDqIQMtg61063gNyEyWgt1qRSaK14JIH/DoYRfn
 jfFQSC8bffFjat7BQGFz4ZpRavkMUFuDirn5Tf28oc5ebe2cIHp4/kajTx/7JOxWZ80U70mA
 cBgEeYSrYYnX+UJsSxpzLc/0sT1eRJDEhI4XIQM4ClIzpsCIN5HnVF76UQXh3a9zpwh3dk8i
 bhN/URmCOTH+LHNJYN/MxY8wuukq877DWB7k86pBs5IDLAXmW8v3gIDWyIcgYqb2v8QO2Mqx
 YMqL7UZxVLul4/JbllsQB8F/fNI8AfttmAQL9cwo6C8yDTXKdho920W4WUR9k8NT/OBqWSyk
 bGqMHex48FVZhexNPYOd58EY9/7mL5u0sJmo+jTeb4JBgIbFPJCFyng4HwbniWgQJZ1WqaUC
 nas9J77uICis2WH7N8Bs9jy0wQYezNzqS+FxoNXmDQg2jetX8en4bO2Di7Pmx0jXA4TOb9TM
 izWDgYvmBE8=
In-Reply-To: <20240321-apss-ipq-pll-cleanup-v2-2-201f3cf79fd4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.03.2024 08:49, Gabor Juhos wrote:
> Move the locally defined Huayra register map to 'clk_alpha_pll_regs'
> in order to allow using that by other drivers, like the clk-cbf-8996.
> 
> No functional changes.
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
