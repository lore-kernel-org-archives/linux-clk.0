Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DB21E49B
	for <linux-clk@vger.kernel.org>; Fri,  6 Sep 2024 12:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725626780; cv=none; b=nQQKLCboyoOpDeuRkzMIbyyY5fMyosiF/pGPk8N4qKtKDYpWgJVZVcZRA3SCphC3/cP+vzqR0zvzUz2IYYu317wlAAbIRYnmqmt/tmRhXquQKOnYcQo6T+P/Gbsh+kNGFI12dKYwpX97L8oh8Up2q3q1PB14p4/nvNqBH19giiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725626780; c=relaxed/simple;
	bh=hC/tGF8cSl4flBiWeSmMpIIt69LufoFugG+Yk1h7n3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cdRNTFa0NS7vmguCRqzFXbyR/SgEH+Wc4VqCWk3XP1lWdrTfNwNt6AxFlhhdsHUyx/IC6ZrNXafsoW5aDHScKizg5u+u4/5tJeszKnrKQFbbaEmB2hXb3zLAX82R70TxpqhsIgGIC0FB4GkAu9+tTp/SBpLf/yOS5vF21L0de0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fGWH9N5z; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fGWH9N5z"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f751a2a29fso1009771fa.0
        for <linux-clk@vger.kernel.org>; Fri, 06 Sep 2024 05:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725626777; x=1726231577; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LIRBLYQ4+mKh3KvEse9INuFPvpdgYruUAOkgTL5XFS0=;
        b=fGWH9N5zfA2Dtwt5RuDLJNA5dsPA1GjBwVyhWIHFKCBb7e0878kF+TWDgefsmrk9V/
         M4KXwBYqDNqKUxn1r5nVmOLnArUe4hxENAoKKI5n7Gj8N6RHLLxq1CRH/W/sjnDDCY3/
         RXRZg7ceFu3UvosIdPJeKz1LAaXy6R05QB3mJ/X/lrqMqbGjo0mOU9joj7nXReBPwiCM
         DG7bzsLtrtmHOVnTJKX3skkDoeJdXT8vZNRaNjClNYdUIoOAEd3okAv+Y+HmErhxbKYG
         7V9RHRKJlH/UnQJyqcAG3hZ6phwTaF7g6ViXAbS619Uv61en5ox+W8RuFzyYIF/xnlSX
         8VRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725626777; x=1726231577;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LIRBLYQ4+mKh3KvEse9INuFPvpdgYruUAOkgTL5XFS0=;
        b=afqLQD4fjm9feiux99Ivcqi3GA+ZVt0XEIOg/RqAz4oRMubxNTkcHHw4iQuQK/eii0
         BfJQ4k7BNUiomdL0zwGEAJBixv/sAj7fvBmzqVMbUlXEpmDNS2LeaZJ4v+ffPoReiohG
         WErxLK3CpSdFZxn9gvh3RFaVtlXgCubLPOrAzPQ26Vl8N0w0xooCir3uoKEaX/6cerpG
         WFBOyb+26d04FuBz+zvEnHMWKM5sMsA7SktzGCZPbCmR79ipdQ9DiXZQ7ecTMlsl5B8Z
         DB+DBj1yuZxjt00q2MPjcIkH9t0HRiCnhXedy/f/wBxRGF9JVXBBYsgHK7dKFRUwPcpa
         tH3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXusFLqs2xcGipzKwRW3lwSsFq+Zcb1RNSWdYHCUB43VBUZTdEXHvEgZXEtuc5S2hHDNWvK+N9Wfgg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBqBSVovGDHehxr+wHtQTi45dKl0ylc5WcWVyr0g85foyM5d2t
	KhxQDEDj5QenhVOyH2E2PDNvixdwtzjy1e40kgonW6WbyVjnmtr9uU86z9rR8zk=
X-Google-Smtp-Source: AGHT+IH7TcjPOhUnSCOztxx0ezKCT+YBhSK1/HnVI58kj/H9R25mEbT+/4axuFgUNssPy7mS67UILQ==
X-Received: by 2002:a05:651c:541:b0:2ef:27fa:1fc4 with SMTP id 38308e7fff4ca-2f751ea5828mr10045711fa.1.1725626776719;
        Fri, 06 Sep 2024 05:46:16 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f615171f9dsm30793331fa.97.2024.09.06.05.46.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 05:46:16 -0700 (PDT)
Message-ID: <3ebb955d-ca25-4bbc-bf55-1b3cf2e20525@linaro.org>
Date: Fri, 6 Sep 2024 15:46:15 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] clk: qcom: clk-alpha-pll: Simplify the
 zonda_pll_adjust_l_val()
Content-Language: en-US
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>,
 Taniya Das <quic_tdas@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Jon Hunter <jonathanh@nvidia.com>,
 kernel test robot <lkp@intel.com>
References: <20240906113905.641336-1-quic_skakitap@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240906113905.641336-1-quic_skakitap@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Satya Priya,

On 9/6/24 14:39, Satya Priya Kakitapalli wrote:
> In zonda_pll_adjust_l_val() replace the divide operator with comparison
> operator to fix below build error and smatch warning.
> 
> drivers/clk/qcom/clk-alpha-pll.o: In function `clk_zonda_pll_set_rate':
> clk-alpha-pll.c:(.text+0x45dc): undefined reference to `__aeabi_uldivmod'
> 
> smatch warnings:
> drivers/clk/qcom/clk-alpha-pll.c:2129 zonda_pll_adjust_l_val() warn: replace
> divide condition '(remainder * 2) / prate' with '(remainder * 2) >= prate'
> 
> Fixes: f4973130d255 ("clk: qcom: clk-alpha-pll: Update set_rate for Zonda PLL")
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202408110724.8pqbpDiD-lkp@intel.com/
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>

thank you for the updates.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

> ---
>   drivers/clk/qcom/clk-alpha-pll.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index 019713c38f25..f9105443d7db 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -2176,10 +2176,8 @@ static void zonda_pll_adjust_l_val(unsigned long rate, unsigned long prate, u32
>   
>   	quotient = rate;
>   	remainder = do_div(quotient, prate);
> -	*l = quotient;
>   
> -	if ((remainder * 2) / prate)
> -		*l = *l + 1;
> +	*l = rate + (u32)(remainder * 2 >= prate);
>   }
>   
>   static int clk_zonda_pll_set_rate(struct clk_hw *hw, unsigned long rate,

--
Best wishes,
Vladimir
