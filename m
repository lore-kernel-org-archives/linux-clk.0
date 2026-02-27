Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FDF332606
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 08:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772182131; cv=none; b=HkFtf31ZbGCgUtZXNxZqOLLnkGPIVlwB6/EzTTkSCBBxTGZalvysTGqAkQbmJqbyK0Rel6ih3bMApMOc8KBFuPQWiBAIbabmdP0W/4JDt1w7ay4Rs4n3zC6WId2d9eG3t0MmqAyBFtF6Tt5/YJhxl1HkiKSs43M0xOJ972oZYlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772182131; c=relaxed/simple;
	bh=+C2AViCGBu6JCnL7njP0l/RXkEu3njPw7S4z03Ac/Ws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yvy9YrsoMjOWC+QO+e0lfi3MJEMPmgYRRegX33fVUGmnUVtiD96gADkFv2FL0BfANTHyZOmU9h3Kz/p36x0Ki89ySCT/EYzw7I5NP0QR12WBobWLTqouviZcd8EpVSYVGpaTEdSGDM+99GsGrVJu/ikM7sOG1mJTvVcyxma9ZEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tZctkDXb; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tZctkDXb"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43988056dc3so1758951f8f.3
        for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 00:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772182128; x=1772786928; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DygztlrJ/2EfLqsjEMNZWS27dKKJ7KUU3T7C84zCrOQ=;
        b=tZctkDXbiUHo/OXhkW0WyGZX6gNs/L+qk6jXa5ayADuO3XIbWqKLLDwIka8/hqiXyO
         2wgsUKCB/lBPi1KnUKbaH71LDryBTX9+By11Vrq0VQYlOdm6eInYntouyTskl/ykQCTw
         3JPcktBGQu5sTCD6EMRVPAcPzTUkNF7CPFPpYqne4XGgQgnhDc0pNp1NBj8oN77Hxco6
         B/gUhpVnQtx8qKkxt28Awrz2hW7fHq6oS1nsFxHq6uVUBvChWBNXT+pK1E8mTbwWl80v
         LwGRqCelU4h24IBRvRMvim13Bmgd4tamO5YgHQdmTgR8VUJnOFOwu+ywGim1cOmAGSHB
         zTAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772182128; x=1772786928;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DygztlrJ/2EfLqsjEMNZWS27dKKJ7KUU3T7C84zCrOQ=;
        b=DonnCtdUIBwmk46VPkn7OXUekNSN5AZgfbYtjPfxd5vaXTHY4mfMnmn6n6ptglrsiV
         LbKWbwptKGzMXefQHuFDzGgVB15s4tgxYLACM+quXWI7BJQVdqisq65BPhLNXfE4H6py
         nkDUfbBegVExux+ygRtdvmYVeykXnzQLW+9FIOLIxvWqZTQOnQiVLsLZQ0bSJb7K85Ad
         zZxGRbJaX55Ms36+PSAyV56TXbx4An7KheqG6NvSEFwbqChFDeL5dfGOp9FNlweOtzVT
         Mtm7WU3QCSdsCkPOlc3izLR+kUzD0SR08qhMFsO3jiBwKjsKm7cPOzcXbUgjMz9j1XhX
         DSzA==
X-Forwarded-Encrypted: i=1; AJvYcCXVlJzf6+R7XDH1fvxmzPJf280Uo1gkaSk8gP86NjSwraABY3QthcN1EErQwr8/hLOaISIlLL4x5V8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNlWtmWbC7LI6Kjr6pj1quk2iG3bxpOCjdBX87UJ3a42Ux5B2D
	FBF6xglQ7pTXp4FLVPOhIwPhWRl1IUqB5bm7J/XYkN5MRU7mWN7eDFnc1p5RHGd3aH0=
X-Gm-Gg: ATEYQzxjSeeryiPej3+7bu9IsUkfSeqzROynlTThYEPHWZrCNdw3JKeyf1yii5wyqjS
	Qksf/m707iQBgJ1QNQXJ2CjXlkmaQ6DJ9KN8gxTC46049sF18B+uS7j47MWYoDKFS3pqZPh9i5t
	YlbcaA/UObeVFhE4zZ/40HtNXy7BWH6i1BaTndzdaOPbRWG3pla7KAPfUBTZIbD3QZiXlyM1nRh
	HfGtIa0mEvSBzZuHut/IDmYjFK43oNO9batRg8iYNtOg3IdFdzZT52GDhi+8onnvTts9xOX5ok+
	TS+o6T/bvoqABKYhvIZCj4xwWZd5JR6GreFSwP2HGbZIjKMRYmQ67FQ/H5YAiPrGodWXm1loLcK
	LUi14AVNyu1qJmNJUHmMTDicCSvuaHi0hZo0SE7bWYF1fcUBRJWljvU6ZlwpvSEPlld4B4PrOrF
	GUTI9RKN7F2O+e7EQUjgyO2ueJQSGm6Z3iQ7QHt6SSnS1wfnn966uUWwH3ou+2OGR9
X-Received: by 2002:a5d:4527:0:b0:437:664c:3f28 with SMTP id ffacd0b85a97d-4399de4a684mr2333826f8f.47.1772182128271;
        Fri, 27 Feb 2026 00:48:48 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c76b40esm4856509f8f.36.2026.02.27.00.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 00:48:47 -0800 (PST)
Message-ID: <71fcb165-7fda-4714-b56b-40d6537b8ccd@linaro.org>
Date: Fri, 27 Feb 2026 08:48:45 +0000
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
 <d1ddaa7f-cfba-4e71-8a9f-70014c57de74@linaro.org>
 <934812b1-a853-471f-beb7-3988eff0856d@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <934812b1-a853-471f-beb7-3988eff0856d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/02/2026 07:24, Krzysztof Kozlowski wrote:
>> Well, is there a way to support both then ?
> I would just not touch x1e80100, but if you want then probably binding
> should stay backwards compatible, where you keep all properties intact
> and only add csiphy nodes.
> 

I really want to stop adding new stuff with the legacy way that has 
broken power-rails, even if that means x1e has a bit Frankenstein binding.

>> Right now I have csiphy and their registers listed in the camss block.
>>
>> I could add phys = <> as optional in the schema. Is there any reason to
>> stop adding adjacent csiphy nodes ?
> I think no.

Great so, that's what I'll do.

---
bod
