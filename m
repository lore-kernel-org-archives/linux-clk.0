Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91569376
	for <linux-clk@vger.kernel.org>; Fri, 22 Mar 2024 00:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711069064; cv=none; b=O5p92qO5CmBRUie8lWJE7vQKtWCL0BRcPNaaUJGvEumlkYbxITgT88gj//uoEtSNIFECjqfXVxs8S0t+u1ncpC/yOjVTZCz8VaGCdwoceA2+qYJBkvPSXAct6K/lfbXD7q/MLWtWA03JxSy74Nv04Rqn2k4/Zh/EaEeK9POipwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711069064; c=relaxed/simple;
	bh=RevR5eOTge8zeGDfDGwB4p/nUE4VH2riyxs2WTtFy0g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eGVaFiqzU5TItaLxHY5qL2dLztGW5gsMWaNTdfYiL85gH8hTS0c/PIhJcEoS+0srAfxvU5RWNVug0zmKEhd68fuA0bed1nmQxcjrIZIEyPNFW7Nt2AhYYTr65qLkRTAAsv1RaAwlU31LrO927RqXXgYkGSNzwVREohY2pqpW+RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WL5Jw/3c; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WL5Jw/3c"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-430ccb3d65eso11690931cf.2
        for <linux-clk@vger.kernel.org>; Thu, 21 Mar 2024 17:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711069061; x=1711673861; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9nC1qmkoOQNwjBOgTgEWpneXEGBCJVTyAYdBlacof6U=;
        b=WL5Jw/3cEK/T+Jhws0OjxJzDduPvN8qVGrKxfJDQU5bG4KIcKKsJsdN2lQ0dZsgILM
         nd+SpuLUREM//+NaT4b3MbAU0U79qabpIybb7gHlV3ZRwzSRpd1DfYZBA12hvWvrI0PM
         egLsLmtSmvfsRALH1YsIN23Wb61sN/KIi5XAJXRJOVGg0fbK8bb3TCiqlJMSxckQ063j
         UH8xgboR0PKqxTe4C8tbnMZKm80YU81fOYrqCkez0JaEO5Pw7MlKT0C0WDWDXgbUTGBz
         Wd0w1G2KnObPuCiFg6RxF6wQgWgJSViIsIvKDAsSlKVkgXCbEBa156nt6gY4j9tDDIYn
         h/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711069061; x=1711673861;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9nC1qmkoOQNwjBOgTgEWpneXEGBCJVTyAYdBlacof6U=;
        b=s61fGBfR89/VWtDg91GI66didmyP9irWQoebRh6YriH7LD6csoy8iz0sZd0uw9GKiK
         mrpbvf4F7r0+H0d9aR1RNo9gMljMYWj2ixbiREENnN5w/vF0Or1WGOjt7wVlamYy3sAE
         UxcAjQkAoNXLwbFesdY38723bY114e+HGzk0aRKeIg+6Je7FG+7f4FAjqJHtM9k84BMH
         BEcXhFXdu2i5qtThK48fFlfSyeT8dHCgj5iVqmHxDEWqN++NWjU+19Bz07ymP/Pgvjzm
         OZEFfLYXtF4YyTJ1WmvcM06Za6lqccz1xO49EAfXMaIUm2OvCXFgphminjonO6ylXGtD
         sdmw==
X-Forwarded-Encrypted: i=1; AJvYcCV9hDOXdjBJYTSrKk8iDeOhRmeIa42zSo18MVmND41yTT/D7+qVtTCDseKbDa4aOSp6YZhnnyVavdqGPe+b3LQEY3OS6CtYo+Pd
X-Gm-Message-State: AOJu0YyIlTsj3EFtDroHPaG+ZRNEP0H3LWZTmoYHVT2YFbhEOS6gwHxW
	rjuAtlL1/dOHDL68mG+4RmOwTtd8vj6A8cFiimFSsKxvcq+Z6P/l
X-Google-Smtp-Source: AGHT+IF5ssHLkMqE4xoBhvM8+1w71t35288yowP6I/lpUjXEu1GcU5TJGd3UgHL9BD2uYNUkc314LA==
X-Received: by 2002:a05:622a:2b0c:b0:431:30ba:e94c with SMTP id ha12-20020a05622a2b0c00b0043130bae94cmr169101qtb.64.1711069061343;
        Thu, 21 Mar 2024 17:57:41 -0700 (PDT)
Received: from ?IPV6:2606:29c0:1000:2088:97c5:2979:cbe1:b10e? ([2606:29c0:1000:2088:97c5:2979:cbe1:b10e])
        by smtp.gmail.com with ESMTPSA id fj17-20020a05622a551100b00430c76f0c86sm412077qtb.80.2024.03.21.17.57.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Mar 2024 17:57:40 -0700 (PDT)
Message-ID: <d784378c-61e8-4f66-9260-6452893a44fc@gmail.com>
Date: Thu, 21 Mar 2024 20:57:39 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 7/7] clk: rockchip: implement proper GATE_LINK support
Content-Language: en-US
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
 <7f4b3f38-50ee-480f-a341-ab577e19bb32@gmail.com>
 <2rsu6qa3pwbqic6b7ej6txa34jw4ztrnybzcfcfysue2mky37h@dyrdefbimzdn>
 <97f8b9e7-983c-435e-8fad-11e71be158b8@gmail.com>
 <vetdlmrlwx2bpwliof442zjiir7jy5irs737qu3v7qjhcvubn4@wslcvkis3tsf>
 <5287754a-e488-4365-9e88-811eb028a91e@0upti.me>
 <qepnk6poq6md5hewkf6otcjgeuj5mkf63azwzjqe75gbyi4fxm@6s7vijaz76uq>
From: Chad LeClair <leclair@gmail.com>
In-Reply-To: <qepnk6poq6md5hewkf6otcjgeuj5mkf63azwzjqe75gbyi4fxm@6s7vijaz76uq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Sebastian,

On 3/21/24 16:45, Sebastian Reichel wrote:
> Hello Ilya,
> 
> On Thu, Mar 21, 2024 at 10:01:10PM +0300, Ilya K wrote:
>> On 2024-03-21 21:31, Sebastian Reichel wrote:
>>>
>>> Ah, that was actually not setting up the clock links at all. Sorry
>>> about that. I reworked everything again and moved all the GATE_LINK
>>> code into the separate driver now. Please give it another try.
>>>
>>> Greetings,
>>>
>>> -- Sebastian
>>
>> Applied this to my 6.8.1: https://github.com/K900/linux/tree/rk3588-test
>>
>> As far as I can tell, literally everything works now - it boots, runs, and I can read and write the flash even with ROCKCHIP_SFC=m.
>>
>> Thanks a lot for digging into this, y'all!
> 
> Great, thanks for testing. Can you check if it still works with
> ROCKCHIP_SFC=m when applying the following additional change on
> top of your tree?
> 
> diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
> index fea7e7fcc4a4..f0eb380b727c 100644
> --- a/drivers/clk/rockchip/clk-rk3588.c
> +++ b/drivers/clk/rockchip/clk-rk3588.c
> @@ -2413,7 +2413,7 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
>  static struct rockchip_clk_branch rk3588_clk_branches[] = {
>         GATE_LINK(ACLK_ISP1_PRE, "aclk_isp1_pre", "aclk_isp1_root", ACLK_VI_ROOT, 0, RK3588_CLKGATE_CON(26), 6, GFLAGS),
>         GATE_LINK(HCLK_ISP1_PRE, "hclk_isp1_pre", "hclk_isp1_root", HCLK_VI_ROOT, 0, RK3588_CLKGATE_CON(26), 8, GFLAGS),
> -       GATE_LINK(HCLK_NVM, "hclk_nvm", "hclk_nvm_root", ACLK_NVM_ROOT, CLK_IS_CRITICAL, RK3588_CLKGATE_CON(31), 2, GFLAGS),
> +       GATE_LINK(HCLK_NVM, "hclk_nvm", "hclk_nvm_root", ACLK_NVM_ROOT, 0, RK3588_CLKGATE_CON(31), 2, GFLAGS),
>         GATE_LINK(ACLK_USB, "aclk_usb", "aclk_usb_root", ACLK_VO1USB_TOP_ROOT, 0, RK3588_CLKGATE_CON(42), 2, GFLAGS),
>         GATE_LINK(HCLK_USB, "hclk_usb", "hclk_usb_root", HCLK_VO1USB_TOP_ROOT, 0, RK3588_CLKGATE_CON(42), 3, GFLAGS),
>         GATE_LINK(ACLK_JPEG_DECODER_PRE, "aclk_jpeg_decoder_pre", "aclk_jpeg_decoder_root", ACLK_VDPU_ROOT, 0, RK3588_CLKGATE_CON(44), 7, GFLAGS),
> 

I can also report success with your latest tree.  It boots successfully and I
am able to interact with the SFC flash.  Looking at the clk debug info I now
see an enable value of 1 on aclk_nvm_root.

It also cleaned up the power-controller error message I had been seeing on vo0.
I just get the 'PM: genpd: Disabling unused power domains' message and no
further power errors/warnings.  So looks good.

I also tried the patch in your most recent message (removing CLK_IS_CRITICAL
from hclk_nvm).  My kernel is compiled ROCKCHIP_SFC=m. Everything still works
as expected.

So overall, looks great!  Thanks for all of your work on this!

--
Chad LeClair
