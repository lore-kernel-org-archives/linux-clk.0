Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794504285;
	b=QdWA2TJC7KudIfAqZDnk0wCKxR6i5DpIVY4RpyihjC9Fo2f82ZRbbSQTLI3PgAS3UsRq
	 T9fIgY0MOKe7tWgeEsX9X/2pb6anMW1JM7HrJGruKB3SSQs5zBXXZsPuW9IHRqzxBYYTl
	 VW2YjoaNgpJv/vWHvKov/hbD0tS51SIzbMFmTGrx3FZu3hW35dhF0lFwT2Qw1CjLj7zCp
	 z/BRdYYxrV1DhpcVHC1CAGMvQ7elQKcxUyeZUtV7b2twZFdf7k90XexFRHAKu6EJRgsk5
	 /2XemQFlTInFdQPdEcgJv9Z0Ey8iORo7UNj5yAxf5YrcXP/FitFFix0RD20rABAHP7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=63GqtMOoRCSgTES87IYM99FUWTFMCt/NCzNwfnUy7NQ=;
	b=2/NAI4oQkrOUkhWdMyZaqNZOxyVXVb/oWcASGpEvC8CfxqLkDvU9ctNZgcePjFb9H/wc
	 1fcRycvfnpoIn1qMqWsRHDKzex8j7tRgvieBErAKefATuY+FPZx5GMTHOYmocJaoioeOu
	 glA7B/0ukjrVKzi3htVidHR19B+LmWikEs29hSNXDoFP+nqpne3L6nki1Kfw5NSfMghTc
	 DYfasTdi/UAt98LEAcEUTDKufQVhzDwzGAjEDfEBMg2jm2i/d5xHpsSqBnF8zymW6iI5f
	 2FlOD+rFDOxuMelfKYCOn1/uU3Bx/6lezQoVG4r1PCM6bWZL745VCnD6/V7jfPm7Z1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Jkq4Sq6O;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973D7606A31C
	for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 17:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 973D7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Jkq4Sq6O
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so375305e9.2
        for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 09:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794504283; x=1795109083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=63GqtMOoRCSgTES87IYM99FUWTFMCt/NCzNwfnUy7NQ=;
        b=Jkq4Sq6OAnX2Pn8crvoZY/dPHwNqhLbPwejc697m552ymFXmCwb8mgSJDNjoHBJSfW
         tIFzq9E9UMQ6Zrz5YL6hqU4SGwxC9vY4m2Q9YTa1cMiceV1fi27oJIy2zDMhS9AXHfr3
         PCUGfo6dENOKRHACcC/dhXJw6byn0SPI3uAmx+PVYV10g3Ht093LpdeyDCRKpKdML7L1
         H49jcbL+vdUyoDN5a5X0cMQMvvSsH42atYkcQekL9cRQf8o03fJXv0bPYUM81xlIFenN
         LILZhm8+RVEO5xBVnA1JR379R1QuIflz96BYL+YRxcfupaJQlf8SQ1pQQe91Nhb42iAQ
         iKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794504283; x=1795109083;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=63GqtMOoRCSgTES87IYM99FUWTFMCt/NCzNwfnUy7NQ=;
        b=CiRcTbqY+9N18kyUtdMHm5HHhOfK+k3Lak92wVeF74Dmslxe6F9XQdQZ+yEGYoc69u
         tV+JvXjlln41O4LX4tOzeVl2GjlyzY+DLbpHC9eewMRWkeKBybLHIngwHxRhGENcwJ4W
         vyIeD37Fj1rVJ1H4bD39wf1kyhUR/SOD2x9TbiE+nfc6Jp9/FlIPnJJdsikYpDr/l3bR
         qGCfMVhNSCV7e0Pa7KOETd1zWU+f+2fLLy1pvSH8pkQTzGDqip2bROSssZNJL9AZQVcQ
         z5m9bGszGK+CNH0poU2wGg9IKGGhxH7VxGKzqCaaC5vnWfQsJhUE5yK6O46rkd/iEkZR
         z9iw==
X-Forwarded-Encrypted: i=1; AL+hErFpXmMXFXA1N85IiYaWz0z4Zcl3apr8WQGy4Qw8CejbLntl149i7qcsPxw8KwL/7QHf4WCjw6mNMnA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gfPmkE67BpGsJ0+KWaOubzbFy6Fy2lTbNZWoiegmya5Q1cFsk
	VfrUHQ0gA7JXApforpVzU01Lwj6tzhlvjIHdW69TP4Ca6YvdSakDl//zcQyMwNOYib4=
X-Gm-Gg: AYBFou1Fp6LjnIBkysfCJUwKoJsHMkuyPrkzm3C9BKgFYCaGEctTsa/UXLtIK8Hc93c
	ro2L6PpLJ1Sa9DsgdWQ7opFUP1Lg4rV4hy9FmaKT+8zHoanerKyPdRqK9TvxkLeiIVk1C2qcc+w
	+wTR2Wb35VQ5lHAs/4UnpiOfJ/CRBG1pptbQXSFQczmjTp0fkk7SvzxMXca8Jb94IHTdpOJE5gG
	xosq1BJX1U8Mo4YiTr23kwR5oyo0JlqFD/wJAECas08oUS07fHyqfKOhcxbjAKJRdUxHEz7VzEu
	08fPzR6XnG1XC8I4Y9queiSxjxJhxaGg0s45+krgBm5lmM+eaFY23l9fwqrck2Rznt41QO8Fz6y
	LxcuNTOtHRSKvMV5PKxZ3Y7eXhMVgvyXpxF/sI+aT+l9SZII9M4DXj1oQZjnS8TkXYfIIoD6SPX
	sEFDkk1TQs2zo/Fov09dI+xfHmOYVrKg3u25IxsnwBAPgX6D4DGS8GH7Z2RUFgbS40pe2A0EsQ3
	BuL4LgPyAqENZprvqheSTsqtQ8oZk6sKbcZcYStNYXezm/REOjpslHQarBCOpDrgJWa/ueCXg+L
	ZcIsSa2qxKnW04j4psXXe220V5EQ3S11ncOngHpwgrqyxj4ATd/HmTlz6XbcMbfSkSoH6VBC1rJ
	gKdezXFRM
X-Received: by 2002:a05:600c:a46:b0:4a1:f625:2108 with SMTP id 5b1f17b1804b1-4ba093940c2mr116502295e9.33.1794504282924;
        Thu, 12 Nov 2026 09:24:42 -0800 (PST)
Received: from ?IPV6:2a0a:ef40:e16:1f01:b442:1e4f:d5a4:2a21? ([2a0a:ef40:e16:1f01:b442:1e4f:d5a4:2a21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60d9fff8sm345018f8f.52.2026.11.12.09.24.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 09:24:42 -0800 (PST)
Message-ID: <38a09248-032a-4144-9e56-6d52eef8c077@linaro.org>
Date: Thu, 12 Nov 2026 17:24:41 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] clk: ti: fapll: Fix clock speed calculation
To: Brian Masney <masneyb@kernel.org>,
 Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 Michael Turquette <mturquette@linaro.org>,
 Rouven Czerwinski <rouven.czerwinski@linaro.org>,
 linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261028-patch-ektor5-dm8168-clk-v2-0-dc6bf0fabae4@linaro.org>
 <20261028-patch-ektor5-dm8168-clk-v2-2-dc6bf0fabae4@linaro.org>
 <179444595968.1126566.8596406047613157255.b4-review@b4>
Content-Language: en-GB
From: Andrew Goodbody <andrew.goodbody@linaro.org>
In-Reply-To: <179444595968.1126566.8596406047613157255.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/2026 01:12, Brian Masney wrote:
> Hi Ettore,
> 
>> The fractional part of the divider was being treated as 1/10000000
>> whereas it is in fact 1/2^24 (1/16777216). This led to incorrect clock
>> speeds being reported when a fractional divider was in use. Correct it.
>> As well as fixing the clock speed calculation when read, also update the
>> calculation on set in a similar manner.
>>
>> Fixes: 163152cbbe32 ("clk: ti: Add support for FAPLL on dm816x")
>> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
> 
> Should there be a Co-Developed-By here and on the other patches?

Not sure about that. This is my patch but is being submitted by Ettore 
in a series of patches that affect the clk system. We were working 
together on a project and at times each produced patches. Ettore has 
collected together this series for submission.

>> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
>> ---
>>   drivers/clk/ti/fapll.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/clk/ti/fapll.c b/drivers/clk/ti/fapll.c
>> index ae2f6fed10f6..8ab9acd57b60 100644
>> --- a/drivers/clk/ti/fapll.c
>> +++ b/drivers/clk/ti/fapll.c
>> @@ -336,8 +336,8 @@ static unsigned long ti_fapll_synth_recalc_rate(struct clk_hw *hw,
>>   		v = readl_relaxed(synth->freq);
>>   		synth_int_div = (v >> 24) & 0xf;
>>   		synth_frac_div = v & 0xffffff;
>> -		synth_div_freq = (synth_int_div * 10000000) + synth_frac_div;
>> -		rate *= 10000000;
>> +		synth_div_freq = (synth_int_div * 16777216) + synth_frac_div;
>> +		rate *= 16777216;
> 
> The 16777216 magic number appears multiple times. Plugging this into my
> calculator, I see it's 1 << 24. How about adding some defines:
> 
> #define SYNTH_FRAC_DIV_BITS	24
> #define SYNTH_FRAC_DIV_SCALE	BIT(SYNTH_FRAC_DIV_BITS)

Sure, can do.

Andrew

> Brian
> 

