Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593744;
	b=IGdBWVTCMHBd09f7qbklJBXhLHWQC1qQcAiwtftyoaEqwdgGoxUHvgSu/tJ1rH5Bv8BU
	 qXL8N3hSFo1EIaDS7ug6QZ4Miu9WfILnhB3FchPxb6Ok40Cj87VIjmLWFYGfzkVvgzENQ
	 RGflkJvQcOQN+lJwHDp/EgGEB8k8AVOaHhmR/3lr5uH9MdBkQz0ywdz5jMXJC4yayxgvn
	 8KebJZA7JaH6YiFtyTehoGcqdi1sLYfat28NVZl8xTkQUWBVI0RiLdH0LEIalcJRSnX91
	 XrSnTpJ9OqC604VbDuDlI/AxWzbrfzwT18HqqYt0mRLJiCLBUz//AK2J3MQerc05zKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Qb0UkJf0VrVHdKGXACE+JKh+6CxNNCz7RSuZaWY+rFc=;
	b=xrwwhEYCMtGwY4AFMCWfNusL+h4WBZ+HZ8rGC5nifFvR0DC2C2TRmjZLG4RMnTJRQ0lr
	 6GFfPFI4KwWbX/6y8aXDVtrIa887cZ9nxhGpircrK0QUQVOnR9TBgkllD4gz61xj23Jho
	 2XklvG9NvEbmDXrMsFJEpbC75INPbZ5t98UZ0Nn2ipu+7z19bWgagzNNnVQcAcSYZsVFf
	 my50PtsgtW2NLa5Ci5SvFbxPGkhIn9r9efJxQ01IyOltseewkrsF7cnTufDHNfx6D6v8f
	 +wqBG//93dk1ZEy6EOT6388UmMnM+6VsCLL1sPBgGpHcQUH7eJl/I7A2Bx0dUmbMQ0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kTBcLH97;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7C0606B502
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 18:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B7C0606B502
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kTBcLH97
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdd89d84521so878573a12.1
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 10:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593743; x=1795198543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qb0UkJf0VrVHdKGXACE+JKh+6CxNNCz7RSuZaWY+rFc=;
        b=kTBcLH97rUrnJ4KURpQ1dhq3yExaNpCXKEffASOv9H47vMKspCGnaACNxMDNQw5951
         Dq+Lcn90SYUs/ohaGnBmt669QXi2WdG41vDvENc6ZPTZvPt9CnHL5+vG7rtwxU3ltH4K
         lGlOQbHZy84fitgauXGO2AOcVb+vaeGwHTSLI2k8D3sBppVN+chc1jekUcIJr8kUaZ9J
         /Cm1RT2l2UzMaD0dBgm1xy38IcVHz7cs5dMQqKv9yu8eIPdIUDmuq3rhhGrVj2N6G9DX
         isLUv0bCDHhBZnvjDBiTb1Nkqx/VBCsB6hPow7CZ0e9YOjthYYorGBq6y6aVuGOOaO7s
         R1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593743; x=1795198543;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qb0UkJf0VrVHdKGXACE+JKh+6CxNNCz7RSuZaWY+rFc=;
        b=zAdBt/x14MQSQSSYSbEGFEMG/OZ39a9v4zVTRFl2Dc1QWlX21HyVaxUPUjZeQ3q9WE
         2ZYoxy2vHjqPBvBoilf3i+3RN40Th72UvlPm1/xJ9VXnNpCfOT8oOqvLNjqyELms4RCT
         G55DVJ0u8yvTKuTjZZuUvazN/XzVH4kaNVPg9U7Z7qVbgJ3dwqVwgJ8y+kp6gOCzyWFo
         qgzo4T5jQvnZzKD1cqyRmWdBPiDtjotT0mz/I2xypb5a/lsKoWfpSXeI9sUVZokB5N8w
         upD2L5fcc7NavtVYWy3eatt/CrWpi60Gqh0xytPBw3mjkK02RC1iqGNnv3JjMdn/DwD4
         PKsw==
X-Forwarded-Encrypted: i=1; AL+hErGxWl7pjegQ7GgnjmOJ35cDpQ5YjwM1IKQ3s62DuMJf7tycHVcwc02VHQTmDxwcMy+sPSl5UNxpinY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Pv4jADiQ3mndALutxOqIoIxLSNWp8y/ZBt1s3RX5tQzOuJ8iK
	B2XO1cIsaPN7GG9pnok9nuPZiVp17j8qphQXUqMfmch5CK4nJYpimdWw
X-Gm-Gg: AYBFou0XAUMkUGi8Gn+2qOADYMQrbs61SlYogsLv/U0dsm3QMyrl5DF61CUdyLCF0Og
	oJJm7rwkgQ7bcdV438Tht5kSAhS+bItTApmhPMwks660ija6EpoOivBa1DSOvR+NzgU/vpON6Gp
	iaJ07rUQe5NNQVPTxhy+zJF2qfHfkTr8D/oIMyC2ckyzHzZOZ6EIdgftErINP9U14Dv4XjsSBJg
	PKoHhRvDI3RyVnrQ2JL8xvVanRNuJdEZuUFq7QCAqAoMYvmCU/QPaTIXH9lQE2T7aM6KmCxsQ1a
	NvGGegfUzpJhMQYLPyt1ILg2HFQLdIMrhthpdpi9E1LWoSnb2fOxsR+I2rUYSELrFJ83+p6g7s4
	yInAQCJKWrNKtDCtMk9kL7QRjfGMhkvsKqSZITTNI2fI2/aFuK8HJPir9HdXc6KbugIhYz3Zgpm
	b9NNZCTLErgLe38fuLZTuXolRNfBkIf/hTQoc9QoXr0WUc7Re64iTXgQfl4W1DLMKXD04Ugbz+F
	SyHffukKXCGWIarn77g6JKp8tGw9jHaS4E5l0CdY1/UxQoiYYfl6UUxHVLAEcWPzkofyiBV0kF6
	w23C8m3lyq1iD1bBvKkPBokNffszRUXd3PpcYnKAtdFzeVfKtB12LC5X
X-Received: by 2002:a17:90b:4f41:b0:3b0:a1c6:95ae with SMTP id 98e67ed59e1d1-3b1b0ccfbfcmr1844303a91.31.1794593743599;
        Fri, 13 Nov 2026 10:15:43 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb17042sm5421608a91.6.2026.11.13.10.15.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 10:15:42 -0800 (PST)
Message-ID: <85af50eb-9fe3-4327-b05d-18eda5993446@gmail.com>
Date: Fri, 13 Nov 2026 10:15:41 -0800
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
Subject: Re: [PATCH v4 2/3] MIPS: Ingenic: Add XBurst SMP support
From: Florian Fainelli <f.fainelli@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org
Cc: =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Burton <paulburton@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 hns@goldelico.com, paul@boddie.org.uk
References: <20261112184441.3724150-1-f.fainelli@gmail.com>
 <20261112184441.3724150-3-f.fainelli@gmail.com>
 <ea78059f26aa3e25822665a1a462951695bd1e80.camel@crapouillou.net>
 <18bc9378-3f8c-4212-98cb-40e876bf996b@gmail.com>
Content-Language: en-US, fr-FR
In-Reply-To: <18bc9378-3f8c-4212-98cb-40e876bf996b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 10:07, Florian Fainelli wrote:
>> Drop the macro guards:
>> .cpu_disable = IF_PTR(IS_ENABLED(CONFIG_HOTPLUG_CPU), 
>> xburst_cpu_disable),
> 
> OK.

On that suggestion specifically, the member cpu_disable does not exist 
when CONFIG_HOTPLUG_CPU is not defined, so although PTR_IF() evaluates 
to NULL, we are still trying to assign to a non-existent member, which 
won't work. I did make the callback always defined and used 
__maybe_unused instead.
-- 
Florian
