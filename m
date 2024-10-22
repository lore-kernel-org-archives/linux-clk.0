Received: from mail-oo1-f68.google.com (mail-oo1-f68.google.com [209.85.161.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D161A0BC5
	for <linux-clk@vger.kernel.org>; Tue, 22 Oct 2024 15:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729611586; cv=none; b=H19jj54AXpMCiz55ZIc5Y5kB07+Sv9ZSlm6y3eYh7TTM6C8AoNze4QNoJ1UBc7StRRt+PQFixHbT1qzpIWOWEp2UxBXpC7gv6IbOQRiaNhdU0vuxsAA7eVkwCpZKQG8vWK3jlRlualBDMQdV7jpryR/N+XyRUDMCDSvkOhgxr64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729611586; c=relaxed/simple;
	bh=TjQHd7gdWQn9dW3awOpBSa9KYhVltunDk3eXTMUV2O0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CWNnevxM0Ra6RVrYAqvDmcFWaDN4lIh6HL9ocL9TVmxLAtzHYg6pEOvlUGA22DZkz16XZuFxgKWjQWv4tUr4KZjyuZs24aaxsbDGRvYuEGwD1R54nIYZxUWJjiKtp5it/6SBTvrDG+NLLsHzQpf0sjcobcHtSq0rChogSMXgET4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WeqTUm8l; arc=none smtp.client-ip=209.85.161.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WeqTUm8l"
Received: by mail-oo1-f68.google.com with SMTP id 006d021491bc7-5ebc0dbc566so1303363eaf.3
        for <linux-clk@vger.kernel.org>; Tue, 22 Oct 2024 08:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729611584; x=1730216384; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HBX82Rs6SpVYKCSSHPC/+yDJpXZhvbEvpqAv8nG+f+k=;
        b=WeqTUm8l8leATXXkcdfupDob8jnoQa9BIvTk0SNmMrfJ8YuZEdmmHt78PhlLixy9Iz
         ShBIPcrv65pe9RiIId71DUVK9jAm3jVsxlOK8mE9gAqysJ3czTQgGfr5lZtS1hSFSStZ
         xwyZj9YZgB/S7P+ie+3hfDjx+2EFuQkEv5dlmyWZCdhIrPF13Rw5z/ZfR4rPsH4O81eW
         +uYsFpOfKtCGQylPgQNPFRHRBMEkd948Uy9vZX6QU+5DjYJtZL41Eeyz4m2tjphaHuOG
         iyrxKvynzIzUJGbt7cRbS+dNkNXKC6OsFPeiZSO8oaOlDU7N+JnoBSjIXFMHo+vrg9Yq
         YUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729611584; x=1730216384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HBX82Rs6SpVYKCSSHPC/+yDJpXZhvbEvpqAv8nG+f+k=;
        b=nytygxGkPiQ8Kz0HSByphWhjdy2ENScu0FZA8mIp7Tro/BHSj7oxeqs4vz0qTU79Pj
         ivwtgCb/btEfQpMdzvMem+hR+g7txPIFQAHkK45F+Q8ir2og8Ir0R/9mJLr4hYqT3Y5x
         /I0aBTFPAsOMEO4WG41cYoCuyWKggJgYXTkAhLbDsPCf265kzdsex97OWfC/oKZy+wYF
         /THSkS6AZnS3TkwTiDAB3W/HFFy44W9Ot6+5Ty5s1Z5UxJHg4WHs/qU1ZYlUFji4Czzj
         mKX+y8a7rA6DHz6maeK24vYXVooBAGWGEFCLZMGLjWpFt92ORSBdYo7+z9mB+yww0dRN
         LuKg==
X-Forwarded-Encrypted: i=1; AJvYcCXRkvLuW0G0S+mkCU3LwSibrqwi01fkO7H+m3zO+sd6Rt8/oAcE90lV45b3aE7izcDSps18nPC1s9o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+1CB4iIObvkaVOvldDZQgZZnLR3zSpvH/2W++h5lqSQCzElO/
	mvKvr2Jjth6aR8iYO6KR3GqC+4BhlTyQNlcAcN8ZSlPj7JSF7g60
X-Google-Smtp-Source: AGHT+IFD6YmMI7+iW0zOuXRwZYj5L8TB6v0qFMf8N5Gby/vbyzuUxRukHIVWjuVy9f83MKKwYrWxTg==
X-Received: by 2002:a05:6358:80a7:b0:1b8:5e16:1a11 with SMTP id e5c5f4694b2df-1c39df4c38fmr640755955d.8.1729611583593;
        Tue, 22 Oct 2024 08:39:43 -0700 (PDT)
Received: from [10.192.166.46] (host-36-27.ilcul54.champaign.il.us.clients.pavlovmedia.net. [68.180.36.27])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-460d3c95aafsm30577011cf.40.2024.10.22.08.39.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 08:39:43 -0700 (PDT)
Message-ID: <58e8cfd2-55f4-48f0-a9d5-60fff76d7abe@gmail.com>
Date: Tue, 22 Oct 2024 10:39:42 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: sophgo: Cast an operand to u64 to prevent potential
 unsigned long overflow on 32-bit machine in sg2042_pll_recalc_rate()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, unicorn_wang@outlook.com,
 inochiama@outlook.com, nathan@kernel.org, linux-clk@vger.kernel.org,
 zzjas98@gmail.com, chenyuan0y@gmail.com
References: <20241021205101.13416-1-zichenxie0106@gmail.com>
 <e88d7bf3-fd7c-4944-92dc-f2224f45bda4@stanley.mountain>
Content-Language: en-US
From: Zichen Xie <zichenxie0106@gmail.com>
In-Reply-To: <e88d7bf3-fd7c-4944-92dc-f2224f45bda4@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2024/10/22 2:58, Dan Carpenter wrote:
> On Mon, Oct 21, 2024 at 03:51:02PM -0500, Gax-c wrote:
>> From: Zichen Xie <zichenxie0106@gmail.com>
>>
>> This was found by a static analyzer.
>> There may be a potential integer overflow issue in
>> sg2042_pll_recalc_rate(). numerator is defined as u64 while
>> parent_rate is defined as unsigned long and ctrl_table.fbdiv
>> is defined as unsigned int. On 32-bit machine, the result of
>> the calculation will be limited to "u32" without correct casting.
>> Integer overflow may occur on high-performance systems.
>> For the same reason, adding a cast to denominator could be better.
>> So, we recommend adding an extra cast to prevent potential
>> integer overflow.
>>
>> Fixes: 48cf7e01386e ("clk: sophgo: Add SG2042 clock driver")
>> Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
>> ---
>>   drivers/clk/sophgo/clk-sg2042-pll.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/sophgo/clk-sg2042-pll.c b/drivers/clk/sophgo/clk-sg2042-pll.c
>> index ff9deeef509b..e0f92f7a21bd 100644
>> --- a/drivers/clk/sophgo/clk-sg2042-pll.c
>> +++ b/drivers/clk/sophgo/clk-sg2042-pll.c
>> @@ -153,8 +153,8 @@ static unsigned long sg2042_pll_recalc_rate(unsigned int reg_value,
>>   
>>   	sg2042_pll_ctrl_decode(reg_value, &ctrl_table);
>                                            ^^^^^^^^^^^
>>   
>> -	numerator = parent_rate * ctrl_table.fbdiv;
>> -	denominator = ctrl_table.refdiv * ctrl_table.postdiv1 * ctrl_table.postdiv2;
>> +	numerator = (u64)parent_rate * ctrl_table.fbdiv;
> This seems reasonable.
>
>> +	denominator = (u64)ctrl_table.refdiv * ctrl_table.postdiv1 * ctrl_table.postdiv2;
> These values from sg2042_pll_ctrl_decode() and there is no way they can
> overflow.  The highest they can be is 63 * 7 * 7 = 3087.

You are right. But I think it could be better to add this cast to 
demonstrate that
developers have realized the potential of integer overflow.

And it can also prevent some static analyzers from reporting such bugs.

Anyway, I can still provide a patch with "numerator" cast only if it's 
better.


Best,

Zichen

>
> regards,
> dan carpenter
>
>>   	do_div(numerator, denominator);
>>   	return numerator;
>>   }
>> -- 
>> 2.34.1
