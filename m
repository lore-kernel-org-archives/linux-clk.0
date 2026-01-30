Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB43A2DF133
	for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 07:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769757272; cv=none; b=Ttc3XBFzAuFjpZo+Hx9afAsVEfEbOYIVYnMp0cSFGvM+wyrF5wwgAFaJTPkeyn2S+A1HPWzZmBA6NEDuuf7AJxSydqN0c9yp0DoFEq0TM9rDZ1LK78EGK5dved1kdiZn+zpgm8AYCVttwnAzaGociMX8x2I/37OvM3o834s+Vyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769757272; c=relaxed/simple;
	bh=OplTqmIMIM55ZfwfwEcAuJ5L5iBbYKJ6neWziiR8WtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P40izBiNrostx4dGWEcWesIbEKLl8BPb9Xo+3QeAkc6apzhW7+BDnexSbnO225E7DBi6vY8a7n9DvQpoSwMh/7k8YDb0H3SHnlAjCsC6VFT+y43SChvXXoDTrwT1R10ZubfHM3KQHWk9uKpRNdBcQWGpCCJFb22utnlmiGFjRtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=oGfzyLUX; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="oGfzyLUX"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-481188b7760so11305155e9.0
        for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 23:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769757268; x=1770362068; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kIS7Tv8+p6x2LqhRC/mSoQut0LYtAOWTBCiN5CGoQbo=;
        b=oGfzyLUXjD9rv5XmbBWQY+LbsUYknpugpUdon34MGwcjIpx7R2PxFR5ma1WQpofRVU
         2DjRT6P75rL2yXgBlLcndLohg8vEWkJfjPlHBgwOM6qkgeZjh55vYpVaz/3a8bMjjglE
         6q7zFm/V8lanKLOL9nbbjybWh9T9TpPSQwJv0uWStqOEfN10i4gVmN96pBB8uYK4F78x
         pGe0iPQaFeWYlubEoVYOehojkCtWNlQrbm0/jywkPEkpoQ+aZdOItHAa7fbhyOw5yXT/
         FqItzSQuRZNYKOtCF61wRbCwYiaVckfO4pl3VlD3b14xfFKKlJ/WriAd+m8513GOHa+a
         xuvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769757268; x=1770362068;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kIS7Tv8+p6x2LqhRC/mSoQut0LYtAOWTBCiN5CGoQbo=;
        b=s76j5T8Lzoel/n7yqe8lfAi4xNRcIDRPY0b4nvoR2PrawGHck+aPQs6wG5fC2BoHgW
         IAlBpQ2qsqw7oPvA1JlCpAYRZC2ngSeSDJpyqET42pUBNHbk6x7P4iPHSwx3mZhINHzi
         wUwssurr9a8220pjky9kFYjv4mS5oWUSDuKFMADEmCB1LnsAWAPeUusTp1U+Fn2v5JgD
         xF4b0ItMosJ83C9Ue6s5YvP0ALgD2a1obrjRcrECr3K5DOi8FRMYmfmMGtYyxG6KlShG
         i+Satwej3Ihq38J4Noc3KkfsctWA6WuwLmORGkqfAb3/w1TSHqjLtzQEa+jgF0zNsYov
         rTog==
X-Forwarded-Encrypted: i=1; AJvYcCWAg3IlpcNuhLNjdS8iD7hKVMEQcKU/CkTpIp+zvSqyKXGs8opBG2H4UF0UzzkkO/eBRQSx7VKKElY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN/TMf+Y6Jt9mm5lImtNr4dUuCEKoEJpg7yvBU1R7lUktNxiZw
	5BoGKDILq4bnY0csj7keJD83pgsYjVdz7fsLNpdMYhULZ0ZtFovpi2XGzW+dfqKjwi0=
X-Gm-Gg: AZuq6aINyUtOQ0c505ynP3+QVH9nK3/C/EfSxcVhdFowqhTm/cwCTOHvMRJ1LI1OcHX
	uLdK96pLeLu02es4U3cVC0XuD1/5D/4g6h3afZECpXr0OxUUKbdSP0lGuooiLDOsQfr7Vg4wjMP
	ju55uVO7nJj099wlyMR/FgWNHGLwWUbx4D+cazp5rUzRgnA58cq6SaS+MHtP0w5Qvq2OThCLTn5
	jEpahBhgmnb5gbg9BCQDszDQ3TRFTufD32BgOyNVgfzXUXcwOdTlQUjgbPJVE1SDH6dhbzXlMiU
	og6JX5s5d7FziMfyt9MaXxdl8zCj4O14MZJpoW8E7Uz7zGB8oISUHQ859EIKEgkQtYo46jwNRdi
	XyuD3jYa/2BCGXto3Gxo43w+O100KeY++kLZccV5wrSao+CLKfnXvhkZ4kU5ioL+nzXRhUeFAMh
	cBsaIjKbA2xLO8l6eAFA==
X-Received: by 2002:a05:600c:628d:b0:480:1c75:407c with SMTP id 5b1f17b1804b1-482db4577f3mr20579805e9.2.1769757268039;
        Thu, 29 Jan 2026 23:14:28 -0800 (PST)
Received: from [10.31.13.216] ([82.77.28.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482e04a082dsm8021235e9.3.2026.01.29.23.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 23:14:27 -0800 (PST)
Message-ID: <2d37541e-175e-42ab-a05d-638545a7b7cc@tuxon.dev>
Date: Fri, 30 Jan 2026 09:14:26 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/31] clk: at91: sama7d65: switch system clocks to
 parent_hw and parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <96e09d47cbff0fb4593d642a1151791e20c15c48.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <96e09d47cbff0fb4593d642a1151791e20c15c48.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> From: Ryan Wanner<Ryan.Wanner@microchip.com>
> 
> Switch the system clocks to use parent_hw and parent_data. Having this
> allows the driver to conform to the new clk-system API.
> 
> The parent registration is after the USBCK registration due to one of

Would you please make this a bit clear?

> the system clocks being dependent on USBCK.
> 
> Signed-off-by: Ryan Wanner<Ryan.Wanner@microchip.com>

With the above addressed:

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
