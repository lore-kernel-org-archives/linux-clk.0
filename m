Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03841C9ECD
	for <linux-clk@vger.kernel.org>; Thu, 10 Oct 2024 18:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584033; cv=none; b=lqGidLGlVMICEO+478b/Q6o3T+CyEjGwf4n9JVdXDiWz6fAsFFJEzjsl4HRwU+QFTFoDWLw666MLFvqlJDWET6rtZFsXe7B/RRM5PrgAFn0Si00dntjYnKUx920ktDjbBKIO820rpnanJYO6m+Lvr3NBvP3PjBbimPkagV/DGLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584033; c=relaxed/simple;
	bh=LcHcKl9/XI+oyPfjeeNaHZ4YLGnjbUE+QCQI11FraFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iPVjJ1PBeY2rQTad83YGGkwWlNr361Bm5/MQrEmWsuACjkyEo5LCn7wdmzhxjFiUoSBx3F71Kr5kgmxw+7EaV6XeiHC8TXfIxqNkG0r8RLl/ZNPsKjx1i5p7RkTpMk6nVIlM97ub+IbqRLo3ZxITBvNirbnNobG9Bf3mZZ4ZDMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=kRa9Act8; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="kRa9Act8"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c91d0eadbfso1649158a12.0
        for <linux-clk@vger.kernel.org>; Thu, 10 Oct 2024 11:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1728584030; x=1729188830; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l5b5bg6IlMCHuKDsr7EMlIZJHlhDd4v49aBt5FIXHaM=;
        b=kRa9Act8dw3REk5x0EsfK/zNomXUqcffChu1BHuD29WcbtZfENrG5ZDkMeWdGr2Rqq
         vzwjMy7nt00GoFBpqaGmgEI0HtEsp/6/PzV6PLJqsep02T42qoLLepNjsb+pw5UjdZ1i
         8/ops5KUxjlR2OvfFI51vu4FE7fBeP0wO7XQOmwgpPDHHL8HDom2MuoIry24Emvcll+i
         tlXbQrd0ixxs48mnmG+uX70GnN7Q1Q7Tfe9tCjRvkx7TrgqtOr3kI5JaekuoroV71KKi
         PiZPvNR8mDfyeEa/PUNTU0q1s2ka5hwNGtHyTwsKJrmsikoOslQNG2UXtTAR0oABJ7ke
         7j/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584030; x=1729188830;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l5b5bg6IlMCHuKDsr7EMlIZJHlhDd4v49aBt5FIXHaM=;
        b=RuLaU1VfA0uHHDDU5NcGhshYIyt6HaGSTF8jXS6nRsEtS3q1bFWmkZ1HMeTv6zyja2
         vVWI/b3E9QGFuWvRMBeZzrdCVYpFhXVCqe0fea0VGCO0qbFlmNrRsDztgV2rD+yDUTQP
         nNK7Wa2CzvJct+8TuWQds/e3PHXxBLs+LrwuQpYL0Rc9+HM0kX5nm+zheBUZ9w2N8+g6
         RZTw2XAsRRvxUY9EpEIzZQIs7ukBRm4i6kG9ibamu+cqCzcHrAbA1JAe3DKGNEIZ4hz6
         WJxxnhhmp0TJamw54oCM/s7LftgNGqDCgR2OT9oHqMh9MYoKnfp+ThCCgLC3RQR11Pzj
         jX1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVldVudd9hjQJBPbb9vmrJdWfkIGQFaVvB3RrzFqJP0CX8qFjBNPwghouVQwfHkn3Yy6TK/8UGfjdM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGNJFhTqhLsS5b4mSmCgl/OWN7ReUKjB9mmgvqgPK4BcJvqTC5
	k2AInkGYOkyujZxFy4Y+i3P/CxmMwU6sp/1X6Y8rqa8lFBiYS/qZGvFl4RhBgD8=
X-Google-Smtp-Source: AGHT+IHiJ9c9JsX6LkKAoH4kfF4CrwnhY2DrXX7mxd45mrnLUHEdoXVQPSxTSWMwcAQVhYbRULPSAQ==
X-Received: by 2002:a05:6402:13c1:b0:5c7:927:6a5e with SMTP id 4fb4d7f45d1cf-5c91d63dad5mr5342327a12.21.1728584029793;
        Thu, 10 Oct 2024 11:13:49 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.23])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c9372608f4sm1075771a12.70.2024.10.10.11.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 11:13:48 -0700 (PDT)
Message-ID: <d970e158-db74-4ffe-9fb4-57026ac0a947@tuxon.dev>
Date: Thu, 10 Oct 2024 21:13:46 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3]clk: at91: add sama7d65 clock support
Content-Language: en-US
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: varshini.rajendran@microchip.com, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <cover.1725392645.git.Ryan.Wanner@microchip.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <cover.1725392645.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

Can you, please, re-submit this series and include also the dt-binding
patch, to follow the process highlighted in [1] ?

Thank you,
Claudiu Beznea

[1]
https://lore.kernel.org/lkml/20240829-sama7d65-next-v1-1-53d4e50b550d@microchip.com/

On 04.09.2024 18:54, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Hello,
> 
> This series adds clock support for the SAMA7D65 SoC. There are also
> changes to the master clock driver and PLL driver in order to account for
> the increased amount of clocks being supported in this new SoC.
> 
> Trying to account for all the updates happening in this system, this
> patch set is based off of the most recent updates to at91-next branch.
> 
> Changes in v2:
> - Correct PLL ID from PLL_ID_IMG to PLL_ID_GPU in the description.
> - Adjust master clock description to match amount of master clocks 0-9.
> - Correct bad spacing and bad alignment.
> - Remove double variable definition.
> - Add missing kfree() at end of function.
> - Reorganize clk and pll driver changes in patch set.
> 
> 
> Ryan Wanner (3):
>   clk: at91: clk-master: increase maximum number of clocks
>   clk: at91: clk-sam9x60-pll: increase maximum amount of plls
>   clk: at91: sama7d65: add sama7d65 pmc driver
> 
>  drivers/clk/at91/Makefile          |    1 +
>  drivers/clk/at91/clk-master.c      |    2 +-
>  drivers/clk/at91/clk-sam9x60-pll.c |    2 +-
>  drivers/clk/at91/pmc.c             |    1 +
>  drivers/clk/at91/sama7d65.c        | 1373 ++++++++++++++++++++++++++++
>  5 files changed, 1377 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/clk/at91/sama7d65.c
> 
