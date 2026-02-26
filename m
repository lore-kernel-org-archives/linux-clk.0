Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D83366573
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 11:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772105104; cv=none; b=dqbX5usd5aK6DVHfqXAlJEP4BQTEBgeW9nobbL3vWPYKVugVserCU30dBBGSbtXqLvy03nTVXf3z+ZQEwp9SfJcGM6wCyrBrOZVKHeiqwY5hx0Ex5cjFvB8IvncgcZtUN05RjXbTjtAjYM7fVptoeuEIsQfIM5MEWoYldO3aN8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772105104; c=relaxed/simple;
	bh=qoAG85cQLkPyPVkb7i8S/gUbpDBrputYuNRJ4SQGpNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CR+SoE6a23jq9vvhPjtYFj7wtE7r9NrqpNPQKe893n7WW3ysjdJjKNpvFBq1iKk8WdNU1eQ6o6jnBhF8bwkhfvETuaeo10Fmol5AtfOkm8Zfwoyj+lo3drN/pB9Cr0Kl1onOIDxY9xonqkn21uCCQ77x0MSN/pNRBgreYe4D3SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=n/p1+SYd; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="n/p1+SYd"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48371bb515eso10084715e9.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 03:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772105101; x=1772709901; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qoAG85cQLkPyPVkb7i8S/gUbpDBrputYuNRJ4SQGpNg=;
        b=n/p1+SYdFrt6YgNGhj3aaQx5Cq3pxOpub5ZM3RDpqsV7UsGO0y1u2UWb+Vv4MK4Rs0
         q+f1Do0MU0XkZYJWYL5R4b1l3Sw7d2X1yF1Oi8CVjQl0Tvs1jk/kVZ3+TiIUAQgYO429
         Sadbb+U0Pt40ORsmyJMsVzwH2Vfp++5qrqk7MHSml2TLkw2vLcc6OyBLrFVtlBUKNSc9
         KpFMqlqcXGNpGDdfAVAPe1lcCn51Rdu4doc6zVFyEIh2Ctbp+hMhUXL+cdDUX1A4PeJr
         Ye/uMlA3F/P7n1VKXKgbNG3CWfOns1M30BMnmhmYC+MdDkPlRz7PGVLxCs56eT3Naxei
         ODgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772105101; x=1772709901;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoAG85cQLkPyPVkb7i8S/gUbpDBrputYuNRJ4SQGpNg=;
        b=IwVrvF8rWWruG2RpgPGMfwz1IOHF461nuEGnttfhaIe0YqPcMexuKgOFO4ilJmgqpB
         xMJgJ6kCQft9hPBrxROgnGE2KJqaYF3IJTBW8LHkYq59WRdiOw2L+1VN+7xjPvLtYfWj
         2t+Ol49Rb9B/X2gCug4zLjuN8dAw2fzjzmPakuBsCr4fGcZICHxLxY/F7bT+MIhM42NC
         GfZVayLPOdne0ukQyo5E1s9pSy60I7ug+wZWsLaNLvcucRBBwHfKeC7vJGpBJgidHkDg
         h3npQ1gwUej77IPq2nxBcUId+hzMUYoLiPpEHQkkrhiOm6Bz+4OmZO4LVu78mRisn4Cw
         vIGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQaZ327ue8a8l1Mhe/CVuRpP2xd7ZUoD3mhyMqMb8eWW+P3fAO4KWF94oXAhY/RY0lgBnDaNZbWQI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwrJdmwed6kBBJS8pE/lSRany594K8XCrFGBQ3srbcv4keS0hj
	rKob3OKfRQN/qyEGS4jhwB+CxXhgIFRscdmITm3ois8x3FAa4Usile09b40/md5CMLs=
X-Gm-Gg: ATEYQzw19+lkVcRHwcW6tApvFhBCnCpbYZ6sDkm4F8AicJ/NsvX9ywFYlv3IP8eNh+e
	B0CLptcfaEv535uLVUehkMC34TK9ks3Sa1N2NOZgN5yyRAyP59Uc8URQTwXbw1NjqKQz9R+YHLP
	nRckvls/DHkmch++FNpK/Rl/Mjj57wmCUUiCkTUQasY+733jXcZ8Q3Od9RZIS43DgBIZLkEv5rA
	j9xa7my0UVbdahBCLlnCBuK201aHwXceDGG+Bd241p1gHXcnciBa069UkTiiHtApIMxeMwEHlRr
	gTCXn9oAWl38qFd6vAspbMv6CkcBuQr2lQqtZJ3bbLsuieyig9exFPf1L54ASkCU2racCLecwsp
	HUeo/DSWCjAY7NImQQ3xVPGBJRMS6hHAQWtTbl8U45how4Muie+MuO6lzvhMbTzcC8SlPzqXf/p
	Gf4IswtGBZVR76WEl0fUrVLofkGfoiuA==
X-Received: by 2002:a05:600c:5020:b0:483:b01c:9508 with SMTP id 5b1f17b1804b1-483c3da0abdmr31292235e9.2.1772105101244;
        Thu, 26 Feb 2026 03:25:01 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfbb465bsm82044185e9.3.2026.02.26.03.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 03:25:00 -0800 (PST)
Message-ID: <a30132d9-6966-4ac2-82af-b1a20a2b1a12@tuxon.dev>
Date: Thu, 26 Feb 2026 13:24:59 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/16] PCI: rzg3s-host: Make configuration reset lines
 optional
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260219223542.6364-1-john.madieu.xa@bp.renesas.com>
 <20260219223542.6364-10-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260219223542.6364-10-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, John,

On 2/20/26 00:35, John Madieu wrote:
> Some SoC variants such as RZ/G3E handle configuration reset control
> through PCIe AXI registers instead of dedicated reset lines. Make cfg_resets

There is checkpatch warning on this line as follows:

WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7:
through PCIe AXI registers instead of dedicated reset lines. Make cfg_resets

Could you please check?

Thank you,
Claudiu
