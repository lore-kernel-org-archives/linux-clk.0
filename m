Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24B522CBF0
	for <linux-clk@vger.kernel.org>; Thu, 16 Jan 2025 17:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737049555; cv=none; b=fxpFrdoixsr5ljoQwvozJS2HKmLw4FIViY7QLMFcnx+ZlVgCsWB2dELnzKIBMfWO0ebhJ69IDgQyimNt+AG5gLOkhAQY1Y7uRhsf8jf4UXabIOKTCfjqPf1G4uVU+ohVSbhDALkD5eKJ9NuliLjHOGkeQWQocNba8vsmNgCqqMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737049555; c=relaxed/simple;
	bh=ZikDhVpINxuW6cdDGTatvIcZqLrqw1yj2n9A1WNz2yg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HVcSXz/A01AlZVIWrvs40uu/Ja5BJxxzBioODrH8Tf/3T56gTiuTovj8a9VMR97mWcjZ4FvI25jfvW4f681/T97k2Qxc64Y+wEXB6yFn+Prf5mSihQISiQLCQvv/qV/Aay5c8UIWQb0+09vYdQYzS09TaKt16RGxsKADG7cVafY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ICPFNk6d; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ICPFNk6d"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-216426b0865so21829425ad.0
        for <linux-clk@vger.kernel.org>; Thu, 16 Jan 2025 09:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1737049553; x=1737654353; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/Drh/AKRgmJ45wLb23S0mcSch3Lc8mZPLWiINbN0C9w=;
        b=ICPFNk6d+SN/eMskWScKXivjOATn6qsy4hC1/aPtIhf1tkph15uQ4sF19MtDcRMFZF
         loDzN0C0HytcPyOM68guKhwFmslZ+hFIHVn7HwNZ/z6JJADnm7loCVT/A18iQSEv0qOa
         V9ctmXF6wUOlzNYIudrUt5M2jLjD1b4hYzLfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737049553; x=1737654353;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Drh/AKRgmJ45wLb23S0mcSch3Lc8mZPLWiINbN0C9w=;
        b=iJNvihWfZ4U6BgEF2sL1nqm/Mar96jbmSf3tH+dCMgtEzhaPLafgsKCAIVrRL/L3+q
         /2RoKiUOs8ahuCFFeXQEBMWmbw9Px6rqP4swe0DAW3Yeel+4hG4uUFesBME5x5QBIYrQ
         YunQuNyffZ0qtE4JN7Wf9Xl8RJlEpxnoONdvp4Hgs8BayUxuUNVoNn8TCeOgUAE+im/f
         4NtbGz5Ukyl2HGHNuXLH+lcAd1qqmo37BAgheh8e58FJk6DVnT1IwYIYUIUKMmUJqRyO
         0memuFjVEOQZwscfVZWUreE+b9ix3UXs60yDSpGLJc7Hwck35Ucedgts90Mntj1pcDEQ
         S7MQ==
X-Gm-Message-State: AOJu0Yz25FMGT/vx+bZpcLfnxPvottKVm+kMjVxJPS1DNfkIGLZzsGgk
	nzwawDtcwadxoGIXG2L+CTzXJkVIdRcRBTINur3bo8WWKbHXNZgWuVarid3MOw==
X-Gm-Gg: ASbGncuCe9yQin+1cCUGhbWXH+9yzLpHdWkWApFiRO+KyF+XYrkz75+FEJpqIt6ckBX
	LryriU5+be3V36pmsKLdHrpdtEBMg0Y0ZJYx/mp/Zxex4VVO50re9qCIMjk1EMTm4sDI9T7oiOY
	0a4KHG14fjCyyPNajNySOxZxTmolNbP84OPhMzPfBAi6eyPgvmn/pFzTTJfsqGBOGkJKqWCb1uV
	qWU9hSs4N/Na78NBBixm/VYu7CHprZM7z8Q3r4fK3rucT0NmKyQ1eTsp+HSaUCEpYXUSdjHExdS
	bciNSkdwn+zJKYkpoyYp
X-Google-Smtp-Source: AGHT+IEskbseMrNOLzO4Ty9QgYY/5V8mUDrEI0MQIq5RBcUkt4Ka9C0lmr7fyEy1Y83gdeJwn6nPiA==
X-Received: by 2002:a17:902:e5c2:b0:215:6f5d:b756 with SMTP id d9443c01a7336-21a83f36e79mr450089655ad.7.1737049552978;
        Thu, 16 Jan 2025 09:45:52 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2ceb6fa4sm2986535ad.53.2025.01.16.09.45.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 09:45:52 -0800 (PST)
Message-ID: <af83c932-3fce-4814-b20e-8445138a4532@broadcom.com>
Date: Thu, 16 Jan 2025 09:45:51 -0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: bcm: rpi: Create helper to retrieve private data
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>
References: <20250116-bcm2712-clk-updates-v1-0-10bc92ffbf41@raspberrypi.com>
 <20250116-bcm2712-clk-updates-v1-4-10bc92ffbf41@raspberrypi.com>
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
In-Reply-To: <20250116-bcm2712-clk-updates-v1-4-10bc92ffbf41@raspberrypi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/16/25 08:24, Dave Stevenson wrote:
> From: Maxime Ripard <mripard@kernel.org>
> 
> The RaspberryPi firmware clocks driver uses in several instances a
> container_of to retrieve the struct raspberrypi_clk_data from a pointer
> to struct clk_hw. Let's create a small function to avoid duplicating it
> all over the place.
> 
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
