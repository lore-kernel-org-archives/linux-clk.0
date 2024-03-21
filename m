Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4991877
	for <linux-clk@vger.kernel.org>; Thu, 21 Mar 2024 02:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710989453; cv=none; b=rMWY5I2hFT2HVl5jRUrHiSW58OTS9uTnNVtJW4spvefWFVLqaG37jg+L2hP1ijU4xT0wI91klGAGgDjmiHvneaKYTQFVyuVoVKX4Ehkjg+1UwXhJpwNGk5hwimI6FbwHvupaHaTo+0wYIGhrC59gSSbrcym2RqnmS4OScqHB5fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710989453; c=relaxed/simple;
	bh=rwCpQv+FsCYueI3IQzqEVo/ru8GfTJBLEGDy3NCxcoI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mnBGkj39gQDPO4WpaFpnj3djWNdVTsrU0ECyIrILGXka4lod9jsn44dpFCpoBOlJhty5VvS3xxnW5I7jc4T5lpBcOrrb7WxqfGNPrxmrFJ/4H1doS3z374QWblfinXsc4h/2E70myYN80oXJWq2XD8elpakNCqJtmA1a91xtq0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y9Ej3tq0; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y9Ej3tq0"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6962950c6bfso5034156d6.2
        for <linux-clk@vger.kernel.org>; Wed, 20 Mar 2024 19:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710989450; x=1711594250; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tDDe9OS1xTeoPX5iiKtUDiky31WpE/pim88cOHUf8Zo=;
        b=Y9Ej3tq04aIVn8oUF9INo7AzYJrVw0E+b8FslJxrQAVd6OS7T2gmRE2xpcTdYTOhR6
         /JNjQkmFI6RDNknkwW/dId8+vDn0ZWswWi2tZUCiRmALDxk4x1C912lMKn9jmSSNoRSP
         GrcbOS4Q7uaqgQ3IPl5KPAWojQgddr7C84L5Q+qaNJlQ5P6U9WJkgCsSKqTM041pIZ8v
         zpjYPZA5eLulmcVKdYKQN2rxnsz/fVYLcWFkjBnGJPO+jkEScyAl/uUnyg3TN2mua76s
         NHZctycBjAAQsiYln50L9VKlSxAi9p5SI06QIReCmDRyUuyMqO109VNA7F3aCkRxS4Bz
         PYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710989450; x=1711594250;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tDDe9OS1xTeoPX5iiKtUDiky31WpE/pim88cOHUf8Zo=;
        b=Yqe8AY9QlWAEPrYLEuro3LAgKVPcKYsbtiW68pMtodhxblkD3+nNNX8+1KdJfn0G7x
         6HRLcTDsZ99xSEFEwHO0XCa8e3kRI/78cUauvXROqB3Rxo3c0+OxYv5UAuVVOlJpRegD
         t4tzN/8+iO+t78GjWh/Xzo4oCWdyKRSk68/X08a9DdlFfJ9gZ0x2rkLB5F0kv530/KJk
         lHdmVOIYtgCTPRzRb5sGlbATDRRLdsKQjqpVMBY0MAt6mcx/zOgSPaAmXQlpQBR5EOVe
         tr1YEA8VudtEJ75y+RWNNn/0WuxudLJMMiCUXs3qmB9/h/ja92tPX3CGGgEkyBgFiO/z
         By5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWjcIbP5PrSBPV3kEgS7cvp520WC1uiKUXb+RENfSmMjG9brctNWmrWaG3Z+fk8zx2pAqxrOegQ/3AwgHSEZSvI2Pe/zJ1/W5zD
X-Gm-Message-State: AOJu0Yz6Sb9iC4aM95WJlMn6kQTI+MobKlYJJsD1FyKCBe5GMS++XEmL
	tQbs9qcJlZ6EWyWENM+PpzeY2AZwmpMBVuPouKzfEhrd1++StlvB
X-Google-Smtp-Source: AGHT+IFlvOZFQvtjt6LVKrlDVfAoBlkTQ6kW3LNR3jbbwBLxVKKVMkDubLpL3E89nMFwrovIq4omgQ==
X-Received: by 2002:a05:6214:21a9:b0:691:639:2ddb with SMTP id t9-20020a05621421a900b0069106392ddbmr882062qvc.21.1710989450430;
        Wed, 20 Mar 2024 19:50:50 -0700 (PDT)
Received: from ?IPV6:2606:29c0:1000:2088:8b84:ea3:7f3d:8a76? ([2606:29c0:1000:2088:8b84:ea3:7f3d:8a76])
        by smtp.gmail.com with ESMTPSA id jz5-20020a0562140e6500b006961cdc3f7csm4386261qvb.85.2024.03.20.19.50.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 19:50:49 -0700 (PDT)
Message-ID: <97f8b9e7-983c-435e-8fad-11e71be158b8@gmail.com>
Date: Wed, 20 Mar 2024 22:50:48 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 7/7] clk: rockchip: implement proper GATE_LINK support
Content-Language: en-US
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Ilya K <me@0upti.me>, "andy.yan@rock-chips.com"
 <andy.yan@rock-chips.com>, "heiko@sntech.de" <heiko@sntech.de>,
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
From: Chad LeClair <leclair@gmail.com>
In-Reply-To: <2rsu6qa3pwbqic6b7ej6txa34jw4ztrnybzcfcfysue2mky37h@dyrdefbimzdn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Sebastian,

On 3/20/24 12:36, Sebastian Reichel wrote:

> I also worked on a cleaner solution for the issue you described and
> integrated it in the patch adding proper gate clock support. So
> please also test with HCLK_NVM not being marked as CRITICAL.
> 
> [0] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/commits/rk3588-test
> 
> If everything is fine I will prepare a v9.
> 
>> Hope this additional data point helps!
> 
> Thanks for the detailed analysis.
> 
> Greetings,
> 
> -- Sebastian


No luck unfortunately.  I still see the SFC dma timeouts.  It looks like
aclk_nvm_root is still getting disabled.  It now has both an enable count of 0
and a prepare count of 0.

Unlike your previous version, I _do_ see the driver bound to the device and
the rpm_resume() call finds its way to pm_clk_resume().  So it looks like
you resolved the original issue I was seeing.

However, when I reach __pm_clk_enable() it looks like the clock entry (ce)
is not in a good state:
  (gdb) print *ce
  $3 = {node = {next = 0xffff0001f0ce1930, prev = 0xffff0001f0ce1930}, con_id =
  0xffff0001f0a214f0 "aclk_nvm_root", clk = 0xfffffffffffffffe, status =
  PCE_STATUS_ERROR, enabled_when_prepared = false}

The immediate problem at hand is that ce->status is PCE_STATUS_ERROR so the 
switch statement will take the default case and return without doing anything. 
Also the ce->clk pointer looks like some sort of error pointer value so I'm
wondering if something went wrong in the setup you were doing in 
clk_gate_link_probe().

Note: I ran to that same __pm_clk_enable() breakpoint for a number of of 
GATE_LINK clocks.  They all looked to be in that same bad state.  I put the 
"aclk_nvm_root" one in the message here since that is the one that is most 
relevant to the discussion, but they all look to be broken in the same way.

Hopefully this gives you a hint as to what is going on.

BTW, In case it is of interest to you or Ilya, I have my "working" tree
available here: 
  https://github.com/sesca128/linux-rk3588/tree/v6.8-rk3588-test

My quick and dirty hack is at the tip of the branch. The rest is pretty 
much your rk3588-test branch from a few days ago. 

--
Chad LeClair
