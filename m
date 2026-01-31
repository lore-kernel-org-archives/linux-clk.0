Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAA52E6CC0
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 11:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769857883; cv=none; b=Mj3m4eZ5cbBYC3eJ/298VtC/yLFT0rw7p5mr8j0uy+n1oBRP/yG5vyunRl4kboBzzm9LT9VKP3C2fEYhPX5yzBLY6ZHCi9RlcMQdK8r6hrmLZO2EbrmZX/TTsYy4ccClhfvLhY6OjACfCPvK/qa/BxR/Dlz4YLU1UrB9LHFo61M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769857883; c=relaxed/simple;
	bh=ov3sqRfgOyNNwm7IEgcyswLjBIv71MHSmIMD3MTsrZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rdu8WybMc7mwsvSdblWJnRN7hxbTNLj6nqzv+yAWEW+WvctTEPrLXwbLp6MWkYQPGJX5TDTqzEUJTRBPNdxIDsiaTeFeQ99NScQ5XMaTNuli+xgwjOepV7H6Ze03+wJvHYdMrOSUKSbjqsPUZ797m6d1f7GGSaLGFGFRDZlf12k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=PKBJnnQ4; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="PKBJnnQ4"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-64b92abe63aso5646259a12.0
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 03:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769857879; x=1770462679; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ELZgLn75AQ+pskJlpMHIj5gZV10QNIQJqH6x9p2QeIE=;
        b=PKBJnnQ4ZqgTDGnmpxH1CEJcJZXd2Hkwz/07VRAMwFi2Fdaor34EQ8L84vqZ0xA9sw
         8GViZe4eluwdKL+uwhQHsJLB/ZXoo7BjCosIFp1HKQ8OCtlJtDPnHZQJLEEp0cskb+WP
         0Cn83u8AUfR4MSqWtJRUXhq7iWpkEyd7caAy+7tiBPMRELlsX3oqpPxMI8LuS1KX0H3T
         s5gCR7QUowF/czag9FCNIsjEaqVPgiywoHB62vpuYohiihaniRVvTybpOuALBbpimSh4
         Ne1Yh5Z8Rrvysv45G9dKSDaDr771vDqEau9mUx0wJr0BlyMwOnzV9TwnCLNCJBABp4QX
         Thbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769857879; x=1770462679;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ELZgLn75AQ+pskJlpMHIj5gZV10QNIQJqH6x9p2QeIE=;
        b=UEZW7HhY7Tr4Xzn/98UmNf0TGuv08YyRJLIYKJRAB9NdjKsbm0MRJWfY5tvPKvSWNN
         86fJZ6yxBJXZxgWqYH+rQLugZ7pqnGzRqCMye6tJKAfuruNOB1/hhOklrpPgS3kzSyPz
         QIUEiIwBOWSkNKKUAZutxSqlJ9t+5W4n3BWtybruyDHrzCrQ679i3NiVRzEocGxY/59n
         nLjsdaAYf1IU2j+Udck2y5bARKXSm08+xGhbPq8+K2+ZMAZzUhyQs0he+z2bxyucaMn4
         j/+Jci3NXCc4aGV5/QQZDpRjP3UxwispiqgCA1TsEBSmr67kos7C8f3XVziAdgcnr98+
         QvOA==
X-Forwarded-Encrypted: i=1; AJvYcCWZLNNuRi4ZqzTlpLdej81o5A/EUcEoqcW9wQybBRNWpNlufwi2OV5jPCavrXEMG2wKHUtw+waGQDE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPOxJmW9r1hCS+gcmI6oi52jZMtbOBsuJKRif0P6XmeA7aoCWj
	DVIs49rH+SfxngwqMfk/myn5aIjOb+HLWZWr9bSA9qiLHMGxbBCeqJRXfxLagtrkVOY=
X-Gm-Gg: AZuq6aIWyVctbTZ1C0r/ceI9s+gkCmpSQH0gkU4LP7xxrLaLDhUn4nRzN44xHKBQGd9
	k1xvsUb5MJkypEvaQzkSF01c/ltfChQ5QnnO8Jdaa6TTHckJwq4iVVPDXlsBEAIIVLfHaksLdz+
	/j9//JCGABxZpWMS+NOwdodp3oZmf5pllJ2MpAL45G/5B+jHc1Td0SwOD7Kz0wa2g/GMr1lXzSE
	SD62VxJl9HYMQ26VC9kX+XUTxxJQdxydxTCDULHg+2KMxBe7SP7/n+tghrxjOOXQCYL1rmzhbOT
	sOa2k45u2pic4KmOwg5AMhnXmT0MdCuxqw/cHMezbt33OmWumOV3NsI2h6UQYFtHxvhzqDqzrQ/
	dTU2kiJ0exklL6ezXcuwutoYrUGR7jeqTWb834RxOnuk0cTjCJnqNPOEqxo3Q2bYoROtgJ77zKo
	viWUp+JTFBlcL21xcjYbBS6IuF8Auua5ugit0=
X-Received: by 2002:a05:6402:26ca:b0:658:2f40:1f7d with SMTP id 4fb4d7f45d1cf-658de31630cmr3892847a12.0.1769857879069;
        Sat, 31 Jan 2026 03:11:19 -0800 (PST)
Received: from [10.100.159.246] ([213.233.108.212])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b469e80fsm4924999a12.25.2026.01.31.03.11.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 03:11:17 -0800 (PST)
Message-ID: <20a61488-ccd4-43d0-a1c1-1cc2d1dc52bc@tuxon.dev>
Date: Sat, 31 Jan 2026 13:11:14 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 23/31] clk: at91: sama5d2: switch to parent_hw and
 parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <df4421219824d026b0183d5469bbb658ffd7a40e.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <df4421219824d026b0183d5469bbb658ffd7a40e.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Switch SAMA5D2 clocks to use parent_data and parent_hw whenever possible.
> Having parent_data instead of parent names improves to clock registration
> speed and re-parenting. Update the clock registration functions to use
> parent_data and to use clk_hw Macros.

s/and to use clk_hw Macros/and parent_hw/

> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: Adjust commit message.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
