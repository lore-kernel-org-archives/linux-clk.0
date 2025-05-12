Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3653D22332B
	for <linux-clk@vger.kernel.org>; Mon, 12 May 2025 16:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747067249; cv=none; b=GHagkuNCDQzx/mR54jkd+ABSBk28yElf5K4l8K/EC2Y0tL2FEBD8Wuob2giCix9RQsqTUCzRh74h+gM8Lx/QOHqqjzwq3I8f4Voz4OcMbHd4S/oeWr2nIohEsuCMVg5aK0pbk6wz7Y+/Haja3QiiCCmwbcYDiy8c8bVQEjUyeKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747067249; c=relaxed/simple;
	bh=J2u66nb+ZRnekPNZzRKWIEEdjXCW8XvffK8/9kLcR0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d6ALQRK34K2ru+SceoFoQktK7e/0J7+qHH/Hw9YDfZSduKDQ3gBsGbQBrfoiZA0NGhV0qq85J56t8AYZ2lMCfmp8jemtYOYfmrRDAriBHnpDpD+y01tfTiV7ovJ8/F2S0tRd2+WiwqbkYf0q9FftdgbX6aExtBK/qEOF/yKKSzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=A70uVjpl; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="A70uVjpl"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3d817bc6eb0so24219285ab.1
        for <linux-clk@vger.kernel.org>; Mon, 12 May 2025 09:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1747067247; x=1747672047; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tAY5Ws/2zHP7f1+msXoBsYcHSMzdc5Is7v349rd+4sk=;
        b=A70uVjplBv+wFWsd/jSj5yauDdVTs+6S/1N7+wMeIzVei8NkuzeTk0wpvsIFNd20Ci
         rzrnc9PPkMk8m+rO8p5ku6DJC5x4yXsllRltFpj5DM+E002l+orWuawQtJTiKImziyLQ
         acDmyrl6cpJnZLLFXklomezMuVOdlhud/ZkLrrzMy4HNGPC7mHe1qeQ2zLM6/LNr+lSq
         JKHs+5YcDzRYUO2JVOH/LCMLYOJAd8jnne7eI+A/BAMa1XZlPEnuLLkW1411S/rQsaHV
         pw8Jlk/gdD/JqyhKV9tCPLlFyM6HniklbPw4xVmc4r9mnq9RB3mwe8L9IIz71hj/2yb2
         j2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747067247; x=1747672047;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tAY5Ws/2zHP7f1+msXoBsYcHSMzdc5Is7v349rd+4sk=;
        b=YAyoPQIeC0a8XBJzhCHLPfxaZHpXsnRogIm7/BQncPSonNduTXjdh/FlL6pAV9t5qT
         YosRPkIRTCQ6UGpHZHiV3w89aSIaBQAGxDe0T7XaMhWUwuLGZh5eJzJAVOF/9jkr7OHV
         9tBnggX1l6ajCqH8ZeRjnL1sqyIenWw8niyd55VUIw/CrkHnu7N6TMUAtDL6WCW+oGwB
         tOK3c3qB+pkXfMXQxu+8X3el56310JaUw/MweoJnDs2pm7Q8Ga3NlHofxzyA6wQ2Bnyd
         nGcGzYR9dIPoyzLuYns5ChKusYvo10ZBHxfnvu//OCmD8gm4UWlKGXGY4sZ9H1E6Edqw
         9rYA==
X-Forwarded-Encrypted: i=1; AJvYcCXLljKAbCZwfDXH1cQL+b7fSj4NEfKOXu0fodNKGNdp5/Ver90XZvzqYUdpdo6+3pUTrH89gaORVcs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7QvpDrL/yXk4MpP/zwiqucjZ+t/mP9ZiiYXxRjMqygNtS2qaC
	/myEKHzW8JEOSIzn4QIKBY9pCZ6Lnc6nWad5WZECFzCcDG6+m1UJsPsJ34R38IA=
X-Gm-Gg: ASbGncvCi4z4d4U7lsxJcVKibdzJE2UoXLVdjjRctAh2VRQx3eC0RskKAhaAMsk8hOo
	XPpKWBQJqxr8BXHzEY0IUT03E1+mAPKHG/QHSpLsRJnzzd9rYP4Dx4YsNVGhq2A1KDnNm+dlWRE
	uy4Yfyxi1zwSRSJ8+4TLEPPpZ7C/1MeggYae6P8Q76Znz3Lo+iIncFTdzR5mFzXbFssJfPuOc5o
	fLGQULhlpbitEAtZe66oAqmGUo4dBQXIaCEsVNUN0/CCNHCPy5GP9SaYUMxQ0pO/PsOjgN+7COY
	hgO/PPl+sAwihgpofowypyoFoofuUQaVRvGX4G+Se6WTOUx7/DDeiJ5zwLK+JbsP34Cvl4rDbi7
	MbkzUGYT2nwixIgAoUQvr0bLthw==
X-Google-Smtp-Source: AGHT+IHMljbBOih9XI5ChNfY5x9ORAxK3ZQZvd0UNipzv1F6zPCMndWOAl1ZZJYumsZfCVB/PanfHw==
X-Received: by 2002:a92:cda7:0:b0:3d9:66c7:d1e8 with SMTP id e9e14a558f8ab-3da7e165314mr150329395ab.0.1747067247243;
        Mon, 12 May 2025 09:27:27 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa2a9ac275sm1503877173.80.2025.05.12.09.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 09:27:26 -0700 (PDT)
Message-ID: <5674cfb0-fabe-4b58-98fd-8479c4d3ff79@riscstar.com>
Date: Mon, 12 May 2025 11:27:25 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/6] clk: spacemit: set up reset auxiliary devices
To: Philipp Zabel <p.zabel@pengutronix.de>, Yixun Lan <dlan@gentoo.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, heylenay@4d2.org,
 inochiama@outlook.com, guodong@riscstar.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250509112032.2980811-1-elder@riscstar.com>
 <20250509112032.2980811-4-elder@riscstar.com>
 <20250512135429-GYA517867@gentoo>
 <abfd4c78-2592-4b8a-97be-109a8fd1bed6@riscstar.com>
 <91afcfde275a28127ba0df962a9abf4d07ba6b8b.camel@pengutronix.de>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <91afcfde275a28127ba0df962a9abf4d07ba6b8b.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/12/25 10:46 AM, Philipp Zabel wrote:
>>> so I'd assume the underlying device doesn't really care the id?
>>> but with different order of registration, it will result random id for the device
>> These things are identified in DTS files by their index values
>> defined in "spacemit,k1-syscon.h".  If there is a need for the
>> assigned device ID to be consistent, I'm not aware of it.  Can
>> you think of one?  I think all that matters is that they're
>> unique, and this ensures that (for up to 2^32 PMICs).
> If there are multiple reset controllers and the driver can be unbound,
> it's trivial to provoke a collision by keeping one device bound and
> unbinding/binding the second one until next_id wraps.
> This could be fixed by using ida_alloc/free to manage the id.
> 
> regards
> Philipp

OK thank you.  I'll put together v9 of this series and will use
an IDA to set the device ID.  Thanks again for the explanation.

					-Alex
