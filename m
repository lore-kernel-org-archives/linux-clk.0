Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D173A1E7E
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 10:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772100395; cv=none; b=ECflCqRCw9BNwDbcOryxM/fgWdhpVAxUpXK/RU687EPOtslMk2WGC3XhBDFkZ79+EGeicymr0rIhwdbaMYyX8mJKJubkD/bQNFl3hVmfMCFcZII3r9v+VIwZnAKQ4/PvWAG0kfnPZARfpjg6/QzJtHwiaImD9b64dU/RjLUG4bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772100395; c=relaxed/simple;
	bh=Kb7Zr1q5fDprwOuIFKVHgYkCHY8BIbU86+n0nZmBXIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mh7NpQSoOuuDtlRDCtvPsgehR56Kot8UwXZFp2Cu16BkxLe1+exTEtw8k7OT6fCj+czIZseDldPoZvdSn00yJBKprBvWRFYEbldlPUUtB8UpgmE+DcTg/Yt37iLtCYAEG4bBjtOLSxi2P4Kf4EeiuCb/omFvbSDxy1hsy6PZIQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iUHNE/x9; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iUHNE/x9"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4398dd671daso717745f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 02:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772100391; x=1772705191; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M45UmrhuMMqbMjpIjOb+glFVXPQnqnkmhvjio0VGfRA=;
        b=iUHNE/x9ZjIVYoKad9cyKQce52Pn9/sI+xFBh2jGnzYfiNWEuy3VdbDhyVJooyskQ6
         1ooeYtBVTp1D0RhPPeOexSksG6gT0F3MPGTVXSS1eIv3UpDIpWcpUL5Fk8HH3uzSAKJg
         FcEy26lUEKvPr9lkD+aLL5nxrx/mRgSxQCMjf6YNUIubhSvgxqnc+DIKE+1RmMAPQfip
         9bt9NCjRj0qa1nqAXRxxRiRPRAr7KfalY4+ABvhhl+ihib5CVYkANsCGVX3pYXRD5/7+
         k/FZS+3afVXBZsD6qEq4RKjnb2/vcYM0fmVL6xaPlcfXjGNfl5+aVHH6twZGaVifb4UX
         hfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772100391; x=1772705191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M45UmrhuMMqbMjpIjOb+glFVXPQnqnkmhvjio0VGfRA=;
        b=LSHWw5wT/rAZnQ9gnxkugEuRgkM5qZfF4nq6o/fSsDcqljQJYBHuHP8JXo9WAZa1za
         feX2dD6gAFKJR6xkuVKL7nVHeIjsXm/DI0baCkt9CSpTWq9h8pbcRTm2bqLwA19PlfEE
         p7i8AwB0fS9Q8atQcAf/w6rPFPEb9Fsa1fJoZPWy6XOqUC3qmU8WZp8JBr35h/KYVEka
         qRs0/UUrLOifLKekLNeAtIDLzBo0KV7aneIeKtyajQ5+3t/wFfmTiHufOdnnD9/746tD
         aw9anM6yQdPLxSu9Tw+DIL8+7cpXfD4PZA5TdOk2HYXNsB6hMjP+H+VmVYfqtMCAeFGZ
         RZyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVmerthGYnQabzXuInrG+9qEfLG0T3cH/6lCalsSYfs3nv4p5264kcnMXCJPh2bEXWg2JcuyickQY=@vger.kernel.org
X-Gm-Message-State: AOJu0YznMItuub5MNlmSpZjUy4I/4Cbf/3QV2aY4J4H54KZyI12S510A
	wf4RmbjWs0ZjFlFAifT1H2tpK7CB2oTCKsFjMElBtjP+su/Ih+PhMPsU+HwzJNj3mKA=
X-Gm-Gg: ATEYQzwACE1lmn4eC+ZNwgt2WbOnKW9+7IQDZ6A08+GAEkzr8P3A7XQuDrqs0LCuWrk
	ZU58PpBpyhRv2auWe9Wt81ZXfFF5OLV8uU/98ZHbjAGFyjh70swKVoJJpg5POUPQltMtT9H67KA
	jMz+k3F5J+FwIZS4EPhjqWgnQ7kuh0F+f64mmnYu1Q+92vrndHxbDeB6FMfRCd8E5si9PX6jjz9
	Oh2G4WnosAum4NYKPk+UzhRhCIiX2ZZth2Z/i7dweaBy2yKerePnMQGHFwzsidDaI6zliSli2OK
	mFyEgqQCc5Fl1JCm5b61HYwKtNeNGVHKDZB5vVKFHTrN3D96CTzg5dmuzAKKy6JO0yLul9Gqkn1
	SJJJX5SwGjLC6RU4X3H42ii0kzzTuOpgU3guWtZcxmQX1awDDv+iTL6M9Q1anAcCZ/kxk7FVoUw
	JrkJGLEh+yPFqeypgd8TyBApIcRPJ6WawWflRqtVzhGGD1a8HpPAJHDFSL8Q46TVh9gFR9yKgS0
	18=
X-Received: by 2002:a05:6000:288e:b0:439:8d73:58c4 with SMTP id ffacd0b85a97d-43997ee07efmr3050767f8f.18.1772100390701;
        Thu, 26 Feb 2026 02:06:30 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4bf89sm38109724f8f.29.2026.02.26.02.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 02:06:30 -0800 (PST)
Message-ID: <d1ddaa7f-cfba-4e71-8a9f-70014c57de74@linaro.org>
Date: Thu, 26 Feb 2026 10:06:28 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/18] dt-bindings: media: qcom,x1e80100-camss: Convert
 from inline PHY definitions to PHY handles
To: Krzysztof Kozlowski <krzk@kernel.org>, Bryan O'Donoghue <bod@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-2-95517393bcb2@linaro.org>
 <CuJMpimPBtwHGAd5-YHUArL6FkU2HQeY4SjbxeMwf0ToQ7LKO3zWSTn86L-HKxC1KfarWc4rRbZqnCMQsv0pcw==@protonmail.internalid>
 <20260226-fluffy-complex-malamute-7ecec6@quoll>
 <35b1ba2a-e156-4542-b33a-d4e53f6a62cb@kernel.org>
 <tVxcOw7tqTRGXAoW06WPM_voMVBY3SO7Mm_MTMWp6OuotVmgmyi0DOgVHdDavO2V6o3iRH7ax0NosgHuzGkHgw==@protonmail.internalid>
 <4ebe2f26-29fa-4104-bc90-3f5aa7009ec3@kernel.org>
 <c2d9742c-3d82-4340-a11b-16370bcad5ea@kernel.org>
 <72f0ed74-ac86-4571-8a72-d41282349718@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <72f0ed74-ac86-4571-8a72-d41282349718@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/02/2026 09:50, Krzysztof Kozlowski wrote:
> On 26/02/2026 10:40, Bryan O'Donoghue wrote:
>> On 26/02/2026 09:33, Krzysztof Kozlowski wrote:
>>> On 26/02/2026 10:27, Bryan O'Donoghue wrote:
>>>> On 26/02/2026 07:07, Krzysztof Kozlowski wrote:
>>>>> No, it does not allow that. You cannto change the ABI.
>>>>>
>>>>> That's why I reminded multiple times before reviewing new CAMSS bindings
>>>>> for Milos and something more. Because once it gets accepted, you cannot
>>>>> change it anymore without valid reason. And there is no valid reason
>>>>> here provided. I kept these patches in staging/waiting for long
>>>>> enough...
>>>>
>>>> I thought your policy was - a dtsi had to have it, which we don't yet have.
>>>
>>> And from where did you take that policy? I am pretty sure my each
>>> comment is about ABI. Heh, I even commented few times about implied ABI
>>> purely based on kernel, without DTS.
>>
>> Correct me if I'm wrong. I thought we had discussed either @ the Linaro
>> Dublin meet or the Linaro Amsterdam meet that changing upstream YAML
>> would be feasible _if_ you could show there was no dependency on it -
>> say u-boot, FreeBSD etc.
> 
> And I mentioned multiple caveats and restrictions. Do you quote them
> here or just took the first part of sentence before ", but only ..."?
> 
> Anyway, whatever spoken is improvable and I am sure I did not give such
> permissions, maybe except that Dublin meeting was in 2024 thus before
> the release of previous user, so before v6.16, so of course you can
> still reshape unreleased ABI. And then you released it closing the
> discussion.
Well, is there a way to support both then ?

Right now I have csiphy and their registers listed in the camss block.

I could add phys = <> as optional in the schema. Is there any reason to 
stop adding adjacent csiphy nodes ?

isp@addr {
	regs = 0xCSID0,
	       0xCSIPH1;
	reg-names = "csidX",
		    "csiphy0";
};

csiphy@CSIPHY1 {}

I'm not sure if this is against DT rules.

The iommu items _should_ be fine as its maxItems so I can just set that 
to five instead of eight in the dtsi.

---
bod
