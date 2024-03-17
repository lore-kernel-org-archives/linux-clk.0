Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D40225A8
	for <linux-clk@vger.kernel.org>; Sun, 17 Mar 2024 23:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710718486; cv=none; b=lDFH3Ou07H3fttd9y5CqTBh7qdDvvcr/WZJVuucfh0RCtiiB6xT108q44eymJQkTljh+wXplTFxXyu50eL/Dl16gxbtT8xO4UFy+Px7mnK55e0o6xyC8HmT4hzFyjQlWh1sEqhkYCxy4nnAQv4pPfyU7OUZpQjubLN/zsWVu+z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710718486; c=relaxed/simple;
	bh=4fkMhNog0d90gYWu/gq9uU4ORfbbDrBl4s0nSG+6XG0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZLuzFROHmv3GNWzApJLWX6l0w+H+4NQd+uAgBs9U+yQXIzPxsRiGv9BTkcMhrvVNwa2WmVVFS7tcZXa7HW3q91mrMWhmzjjLDfDfcUsOs91ErI+9rCgRKqzDj77g7Q/JBSoUzfbhbS9OnlPkch0gnvqLTaWsiJja0jhVraqKHSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JwNluP9H; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JwNluP9H"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-696147fb5a7so4623366d6.0
        for <linux-clk@vger.kernel.org>; Sun, 17 Mar 2024 16:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710718483; x=1711323283; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3TveCEvyF9dDgFbTi4nGtP9p64f4VQp+n7zIrjYtRyg=;
        b=JwNluP9Huagx8/kh4NawRgLSZ50J1q69EV9ZivPBdDzzuUzZjSVnPXtUDO6tFQGzJ4
         JKwnlXeGkIStvofL7+wt8f8HOYs863iOknFqnaV28UFBp5gszq1qvz8nmhZ20x/Vbrq8
         POt+ZbRrNHcJmD4pFzYaJ0c+danfq+KRCiAg7y96XLu3gj5XrC6AEjq4maRRzF1t3KAO
         McJV4xt0HJ+FrvpE7JNyWF4cgXhP7eSfjaFYznz33VwlPHroXipnyDVSfefpDkbcQzc3
         UhFuXK7doKZml9HAhTE+PBDN+7dC/gCYpp5qStd9OJYlJgO3bARtSE0jXcb8EQnqLFk5
         JWtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710718483; x=1711323283;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3TveCEvyF9dDgFbTi4nGtP9p64f4VQp+n7zIrjYtRyg=;
        b=HR9h5qNiOMFDau5wNBmGkJyZqky0xJ22Db3+sQoBTRIHfc3QUTquiv11O6S0TFpIn1
         U3Oxu7aVwgSUrEbCr+Obx07NgvzgEeMtx6tlMRjtOKQlTbLoQlgIOjVAbruFwAz2Qs5W
         kDcZsa8JcpkM0DcmADP2Tv1wunb4OlO4xtaMaP2RgT8L6JBEZ0zRFr61xJGA62qjO41j
         iQPeDaUQUv2KxchTzkrkIux5ZW301c4PaNWBEvK+8iU4HolxDtny5VNjDpHjQnORyKEq
         Kz1YbedouXvlxD30DTXzgYLeip/ZP0vx+Y5lLTHe6CDXXuK8LmhQ09K0stwwLlVUmQA6
         38KQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlesyr5BXLx4nPmncVwjJ9bGqH6CYARFSzd9pNptxlPIB9CLkpePwfjxeBcxUVn8ErHre7mmfd43bNmsHZzg3eKGsxZvq3WwrZ
X-Gm-Message-State: AOJu0YyXCKh8+BF0Oamr9ERUPWrRuuzjmUjtcnUnJ24zbJ4XZzptj0t+
	eihCGMBXjffcf9Z/xNTzGRfP8rouufQ/ZtFBykKJzdYVK6d1FVh7
X-Google-Smtp-Source: AGHT+IFR/BsGUFSs2+4cMobiqKN2WTO6zvP+QwUKKi6QPwaa1pIBcUH+6twCgw7fWqWtbVyFgXK+0Q==
X-Received: by 2002:a0c:fe87:0:b0:691:6bce:84cf with SMTP id d7-20020a0cfe87000000b006916bce84cfmr8073394qvs.17.1710718483289;
        Sun, 17 Mar 2024 16:34:43 -0700 (PDT)
Received: from ?IPV6:2606:29c0:1000:2088:2f7f:3a4e:b1cd:53db? ([2606:29c0:1000:2088:2f7f:3a4e:b1cd:53db])
        by smtp.gmail.com with ESMTPSA id 2-20020a05621420a200b00696143c7ed3sm1007883qvd.38.2024.03.17.16.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Mar 2024 16:34:42 -0700 (PDT)
Message-ID: <7f4b3f38-50ee-480f-a341-ab577e19bb32@gmail.com>
Date: Sun, 17 Mar 2024 19:34:41 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Chad LeClair <leclair@gmail.com>
Subject: Re: [PATCH v8 7/7] clk: rockchip: implement proper GATE_LINK support
To: Sebastian Reichel <sebastian.reichel@collabora.com>, Ilya K <me@0upti.me>
Cc: "andy.yan@rock-chips.com" <andy.yan@rock-chips.com>,
 "heiko@sntech.de" <heiko@sntech.de>,
 "huangtao@rock-chips.com" <huangtao@rock-chips.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "kever.yang@rock-chips.com" <kever.yang@rock-chips.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "zhangqing@rock-chips.com" <zhangqing@rock-chips.com>
References: <1456131709882456@mail.yandex.ru>
 <uwr335fla4nfvv3mdppcoly6hcsayav26r4r6txmbwrb25ftw7@rxwjtan7evww>
Content-Language: en-US
In-Reply-To: <uwr335fla4nfvv3mdppcoly6hcsayav26r4r6txmbwrb25ftw7@rxwjtan7evww>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/8/24 08:27, Sebastian Reichel wrote:
> [removed DT people from CC, since this is all about clocks now]
> 
> Hello Ilya,
> 
> On Fri, Mar 08, 2024 at 10:23:31AM +0300, Ilya K wrote:
>> This change seems to make my Orange Pi 5 (RK3588S) lock up on boot
>> :( Any suggestions on how to debug this? It doesn't really log
>> much...
> 
> I suppose with this change you explicitly mean the last patch, which
> has not yet been applied? That patch effectively allows some clocks
> to be disabled, that have previously been marked as critical (and
> thus always-on).
> 
> If that results in a boot lockup, I expect you have a peripheral
> driver, that does not enable a required clock (e.g. because of a
> missing clock reference).

Sebastian,

Another Orange Pi 5 owner here...  I likewise ran into trouble with
this patch.  I have been playing with your rk3588 branch from the
Collabora gitlab and was also experiencing hangs on boot on my OPi5.  I
bisected your branch and found that the GATE_LINK support commit was the
problem for me.

Digging in, I found that the problem behind the hang was that I was not
getting the aclk_nvm_root which in turn caused DMA transactions to the
SFC driver to hang.

...
[   2.804519] rockchip-sfc fe2b0000.spi: DMA wait for transfer finish
timeout
[   2.805127] rockchip-sfc fe2b0000.spi: xfer data failed ret -110 dir 1
...

Setting aclk_nvm_root to critical allows the system to boot.  However
not all is well as I do get errors like the following which also seem to
indicate further clock problems:
[   6.296554] rockchip-pm-domain
fd8d8000.power-management:power-controller: failed to set idle on domain
'vo0', val=0


I assume that the con-ops of your patch is analogous to the downstream
"clock-link" driver.  (ie. you are looking for PM events to cause the
pm_clk_suspend()/pm_clk_resume() routines to enable/disable the linked
(second parent) clocks).  This wasn't happening for me.  Unlike in the
downstream implementation, the gate_link devices' dev->driver pointer
was null. So that when rpm_resume() was being called, it would make its
way to pm_generic_runtime_resume() which then would do nothing.  The end
result is that I would have a prepare count of 1 on aclk_nvm_root, but
an enable count of 0 so it would get disabled (orig patch w/o marking
this critical).

I did a quick hacky proof of concept where I set up the pm ops on the
clk-rk3588 driver to point to the pm_clk_suspend/pm_clk_resume routines
like downstream did.  I used device_bind_driver() to forceably bind the
clk-rk3588 driver to the gate link devices it was setting up.

This worked for me.  With those changes I then was able to boot without
needing to set aclk_nvm_root as critical.  Further, it cleaned up the
power-controller error messages on the sdio and vo0 domains.

The force bind I did doesn't feel like a particularly clean solution to
me.  However, I am not knowledgeable enough in the (platform) device
model to know what the right way to do this is without fully doing what
downstream did and having DT nodes for the various gate link devices.
But it seems to prove out that having the driver bound to the devices
with the relevant runtime pm ops is the missing piece in my use case on
the OPi5.

Hope this additional data point helps!

--
Chad LeClair
