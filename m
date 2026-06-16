Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4CA33439A
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 14:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781618588; cv=none; b=Pg8A3bfs2dws2fil2CznbKrFCarN2LIhw1T614GnBHbm/fKDuIShjSdOC8Gyj+LP92Hjq2A9r21kUv5SB9MYlcV5XK7oO95xaNjaFOQeLR6YiPWGAzZUkj8uTxTQaijeAxVBuKVqOO9UnM2wDEl6aI1VOP0w26q5SpfJvRlPeyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781618588; c=relaxed/simple;
	bh=XrhQt+Bea6fNaADCqzPU6iWXdPxv5Zbxr/AGVhFL7r4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HgQnsZX//mk+inEJvstOViK8YA/Zy1kyNo7Rl2RKlfDloIRA/DWArLME+ZG+AWqNtvH1nN4pvVE5m0uvGqI7T9iFudSTJtIylmi2L534ZZwyylOTPBTz1/MQB4Vj7nASrjvbOHCLvJEa8TsoCijLYq8RUqt74NB1JkPJiMlS3LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hASNg8oV; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hASNg8oV"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so46249815e9.1
        for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 07:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781618586; x=1782223386; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vzRGthAkkmRjSu9zQ5XOd2TW7ygg5YjF7D/zPA17Lys=;
        b=hASNg8oVVZoIhXMwTUF766V2KJTeeUDt9ea2K1Q8UD3aKId463dx8on0f05gn+BYSD
         DC/vxgJ75UrEW/WkCBFV2C7geXhv+sznHMhVx8+HvNuZe1fyPk3+oF5DKIZcfdR0e8tp
         QeYPocHr3UbwFfH/I5GJI2TBZkyMMyBPi7SALLD4AI0fr/2MXpEAKp4hYQcGLyMI8u2H
         0rb34nOhQG6Zr1m7BgwKiw5pV0T67b9ZrJkhebM649+HnctLjasgnhp92bcbc0rZ2rHy
         v64BBIsUFA5/mdvs2vhHeQImTZHsjcQWt1rTtNHn0FXGk103GYwGo/vKYipRcNxW+Q0j
         bxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781618586; x=1782223386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vzRGthAkkmRjSu9zQ5XOd2TW7ygg5YjF7D/zPA17Lys=;
        b=i1PfbLp3CZ7sj9gOK4D3CWQTuAWmZOJA4z8hlt1RbZivCtWQkxJ4+kk/dpR5v4z27R
         447jOBucfVLXULqxabK7swcP7FvzV617d2zLFAhwhoW+b1UV99Xh9B7RibNrdGWuKjqO
         GJMKOf/ZKZ/IeQjfFdLw+iid2hE0YGtAqkiF9R1bKLfBu0PiHVnF1UTzliX2140ncaDc
         /kSf0XWlD/sZbgIQRKUzrQX2KjeQ3INXryQBs72bPnnKGXpNd5jRiaK9NzBIjkERBGt1
         FECnOdkjBjazcR8jCXG883d9gqjzNHm8nObuFySKVI1sK6TDYl9YvUJNSATWwcywSPd4
         ip0A==
X-Forwarded-Encrypted: i=1; AFNElJ8XOd7FtJ+H6bOBiOCDRDYhOHgZvLyWTwlmQBbpqT96dA//50zBbmkORoZyMUIa5CcyOcyk0xGoQMs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWKkC36ZHxT86f+u8ahZm+8unnW3e9LFZuCdxsFIQgFA49dJif
	5lhcG9P02oNcroZyJlBgMrhTa5zNSizNE52z8DZZEExS39CgLZNsrAwQ
X-Gm-Gg: Acq92OF7+iZvL16U0//rRxj6+Lvs/OuFIP1LqoklVAg4+2Ijn8JoiykupBScISgMksI
	b0pH4JDDJ4ZniSfs2ssBbVvI48noSjk8iX6TKWRyoafvDnJsnZWGgpuGT+CUAlftcH7HAFcZvVS
	QxxaVnE7MuawEZrWi1veuhcrGP+rcjurzskxNvqD93+TS1lV1piEswBmgIAdcU1kf6QqXWj1zDJ
	vmURzMgllFukAptZDGT3xn/8gWUHPterIVjYTKPEzHvr/igPw7pZDLWP7OmAFPikxTb4sY0ds+d
	y0sipP+X6x1ppzyqhBW/2ubAirqC/tO+lW2I+OpQ0ItfB41+wqJYDuHgOhB3iJjyqE0kYhtDS4g
	/b5gqO284n35Dd0qK7+bzEUS861IsEPKg0N/lHEwI30r7Iyuk60G2B6OnwG2mCBmdx4zKP3MD+h
	OUfEm/tDpzvHSiuTqAhgpIP7dg6r5Nz7EZJvykzsaF
X-Received: by 2002:a05:600c:6289:b0:492:30f2:963a with SMTP id 5b1f17b1804b1-49230f29756mr41273285e9.0.1781618581575;
        Tue, 16 Jun 2026 07:03:01 -0700 (PDT)
Received: from [10.43.74.250] ([185.94.190.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea95c512sm243152425e9.2.2026.06.16.07.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 07:03:00 -0700 (PDT)
Message-ID: <a19f981a-01ea-4477-b443-2fee69f226df@gmail.com>
Date: Tue, 16 Jun 2026 16:02:58 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: Add GPIO-locked fixed clock
To: Brian Masney <bmasney@redhat.com>, V.Yurkov.EXT@bruker.com
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20260603-feature-clock-guard-v3-0-01cca0aa04a5@bruker.com>
 <20260603-feature-clock-guard-v3-1-01cca0aa04a5@bruker.com>
 <ajB2PhmxvdtsXNnm@redhat.com>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <ajB2PhmxvdtsXNnm@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Brian

On 16.06.2026 00:01, Brian Masney wrote:
> Hi Vyacheslav,
> 
> On Wed, Jun 03, 2026 at 11:16:42AM +0000, Vyacheslav Yurkov via B4 Relay wrote:
>> From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
>>
>> Some hardware designs provide fixed-frequency clocks generated outside
>> software control, such as by FPGA-resident PLLs. While the clock rate is
>> fixed, a separate GPIO signal indicates whether the clock source is
>> locked and producing a valid output.
>>
>> Describe a GPIO-locked fixed clock provider that exposes a fixed-rate
>> clock whose availability depends on one or more GPIO lock-status
>> signals.
>>
>> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
>> Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
>> ---
>>   .../bindings/clock/gpio-locked-fixed-clock.yaml    | 70 ++++++++++++++++++++++
>>   1 file changed, 70 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/gpio-locked-fixed-clock.yaml b/Documentation/devicetree/bindings/clock/gpio-locked-fixed-clock.yaml
>> new file mode 100644
>> index 000000000000..9106b800b673
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/gpio-locked-fixed-clock.yaml
>> @@ -0,0 +1,70 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/gpio-locked-fixed-clock.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: GPIO Locked Fixed Clock
>> +
>> +maintainers:
>> +  - Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
>> +
>> +description: |
>> +  Provides a clock output whose availability depends on a set of
>> +  prerequisite conditions. These conditions include the presence of
>> +  one or more parent clocks and the asserted state of one or more
>> +  GPIO lock indicators. An example of such clocks is FPGA clock that
>> +  are outside CPU control, with the lock status exposed through GPIO
>> +  signal.
>> +
>> +  The output clock is considered available only when all configured
>> +  prerequisites are satisfied.
> 
> I'm stepping outside my usual review of just the clk drivers. Krzysztof
> in v1 and v2 asked for more detailed hardware explanation. This feels to
> me like this is a policy that says to not use these clocks until the
> GPIO says they are ready. My gut feeling is that details like this
> should live in a clk driver instead of a dt-binding.
> 
> Alternatively, if this is generic enough, then could
> Documentation/devicetree/bindings/clock/gated-fixed-clock.yaml be
> extended?
> 
> Brian
Does it mean I should drop driver description from the DT schema?

So you are implying that gated-fixed-clock.yaml can be extended with 
another compatibility string? When another compatibility string is used, 
then some other bindings are expected by the driver, not what is used by 
gated-fixed-clock driver. Is that a common pattern among dt-bindings to 
share the bindings between different compatibility strings?

Slava
