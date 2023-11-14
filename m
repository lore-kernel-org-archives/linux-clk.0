Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19F6154B4
	for <linux-clk@vger.kernel.org>; Tue, 14 Nov 2023 13:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1EhKFpv9"
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9152D199
	for <linux-clk@vger.kernel.org>; Tue, 14 Nov 2023 05:10:35 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-32fa7d15f4eso3860930f8f.3
        for <linux-clk@vger.kernel.org>; Tue, 14 Nov 2023 05:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699967434; x=1700572234; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=kylEPySB/5FfOKILQp0wcgiznvVbaF9pAdNSaICh0gU=;
        b=1EhKFpv9vfdMGmBcW+Z6TL893F2Hhzoh1GYxTxra5II3v/4wLitzg9OdchqrJa72lB
         UUcga1gdhNnJ8ECeWztSYTaEusHoSoiSm/VXYa2o+Ov2pmh1V+yYlbr95WlXzbPBURB2
         fm0K3sI9kYbkraDxuPKPwVhp7mT7f7FsBZ2ljDLSm8ByFZ8VgBXIUdFXrYyREWuWzTNH
         C5d/taRxg1GuMUWmkhBc52FGzsWYe6JiXBRrnAAhmtSQyojaL708yvIGzYvjfNVMR6Et
         Y/AY5kXf7RClVstmBGvFEC85gZaUt++X/5KYV0jOin6ZZadaow+1+3GJhS4kVRuYoVQg
         vXgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699967434; x=1700572234;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kylEPySB/5FfOKILQp0wcgiznvVbaF9pAdNSaICh0gU=;
        b=bi3FlJ4uvRlLkRTCeMvZaKx0U4Sd4lxj7PIWJYxghCO0tbNntz9DQlUGl3MHwx6g16
         QXVtn0PRDMivf/+DYyQha/cPHA6kQELHInfkhApTwlL7JkUatyG97NLiLOYdsQnaca5h
         meqUGSJ+nGPZAxacxsMDVgmEkYmGb3ywe45NQXoJ5Tx03UhchAbkfWfxfDfldavKs0zM
         TxPHfB5Bo1y3XUgSA+yt2oXBSp+rbkajwGCvuq4tLCYU/h2fdfxX3CA2P7pt04jnYQOW
         N2guRNHPebXOglMWU4erv6cw2VfotYIAWSE6kd/AqOemTEY8S69wbTaEt4kYcHd6FniL
         mUHA==
X-Gm-Message-State: AOJu0Yy9MnyMiF1uH5NYCnkG/DVjlIVX9JGosFCCJ+8Z/5CSB/xAmveU
	AlRGW0aOkydoSAT0zY+6UQxIOQ==
X-Google-Smtp-Source: AGHT+IGziU1soHXdOrIYoiZhkJ3lrSemdXNvFyCejd2ntbWKzDN90NoFHYrl0P9aRWDq0a+dBQ2I1w==
X-Received: by 2002:a05:6000:4024:b0:32d:b991:1a71 with SMTP id cp36-20020a056000402400b0032db9911a71mr7443849wrb.0.1699967433842;
        Tue, 14 Nov 2023 05:10:33 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:8fe7:3223:c57b:4b01])
        by smtp.gmail.com with ESMTPSA id i20-20020a5d5234000000b003196b1bb528sm7843980wra.64.2023.11.14.05.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 05:10:33 -0800 (PST)
References: <20231106085554.3237511-1-xianwei.zhao@amlogic.com>
 <eab3869c-7529-484d-983f-dd85ecfbeb0b@linaro.org>
 <1j34xdcwf4.fsf@starbuckisacylon.baylibre.com>
User-agent: mu4e 1.8.13; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Xianwei Zhao
 <xianwei.zhao@amlogic.com>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chuan Liu
 <chuan.liu@amlogic.com>
Subject: Re: [PATCH V6 0/4] Add C3 SoC PLLs and Peripheral clock
Date: Tue, 14 Nov 2023 14:07:16 +0100
In-reply-to: <1j34xdcwf4.fsf@starbuckisacylon.baylibre.com>
Message-ID: <1jleb0bhvb.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


On Fri 10 Nov 2023 at 18:50, Jerome Brunet <jbrunet@baylibre.com> wrote:

> On Fri 10 Nov 2023 at 14:20, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>
>> On 06/11/2023 09:55, Xianwei Zhao wrote:
>>> The patchset adds support for the peripheral and PLL clock controller
>>> found on the Amlogic C3 SoC family, such as C302X or C308L.
>>> 
>>> Changes since V5 [3]:
>>>  - Fix some typo and modify formart for MARCO. Suggested by Jerome.
>>>  - Add pad clock for peripheral input clock in bindings.
>>>  - Add some description for explaining why ddr_dpll_pt_clk and cts_msr_clk are out of tree.
>>> Changes since V4 [10]:
>>>  - Change some fw_name of clocks. Suggested by Jerome.
>>>  - Delete minItem of clocks.
>>>  - Add CLk_GET_RATE_NOCACHE flags for gp1_pll
>>>  - Fix some format. and fix width as 8 for mclk_pll_dco.
>>>  - exchange gate and divder for fclk_50m clock.
>>>  - add CLK_SET_RATE_PARENT for axi_a_divder & axi_b_divder.
>>>  - add CLK_IS_CRITICAL for axi_clk
>>>  - Optimized macro define for pwm clk.
>>>  - add cts_oscin_clk mux between 24M and 32k
>>>  - add some missing gate clock, such as ddr_pll.
>>
>> Where are all these versions? Please provide links.
>
> I have provided some guidance offline at the request of Amlogic.
>
> This should have been v4 and the cover-letter should have summarized the
> change from v3 to this. Unfortunately it was sent as v6 :/
>
>>
>> Best regards,
>> Krzysztof

While labeling this v6 was a mistake, please continue from there:
next to be v7. Don't reset to v4 or v5. If more versions are needed, I
don't want to end up with 2 v6 on the list, that would be even more
confusing.

Thanks
