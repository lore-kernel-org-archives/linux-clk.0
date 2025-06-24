Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843DF2571A5
	for <linux-clk@vger.kernel.org>; Tue, 24 Jun 2025 21:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750799505; cv=none; b=o9wu0PMPqUUXeVh5rBkiAKvBigl8JrEbJLVAs4zSe2t08/tUD5BjawcAaKUDCCQYABuhswGUTjAw1CXzmJ7wQ1RJ22T0Yaq/Z1rVwnX/ZhGUrZVp+V/+Y2yaUfav91NtDJEJAY1tlYvnmt69mUrHTo+Qj56p04ADSr3XVoo0K0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750799505; c=relaxed/simple;
	bh=PFbnWfYExMNiWyWjv+9emyWRUe/yj2S0aeMUTA6DgRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JilXfJ8GwI2Lv+WiiLj6yu9R1VmG01YL408TcNztCqWgyvn6xnok13xACsEOamyeWZV+FI5Ewir22ph+USe+TWuBhPZf0ZnkRfLiPxnPfD5+mVPFnNVd/L6lONZJ43JACUUptFmEmZ12WrkfDpwf+JX9ct6ZrPHWORnAcDJLgE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=LiwNQ/kh; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="LiwNQ/kh"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-747ef5996edso4173325b3a.0
        for <linux-clk@vger.kernel.org>; Tue, 24 Jun 2025 14:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1750799504; x=1751404304; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Eo2vufChLx1e55QzOzBwTMNU9Z8LIJfaoAcIHFWzr7Q=;
        b=LiwNQ/khYCK49AlkADU62XP9aeXqysZtDDLWK3LsWbaE22eCtPCeOSGv6zEeFkzxkJ
         ng7axil/5AnsTznFEp8bj94zas6V4TrbOsx1x0ZBohOyeXSozWH3E7jC/KTi1AhCl2mB
         7b18cOfH1NevQJgPKqKUFG+dhS50gQVAwYI0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750799504; x=1751404304;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eo2vufChLx1e55QzOzBwTMNU9Z8LIJfaoAcIHFWzr7Q=;
        b=FOsSe91AdPLmhaAI3+snGYSIh4pdZDPu6hdxy0b6xWLQy9V2s7OdGQGcqpEBhbcGK/
         3re5Uf3NNPj0NrtKDUvDYz0URjbTWfQSsayhe+GR/wt+s+jlNWqM8kbED6pULQto3CmJ
         0qH1fHO169MY1lFlSvwf/1OarbfhhIWsrCi5UhjgD8GfgnEspZ1hZjm1KyHV9zghh3p0
         HYRH6ReEHA+X3M13A7Fbpc4etzal4WtwZxEFzQxmjKNq5/diqTuZhV9XR8moDJc59Pa9
         X8VqqWni/Fl6LUeUY/RSKH8qexL2fN2XMPmc9huEFWKx/cC/SvHFfuZX9pJEPXvu7Bid
         jrvg==
X-Forwarded-Encrypted: i=1; AJvYcCU11IZRwq1d6/h9W56vQda3ty8ENNA8z4iVSrDdvwjCMyJo3wFvYyjG/QHJcZgh5s8evlcaBMXoFs8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEttm2rUq7iFRoNVQ6VG8LSHd61O72bZLDOtazToFhCXP45JGU
	t0+/pNbGynLrW/qIE46Vu4k2wynmfr64Xx4p76UHJV7sQnHefpTISa+vhjGqauIsjQ==
X-Gm-Gg: ASbGnctG8vY0nhXSIXheBMMFTB0zt/KNZr8vqPqcI/1I6eYLH8MEPGTWLo/lcIhSahI
	8FyY0M4I4pzVU9zigAdY6BJ736yrV+nB4taLRQ1QEMWaXNDzBJkCKNWlkaPmF+s/WK9Kz4gNyfo
	LqqZpZHbN72Qa7imNcTCfdjIMBehRClDep3U0i09BdVHmmhKhOP5tH1rUGCxygSjt3ePzan7CmE
	pxrxxv61wUvVj+4q7mIm2R7udazMYRKaBE7qOsb05WnZeLwpvHYKoTmUqZ1KbMQDRCSSkU8JyId
	fenMrFGbMCjMaCloMngF5LijyUKzgdhb74R4XcplhbK8aQC8AhyUPr5uXvX575TBsdfxkgDhWNZ
	kbB6Mikny3VM1GhobgX6dT8dp1g==
X-Google-Smtp-Source: AGHT+IFf3/YeR9gk7+WP5WcaJ4mRmmHJiKPywBy37oskEyKjfGaPDSuW17BELTvjbXXXqhnRst+TYA==
X-Received: by 2002:a05:6a21:8cc6:b0:21a:eabb:ab93 with SMTP id adf61e73a8af0-2207f19255cmr765020637.6.1750799503649;
        Tue, 24 Jun 2025 14:11:43 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f1258b55sm9471699a12.61.2025.06.24.14.11.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 14:11:42 -0700 (PDT)
Message-ID: <9d31a4d7-ffd1-48ca-8df6-0ddc6683a49c@broadcom.com>
Date: Tue, 24 Jun 2025 14:11:39 -0700
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH stblinux/next] pinctrl: rp1: Implement RaspberryPi RP1
 pinmux/pinconf support
To: Andrea della Porta <andrea.porta@suse.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof Wilczynski <kw@linux.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Derek Kiernan <derek.kiernan@amd.com>,
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 Stefan Wahren <wahrenst@gmx.net>, Herve Codina <herve.codina@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn
 <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 kernel-list@raspberrypi.com, Matthias Brugger <mbrugger@suse.com>
References: <8c282b89b1aa8b9e3c00f6bd3980332c47d82df7.1750778806.git.andrea.porta@suse.com>
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
In-Reply-To: <8c282b89b1aa8b9e3c00f6bd3980332c47d82df7.1750778806.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/24/25 08:36, Andrea della Porta wrote:
> The current implementation for the pin controller peripheral
> on the RP1 chipset supports gpio functionality and just the
> basic configuration of pin hw capabilities.
> 
> Add support for selecting the pin alternate function (pinmux)
> and full configuration of the pin (pinconf).
> 
> Related pins are also gathered into groups.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

Linus, can I get an ack or reviewed by tag from you and take that in the 
next few days to go with the Broadcom ARM SoC pull requests? Thanks!
-- 
Florian
