Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D294192E6
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 16:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782750552; cv=none; b=m4ixN7VRyz0iJ0/vngbM/b9puSmy6rNoGKufDmpOjgkaqE2NSxcKwvfnsQF2ptWvygK5puSvgBE8AmuXqpK0wGq7X8RtJDDDwrSNkrCUSJyF+TbwlRU8kJBpSZ/peT7JXMEBQtuAcJSRlrqh5zGUY9GAVuIl22Vy+ujUmvXNqMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782750552; c=relaxed/simple;
	bh=7Oi/H9oHgLZ74YzIl6biA9rABQ4jltAfpUljqljAvJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BXzvuKQaFh9FSUEilHsxzsVLP2BofOvIngGKLE/NxLX6+KGA9GgSkKUF8jQZm/GIZ0EBdD9S5h+Em5d/6ORTWWk1CVE9ZutG1e+RDq3gClmwpjwLcfNrCKT/Ce6bJys0fdHQg5c9QIlDtK7lCMCLI1F605I/6ri3qv1RyR6i2FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RCSymXuE; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RCSymXuE"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3996f738cc5so2488661fa.1
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 09:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782750549; x=1783355349; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kBpmlADvOekPTeSlrl6GX0ZXy3z1mOub8IDaEgLjsi4=;
        b=RCSymXuENd2HtkhFDdB5rYu1FnN70n02U6Zkj2BBp43m245UdOo9GpMJnAF0cfNRf7
         ECmBOwGCAmsvuj7dtZJnyei1xgg3hbELNzf3ObB9LSnmnf561R8G6FNVkT82Znryn3qT
         lTGHnHPg+/U1AbfEfuWiHZyD/yNQyB6ZFoLQVquJxTwJrtfGU/zr7+ZcnQ7Ms4IG5Wq/
         XDBrwsTl/T5TUqnupQju4OEGZ4emVjcQdCbIT31XIYwretsX4im+nCZbUK/OVKWk2mBd
         u3F5h9Fhc2Xl3eNFu/S7VYn52iImRoq3iqQRirMMvXzfxEZHkhSQHx1RckyGbC03CR5Y
         4w/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782750549; x=1783355349;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kBpmlADvOekPTeSlrl6GX0ZXy3z1mOub8IDaEgLjsi4=;
        b=BnNRtLPoZ4HN882bQnSNuXQwrNq5U69KGv7dK0WNMYwHFU0Jf3a8yj/6jfPLA+Oyy+
         u0ZNmKmvQK3AdBqE8E1erozwnnbkVMdenIrvgjOLhQ41K34FCDhN4TAu7WcNHzP93ZpI
         o3wVL0HHQ085SmjIhw/7yHtdlSih2w+/glQlgjjb6VUQ7KpD297LhYwipudLJUooN+R7
         lOAH7JSmrF4vYmCruoAWCsoUQXr+RWQQPOT6I4m4K+bw0Otqy5sh0QiHL0wGBekxzIJu
         38JM0+6Y43K5NGDhUTfWHLy5IgkBCSUYl4KhTovvsL63ShKjMjtBT2/LFHPW0mGoHg4n
         WnZQ==
X-Forwarded-Encrypted: i=1; AHgh+RpFI7lNLWc7inXH/2qB6d6IqvKwdaHdYfPxYkvhnQvM7bcWvuU6YovmFawVJmouqkc+LbhoPjKEsBY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZgpbdCho4jN3fhsChkzdBriJmKJzpSJVTPx6UwrwW3/0JvBKZ
	5P2zjL5lpWGrVBdMayJCrBqW+1iu+sJlHU5L6EaBNxm9fu+AZVM8IkCcv4O9VMiZBWc=
X-Gm-Gg: AfdE7cmyepqQMvScMqG7oIY+Ze/uXLz+TmYXQXYP81XAfCe4AEoEYXXf0ZnTKq7mLjJ
	Be9COxkTb88R3XnTklERXabslcD3sPaD7ovS9h/98+7nmu6zSbbj3DM1atLndJtMfb43GNzzW8j
	Y+iz3jdzljfV8xEax7WA9VD2QJIC19ZnJCITKtlyD/GapO559KWTnfAmTvrVgWe9mXn+vDbO40P
	EnYNNOagfTWyGHu7I9h+ebPasZArDNKRg+mGJk0yIjxFZU4ugokSQ1CjaF394IjtbcafIcbeyP1
	sdtNsUm4QnNF+GWJo3iEDPv3UYT/m57rQ02EgZcxaAPBPnzYJu6ojMVnXUbgNO/Rk5MoJCkW3KF
	P72alEAuh90RdRy23KZ6q+4SJSbBbVqgkpJlukpsheC0im9r2PocdkzMREV8+IEBM7/FquN5Tl/
	I9gBy2jHmm0WNI8Q+dYB6fIvA63gbNx4dbFERc8Rp8cl9C2mYxWUpfg4ez4vGUZCzBCQE=
X-Received: by 2002:a05:651c:2109:b0:396:981c:94a2 with SMTP id 38308e7fff4ca-39acb6dfbd8mr20834501fa.7.1782750548642;
        Mon, 29 Jun 2026 09:29:08 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b100758f0sm7626001fa.22.2026.06.29.09.29.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 09:29:08 -0700 (PDT)
Message-ID: <444b26fb-b2f3-4ebf-9197-1fabec6bfd00@linaro.org>
Date: Mon, 29 Jun 2026 19:29:07 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: enable ALWAYS_ON for titan_top_gdsc
To: Brian Masney <bmasney@redhat.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260626-camcc-sc8280xp-titan-top-v1-1-2ca246886493@redhat.com>
 <bcf9fd99-454f-4ac2-8357-b0775be42d41@oss.qualcomm.com>
 <41a76941-2e21-49ce-b0cd-0ae6a8b2eb1f@linaro.org>
 <akJQ7ZFODBjHrqFt@redhat.com>
 <03596c5b-9448-49e3-a035-25c0475df9be@linaro.org>
 <akKO16q4rTbS2vx7@redhat.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <akKO16q4rTbS2vx7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Brian,

On 6/29/26 18:27, Brian Masney wrote:
> Hi Vladimir,
> 
> On Mon, Jun 29, 2026 at 04:00:46PM +0300, Vladimir Zapolskiy wrote:
>> commenting the series I was also directed by Konrad's review comment on it.
>> In addition one problem, which I immediate observe, is that camcc_sc8280xp_desc
>> misses the necessary .use_rpm flag, can you please do me a favour and test
>> my series plus the add-on change below?
>>
>> diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
>> index 18f5a3eb313e..a15e9754bfb2 100644
>> --- a/drivers/clk/qcom/camcc-sc8280xp.c
>> +++ b/drivers/clk/qcom/camcc-sc8280xp.c
>> @@ -2995,6 +2995,8 @@ static const struct qcom_cc_desc camcc_sc8280xp_desc = {
>>   	.num_resets = ARRAY_SIZE(camcc_sc8280xp_resets),
>>   	.gdscs = camcc_sc8280xp_gdscs,
>>   	.num_gdscs = ARRAY_SIZE(camcc_sc8280xp_gdscs),
>> +	.use_rpm = true,
>> +	.cc_gdsc = &titan_top_gdsc,
>>   };
>>   static const struct of_device_id camcc_sc8280xp_match_table[] = {
> 
> I tried with this initially, however it fails with:
> 
> [    8.193803] camcc-sc8280xp ad00000.clock-controller: Unbalanced pm_runtime_enable!
> 
> I see that pm_runtime_enable() is called from common.c when use_rpm is
> enabled. So I removed all of that from camcc-sc8280xp.c with the
> attached patch.
> 

I believe the updated change is correct.

> It still fails with:
> 
> [    8.204595] camcc-sc8280xp ad00000.clock-controller: probe with driver camcc-sc8280xp failed with error -22
> 
> I suspect the use_rpm flag requires a more thorough migration.
> 

Likely it does. Unfortunately I don't have an sc8280xp powered board to get
more information about this particular failure, but please give me some time
to check, if I can reproduce the same issue on SM8250/RB5, if its CAMCC is
added under the runtime PM framework.

Thank you for the performed testing.

-- 
Best wishes,
Vladimir
