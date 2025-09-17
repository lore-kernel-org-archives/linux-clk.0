Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E6C25EFBE
	for <linux-clk@vger.kernel.org>; Wed, 17 Sep 2025 06:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758091801; cv=none; b=XoAaxiQW0bwPANu0y3XMojIVSo6vHntgqihpcQhELz/X8xWeq7BIwOBaS3k0VuuwGQ7e7YKOxblXhLZPvJGOpAWsWQawJiN7+t8FK6Z1jGJRlzXverDpbuOPclJrd7dpWP3BgksjlpzOj6glzoSS56IICrLp24v5Vj6UXVyGTew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758091801; c=relaxed/simple;
	bh=i8tNuAeCQ29SwLEzEbOdCknl5LH6FMHRPqBRsuyT904=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=etwFXm1e8U26Vmh8fkoVKGUkbdi8izp7rNoR5Se5AWHYRu3D66fVx1mOgqIW5MleEnX6r5GLuLDTUHQoLXBRGoiLLbX0iC28/rvGX5atoTtlsT7znGoBY3r35798RG2C9fZ8kW2nhK0NbN/v9z5fiZ83b0DBKwtIzpSMYHLqJ1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=BSImQFk3; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="BSImQFk3"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45b9814efbcso3518725e9.0
        for <linux-clk@vger.kernel.org>; Tue, 16 Sep 2025 23:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1758091797; x=1758696597; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IVMvvCgA6ljcoCpqlgL1xSnREs4/fST5OPFbRQTwtdA=;
        b=BSImQFk3kWE04UJ4wNGxhZgIgqBFu8H7evpNITOiR+XEr52bK5A3XTajF0BKcnE0/a
         vrnlDgnmTBtG067MZ5524Is6T+wqQA1+F7WbSboe+v6lXEb4fdrMcITV98ED0bTbL8gj
         ibqAXPWjuL/OMe6r7miOwjsmzLOYITjbfBVhljtQCUDx6FhcCFB7KF++1+7bA99NkBLC
         HqwHYLmiSQpKC23w0WfzZtRHaUtq2VSjmtFKLxbH9c3vRv5mKOikfycELPCxOY2x9wBW
         NBozMBU0//nbx8k69bHcnv6YfKMe5rRRajxdj09408x8Xthzyy2YVWQYVQs157zBsNUb
         e/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758091797; x=1758696597;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IVMvvCgA6ljcoCpqlgL1xSnREs4/fST5OPFbRQTwtdA=;
        b=M49sOxV47AZdO1pqKHhsrcdvJnHAeSO3huNW0jdLflgyT632Mkl9kJ5O2F5gBlhhAv
         tjEVJm4na4u9IF9MVc7AP7VJeRAt/XXuQPjjkrrNGtPLx27KHQD8YVvBrJSb0KHoyeaU
         UkF9Je3IDj+1tq5xL/p+ec+G5ErCuyR2UNGPsOYqv+TZVXabL5onvDroyoYcN/KZfc9u
         k9p5/rr53H09TfyDjnAtqXcXazjbQ9mzxHpy+pw6nlsvnBTuywKEF5jFBhT4GLabJ80X
         C4exf7kWsolYbgmSUqw/BXfrMnZbo7ZCtE+BCN6qDqpHCuQ61P8dphTehIMkgzwLBTUP
         a19w==
X-Forwarded-Encrypted: i=1; AJvYcCUwzmu2Fyvqf97VxvDznV2t2JfYUa4xZOD2LS5/E/V8KuP+0NRiefymoueh2lzYnTi3YcXxGCJ8wy0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGignp1+09t6NzQc1I5GEKUg37ggQ98DcsI0uwYqFadtAnGUZT
	N/e4X/8pZ/9nKw66X0qbgAwJlJuOGwOqRP1W4FVX2ynmaeETMnlNSXr30E+eY3EKI8Y=
X-Gm-Gg: ASbGnct44MaPfRpowTNWMe8DMbusZrHDDRB8c1KIvWOVcWXaTFsPGZzVrXvYt+xu9BC
	IBFxeByPOndTqLcwWQYggFiRXATgvh45LkypMLwnjfGFJDsMFhjFTNPd3zXIRlfzTgyK0zaWNgD
	IsowkixQkKYt3B6JdD+LkCPBCF60kG5FT2lZVcoS0MvqzfhLuJCSMsLdpSryi3GslzeZQZOU6u8
	z7nzkJgME3sMX8tBJ9R0v/L2j/h42SbBYSz4oQ1lGKDBgA558GslXNshViQchcoFX9500FhP/6A
	GJ5WLRYI3UJlF/TmDxLHVjxTLiQMZhMh+wto4uJ2q5COrtlfYhF2aPN+Q+DSzEfN/ldxd3LF0c4
	xPJnJgbb5/CDkWqcwx3OD3mLsBXvvkvc=
X-Google-Smtp-Source: AGHT+IEVFBb8u1kVGqedyodsw2F2aUQecKI0dQqbLqdRcPRySNRrawE71TWdhxxTWe9V1uTknu0h/Q==
X-Received: by 2002:a05:600c:1d25:b0:45d:dc6c:9e30 with SMTP id 5b1f17b1804b1-461f94ae963mr9866535e9.14.1758091797412;
        Tue, 16 Sep 2025 23:49:57 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-462d525fdb2sm983345e9.13.2025.09.16.23.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 23:49:56 -0700 (PDT)
Message-ID: <d2c1d736-689b-452d-8031-2cf76288dca1@tuxon.dev>
Date: Wed, 17 Sep 2025 09:49:55 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/32] clk: at91: clk-master: use clk_parent_data
To: Ryan Wanner <ryan.wanner@microchip.com>, mturquette@baylibre.com,
 sboyd@kernel.org, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <4b404eaaab4062464a4142e95aaa76d5cba866f0.1752176711.git.Ryan.Wanner@microchip.com>
 <95e19f49-d0df-4d3f-bd7d-8b58b60f1f7a@tuxon.dev>
 <61cfc570-6632-4e14-9e2b-2bd5d2ce1690@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <61cfc570-6632-4e14-9e2b-2bd5d2ce1690@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/16/25 20:35, Ryan Wanner wrote:
>>>       td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
>>> -     md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
>>> +     md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, md_slck_name));
>> Please use:
>>
>> i = of_property_match_string(np, "clock-names", "md_slck");
>> if (i < 0)
>>     return;
>>
>> md_slck_name = of_clk_get_parent_name(np, i);
>>
>> Same sama7d65, sama7g5.
> For these SoCs the clk_hw struct is still needed since it is used later
> in the driver and not changed until a subsquent patch later in this
> series. Would it be better to hold this change untill then?

OK for me!

Thank you,
Claudiu
