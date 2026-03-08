Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDFD331216
	for <linux-clk@vger.kernel.org>; Sun,  8 Mar 2026 16:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772988045; cv=none; b=LnaPUy1dOWYpRjbb4JRH7ia9kmS6Wmlq7Cbf/XATQ660j0YTPNIg2B/t30+DfVaEKsU7yjdS4JEkxF0Ks5zq0soJ9EVmUFP77pgalFbKxJQ5zbIY3qUeIop7WmL6Ln+N27wbkn+Zqdt5BwhiYKNLKV8D46p6EWNuqdpuZ2+cLaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772988045; c=relaxed/simple;
	bh=zn4Ro29sKafgC6ar+k3SGedz+twMxlFBK9evosd8IM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lNT+cL860Ez3EV4XyAYnIAze4kGlv8Vzd7rbZwjCUDYsUbIPrdQMt3eeXc2pAE4T4VjWWpnmqbIr7nas657ulx7O+O91d0ugo4Tb9eNBfnLPuZOq0LbD2BejwOm3ULe/XSCnVZyxSFTHC44wu1aMx2glggcsJGFYADQFKG/IOfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=cLyX4/DY; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="cLyX4/DY"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-483a233819aso107598495e9.3
        for <linux-clk@vger.kernel.org>; Sun, 08 Mar 2026 09:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772988042; x=1773592842; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3PyMN9ppxtG+J2rzulMPcaCg1huHspZ+ZEiksw/I16M=;
        b=cLyX4/DYL/ZGqGMgROxG+BOpxX9Hcvdzqcr+ruj48MoQzGEshXjp/O6ZmitdJgtU1Q
         6A6cPWQQ7NNnpREdIglQx9TvkGJW+cfbpaYh04rUY3MWmHx2eYQ30/3jUO5pHMuSiubm
         CovavZkPw7m86VSzcv8uowANoJuCJEA52/2lDGSZGCXAsBWGMr/xGfuFF159xcamclHM
         liw/23uCDVEQ0x0zfeXCRmCiNcoSQGAkEoDmoXc8ytUPfaOXkBDKvCYTxGtBHWl/Pa+E
         VnpbTLBuHWogcfDqG+nLhjUgruQHqc9KGwQ2ejP8/tWpwx/ptIbfJmqODpixwD3XByZJ
         HXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772988042; x=1773592842;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3PyMN9ppxtG+J2rzulMPcaCg1huHspZ+ZEiksw/I16M=;
        b=dfII2rrt4NtNfCr9E5NvUE26tRdqIuyV/az4zaYF5bCADo9fte100sDvZxeM1VLpwv
         Xd/CvYqCmx7Ez2vdI9u0Klszo2+aCzi6rpPoA6E7XwqMHrPOX9UeE4O05Lkq6JDKdOc8
         6bR5iODZT5fx334kP+bFzPTsuR5Bs0mw0gRlW7GFFoXOi4bU/0Z04LVkFrMjR6F7gI9J
         JCmfzmik9RAFWogCOD6voemmALtttHzytT9QkDrBVdud3hzCKtp/Ar1bRactojZftI3M
         NnL+2/cDUppvtkjG16jyLRqs3rfA6R5stE5fn2QSwloOXEvEA+xxjnnI9mfjpScHQdyn
         sxKg==
X-Forwarded-Encrypted: i=1; AJvYcCWk8zWfIGqevpZJ94U+iqtHKTwLsVc4qQr2BIyBrMJzKL2e2Sp7sI39qGYsJbchtNJ9gaou3O9FeVU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzROKJB6bo7o/U7HZrNDJEa3AljkJ0QDvUDpi448JhFXj/nj48V
	orddp4ZTOO2dZhgLiq9ZNQE3MgLpzo9jj2aqiQLeFR7/d2YFXPRr7ftL4JZAd/RCLVE=
X-Gm-Gg: ATEYQzz2b5CVowYWnXlUluvaxoUNvGY0BfEVdkxhYJg0dX47N7rozfpCMxSwRV0wULm
	ZH6nImAqQ4pNZxnerc2BwvbJPl1hiMAcM6sebcm+p1FyMR2sp6iWGlTfPyGMPEv3AWIi+keJzB0
	abKzI3a2ZsNwVDyySYPlb5ZziaWJJnRDhPBpYP9LV7h1lzrUOCUZiFt06lQips6SxKn/RWxhCj0
	w89Q5Qcn3vHmPpwCLYXfv1ibBS6fI1qEy17fbE76kAzsN4iXChGUbXZLElmfrjGa1XMbWmc8lK7
	Mkjve6Heabb31+mZWgnb7DXqzsZGBCRLNuScSxgELrBqvyncpTXSXtkqZl+pEGFnlIiwDGyl0Yj
	E4NmLwpERGra90RVjueAjRg8tG6n3/ywbDfnhQ6g6SuCw7yZvxhFQYZvERV7IjJ6W7rBDuNrJcR
	Vo4V37U3VdaUmGpP2J+684iN1Pev5zHA==
X-Received: by 2002:a05:600c:34d2:b0:483:badb:6191 with SMTP id 5b1f17b1804b1-48526923595mr140938685e9.8.1772988041927;
        Sun, 08 Mar 2026 09:40:41 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485244b6e9esm112420115e9.5.2026.03.08.09.40.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 09:40:41 -0700 (PDT)
Message-ID: <9157e13f-909b-430f-b2cf-b520bcbd56a9@tuxon.dev>
Date: Sun, 8 Mar 2026 18:40:40 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/19] nvmem: microchip-otpc: Expose UID registers as
 2nd nvmem device
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>, Alexander Dahl <ada@thorsis.com>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
 <20260120154502.1280938-8-ada@thorsis.com>
 <05128a16-553d-49d5-b09d-2c3e03cb4421@tuxon.dev>
 <20260220-maximize-glance-a0abd1806c44@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260220-maximize-glance-a0abd1806c44@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Alexander,

On 2/20/26 12:38, Alexander Dahl wrote:
> Hello Claudiu,
> 
> thanks for your feedback on this, see my remarks inline below.
> 
> Am Sat, Jan 31, 2026 at 06:11:56PM +0200 schrieb Claudiu Beznea:
>>
>>
>> On 1/20/26 17:44, Alexander Dahl wrote:
>>> For SAM9X60 the Product UID x Register containing the Unique Product ID
>>> is part of the OTPC registers.
>>
>> SAMA7G5 as well.
>>
>>> We have everything at hand here to just
>>> create a trivial nvmem device for those.
>>
>> Please massage a bit the patch description to match https://www.kernel.org/doc/html/v6.13/process/submitting-patches.html#describe-your-changes
>>
>>>
>>> Signed-off-by: Alexander Dahl <ada@thorsis.com>
>>> ---
>>>
>>> Notes:
>>>       v3:
>>>       - no changes
>>>       v2:
>>>       - Use dev_err_probe() for error reporting (thanks Claudiu)
>>>       - Move required register definition over here from removed patch
>>>
>>>    drivers/nvmem/microchip-otpc.c | 38 +++++++++++++++++++++++++++++++++-
>>>    1 file changed, 37 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otpc.c
>>> index 34c0d7611f3e4..b35ed13b004bb 100644
>>> --- a/drivers/nvmem/microchip-otpc.c
>>> +++ b/drivers/nvmem/microchip-otpc.c
>>> @@ -25,10 +25,14 @@
>>>    #define MCHP_OTPC_HR			(0x20)
>>>    #define MCHP_OTPC_HR_SIZE		GENMASK(15, 8)
>>>    #define MCHP_OTPC_DR			(0x24)
>>> +#define MCHP_OTPC_UID0R			(0x60)
>>>    #define MCHP_OTPC_NAME			"mchp-otpc"
>>>    #define MCHP_OTPC_SIZE			(11 * 1024)
>>> +#define MCHP_OTPC_UID_NAME		"mchp-uid"
>>> +#define MCHP_OTPC_UID_SIZE		16
>>
>> I think you can drop these as they are used (individually) in a single place.
> 
> If you don't mind I would rather keep it here together with already
> present similar definitions, instead of sprinkling new literals over
> this c file.

OK for me.

Thank you,
Claudiu
