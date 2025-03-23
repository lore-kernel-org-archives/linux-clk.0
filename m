Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A5D1411EB
	for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 22:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769035; cv=none; b=gIdio2i2PN0K5RuZhf7lH9N6uYhoIAdO8CBBdYJbhrxZimedKev0vuwvC51591lEtffDOSd4bqdT3I5z3PtvzgIiE6kdshWxqtVpXpYmgRS+vUj9N7tCtT6fFo0KiI+4oOzqan8HVM/uiwVvwKvjAzJDEm/RZrWP/LtZPAeMu8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769035; c=relaxed/simple;
	bh=1b3NqGhZ++VNtWquMWADqKAovnA8dxvjiZY17polxNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jJQLpIunJNnr7GW83120u0i86vCl98GNRo1CF8EPdH42dHsRg6z+7lLq4FYiVmBlhr4NxYGFed4lpVQBAyBn+IFuRolERq6IZpQsqQJy8p1K+bAR2dgI2LXmcp4wXo2Jf2ijBGOalu3MmFhllpZChTzqehpS8cE8jnAoJZVXjT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=za8yqTkV; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="za8yqTkV"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3d589ed2b63so33970875ab.0
        for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 15:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742769033; x=1743373833; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nTRlExMDyawWBV8YJuZYM4CxYbcHVqfU+45dmVV3tsQ=;
        b=za8yqTkVfMyFHwD1+oWYC+gKzg5VhwhXkvOmBnIq9CC/T8XxO4JrmDhP5r3zfnG+Fd
         UJbzZ4vgqLt3cJFNpaxpXoI2olejHL+IF86y72vmUgNIv4wdU6oOgG7stFfKQlji5asp
         KQbf2X6w+2zsM3DXr6nR/BtieR6h5eaYh72zewIQB9b4Q1rLWOuKiWSttSl8ngsFQPRi
         UkTsRvqFul0xUDU9qHgoxls/KCVFSuRWyAslygBaCRn1BLEgmB77vweODSDpqOlXR0vX
         JNmISd+QebuZFN93XZJvSBAzEZKKhlBHiPP/vMZtR65cfgNbMElU16pJ4n41z7BSF1nM
         T6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769033; x=1743373833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nTRlExMDyawWBV8YJuZYM4CxYbcHVqfU+45dmVV3tsQ=;
        b=keN/9DXEBaaYEeJXKczQn09c8E9cZ4MU7gwRInZ944ZMGqLDbp/O+d2uZ8z6NRJ53p
         iCQp2XIPhZh42GLxTAZBYRftnZX3kbdKXHN5Qp0JqEutZbek58y8gBMvg7XQRcWCBUmO
         rSY/5cWlbtB0T1+YYJDYqd+JWTVaLYEEDfoCBWQJDv9n7+u/ss1SFu/sN6GOaNKFHg3c
         mmtb8JPAVwiweDS3KESyxZ33eYjKsSAQsGwnW+ldYGauhAabKqu1ZnGEkfJ5U9Ge125k
         349e54PrLAqd9xh0KjlR5q2q3ljPJbJoJvBltZou6J7qHiTTUaM7uUiETBa1c0OrmmlK
         h5NA==
X-Forwarded-Encrypted: i=1; AJvYcCVZLeK/DAXyY8ItzY0GtyHMz+gUfeZJjyCXLWTq7pHlH/n8nt47j69RmwsMRcUxdWS4Cto7gw5F7b0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV8SrIcd+CA2Z6SFUFPXVZ9QCGn1FeK1lxNAFrXzP0tAI5Jta/
	NEHlulTzTCW+k6EkhVhD6gZOuwyx1IW0Iok0tWuahNnhE0E0NAAleZmhLlIFCKc=
X-Gm-Gg: ASbGncvFmEA+N4Kv+gV3hrVGgpgft0hmoj01gy659k1zeWPnfO70SlKXV2l6w8nZdeA
	9lVDkkZqbI01gulf6ZX9tMSq4k1IA9WNVDgoUjyms1GY0zCHzLBXfRZAzvjBgb1CePkh5DTdH1b
	t/uge9BM8tjjVZCo3yz7+eeI0NGIHB3w3k7tiNkWU17tbdGzz9/W3ZMyiAt7zt+Svsnv8BBJAJU
	5RvJCwnlWnX52UZtVivBDua+lIIyBpyCYwotuai3n44Q/mymnR7o1aWow6QDt5glMjTIOzLv1mM
	DtxDFn6OYOY6JfFH13lyZ6dRtsVWwSZsRB/OgscXe54Dp5fd1EHEw4g87sJy1jSxwNs2GCm05jH
	Jus969DfjWriRTiZZ9g==
X-Google-Smtp-Source: AGHT+IGH7axJe7eTCwDAhgnxz/2TT8RhnJt+UseNxV/R3diYZCOSlRPsij/3sX+uVBgUHGoEXTkhpw==
X-Received: by 2002:a05:6e02:3e03:b0:3d0:239a:c46a with SMTP id e9e14a558f8ab-3d596114994mr121950535ab.9.1742769032889;
        Sun, 23 Mar 2025 15:30:32 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f2cbeb52f9sm1538014173.130.2025.03.23.15.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Mar 2025 15:30:32 -0700 (PDT)
Message-ID: <661457f2-aad9-4b3c-926a-6ee021355dac@riscstar.com>
Date: Sun, 23 Mar 2025 17:30:30 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 2/7] clk: spacemit: define struct k1_ccu_data
To: Yixun Lan <dlan@gentoo.org>
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heylenay@4d2.org,
 guodong@riscstar.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, spacemit@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250321151831.623575-1-elder@riscstar.com>
 <20250321151831.623575-3-elder@riscstar.com> <20250322155034-GYB11633@gentoo>
 <45526855-17b2-4de4-8e12-6320b7d84c8e@riscstar.com>
 <20250323130430-GYB15267@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250323130430-GYB15267@gentoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/23/25 8:04 AM, Yixun Lan wrote:
> On 07:43 Sun 23 Mar     , Alex Elder wrote:
>> On 3/22/25 10:50 AM, Yixun Lan wrote:
>>> Hi Alex:
>>>
>>> this patch change relate to clock only, so how about let's fold
>>> it into clk patches (which now has not been merged), so we make
>>> the code right at first place? cause some moving around and renaming
>>
>> No I don't want to do that.
>>
>> The clock patches are Haylen's and the are getting closer to
>> acceptance.  Let's not confuse things by adding a bunch of new
>> functionality.  Get those patches in, and mine can follow not
>> too long after that.
>>
> 
> I only mean patch [2/7], not all patches, as it's still clock related
> but, either way fine by me if you insist

I see.  It would be great for Haylen to implement this, it's a
better way to do it anyway--you can define the number of
elements in the array using ARRAY_SIZE() this way also (rather
than having to count them at runtime).

Haylen is welcome to use my patch as the basis of this, but
if it doesn't get into that code I'll add it.

					-Alex

> 

