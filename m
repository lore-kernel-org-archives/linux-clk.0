Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A92A42846D
	for <linux-clk@vger.kernel.org>; Thu,  9 Jul 2026 15:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783612233; cv=none; b=WCnj2IF4wglLJcTMgja4PonTdrKNN9JdKa6W2Arf6Z/2nTf+okgVROViDjfXIM1P8IRBFACNmJpwyblkTEiNlET3GmmT6v7griZ9lGt4Xan+4RnaIR/Hfl32MNqRgHZjh8XACyZo5isokPvbLL9lh3WbxlLFYRrIRoGyja7MmCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783612233; c=relaxed/simple;
	bh=eom0WPIbBG5Lak9ChFz39EfdnHARVndwf2X4ZpXwW98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YxMIvXWkYEM0ZhbDg20XzIlCSm3rrMb9XbKibA7grnn8wClX0N9q7EEAd6/9mV9IuwVCHgkfdutBgzOcegxShy9Yqq7+16b7Zvgmk6a9Ks2uWNMf2J8Jk/9fzPgtLDrGpiSriReWQ+SYqKxJ8IGkHKafEBTLGb2wnIKcPARZRxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SoTo8QRY; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SoTo8QRY"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c15e3141d02so1996366b.2
        for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2026 08:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783612230; x=1784217030; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AzNulL+Y3yaGtB2zj4UUmjmsfxIxbrKupidFWaMr/Xg=;
        b=SoTo8QRYzRgHEUewqesNyHLSKMU+2EsHm5msBTW8T3pOQQwRvr/IdtPDiVVrbcr5aj
         da0ZqE/P/r/vmA8IYiMkWaWovEFNXBEJyIVIAgGakNfRFZz1Cw3+Av8eBJsSFHUnQRGu
         fYZc2cYEbfAOR7aHlzHhV6muKdaAmppCY0cmm5uWvZLgpN2+0+sthCOAXuDErb6Lbrgl
         WPMqZAmVlEKmJSuRTnVrJoleRonRhrfb6pbd2LPy5aVqIEeqvm/UVjE9JrAUzs5bQzPq
         Wjn6ww9AiqvFpnOIGCe7LdrmFrkhH6BGhDRuoeY72378cH/poF643VJFEQKcWaoIb+D8
         v2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783612230; x=1784217030;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AzNulL+Y3yaGtB2zj4UUmjmsfxIxbrKupidFWaMr/Xg=;
        b=YDSEkOjdKGZ1wip5qekuKGht3hRO1v3tLfv9kW7FFmOWcy40xREUhDVv47CQdUvFUn
         Wvso4bQ43gTdQ+aMkDS+KvkrCTFPqX7VuKWPj8JdtZzgC3ZamF2Gv9A0i/BJCj1Rnkqw
         LNFPwp8UwSr28LTdzkeI0/wE+Nfp9AJTSr8683mqcx+Xbu0o1gU1MwDYio0wfivZ3QIR
         ShJ7DMxIIeT6O7S8UTEOvV+D6cdDrf044ggeKpdC1jz/3cxmG5vZuadmDmaDkpP0tWIy
         +08tX+fs20Gtz+sNxeFsDBNEK/rHatqrufU/adsfEhpwGWkDwlLMKbBrdONRgrZ9c0ik
         78jQ==
X-Forwarded-Encrypted: i=1; AHgh+RrYYsyCdGx9y8rKdr5484irK4P9sJTWeOhg5/SCiVQKJcgoulsBhTE8rAhks81B3yP/l64YbOCPcW0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/met/gTSNU6u338pxk8sZJ1wOdXLJS4KbVFzSsHHcaKmwEBkb
	Ji1vslePp9pPJyOWA0PRAb3qvStxxFwdK5ryZT+u7s+D1GwfHax78Z0G6w7ZyuRbNB8=
X-Gm-Gg: AfdE7ckqzx2wqalIrzeaASDda+I+aeU5sjcPp1QjvspKHIfbugAW6OfUQkhq1P21ro+
	iE8pZ3ScwyyUgWlOU0NXP/2gqFcLHL/OxFArNVpU23ECHjQ74cGgx4bYhc4+jPzQzZ7fZXkN+Y3
	KLdfQ8yR9Xcu7RZn8owokJ/J+gLsyKdbZjSAjUPGIHqjj9CGnbLygFIggPkPfY837ysdhW/1r36
	lXfsrpdpeD+98kL4dQIWm2OZ/Da4Q9bwXSzq/dF9qS1yEaE6OF8VqniryUZjQX7JTRMwUMAQxdO
	tgzOUgPkFN/rXZx8EnEUfSQ8wc8Ph43Rhe0HGtenCSNRzaQskovuJ84CiHdQedLzugb21mKOLVt
	rhPWVKTwJwMs5EEUSI/IIo9UubnKRDF3QQCZTDgMvaPGVX69cvhstnVbtQEjsmK/CQIkaufcwOv
	fbr9nSmeCeac8ucMJu2wk+28kc
X-Received: by 2002:a17:907:2684:b0:c12:cacc:92c6 with SMTP id a640c23a62f3a-c15ce229e98mr373985966b.59.1783612229849;
        Thu, 09 Jul 2026 08:50:29 -0700 (PDT)
Received: from [192.168.0.101] ([93.107.71.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d4bffdbesm284895766b.45.2026.07.09.08.50.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 08:50:29 -0700 (PDT)
Message-ID: <abb179ca-a3fb-4bcf-bf7c-9766f939431c@linaro.org>
Date: Thu, 9 Jul 2026 16:50:26 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/6] dt-bindings: media: qcom,x1e80100-camss: Describe
 iommu entries
To: Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
 <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-2-f8588da41f16@linaro.org>
 <HCPw5KYwtYb7jBFED4lssTvcaMo2bK808SHkTWNR77q0DXGPQklaADJXvuyeBrXh_GsEMKdiaaktkzQ9_xeseg==@protonmail.internalid>
 <cbc1b1eb-0064-4999-b829-2bec451c682a@oss.qualcomm.com>
 <f307848d-6abd-4e96-9183-36f8599026ce@kernel.org>
 <85a05836-6298-4111-97ca-80d7e3b3a9c4@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <85a05836-6298-4111-97ca-80d7e3b3a9c4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/07/2026 16:28, Vikram Sharma wrote:
> 
> On 7/9/2026 3:02 AM, Bryan O'Donoghue wrote:
>> On 08/07/2026 16:15, Vikram Sharma wrote:
>>>
>>> On 7/8/2026 5:36 AM, Bryan O'Donoghue wrote:
>>>>                iommus = <&apps_smmu 0x800 0x60>,
>>>> +                     <&apps_smmu 0x820 0x60>,
>>>> +                     <&apps_smmu 0x840 0x60>,
>>>>                         <&apps_smmu 0x860 0x60>,
>>>
>>> I think only "iommus = <&apps_smmu 0x800 0x60>" should be enough as mask which 0x60 is implicitly covering sids like 0x820, 0x840 and 0x860.
>>>
>>> Regards,
>>> Vikram
>>>
>>
>> These all come from the Hamoa iommu defintions in qcom docs.
>>
>> Can you double check for yourself and let me know.
> Hi Bryan,
> 
> Confirmed — all four SIDs (0x800, 0x820, 0x840, 0x860) are valid and documented for IFE/SFE. My point was specifically about how the ARM SMMU SMR matching logic handles these with the given mask.
> 
> In SMR hardware, the mask field marks bits as "don't care" during stream ID comparison. With SID = 0x800 and MASK = 0x60:
> 
> MASK = 0x60 = 0b 0110 0000  →  bits [6:5] are don't-care
> The four SIDs differ only in bits [6:5]:
> 
> 0x800 = 0b 1000 0000 0000  → bits[6:5] = 00
> 0x820 = 0b 1000 0010 0000  → bits[6:5] = 01
> 0x840 = 0b 1000 0100 0000  → bits[6:5] = 10
> 0x860 = 0b 1000 0110 0000  → bits[6:5] = 11
> 
> Since 0x60 masks out exactly those differing bits, a single entry <&apps_smmu 0x800 0x60> will match all four SIDs.
> 
> That said, I'd say this is more of a preference — both forms are functionally correct, and if you prefer keeping the four explicit entries for clarity or to stay aligned with how the Qcom docs enumerate them, that's perfectly fine too.
> 
> Regards,
> Vikram

I rote-copied with my brain switched off.

Your suggestion seems correct to me.

---
bod
