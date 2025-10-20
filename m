Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8A32D23A3
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 19:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760987866; cv=none; b=CcCXrXskHRiP68ffKf45b7YNpntIbtD/twpJjB5iZFNC5cf4N3L4ueXwGJpMsXRIt6uIuwTr1JJ60dnsfeCLmpsLLYOxFYlPQTjwTiF3/7KVcbQgXPyo5zjrq/hkg+rkSxNcnGkbJnsHzCMWEgfJsq9Y0eYlV0zneXO3xqOp3x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760987866; c=relaxed/simple;
	bh=rwe67KlzgVEU0q6posof/Uf1LS61e3v2dpbkz+mjDGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fMdjSeqhkkYsGFyjmJqMxgTpGB2M2yIcSnhyItLwwqFmWm7FIKHozv0Tz2fPGwaO4dhxFVb/nn3jcKds71PG2oFpbI01aSX8kYeOWkrb/3V6eK0xUmipTQjDIx6ug9jlcAxxJOk19DR/I0lJJ8ER3m+3m8cNQ2u6InaxRaTu5yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=cXBMjwhh; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="cXBMjwhh"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4282fba734bso1114159f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 12:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760987862; x=1761592662; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R3hw419kHIanWXI8S7q/r2sYT6jc1swylj0x7Y5Ea4A=;
        b=cXBMjwhhJiK6yHo9TUOFPB5y+KOfGdmBos68jAXLctZrNS0xOTP+waqLRT+/56sIaZ
         4tIg4AR8zswgHSOxaIGYCctSqGb7/McigfRwAmLjyrqp84P7+GfL8YIZjM80UAH8jY5C
         bFlehrNsu00ry18LRzzU3cTbbY8/wNyRkayMGd15ffVTVFpuk5RnFr1TcGdPTLAd7YmI
         C4pS5EcbeQIGA3UgJ9tSGUvBpDVL5pK5w+0VRZTwMJPL+DAN7Y2h8sX2qxZKgpMMKa+8
         4UtLVI8Re7CClNQp8gy6dP1Ab5Lv5NpVbh+mVUIJesuZ6UcM2l5heo9b4krWuJunjX3Z
         PhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760987862; x=1761592662;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R3hw419kHIanWXI8S7q/r2sYT6jc1swylj0x7Y5Ea4A=;
        b=FdrCJRBzxt/AFNYxMzpvnJ/B+mHuwoQ48T1sBWz6t9G8fY+1cw3Yp91GKSpJGrq4rc
         PNZ508XNRc4VT2y4APMeqOLnmiQODzODdfvnnJiOtIqK6cVp67anpAkLOSWzYZuSYdqC
         czkkB3po/TN4Y41/G8PN7xVEjsVwYbgHix0q0vlRXqEkMk4N1GtwBWon0abiN4RdUDVZ
         Mo9TBSf0IyBwuatr2qQl3+863ToNSLJSMT29mOrVRBfThbVYPC5tJ4TaBSFkhpQ0lIRc
         bB077QKwZbKKFz4IlNnXYxbeu5iEOu03KY6orHRXImRTkz952CUY0oXqoV5MFTZ4rwWV
         9N3Q==
X-Gm-Message-State: AOJu0YzDG0yiAw8S4HQnEhXQ5HrlknFaOyRPmIti9SpvZW6L+V7osYz9
	woriyjj0uudlrfvBZP1OsCCXrBkjUZLSdIl7vBr252o2dYSKUhsqmSZo2gG9V7KzI8Y=
X-Gm-Gg: ASbGnctbp45ZgzuvQSI7UsrYqz2Jz37WxfB3bhgPWIXWHB6+SU4+Blwnzec1twgKc5j
	2JzAtW7oG/Gu/p+JLKfkxe4ebEfQraSV27LyURtUL4Jav4EzymC7ZG+aYr7qEQGw/fGsmkghj+n
	iTmCf5IbMHsVAPAaxHgWwZpVvb1IXOpfLISL7kcDhS+/AVjHEM1Bei1zNKEnTLHrRjSp2CWk0mI
	9i4rwoMgGZ3v5Hajr5Soq/5B+BGapePWWpOqAMYJweJdw6GwSieMvDuW2zZok5JYaow8Dq/d9WD
	+w2EsAJAFbdnHP7JYKgMQNz220uWMeZdnB+nlpWjinT/uZ9fUkf4HKmLzI+mEiO3TC0EkQNCxEq
	+YtYM+2Echc/qU4y167OEglP6bKN2Nr5KKqdX70lffZ8lCZeyd8Fc0Dx019nJ/ufLU5o9LFChwd
	4km9H/DSIop0e4jhcP9Gk=
X-Google-Smtp-Source: AGHT+IGK6tHTgvB0+6Qz+f3/Hvkcp/D3IAI05W/uCv4j1nGOxIb4P88xZ43wqUbIHoY/frZXUcKPpg==
X-Received: by 2002:a05:6000:25e1:b0:427:580:99a7 with SMTP id ffacd0b85a97d-42705809a1emr8127287f8f.59.1760987861989;
        Mon, 20 Oct 2025 12:17:41 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00ba070sm16797899f8f.42.2025.10.20.12.17.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:17:40 -0700 (PDT)
Message-ID: <ebe90c15-bb39-45a9-9016-e5ec864e549d@tuxon.dev>
Date: Mon, 20 Oct 2025 22:17:39 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 20/31] clk: at91: clk-slow: add support for parent_hw
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <ba17012ff9130fa50954163a07c9dd6245b66e21.1758226719.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <ba17012ff9130fa50954163a07c9dd6245b66e21.1758226719.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/19/25 00:16, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Add support for parent_hw in slow clock drivers. With this parent-child

s/parent_hw/parent_data

> relation is described with pointers rather than strings making
> registration a bit faster.
> 
> All the SoC based drivers that rely on clk-slow were adapted
> to the new API change. The switch itself for SoCs will be done
> in subsequent patches.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
