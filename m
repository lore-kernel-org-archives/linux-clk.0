Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281371DE8AC
	for <linux-clk@vger.kernel.org>; Thu, 16 Jan 2025 17:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737049504; cv=none; b=XPEO+9UpBs6blvvat1ewCJsug6qGYZbkZAcFn41HTExkSEf0lxXc/602MAo8ogsEbgkYP6W3k4yiLGn2eHpncB37FQ5LXrpOzXp6MLDixB6HY3eXJm0JSXSYXtw5u3juqpjevyHKckJIolyo4ebPllNh61/DXqTUBDrARsJWhbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737049504; c=relaxed/simple;
	bh=dP6I44kNrRcoQ9iP4k5+E4bLxbziu8VLTuaCpV8Yy5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sX3EZARD3XrO9gf8TBNE1T7GHZuxZgfqVRFfLiEo2ebKazOGhq1UJYZg98tk1qK+THLK9ga8UBMsbP6HV/vUciBbshzN1uXLg0d9t+h8VVEzObJx7UCtueQ4z7EIMKSXpc7XTp5DH32fZW8g7Wdo5MnKA9ZE2Dv0URKdrdm9Sew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=CeTbAg21; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="CeTbAg21"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2167141dfa1so22675245ad.1
        for <linux-clk@vger.kernel.org>; Thu, 16 Jan 2025 09:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1737049502; x=1737654302; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=27jezBfAVIzktHTr6l4mHiDx2Ggq5Iy2enqwqiFBvyU=;
        b=CeTbAg21BHSauCQNoqeJWQQ5zkVe1ekbDu2CCW4r2GSNu4ARnghGQET/m/pB4VXiu7
         ARdRq5FdgVJp+bK/lAMwigLoYL380xN/PENaP2MWDaOJsB/P8CkXiAIqMr2Vu25O3iMn
         HbW811i2eHffhWbbxBAV06HP+YjSTkH4O3Es8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737049502; x=1737654302;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27jezBfAVIzktHTr6l4mHiDx2Ggq5Iy2enqwqiFBvyU=;
        b=NLdY343cJ8Kt7UqZjCO0KpYFjxC5sXn53GiTVGfRa/85g0JhMlahgoude0kTalYmUM
         +4g+eYLirLNIOj6HEOm7bhvjqNp6GJ4fS0E44LS4GG2C7HkB/x54fHnS8nix3oOIdLfU
         dzzabWrvJkgWY48VxO4CSwRC/SyHhXOczyV8uQvEtGRAx0OHc4qejzhlb1zeQUjEWmIz
         dwuKCZpyEP//HtWMHGwZqAYK79qZNbSwX0ILFuWH9KrwWT9X/LVNDEzCoabl4ZdZoSjc
         7kK5VIVqLisD7mWrpemWX4T21j0mFRAl3JPML/pw+kWEd3OuJTkQ9KUQyWbbjU+Ac/aB
         t2hA==
X-Gm-Message-State: AOJu0Yx8XQ3inXMzotgnNxQ+Pm/S+z+5DmbrMRGoiJSjtpU5HwbOHM+W
	vgiXDiKBB5Ql/UlpKDSI36UmeytZ8MfV9/FvCsbfSID3gOgunP12bVIJiBtf/w==
X-Gm-Gg: ASbGncujtXHR/Wgs5ZUGDz4kpiVZug9LLvox5lNPOo5D54WsdLxBydE4MNDeHM2TdpY
	nQ3VHUPfS7Z6i0X/PGlBchDep14jIMoGy133gIegucZTlDLfKBeb388EHCzWd5VmCTfFikiTa2i
	cS8jf3/tQBZdB3+5rovUNA3us9uVqS7YHvphkTermEX8Ks/H5ukcMk5l+Pkj33Ajm/0Z0+ZWmIC
	+tU4Lp0bAa91V7PPfxpzpCQQzJRvo/qPKsTEt6I3viwmRNqSC79YOLJHQ9UFdWaC9+ShzL3WnIE
	47Z3eTR+iQ50I3pcTakA
X-Google-Smtp-Source: AGHT+IEoVJVVRv483DSqBDgUt/hYJJvZWdWXiVwpeOSnOJXp9+lLG+fUWzzlPwCAlreJSx1M0dr82w==
X-Received: by 2002:a17:902:ecce:b0:215:a303:24e9 with SMTP id d9443c01a7336-21bf0b7698emr116741705ad.3.1737049502456;
        Thu, 16 Jan 2025 09:45:02 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2ceb76dfsm3010695ad.61.2025.01.16.09.45.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 09:45:01 -0800 (PST)
Message-ID: <a8867a5c-412f-429a-bee5-68c9b9c51131@broadcom.com>
Date: Thu, 16 Jan 2025 09:45:00 -0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] clk: bcm: rpi: Enable minimize for all firmware
 clocks
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
 <20250116-bcm2712-clk-updates-v1-3-10bc92ffbf41@raspberrypi.com>
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
In-Reply-To: <20250116-bcm2712-clk-updates-v1-3-10bc92ffbf41@raspberrypi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/16/25 08:24, Dave Stevenson wrote:
> From: Dom Cobley <popcornmix@gmail.com>
> 
> There isn't a reason not to minimise the clocks, and it saves
> some power.
> 
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
