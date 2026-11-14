Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794629807;
	b=uSj7T3Zh2WogxKRONZdJmKiiIBbXSOrvt7TuG75KpJS4GP2PSywyR3zl2uF0NY+qlCP7
	 eZwAd8qyKxwmmjXP+Wlq7M8uGwKyPW8yDDWJompT0v6IhkklB3wR5Uj7eudGaD9Dz5CGd
	 GslEi5cgFYkUQb60536oJ76SD4EcB3A+DVRNqR2y7VzcPDbeuKqlQ+3vrAn8fZATxfNb6
	 BAdyvE618gHiat7w12v/VpXb3TFdHVzJY/4qkwCK4qVapnZoFCdmf9E2fp34+XxmqPTbl
	 3AQ7nFG0mGS4/ACrCSAePNku0M9+7nYz9tTvibiRXhi+4lBEgoeHABL4ysA6II8qL5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794629807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=bJZ49mA/2fv/eo9vW0sZHgqgFD/tfUpaTmYh5t4KpuM=;
	b=MPH33ocPKCBbinbLwzalTqeWFK6EMWyb8Dtw/XkKphzKDEl1O2QgWTWd3GUWhtsX+bgj
	 AF+u0KO1hHR7fOub0DcVDiCcX23APjH93BJzbvcurR7eKgnjDDB0JFnRMOVPqNQX9iVcv
	 ELc74aCwRufvJ/+mich5LjkaQrUINoof4OjdJLMlA06iZuyJWkwI3MzVCownFZcKUffnG
	 F9mQDWU+9XBFVWKlEeU6lYkpwtedFnZ6crI4nZRAY6zyC91F9QTD328zCLBS5ULWFzboA
	 WMR6Z7zdefkFAY90HNv3nZL+vgmc7W5G967Vb7F1NVQODSaEl/gEelojDgSZiX6odEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rMvn67HJ;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8918606A32D
	for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 04:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8918606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rMvn67HJ
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-37986eb6fa2so903274eec.0
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 20:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794629806; x=1795234606; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJZ49mA/2fv/eo9vW0sZHgqgFD/tfUpaTmYh5t4KpuM=;
        b=rMvn67HJ/4qTLn1Cw9eXe5ua4+5psKuBSIMYHqjmgeBPkMW2rBX5FnPrG7wf+Z3km5
         TVdD+/kUfJLEih8Bmit8nB26HVnW/TgGxs8yIqjVP4/uENO/LqSLpVmC23Avj38Yszww
         sx5QHdfP6LemiNXwKLvWJqyoBLhtumwSlpD4sUN+O2tmVo2GM+G0euvRk0WgEjMwNGEN
         wHo11NQlg0zFCIQFOIXMZe05XI+eRGgyEfrfUwJ3INR1qJcSBytrW3kQ2YBshaJIDzYu
         ZUN+7A+AGOcdpg/3pgbm+CwG0o3bMdER5Ite6AVnRsfUzEf2k2iuoqO/fG4jkfF3vjlr
         vWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794629806; x=1795234606;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bJZ49mA/2fv/eo9vW0sZHgqgFD/tfUpaTmYh5t4KpuM=;
        b=PtIBSmng2zzSs5k7xyt83btPK19pMg8n4Z+UyZJWgj6lspUSLMTIUFYw6+/N3ycszb
         6vpFN2EM4/Pm68QdhiTaXxlqbWNhmHzWlCeNCeX/vz8fxrq6/f2yCQ6HeSHBZBFMfVWe
         v/tMe17dsA12yyCxwTqasiASfGedPsJQZIVpuV0CYsl9pCIqeEPiIlVJMplD+H5TYwYh
         rGenj+CoPTeiXhxZSWhc12TRN+zgS8dj7+I5pq4vePkSPzTBbzRBwDj3A/kvTqwcOHre
         iiLeQbqoshkC7Ef6YdewBmlEnnjsygoUNGfYWnSfXImqnJWskmrv30Eln/PAdc6DzU5Q
         bIBQ==
X-Forwarded-Encrypted: i=1; AL+hErGQVenyJyrGUCSMYaY9NC/kqyo6PV8tdVDM9vTa4KXbFdojdWh1sRbk2yBxmQbIcHl2+1jPdmxzIC0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TF95a+mEzyEK+zrCzbCgqCM3PKTliL3Ghx8qVSLB7JCXT+Gpv
	+GHYAQ+HVmXx5UNSt9pL1ESGbT5YvwCW0oVJe3jf/zBZGTWCdCjOdGgn
X-Gm-Gg: AYBFou0sfIeLCnWD0yaxUR1nWHa7D1Bv9IS6tQpt72uNh99FS2dA5VVa1IAOS+GsKj4
	PQn2oVy4e/blbX5Uy/CPhVcnJc/TggR0eejq/+yU0CaJvSrZhLksDm9WVja8jv2ugX0B61xMsue
	zhQSjveITbiJrRq0DCzILeMVSWbWAkZp1VAdcvdXf3UdF6o4fmcd20farbLgiIu9fLgjy8LIo4f
	5FFAX0C28Q+Tc1/KoNrny24/RFKkKHT3wUDwyNFAGnT6zPJ2k1XJF0dW6svp6FYf93QFfFmT9IS
	kq6yzuBo3OE7IItmO3Qrq790a2ER618Gl4wqufvc4AYIwUlHy3jgBasfWRd3wP0T/S1cW38X8q0
	Q0JlJj31kkg+ePlmx/D6G9a4MD4zgc5stkM/qCSYkiwvZ+KT8p70gVTdm6HGMTr7slBhdu0vLU9
	9xQiMbM3sZ/lq9Sqcl5rtWIhghohZmyEMj0e3zlgAxqA9FdcKFiontxseqDjIaOcRPFc1O2qb1r
	TWNj3nnYo97g/GgGBJoFE1XYjLEwTF0tCtg9AR4i/GrobIc4WPn5hums4rLnBr7Iqx8ljohdEdl
	LQx+AuCQgsboUvNYqN8tzcdPKnjzZgCqiRUM0MJrJgMOq8YX9xAjADktF6ij8bjaXTN4gkCEis4
	t
X-Received: by 2002:a05:693c:6293:b0:378:314:4033 with SMTP id 5a478bee46e88-379679e29f2mr4158766eec.32.1794629805701;
        Fri, 13 Nov 2026 20:16:45 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f01d68sm11849406eec.17.2026.11.13.20.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 20:16:43 -0800 (PST)
Message-ID: <34ffee4c-c5f6-4050-b76c-637fc48d1030@gmail.com>
Date: Fri, 13 Nov 2026 20:16:41 -0800
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ARM BCM53573 SoC hangs/lockups caused by locks/clock/random
 changes
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
 Boqun Feng <boqun.feng@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, openwrt-devel@lists.openwrt.org,
 bcm-kernel-feedback-list@broadcom.com
References: <a03a6e1d-e99c-40a3-bdac-0075b5339beb@gmail.com>
 <CACRpkdahWm9aP+UasDx=s3th+vyjAfuWrKB5HS9BKEbz90ZmKw@mail.gmail.com>
 <ec17c6c8-e697-4a5a-a705-bff24daae7b2@gmail.com>
 <CACRpkdZp=4sP_1a=u6c7DGbPWA8WRee4J8Wpsw7Y57S2FT5GFw@mail.gmail.com>
 <92190d04-9b43-47ad-9dd0-4b85bb60f8ef@broadcom.com>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <92190d04-9b43-47ad-9dd0-4b85bb60f8ef@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Rafal!

On 11/29/2023 1:42 PM, Florian Fainelli wrote:
> On 11/29/23 13:33, Linus Walleij wrote:
>> On Wed, Nov 29, 2023 at 10:20 PM Rafał Miłecki <zajec5@gmail.com> wrote:
>>
>>> Here comes more interesting experiment though. Putting there:
>>>
>>> if (!(foo++ % 10000)) {
>>>          pr_info("[%s] arm_pm_idle:%ps\n", __func__, arm_pm_idle);
>>> }
>>>
>>> doesn't seem to help.
>>>
>>>
>>> Putting following however seems to make kernel/device stable:
>>>
>>> if (!(foo++ % 100)) {
>>>          pr_info("[%s] arm_pm_idle:%ps\n", __func__, arm_pm_idle);
>>> }
>>
>> That's just too weird.
> 
> It does seem to indicate that idling for too long wrecks havoc, but it 
> is indeed not making much sense. Not having proper documentation for 
> this SoC, it is hard to figure out what impact does stopping the ARM CPU 
> clock has on the rest of the memory subsystem, especially outside of the 
> CPU. I do not believe that this SoC has any form of PLL clock gating or 
> pulse skipping.
> 
>>
>>> I think I'm just going to assume those chipsets are simply hw broken.
>>
>> If disabling CPU idle on these altogether stabilize them, then maybe that
>> is what we need to do?
> 
> Yes, please try booting with "nohlt" set on the kernel command line and 
> see how that fares.
> 
> Also useful would be to dump the L2 CTLR and L2 ECTLR, this is a 
> complete shot in the dark, though was initially wondering if there could 
> be some retention issues, and would have recommended disabling the L2 
> retention policy completely just for testing.
> 
> MRC p15, 1, <Rt>, c9, c0, 2;
> 
> of particular interest here would be bit at position 0, try to see if 
> changing it to 1 (3 cycles) or 0 (2 cycles) changes anything.
> 
> MRC p15, 1, <Rt>, c9, c0, 3;
> 
> the lower bits are reserved, so I would not necessarily expect them to 
> be mapping to configurable latencies, but if you see non-zero values in 
> bits [28:0], try changing them to 0 and see if that changes anything.
> 
> Thanks for your persistence!

Thankfully now we have MCPs and it did not take look to identify a lead 
that was actually documented into an internal bug tracker! Would you be 
able to test this branch:

https://github.com/ffainelli/linux/pull/new/rfc/bcm53573-counter-wa
-- 
Florian

