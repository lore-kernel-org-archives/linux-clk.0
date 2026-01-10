Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF956339B3D
	for <linux-clk@vger.kernel.org>; Sat, 10 Jan 2026 14:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768057185; cv=none; b=gLbZpbgJKZr/le/rZmK7aN54EkDghdYWp0eI97xSL1QDtBRs+wC/sk5EdGKfjJmiAfm2m6nlZXfbl5oRzBaCOEkX5tTGwRiJKFWuc7ioSfmuIhaexuinctZdq5trO2weI7WSwK70tsMreNTwkOY9KvIR0kq7GOHALt6vi6IKtQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768057185; c=relaxed/simple;
	bh=Jqgy1IXF0Q4rKBBQ0+4eAt2wRe0v5i5JpgcYk2Crzm8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tMm1QwJx3VzVer7wbr+OcsNwxgzD7bA0jncjypq28JAhDiBHUZwEsUvj8Dq1Vd8e/wO6xQujDaUA2vsPJwyjaS+nC1GYwtKV/FuIVJYAs7BU/QvvZoO+8DH3fblN3LkxQ2aTM9Ff3CMrelWRwCQh2itWa6q61/8MD8XGL6zRk+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=jeVUI/pc; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="jeVUI/pc"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-432d2670932so1735517f8f.2
        for <linux-clk@vger.kernel.org>; Sat, 10 Jan 2026 06:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768057182; x=1768661982; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I9ieHs//1181ugE50jNQnqsW76Rg38tPU069b0hhiN0=;
        b=jeVUI/pc4D48L4NlrTOH2ONa3+X/0snxiSnNC5nRCKHjC/auFVOg4QG1cXb2fwM5dO
         YTu7JggzGZT11W/l3SJmCtne2bcKJRsC0Ix3dtzGhEHVpaqL/0L3xJxxCPj2O/5u6IRG
         Dvptk6OH1kmMuTqqL5RKCj9XITPjGfaTNiQVNfNIXJfhTsdUPikmnX0dPnMmfYhJkMF9
         5zuT/gRnHfw8I7vuWtZ4l6sZGJt67BNHdL29ry45Lf8qTFLvidQEajlOAQ8loQVgFTPs
         wc3NVVF96gVnzVG+SUoBU9O0qyaQf0jW5dHm+qQ5pqpdFPz/i/Xy1+9NMZnTezsnW37v
         wgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768057182; x=1768661982;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I9ieHs//1181ugE50jNQnqsW76Rg38tPU069b0hhiN0=;
        b=Zzmo+dSd99T5Bjn6+7QjRveabXYamJuoojQ4waSe1GGd16lVroQXuVtIQZVHTKSMUa
         w362d70UlydqNrkiyCYccgOcm35+7QmiFpTL1cVbx8prZv3v3g22CYKLf21AU2WcYkJ0
         E1/XQ0C0SFsekk2cmELlOrjCIXvo7iByNwu56P4amQGr6TuJaedzKL9Rr0XVL8PS4Isi
         Ogsq4qDmy8djEZmXkhDk3tLMQtHjImTTcPKUsGzAkwrB/PSvyhe69ITXlHBeWd2X4wWR
         V3nKsv43gEa+T3cMP4IEAB+7LJJ8KcMI3l8p029FInOX2/G3Vp51vB5yj/BK/gjwTDNq
         YrVA==
X-Gm-Message-State: AOJu0YwZfAJxoidRc80W6t0GJWMy7K6Y2edqWZQmNZCitoMohQC5UbTs
	jpsc6hk28bH25xGtUOGILV0+/yIKs91FG2OU2CnwZW+HdzCILPsEWeaaKcHsKgh4DGw=
X-Gm-Gg: AY/fxX69FYXnKvjSDtDEsiLcEI2C2YEerrKJcwteKWaiTSDqBQ2mopA63OXuQfXvFCn
	0JIpa5UTRRqd/2i3cgCf6lx/9syOlkTsAPefHPPoGQdJQtxSMmPXkRsI6Vflgap0q1kPmu7x+aH
	WIFE3dTgjt57dCErCF8wAuI9xy32iDDolIPdzQtCNWVmTQZdBAbDh8zJhV8L2x8Hbyt+UJ8p2Be
	QcAJEcqVOSVKgJ0hDz97SzG4mAgViZqH0igE7gtJE35HrXzl+K0+io5T0obwfOx11IMXg2P0nMJ
	xqXY/yun2pVKD+hxXEBsVN9cV18gCg6P06ntvqBGW4QzGYJuOzBjbRqHC99XwWkvUZRf/zj1v9t
	91nq8/u6z7w7C+NrgAIfXR9uNIP6jMfFSJsJc2eYf01/3Y2IJ7FrwI/MFJJsbs0DkXN4+5Nunhx
	V7ja2tgk5Bc/Aar6mD6g==
X-Google-Smtp-Source: AGHT+IFDcBSQg6Ek8ErtvM5azLc+7xSaY3SW65kbf+7eTKxC3Ac3BnoMYnb7erJ+kxt79LyXU3MULA==
X-Received: by 2002:a05:6000:2289:b0:430:b100:f591 with SMTP id ffacd0b85a97d-432c3794e96mr16287338f8f.28.1768057182127;
        Sat, 10 Jan 2026 06:59:42 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm28575913f8f.43.2026.01.10.06.59.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jan 2026 06:59:41 -0800 (PST)
Message-ID: <205b289a-925e-42e5-9e4d-14873d157dc0@tuxon.dev>
Date: Sat, 10 Jan 2026 16:59:39 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] clk: microchip: core: fix issue with round_rate
 conversion and allow compile test
To: Brian Masney <bmasney@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Conor Dooley <conor@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20251205-clk-microchip-fixes-v3-0-a02190705e47@redhat.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251205-clk-microchip-fixes-v3-0-a02190705e47@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/5/25 21:46, Brian Masney wrote:
> Brian Masney (4):
>        clk: microchip: core: remove duplicate determine_rate on pic32_sclk_ops
>        clk: microchip: core: correct return value on *_get_parent()
>        clk: microchip: core: remove unused include asm/traps.h

Applied to clk-microchip, thanks!
