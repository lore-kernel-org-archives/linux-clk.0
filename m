Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70FE500946
	for <linux-clk@vger.kernel.org>; Sat, 10 Jan 2026 16:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768061865; cv=none; b=GUbpzrLh0S6tQWDfx9q3afC80XLi/hpyM0yDd5tbcltr/CR2c0upUq1hwbd+UlniOHCKQcZLoafFqjr0pCuvl+Ktxhdh/ktjQpr1UjHTnJmwjVe0R7nz6NVGuVb7gnVVk9EwOtRCYXkk+Z0PlndDXTFwGqQtWcAFTgBoVU9R/5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768061865; c=relaxed/simple;
	bh=LtJAiYMPu3vSOcm4a9eAPwUHnr6T9RENKRy7pFLUvEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jhWpCpCjYkCQBnvBxI7pzxvkQEl4S7c7fZlOVW/ist8RL9jgx3vh43kRVQQjLRFt8MQg+NK+RTluM1ix0CGnhjqi27EcQk1jxg/vj9kGJgSagkJexEntHyi7ghQaDwAK9L+Rnb9/zpxwZjVt2IDTQBJKKFC0k0NeKvQ/+MCKVZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=pSJMnZSl; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="pSJMnZSl"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b87003e998bso43625366b.1
        for <linux-clk@vger.kernel.org>; Sat, 10 Jan 2026 08:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768061862; x=1768666662; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qncqnLubMYC4ApM8lJi4wrVgA/Yt4u3+/s/LwC2vUkg=;
        b=pSJMnZSlQVhTHFHaqE66mMqTmAGNtWlCDAHBIg9t2twjVQp+xEz+s/XCLXwzuYgCwd
         ytaWWeZtHyTV0zSwf8pjyCCt+72CpTvEdcO/N10nv6HcrNtIBBjHPFFCNsbm/i5iAAWf
         o3xe4d2l1OY/BGosx/Px/POCkAE/R0a9fNwySWVkO9KPxR79UU0auNDeC11t0ORrdD4G
         mArJewFClqxyGljfJKlMXhWrkMMD5UB6Kt+0xITsqOOxQWDLHqJCFzxS3SQf/uU+pAPl
         tR1vwrG2gZh5YDT+fxvHO1x44gAKwGiwKYUU7H8I+IJnoK8ZahgRlcUIYgWzcktKWuGq
         xDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768061862; x=1768666662;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qncqnLubMYC4ApM8lJi4wrVgA/Yt4u3+/s/LwC2vUkg=;
        b=ncj5Z1Xh2NTTsmnB624ZyhWV6XFTA7CDjvkjGUWmYo64hl85xOjSi8N4bLxMNgK8WX
         EBOEeBdwdPILwCGeaADkwbEVf5vLet9LBxALuz7nIlwMGo2CwNldu9C95ZHf6yIJ93EA
         48IfSwcvkhyclG1bzvhpjMV02ZLFE7PxYjDeBFyreHndNa/E53xpAFCxoJxKqU3oQzAU
         eUHEzQO+uikGuMX9q0N34TBwB30fjBbZiqlNG45CtWhRp5ikNzWtlkT+6Fjeg1p4OGkw
         I2H9hWWvrrcGQJp3YxoDWE8MI1kF84pejlXaK/MJhbsHC6h9qyctTI2C7KlCgoCZgEB1
         nWtg==
X-Gm-Message-State: AOJu0Yy1JBjMI2YZuUcsNd4J7UzDod5T6LVS1BRB1TiUlcXzHa9QIQvb
	owl4vt4+W+vtI7Ik3wxgHohbFxppgKdm07sXPIdj/iNRhUGaG8tEJCrLQizRACXl4tQQ95pKOOW
	3L36h
X-Gm-Gg: AY/fxX4WT5cih6enrBN82fiqH0wCX5aZpBk2HCacTYXh/CxW0jRrtsrigMzPEuVA9+M
	CIQsEYB8Vh+2iIzbx87ZyYmM9tvI1e2bZz9Yi+z33as9HvbEVf1I6DmlUO13ryk92FaWzQPHW5w
	Iwse7WCnPIDvLXTX3ppXm7VYR/eU0crZWBaGeHkMmD8ehG5Hyzo32UD7N8CS9njdpQWtKK/qhrH
	cMlZcZjOH1N3QyjBhA1eld8PMC8DLM9j1XNYMuerr9d5GGZ3RN5l8hQZaJ+MIph79FgPzhuWa4c
	oGxB1vXe2TXqy7M9ClJK5aJ6tImULBHfVUsnWioIi1BBAiaf5EH5OITWXj4HmS0a3Dv/NN9l36f
	3LeEWzEKOL5Uk+Cjo51Me1N0zWfVRzZkczYpkAOgxjvXnDXX32gc7J3gpsmH+wR4l6ocUQp/a4O
	3WrPzOKzI2NJDBX3c1/g==
X-Google-Smtp-Source: AGHT+IEt1vR7d0Du0VgJnxJCpzSziFh+TSZwsM8O+w7rOv3sQtzjQL9vGDgyVHyYf8b4VXURK530tw==
X-Received: by 2002:a17:907:3d11:b0:b80:3fb7:8e68 with SMTP id a640c23a62f3a-b84299be630mr1773773866b.21.1768061862067;
        Sat, 10 Jan 2026 08:17:42 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86f0d6d7c6sm213670766b.42.2026.01.10.08.17.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jan 2026 08:17:41 -0800 (PST)
Message-ID: <b288af38-f0b2-42ee-a950-c8f9739fdfdd@tuxon.dev>
Date: Sat, 10 Jan 2026 18:17:40 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH v2] Use kmalloc_array() instead of kmalloc()
To: Sidharth Seela <sidharthseela@gmail.com>, alexandre.belloni@bootlin.com,
 nicolas.ferre@microchip.com, sboyd@kernel.org, mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, david.hunter.linux@gmail.com,
 skhan@linuxfoundation.org, khalid@kernel.org
References: <20251123070905.93652-2-sidharthseela@gmail.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251123070905.93652-2-sidharthseela@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Please use "clk: at91: Use kmalloc_array() instead of kmalloc()" in 
patch title.

On 11/23/25 09:09, Sidharth Seela wrote:
> Refactor to new API, for cases with dynamic size calculations
> inside kmalloc(). Such calculations were found using grep in the
> sources. The patch compiles properly with multi_v7_defconfig
> and multi_v5_defconfig and generates object files for the following
> driver files.

Patch description should answer to "what?" are you doing and "why?" are 
you doing it. Please specify also why are you doing this change.

The rest looks good to me.

I tested it and saw no issues.

Thank you,
Claudiu
