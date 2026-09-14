Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAFB400E11
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 11:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383808; cv=none; b=TzMe/PE/SbF/13N1JufTIk7+BMJO6YgWAbqAq0Ua7snuEWYMmM4sSFDWN+RNrNSIB0ZF8KQ7Uf519UPPdctEFGgXtlwifyvu3+4eHSpo7o9+CoacQidXykbpwtl33wP0YMPDXOBkvO9EPXNf2w2SQjLKs3NeqzdKUHm1FrU4gc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383808; c=relaxed/simple;
	bh=u1qAW3Ps1/ms8o++TePT35PSy+z+WCTmNWWT04eGCYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TgNLM2U5liU2GMZRs7k/ZffVpyP6r2QiHVMArO3T1+slPxWn2Zem235ra0pjWHT7Wb/CBnqAt00tRlScDwHVmXDLvJLr9BEFF6m5KU8akK6M3MSEAFGq/l7g/U+30yWOkYSxrZqj+QevXmAf+0vGYGDPTflbZwxGBVmXI26lwxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vS0ld2F7; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vS0ld2F7"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c294ad260fdso403725766b.1
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 04:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789383803; x=1789988603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xbly740beuemqSo1bscqb84tM6a/tiFHYniiF7SfuVo=;
        b=vS0ld2F7cJuuK+ywGYMMAdd5Yi+fY+WhBzUAHWxaFr4PEJ/UpeToQjsjRt3xkBYX5b
         p+Tgj6TVvRe/yNdPLIl1fb5LUIQSaXT3CZKQ8tawm2cS+/LDYspSAb2tl3Kp2Y7+tEvB
         /O6ZYmMH1HNjJD0Os1SSe5z6BX6yrm9pi8spaC4c3K+adW9kgxTyv5kqLPE0zwP/ky2V
         kxGaYHywiEolYwJyXT7FCmOA6wPW2FjaZcbnmG+AODyqxnIqDRS92s7jtp5+AsAxpho0
         iEyURcYAAx6lskuaDffNKcpHBi2Tpqa2TXflnBqkOqlHJH2y8qsnhf6qALW4HizoQOYh
         kzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383803; x=1789988603;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xbly740beuemqSo1bscqb84tM6a/tiFHYniiF7SfuVo=;
        b=d/je6YmNh/A/m4XZbM1LjRhFDl1VT3wIKP07uElRwBrMUOyMx91WTjvH0KgNNkqvTE
         lRUPNpRZ0YGLpKW2g3eRpsPC8sjfGGxDLdpV0hB+7di0rVaK8wpjLYuLjXdiPG0NS3Lz
         Af+R3hEMpwcl5drLWwG+t++U8YsU5QtkKjCpfYJd6wlkf7MFwyIq4y6Wr4n7ExXBBW5M
         yIgWnGiMhA9LPN0gfQRaQ2UEepEzeJUMitGKwzzqQJvB4WRWeAwv0KUzplQGRZUCZehE
         /4gdmLUY2HCbRY+11k7rIJitDMhnN8Cu2mwc6/2yUBHOsSzGuSePJ98Ptx9nzZTchi1V
         PDzg==
X-Forwarded-Encrypted: i=1; AKwUvBw9nyGCGn3ZOJ0+u1zpYr2CkmCPYIEEu2CbP1LRHDN83xhaUqr44QfWdmev2wm2dBB5Ri4TzH+j60Q=@vger.kernel.org
X-Gm-Message-State: AFuF++l89aInp1UPj9uO3VgNJ9ZtqOs11//pqK+Ya4OuYyApnQ2guTeP
	DOIczO47LbWV2viIeicu1rikVwBaGbeIFmqrCXXIBkvIky8O9eyPXHh6wPKMXBMOoRo=
X-Gm-Gg: AYBFou326i7ZQ/KUTityNamrfJcTYNKbU615liPIlnOroUvRZO8w3Qf/QPm45CTACR6
	hEbY9aecAfpiHZ+gXxgCLUI4RJ/Ddp6MGcjF4/U4LEYZ0DHzOVxwE7gqZ/DGwzVNJK+CUWWW+Ee
	dRLU6OYOnfrfPIbqe9OHD5nSjAmNTnsiKlDNjr0Bk83ORkZssDbv7UDs1E3wLCchn+LUxZnw3CL
	i4xpp/iAJHGRzyTHkj8wQEKaiT+v6Dp8bSh5IZp6mlJtk9lT/vpkqqKiWNjR7/PWJrDNonyVHz2
	V970YwDXGGwD8rRe5OJAu1FMwnlEdt35aH7bHTdwynNrnITLNc2m3Q9g8vIrKv/HgG914gGVSl7
	uXdXQXJC+8ltk0d1QY8gPFQEDnAwQhU0vg8FSClgmdN01eKIrHKhlzjB5OWY4eEAW4Qbntzq8LG
	B5ktFyu6vVJdQ0hPRfxJ5AdP9DDs4J5YRnGCERePS+t8ZOo7fx2QLM+2YfU4Trn0nN7HDIc5ssS
	iZpXF0peuiVbMxWka2R
X-Received: by 2002:a17:906:c156:b0:c25:833d:3839 with SMTP id a640c23a62f3a-c29a437c67amr329463066b.15.1789383803122;
        Mon, 14 Sep 2026 04:03:23 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.248.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29852497b0sm286364666b.38.2026.09.14.04.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:03:22 -0700 (PDT)
Message-ID: <ceca8547-ff15-4f5a-8844-8ec9061a5e6c@linaro.org>
Date: Mon, 14 Sep 2026 12:03:11 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 3/5] phy: core: Add devm_phy_get_by_of_node()
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-0-f7bd68b5369f@linaro.org>
 <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-3-f7bd68b5369f@linaro.org>
 <aqRuCfmgPqa5h0y4@lizhi-Precision-Tower-5810>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <aqRuCfmgPqa5h0y4@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/2026 22:09, Frank Li wrote:
>> +	if (!link)
>> +		dev_dbg(dev, "failed to create device link to %s\n",
>> +			dev_name(phy->dev.parent));
> Is it okay to print dbg message()? suppose return NULL or some error?

This should be dev_err() for sure thx

---
bod
