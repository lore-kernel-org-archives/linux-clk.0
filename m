Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8999C25A65B
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 19:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760987581; cv=none; b=oVNUdaxQihXQtSfwaGqU8Bt1tDnTawn7jEcdavV4VTTUM4X9ux1RVC9+Yj14+Yy2hRY2yVpQ7UhUy3A2EtuiwarQdDqlLs74ZHLI/SV5z6wJIOHASOzTqdyn0qSue3wxz1+6mPRpSE9VfsRXKjSUJu+NR1c7SBtoTwO9NgE4QNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760987581; c=relaxed/simple;
	bh=hVT3hY6tz59tIIi7tKWV6ECT2wfeievMvQ7IIDTlaZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kKl16MYdXbLgwFkDszpkqBzqSGoRkR78sWV8/BK8DSp3O3KLIBTL7M0gxqo/9ddARBX/MKA0PI76tX5TWgvCMls2xLCLyovg0b6iIhEgCT6k4gO2DLjR88pGWdA8Zi4GeyPWB84lIepitT40fgOlgD96NLbleEJNPnSdr4rri9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=kmMuzy7c; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="kmMuzy7c"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b3d196b7eeeso837520466b.0
        for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 12:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760987578; x=1761592378; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zkbTEtqdRTfgmATvZD4Qc4DJJkydsbu/UNnHytD9sg4=;
        b=kmMuzy7cenbrZS3mEbnvrl/Flo6h+Ut5Zy3e0i4/cyLMzgiPOHD07nx4GLSULE1XrC
         BI40h9Z9GUplh1B0F9PRVvHqyjuIAZrM4wg9RtqeghSfLoL2HWsoF8eY/pssQoSPYP08
         00s526vonubyBDyvM8X0AdXlcgAv+GdxHe6KnUO8CrLhjpbjXqubHK5QkACnfW+WltYr
         m3ST8uuzAK6RfCwq8+JeonzRHypVmsNfHyvli3jOwRL+Cm4XVWmxaMw8Dg6YB+l/g/nL
         /I4SrRXHn8keUbTN25quR4dp0kGmkMS1NkRdKo+scMmdKXx2xZUSOCr08QHMAtqIRG+o
         9xmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760987578; x=1761592378;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zkbTEtqdRTfgmATvZD4Qc4DJJkydsbu/UNnHytD9sg4=;
        b=eXqSRC3xtSJF7/KBhQRF6I4W/N48O9aRvRIyo86ZnHyN8GORBpl9URZL8Aa/50rXRx
         Bzh7RBPzMTU6JsYUNmeg32zRmslJ3hCm+D9mVwuD0+46sjwd2HAdATN7KJj45/2OVaKZ
         FofLBalJ+OI/eNDlC0NxivqHDssvdiwid8b5nkSJnw56STWhu92XCePXzez4t+PH4n+3
         +kYoE2HAwvEOyJI3w90aQhf0EY6mfvkGyd+EejE1sbHkVAPvhfmWyoFfPq0RSXbej07o
         Nm2s3jxsAcU8GvxB9ffRM6P9yWFYA+v0haIHo7nueQOEFcu+SyvhKlXZGMZMRHz23UNv
         dThg==
X-Gm-Message-State: AOJu0YwpnRoaBySFn1uXcbuKVt8eWHbqv4iKzEunhVwg7QijiTdAXA6N
	ad95L8H5WZWlskqZL1/tFdyPwH5Pe1AnFYkBATShQ2upG7JRDLMWLB0kXJmRGuhGtIs=
X-Gm-Gg: ASbGncu6PBMxD9CLzEArW1OxaJ4Fuz3kQs4oVKjNpedBn0WI2UQHUDSaOJ5xOJSXdlm
	5qjJoaBdNMJ5LWweRDzQEZog2kg99XEdrZUaUHNUMj224+z+zkhY7+ze0CebZy88SM/5OtF7Roy
	4su3cEPGLZMkAL/jboQza0Ca6ZmvQjUMjKcOLqWqrQg8clVg77OGrcIC0M3a0a+rU2VMHB9kxHQ
	cVNXSyEEgnbLXT4bX40oe5AYUwOtBy40oy6TQqMK8WIR8j/KHe0iSsLC40HQ/1FRjrZNxqNNmZR
	X9jEVLf6F1/MVvc9uJzDugn/UPGvUnAC0m2tnJkPwwxj9muYVoFMu0y/f1qZF3NUYi3MeAyIxct
	XhVcjRD+C7pkIQCER4X9EpOQfpE+eQrC0CbKJNyT4lP3QJ1RPsm3uRFAufHHPCrzmy4c1iqAXBO
	yt+LYyhYI/
X-Google-Smtp-Source: AGHT+IE+X5JpzMaImDhaId50MFj6FY2X9vUqqcmU/xQrocAAwZvjv+bdBOOQS4rP8CKvZNBKJCdcDw==
X-Received: by 2002:a17:907:728d:b0:b3f:f6d:1daa with SMTP id a640c23a62f3a-b647443cf06mr1587664466b.37.1760987577301;
        Mon, 20 Oct 2025 12:12:57 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb952046sm861152966b.70.2025.10.20.12.12.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:12:56 -0700 (PDT)
Message-ID: <89e15554-e4a2-4f74-8ded-1fbec7ec5000@tuxon.dev>
Date: Mon, 20 Oct 2025 22:12:55 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/31] clk: at91: clk-plldiv: add support for parent_hw
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <ab562d7a5492e45878aa3d4160ad9079571625b0.1758226719.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <ab562d7a5492e45878aa3d4160ad9079571625b0.1758226719.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 9/19/25 00:15, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Add support for parent_hw in plldiv clock driver.

s/parent_hw/parent_data. Same for the patch title.

> With this parent-child relation is described with pointers rather
> than strings making registration a bit faster.
> 
> All the SoC based drivers that rely on clk-plldiv were adapted
> to the new API change. The switch itself for SoCs will be done
> in subsequent patches.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>


