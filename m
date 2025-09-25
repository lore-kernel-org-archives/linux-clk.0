Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6041A271473
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 21:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758834254; cv=none; b=opZdYNvtn7VvbivgRkZC86RhlylCtHt3TSPBKJuZcMPTNq5LCWQ8UO+X6g31YfXIinWoJV7UXI6ayjUD8VRwAIERNh7xW79D9+HZsp/NKEkgx7ZVMUTn9xXQMkmUQWVHproRCfTlmS1P68YC/KRrM1sYbKWh7wVfi6yDLP+9NLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758834254; c=relaxed/simple;
	bh=MyJ1VklW6yICDJYnRu7RAt7IyiZwj/0uBSjmy+BA84A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lxh3U0JU1BHCFAjeTzw0uqtrfL/xoLN0vT4kkmuXMJYc4ULRC0+46GQciUfvecPO9Dt8xStWG9w9yvy5ayeFV6zBH/tv8e0yRVHsbcX7urteE3mTFe9BXaloUUC5/6jqFF2LkRC5/7elqkQybXN9YxTrQFqIGTsdCqTP0YAeYAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=QZ6YCRmE; arc=none smtp.client-ip=209.85.214.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="QZ6YCRmE"
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-269639879c3so14005595ad.2
        for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 14:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758834253; x=1759439053;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jz7G9/EUJnkW1Chp9iRbyaB6CAs3zBGi/9nIuJuFHpE=;
        b=uXNzPFnJJLTMusgQFs/TDE5tKlT6T33+i5FxTBehg4+NKhN+hEDIJ8FMhNk902nJ0i
         B1+rX/ZIRNAKLdXicTcOXyt3TpLkrqgWcj4Q/Y/D2axq09EqCiagcPdasiJ1vvR7EOIw
         5lfECUgvLI0vi/3LlHclpnHz1s+4Yi7ZlPajH+7JPO3lEwhYGhgt/4WA0Ixr/gYW2ssA
         At0Ol4ZM4TlDl1lIo3Kj0DOCWiyuloNNk0LnJEVMob3R8kGgQsnjCM5kH0wW9ZpnqRpA
         /wyV1k2z1lauOxI/GGSzVbvKe1aEnAvyv0q9IWwYHBadIrXekXwdVv2Z6EvTVexwpwOx
         pB/A==
X-Forwarded-Encrypted: i=1; AJvYcCXrhyR5roahXJBUTxlvkxXIJeLNtoaObBmh0Bz+uHw87sCdVZJRjbKsvaDtXMvpRi+KaT9EDaeJhgo=@vger.kernel.org
X-Gm-Message-State: AOJu0YypmlZeauXxNOqJHp9nuQSBDbY64VJHPZ5KppEB1L4WZwjyKOSt
	fKkBNiJxoowmVyh+vCFwQST531SLt/TchYN+PhpZ79CUCt6wHQTtRB73wkh0RPoyLCtK9AHbkm2
	z5JOl+qsC9szB9tPq7HR8V5WE48s8fQ/aK6KT2d5zySEN+UUM7Ns18ClMwfCRVMCPfvcXG3cHWX
	FAJARZkYfCwiH0QJBhYPS2JLqFkzsE7XniQdOo9QWIwrnsI0jVlS+KGMXtrSjMOOnWN/JAcQN3Y
	q3dkPxoQG/X18nk3QSS
X-Gm-Gg: ASbGncse0ud8SnrO3dUdFv39ht3MYRa3EfBRdpFqb3JmY0+Shlnp2LLanU7r1UMaOQf
	U237ktqSkIS6NPurACye53bPfxU8KinT+/z/93tuxX35z234o1KQ9aTsw8VN84eDuN+P0iWJXGD
	wAgTubkrgnbB0MO+hMn5hcmzqWr7fB1MfLn8N8aGY8tFkiHmDIe3W9qGftsoI7lL9aCla6pRml6
	6hLxCIgH0utVwlKGoZIdVyD8WIrNkBFzEQuH2nsxAxIkp32/OZXcC+cPqBOrZgnh10F/fUF9/Nd
	msgAifswCHyyLl7SaNx7izGI8EQvjdWGuW3y/gFZfL4GuBZt5NMjKoghImWkH0Z01yte8HH4YJs
	5pyY13lS7P9bX4uEhYt2NZEYZGcnF94obC5sykOZB3IgUGjzcK2YUl2U8LofhEdt3NvyniCAa64
	Rmvt0beNk=
X-Google-Smtp-Source: AGHT+IFFJcluXCiAoDwWPdjSBWAWPxWxFCAuJfQjBT0drqReBeNpqkvheeXkBhkZM+Veg6dGZRUhFZ1iwDD+
X-Received: by 2002:a17:903:1b0b:b0:27e:e1f3:f853 with SMTP id d9443c01a7336-27ee1f3fb74mr24605065ad.8.1758834252555;
        Thu, 25 Sep 2025 14:04:12 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-27ed66dca5csm2340725ad.20.2025.09.25.14.04.12
        for <linux-clk@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Sep 2025 14:04:12 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32ecab3865dso2039009a91.1
        for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 14:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1758834251; x=1759439051; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jz7G9/EUJnkW1Chp9iRbyaB6CAs3zBGi/9nIuJuFHpE=;
        b=QZ6YCRmEjbFtb6SKHAgg5HSQDthamU58dUZrQHSj6ItJ0Dcab63aasxExuY84zPDvQ
         KyNwkE7hezoDyUruWlJJjfV/9PyEVI/gyQbDA5+lZ3IjvV3fNyRBv3Uskb6gjLeZZB0G
         /kJW6x3px3pb48i12Dvx3t95Hk+xiR2IAESpE=
X-Forwarded-Encrypted: i=1; AJvYcCW4874kFbWZO1gO+o8kQH5vw8+RftlcsWkIoziqrFnkwhcZyRiTKxITjZzQz/kCKGaUfvIlXb8zkek=@vger.kernel.org
X-Received: by 2002:a17:90b:3a91:b0:332:793e:c2d1 with SMTP id 98e67ed59e1d1-3342a2e560cmr4912001a91.36.1758834250931;
        Thu, 25 Sep 2025 14:04:10 -0700 (PDT)
X-Received: by 2002:a17:90b:3a91:b0:332:793e:c2d1 with SMTP id 98e67ed59e1d1-3342a2e560cmr4911968a91.36.1758834250532;
        Thu, 25 Sep 2025 14:04:10 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57f56725b7sm179631a12.54.2025.09.25.14.04.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 14:04:09 -0700 (PDT)
Message-ID: <7eed7848-b3ca-4415-85c6-7267c91560a6@broadcom.com>
Date: Thu, 25 Sep 2025 14:04:06 -0700
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v6 0/9] clk: bcm: kona: Add bus clock support, bus
 clocks for BCM21664/BCM281xx
To: Stephen Boyd <sboyd@kernel.org>, Artur Weber <aweber.kernel@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>,
 Rob Herring <robh@kernel.org>, Scott Branden <sbranden@broadcom.com>
Cc: Alex Elder <elder@kernel.org>, Stanislav Jakubek
 <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alex Elder <elder@riscstar.com>
References: <20250901-kona-bus-clock-v6-0-c3ac8215bd4d@gmail.com>
 <d36c5597-e26e-4ddc-93b3-222d8b40dab7@broadcom.com>
 <175834646902.4354.13114906749225372224@lazor>
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
In-Reply-To: <175834646902.4354.13114906749225372224@lazor>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 9/19/2025 10:34 PM, Stephen Boyd wrote:
> Quoting Florian Fainelli (2025-09-04 11:28:34)
>> On 9/1/25 10:07, Artur Weber wrote:
>>> This patchset does the following:
>>>
>>> - Introduce support for bus clocks. These are fairly similar to
>>>     peripheral clocks, but only implement policy, gate and hyst.
>>>
>>> - Add matching bus clocks for BCM21664 and BCM281xx peripheral clocks
>>>     and update device tree bindings to match.
>>>
>>> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
>>
>> Stephen, are you OK with taking all of those patches through the clock
>> tree? Patches #8 and #9 have a dependency on patches #2 and #3.
>>
> 
> I don't normally do that but sure. Is that a Reviewed-by?

Sure, let's make it official:

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

if you prefer that I take those patches through the ARM SoC tree, that 
works just as well, I would need a suitable acknowledgement from you to 
do that.

Thanks
-- 
Florian

