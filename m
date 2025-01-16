Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2400522BADC
	for <linux-clk@vger.kernel.org>; Thu, 16 Jan 2025 17:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737049546; cv=none; b=APA0p6FFG+1KLrsC4Z/CM8dL/oqD0NgP6B8+BmJ7hhZNH55VY1l97RePj6lhaCUE2WdmkfVFU/rO2U15r18LCo9I+hOwIVlB/Rbxqu6ywL7k5Jfnw3PjS3c/rZ0L3JjIaC36thkFc+FAtzEOBfQw+YZ/gIZaoaM9lYB74B/huak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737049546; c=relaxed/simple;
	bh=5egZvZsimR90ztWUfn/wDRiPFm0ueGajo/pGyixUWT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IzWxS2V01oreY5ZrMpgLmm//i2p7DnUOLwmyMt4IwhVKtBuSO8VxLp8k7C4vGUzfMBithUF9orFD5Wq4638WQC1TLOUw7AnxrRe1E1xdl9kSwwqlQtxvIAhebwfpVOU2Kpx9XvpDF0HRPmM9y4LZQKPJmnktjk0YDN07jVpAeDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=KOPUVwD3; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="KOPUVwD3"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-216401de828so21629695ad.3
        for <linux-clk@vger.kernel.org>; Thu, 16 Jan 2025 09:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1737049544; x=1737654344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wXUWRfgVPfjqjzYqB9ylCsJuqBtySkaQuKmwFGwuG4s=;
        b=KOPUVwD3lnkRsoXmDqOAuVgGZyvo5ZEk08sjqCfnnst1UVu8R58tNHPCoXFzp2mJsS
         hvQ526log1w3gkmmmXCBvQKxcGLroPh4is9iYhG4Br+jDpFUgWP89wBQOPLp9or9B2jE
         SCYYnQ2G35++FiqjVYzwiTp5R1g9xu1voyiTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737049544; x=1737654344;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXUWRfgVPfjqjzYqB9ylCsJuqBtySkaQuKmwFGwuG4s=;
        b=PsbwKviF5vVH7sP5ofiAJk8liXWewxxpKKxCvzaPPOS5MBEomL6KkvepdskP9gq3nw
         8V/JZfOkNP7ZcQ5MBelmmb4DwNhmjvV5+jqPyZ2+OHgX/kL6hDlnPdT+8Ar90d01CXGH
         kZtU5C+Ejv7tNpFlELf7L3xo9ryQ2KI3cJtim8okee8q7jfVD6uRXRZq9rgnT5/Qfuvf
         MG4+zYBr2KG8CgwGabTx8F4ayKZq0yoescRH5j2iGuekNCl4Whone34gUvI4omo7E0IG
         qihIPzW2bgc+ANVIuSCIvcHfLq5gOCI0JBLKuea3Kta9og6R7aUTyD1byLqqe7cyZbuU
         h0qw==
X-Gm-Message-State: AOJu0YwIDRjMrSPoyx9Y9Ia5RR9RbkbX8Dg9QKlQXA21Xeml76hXkR98
	UEO9Ht03UKdCwzasA0qPtlg+JZ/gjD5xqxcaXXU1bji1P+CfMNUodwm5OhGQQw==
X-Gm-Gg: ASbGncu1HXO7K/0gPGk25r0HGDfimq8OLlXfrhdwO8xzNE9hx2cByWgTvjryuL0cp1/
	kPIFwniPgHAK2TizF4fqvJMBtmpI4uoCD0VgWTtRsKv2NAfjqL2onyiLVuh1md99LLqCNEowGjb
	0yt7dCtkD565ajNEhG2UFJrHUipGl3oqb7JMO7sPMWQbUkJxiiJONzAZozQ1CwHqaDw26oXe/xm
	LfPTclPkY+OVw0OF41NsFMP2g+hiuFSlInV8E8mTyHyb73GG9j+HPIChY5PdT4OQQETDoiODFj/
	RyWfaVl3dt5UrMjNMdVvtjH/PAD5u17vXA==
X-Google-Smtp-Source: AGHT+IGoBD+SJJ/QxFGJUHj4pfv2HQPwrV6pTTrXBMpFdFvwdE9zjwq3erFQ6AqPAJfgHcS/8RJVag==
X-Received: by 2002:a05:6a00:2406:b0:72d:8fa2:99ac with SMTP id d2e1a72fcca58-72d8fa2a067mr10388358b3a.13.1737049544402;
        Thu, 16 Jan 2025 09:45:44 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab9c8e65sm278973b3a.103.2025.01.16.09.45.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 09:45:43 -0800 (PST)
Message-ID: <6645f9bb-7655-4d89-8aa1-220651e3c26a@broadcom.com>
Date: Thu, 16 Jan 2025 09:45:42 -0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] clk: bcm: rpi: Add disp clock
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
 <20250116-bcm2712-clk-updates-v1-5-10bc92ffbf41@raspberrypi.com>
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
In-Reply-To: <20250116-bcm2712-clk-updates-v1-5-10bc92ffbf41@raspberrypi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/16/25 08:24, Dave Stevenson wrote:
> From: Maxime Ripard <mripard@kernel.org>
> 
> BCM2712 has an extra clock exposed by the firmware called DISP, and used
> by (at least) the HVS. Let's add it to the list of clocks to register in
> Linux.
> 
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
