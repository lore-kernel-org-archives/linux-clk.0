Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF7830748C
	for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 17:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763399167; cv=none; b=DBr+yjtFC+kADedf+x49aCjcQYmwbGSFR5lsCqKRAk8I3+snCGXX/LUmF5BjnCCv0ULfubEfMrErq9kr7YWOSZqtiCz/w9Vi9Prrubsngz0TJa+z2lEpBfpJJ5svjmEtQlA3Sh75pQLshptNGXa1SZtEZjNKQtuH89tZLTLPUjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763399167; c=relaxed/simple;
	bh=6cN01OQbv4ReHoQ5ctuHe34KJ5lQPCYqhlzKPrZH4i0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VQkA+piMX2xnGuXjtdCt2Zh6wI0ODtCHDUkhm4xvg7d6BigI93Q5s2AnDCI2N+W1s8HWCo4KriBCuJFMgMUcXyFvtetBrAU8xivje9wRCpPxb+AHrlCHp4l3xfYay8CvJDpDckEoG3YeKFVBTTqZsOZBaVvK5jbYPN9LC2lIILQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FZqDcrf8; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FZqDcrf8"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477770019e4so50381715e9.3
        for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 09:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1763399163; x=1764003963; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RF6K0T9D3Kbq+RI4UYbxy7YQ25UPBxthtQ/VKgU4XC8=;
        b=FZqDcrf86sN8umfCK2t1OKfi04QN6U+xf5+zTzHz4voP6pp8wo7MoTi4eGijTGrHif
         YFjf7n6ZrxrFgKDkCAB+jqlxujXQ2rp2Le+gOE7Na4L9EP3yiWVV9WSCVx47q6xB3KSh
         3qAD0cEH1w39Ds8cJ4RyWymXybbRNKBoHVz0qrTZVp5wnijep43wIXW5+0aO3sRa882F
         dOyzB6nmsiFHwZOiLRO45vf3tXgnWQIlV2h7Ubg1hVsVON3q/k7DSGCqWfgxW2gqAQhq
         IhKku7XOHvJ017Utfv6J5NWL+vXD9rmhwduldDC9oFJIy8TdUcvvw4GvPqDzpeXveNKY
         yORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763399163; x=1764003963;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RF6K0T9D3Kbq+RI4UYbxy7YQ25UPBxthtQ/VKgU4XC8=;
        b=HEIVnU4etrJqZpNyTl4KzHuaPmdxY53Fw33Ie/AvfrGJy2y2hoaQAjAn7HGaf8dXr9
         wIXHMlAUU7cHwEB+tBUYd7mlfJpmjYx1aHfhUDZaBv4h4ysUk+PhkSd1+nYW2e9L0r1b
         e5626PXI5Wud27L3n6Ah3xa5PIaCMrUsp2KEMYs5dJph+dXj5xi7muDNral2JaGSgofR
         UavLH+8EMsWyBjXfsk71aEA5UtYsTlivASqwY8zzHjPuADVNQHCHm9IZITe6Z3+0qVXD
         cYWFJRTs/rlpr2/in+qA5uNf4XYJO/eA2wE021NOrRMPhQKD1is7juedEpe6cuM1fIZm
         ckMA==
X-Forwarded-Encrypted: i=1; AJvYcCVmPn5+98wvT+VCNIlYw33bVL95/nv1uTuDo7WQFtXAXMIwgwoMt7orkIfar1DjWRmqp76Ggljfa6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP4NbVBEr+93FaNnC9+yto2DxLfDn9Qqdtyo+s29WJZLSCTico
	6U2oFqiuHcTah7Bvrxx1QiJtWSAIAgyrOfrVITX4Ld2Oy+YrK42QjNYhLux2dzGPcJI=
X-Gm-Gg: ASbGncsaetfDsaLVrzA+Qq0q44CBaVzXdsq70GmtyMrGTmqblCrXa7uYJMeEZC7m2/D
	c/UmwZ+eZdmqjj+EXdIWER9ZcsycBflsc4awLD7Z7DWvYih7xsq9yeOYLfiTAayN5cVm8ubmyWT
	scg3UPhcQtu50J89R21brYPtviooOK6T+Mzd2TpL3xJvgZdWOlYZ2L37++hRO+k8U7eRSCbn2ru
	gYQqWGum59Xr3Y5cIfZF8fm253VtFV81/zVQR6mBf17E9JyqaSGHZyG8EraC19S35Dnp/nDynK6
	wJqnHqlareZJBwBogJ9lXc+dw7UztruqgyQVVvnXTEcIpOtlDz3t4vBjjNp+GA6DE5/r7qs0mGJ
	KaHvLHEhoTicgt4vpOMhhgs12VlOx30sZdY1QG19mCHg8ma+kMF0/C2UNtQbdBWk7fXFQ9nJpcS
	Rexd6fLdn/vSEtDFbJ7+oEQK8Dlh7c7g==
X-Google-Smtp-Source: AGHT+IFdt95UyqOpmnSONJqWxf60zoJvU5z2lzK7E2ZAz/tr9X02IhME5IKU/0JxlOwWOvooFeQ9MQ==
X-Received: by 2002:a05:600c:190b:b0:471:131f:85aa with SMTP id 5b1f17b1804b1-4778fe4a039mr107012805e9.13.1763399163261;
        Mon, 17 Nov 2025 09:06:03 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a678a688sm15279465e9.4.2025.11.17.09.06.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 09:06:02 -0800 (PST)
Message-ID: <f5222712-6585-42fe-8b4d-f1d45872c8c9@tuxon.dev>
Date: Mon, 17 Nov 2025 19:06:01 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] Microchip clock updates for v6.19
To: Conor Dooley <conor@kernel.org>
Cc: sboyd@kernel.org, mturquette@baylibre.com, linux-clk@vger.kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 conor.dooley@microchip.com
References: <20251117163747.211922-1-claudiu.beznea@tuxon.dev>
 <20251117-dentist-maimed-67b01dd4af4a@spud>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251117-dentist-maimed-67b01dd4af4a@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/17/25 18:59, Conor Dooley wrote:
> On Mon, Nov 17, 2025 at 06:37:47PM +0200, Claudiu Beznea wrote:
>> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
>>
>>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
>>
>> are available in the Git repository at:
>>
>>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk-microchip-6.19
>>
>> for you to fetch changes up to 781f60e45bdfe351aad692ac0fa89e36f8bf4a36:
>>
>>   reset: mpfs: add non-auxiliary bus probing (2025-11-11 16:47:24 +0000)
>>
>> ----------------------------------------------------------------
>> Microchip clock updates for v6.19
>>
>> This update includes:
>> - convert Microchip Polarfire clock controller driver into a MFD driver;
> If anything it is really the opposite I think, as it did the MFD-type stuff
> before my series, with an iomem pointer and readl()/writel() accessors. It
> just does it with a regmap now instead. The other half of the change actually
> makes it lose the MFD-type stuff where the reset hardware is considered part
> of the clock node and so the reset driver needed the clock driver to
> register it using auxdev. For new devicetrees, the clock driver only will
> handle clocks, with no MFD role at all. Of course, the old MFD-type
> behaviour is retained in an alternative code path to handle the old
> existing devicetrees.

Will be updated, thanks!
