Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9A614B094
	for <linux-clk@vger.kernel.org>; Thu, 16 Jan 2025 17:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737049491; cv=none; b=lamYrit+4A9OX/z5+pXkzaXTw5Bi+ZPBhQJX/X1gF0ZYoYt9Kr6B6DHuXyJMkcHTvqL4V24BWrdkz4PmYwj6NAyXq+eJlIi1xboFA5mWeIYm7WP7WEy5TO7zTjpLxAWV9LTHS8FyGmjt+74UH/JLgtnnct3Aw+u6RHkuSsshU+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737049491; c=relaxed/simple;
	bh=rZt53JzR6TFyAMjZHCYOShXd4eZJqoTtb4WcJG5wwio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OKP+txJZ9OcLY2Q2b9SsaLMjIBJflg+Xy1YBolPg6jk6ihlpYtMtxIe1sdtoHiE4POK+IhH4T6Vws8kJ+P+yz5vJgW1NfdDSBMAgb6qND3DsJJwTBP8ZnZ4mh7RATlEVseW4SWX8tpsiRg5dwj7s4msaFKe/24Cc9lWG6eh2bjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=NN0LviDk; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="NN0LviDk"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2f13acbe29bso3862264a91.1
        for <linux-clk@vger.kernel.org>; Thu, 16 Jan 2025 09:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1737049489; x=1737654289; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KdSRLH407KyVo9i2OulrASDf2FZjUK5HxCuQksYb0AU=;
        b=NN0LviDkfI9YXQI98rLviVU5DMgmcHsCO7/MoUxbCex+TuN6GqyvMVqOxRgkFKzMlR
         XXXXKsJo99T/Tz4rKsy+RsYSlMk268lxSbKITrxnbIVNu5ssfVSVJep6ksX658f2De5c
         4Hij3BQzquE8H5oFVW10AE8wtYApT6+mxWEc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737049489; x=1737654289;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KdSRLH407KyVo9i2OulrASDf2FZjUK5HxCuQksYb0AU=;
        b=UhrD8nVqyxp1Fp2sLCJ39DJaPdQlNVFMfWa8TV4dC5W/ouQzujQdNolD9Jhi6ZqdP+
         WY9rre/FiOpWRW8hPdtB3URPtv6jv69PsdTnhgYgeopQdLKnWdDO8bXJ4aOjZqZlgW0q
         /MHDm2VLXbxwvDJ7cp0nwd3ptlY5IbDTLG/3RhwHbEK5ZLusW7uEsuPmMujyy/fL/JlA
         PtD0wFbyVss4SLdav01YOntfsHHHnJCXuB3eJryG7D/ZnZZ+RlqZJ29hTegS9WFAY8Kv
         HBiCLQl9yfnkyW1fzkY0SL2bUMM//BUbv07g2PPif2B9nYCapbREg1pfaFo2imAYHfVH
         bp3A==
X-Gm-Message-State: AOJu0Yy0cb+99ohxbROXZ7BtGrYFmzHko8ssTyK3nw4nA+uuqg89Yjap
	qg12NkVWtRu28vssStXzg16846buf6YTn64cmvFf87us5Vaf0sMqGiNeA8LEvw==
X-Gm-Gg: ASbGncvz6r/tAGyYeb0v9QK2wscg72Sa01S3jxmddJ+6z8/xKn12YvbD8jZjPJmYLO/
	PekK9PLgkmi/G/pLnbSVK7vnYkzn0NsmYiWlzSiRJGXpYq2L9KKrkGbBLchNHvyOc5At2bk3SbG
	TBt6ZG+EiNQ5iBxgQ3J3TXltA6Yu3r6/Gr7FmO1D2MkrxDglkIlxvAGLtkkAe6hMlYaPV3x3S5w
	68hSp1cYK+N12TPmTeT1x+eqZSYr2IgxrDBhmwU8P+TyohHD+gP6rkevkgjEMI3NuHUnjiHd1i0
	XEzeQnKz6psNI75nxwln
X-Google-Smtp-Source: AGHT+IF+4R047Qzw4YHErXGtCBTYRApVnqgB0yLlDA9wlrkzE9bOj1bHitVqKoHAvbYcAqI9I/GHDQ==
X-Received: by 2002:a17:90b:4d0b:b0:2ee:823e:39c4 with SMTP id 98e67ed59e1d1-2f728de6649mr11843030a91.7.1737049489060;
        Thu, 16 Jan 2025 09:44:49 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f77629bf96sm419605a91.36.2025.01.16.09.44.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 09:44:48 -0800 (PST)
Message-ID: <07602a85-8ac3-4538-b2a0-65d917de6ba5@broadcom.com>
Date: Thu, 16 Jan 2025 09:44:46 -0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] clk: bcm: rpi: Allow cpufreq driver to also adjust
 gpu clocks
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
 <20250116-bcm2712-clk-updates-v1-2-10bc92ffbf41@raspberrypi.com>
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
In-Reply-To: <20250116-bcm2712-clk-updates-v1-2-10bc92ffbf41@raspberrypi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/16/25 08:24, Dave Stevenson wrote:
> From: Dom Cobley <popcornmix@gmail.com>
> 
> For performance/power it is beneficial to adjust gpu clocks with arm clock.
> This is how the downstream cpufreq driver works
> 
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
