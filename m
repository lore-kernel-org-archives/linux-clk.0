Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93C42F0C62
	for <linux-clk@vger.kernel.org>; Sun,  8 Mar 2026 16:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772988231; cv=none; b=jJ+Mp+Zq4r7UWrj7DJmMvwKAGxqqaRlcYfRd/lBciJLgjzMkSK17kfPLI6U22WVh9QeQ5NubtI7Aosbglw2cNSLNGRWmvrc3VQrAccFqszMoUXq6yUy8EfAfDESIQBlupa5Ka7qkUEZtcAMvXjuMIVO7NupQuwNlTVc0pjlNx7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772988231; c=relaxed/simple;
	bh=5PdK8ZH0OApCvGCUau4fGFklsQxnHjUokWQFkZsjW+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=h0IrV8a8mbYkFc9CDdWPx8edbJD1MJdgDmYr/3YX77Pc8Tcn08eNTjS6gD35I4JO1WLSL3yVvPLlyt1fAPbp1KjPnGL0muJo6D9n2vewVYOLu81h2kgKPrhNz83XXpfQ8pqUpWTI5zx5yD8QCozv6rUsolvJz7Ar7ykzRiDQZGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Jf/4yAhp; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Jf/4yAhp"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439b9cf8cb5so6507458f8f.0
        for <linux-clk@vger.kernel.org>; Sun, 08 Mar 2026 09:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772988228; x=1773593028; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ptNfJY13rqncPY9fxaxMY/4N9QDNKhiHCS/yjgnBkUM=;
        b=Jf/4yAhp0pHKyPXb6YSU5ivEM1yRSzsM4WiGp8L62ieZhjqcx2BNXQU3+22OqYNYkP
         CU5cI564n3DJRImEMIKbxnxIZyqhRyElbSDyF9u7X0Kl23bJNrr/w4/5BCkMvTvRMYmd
         OuTJ40LSV1bLQRwgvsSKLWw30WnMUu8esvUSDEDjpm8fKEUk+Lt2ZyVPqR3YPHypqrgn
         dnudXf9eglsE0kXAoY3q7xSJK7GOaBkFLw2F94yJJNMPlHTYLlJA1vs1W6aR8w71Jjo9
         kg522LZ4atMz/inQBWJpEfF8xYJ6kdY3nOaDgTvvVfFivOJwVnBLimPo7tdHc6HF6VYK
         yEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772988228; x=1773593028;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ptNfJY13rqncPY9fxaxMY/4N9QDNKhiHCS/yjgnBkUM=;
        b=TWcaBjEX7dveOEWrPBpD95CButVgFeHR3GrTa7QDJYJAbxFKjFrjUcy4Ep41A6fnst
         YHqGLWtjeArUA/6ohB6aPxN1jn5s/22xDUwXHkrJ9WCEZ2mvoQFsn3KxNh0nI8E+4qzL
         unVxlo9C1WekvUg5Of5hnomznWIm9ZyjAT+/7R3XbB2qc2wiEZ8iGJfVTOdxEOUq67qO
         28UogjZ1wf2xunhLOJqSGQ2t9litoE5MzTNF7VIXhj0L1O1JY0sVjF6wcJaYQ0dDhYtj
         GRysGIgchn75kj8QdlcwBOCbg+hXNYPgKeEqaRqbfkGMRZj6FtCuegZ7BXmCpL/uUYkq
         7KWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxSD6EHVlZiRy7R3MHXkkdPiiaAU0WGfkxzrNwzwJvbNw+caLc6dfO+v6oi6cxK5YZVz7w4skLcBs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqaHtLg5Q6BqL+VvrdwnffSqWpoiWgW5ZOQWiQosMiLSxvTBB8
	gBtyMGYXakUY34Z6JcRspYXA0EWjmGxOtTnxq+m/PaPQMy3wSCx9PoFwc/E+zRSCdEM=
X-Gm-Gg: ATEYQzyVAV15W8h3JUAMXjhaERy1Ho3TcGxPeF5DBpeVzSCe7XDABB1pixvthBLV0Hi
	j5K04RrsaC9d10DxiYvyI3H4r2Ucu6Muw5AHEXJiEbOr51IDpzVu/uJsA0n95JrsRcBzLAS+7sD
	zzmUyUDgmMLszNEV+NxZgOGN2RZ9wJYQARPL463Ce1tAOyTlcqcix0rbIS4eZvx9TmuOcCCbbEg
	jhgpTrUGRbpRC9Az8Ktb7n46NRi+YaaotJNZ8tuF9pcL569raeETPKILt0lSQRsCTVYGxy8UobX
	j2IL3+WEq0MiJiQUJsnPS7dOazOTg3ZakE84+T+31Rn2omPdN8GZ92+N0CJsLJwCAaWu9rRKr4O
	D5eWVT9mD9DYepUveROdpyxF9SHra7edmR6WOQZKHBQSwGlHYw7sQaLyO7SuVcqHcCXD00n6lSN
	ZT1rDPaRv+DAw5xXPIEsnRYiJKJyVP3g==
X-Received: by 2002:a05:6000:2681:b0:439:c38e:66cc with SMTP id ffacd0b85a97d-439da88ffdamr14319927f8f.46.1772988228077;
        Sun, 08 Mar 2026 09:43:48 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad977f8sm19297489f8f.9.2026.03.08.09.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 09:43:47 -0700 (PDT)
Message-ID: <f9de5355-0eb4-4a1c-82f5-bb7a20566e0d@tuxon.dev>
Date: Sun, 8 Mar 2026 18:43:46 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/19] dt-bindings: clock: at91: Allow referencing main
 rc oscillator in DT
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alexander Dahl <ada@thorsis.com>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120143759.904013-4-ada@thorsis.com>
 <b932cdfb-9197-462b-abb8-e7b4c7ecab6f@tuxon.dev>
 <20260209-amulet-customize-08ef8dfa1c38@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260209-amulet-customize-08ef8dfa1c38@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Alexander,

Sorry for the late reply.

On 2/9/26 10:08, Alexander Dahl wrote:
> Hello Claudiu,
> 
> Am Sat, Jan 31, 2026 at 05:44:18PM +0200 schrieb Claudiu Beznea:
>> Hi, Alexander,
>>
>> On 1/20/26 16:37, Alexander Dahl wrote:
>>> The main rc oscillator will be needed for the OTPC to work properly.
>>>
>>> The new index introduced here was not used on the four affected SoC
>>> clock drivers before, but for sama5d2 only (PMC_I2S1_MUX).
>>>
>>> Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
>>> Signed-off-by: Alexander Dahl <ada@thorsis.com>
>>> ---
>>>
>>> Notes:
>>>       v3:
>>>       - adapt to different base changes, added lines are the same
>>>       v2:
>>>       - new patch, not present in v1
>>>
>>>    include/dt-bindings/clock/microchip,sam9x60-pmc.h  | 1 +
>>>    include/dt-bindings/clock/microchip,sam9x7-pmc.h   | 1 +
>>>    include/dt-bindings/clock/microchip,sama7d65-pmc.h | 1 +
>>>    include/dt-bindings/clock/microchip,sama7g5-pmc.h  | 1 +
>>>    4 files changed, 4 insertions(+)
>>>
>>> diff --git a/include/dt-bindings/clock/microchip,sam9x60-pmc.h b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
>>> index 91f8f863ea076..1f6bb51780d09 100644
>>> --- a/include/dt-bindings/clock/microchip,sam9x60-pmc.h
>>> +++ b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
>>> @@ -10,6 +10,7 @@
>>>    #define SAM9X60_PMC_MCK		1
>>>    #define SAM9X60_PMC_UTMI	2
>>>    #define SAM9X60_PMC_MAIN	3
>>> +#define SAM9X60_PMC_MAIN_RC	6
>>
>> Why 6 and not another index? In theory, now, you should be able to define
>> here all the core clocks IDs (as these are known from the manuals) and
>> prepare the driver to allocate memory for all of them such that the driver
>> will have to be able to work with old and new device trees w/o further
>> changes.
> 
> Was the first common free index for these four clocks.  Before split
> up would have been nice to have a common index, because it was all
> together in include/dt-bindings/clock/at91.h in one file.  After
> splitup one could just use the first free index, as Krzysztof already
> suggested.

OK, sounds good.

> 
>  From my reading of the SAM9X60 manual, there's no such thing as core
> clock IDs in the manual.  If there is a section in the manual, please
> point it out.

There is no such section, AFAIK.

> 
>  From my interpretation for SAM9X60 these clocks are provided by the
> clock generator (section 40 in the manual):
> 
> - TD_SLCK
> - MD_SLCK
> - MAINCK
> - UPLLCK
> - PLLACK
> 
> The "main rc oscillator" clock is somewhat internal here, but for OTPC
> we must be able to enable it.
> 
> MCK (not MAINCK) is generated in the Processor Clock Controller block
> of the PMC (section 41 in the manual) from one of the above clocks.
> 
> So it's all mixed up from different blocks from Clock Generator and
> Power Management Controller already.  These indexes are
> arbitrary and just for the driver, right?  Or am I missing something?

If I got your question, some are only internally (currently), some are also used 
by DT (e.g. the PLL ones).

> 
> Besides, if it is renamed now anyway:
> 
> - Why that PMC prefix? (most of these core clocks come from the
>    clock controller, not the pmc)

The control interface for all of them are on PMC. So, they are all considered to 
be part of the PMC. From manual, chapter "Description" of "Clock generator":
The Clock Generator user interface is embedded within the Power Management 
Controller and is described in the

> 
> - Why not rename PMC_UTMI to something like xyz_UPLLCK to match the
>    datasheet/manual (likewise for the other definitions)?

That could be done for the SoCs where this applies.

Thank you,
Claudiu
