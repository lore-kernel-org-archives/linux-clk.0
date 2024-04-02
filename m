Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E744680BFE
	for <linux-clk@vger.kernel.org>; Tue,  2 Apr 2024 16:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712073822; cv=none; b=fW3NsNNgNBoxz/eOmgObiYdjWIoPUBTDNSCHP/2fC88jIT22c1s0ihQnqZWMwYBpw9Cy2IUgGiZz3RUQXz9lNHFcQjFe/OMkooR6RhA48zTPQEA+fBuPUt7eS63wHMf5FkDWqLHgWnAw5FrhfeKv+31Al509knABbxp+NcxnidY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712073822; c=relaxed/simple;
	bh=iGyly8WCikfxHr1JxXFl8+5sYdwyod5Ao8oCvYmT9nI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EnAa+hOr8A43cetvXbdeIXJbiSjyR/br/4yZyottPW5ff2ORvZBnsYYaIeRVq22MifWz9ubfzrubpjMUNAl8LuBu/qM9yF5uKfOQYXy5VxTpUcq0zu3u/bXPSZEg52FFpVs263ZFTuCGhUr6lqVheWj5OMPwXCC3I6C4R7ZaYKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CQEbs14U; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CQEbs14U"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-56c5d05128dso3983561a12.0
        for <linux-clk@vger.kernel.org>; Tue, 02 Apr 2024 09:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712073818; x=1712678618; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OomU9lhSpCio47MouV5ctgMxvXJu/MI+HjwUO0FQl5c=;
        b=CQEbs14U26gZ9swCMHq2MrhuBJ9rsB4kKwc/36WjrPjoHwjzmF4OJQMxIbRXaMxSfB
         SdgN3ndYBWN5UM8gdyF0mZYS/8z15/NPZqui2mKCm0DqV4YKYYbvwUfSKvXpDfdIzVzR
         qssqbGAOz1DRmI7gsjpC0m9YWEHyigbJBCla2AcR4LHM4jk7I7b4ykdO9jFu2ba3gbOF
         fy+mo2bwHpjub/EIug+qNr7Nhc0DnkLCPEx3YpyvJcR2xPhJc0TtWk4UpRkkBr+sH8F1
         Z5GusT/2RcPQYMeZ8e5omhVFxj8beuwyVTrsjpttuDe0TsbQ636KX/bBPqoHOaOsVYE/
         xQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712073818; x=1712678618;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OomU9lhSpCio47MouV5ctgMxvXJu/MI+HjwUO0FQl5c=;
        b=MvFibjd5W0DC7FFtlSv4rIBNa/ptcuQJI21PvRKu9yT0uKD1yTuwaiAx3LY6On3tPG
         Twijy7XqlnVTtYRS8Cz6m9w8TKE+PgiE5sXFeqE/Rk4SJlRpHscKWIbuMMzxSu4J5UmE
         JHlRQc2yg9sV5zxigx2StxSTTeix9DQkYr+PdSkaGxktVJnmwTnKuGB0MKwIRRFAqP2r
         PQvidAJcKuUdb+6j2NhXBy0yyLjYb9oMxadvuaKpXFHqsJRTzD/kkSPRluGOI11bi8Do
         nsLiWj8ewPxiOmz3S4KR/06VrjlJ6sk8s7zAEoFJEiNRgmfa3bvRlO9Vp97J/UZrMkbV
         2dnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUu+hKQIZ3yB8gIFhsSEkyaJ+GDVVmxvKg32Il2ISueTv3KV6Lpymee0C2c5SdPdi5IR2jUYswQ58Jerty021tLPXC724FEzm/K
X-Gm-Message-State: AOJu0YwyzVN6wVzuPLJJx3cqmSwuxNsN4mfjGiCVNGU1y1XmpRFZIRLF
	qg79uH+f1PPqJ/L4EsPBEfxd6Dz3V3HBpjpLBxdm2ABV99eOVqSIYEeos5B+88M=
X-Google-Smtp-Source: AGHT+IFfwB0NEpsXCg8oKHt7+sfNoq0F1vkpQXHgdbcLB4Z2FlNzO/Ru3f/hztZaLLKPnQ8gc4scfQ==
X-Received: by 2002:a50:d55c:0:b0:56b:f352:d379 with SMTP id f28-20020a50d55c000000b0056bf352d379mr8550036edj.2.1712073818290;
        Tue, 02 Apr 2024 09:03:38 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id h3-20020a0564020e8300b0056c1cee7a37sm6890000eda.67.2024.04.02.09.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Apr 2024 09:03:37 -0700 (PDT)
Message-ID: <fb8ae622-29e1-4281-8a53-3d9590363528@linaro.org>
Date: Tue, 2 Apr 2024 18:03:35 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] clk: qcom: smd-rpm: Restore msm8976 num_clk
To: Adam Skladowski <a39.skl@gmail.com>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240401171641.8979-1-a39.skl@gmail.com>
Content-Language: en-US
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
In-Reply-To: <20240401171641.8979-1-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1.04.2024 7:16 PM, Adam Skladowski wrote:
> During rework somehow msm8976 num_clk got removed, restore it.
> 
> Fixes: d6edc31f3a68 ("clk: qcom: smd-rpm: Separate out interconnect bus clocks")
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
