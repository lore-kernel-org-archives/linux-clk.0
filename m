Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFD515E5DC
	for <linux-clk@vger.kernel.org>; Tue, 26 Aug 2025 11:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756206125; cv=none; b=HJQxUDoKpHPgFFqWhIu3/eKcy6PkD4XEUgt5GKnxwSI46pOFnPg3kIyfIEMj1LhWiT8VfiknJ0+rfcS7oH6dhG3rBgpSVzpKQ2jwLWTL3SvmtoN/vDgeQjzCSKA++KeOjnpW+RYTplNQ2cdMJomc4dxJ/82GkTPHagb0/0VZ5NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756206125; c=relaxed/simple;
	bh=LH4NaFwMH564ZNn49848uCu1K3fc78EyKP3IwLdanJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MB5R7CnD1ps159fBfvV9jovVdzsDECHucn8myoT5T4E7qBeSEO7ybdIK7QrFU+c0Z8WZ6ZIAi2CTseq3it1bxti/MAT0xlOuPnkoc9mjNw8rP7Kxjsvo5qyhglM0IhhNpwF55HNVYk3oFptVG38kmypcqbt3PdRd27ZwtdPspWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=j9uWEU3v; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="j9uWEU3v"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afcb78f5df4so926047066b.1
        for <linux-clk@vger.kernel.org>; Tue, 26 Aug 2025 04:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1756206122; x=1756810922; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S9pMIy2ceXu0U+iaZPJ+CBfNzoY8Ci+2h3RmbLWXEeI=;
        b=j9uWEU3vipQAR6vjvIopP4JMg7TsCX9RdJaVvfCZD9plbft3Tg26ajPPTGA7jsD9Fy
         6f/QIv7ZrZw4I9JaolerLLb4/S3D5jHkAHoARoQbcv9JroOyrRB2pZDWIp+eY4C8ee2z
         KoH/V7wsgt/8sNpB7zvP2rwx77Cqps8K4VHS8rpNhIYHzYiHohcsSBx9MOQ8/d2zx5z1
         x5E2AnjNVbY6XVta949W/rZHPf+I35yIPvk49i5ipMSXew7TzPaH/X0JwkgT7xclQkfX
         MB3CpjxZIhAZNJwet/fr6rImqgEbp8npL4TUDghDCv/z8BWrSSTRJroWX9/80dHUit3d
         Z5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756206122; x=1756810922;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S9pMIy2ceXu0U+iaZPJ+CBfNzoY8Ci+2h3RmbLWXEeI=;
        b=NTJKIdBUrc4RbhiyZeQzlKHCgUMXk+JRfoGFbsvMeTRqEx/etwYXUH+z6MoiJYZXRM
         00iV/DL+lMM8jZNqTKf7nF8US+BeTG/MKVvdbVXmL23eue+/7u7hk1c3ATM033YocGRI
         2MSB6jmQZlhVJdZMP8kn+uCd1iTm5rom1oQpP+9ZMMEiZbhkO85hOdTd9D4lYnBKr19C
         T2GVqo7iP+ttA1QsW97hcEpuxwnsxpv+7bdxoGl+xvUhT6AR1sZi9zGr/+PsErwKc3gH
         Y8JxS1dqoXpFBv7NBzoycK8qQeW2QWFKVCMBRBSlfTS1q0dS6hxzMZLIyKmZqXi418O6
         stTA==
X-Forwarded-Encrypted: i=1; AJvYcCUNIu1GiUi+dWIaUS4alPe0xNkuF3UNTBRmtCBocdgS6+I6Cpf/YmzKOWcOhgwGGGo8OSMToRn704E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu51TL4AfMLY/u2zXgKMIxc5b+MogSUedseNIAV8YIyeOh9xJp
	F5raETQb0OAhD9PPNxWWpsTAXegXzrpP+e+zfefBAfW5yzjglXzLWsfddVjDGD/GW/U=
X-Gm-Gg: ASbGncslYKoapT+N7Zgf4maCDDsHbk5yrILJ2/p9zUOx4xhahtCzgu+KT+tQkDa0v7Z
	RKhybiaCSzhFstsJQLcsujmkyEoFcWBliLHAl4KC2KF2pzWGMKe/om4FM7g8OuhWNqlSwFgSXZV
	D7vEWbSLu9mledg9PL/LC3oXDm8e2EQ8X8qZ6fMqW4BZu/q6gNMwaGG1If6ueUGlUqcZS0jgrvI
	0YNkbXsqz69DM8kihcjESdi7/zYSkuEeSTKEDpRWS9HR4sYSIMHDNRnCVc28BcO9ALRos/OmVWN
	D3X+L/aIWwWrxQEvzF5agxSAOyIN50aURDf6ynNi6BIYIlUGBUM/YEQGRr6OTcK4fiHHKd4JD4U
	37LN4Hq9x99IieZAm33Q12x/GGtnf7X8kcRqZbZvQMBqs/aJIoSLGDliFG5UrvHUp4Mf1+lacw7
	usoiWRGzdCENNJ
X-Google-Smtp-Source: AGHT+IFsEcWIMVxL9iC4gvBj9YbqBmSOY+YYxvhjHWiMWtUrH8NxDZ6rdnSthTAZuxEPdrp5IvpPaA==
X-Received: by 2002:a17:907:7249:b0:ae3:7058:7b48 with SMTP id a640c23a62f3a-afe28fdfcb1mr1617412266b.25.1756206121373;
        Tue, 26 Aug 2025 04:02:01 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:6103:4200:f276:8e0c:6e17:2570? ([2a02:2f04:6103:4200:f276:8e0c:6e17:2570])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe7aad5d61sm447908866b.105.2025.08.26.04.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 04:02:00 -0700 (PDT)
Message-ID: <0d71269f-1c78-4732-8235-5640bf340d00@tuxon.dev>
Date: Tue, 26 Aug 2025 14:01:56 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] clk: renesas: rzg2l: Disable unused clocks after
 resume
To: Brian Masney <bmasney@redhat.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, geert+renesas@glider.be,
 linux@armlinux.org.uk, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250821080333.27049-1-claudiu.beznea.uj@bp.renesas.com>
 <aKyX4YJswZLuqA6Y@x1>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <aKyX4YJswZLuqA6Y@x1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Brian,

On 8/25/25 20:05, Brian Masney wrote:
> Hi Claudiu,
> 
> On Thu, Aug 21, 2025 at 11:03:30AM +0300, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Hi,
>>
>> This series disables clocks that remain unused after resume.
>> This is necessary when the resume process is done with the help of the
>> bootloader, as the bootloader enables various clocks when returning from
>> resume.
>>
>> On the RZ/G3S SoC (where this series was tested), the bootloader enables
>> the SDHI clocks (for all SDHI modules, of which 2 are used by Linux and
>> 1 is unused) and the clocks for a serial IP (unused by Linux).
>>
>> Testing was done on the RZ/G3S SMARC Carrier II board.
> 
> Do you think that other boards would also benefit from this change? If
> so, what do you think about putting the call to register_pm_notifier()
> inside an __init block in clk.c so that this same change doesn't have to
> be implemented across various clk drivers?

Yes, that was my other approach I was thinking about. I wanted to see how other 
people consider this version.

> 
> Alternatively, if this is board specific, could this be fixed in the
> boot loader so that the clock that's not used by Linus is properly shut
> down on resume?

As a result of your request I did some more investigations on my side, I can say 
that, yes, in theory that could be also handled by bootloader.

I can drop this and try to do it in bootloader, if any. Please let me know if 
you still consider this (or the variant that implements it in a generic way) 
necessary.

Thank you for your review,
Claudiu

> 
> I'm not the subsystem maintainer, so I'm not asking you to make any of
> these changes.
> 
> Brian
> 

