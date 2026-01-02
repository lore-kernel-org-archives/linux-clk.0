Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C857A27BF7C
	for <linux-clk@vger.kernel.org>; Fri,  2 Jan 2026 15:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767368555; cv=none; b=rkuPQg1fjes3KcP+m6TGUvE9hD0Xs5QUngRm3mIfsX1QV9z8Bn1isowLhFEZRA/rRPKQ8f0vsbBQ0sjtRHWAYvWLd+Rf1kqLyUnDK3zWgCCVh/uIXk2Dg1cpSgde9XJrHIKWl8o4bugChQ8Qcc9F9UP9SCPstChplOdtI9rvrZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767368555; c=relaxed/simple;
	bh=9fLuRCFFMaVEtZXeKLAir+rC4rOYTMPaqOnYEmL1WAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U3rkvd97oB3bm9R7TGj6sDjJxPArSz50egXoqhULmyiRCcw/4w7p/kU/TS2expLFkNeBAoROwYMmHa7vNetIC/qWzhMYSuKnQBbANYyAlas0KhyHYRNV2qkAyvja0miMXAH/eKNb0gaCEHtlhtak71TXB+90GdCYnTtK6NA0pTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=kbrtT95e; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="kbrtT95e"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4f1b4bb40aaso66057911cf.3
        for <linux-clk@vger.kernel.org>; Fri, 02 Jan 2026 07:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767368551; x=1767973351; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XUaW410yZnjl46gYHFzLMVokQz6be6dGpRuwVbnPCzc=;
        b=kbrtT95e5kziTXjrTYZFx38KaA2sWIhpZVjIdtQvHGcIrTqmZ5BatiDXwgMtNKROFB
         YkNijpVHcAruublw5D9aEhEkX/M8NzlPspeHSd0+r2l0Qb8V4JuhO8ZQUa9vbV59wL4Z
         fg6dkYWXFrEDycnlGlcLeoPi9F7U6SlX2wnve7GYSbqrswW1hs0CfKT0CCW8csgfczrn
         rbnctGuVXWa9YbDqj8cmk6hPpvHlP+agUhRb6ih1xlXDEuaF08Ofs5cjKWtFlrMc+Pa1
         XpA1yd9jgKNvr0+GpuYPXs2qqUBUFVFp7H/fEBuxzW4oIMIRrXc9u9la3rKvRUiuln4f
         7AGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767368551; x=1767973351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XUaW410yZnjl46gYHFzLMVokQz6be6dGpRuwVbnPCzc=;
        b=AsbIfGDopGPXgLiuUoQgHXwpCwFbMeTm082AqmnZxm2DD85MiuRW4eLzy5sFXv1iBL
         zBWeijreqef6W36HyfuACaytauV8LhBMrGMWP4UgY0+Q94QOaT7VnwssJKJxDPBhyokr
         X0H5qmw696ZKL9CfKEYjZI/fhPLz5qOhlOBBoUWwZePpVLzoZfzAxw8U9X0Xq1Uqlo6g
         79u5gSILD8ZijY6/3sH0GTUuTvwf7Hw2bL/eTkLdUVOjSpet7QXYDHXpFvRQHxv+z99M
         qQSyTH8YpCfVg0jkHdBIu+gO+XZc0RpT6Q+Kf3xyZknOstB+xcDwQJqt6zIxDCNzmL82
         UXRg==
X-Forwarded-Encrypted: i=1; AJvYcCVW6ctpfpRvTsDzk6orEeQkq11+PAU7NmXufN9Nx8sGRbkZInjU6uLuqlw4tazOYv69TviubgjQHSo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMk4csH6/cMUZRNs0uvrNpH7YiVKxYMXAnIZqjOZ65TLnT0rs3
	V/LHB283n3CgW394pAIVbIW/bJSvECM8sO5/Y/7MSAYt+e8vO7jRXFxPLGghe1c/oUA=
X-Gm-Gg: AY/fxX4qAWz7NLyivGrJSdm4e4exgB2EIFv/xiuIsKlLqjkLRajm4NK8+BHYBTZ4eYW
	lAuwQ8ytA1O1275DF7yX3SOWTDuhsoKPzQ0r7ITKm1MOv3vDbV4cggP40ZU6Xy7M+XEuSFOd83c
	Nih6A9TKsY16HLiR3KZaOCObEszRLa751r6pOukBjzu3LL2D0ep7Kr3sYCErvAfIRAMFItu+RJr
	cc1LEFBNRWHHr2rl1ohiwtwvgrgbH6gO0PAbKrHtCkIIouUbmimDNNnd1HWEVjSan5v3pvR6O2/
	yL81fSvem4e6k1ppNb9gqYAORbML+SSlr39y63SNdpevWkJc2VZNcjHrrmhnEaXo2BKBaLjXTgi
	8Hd4q31MYj7uUo1fNIi5KxttOaT5GUjX0ULTW89etvF53D52i6QzlvRwE0U/S0h5hp/DJs5ZqVF
	h4RgU8fAvu6j/08Lgp0/0mER77h4m5W94WSTiM5lngWTKSL2E8GxE=
X-Google-Smtp-Source: AGHT+IHtEl+Nsh7Sudx4gNAqVHpF5lV6u1SdMvxxbZdekk0b4Vk5JFG+dPcCu/VVDnvDpxsq/g1ikQ==
X-Received: by 2002:ac8:6044:0:b0:4f4:c150:7d1c with SMTP id d75a77b69052e-4f4c3ebfe26mr437680291cf.53.1767368550594;
        Fri, 02 Jan 2026 07:42:30 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d997aeff4sm326161116d6.29.2026.01.02.07.42.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 07:42:30 -0800 (PST)
Message-ID: <8241a2a0-62e6-4708-8cf6-58d0a59476ff@riscstar.com>
Date: Fri, 2 Jan 2026 09:42:28 -0600
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] reset: spacemit: fix auxiliary device id
To: Yixun Lan <dlan@gentoo.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Guodong Xu <guodong@riscstar.com>,
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
References: <20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org>
 <20251226-06-k1-clk-common-v2-3-28b59418b4df@gentoo.org>
 <546ab443-d0b1-4f21-856c-c74e84511d06@riscstar.com>
 <20251231020951-GYA2019108@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251231020951-GYA2019108@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/30/25 8:09 PM, Yixun Lan wrote:
> Hi Alex,
> 
> On 18:50 Mon 29 Dec     , Alex Elder wrote:
>> On 12/26/25 12:55 AM, Yixun Lan wrote:
>>> Due to the auxiliary register procedure moved to ccu common module,
>>> the auxiliary device id need to be adjusted, otherwise reset driver
>>> will fail to probe.
>>>
>>> Signed-off-by: Yixun Lan <dlan@gentoo.org>
>>> ---
>>>    drivers/reset/reset-spacemit.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/reset-spacemit.c
>>> index e1272aff28f7..8922e14fa836 100644
>>> --- a/drivers/reset/reset-spacemit.c
>>> +++ b/drivers/reset/reset-spacemit.c
>>> @@ -278,7 +278,7 @@ static int spacemit_reset_probe(struct auxiliary_device *adev,
>>>    
>>>    #define K1_AUX_DEV_ID(_unit) \
>>>    	{ \
>>> -		.name = "spacemit_ccu_k1." #_unit "-reset", \
>>> +		.name = "spacemit_ccu." _K_RST(_unit), \
>>>    		.driver_data = (kernel_ulong_t)&k1_ ## _unit ## _reset_data, \
>>>    	}
>>
>> The above macro is named K1_AUX_DEV_ID().  Why don't you
>> define K3_AUX_DEV_ID(), which could use "k3" in its name?
>>
> that should also works, the idea of using same macro '_K_RST()' here
> is trying to explictly tell users the clock and reset shares same name

You mean like "spacemit,k1-syscon-mpmu" is used, and you'd rather
name the reset "spacemit.k1-mpmu-reset" because it sort of matches
a little better than "spacemit_ccu_k1.mpmu-reset"?

Anyway, when K1_AUX_DEV_ID() was defined, it was named that way
to suggest a pattern that would mean K3_AUX_DEV_ID() would also
be defined.

I don't really care where the "k1"/"k3" goes, before or after the
period.  But I think the "k1" could be encoded explicitly here
rather than doing it with _K_RST() (i.e., don't even use a macro).

					-Alex
> 
>> Anyway, if you go this route I suggest you drop "K1_" from the
>> name of this macro.
>>
> or could further refactor the code, to make K1/K3 drivers share same macro
> 
> anyway I don't want to change this patch, my goal here is tring to fix
> reset driver after clock common driver refactored plus the modularization
> introduced, it's more proper to leave those refactor work up to Guodong,
> since he did a lot adjustment to add reset support for K3 SoC
> 

