Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4F514B094
	for <linux-clk@vger.kernel.org>; Thu, 16 Jan 2025 17:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737049480; cv=none; b=c7+l0zBf0LbScvQIvR2dm7q7sg7BCEffse0QQov/zbAy2f7zJ1U9zUgXLDeRCFoHUyQ2M2T1bCrsm9RkxRCkdPBMORrauO98ti+UVNA+Z8tktKwfzYrofDnp29bJ0qJfKz1/M7o/QPfY5NFpaBbwHiNTQIBPLlMZLkXGIv7DiXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737049480; c=relaxed/simple;
	bh=DVDBBhsmhEGtLwlO+yxr5iUX2UjKHuW/SDvd7zv44sw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W+OEGmAHYd1GHNppKYmlXs2EgFV3TwGJedJNBRYr6nFtkoDWbIt9D0n6pWsYOxsRYplQDawa7zhncfDnLl2rzu3g5fEsBxF3BBh48GD1zb/d7g5N9x8OSOPu9ZefDOTsR97PVjvCKt3K2Gct9Z3cAJo7q7J5SHg+nole0g6gEBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=hANDeOAV; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="hANDeOAV"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-216634dd574so14780705ad.2
        for <linux-clk@vger.kernel.org>; Thu, 16 Jan 2025 09:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1737049478; x=1737654278; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fbH0aNuhNBY+Qx/1k9JyF2WTMEKtKQ8nxA8sJGBpS7w=;
        b=hANDeOAVadnED2e7bwcUhca0A3HUtBme4zgVDBmG7HHkB32a3r+Diveem/jXVc7G+m
         +OXta6c/+udg/6EFU7UNjAa5ZSWl9tzc9/9+mI/JIpP63RLj9THebyuWjVFaLxPru3xV
         prdoLzm11PuAryzjxTkBPHprPvzdHj7j51VuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737049478; x=1737654278;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbH0aNuhNBY+Qx/1k9JyF2WTMEKtKQ8nxA8sJGBpS7w=;
        b=OAWZ1AxiFNXK7/MTzavN45cjSguS55LBGDs9vBx3u4rgk2O+iuBlSFm01y0VVd7LNx
         8+4y9B0nEZxhcwsVLmkoQOMvCy8/Z2ZPlX2l/gz4nEqH7WQITtwNqvSFg/vq7jjKC14+
         MpQK0LpR3p+kmMGGjahR/vZnuksW+HfbkltupHy/TYQLRZDP4ozQZvPxSefaps6IWK59
         DJgzotnWPOpbb1W803jeaozjmqr2Wg4LXln+Uj3jL04nioayios4mtgrmsslQ35/0Yj9
         w4yBWaGy5WZr3z73xpmZpwDM/i5BKW/kx/lev5zoud96awviZ+iLqxLE826Z+DPXBpTs
         SuZw==
X-Gm-Message-State: AOJu0Yw5shE+Q91/MmjI23K1aB+QOI6Nix3wSdIRxFDgPSG39O7uH4O/
	PIK5uwYmtlxS+Q5OZ4mz58PHtbSPBWGw0PTWY6HiHee2MgmTDQfl9eQv5KL4KdIPdpWjr//3PYg
	=
X-Gm-Gg: ASbGnctuoTIQHmlmG4kPBbTH2YlKuO6ENlW2Vm5HuqDbPsGwo8MeYG8rCprmZdRAMco
	x1KKlHXYaFs+1P9Pxw5uzK4SlHXsfiIDyR2pEoV8RBcDMl+afKihp49f5SjcKPbuYUWXanPUl/1
	x3mG/cXH+nmOvED2TEcMPL2wiEuojZOB6w55bY+N/XAdSrYIpzfLDy5xDKEpn+6XM5kimgncmdV
	P7NGYUp80R7uLxxTXKdiumXV205IdXuunzYdgLk//TIYnO7hw7R2McH1rOe5w/XaG/SODt4Y+cm
	UY3uU5ae+2UXkguw7fgf
X-Google-Smtp-Source: AGHT+IE0Nz5l+5zPCU039uTisaH3+lRWGSGUZOlt7zohpZP2X6Ochqj54Row1+OLzWAg1OjmZEweuA==
X-Received: by 2002:a05:6a00:392a:b0:725:b347:c3cc with SMTP id d2e1a72fcca58-72d2200273bmr49375661b3a.23.1737049477674;
        Thu, 16 Jan 2025 09:44:37 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab9c8f6dsm262871b3a.114.2025.01.16.09.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 09:44:36 -0800 (PST)
Message-ID: <b3078803-973c-44eb-98b1-b4d94cbc19e5@broadcom.com>
Date: Thu, 16 Jan 2025 09:44:35 -0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] clk: bcm: rpi: Add ISP to exported clocks
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dom Cobley <popcornmix@gmail.com>
References: <20250116-bcm2712-clk-updates-v1-0-10bc92ffbf41@raspberrypi.com>
 <20250116-bcm2712-clk-updates-v1-1-10bc92ffbf41@raspberrypi.com>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20250116-bcm2712-clk-updates-v1-1-10bc92ffbf41@raspberrypi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/16/25 08:24, 'Dave Stevenson' via BCM-KERNEL-FEEDBACK-LIST,PDL wrote:
> From: Dom Cobley <popcornmix@gmail.com>
> 
> The ISP clock can be controlled by the driver, so register it
> with the clock subsystem.
> 
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
