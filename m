Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6E71D0438
	for <linux-clk@vger.kernel.org>; Tue, 19 Nov 2024 15:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732029177; cv=none; b=aoQ41xwCLlpXaIXOiJDoo1irOqjCZNaaSdGB6jXO+vwMz3GrkgG9jfhrDzY+fySZBDOJUFbHGf+KZhXeUDCX/glV470DEEmozyIo6nKTP5ulTkhIvRhN3A2vdyUhOeVA6nekc6pCIjfP4x+WPE3+BpivJURbF5wud2ghrLHDuUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732029177; c=relaxed/simple;
	bh=mrd+ef5omKk4kmj9QBZVm/PCvmTVB8GvlJMDSSFnMTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OclVpqtR/Cv0lfoa96c9F6h05J88hVjjIyUcbWDSjE7U/F4Gn0jDNPy+aEnSneUrqdyTcY0bhJySMZaQ9GiA71/v6huK+IVN/BVTvPdSAyOgHQSnhTV/EpyS8dI+3s7fgcMB2TbJYOvO/INf8xg8HKwaYtzXmrhOyINUh+FrWN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PaF7dWVh; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PaF7dWVh"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aa1e51ce601so624218266b.3
        for <linux-clk@vger.kernel.org>; Tue, 19 Nov 2024 07:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732029174; x=1732633974; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1njkv7AEQYLprfmPF/SUU/CkkayzBBsZYgpz9cUBCwU=;
        b=PaF7dWVhRUDFt0DBKnN8OIYMtbFvQsDtEp1Kh0WGPRITJKksB6PsoYctE9OxF5IqEw
         6olRM22/oXj+GCo7ANZNieMX2jvLKs2COEo91TbI0GTx82RjgUd39etotXPZi6KnD3Wa
         I4rA9tili4UprJnKZsC9L/CKPFuGhMVVZJAZ3MB+Q6D5Uc/s63uqncYM4nt2WzRMyjDU
         CF9wqiG95KMrKe1z215sVh+DC/WXg6rB5G2KyaPy8klkv3QFGCTATmu/FsVAY7pqnHV6
         +OHEiKKWOeZIPJ/ERY/H04rEfTBESRmGROEX0AmjY1DHq67XjCz4DxO5XoSNwWfCqJHD
         gPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732029174; x=1732633974;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1njkv7AEQYLprfmPF/SUU/CkkayzBBsZYgpz9cUBCwU=;
        b=VxNsDYcvDSeLRVEPkaWHdN72EzyefniLoZkEkkzJenv2uZ1b0TA3x1++vIFh0p+2h7
         Zx1LEMP7/Eu4wraE53xZRVzJafbSijAfCAFxJ8Vrxl70nNrM+Q2eR1T7Qs+Hvn59+R2Q
         dpbSBZ96fq9AELTfX7yNf8tASWssTtLR0TiXPmOQM/aocF+t9TG/0+iAkWInNbfL21RL
         7ipvKw24TT3cM5aiT9itfywuJJH2PKVHtIZjghNsAjtMyv0yOMyTZE59VFWH4rS7MkD6
         dZOCJnn+SIJUSPH3rmx/3G9/8qvf9c/oGCF2nm9ykX7+YKQnTDmZpC2PElTAwNCUIHtY
         VzBA==
X-Forwarded-Encrypted: i=1; AJvYcCU/2OIsCTZsuCX1Z05EE4WSMqTcisd2yuahMVQk2+PHWe4Fl2/PTqQNLfANt8fEHNP/HvG9xbjKquo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+gUVwdzNjSPajsvaAkmXgSrlQkyoKAOdXMIhBNVtWcHYYLNzB
	ippTeoFmwj0gaQ3scmNhZsk8b8y1LrP4SsGJ9Vg46kWB+Q6VBh+eqdMG2stMVvU=
X-Google-Smtp-Source: AGHT+IHpPhEpx8FCZtw2jo+T5uqwAc8vudJk7VsZfwZwUsidD+p95qcWn6QPKWI6Rv/z0jxfWiKNDg==
X-Received: by 2002:a17:907:a0e:b0:a9a:3da9:6a02 with SMTP id a640c23a62f3a-aa483553f62mr1583241066b.60.1732029174122;
        Tue, 19 Nov 2024 07:12:54 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20df779afsm658092866b.85.2024.11.19.07.12.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 07:12:53 -0800 (PST)
Message-ID: <6b7bcf86-9bc4-4608-9f2e-b14c17e558d8@linaro.org>
Date: Tue, 19 Nov 2024 15:12:52 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] dt-bindings: clock: qcom: Add second power-domain to
 CAMCC
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org
References: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
 <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-3-54075d75f654@linaro.org>
 <91592bff-4042-49c4-b884-8113d0759a3c@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <91592bff-4042-49c4-b884-8113d0759a3c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/11/2024 14:47, Vladimir Zapolskiy wrote:
>> +    maxItems: 2
>>       description:
>> -      A phandle and PM domain specifier for the MMCX power domain.
>> +      A phandle and PM domain specifier for the MMCX or MCX power 
>> domains.
> 
> It's a list of two phandles, not a one or another one. Can you please

Its two for x1e80100 or one for sm8450.

I'll find a way to express this more clearly.

---
bod
