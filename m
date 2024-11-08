Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194DA1E32A6
	for <linux-clk@vger.kernel.org>; Fri,  8 Nov 2024 23:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731107706; cv=none; b=aUgxQdeVdq1dODQGZn/fma5wSnTzP1ozMCzTzcdgxWnt2Gu/vITYZukHDzpMNS9tsZczNdn8YBselmMPr8rBbPs+fkd1fhBigHPxoo1L3zhbZFz2rOz+3attnLxdg0qJh6rOhCrHpLJoJOXzYVC9MkPC/IU44zS9AaBZjvqbZ+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731107706; c=relaxed/simple;
	bh=NE6pg3wRdGXtaaI09FPxI7W/E9jCi25YgqePb0Juy4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FG3bQQCnyhsg7gc4fUE5qygWWZ/vER9VNz5o94Ag8va+H3KCFozl12DWdc9rfKQSndReHnvTCyFKm4o+NvJ+eWYvPADSpu4t+eiaA/XI0xlTxvJavOK3+xmbfXdaudaQA4vX+Po+abwjQrL1gJQ/4nuQ1cQNscjj7n8EMEpp9Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wirenboard.com; spf=pass smtp.mailfrom=wirenboard.com; dkim=pass (2048-bit key) header.d=wirenboard.com header.i=@wirenboard.com header.b=CQfTROcG; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wirenboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wirenboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wirenboard.com header.i=@wirenboard.com header.b="CQfTROcG"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37d4a5ecc44so1634722f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 08 Nov 2024 15:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard.com; s=google; t=1731107702; x=1731712502; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0oSoie1qIRXgWGFb6cKb7mnY6LaDSDkqhi5T4II1in0=;
        b=CQfTROcGAAEpquuyZ5UcbUB4ev3BpF2MAuofqNaVeu3xvmySmWoD/FKzmdqNMirpj3
         EnB8d3yGjsr+cfo6yUGThVb3xbrfNzyG01y/mp15z4WmNjFQp/BOEZNgDAzvYSNQZ69g
         4hWSNbQpYwk0MVHkle4MuKHI/zwmyqkf7nMqYtvGFkjau6TSoi53xEiHefiH7M5qR5GY
         RSjWMC1FkkSglhphMCkMr3WqtI7l7mBAmVjA9JUE6kxyjan92HZoxgZ6SRYK6QowfJ16
         2o9MXS7tZd8S4bxGc+bXuRwTrJ2jKWsv/pmpLdXAjTDAiV7BqQVi9fnLW4sA7z1nEuw5
         gGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731107702; x=1731712502;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0oSoie1qIRXgWGFb6cKb7mnY6LaDSDkqhi5T4II1in0=;
        b=FGBFJ0r5op87n46ao6PxMUqDbjKRaZaXPomFI9oI08dZCPFvIR2qXV0S52uFPoEogX
         06Zd+eASDRhSqiJ7zp9EVBzu90oMn54ViN759IkqwRG9hjxdGdNAX3Gw4ld234u1Apii
         4EvUaCHoIJNbaYKr61jkdcYmCYae/IA1A5chkvvfqyuQJt/nkVJMdKyWUOh7SKeSi9jW
         5lKumoHnYtNzPnoa8n+Lj5dv/ey/r0ee5Pp4mV3tZZr5DOS4WS0tH1R1wPToP4UIOOBv
         5U9LBCfDz/LKEjJm5qoav18qDBNzuP/+QHVr1+e26hOQuFcWNI9mKfOZlYNgiqkqBow4
         ilFA==
X-Forwarded-Encrypted: i=1; AJvYcCXHlsSA7NqsAQKbL6gi9KOC0pvn1MnW7gEU+3JVpOms2+lAqWiPGPzmlcDl5rGJiIb4Sgmc5S04BA4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlTOpnLWRAUjwGNAAORlkBn+Pykd7DRwhXDH67LrQqLBBNRg3B
	ZLmX6H0agv7IFlGEPZYzl/08L7MvAkOQTT7qj85Hlq6cx+mi8LLc4jHSGqTvnUw=
X-Google-Smtp-Source: AGHT+IEkXE8e6btQk8tjWEgg1I5q8fB3JHMfs8pcIcYIogpdbfL+NQYAjuHnUilwSeLh4eJW9S2S/w==
X-Received: by 2002:a5d:5f93:0:b0:37d:493c:f7b8 with SMTP id ffacd0b85a97d-381f1867129mr4149308f8f.2.1731107702379;
        Fri, 08 Nov 2024 15:15:02 -0800 (PST)
Received: from ?IPV6:2001:4c4e:24e5:bb00:6639:286e:9ea6:bb49? (20014C4E24E5BB006639286E9EA6BB49.dsl.pool.telekom.hu. [2001:4c4e:24e5:bb00:6639:286e:9ea6:bb49])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-381ed970775sm6137066f8f.13.2024.11.08.15.15.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 15:15:01 -0800 (PST)
Message-ID: <a4fada26-7ef8-4618-9ddd-0962b7dc6efb@wirenboard.com>
Date: Sat, 9 Nov 2024 02:14:59 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] clk: sunxi-ng: h616: Reparent CPU clock during
 frequency changes
To: Andre Przywara <andre.przywara@arm.com>
Cc: jernej.skrabec@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev,
 mturquette@baylibre.com, samuel@sholland.org, sboyd@kernel.org,
 simons.philippe@gmail.com, wens@csie.org
References: <20241025105620.1891596-1-andre.przywara@arm.com>
 <7b63b316-4cd7-48ee-ae32-3750d25e2307@wirenboard.com>
 <20241108223400.460982d6@minigeek.lan>
Content-Language: en-GB
From: Evgeny Boger <boger@wirenboard.com>
Organization: Wiren Board
In-Reply-To: <20241108223400.460982d6@minigeek.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/9/24 01:34, Andre Przywara wrote:
> On Fri, 8 Nov 2024 23:14:51 +0300
> Evgeny Boger <boger@wirenboard.com> wrote:
>
> Hi Evgeny,
>
>> Tested-by: Evgeny Boger <boger@wirenboard.com>
>>
>> We had stability issues with some of our T507-based boards. T507 is the
>> same die as H616, to my knowledge.
>> They were fixed by essentially the same patch, which we unfortunately
>> didn't submitted to mainline:
>> https://github.com/wirenboard/linux/commit/dc06e377108c935b2d1f5ce3d54ca1a1756458af
>>
>> It's worth noticing that not only the reparenting is mandated by T5 User
>> Manual (section 3.3.3.1), it's also is implemented in vendor BSP in the
>> same way.
>>
>> We tested the patch extensively on dozens of custom T507 boards (Wiren
>> Board 8 PLC). In our test it significantly improved the stability,
>> especially at low core voltages.
> many thanks for this reply, I was hoping for such a kind of report!
> I typically don't test those things in anger, and only have a few
> boards, so having those reports from the real world is very helpful!
>
> Can you maybe give some hint on how you tested this? Does "at low core
> voltages" mean you forced transitions between the lower OPPs only, or
> were the chips undervolted?
Both, in a way. Some boards (about 1 in 20 or so) would hang after a few 
days of operation.

During our investigation, we found they would never hang under stress 
testing, so we started examining cpufreq-related factors.

Disabling lower OPPs also prevented hanging. If we artificially lowered 
the OPP voltages (undervolting the chip), the boards would hang much 
faster without the patch, and even the previously stable ones would 
start to hang.

>
>>   From my understanding, all Allwinner SoCs need to follow this kind of
>> procedure, however it's only implemented in mainline for a handful of chips.
> Yes, I saw, I have added this to my A523 code already, and prepared a
> patch for the H6.
> Do you have boards with any other Allwinner SoCs you could test on, or
> even already have experience with?
Unfortunately, no, not really. We only use the T507 and A40i at the moment.
We’ve never had these kinds of issues with the A40i, though. By the way, 
the A40i is among the few Allwinner chips with reparenting implemented 
in the mainline.

The A523/T527 is really nice; it's a pity it's limited to 4GB RAM.

>
> Cheers,
> Andre

-- 
Kind regards,
Evgeny Boger

