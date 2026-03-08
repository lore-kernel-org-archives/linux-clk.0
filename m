Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FCF334C35
	for <linux-clk@vger.kernel.org>; Sun,  8 Mar 2026 16:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772988174; cv=none; b=UiKMVFFABmbm7F4pAvEZmFnJxBFcx/3pnNILwW6NeN+xcMuZWxwDXiyFVvdSTSKrMmgyvGGy94wicVWtWJRR3cW6p/HVDdiFHalwkRhLsdcik+UvNS9aIR25ejZkX/rirwGU/2hxnLkCzYv3+JJR2DV8v4IRu/sCsKQvFqQp6U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772988174; c=relaxed/simple;
	bh=OeH0I8DlVaArA4exlIvdQ30+K74/rg+TRPmWoK5JWtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=G+aSXAnErD2/PNQFX4Gxf8LLA71JRZYYsC903D+9xuWxPK4FTHwJoDzaC81hMl+nJuNHWAsQEDUDPz98TKzPT1u+kVFQYQA4ouFkXR57qYzv8yJ/UctyM+lqNEx8TiRLIW/BcdipE8sgiTjSQDyhKKC18XjdN/goc7GIq68Ntl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=mDvkB83m; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="mDvkB83m"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439c944bb62so3371697f8f.3
        for <linux-clk@vger.kernel.org>; Sun, 08 Mar 2026 09:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772988172; x=1773592972; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A2k+tUSmAU+cizjj171ExMhB4UUnW5oz5jUnwF8rErI=;
        b=mDvkB83mUBgNloaTdKGjkcgYcD/GayY6OlIB8d+xtiAaGONSF9DTjFjZKT8uakAr3F
         X5Ro03Fh7sR6gdag0ihpyXd0Ogn0uJ38xxTtjOhmVcPlPBlvfqn2ziubQrKSHp1e5syf
         y23lHN5yEtUoiJyFxy8K1GNxFzCnGtjbov67weXqQUEcdPUTspSDXKM8dbhK8aN+Di1J
         DCBG491yycGE6ZeCs6FQ7IbVZAeJyQbpxWjywz39x1/bRwrO7dIXkpDWiUBp2hrb+oJo
         WgaYPkJYqGOVjsW/os40d5ORoAHEerKCxhpywYhphqi+uts7mwFC+IlAy6dGb9ZVEL3S
         Kg+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772988172; x=1773592972;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A2k+tUSmAU+cizjj171ExMhB4UUnW5oz5jUnwF8rErI=;
        b=apzgFpMybaQqTzn2hhjGrwmsjJ1je+U53DzEXzT2l+Gvwdv6H78fTf2dNxlQYHY0MT
         eIESJQgEkOkS2tuy2d+XS+JyNWl1FVlmYUgys5BN3Xrj/hhXQfISqSQlBt13fxIYMAcW
         Qm9VepdJzy4Tct+TAZx3lceZgkXHqib/OlRRP/UlYi+33wLx2XCFKLKe8GL30VWqfQYa
         IjWh6zOgRd/Pq+ov+AFwsA7cnRwE4iE0f2spt4byGvPtM0bnShb1NNB2/h3jQqQxdXrq
         tmzcuQCSLd299xKFe3y0ECOcJsnPJdgpHcmQLdOuMSnxFQBNBPZlLBMYeVmvxTMNheKC
         Bu6w==
X-Forwarded-Encrypted: i=1; AJvYcCV4fT5lDkatUrVFrr2BmKOGkP1C6gWASafOtc7ulb+afwPupsIXatF2Y/fBHPY7f7sod371nQg+igw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx938qvHKOnXVRB7Q4oSk7a3MiXWX+zxGgzOgzZVqFKKyLzdgw3
	QQIWGyTqI3nV06jTYFiCrL03nK7Gb9MrvxNuvuIaHdILMCjwL8FM+YKdJBzSuXXeOyE=
X-Gm-Gg: ATEYQzywuZrPMBsUPYSwN7rWpDdV7xgSLkT09RkdjGoD7AxUG2L/pvgqq0dJLRcalz0
	K1xOa8Gbzve3RwUObyF77YhIlbplkubFf1JtcMA0z8//HY+dK+n/GX3brwcw6cdJu9iNCejiEt4
	820KqmMhH4oKgOQcc8adK+I9u5iXw42t1iU4WctdkbkffnVT3B9RniPYsyfQohD1a6pJX8gKd7l
	DlJ/zl/QFJXSOoimuKSVcLcaEYxjIbnC9CQv/3r40tjOcPAoEm6lcL3hj2EGR8h3XRzKzU3vGhs
	/elPaINzRod8Ff2tNC5rS2+lQzkHx1Q8+QTsyA6qoHE+NO9LzHw/7GDibW1nrmPXnwOY6wCtjKy
	kMTpgpTyotgZTl5/2OTJiLIz0nhIqoJlJBwngApSh7KFwl3PDmP4r3ALOt3Kgjg8S/1n7bnfwqv
	TrmHZ6A5Q191zM7YZRNNsp6qxf8TDY4A==
X-Received: by 2002:a5d:5f93:0:b0:439:b791:f920 with SMTP id ffacd0b85a97d-439da656af4mr15645490f8f.17.1772988171670;
        Sun, 08 Mar 2026 09:42:51 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dadb85b8sm19331707f8f.17.2026.03.08.09.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 09:42:51 -0700 (PDT)
Message-ID: <cebf4298-4dff-481d-9a77-09d4fb4f7fbd@tuxon.dev>
Date: Sun, 8 Mar 2026 18:42:49 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/19] dt-bindings: nvmem: microchip-otpc: Add required
 clocks
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
 <20260120154502.1280938-3-ada@thorsis.com>
 <f406abde-c7d1-4ed6-b7dd-5336956bc795@tuxon.dev>
 <20260220-bloomers-runny-e69ab1966b9c@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260220-bloomers-runny-e69ab1966b9c@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Alexander,

On 2/20/26 11:58, Alexander Dahl wrote:
> Hello Claudiu,
> 
> Am Sat, Jan 31, 2026 at 05:47:05PM +0200 schrieb Claudiu Beznea:
>>
>>
>> On 1/20/26 17:44, Alexander Dahl wrote:
>>> The OTPC requires both the peripheral clock through PMC and the main RC
>>> oscillator.  Seemed to work without explicitly enabling those clocks on
>>> sama7g5 before, but did not on sam9x60.
>>>
>>> Older datasheets were not clear and explicit about this, but recent are,
>>> e.g. SAMA7G5 series datasheet (DS60001765B),
>>> section 30.4.1 Power Management:
>>>
>>>> The OTPC is clocked through the Power Management Controller (PMC).
>>>> The user must power on the main RC oscillator and enable the
>>>> peripheral clock of the OTPC prior to reading or writing the OTP
>>>> memory.
>>
>> As this was not mentioned in the previous datasheet versions, the current
>> driver don't handle those clocks, and it probably worked as the clocks were
>> enabled by bootloaders, I think the clocks should be marked as required and
>> this patch to be propagated as a fix along with fixes on driver and device
>> trees.
> 
> What do you mean by "clocks should be marked as required"?  Where?

In the bindings as you found that the IP don't work if the clocks are not enabled?

> How?  Is something more necessary, than already done here?

Update the required section in the yaml file with clocks, at least for the 
sam9x60, as you found it is not working w/o it.

I presume it has to be done for SAMA7G5 as well (as this is what the newer 
datasheets states) but that would involve adding required clocks now which were 
not needed later. I'm not sure what is the procedure here. I'll let DT 
maintainers comment on this.

Thank you,
Claudiu

