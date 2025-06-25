Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F371F30CC
	for <linux-clk@vger.kernel.org>; Wed, 25 Jun 2025 19:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750878602; cv=none; b=q2iFafgG/5w9MzXre+7c388JhVIefVpxOEZqkKe/dIO2QkifdU7LVnLtwVgdV3TKCQALT+xo/A0YKSu8OATLCmnjpgZlgRZBjC93stcaL0wYIamyYXpFoGVIzGYhnBSLFOLmLLyjbM57MAYW8e6LMzku1nrXkWQp6yXRVOPMf78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750878602; c=relaxed/simple;
	bh=2bB7vPFiR82NefYXBt0U6WnlFITpDcWiy9Z3+apDBH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QegaFlzULXsM33LFRdFDef6DXJ8j1Ug+SKsIgbGKBNG098PBKPDEpINOYOQv8lcRrFAVfrOFjaq2rM/wAG2GrvxeiO6E08tm0SBAEhEjur1aiOYuwSrdmbyVFLNuO5vX/pldJYL/VL/RRSqNcpglLBbuOnu7tw5DqGFs+laOzUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=DHcoxDLT; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="DHcoxDLT"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-747ef5996edso357803b3a.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Jun 2025 12:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1750878600; x=1751483400; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o0Ju6aCN24wZr3uVZs3SbxTR4fn7gitkctCIzfzOgoc=;
        b=DHcoxDLTMPzs8f7pG3NcdQlTJGG0cWRtHNx2p9Xkf5G/L7R+1QpL/I/aRiOLkkAzp8
         0IseWwOffNSl+fqs4aboYZaIkV/V76Bzih9C6CBGj/uAUa7s38hduTlHcQzEJYp8Ko1q
         /TaSO6lwey2imDQdCUrvseSKn7MPxHA5P2bPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750878600; x=1751483400;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0Ju6aCN24wZr3uVZs3SbxTR4fn7gitkctCIzfzOgoc=;
        b=mfRQcUsAGKju4Gu/e23u85S5x0vBFUie9KLlbf8amb8NvydcD/JxZchAwnJSzrgalj
         ItD2z5q4yp2YDX3h8r0KAlYwNkcErPep2eREhvRdGXFt4HTaCgfr6OmnquYu1zZ/Pmqo
         7d08LLLUVDccvLX3FwL4H2zHw1ePx0xIUL1SeJ8s9MIW7CAexs8JaSbgsucDWlOi8Sks
         j6KMthdS67YMakpwx6rCLIC9FQGvXIVl3eCz4pXfvAMehcvm5hD8iE1NnmgmqmBKnGNo
         mF93dbJyHhJKsbMGZ2s3xjRSzChM66HHzORXZEf6oYS17wZGXiQ0trieKgqBEWM2bN8n
         sfkg==
X-Forwarded-Encrypted: i=1; AJvYcCVIY03yP/x7iImJp0FWJeJ0juXaDLQigYgVSX5mGN36+uqHk222z/UeJl1hrbeWWCT7h24aer8FgaA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSb9oCqpNxBC3CC4O9ZPi7yRPtgUAbEkoAJpYxIx27cNnGGK1B
	uRsJ1/TV05jnu0F9G7hQQ72Azk98F/YX1M6ccypp/wD6Py1aZnw0Pc+PZi0JOYjc+g==
X-Gm-Gg: ASbGncvpecUB3YPf/eflPaz1oQIvBj7xp1zmKjPj7dNlyVUEMCAHiZ+3+jwzkS11DIc
	hWfZcJ+5p1Q4D6KbBGkD/fS74un99UlgPO+ydNV/YHE404FE0TUdwJm/D7i5qwhbKv1FdDHdvVY
	0UBG46QirwdRxNmi/jP/hK3vK+3st0xrVtj+v7EUXQiVQM18yqjlRd6yZmsW3NZ5CTJXWz13qnz
	0VslRBVaLdLNT5mDP5LdjKwl0dLNQBraRtaKPMnKBlWVz3/IwW5Th56v5I5/zA4Crzty3+HJKxd
	bJlWWerUcr5+AMYk3iO0JhhCpwYMy7ZEg3ALH62443uO0xB8hwhyOTyqdSxBvkiOg4RifpuL1S6
	aJVdd0cB8VhplMTTJg6vv7rkgEQ==
X-Google-Smtp-Source: AGHT+IHtKCeR3mNQuZjKw/LxFiZxZrGAtvXQtQeH7qGm7c4Q8vzCq5hRLQONNTo8uXUtyVJkmfvDEg==
X-Received: by 2002:a05:6a00:39a1:b0:742:8d52:62f1 with SMTP id d2e1a72fcca58-74ad4477262mr7141643b3a.8.1750878599991;
        Wed, 25 Jun 2025 12:09:59 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c88313fdsm5242219b3a.92.2025.06.25.12.09.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 12:09:59 -0700 (PDT)
Message-ID: <3ae39319-0962-4e1a-ad0e-27aca86c2075@broadcom.com>
Date: Wed, 25 Jun 2025 12:09:52 -0700
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH stblinux/next] pinctrl: rp1: Implement RaspberryPi RP1
 pinmux/pinconf support
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof Wilczynski <kw@linux.com>, Bjorn Helgaas <bhelgaas@google.com>,
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
 <9d31a4d7-ffd1-48ca-8df6-0ddc6683a49c@broadcom.com>
 <CACRpkdbAxyZK_f8y6mzX_eJ3UM5ZtuXEpSmXE+QpUXaHKw_NGg@mail.gmail.com>
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
In-Reply-To: <CACRpkdbAxyZK_f8y6mzX_eJ3UM5ZtuXEpSmXE+QpUXaHKw_NGg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/25/25 01:45, Linus Walleij wrote:
> On Tue, Jun 24, 2025 at 11:11 PM Florian Fainelli
> <florian.fainelli@broadcom.com> wrote:
>> On 6/24/25 08:36, Andrea della Porta wrote:
>>> The current implementation for the pin controller peripheral
>>> on the RP1 chipset supports gpio functionality and just the
>>> basic configuration of pin hw capabilities.
>>>
>>> Add support for selecting the pin alternate function (pinmux)
>>> and full configuration of the pin (pinconf).
>>>
>>> Related pins are also gathered into groups.
>>>
>>> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
>>
>> Linus, can I get an ack or reviewed by tag from you and take that in the
>> next few days to go with the Broadcom ARM SoC pull requests? Thanks!
> 
> I was just very confused by the "stblinux/next" thing in the
> subject ... what is that even. I thought the patch was for some
> outoftree stuff.
> 
> But go ahead!
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Applied to drivers/next, thanks!
-- 
Florian
