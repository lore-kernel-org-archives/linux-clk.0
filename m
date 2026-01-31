Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF7337AA92
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 14:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769869535; cv=none; b=FdgoX0+uyA/Mllai3/y3UU2bICyvvk4SWlVwxu6hZC7M4o16v+DZtgSyJ2t+qim7NHkBzNFPkDq3bDU1uF2wc+fI70CXyYX9Nl2BLVYXVg9t2CJSLK8E7er1Om4diAR6oz2jgKa6YBfXEFDx3NUfS7r6KbnUb9p3x5humAv4cFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769869535; c=relaxed/simple;
	bh=UUTr5Mvx7Ozd+RUj9F94BuJJ2bHzccMuLwCVg2QXhjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nbc27/YJhfI9uJiYYg6JKuRfHs5dYUUwitQZOvZ6dHq+qk5DmCh8RbMX/974kE4VDwGPclGYsDVljZTXdnwaY3wITs3dc87s0nOaU3qELepEhUWnOgVE1n7P6W8WN2z1IHAAx1j39wFcAYvLHDp036bq1YUZD1xaqk6G0l6t8IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=kHzEb5Kj; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="kHzEb5Kj"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47ee0291921so27795905e9.3
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 06:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769869532; x=1770474332; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QPASrS/+kB8QrypRStznqMhoP1hS5CZGPnaCbqEYo5w=;
        b=kHzEb5KjrS15paB/bZx9DBqA7mcNZahiO723eRTPf9zMzC54DYzf94M/skMxXlH5W/
         XeXNP/HkB8pOCGXqV1aL+CzTwtZqCDvKgOMLPD74ZEklsIxtACSrSXke8dwCDQOXzpmU
         8sWkEDi2rDQZskrEBET/BW4sBFf+s6XqgXWTRDsbzlr/zjhr/eoqL+2sIccrVYAWHJCq
         vmf4FA0wjP3M+yz1StLqdiSR9utPm+Wm+zM/b20zydBSAp+ucNfbnCsd+9+CAl33uslC
         KC1bxK8Dc9w8kwatynMybekSfrLuxECVAB2HWnkPLYdvLaIA+IJaH0RfM2LEw16swLPF
         s7Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769869532; x=1770474332;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QPASrS/+kB8QrypRStznqMhoP1hS5CZGPnaCbqEYo5w=;
        b=KADOFGHNsuQzROY/0tVzhVwxL3R98kAuFNeblL4Ap4h1ymUtLiONkIfNvBougsAjs4
         9c5hIDwzc0Uzux7HQC/6+1Q//Bg3toNRKNfWT2RvX7aBnT2smYy593Na2ZZLCImSm3I1
         I4BMszlb1Z16r962K8fLtGGy9mu1hqh1VK9hsRHPAsenUj+QAUVC220aouU8c6VJizQB
         i6SDm1jZ94LCw6oJtlixgPG6JSYiijBEQw9hl2+MMTqI/su1s17lN7ZkCQS4fSujhzXd
         SSGa5pBlXTTB5sRxnLbnukyQIgvR8Jm2iCvEp3I+wU6K/W/DRq4Kbn2i2OKR2QBrom9M
         108A==
X-Forwarded-Encrypted: i=1; AJvYcCWqI5Go6roe4uK4z1klNv/kIzv4kSO/ONSjiRvkSYr0IaZID/gUAk8cMD/+cI4mvxC5x7zkshMIPzc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXc0+/w5MaHAuKAok99RCYcmtXzXWJmI/wYR/73Puh/kb9bM10
	bt3rnYinxO1WKgOwOWLbpqi5hjXi0Bpcfovvyhe8ps+u+DxATJh4v2ced1A98EYGjL8=
X-Gm-Gg: AZuq6aJKUT/zx6OMqc+ji4Pj50+H9iyAgg4HEPCgAKbk9XEXn9RSOoY2CnNaoUy99+C
	OC5Tv+7xDzZIh8q82XMY28o8qrgsaDz8hNjfGa4h8xxP0b2X67LlzB18YWw994FsFFRjVOguvfu
	IPZ9lF1mF59GI6tvBXASyDhZ3lAc0ppe0IASpdXALYbrEw6dqLDvRD5WLRcKerNqB0+uSU0uIug
	RhlNEjkuafzrJ4vMkRYQOu9tckhDT2kT4OryUQSijvsjwFhPF0OvDNcM7cKjIh0qk9Sp3igZxbu
	7n2VZ7hsM8ie2+xk3gHQ1Dr1lVo+aXKQdbpuGjDB/z4zudzvX9iWdhcBcVM6N+6mNfHCdLGhm52
	w6CVwpwOEDwuJrapIzyvwS9YsveyynRDoniFzi2Z921/9bDwkNalYZa1rdoBLife1l3nMqcSorY
	fm0WcHvGKauNudt/25ehkKBCNRYm2C
X-Received: by 2002:a05:600c:c162:b0:480:1b65:b741 with SMTP id 5b1f17b1804b1-482db4ac5bamr71713115e9.15.1769869532253;
        Sat, 31 Jan 2026 06:25:32 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e474csm29359357f8f.2.2026.01.31.06.25.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 06:25:31 -0800 (PST)
Message-ID: <a8e4bb18-46d4-49e0-9787-d2511d6507f5@tuxon.dev>
Date: Sat, 31 Jan 2026 16:25:30 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/31] clk: at91: pmc: add macros for clk_parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <e89c803000d18109357f27bd17a86885652088dc.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <e89c803000d18109357f27bd17a86885652088dc.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/16/26 22:06, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Add helpers to set parent_data objects in platform specific drivers.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: enclose complex macro with parentheses.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

