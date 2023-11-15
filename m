Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6E739F
	for <linux-clk@vger.kernel.org>; Wed, 15 Nov 2023 02:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="hf3MiDAI"
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F109C5
	for <linux-clk@vger.kernel.org>; Tue, 14 Nov 2023 18:15:21 -0800 (PST)
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-66d0c777bf0so38618296d6.3
        for <linux-clk@vger.kernel.org>; Tue, 14 Nov 2023 18:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700014520; x=1700619320; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1MSmTa/SaXp0ffMwVKsyznCoe5iJDVnuE9ssYFwaKy0=;
        b=hf3MiDAIF4P0DlKuygCBjELJ6YSBqR9BI6Xu1e4PLD8P1elgFX7/zQ0HcU2H+sn8rP
         c9tkUYCUj8nPxcQ4p9Kv2cC4L7cuBbwh0hmVqrYUTALQhIhWaeo/ky5+dgdZgu7aIOS2
         qdddam4T9JV23oAzWv7DyG71iVMydzsCbKXaeuOMKf7OBMJUARjJmdkQTf2LWQm8pLfK
         NM5jyScPCG16i5e4UPYvfQuux8I4cGS/jxCR+OqORugww3GDPcBwFpecTKgD3ybaOJ/i
         WVtZE072U1Y4knbVVEXN5km6vqiIMJeCBhEutQZtlmZ4xyZMWt2xm1a3mXDufE41Zde3
         vrbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700014520; x=1700619320;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1MSmTa/SaXp0ffMwVKsyznCoe5iJDVnuE9ssYFwaKy0=;
        b=xOEh+AAuc14nGCqYDmuZF907w6n7QvC3tkZQJkZAFXY+oluy0GHMWFicwPda3qG2zf
         C4h59WKWOZj5gLgJDpROraxFY0oDXcLGtTRHxoBmrNWcLC+TXC8Xz8ErX/aRY9VG/97N
         X94EhlvrNJeJDMTGFkUmPXx04L2cEZt9MX859/wD2oMU7ZD11tepWD10iU9RAftCTMKO
         d6XvDT/8OepXetGIXluj5aoEgCEZb1RtbTnpU/WymlaGVT7ys59X8yiHMx8QydvyHqLk
         EuHXGWZcMqF22bLNKGRR3YG/Ozh2ibmRqPWlD4QczJGToMr8ttk+zGxO4UCFJS/lDduO
         97TA==
X-Gm-Message-State: AOJu0Yy93C8gTHVoY0aw0lWnTtHO5a9NLj1eGv+htFSUQHQ5VR/CEA93
	a5s+pg9Za2zjPsJrMjIxJmqcpw==
X-Google-Smtp-Source: AGHT+IEFSDLxFpKfNFc8ycvrsyoEzsbrXROUde3bhQvq7qYNrIR46TUGX+gKo8UDgoBxVdyI0rfrtA==
X-Received: by 2002:ad4:4689:0:b0:66f:b009:fc3b with SMTP id pl9-20020ad44689000000b0066fb009fc3bmr4296026qvb.5.1700014520268;
        Tue, 14 Nov 2023 18:15:20 -0800 (PST)
Received: from [192.168.142.156] ([50.235.11.61])
        by smtp.gmail.com with ESMTPSA id d11-20020a0cf0cb000000b0065d1380dd17sm148577qvl.61.2023.11.14.18.15.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 18:15:19 -0800 (PST)
Message-ID: <68220eb6-8a20-42d4-83e5-d0d45b2f1404@sifive.com>
Date: Tue, 14 Nov 2023 21:15:17 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] riscv: dts: add clock generator for Sophgo SG2042 SoC
Content-Language: en-US
To: Chen Wang <unicorn_wang@outlook.com>, Conor Dooley <conor@kernel.org>,
 Chen Wang <unicornxw@gmail.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com,
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, richardcochran@gmail.com,
 robh+dt@kernel.org, sboyd@kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, haijiao.liu@sophgo.com,
 xiaoguang.xing@sophgo.com
References: <cover.1699879741.git.unicorn_wang@outlook.com>
 <25fcbab4c04bcbbdc4577dc58822540829f91dc9.1699879741.git.unicorn_wang@outlook.com>
 <20231114-grumble-capably-d8f7a8eb6a8d@squawk>
 <PN3P287MB032447BC501261D47E8E3124FEB1A@PN3P287MB0324.INDP287.PROD.OUTLOOK.COM>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <PN3P287MB032447BC501261D47E8E3124FEB1A@PN3P287MB0324.INDP287.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2023-11-14 7:34 PM, Chen Wang wrote:
> On 2023/11/15 1:31, Conor Dooley wrote:
>> On Mon, Nov 13, 2023 at 09:20:11PM +0800, Chen Wang wrote:
>>> From: Chen Wang <unicorn_wang@outlook.com>
>>>
>>> Add clock generator node to device tree for SG2042, and enable clock for
>>> uart0.
>>>
>>> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
>>> ---
>>>   arch/riscv/boot/dts/sophgo/sg2042-clock.dtsi | 76 ++++++++++++++++++++
>> There's no need to create an entirely new file for this.
> Agree, I will merge this into sg2042.dtsi in next revision.
>>
>>>   arch/riscv/boot/dts/sophgo/sg2042.dtsi       | 10 +++
>>>   2 files changed, 86 insertions(+)
>>>   create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-clock.dtsi
>>>
>>> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-clock.dtsi
>>> b/arch/riscv/boot/dts/sophgo/sg2042-clock.dtsi
>>> new file mode 100644
>>> index 000000000000..66d2723fab35
>>> --- /dev/null
>>> +++ b/arch/riscv/boot/dts/sophgo/sg2042-clock.dtsi
>>> @@ -0,0 +1,76 @@
>>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>>> +/*
>>> + * Copyright (C) 2023 Sophgo Technology Inc. All rights reserved.
>>> + */
>>> +
>>> +/ {
>>> +    cgi: oscillator {
>>> +        compatible = "fixed-clock";
>>> +        clock-frequency = <25000000>;
>>> +        clock-output-names = "cgi";
>>> +        #clock-cells = <0>;
>>> +    };
>> What actually is this oscillator?
>> Is it provided by another clock controller on the SoC, or is it provided
>> by an oscillator on the board?
> 
> This oscillator is an individual ic chip outside the SoC on the board, that's
> why I list it outside soc node.
> 
> Actually the "cgi" is abbrevation for "Clock Generation IC chip".

Since the oscillator is outside the SoC, this node (or at least its
clock-frequency property) belongs in the board devicetree, not the SoC .dtsi.
See [1].

Regards,
Samuel

[1]:
https://lore.kernel.org/linux-riscv/b5401052-e803-9788-64d6-82b2737533ce@linaro.org/
