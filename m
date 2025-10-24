Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB233164B4
	for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 12:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761309286; cv=none; b=ZaTRuNWVPg+fjp/JpPOV3GFlPOfnxtg8oyr39L+XEmpfGbCZZF48anRxOncOZ71kPOctVPK+p7BmmPFVa/+3bYM/mD+gd7rboDqRmmN+IZJtD2nifYnB3kQXvLkoBKdoVYHnFeoJBUB1WHIrR67izQ9lMgzal7rsv1i+qHjPL0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761309286; c=relaxed/simple;
	bh=DfsLw55qVEyWsq1GH2z7Ret4vbW8AQypWgF53KmOf9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=laeQvFdiYVRMr3RIWMRcE9qO1ngWe72a2TMYjj9bzKdGLBhazkNLpay3QXx1EmdQOsezkCtBtjt3FANrJrQ9SlwNK2KwgrQwgbhNomlsX1pSVKOZniii/HvjyW4wcX7m7LGjh13Fi3C7w6sOW+xHrBGR3ChP8QHHFsgUDaCjn0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VgosSDAf; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VgosSDAf"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b6d70df0851so131070666b.1
        for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 05:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761309283; x=1761914083; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vkZxhv/GZ+0mzfo95Y14AIl8zEVZ7txWfcdhXxNhCg8=;
        b=VgosSDAfYyjz8vTC7x1I/C+69R7/Jl+HXckwDz1+Jz247EHv6F9rvOuWjqlSnFXN5i
         vaN6iedfpk185JTXp3usquTEAJvrdMjvA+QV7v+QpnFIMzlUediM7sS5S4igqpQS8nZN
         LhQwi7Lus+wxRALE8FFEm64+27D0/OgN3QeQu8Jju7exafiFFU+uXmXITOxHPN6XkUaJ
         JF0tDz6kUszK/yeSYu6eb7ZwgC2YLv2m95K+7NUA/L0ndWYZF4zbhL2Qq18TxLMh+/ba
         7bus177pagSWBkVJovnD8c5pmjeUsnuG+HOTQVpeqDzZw9YeznS+8xyumrbmi2snMwKM
         YUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761309283; x=1761914083;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vkZxhv/GZ+0mzfo95Y14AIl8zEVZ7txWfcdhXxNhCg8=;
        b=kuGEVtmQnchnzt+KY5twAUgzPZL4pD9ujgY2CrtJjgOg6IQXq0Oenir2WFbRvsbVso
         ltAiqKkeDz0bpJRJ7RE5MBszTVHayBaxH84C4p9SAiMAT0lDCBCcVRHx14q5VsmQ4KyY
         zDsCeI1TQs/hVqsUzIOqPwxuTMLC1tHVSBDIeqpKv3ymjhhazpC4aoNz0HTPGKa9FmGh
         s03PNYavklFnUVT5F46JWr9Dv7QXzBGTrCt0wUyXt6ORZCTUFsNYXyZIyKH4/6AMGRRc
         dRA9MHH/WTqPReaUi7nkdxnr0dd6ydepzag+PXXxVzo/Xwa7G/Zkv0Uoy9tcdSV0P2+/
         mjIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUY4iTxYk/RZNPd0JvuscpfeQff8Yb+v7Xx6ewkZNBMnKNp6R+ylJfwrqdYAX9DVcEMjEWTNPTh4OY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn94kW0flgDWoZlw5Ik6eitFINOIoU0pSKngCXkrIfirHLgNAo
	rMZPGRsrnhf+Kui30HqIkMJZP2idV9p13LcXlJXCNmK+REciai8AznSR
X-Gm-Gg: ASbGnct6nRNwE7ZLu2+BGMcYA5z/XIr3wYL/1oSZiTfxAXB08BYE2YFK0QXJAaeOYJl
	NJrvY4m1Hjpv3AYMDckBt5A2mNS6+6mYTC+hkQ6CRI4L5Fs3TG22ukOfhVvxE7WSMRocoWhNIMT
	A3nc/kNshLwFfL+3EyVEEiFn4v/lMzz9R3e08Hk2CSZJ3397KGFLzW1wzSNdiNDSaiI/kfdzyaD
	zLQ5mLAtPzwAy07d5RHyIOv4Pe/DOmd0nar818JYGi6BMYVadGGXZsieutmwreGWLuob5eMMcuS
	qgtQekkmKvIkP/eBpVkUA6nOf74a0rMWa4pzMHqaNwctrm8BJ0bkxV4MSWDxu+Jx4J/7Qwc3PI1
	q8pDMwBqLQqsORXbKozXC8DtJ7269VH8K6J5w6GnYGvxig9GjMyTvH4L0HnC9RQI6XDj3aWZKGo
	yDkZqtuk7d10Y+a37m639MJ4TKOc9w7CmFS2vLKa7OxGjXl9/Wy8/qSw==
X-Google-Smtp-Source: AGHT+IFSr/XYwfRfLIFaIqsUt5jHZeJv+L9cUEB6LNpHnU0h5lq97IHAgFvmzs6a4QTfDaRVom0Xrg==
X-Received: by 2002:a17:907:25c6:b0:b2d:a873:38d with SMTP id a640c23a62f3a-b64749408dbmr3638894466b.43.1761309283008;
        Fri, 24 Oct 2025 05:34:43 -0700 (PDT)
Received: from [192.168.1.103] (79-100-18-255.ip.btc-net.bg. [79.100.18.255])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d511f8634sm518519566b.29.2025.10.24.05.34.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 05:34:42 -0700 (PDT)
Message-ID: <9594fa0e-22f6-4412-a967-6d5c1374da48@gmail.com>
Date: Fri, 24 Oct 2025 15:34:41 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] clk: samsung: introduce exynos8890 clock driver
Content-Language: en-US
To: Peter Griffin <peter.griffin@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251017161334.1295955-1-ivo.ivanov.ivanov1@gmail.com>
 <20251017161334.1295955-6-ivo.ivanov.ivanov1@gmail.com>
 <20251022-savvy-sly-auk-a60073@kuoka>
 <CADrjBPpXStuuvbaPZ+knb8fiGQja_hdX42PKfj=bTNCdXPCN9w@mail.gmail.com>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <CADrjBPpXStuuvbaPZ+knb8fiGQja_hdX42PKfj=bTNCdXPCN9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/24/25 15:07, Peter Griffin wrote:
> Hi Ivaylo & Krzysztof,
>
> On Wed, 22 Oct 2025 at 08:56, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On Fri, Oct 17, 2025 at 07:13:33PM +0300, Ivaylo Ivanov wrote:
>>> Introduce a clocks management driver for exynos8890, providing clocks
>>> for the peripherals of that SoC.
>>>
>>> As exynos8890 is the first exynos SoC to feature Hardware Auto Clock
>>> Gating (HWACG), it differs from newer SoCs. Q-channel and Q-state bits
>>> are separate registers, unlike the CLK_CON_GAT_* ones that feature HWACG
>>> bits in the same register that controls manual gating. Hence, don't use
>>> the clk-exynos-arm64 helper, but implement logic that enforces manual
>>> gating.
> For sure it isn't the only upstream SoC with HWACG, gs101 and e850 and
> probably lots of Exynos SoCs have it. Whether it is the "first" in
> terms of release date of the SoC I don't know 

Huh? Samsung hasn't released a lot of exynos chips and you're free to check
kernel sources if curious. Exynos 7420 didn't have HWACG, 8890 and 8895
have it. Exynos 7870 (roughly same gen as 8890, but budget lineup) doesn't
have it.

> , unless there is some comment in
> downstream code to that effect). Your CMU registers do look like a
> different layout though.

Exactly. First implementation/gen of HWACG == lots of room to improve.
Which they did, and this is what I implied here. I can word it differently
though, to be more clear.

> Just fyi gs101 also has Q-Channel registers that contain HWACG Enable
> bits. The reset state of all these bits on gs101 (both for QCH_CON_XXX
> registers, QCH_EN bit and HWACG bit in CLK_CON_GAT_* regs is off). In
> my case I suspect the bootloader doesn't initialize any of them
> because of the CMUs "global enable override" bits in the CMU_OPTION
> register (which is initialized by the bootloader).

Well, to be fair, without any documentations or bootloader sources there's
so much so I can do. The vendor kernel also force disables the qchannel
registers, hence the assumption.

>> Please CC @Peter Griffin in future versions.
>>
>> How much of this can be shared between this and GS101?
>> https://lore.kernel.org/all/20251013-automatic-clocks-v1-0-72851ee00300@linaro.org/
>>
> It seems from the commit description Ivaylo is still wanting to put
> all the gates into manual mode, so is only initializing these
> registers to ensure HWACG is disabled.

Yeah. Not all CMU blocks seem to implement HWACG, so in my opinion it's
best to just keep all in manual gating mode.

>  Happy to help review it though.

Would love you to! Thanks!

Best regards,
Ivaylo
