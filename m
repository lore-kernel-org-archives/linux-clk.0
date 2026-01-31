Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5324F31AF31
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 15:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769874283; cv=none; b=gy7FxjADUCjxxv0vslLdEWIGHM1owWboMGyzrLOU/GhL4f0Of54q9nhmGJ2hyC0JJd1ZMkcNY9F61a6LQ6sMSb61lpU+OE2DpGrxu1M3l1gSlH9NfpwWH8NjcrZctpv0zT+g+e0qU2YvhFUHpeg0G38JAwreT5lUqkXhEy/GROA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769874283; c=relaxed/simple;
	bh=nBY0khg7eDIIEFuS851zCdi1pnGyvEFTJ2BB69fUoXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NCICRT+LWiZmcAAJZ5VU/40jrXdzG/bvtgYtWMSRZs48XpL++4p67KF6WIAOWNJzX5za4Gf2TT7jcKt0xowSe4MernEMcCoElSzdYmN9Zcjf5G7xjUtw7cC3YpVFTkGlTthc20rojkXXbyKzlxPmH8nZvZkrx6Gyaap1zgN91sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=nhexhr5g; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="nhexhr5g"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4359a302794so2128790f8f.1
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 07:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769874281; x=1770479081; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+pcVTF1IQloSPNuQJZHZDQB+v1xgBL61dkGZAU2ZjyA=;
        b=nhexhr5gwc3d9OqMZL7f4SE2MOMNCBG8opuSR6O0K1W11qj0LOBrgOlD9UikJooSPC
         JlgHO3j1Vnxr1DXFuxqEyleEJuBNdbSY03Wx4Foc85wLTLObiK6ybgRCP5hdaq90ddLs
         dDnakupzqjANiTymTuE+cOT9WWIQRC6ElrugoNwawy7nX/tN2gIVjUm5vNqlf27M3hF7
         tCE/bM2/9ny7W6RJEtv545dV+voIWSp1AXebzi75SHsfTmjXURH5hCoTLgYv7whM0oBp
         no0twN7H98EpksfLjvA+JfoEeRFTsl/243Za2XMX9db0wgheyRAwXtfrciCQmDhpnCvO
         YJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769874281; x=1770479081;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+pcVTF1IQloSPNuQJZHZDQB+v1xgBL61dkGZAU2ZjyA=;
        b=hh4gT67U/TXrcv8vG3rcocEi1Y+o0BCo+5y+3+RPjuNMUzJhUA0/0BIdiEO5Rfx+P/
         H6lI8wZ70l5eJQiL0kgsNhD1qoBeP0j8sW0EaxdxrCwbYq89OtOH3kmD0ipB5gyJUWVk
         loO6zPjjCWVZNEt89jjImTakt4zn0/nPrKwc11aUtHKEduAyIp19+fkVpGgo3JEvV1yF
         vDFR8vTNWP0pgtWra3YMp9iFU7XzMBwNnprd4Z0+/whS5za187Biko1zpNwgFifFrrdf
         /JpGYqT9iYIgnNGKaAoLiQhUpg2s8jElz35VAcST2oLnG1ZqKDapRQ9HJgXmxDnBLuvT
         bV+w==
X-Forwarded-Encrypted: i=1; AJvYcCUiN0c/WxAW1PA+i4ybVPngOjGIKSieJz1PlvHbW7Rf8hwMAZY37Gb2Wm0nlwSNnB9ZELo4g4zh0oA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBsqSfg8ablnmeMleb9qvWSdhNEYX4s08cledmBmjNP58J1U+y
	iOLcTkIIuyeZb9WMKVcJolvfjbPSVcn3fN56O45eTHyc/oUuivxhzyb5cXPJ0bku1W4=
X-Gm-Gg: AZuq6aKgMsXjrAHi0k6SNcNXRkQIy+0LBbCKcWyguKRTBdxVZmkc4d5R8wXv0RyigcE
	UZTj0SfWKoub+uR1tkUIwZtJu3xUX4f25N9aMqIz/u+Z2GtlnSwpLSdMHyjM0CYh0CtzRAAZos4
	BvK4B27dwJ63kki9Io/NJCwU+Gx6H36R4fHwqXMXMaz9knmR+y2lWnoo+knozbez2WTYmTijkY/
	mdAa/29qMTAm2a0UROPaoTLWHlClO8BAcmTOrXrZsaN8CdgNmPK/Pf4bmK5LpbvsjisQp19VJuA
	27mrRHiMCFe0TFuEwhn/2XCT2NsLvT9B4AfHXSaBq4pzruJ7ynpo+3sx8bo2FVCyVjciMYsq5Tk
	W65lalAZLB3wUo916Oa7pKIY/bZ6wTy1qUC+6rBJB1tlHCwn9ZyMGMcqfueRAtH4NxXX4hbbyod
	QGhhCHr9/bzZbyTGmOAX8tcgSiSu9N
X-Received: by 2002:a05:6000:184b:b0:435:8d02:b9d2 with SMTP id ffacd0b85a97d-435f3ad1f8cmr8775581f8f.60.1769874280664;
        Sat, 31 Jan 2026 07:44:40 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10edfe7sm30019606f8f.14.2026.01.31.07.44.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 07:44:40 -0800 (PST)
Message-ID: <1665d5bb-e978-4a46-a9e8-8522d54a2a03@tuxon.dev>
Date: Sat, 31 Jan 2026 17:44:38 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/19] clk: at91: Use new PMC bindings
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Cristian Birsan <cristian.birsan@microchip.com>,
 Varshini Rajendran <varshini.rajendran@microchip.com>,
 Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120143759.904013-5-ada@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260120143759.904013-5-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/20/26 16:37, Alexander Dahl wrote:
> The bindings were split up per SoC before adding new array members for
> missing clocks.

Please adjust the patch description to follow the submitting patches document: 
https://www.kernel.org/doc/html/v6.13/process/submitting-patches.html#describe-your-changes

> 
> Signed-off-by: Alexander Dahl <ada@thorsis.com>

The rest LGTM.
