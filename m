Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213425;
	b=AWXIkFeElRqsRKj3WTe4LxNuUx9Ou8WLDgcV+0o/1DjGV6/KH+GYgbTMijopM/3bZCxs
	 8D+xOR6hvsx4V5x9PV4IGJAkcOf5KGwO2VOa+tpLQFcizvSaPpOiUlP4SGBrWmh+P0jGy
	 mWRFsj5SqFRIFAvR5iLqaY956RCL7b1/042fZB/9HoTTgE9oe0Zn5V9zCrR281HBXSWYb
	 yghRaYYSVwm1qpk56P3GJJq7cCm4uiGDFTIwSdcIABUtx8nRPj+uhnhGD/Wp8BN3FDF9L
	 bIVdu0iSLxuIi5QZb5tPDq9bJZnPmPtyKDgLyUSn7kSWCURxQ8wZsYbWcLsGfgcTqzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213425;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=MlWVeqxOFKnS07Xt1FTBX6BAWK3NjkCNWJ9S2mRfn1c=;
	b=KB7Y7C/+YZcP7OIiw3SuIyPmxBusDaBQiZoZb3UMhx4MILcRcDzD9Qd42RL3NyvcLv2W
	 xHt9pquMUMLlJVg2qV7NUD/C0DYKZNpdbwP402A8f22hywAu8q8GRhWICaWY4tTg2QwNf
	 vF9mJv+OXGkVPORFM2JwRYsIp+TJgv7ms3UvgyEgm7GaVb8uDE3D7G2Fqpoo5pJg+Vn3n
	 DXORgQDx75q0TKi2Lc5FHpLLgaDZdMISCxinJd1uwDrSgegmQIxMiof5RqOJlbP0+N4SG
	 dR4oXEZE+FnXagpVM8mIGNn8ShPrTiPzl47/PSJXjpvgsZNVryaV45YiArx8PQl37uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Tzw6Rxrq;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD7E606A323
	for <linux-clk@vger.kernel.org>; Mon,  9 Nov 2026 08:37:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DD7E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Tzw6Rxrq
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e4831c028so651641f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 00:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794213422; x=1794818222; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MlWVeqxOFKnS07Xt1FTBX6BAWK3NjkCNWJ9S2mRfn1c=;
        b=Tzw6RxrqPja/r0l06MJeWiJ0A320QfCoAEQXFBZDyLMfOvcyVsNFSavVL2KeLrAjtd
         Iyy6sj0S3bd1T5cU7P3PvJaphryRjt4v6pqH94tBoCn9qqAdNj+FMMjaIhujpqNpdtha
         qPBGznQGAgMxY/hF4fXcXaCc9KTd9o2HvRfXlP+lfEQjxj7pkmweN1pWIS6Jk16O5q70
         oaXCHBTtKa+EAa8zwwwPq4eaJPiEKpkACrZvRz2jVQMN4H+Jb/kMxFDAcRxY2oydMRnd
         BvQqw9tBC51SFrUfgTtifHxsfqOIaNzro98P7eV+L6u+hjSAxHgCTVsDhAB2FSd6m3ra
         YcHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213422; x=1794818222;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MlWVeqxOFKnS07Xt1FTBX6BAWK3NjkCNWJ9S2mRfn1c=;
        b=q6S2+X84HIXSyR+XeYaDtgO463jpAiPAMOXbMH4HdXRD07837GLJhFTWbowIb8dtNu
         IiFlbF+OlvowvVNbcunfMzexHpq0TBi4ZvhXwyDuSOpJu/npg7LKDiybGWSvxEhW4e6r
         xLJ/XLnLObZG37v1R0OgG62uO+E5Q0PS8rLVI5ym17tgKQUoPul1VahQbVHglpr//KnI
         imBYzzg/7uhMDINY7lEkq7FFTNxiSXwCnHJSL+mV538FnPC8Vw3aclM3DZKbMygsInqL
         KG0ldNNTj4IklE8V1g+jRV9OtamyKO3/4NlbNCvwMAiMMgkO9Zq4Rb9NN0t2WpLtJRRA
         cQMQ==
X-Forwarded-Encrypted: i=1; AL+hErEl9qrrF7TZQRtLHo2Dwm93s01HZoHauoyqanhYzHyMJhxDrhy+RmLUyi2qm5Im6iUX5/++T62N5Ig=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bjTRGBtThqLOYVPaxcagy9IPibBj+SrDORUxGZfjxJavP40vM
	qleS6IWz93KqfYXSpDjXWdlOqKuSU8GVWB25jp1p6ysZ36PoCS53PW84wRuVTf4x7bGDTaThYKm
	1rrcG
X-Gm-Gg: AYBFou1Qp/Gs7nwZJ7xmx1+PW7lb9oAFAdO2uNhyiiuGqPg4SaDd48ineXwTIR30KT3
	IUUwZFwZINQLb1dHO4zwxwZixexGyzbOGo3fHU+V4w2XKc5gc0JOEeDwSsh0BrCLqKpZOGkvzqQ
	MKv5BIkqEbSoz42mCD9kPCmo4Z6xOvNFu4mhPShdcKPEl36YiJdX4h6Pk4V9806U1LCpVAq2Cpu
	wkLHkLrExVdJv/b+LJKgEt68eRUDGwYmdieDt+Wj3bWXOLOcdprI+RAPBB563OH/2sTRjt5hvN0
	T5B9OX1GP+m0oMGJJPSSdFKAKBAt+dEik5dbK03TlVrfARfb70idIIKk3HFQzobI3YsA1F7OIh7
	GTFXwcGo+k5AU2FjJXJN55eDxXdnxNzIMxCtBKWC/yjlT7cKuzaDYrDA/D/Q21GMytfPBj4EEV9
	RKjndxUCnWmFTrDthj5WrK8vp13r+MjWe3faqpYZUq9E9sjMSxm6nbO9G4bhQhnh4TNlDzEpv3e
	GxgNCIPBhvCfNYRbRKUjc08qwJjSIGtAhxWVmAFZ2Lwj5BScZluVl23aZfYg2Jxl/cX5MRhhAXQ
	YtTym4FO7aK5rMPucne2pNcbyDGw64xAwA/W8lbLwSwsaDj7
X-Received: by 2002:a05:6000:383:b0:492:7d9c:fcf8 with SMTP id ffacd0b85a97d-49585bae5b9mr5896344f8f.49.1794213422144;
        Mon, 09 Nov 2026 00:37:02 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm8320547f8f.7.2026.11.09.00.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:37:01 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Conor Dooley <conor@kernel.org>, Carlo Caione <ccaione@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jian Hu <jian.hu@amlogic.com>, Chuan
 Liu <chuan.liu@amlogic.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/7] dt-bindings: clock: Add Amlogic S7 SCMI clock IDs
In-Reply-To: <20261108-computer-backed-d98862794d18@spud>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-1-7d501d62621f@baylibre.com>
 <20261108-computer-backed-d98862794d18@spud>
Date: Mon, 09 Nov 2026 09:37:00 +0100
Message-ID: <1jfqxa1jv7.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On dim. 08 nov. 2026 at 23:21, Conor Dooley <conor@kernel.org> wrote:

> On Fri, Nov 06, 2026 at 09:30:24AM +0100, Carlo Caione wrote:
>> The S7 firmware exposes clocks through SCMI, including sources needed
>> by the other clock controllers.
>> 
>> Define their identifiers so devicetree can reference these
>> firmware-provided clocks.
>
> Are SCMI clock IDs actually suitable for being bindings? Can't the IDs
> vary here between versions of the firmware?
> They're also not a "made up" set of indexes, like traditional clocks
> are, they're real numbers that come from some document akin to
> interrupts that we do not have bindings for and no driver is likely to
> reference these definitions either right?

There is no such document available unfortunately. I'm not sure one
exist to be honest. Those IDs have been stable ... so far, but sure,
a FW change could change them.

The IDs are totally made up, in the very same way the other
amlogic clock driver IDs are. Providers and consumer just need a common
reference to desginate clocks, this is it.

>
> Is something like this not more suitable for being included as a header
> in the amlogic dts directory?

If you think it is more appropriate to have them there, it is fine
by me.

Carlo if you have to respin with this particular change on the DT side,
feel free to add

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

>
>> 
>> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
>> ---
>>  include/dt-bindings/clock/amlogic,s7-scmi-clkc.h | 27 ++++++++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>> 
>> diff --git a/include/dt-bindings/clock/amlogic,s7-scmi-clkc.h b/include/dt-bindings/clock/amlogic,s7-scmi-clkc.h
>> new file mode 100644
>> index 000000000000..10d7caa5d1e2
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/amlogic,s7-scmi-clkc.h
>> @@ -0,0 +1,27 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +/*
>> + * Copyright (c) 2026 BayLibre, SAS.
>> + */
>> +
>> +#ifndef __AMLOGIC_S7_SCMI_CLKC_H
>> +#define __AMLOGIC_S7_SCMI_CLKC_H
>> +
>> +#define CLKID_DDR_PHY_OSC			0
>> +#define CLKID_USB1_PLL_OSC			1
>> +#define CLKID_TOP_PLL_OSC			2
>> +#define CLKID_HDMI_PLL_OSC			3
>> +#define CLKID_USB0_PHY_PLL_OSC			4
>> +#define CLKID_USB1_PHY_PLL_OSC			5
>> +#define CLKID_USB0_PLL_OSC			6
>> +#define CLKID_ETH_PLL_OSC			7
>> +#define CLKID_ADC_PLL_OSC			8
>> +#define CLKID_CPU_CLK				9
>> +#define CLKID_DSU_CLK				10
>> +#define CLKID_GP1_PLL				11
>> +#define CLKID_ACLKM				12
>> +#define CLKID_PWM_G				13
>> +#define CLKID_PWM_H				14
>> +#define CLKID_PWM_I				15
>> +#define CLKID_PWM_J				16
>> +
>> +#endif /* __AMLOGIC_S7_SCMI_CLKC_H */
>> 
>> -- 
>> 2.56.0
>> 

-- 
Jerome
