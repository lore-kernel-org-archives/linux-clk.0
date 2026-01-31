Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F258F25D216
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 10:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769856712; cv=none; b=HEK7SyHKd0oOxryjcZzlWJGXdRhEWw+0eZYB7sPbiPhiHcXqVG7BVlrEfncdmPucr2aYou3EyMKAIW9g88Zd1WTmavM52LT/1X8ri9fzvgsbsbSwNNQzHQ8BNg2lErFIPypWn//sSzs1AFypQ7zB/uZ9pWNzxyIz/H9E6WkYszU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769856712; c=relaxed/simple;
	bh=wr0iNVEgdAubuUForRCZZmsz1vYS0MO3YSvrvAWNz3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CQlM5STNqT2fKzU2Cg+ZU88Ly+xNrqDAdl3+gNqCOablr6Wd6kYs90WpqVNyrcmfM6Eg2GTj6k0Q59vpvxKVKMDUmawY+uogy00h7hgwfckqEs2e/kRVcSQEm44meM0ulmIwx5HNIevEGI2sv9l6fReDwE5/5DMEK7OBjqF3D0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=LsHkiJ32; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="LsHkiJ32"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42fbc544b09so2784523f8f.1
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 02:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769856707; x=1770461507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N7ibsvz4bEM1wIwnnEWOnDPfVWQDx0wQWoIiGXA6bYc=;
        b=LsHkiJ324C/VmjIM3OA7Av2jI0mBE4b+nBeeWzNH8yY4UGzyAp+ghOlQ9Qw/ZQOy/Z
         YG2VICeqaJR6wrYh77eTAF4+TwOr+pG/M8CP0d9zzoZGMoSzMumZy2LARvNj0bIryEFP
         gQr26F+eHWwy/q5pmcKlhf8kTYR91na/GemG7Cg8NhOvqOiCEXiT4VGSSqEZ3/WtbTrM
         ytQ5BaeTRYKjpGztH+mSFdQyJ2vAcI8uZWB51b+rPnxd3+0jBeV91ZHPLjUzBJs+TKuw
         kLnB95/WcirG8IDzEtJMpygpEdgtVucRKxYp2YtWeBW4L0bS4a/bKrDA1Ja7G6b9ftLn
         XwWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769856707; x=1770461507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N7ibsvz4bEM1wIwnnEWOnDPfVWQDx0wQWoIiGXA6bYc=;
        b=XPd47s0uPrWedO1inB0x5MbiYpfLwylH/GGJi/fTjpZ9U0nNCD9yaOPfnNxvRivnkv
         v37yiLJwLQYGjBPWyzQ9JqAHHCi6AJxzds2wkxEWfCHrWxJyvYGIvbkCp2WnBK1pEvgY
         9MzUr72MvMsVV7+GaEj7XPdXLKd1JGNIVLxt0pAHURpoTIALN8wB80Vn1/C9sQ9+pWd9
         u20CKmJFXoBfsS1c4oTu4TauK7uewLuZBNlZZIOPTSQdslOqVIQ8alQo4uVeMQOoiNcY
         IMo4uEdI/VtyrMU4EodSs71Su1ASPSWVqhXO6G9V6s5Kdx8AwUUyGb5Ft6q9cv/2P0hN
         Edbg==
X-Forwarded-Encrypted: i=1; AJvYcCXEpPoGAvosV/kS3dCESNEqoboTcOQjojW7VtXrkZS7qKfpgcKNh6QQfRb2RAsuUnxjrx7j3icS/xU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGKHUgGYSooyp6fmn2AWZ30vBJra/orrka/IKp1qwBD059YBEI
	2ntbq6jgb/SylOBU5ftNsocmB8f1RW2gT798pfKHBHKZ1cpRc55bBXy/WBl2QHtdhXA=
X-Gm-Gg: AZuq6aIwQE8VgjXbMSffBvfa4XarZzkI1QIcM/QxH8J8X88Yquxg8EZhDA/m5jP1WLj
	zzAKnMzQfCFRLZh3y+JAVrweF5Q7NJuOu/zuSHT/BQeGt/0hUUE+4eyMXM9IbtWqwxM1YjBpgwx
	cGGqIT4ONtnSeBgfyPE39A0C5qRjVTRz1wsqblQBXmxV3RflWC5s8NeBEMACZhXMFm/lzVDY4S5
	wc0sKtWy3DwdBJ0JD4ulWJ5CUXu1oEdLSVoweQlVvwgZZC/aqJIPdlkWA+pkGmRo0nIKifct66E
	ZNGy2dXfqNQscVdfwev1DSmF9FUsF8+xOtDV0+vwPzn450SoszqECpX7J0jUisNU6KvTZq2hh7v
	wGw9hnQIeoFVityCj8ttwQrem3o5iXPBPFUVRCeXXwwdX7TAvPLE7wfj3xhYBaE6FmJQniVmsjA
	l7YzbUgyvE5NMzx2mkh20JpzhGM78ZV9Pz6uM=
X-Received: by 2002:a05:6000:2887:b0:435:9950:ee1 with SMTP id ffacd0b85a97d-435f3a62ee4mr7418313f8f.3.1769856706636;
        Sat, 31 Jan 2026 02:51:46 -0800 (PST)
Received: from [10.100.159.246] ([213.233.108.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10edfccsm27625501f8f.17.2026.01.31.02.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 02:51:46 -0800 (PST)
Message-ID: <49022192-04b9-4ed8-baeb-706edb6e1322@tuxon.dev>
Date: Sat, 31 Jan 2026 12:51:41 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 16/31] clk: at91: clk-plldiv: add support for
 parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <ec232782a91db7a345deea48785bfe3ca35d60f0.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <ec232782a91db7a345deea48785bfe3ca35d60f0.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> 
> Add support for parent_data in plldiv clock driver.

I would replace the following:

> With this parent-child relation is described with pointers rather
> than strings making registration a bit faster.

with something like what you have used in patch 13/31:

"Having this allows the driver to conform to the new clk-system API."

As with parent_data you could describe the parent-child relationship with either 
struct clk_hw pointers, clk names, indexes...

Valid for the rest of the patches that uses the same description.

> 
> All the SoC based drivers that rely on clk-plldiv were adapted
> to the new API change. The switch itself for SoCs will be done
> in subsequent patches.
> 
> Signed-off-by: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner<Ryan.Wanner@microchip.com>

With those addressed:

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
