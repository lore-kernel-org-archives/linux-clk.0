Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C909F262D33
	for <linux-clk@vger.kernel.org>; Mon, 24 Feb 2025 16:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740414017; cv=none; b=JNCuldNRL3kGJrKXIaBUCvcYxTMP5n3RYj1NDVkjAFVy86c1JiKR0gF3XoDtcT6XzilLrc/298uUnBmzfcBL/1raqS0sP/ySE4KYltt8Azzi1LZgK97j9aL9FNlZ+7cJXbI5O3pF09VbqEloTppj8jZuuGF7uJHjcTMuzyN5koQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740414017; c=relaxed/simple;
	bh=R5v6YkbR2bjn50laEMUSMIkldHPgeN3Nn5C5qQxsC4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d0UIUy3CbDDRccd2AQ6z8AVHK491U2LbaV+ndKGnm8fot+O2k6uN1Xzt/xkunHayVd9072eqABA/KBHCX5HPzBgO16OrNIL/lUjeVMmWs9IgXw21kT+mgciPjyE184HaIEl/bI0s2L7GZ8uVoqIp8/8Z0I5eupDy5Hh+OzWGqCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=haOdQ4a/; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="haOdQ4a/"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7273f35b201so2451884a34.1
        for <linux-clk@vger.kernel.org>; Mon, 24 Feb 2025 08:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1740414014; x=1741018814; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eOHYLBWiYUxKQTat7RFgoLjOJELf3Cnpr9Bivlggoe0=;
        b=haOdQ4a/rlL2TQdmNIW0FYKISrlpw94EqxCX3uZ/R8IM/pw/l2dyCZ2Q2pNfjNLOSy
         sl322ESNArKVHzngL76wXDklKcDv2qhU5r1554HxoHU6Y4vX6N5/HmN7B7S7a/smrkhX
         PG0DUZuYdGXYiumrgaOBrJ1ZshTsbuI+E5GkOdQ8dK96hpc7kRSNM9CEOvmYzDMUwkd/
         6GJ/0bSDVEkbyzE0cntnE6YgHtwHJFF6kRKPw95MITHd3kGTaPT+0AYVgbjqSb806ILl
         kXPrVTKow5p2DULbPIgdJitKpKpdMGgo+sgwDAmNUr9uSVenhdPiQ6ydNh7zzGGaVr9D
         eXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740414014; x=1741018814;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eOHYLBWiYUxKQTat7RFgoLjOJELf3Cnpr9Bivlggoe0=;
        b=C8QKqFl24w9kmwopd/EAr4lzTPwLCXrDR48iSn5LYKWJUYmh15inR8YFUzX39IaZGQ
         5qj/+IfcX6KtSHPcF/7AHFFFMKiDh9tqnEFnvdXf12CRw7UASdiRj6PSNWSm96HcO6xP
         uKsTNhCiDtjDALjGJ4k0n/BT7LNaQyPFqUWGtRx46oBD1Kp9lr2+lPJ0Ny1CzTzwcZ70
         G0Bl2Fb0CxNCLY5FkvOdJHPaRTifqX+ZZ9WAOrNbBS0HB0d0Ju9pLmgwPKssQMf2jcQN
         5bdy2zaMz2Mc4AYE20YznkqWAeNMyZciwd+MFRnSNBakbJGFAceDiaW2vjPeF+vhRpIV
         +98w==
X-Forwarded-Encrypted: i=1; AJvYcCXf6euvtec94cowDbqBOPHhKAzVUzRRyDXmP23YYZuIvrS28ATHUfy6lGDjQ52uZ3fbqLid9ubYjvg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIdfLxuuuuE+zTRULfQgrLovDzxmTpJOBELpmqnImaFhu1KzHh
	J8amzh9iT04KXEd+O9fw4pEAO3OrYXfQiZ+t8EzauwDr3oqetiv4x55kPujTGhE=
X-Gm-Gg: ASbGncvZEjIiAkDPaCP4VlvYu12WAvGtIvv/M4O+YN5q3RA6cOsiVdt0gN8OS29EjWk
	q5Zlwi8/l11aD97p+Ghdv60g9asS/I47uJZwOzOf9Vk6n6vmae+/54/lbmr3ETGeP1td/tStluy
	VN0D89MxgdWyvtNKB7wysryEzWl3kJUHfxymJq4K1Me5V16yHt74quldn/ubWn5YgB6w0s5y7dY
	PdkAqqRfspfcC1MevxcKzaYWoXqDhonrk9fLIOaSudWsPin/c5I1u7E2J/OrKwPxocHL9L2Jr9N
	aCaggATzORpta1HbZWHsQW9NktOF9e5eEzlYFfS2X9bg9LsIX5RjUYHqBDH0ClT9Yw==
X-Google-Smtp-Source: AGHT+IHSwDG2ie/f4N9Ahbr7XlPERMnwlDlbUwaJ7is0FQ2FtRKqXqhYc8M1ZvWovuYYQTgGyn3vKA==
X-Received: by 2002:a05:6830:71a2:b0:71f:c1df:121e with SMTP id 46e09a7af769-7274c1a1a0dmr13046254a34.8.1740414013917;
        Mon, 24 Feb 2025 08:20:13 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-727378237e4sm2656892a34.47.2025.02.24.08.20.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 08:20:13 -0800 (PST)
Message-ID: <1efee202-7b25-4d4a-b9a4-9fb5bdeaf542@riscstar.com>
Date: Mon, 24 Feb 2025 10:20:12 -0600
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/5] clk: bcm: kona: Add support for bus clocks
To: Artur Weber <aweber.kernel@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, Stanislav Jakubek
 <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250216-kona-bus-clock-v1-0-e8779d77a6f2@gmail.com>
 <20250216-kona-bus-clock-v1-2-e8779d77a6f2@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250216-kona-bus-clock-v1-2-e8779d77a6f2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/16/25 10:12 AM, Artur Weber wrote:
> Introduce support for bus clocks into the Broadcom Kona common clock
> driver. Most of these functions have been adapted from their peripheral
> clock counterparts, as they are nearly identical (bus clocks are just
> much more limited in terms of allowed operations).
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>

Seems like this was easy to add.  This looks good to me.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/clk/bcm/clk-kona-setup.c | 116 +++++++++++++++++++++++++++++++++++++++
>   drivers/clk/bcm/clk-kona.c       |  62 ++++++++++++++++++++-
>   drivers/clk/bcm/clk-kona.h       |  10 ++++
>   3 files changed, 187 insertions(+), 1 deletion(-)
> 
. . .
