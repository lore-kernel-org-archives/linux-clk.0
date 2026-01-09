Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93572367CF
	for <linux-clk@vger.kernel.org>; Fri,  9 Jan 2026 07:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767943351; cv=none; b=Zysk6iAH0y0m35cBo0VSsE5BX2cNBPrXt6JNwVZqaRpu2/bTsjAuEcRp6iQQXsHCMz5QzvoPenv3P7CIvD8V66739qKkEmmLCB+CJdryc6nLDPafYVx/L1JqDDdLDCbm3JbcgRXGhvGYD6P2EYkINfrieRUDAnxsCH+of+9g5mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767943351; c=relaxed/simple;
	bh=m2wz1lctkuXxONV+LwBiNBgqkMAeAHcaybVa1xu1pi4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bNy2E5IEMGWA/M4vAcjsrMaehwkeaXzZjr+J+IS5nTlmRzX4On3WVJf4w62vh3QQ1GO4AbvcSSakhckurbBuNQjIq5kFGg3K3FEa3c1AIQJAOhysBVx0lffhrpWKI0JgJUsgf6MAqtX14J1o3OvjQzoExXlXTtvFuZeu+E2euYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Dqnce1X0; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Dqnce1X0"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-432d2c7dd52so974567f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 23:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1767943347; x=1768548147; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sRdipr7aeHoIxEX2vKQujSCZ90MZhOGqhcCSnr+qqyI=;
        b=Dqnce1X0vtVMjESyefbYMf4OrB3zfay5BuN1xto1ajRjByz3ScVtxH0k7SV/3SBmE9
         8SDiE8ePX88JBRUxE+Ul1GhJycAS0zo5vhyAC3eOidXukB5X2Yh6b4UBBit7K8kpabTw
         RJcfLzt9X01wm+UM46j7qDywvTttacGE8n4vab71/UMgCLg/wwdv2ZbnRvc7+vWp0yq6
         2n75Xt4H8g1jS/DOyEXq9mAMfwUwHmZLVALoqgJ7yoaR9AbKchZCk3+luNRG50QorQ2Y
         FiKKSC0zJFp9PduZqEFe6G2qPpI/6zgOI8PQEFg6FlECs2B2l+cduxX6HDnSg2E1EZcA
         PCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767943347; x=1768548147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sRdipr7aeHoIxEX2vKQujSCZ90MZhOGqhcCSnr+qqyI=;
        b=pIwnZ0c0Jp0NkZ/r/o3DDR+0mslNoV9gXNjqw/x8Wr5j+4M3CaJ/Us4qXFNP0313im
         UikTW7oI2uNiC0iz62Zm8A3NmDaMJoDgSkHVsAvuXsfwhANiysgnUHWiuQogCSOGwvQq
         vW5ShZ+Txz181o5QX3LrVFCUOy/PQ0er50mgF07ruAiyI0alTl/Mm/96CbM3Ulkmpipe
         ylXzDSdlnK1fC4uF+/9z5QI0MOzBI8t7zVams5YDzI+LgTt7xdJwy/tfSNX54AGsakHA
         HlYvTlFs3s4VaUVn+YVSkZ9Oz3fE92JAFAN79ZJ7CDE6EwGWoJKZAkGgGMfUpIdApvz9
         fBWw==
X-Forwarded-Encrypted: i=1; AJvYcCUgcdOmfGusPB6XOoaOsZT6Cr3CQl7YbFYHjMq3p8ZRTUAjX+iLEQJpxNd/rOMkAbfJ7vr3IWG7Oeo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFB4wesqaqtL2QlaHtdDvgtX/MH1FQI5SUUdMi/s6TZ5Idxnhs
	Ui3a/TMiH49tauGNK4gtKzIeyYVPSVOqHLOHLHgZNA88a62aN83+KdlU32bjjtrB+N6hcjwkwfE
	PL5Cf
X-Gm-Gg: AY/fxX4QJpELwMG+WSbOYCW+B2/Hxvl9pOFCoXSkRCRsTP3rmzMqVfhvrQtC52UDouW
	a9vd+WuUW0KcaPahUyjVVWdwXwbwltDFA6UHVyf9okRqFDue3+pXZ9rd4CaHMNbQc6uL3C4QjX6
	QlxCMDRjV/XRMZ2JBU0mM+LOf87q7mgLXahNdrMwyoH0yFeSwcvEYoLeAttIEJbPhxnPtkiFjly
	ZVJsxWh9rlBvEizxOim5qYxJbw+r/f1bSho31aJSwOI56YUXElTSONmnO5hDFrSXUkiWfV3umSR
	rMXQdAZu+Zrg8QxKISqL23bqlXDbnELCF8zmgUjA+mv7B6Rjkui+4l1yLII0K8a4SzUo42o5qEW
	wMFeuxiHmtI+Vpf8ZW4JtZoJn7Y9g9anyhr3pb0wnodbpUFF6md6+TYlPzZdFG7rcvDhUZE/9gK
	ZpHvBkJHGUzyjO8BptcA==
X-Google-Smtp-Source: AGHT+IE2w6FBykX8O9VP91rZPx4SMD5MYP+siiUCDk4NBBI8RnGVXjy6MSR8IirXqwWDEZtmmeIing==
X-Received: by 2002:a05:6000:290e:b0:430:f704:4da with SMTP id ffacd0b85a97d-432c37a74dfmr9227189f8f.58.1767943347109;
        Thu, 08 Jan 2026 23:22:27 -0800 (PST)
Received: from [10.31.13.216] ([82.77.28.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm20575451f8f.31.2026.01.08.23.22.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 23:22:26 -0800 (PST)
Message-ID: <af02ffd7-4876-4bce-8a79-2b34114d6ccc@tuxon.dev>
Date: Fri, 9 Jan 2026 09:22:25 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] clk: microchip: drop POLARFIRE from
 ARCH_MICROCHIP_POLARFIRE
To: Conor Dooley <conor@kernel.org>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20251121-tartar-drew-ba31c5ec9192@spud>
 <20251121-prude-dilation-79d275fec296@spud>
 <86bd75e7-1191-458d-b71e-c3cecb960700@tuxon.dev>
 <20251208-flatten-devious-56abcfecd510@spud>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251208-flatten-devious-56abcfecd510@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/8/25 20:02, Conor Dooley wrote:
> On Sat, Dec 06, 2025 at 01:18:30PM +0200, Claudiu Beznea wrote:
>>
>>
>> On 11/21/25 15:44, Conor Dooley wrote:
>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> This driver is used by non-polarfire devices now, and the ARCH_MICROCHIP
>>> symbol has been defined for some time on RISCV so drop it without any
>>> functional change.
>>>
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>>   drivers/clk/microchip/Kconfig | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/clk/microchip/Kconfig b/drivers/clk/microchip/Kconfig
>>> index cab9a909893b..a0ef14310417 100644
>>> --- a/drivers/clk/microchip/Kconfig
>>> +++ b/drivers/clk/microchip/Kconfig
>>> @@ -5,8 +5,8 @@ config COMMON_CLK_PIC32
>>>   
>>>   config MCHP_CLK_MPFS
>>>   	bool "Clk driver for PolarFire SoC"
>>> -	depends on ARCH_MICROCHIP_POLARFIRE || COMPILE_TEST
>>> -	default ARCH_MICROCHIP_POLARFIRE
>>> +	depends on ARCH_MICROCHIP || COMPILE_TEST
>>> +	default y
>>>   	depends on MFD_SYSCON
>>>   	select AUXILIARY_BUS
>>>   	select COMMON_CLK_DIVIDER_REGMAP
>>
>> OK, I found v2 in my inbox. Same symptom here. It doesn't apply on top of
>> the current at91-next either.
> 
> I think this should sort itself out after -rc1, but I'll resend if it
> doesn't.

Still doesn't apply. It conflicts at least with
commit c6f2dddfa7f9 ("clk: microchip: mpfs: use regmap for clocks")

Thank you,
Claudiu
