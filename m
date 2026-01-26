Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A21A25FA05
	for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 08:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769417546; cv=none; b=BA9I8XHDumSBNUIU6bc5AFJWHK39C4SNcXVUkzY8Ouy7Qy9nrA94XJGxdVOQ3Jg6B5nCBMbXCU0YRWSWtjMEz34GbPVHP7/bP9x0bTE7Q+VmwGY7Dfx8XlCE/vpKuUEb2TygpvLCGsqupwya1vRq5AtIuZAm38H+zIWRtQ3oWQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769417546; c=relaxed/simple;
	bh=9RunuDrUgoNNRX1FdGxPBETKHVcpCfisO6pSSw8eZdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OPt714fWlX8v0QJN5PggQxSvpBzAahimZ0lSspHB5EWQLkNRWeC7TCLFR8WiX2c3L9/XOnowLRngZEpUdwRWsL6xsFd2IOevZNigHyxf2pvKo9VJ2YUCJC3mta1VzcGPXC6otQWF9FU9bk2WTC0A01jgN1A6cOMGBBAu7tlr/qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qZUWSc78; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qZUWSc78"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so32199775e9.1
        for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 00:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769417543; x=1770022343; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K1nOQZbLhaI1+7PGCQodbGGrYH7eReTZdiQYyp9qL1g=;
        b=qZUWSc78GiWfbP6iFhehLQ4Lpybrs9sAEC9ha1AXJXp0lwkCQThL/Asu2vHR8w6v1S
         Fl40k0DkWTDEaQr+jJdau84nEhpR8z/eYF1FfmGufPIyafcTPeEp4YfCSJHTnff6LRLV
         OPyE64/ft1ZfveFXz6M1R49famiNwCM6qUosGjvJntZPyyE8lgvklnfZOrKbEkqccFU2
         OtURBVehuKUITeeCgNBpCwRPViDWuE3ZXvYnhzoGR8jq/mgw7kTMEU5kaaglmruOGHvX
         OVwWwEl3NeHWkUUdNKxHKf9JAMiFBO0Noo0t0IBU6R/nvTCTA5F1RH8/KkvwfgYjfU8r
         1ARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769417543; x=1770022343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K1nOQZbLhaI1+7PGCQodbGGrYH7eReTZdiQYyp9qL1g=;
        b=sEDbpyuSuPGU37muiMBke+F9dH3z/778YNW+ICwNPTyP1rwIWTKCw0Dc63r4ShwIl6
         5q+S0gYpMpKjJ7QX4U37VTj1qfBxRN7+K2+bWR5mv+pFqQPMbTHrMZdnzkAoSQwPYvvw
         FtMuEAMO6mTP5E5kDq6V0mKlNU4K4wjXGkLyQl/9CSPFshKizMtR5f+5KEiav/TV7P89
         Of9lU8EvzxUwPI2I7uaGGjgNbDLPlAcw07aPyFBE1JzBmXMOJvhFW4pXsFkNImDng8Ep
         BWo5Gt6LgjPGdcizos/F57TSdflGhgcv4BQ0ReL6PBZFvJlhr9rm6y4wAk8rIyWcHHc4
         hqsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQmty8b8iGCZuqX+BSyYvQphECAlPsptri2HYBOM2jHsixYFTGHXIpm1JwGtTs3jtDaNpGtKA2dwQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw/K7ofeEOZ7LEUjo2M8miUp9dOECgvuG37F7Bq2GpPRaOwTIv
	+/EL1ny4PK6sTLjWVEtxu35GmAkpeKTBewnaQdh0fifNCahRwRyb+MyK8eArGebBsLA=
X-Gm-Gg: AZuq6aLukoHTnG38yKhImXAxMkvlrHlSutktwDcWIQIiBEhhPLRjslZ89O+zQC6H7dv
	y4aGYbLFJyKMV/9K026UXy6pydSWANmpy53WczwdJ6kC9cLNkNxCy23Q77jpcQTSea7ngau/CL0
	HJerH7NzVZdwOWJ5WgaFHGUVxb/WOwRTZ8/3Opj8CcqbEdjzUb4TbB9SZjIGnyE03OhVB/450QU
	VTUygnoCV1v3xzbyzNY2wY/9sXAMFIR1Vm6N9jxYpL/2TO6arIY69dPgaTkg8QjrCaVLXZH3GPB
	p+37El6nlXke1inpHPd8MJFypU8wAg5X7TmtLCzvktoaWWk3iOIAyNAbqlJ4otGCPlmntldK7w2
	qQ8t2BA92eH3T1wZA9SL3o9s4Jr2pVpUUM/kY5LBTmjZJzklc2FEZe1JFP486KE71YjmFBd0Ijx
	g0Sq/s9jRWicZmENiwrA==
X-Received: by 2002:a05:600c:470d:b0:47e:e87b:af8 with SMTP id 5b1f17b1804b1-4805cf66923mr55070855e9.21.1769417543567;
        Mon, 26 Jan 2026 00:52:23 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804dbb6939sm99184245e9.5.2026.01.26.00.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 00:52:23 -0800 (PST)
Message-ID: <02eb0831-8fda-417b-840d-d7b5a87f0692@tuxon.dev>
Date: Mon, 26 Jan 2026 10:52:21 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/31] clk: at91: clk-main: switch to clk parent data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <1cb33a80d61ee10b77800b9a0535a6b289a84d25.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <1cb33a80d61ee10b77800b9a0535a6b289a84d25.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/16/26 22:06, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> 
> Use struct clk_parent_data instead of parent_hw for the main clock.
> So there is less usage of __clk_get_hw() in SoC specific clock drivers and
> simpler conversion of existing SoC specific clock drivers from parent_names to
> modern clk_parent_data structures. This will lead in the end at removing
> __clk_get_hw() in SoC specific drivers
> (that will be solved by subsequent commits).
> 
> Signed-off-by: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip: Add SAMA7D65 and SAM9X75 SoCs to use parent_data.]
> Signed-off-by: Ryan Wanner<Ryan.Wanner@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
