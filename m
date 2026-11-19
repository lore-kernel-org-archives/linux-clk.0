Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795123815;
	b=Ofa8T8Ba+90gWnEn9OZzkUorOsB4NMMVxbM/qfRGZ+ZWgPbHSsBkHlDWOS3MysRMHOjy
	 cwPDNCS+FT6kchkLZ6q34dVJDmrXjxYlNhK1bD5MuoBV8AOBFVogzo3g9l6tdwbpWYFmL
	 q0YeDzfwJk0msNA4O8i6HgLggzISoK7JLZ9XKBLTWKdOjkMEDEGTISuQHQOAfuYoy+z2U
	 YbvsbqvI4WfhUJPmAei4dhqq1SUUQWtIbVcJiw7Z0xsVMrDXbvj2w47tt6woLxZgTrW+T
	 6xuu8H68sRJuHH8cwB7Q18BueMq7CGNFalJJBhHnAqNycy/+g+kO9+R9jrcE5If+x6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=bZCkyOUbNeF4Kl4kbrR0/5p4X2Znv7p8mjS6tvEl6ec=;
	b=BgwoNhkaJAckCxQ6AqpTRsffcR1SRJXkWtxLLthexx0KtKiBYVS9nxy+CjrzmT1X0zHH
	 uXDW4vBx2/KAZ/ynHseT/JG7HQnXVeVWAcY6PqQURsecXu45dqF7OBcs87bIgVHHTuqCW
	 /FkIwaLjylRkSHRvxqjTkwHJ5zbt+d+Aj6yG8Y/blDjfQRG+yNR0ccYp1naZhQSNz5rVl
	 b/CC+wczIgIB3E+hMILqFhccc70D06FkQoebVoXs8V2s/M7I0jCK9RnKS6Js+sfkeUSMq
	 UV7bzM/N98X3HysR108f5XpM8toc5Mlb9sTAqwTK0Iy2hbJIY0sAGkoISXRevPq3/Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IH7GKxig;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4755F606A324
	for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 21:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4755F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IH7GKxig
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso238923eec.0
        for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 13:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795123814; x=1795728614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZCkyOUbNeF4Kl4kbrR0/5p4X2Znv7p8mjS6tvEl6ec=;
        b=IH7GKxigraZ4rc4Prs2sDGZJNk9/dC8TClmzlcBCLRyOm75heF3ogQb45s814EiOja
         FC3TRuNvQqAfx/pOadDV1KhMegifhwn5KWNYqWb9EpnffIci0acksl5bEFlfV8aCpXzQ
         fBFwtMvHnPY3BBGfXeP+DHW3yLx3EqdxdwzmloSbSn58J47wdj1o0nnUnZQ8nQCw7dPP
         Ls3xAmeyBdOkuUKYxz9KV+/NPp532aWaPzRXvnWRW7EKoulmp+UlerlcctfTYJYrbzs4
         9+BRH6FSCzcceQqt27BN0lbYmdYf9CC6lNgCZSIcie+reZpxb16GpzegFRZwDfagy59N
         VUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795123814; x=1795728614;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bZCkyOUbNeF4Kl4kbrR0/5p4X2Znv7p8mjS6tvEl6ec=;
        b=0KS4xC83QxZeqogTBc3N3QlQiL2SxtGzC+exF7xWS9ThGS7WoZk/EjmrNypi0mg9Bt
         XEkyR8+FEoUnyt+sbC+wm4SVXfrccpDLP72dE8Ip+L2aEzyWJ2iEeuUVJEFVpHwM/VT3
         EDziVQ6XCfZCJc7YRcn7J5v1Ymsko1bokvDtephhcvr63gIlT9gpQ1SYF57A+NcBLtK/
         qJq5tQTS0H8Ji3C08p028F58IwTapOPuHjfS2GxHDp1W26U9Eh5/EDTq/3gvUs4pvknQ
         KpEpwjXXhKn+Vjdb3UrSxGCh59pbNf/1R1Bbubksx3No/WIRzspo5Yb1o/hxdyRze2rf
         j11g==
X-Forwarded-Encrypted: i=1; AL+hErFXnkMME8QFiGhPAoyhzpcU7LjBy+ImHQAwPfV8gc8/YpqQivyUmzCBWb39KE+w/+LbIFzOEGoqB1g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vYHdoOlLFsF6eU1GnkfM+wMQv8WGdKLoIy4h7MFVJRZ3vvKIc
	YYC4Xk/pXURTp56PWAPc6xvH9DilXDn9aaqOSry6ukcod32WPCeC7GYs
X-Gm-Gg: AZFdTZee4IRzp9VVJXMXO0lQcTz217UAZpH3qDC1qZwS/9fuQsWgENmcIE7vFJgsYvc
	bY4fq5ePvlIlA0xPL5N7ZmTgWPrLeFrgXWwNXLj57NlIthl8Qvpmb6YUe/JxbHnwUNtLEHcPzgV
	4BOS7V7eLaI++RkITDddUyBPmKa5tFKjV36fjEuEunalXciOFGolfw0bzrb8RZsIbgx9eeFVvB9
	/CBnfJEG4e3BNQiQGTxUDhS+MZrq2s5OeqWWiUZWPIfRWUVdVD9YN0FgGEPIgeB2EMJEp8hURf3
	lO4llA0j/uDxvkDyncoou7xX8Q0SLvXMGboqYYQO50wSoR3iq6fntHLRXeSkK6w076YonruUCKR
	f887hhJgm4GIV7If2Gt/7nCVJe2hE8VIOhQ7wi20PcNvlImLgYb618i59s3kiPEJlJyxV3drBIJ
	AgHm+OZh718oupyQS+Qd0d2mtJ78uv15iESKekMzZqDq6hDSdVD9LCadeANv/X3dRCQydd4dS27
	YvwSxxfdMoEqxWxXpkPqPYI0HaxddiycZzY/bTO47R2SY72+C73DGTgsfEP1/2pyqnyvrnJh/TY
	fnnKqQ6A4bWbVCIfK1MqmWG7VgLsct2Ai/FNmwGp7R7AE7IyOg5ZaJE7Pg==
X-Received: by 2002:a05:7300:e9cd:20b0:36c:f88b:caae with SMTP id 5a478bee46e88-3857025cda6mr693592eec.22.1795123814059;
        Thu, 19 Nov 2026 13:30:14 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385675c9a3asm1145138eec.19.2026.11.19.13.30.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 13:30:12 -0800 (PST)
Message-ID: <75c6a1d4-8c72-4590-9c29-4218bef2a1e7@gmail.com>
Date: Thu, 19 Nov 2026 13:30:11 -0800
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] MIPS: Ingenic: Add XBurst SMP support
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org, =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?=
 <zhouyanjie@wanyeetech.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Paul Burton <paulburton@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 hns@goldelico.com, paul@boddie.org.uk
References: <20261113190836.470937-1-f.fainelli@gmail.com>
 <20261113190836.470937-4-f.fainelli@gmail.com>
 <alpine.DEB.2.21.2611191915570.54328@angie.orcam.me.uk>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <alpine.DEB.2.21.2611191915570.54328@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 11:17, Maciej W. Rozycki wrote:
> On Fri, 13 Nov 2026, Florian Fainelli wrote:
> 
>> diff --git a/arch/mips/ingenic/ingenic-smp-entry.S b/arch/mips/ingenic/ingenic-smp-entry.S
>> new file mode 100644
>> index 000000000000..290e23c65707
>> --- /dev/null
>> +++ b/arch/mips/ingenic/ingenic-smp-entry.S
>> @@ -0,0 +1,54 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Copyright (C) 2013 Paul Burton <paulburton@kernel.org>
>> + * XBurst secondary CPU reset entry
>> + */
>> +
>> +#include <asm/addrspace.h>
>> +#include <asm/asm.h>
>> +#include <asm/asmmacro.h>
>> +#include <asm/cacheops.h>
>> +#include <asm/mipsregs.h>
>> +
>> +#define CACHE_SIZE	(32 * 1024)
>> +#define CACHE_LINESIZE	32
>> +
>> +	/* The CP0 REIM register only stores the upper 16 address bits. */
>> +	.section .text.smp-entry, "ax"
>> +	.balign 0x10000
>> +	.set noreorder
> 
>   What's the point of making this code `noreorder'?  We want to avoid such
> code whenever possible.

This was in Zhou's implementation and I did not modify that part.
-- 
Florian
