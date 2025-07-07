Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244AB28A1F3
	for <linux-clk@vger.kernel.org>; Mon,  7 Jul 2025 08:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751875536; cv=none; b=oxyNJe0mMQyxpt4uVhPfkUjLL5M1I/g91iog8rym/elUbARpFmdtIi66qTPAf1HDF+elDrMN7txhE6a52XboSj0f2YMdjD41yJsvw0XNMeRvtPU+1PtxkqI1Yxtjw5oXUqjXY6ZiE58RNTam9rFgQ3o4Vc4zO+BSq4S/3r0HEsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751875536; c=relaxed/simple;
	bh=1TjqDgVep254QfrcOu3FK5y0aX/fhgV/uA6wQt9g1B0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hO8nz3DU1mnEtT4RRf2xuWXfnp/9kOi79P8ilHA4cLrz/RwakezYcEhgt8q/BYICj6VYjdO+ljHoWz6vJnHXQBKfibtQnyPeI7WCl3AjGr9BmuXi0iri4otWJ6SG8BLDYFC3fmReux6wRu9KqE42OpZQ47YHMyfyAizcclC6AuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Tg6+KlkY; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Tg6+KlkY"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-60789b450ceso5431745a12.2
        for <linux-clk@vger.kernel.org>; Mon, 07 Jul 2025 01:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751875532; x=1752480332; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cfSK4wZ0IXAaLuWeqeSbn2/BZJH/6gHhbVTHrVcpn3U=;
        b=Tg6+KlkYIkFXgXxkf76IBjDYPoDHlDpa5+R9sQ9E0yxapxiDg1ZE3k2CpQNYBwvcJo
         i+6CMi17RguMUp7i2E4Mjkyt/uOxokXr6F1rGWafqb1mSf9Ss/MMvhyGaR1OE2k6d+M1
         V1lOeSCHbtVSOVWlUgia7cx96PPZwlvfwW7ZERFC5QkExixZ5Di+EkRKDx1KmvY0IQ31
         jM6bkw3i1maYUBjsTjAZXvB7aPbVBLsRjo3oZJ9cXRjrlCyzv5/PBI7LI2VKVTHEvd4D
         dVidOtE42tu+55CuhFyvk0Szo4uv9WxS0/XP9QV+pFwk6MBCd8bhQ8B74bpfUfwxFG5e
         bUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751875532; x=1752480332;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cfSK4wZ0IXAaLuWeqeSbn2/BZJH/6gHhbVTHrVcpn3U=;
        b=gjZHHxNZR8CgIzgOMXWGBESV8mu6Y+t/LLyzl/oYfI9SHpkLVnSBS5s2/IWqyTIIRO
         XJSXVxzu+d+EcCfodrtDKVNYO1dyJYcakJN3RU7yUa2U8xTtY36klI5HHF5tzL6nAyD1
         zYEWGa6fWAu8iX5K8x4pWw06qe9s/jMXQGFahmG/b0rcATuBJ3vJnQ7IdNjyZLCowPAD
         Fr1oHoDCv+aJjeEedP+RMD/5VZ1XC++k1M5Pmq47kqDy9GWjqVpWdK+Q+3Su4brjJovv
         9LE/Co13BkfST9sSrpbtmYitc6Bke2mHhfuc6YS5ioeSC+j7jxXpfg8DD8q8qS8U4RQ5
         Y0tA==
X-Forwarded-Encrypted: i=1; AJvYcCUMNuwDvywgPVZWiUsHEEL45V8mdt7Gw3YpehUA8oCNOmIv7D3bGAJHgvSv5kI/zdu1R+EIj5DuHeI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOcqKJXpafw58rREi6Ph68KAs36SLFGnS8rWfaiFK/3BaWR0gx
	L1f3rbrnfs11BDj1J77b9rvEqCfCXO+LnlWExqKydGT6EaDBp4klTJUj51YGlxBV/ts=
X-Gm-Gg: ASbGncv8VctSLDC9AOSIozemR5dfJArshsaXyjkSsnoTNvKk7TeXE4Z5YLFnNZgWUKK
	l/VffljYu1G7R9PowiTOHXqVP8ooOxEgFM7FSDYcFjFp7KEiq1tZ5Mm705TiWhnzU/Qwq6Y3ZoM
	C0f3Mhs4XtVsw13cJBY6rCX4FNSvXYWto45lzLBsKhiwmzYLGlMgk6QHK2hKB5uKGPLLtCVJxQj
	nSWPS7j4LnX0LBCc63Sf7M8CZRqwqFATaJ4FJFmTH9HULBys70xFXk6Z5PyZx6KmJDgmp08XE+3
	z7xqTRLUejI29P6OlmrdbS8xk0YxFaOtL5pRK6wTP8VrsQHK8awLBbN/QesnaOowt2EKnQ==
X-Google-Smtp-Source: AGHT+IE0L5DPGdmdGEN0u5OQ9V+2BW3fc6+QE6pzmfgPPJld1q+jXk9TxJBBsXR1qKPnO0Xzg35V4Q==
X-Received: by 2002:a17:906:c14e:b0:ad8:914b:7d15 with SMTP id a640c23a62f3a-ae3fbc899b6mr1217341966b.7.1751875532226;
        Mon, 07 Jul 2025 01:05:32 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66e8c26sm650083566b.25.2025.07.07.01.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 01:05:31 -0700 (PDT)
Message-ID: <96af5f63-dbaf-4177-95e2-a6cc24019dc0@tuxon.dev>
Date: Mon, 7 Jul 2025 11:05:30 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] PCI: rzg3s-host: Add PCIe driver for Renesas
 RZ/G3S SoC
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, lizhi.hou@amd.com, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
 <aGtsM22QYqekuiQA@shikoro>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <aGtsM22QYqekuiQA@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Wolfram,

On 07.07.2025 09:41, Wolfram Sang wrote:
> 
>> Please provide your feedback.
> 
> What is this based on? I tried v6.16-rc4 and renesas-driver/master. Or
> is there a branch I could pull?
> 

This is based on next-20250703. I pushed it here, as well:
https://github.com/claudiubeznea/linux/commits/claudiu/rzg3s/pcie-v3/


Thank you for looking into this,
Claudiu
