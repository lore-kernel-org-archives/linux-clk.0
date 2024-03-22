Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A5F1C6AB
	for <linux-clk@vger.kernel.org>; Fri, 22 Mar 2024 09:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711099036; cv=none; b=Zo6Kv2OBaMoZVJFDpo4IDnpW6ZJIn96XplRl5r/Qe+yM4A3H3fLPnrFwpOF5KEEnCli6PT5cQCa+oONfrBv7SbY1w8Vx06SRoD/aTRJVkISRiBGmGCjK8uR3aiF+AlJT9LQXb2cu16/tRsZoU2rRPaI7pxvytAv+9e6C+S8yFzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711099036; c=relaxed/simple;
	bh=BnqFZuBPOQ/1oZmEieiOWKGOwcPnQUJTN8zI9s8x3B4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PeqvSRX0/QMsPxS1/m9RU4/+SRK6Gqx/N9A+fKtk+Ai/gqPsEPJAJZERyyCEYhVx9KT0obb0LrtjgQJhPnNjoeNRqDcnFRi2GgsTJS3anUpHGWrqhaL8tyEt+3YH6eacgwAsLfJttKbQ6V7m3PWE9gKwuLYODsXHtZUncQ7am2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j2q8Pc+h; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j2q8Pc+h"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-568c714a9c7so2110106a12.2
        for <linux-clk@vger.kernel.org>; Fri, 22 Mar 2024 02:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711099033; x=1711703833; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wQ03dPvbzMpRi7eWEJdHXaZKi6IgHd35+FRG3t2T590=;
        b=j2q8Pc+hClpcHmRe7z5bz2QpXE1nmzi/7Rxx4Lm5cZeXvWdk7I7xuWqa9DlJi+OsKm
         TqKFoxRdktA4qWLnuEZ1uNu/QL8dAB0GZJUy6P0T8fKCwloV2ZNXPLWkGZ4b4rQYey5P
         75a5dXbtVVTdfj0SWF69B2u35maO/wHdVCWDIOnGnfGPE1wHUOrXPUuout8CigsXR+Tr
         m4V6J6NkT9XUMU6NGVEzLlJrfh5+k5DeSKszdcPanda8JXPTEFIOU5+xNQNBx/m+DyzT
         6AjBgQ65zIB8dkICIls0d7Zzh5sqqSvz7wUH7nzKQak+HV+kDeV2OKwCF5nZ+10goypb
         tSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711099033; x=1711703833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wQ03dPvbzMpRi7eWEJdHXaZKi6IgHd35+FRG3t2T590=;
        b=X0W5VLsxKxuJ+K48y0Z9cYAlwQTMT+/PpnLTVNhJhwO51Yf2i6zlqboBnL7OKSyQ7R
         a3XZ92YHKfAk7VyG0mjwfnJ0vu9+L2s2KHyIjYW76ofI9A7rISjU/ifzCOrN3nKi0i8n
         mRddxNQVVM4Gry74UwrikvogpHtHGaUQH+9IeBsUS0RH+gifxl4BKQnr4A4VdjwHclod
         ZRCnvf0aPSY9hODNRXtaV50CXxtXg6fUgYfBSnmKnL7H4YxEoFn8XoykZ4X13kVaOEIM
         bCceWqKeQKQaPdGCOJJHkU8bI8oHDOBYc6biTBiQaDCq5SoD5a2nWLfJepsipthJaQzT
         3DiA==
X-Forwarded-Encrypted: i=1; AJvYcCWzbJkNHKh2MMOLnWQAARrx9gOebNigOC8VxfqypXwf6h8LxluwNBmc07bk378iK2hGJ64sAiYxWQ+HOiGnu2EmFDSyHskxqYU7
X-Gm-Message-State: AOJu0YzWpaQdnDS40VVjpQuee+J9YNhvmnaf30Z4NTNDZFMn/9BpljzQ
	0tbVpufoGxKezZg1XwZ8sN0A8a32GHdfYrhpdvUrCX6zKLa+Y409fn3K36TLcac=
X-Google-Smtp-Source: AGHT+IG0gM7oX0za3mc7H4omG9BZBm/xluMZh7IubNesmj5Lf2R09cBSpu0v45lTT9aqyYpialFynA==
X-Received: by 2002:a17:906:b24c:b0:a46:d789:812d with SMTP id ce12-20020a170906b24c00b00a46d789812dmr1315201ejb.52.1711099032634;
        Fri, 22 Mar 2024 02:17:12 -0700 (PDT)
Received: from [172.20.10.10] ([213.233.108.187])
        by smtp.gmail.com with ESMTPSA id jg4-20020a170907970400b00a4652efd795sm814525ejc.83.2024.03.22.02.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 02:17:11 -0700 (PDT)
Message-ID: <71df1d6b-f40b-4896-a672-c5f0f526fb1f@linaro.org>
Date: Fri, 22 Mar 2024 09:17:08 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: samsung: clk: re-parent MUX to OSCCLK at run-time
To: =?UTF-8?B?6rmA7J6s7JuQL0pBRVdPTiBLSU0=?= <jaewon02.kim@samsung.com>,
 'Sylwester Nawrocki' <s.nawrocki@samsung.com>,
 'Chanwoo Choi' <cw00.choi@samsung.com>,
 'Alim Akhtar' <alim.akhtar@samsung.com>
Cc: 'Sam Protsenko' <semen.protsenko@linaro.org>,
 'Krzysztof Kozlowski' <krzysztof.kozlowski@linaro.org>,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 'linux-arm-kernel' <linux-arm-kernel@lists.infradead.org>,
 'Peter Griffin' <peter.griffin@linaro.org>,
 =?UTF-8?Q?=27Andr=C3=A9_Draszik=27?= <andre.draszik@linaro.org>,
 'William McVicker' <willmcvicker@google.com>, kernel-team@android.com
References: <CGME20240306032022epcas2p14368c055af804c2f066a6b1ec5cee070@epcas2p1.samsung.com>
 <d508dfc1-bc28-4470-92aa-cf71915966f4@linaro.org>
 <000001da7068$7f60f020$7e22d060$@samsung.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <000001da7068$7f60f020$7e22d060$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 3/7/24 08:21, 김재원/JAEWON KIM wrote:
> Hi Tudor

Hi, Jaewon!

> 
> 
> On 3/6/24 12:20, Tudor Ambarus wrote:
>>
>> Hi,
>>
>> Trying to get some feedback from the samsung experts. Please consider the
>> following:
>>
>>                          ---------------------------------------------
>>                         |                                CMU_PERIC0   |
>>                         |                                             |
>>                         |  MUX_USI                                    |
>>                         |                                             |
>>                         |  |\                                         |
>>               OSCCLK ---|->| \                                        |
>>                         |  |  \                                       |
>>                         |  | M |                                      |
>>                         |  | U |--> DIV_CLK_PERIC0_USI*_ --> GATE_USI |
>>                         |  | X |        (1 ~ 16)                      |
>>                         |  |  /                                       |
>> DIV_CLKCMU_PERIC0_IP ---|->| /                                        |
>>     (1 ~ 16)          | |  |/                                         |
>>                       | |                                             |
>>                       | |                                             |
>>                       | |  MUX_I3C                                    |
>>                       | |                                             |
>>                       | |  |\                                         |
>>                       --|->| \                                        |
>>                         |  |  \                                       |
>>                         |  | M |                                      |
>>                         |  | U |--> DIV_CLK_PERIC0_I3C --> GATE_I3C   |
>>                         |  | X |                                      |
>>                         |  |  /                                       |
>>               OSCCLK ---|->| /                                        |
>>                         |  |/                                         |
>>                         |                                             |
>>                          ---------------------------------------------
>>
>> Is it fine to re-parent the MUX_USI from above to OSCCLK at run-time,
>> during normal operation mode? Experimentally I determined that it's fine,
>> but the datasheet that I'm reading mentions OSCCLK just in the low-power
>> mode context:
>> i/ CMU ... "Communicates with Power Management Unit (PMU) to stop clocks
>> or switch OSC clock before entering a Low-Power mode to reduce power
>> consumption by minimizing clock toggling".
>> ii/ "All CMUs have MUXs to change the OSCCLK during power-down mode".
>>
>> Re-parenting the MUX to OSCCLK allows lower clock rates for the USI blocks
>> than the DIV_CLK_PERIC0_USI can offer. For a USI clock rate below
>> 6.25 MHz I have to either reparent MUX_USI to OSCCLK, or to propagate the
>> clock rate to the common divider DIV_CLKCMU_PERIC0_IP. I find the
>> propagation to the common DIV less desirable as a low USI clock rate
>> affects I3C by lowering its clock rate too. Worse, if the common bus
>> divider is not protected (using CLK_SET_RATE_GATE), USI can lower the I3C
>> clock rate without I3C noticing.
>>
>> Either re-parenting the MUX_USI to OSCCLK, or propagating the clock rate
>> to DIV_CLKCMU_PERIC0_IP allows the same clock ranges. The first with the
>> benefit of not affecting the clock rate of I3C for USI clock rates below
>> 6.25 MHz. Is it fine to re-parent MUX_USI to OSCCLK at run-time?
>>
>> If no feedback is received I lean towards propagating the USI clock rate
>> to the common divider, but by protecting it with CLK_SET_RATE_GATE.
>>
>> Feel free to add in To: or Cc: whoever might be interested. Thanks, ta
> 
> 
> "DIV_CLK_PERIC0_USI" re-parent to OSCCLK is already used samsung downstream driver.
> Looking at the samsung downstream SPI driver, if the SPI request clock is lower than the clock that can be supported by the CMU, it re-parents to OSCCLK.

I've just verified the downstream driver, added some prints, and indeed
the MUX re-parents to OSCCLK on low clock rates.
> 
> There is no problem with clock switching before USI data transfer.

I think that too. Thanks a lot, Jaewon!

Cheers,
ta

