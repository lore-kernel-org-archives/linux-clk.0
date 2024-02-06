Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF6D1429E
	for <linux-clk@vger.kernel.org>; Tue,  6 Feb 2024 19:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707246393; cv=none; b=Z8EYhhl/DtzlYmjFaq6aCfLOaNTWQ54m3ALiT0+6bUeFxEAr9QDhJR3ddmqSBkJCojRBsGlaQxqxM+xTH8q6Fim/gZKB9LeAwPwC0/BDi2y6vCnIeASB6HFSMM08dJfX7iUwFeyh9HgMs1HSKOnpomawDv0b8yCguQzLyuPStv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707246393; c=relaxed/simple;
	bh=l3ivtluzGMS+UFOlURuwHmNGsbLlLoybUWlfRVn8wf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uyigEPgTpXFsDn83YQqb6yiVaGgIkAbaNn4givlFLE5giB9LzUHMLqEmVLHKz+u51e6ybZ921BGK39RYqJ6RYzHwC2GMFtaO4gCmKokKLeX/3x1rD0scXegCjTEEJtvP0NoKHE7dIjmX/IyyQjrhUzes8rvuRC2h1/f2kynogBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U40jFE5w; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U40jFE5w"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a2d7e2e7fe0so192436166b.1
        for <linux-clk@vger.kernel.org>; Tue, 06 Feb 2024 11:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707246390; x=1707851190; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hi6y8i9DoSg4wDjsc1n31h89s4NUnmc/xGQo5BVmiac=;
        b=U40jFE5weNZapjqbtoA0OiOUF0+qo/fRxpvHhoIs844u/zgIsKh5cERSYCtQCXDClh
         Dao+IF64kOpCEOPID+D7L4I3hfpBOmDhVezjs1r0UdJwWGXkgEJuLWgtMJBAkud6Gyit
         8cpo2d0LmS1b8O3cA4sfOISINVEBpz93cIjNSokXuH0quhTgopJ0YGmZEmuHa8pk6tTy
         uNj9mWWHiKmd+QKEwXLYAfPXSYNNnajtiU7ZpcYiqPwHEP0fb2JSIGylbwUiDKQLJ5yd
         fv3v1DPyX9Z0Xx/YuMFAA9QNVgCQy8eVmbC8UYZm4+SVvJi3r41Ks+XZoINElfruJauJ
         6/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707246390; x=1707851190;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hi6y8i9DoSg4wDjsc1n31h89s4NUnmc/xGQo5BVmiac=;
        b=NI0M7eRh4Ia0afwjW5wT3UA5rYiokOdyfFSt/8mTZ4c3qGNyaHPkO1P40TAFk4ATdZ
         sSyvvb4q4MFIf3ygLscDp2Na+RvQ1KYDNVtthLPeJkBbF6DKaYIpKM0SSm0INN6wI9fW
         02/wXdLyv6UAo/lOqUCaodU8Mb/ZP6hLDtsI9PAmDl8X9Yz+olap/g5dEu0TwYf7FPQ0
         Z8FM+V0CHfzFQrHAFSnRq5RvZqohXqaDfyxR0xk9rXN8MQIbileqlqK5c2bDwauVyV8/
         mFz9lGjtyxgSnMyPR5ux3+pKGvm4JnnCBgYbNGtNg5ucjavaEFKuzrjWsXSDPf4Aeg9a
         ygUQ==
X-Gm-Message-State: AOJu0YzDkpfdTKLdjdyZy1khGpj7mLJ/8NXPrF2ogvEHue0FosqFmOCx
	yYfgrrtrNKNDZZNif66nYI/00TLN4jV+lJ1IIqU4ZTuSL3xAbURCKB/ExgOi47w=
X-Google-Smtp-Source: AGHT+IHT4+/eAwSKoDadylPUBsFyAu60qD2pCoBHHzueqaAaRzRLGW/TECKr0o+s5WxLb0EZW17+fA==
X-Received: by 2002:a17:906:c1d4:b0:a36:dfa5:69c with SMTP id bw20-20020a170906c1d400b00a36dfa5069cmr3709786ejb.14.1707246389882;
        Tue, 06 Feb 2024 11:06:29 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW0zKcutm2hosz8VAiP4Zn9wjWU+bUQ1stTv9FpXE16vcojCwrAHbTboRlCQ4UNfaHkOGLE97qkQzWwE8N9JzzJVIq8wNgYugOxUc4kEJOES7okF8rSgcNDxCHbMi74jq1WsrvIJofoMFP1vrdxPxP7x5vq6aJtJJm9w7L2gG5I20/cSuZ7/pHTYC1FxyuudHRYJmY/3iMRGMlP2FHG96cifw==
Received: from [192.168.192.207] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id h16-20020a17090619d000b00a385535a02asm224018ejd.171.2024.02.06.11.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 11:06:29 -0800 (PST)
Message-ID: <f98d925d-920c-457d-b909-32763a42f5d6@linaro.org>
Date: Tue, 6 Feb 2024 20:06:28 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] clk: qcom: videocc-*: switch to
 module_platform_driver
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20240206-clk-module-platform-driver-v1-0-db799bd2feeb@linaro.org>
 <20240206-clk-module-platform-driver-v1-4-db799bd2feeb@linaro.org>
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
In-Reply-To: <20240206-clk-module-platform-driver-v1-4-db799bd2feeb@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6.02.2024 16:25, Dmitry Baryshkov wrote:
> There is no need to register video clock controllers during subsys init
> calls. Use module_platform_driver() instead.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
