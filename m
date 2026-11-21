Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795266494;
	b=DNHFoRGnGzWQr2V6OBA7+hkIrZBhkakczYfhhCTlKy6uM3Ipi4I/+SSd9hc1uvcLU0iJ
	 s0RKxgGyPJN5K2Ym8xiYo7xolj5ImYsoKvVjDIWjalFh7jwxcqc4F8IIEKaxDV01K9Fma
	 kD+PSx882d+UalUGQizcQQ5pl0yrWfl4Qj/tEahB3AR7q2tFRunoebzvT+GokO4OU11Md
	 Brsu5qnWjAprzxNmOd0vY19vQ6WGDEzK4+7GfztsogAkbNVQsOzPs/sTLQXlQ5+k+sBC1
	 ImzzgSH2q9baFsy3peLwe9kTPvROkC6WU2cToW7hCAljJZxYR8MzRHomz97ySLhzl2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795266494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=aRAzCciCsUrRiJ+1yAcA7cMdA+d9ps59tYubA1kPHnk=;
	b=jP5xni8qRyESbuL/1qdjsUFd91mbQjUHzLbb4GqR9yTvMKY7B0QfJshYrA9Sbgg0S3PF
	 ysuFIMmKauBAgJJQnPGHuimqyL7LBZfxe6DfW5JPpWTZCWOfW6pxHdlBGxGATXeqgg2/T
	 1KUG2hT/G1DcqST4dxH2NnCHEaUVQZWsQfYJbhRGxJddDAPiMd9vHy6hRZ4lJKKHFwPFY
	 4mptkY2k0F/kaZj8r398WIdWds3weLYgP/VxDaxE/B/KT+g1BDPqyGobpfKr4bcLn6oZm
	 wXLemvHzzsBJKE0jVaxOBPyBzC+I8ac/4WnmhVf9WRArCi2u6WCYBUmKZ7dRItYI6WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mi9up7Nj;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECF3606A32A
	for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 13:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ECF3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mi9up7Nj
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so15056725e9.1
        for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 05:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795266493; x=1795871293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aRAzCciCsUrRiJ+1yAcA7cMdA+d9ps59tYubA1kPHnk=;
        b=Mi9up7NjvpRyWzOY8s0o7PJ9oq3lkrxuxfoNnumarCgA4nUizFfFXZxPUIRrdNcD82
         4hQjmpK/hA7CXZ09fxX0NHtcnkVMJFgfv8kJGtzoT27SOgmpe3G747ISiSEPZj7c3cqB
         LZXcEcDDWHH8fiKcsQZ5EkOssnF0b1tUhg6Je3k9Kn0WWU7y2nZ3hh7gzcBUbUnAUbIV
         gfuoHPYCRARbWl8xEqLsbFoMIxw9cciZ1oxXtglEIFYGXfohgSML6AhXpr+vh2Gj2vme
         rHKgcwFj9QFrtjmpFI0tqdcFnkeg+uMpd2wjBlPhS3VjLW4e6Y8VUAccKZr0Bc3Au7tj
         7DgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795266493; x=1795871293;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aRAzCciCsUrRiJ+1yAcA7cMdA+d9ps59tYubA1kPHnk=;
        b=rNj1HiqKb0pniAc6PNjmYPn8aWa74NZvcsvR+M3gOKUf6kXsBlVdY0hwEevMBRYVxv
         1zrODsYcYxaEo+0dIWp+Gm1wCx8N24WlbcQ1AGEndYRADrPDbg4ScehRNI4g9Hw6nwjp
         llfPh9bXv83f3JM3G5Qq7vj+dOp1sB8xkVYoEyCoMUCkjgyLCVOzgCZSwqoIzquV1hBj
         xDTX0BHhrWHbJZbBSfLTicNephjm3W76Nk7itIKqApJdEDRE0ovhqjg6juz4k60lxOSh
         nBZVQFNGcIXPUqZdnxDGDzKOm+tnZy1wg5ucKWAIuhAfe3b98E0orgsPIgR7WgeRs62r
         8WVg==
X-Forwarded-Encrypted: i=1; AL+hErEqLuqb1lB/t378hlGfzOCQxXU9MmO4XuJJasEvphq0lGQUIzA6t9oIB/aAPIINFES/757sUB3fNJU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8o8AsqRGHsRktV0eTrrBPFj9HRKtwfs+d/MiFyf3XVO5cJnEBx
	NxFO0X0oHKZSROHiCpbXY4r73j3dkBxBG5X3Zlz73ARgCTzMIKbgswnD
X-Gm-Gg: AZFdTZfGsHckby+4S9We/ywFjVWaYNStgdlKON0xq+BEvn1+ajBu21gQR8/EkgftDXk
	7kJdpXebeONFqFIOwphaZAYFXfugcUVC+VWnnqMGlH3iQj1l/DrP0wLllbHOc0SOYyWkd/Cza3/
	HqyRNXyNgOkyWSzNJ8MKg+vROkuhKEJbpGUZgwnzuadgRxhMdssUa6qJ+A6p9Yin3X0IBH5wPah
	R9q4ft6nZdY7gt/sMNbqTks/p7PrejO728RTLkttM7pW6vY8K1ERw+x+JD69J7MRQD3zcvfOE+z
	TyGkEYKdC6cfRS4XUH2tHDW0VharT4e7OcHhLGHuW1ifq3OJc7dkZzMwE7HL2uXBEm+QxeiSkKq
	Z0vUXoPnHGJzE8YUcjdHOtHMdkifKfPuppoUrccpDs5ah4FnXFCh3MmJWqzyPmWLpfiuRux4VK8
	j+wXASmv5bWd1/omSn/XRT0JtzC4zl3GQSVD5DVmBettgkCUyoeErDYmh+MfJoV8nNUUV8YSe0I
	Jx2DuHasgZ/CGhM/gUhi+tCv5qHiH9c+EVOW8K5YQiPF1XC78hqNq5zMzxVnExmdL93QFrG52Eh
	puz/BoUruI86DqNFTsMZ9ir6giYZIVUugQ2XVe2mMZLs4OU=
X-Received: by 2002:a05:600c:500c:b0:4bb:82f7:549f with SMTP id 5b1f17b1804b1-4bb8881409bmr148513185e9.19.1795266492771;
        Sat, 21 Nov 2026 05:08:12 -0800 (PST)
Received: from [10.50.139.243] ([23.90.153.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm48512235e9.0.2026.11.21.05.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 05:08:12 -0800 (PST)
Message-ID: <84ee070c-f134-4a78-a92e-0d03d0f0fca5@gmail.com>
Date: Sat, 21 Nov 2026 14:08:11 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] clk: Add gpio-enabled clock driver
To: Jerome Brunet <jbrunet@baylibre.com>,
 Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Jyri Sarha <jsarha@ti.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261015-feature-clock-guard-v9-0-c1c05a498d9a@bruker.com>
 <20261015-feature-clock-guard-v9-2-c1c05a498d9a@bruker.com>
 <179519084929.3795820.7180605641448271689.b4-review@b4>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <179519084929.3795820.7180605641448271689.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.11.2026 17:07, Jerome Brunet wrote:

>> +builtin_platform_driver(gpio_enabled_clk_driver);
> 
> module_platform_driver

Any explanation on that? All other drivers in this file use 
builtin_platform_driver. If you'd like to change that, perhaps it should 
be changed for other clocks as well?

Slava
