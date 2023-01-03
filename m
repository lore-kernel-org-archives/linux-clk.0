Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AB46C46467
	for <linux-clk@archiver.kernel.org>; Tue,  3 Jan 2023 10:07:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236795AbjACKHC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 Jan 2023 05:07:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237156AbjACKGv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 Jan 2023 05:06:51 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93897317
        for <linux-clk@vger.kernel.org>; Tue,  3 Jan 2023 02:06:49 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id bq39so37200371lfb.0
        for <linux-clk@vger.kernel.org>; Tue, 03 Jan 2023 02:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Harn0LEJiZj/xDCLas9oZIUN/0LS23MjRIe9IloRje0=;
        b=HUmc0XxZMx3uqvUu6gzolTIWZLE9B6TV+uGvxlAWCsDsvGskgzk+Dgr0azjM2s5se3
         /0D9bc4iluznS10FFq5Fpf+TJ9wAMb+9DCFoV2FLv519yswin1ql1ljIxPSOfzdxwqk8
         ffe40U66UOyW06Vkki1ni4Q2lp4Yl0Eqh6rS8FssKC0uVt4P2NkAP1/eyUYoBW5Ag3s/
         1piQDPIy0NtPgGWLREbIGKCJ4iueaS+g7MjfuavIFob02qXuoLBlA+iltcp2P8MXGEM+
         jM0qJn2gjd2jk6V1Y1FlKJ7uL1fmp1mGNzg2hJchmbMaWucVD9QVMuYPv+SUl1hEGPke
         iQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Harn0LEJiZj/xDCLas9oZIUN/0LS23MjRIe9IloRje0=;
        b=gMmUB0oePxhB7set0rOl9L5hxetUv84zt9VeQzlagOd5S2E9orYvVROEkx5KtH61Vt
         9HVqFAFp5HqWstvGq1OmPVvavF6LjANT1NhhkF4RYJS2BHPndkuB2lVkeRhQxgvLJMMs
         U6WeNyV4NCsrsexKrwypp1aHocK7FILoxoft3OTq37ALPogIOh/AoaJpTN3ucEyP50Bz
         NoqcPLW2BG4l9JhVLINkH+W0dnYe0aMk4MZxqS2KWCSymwaflpCqg9Jh3utCldGumG8T
         t3Z30xLPPrVkD7oBaZzPqxdRD7Tm5d/vE9PQs/jrgW0xAGG74wh89Y6rnn3ewhybAS9Y
         Oh6g==
X-Gm-Message-State: AFqh2kr/H67TgPGh5pJaWjjx/qfZgVpn5w0WDntDkBPCJ+5cj1qMOKqL
        YIUlVGdLWbuTIKSQasrx8owp+w==
X-Google-Smtp-Source: AMrXdXvEPY59eSk1iclXUFN9OAa6OoFtrMhKKCCsYv62GyqVFoKuLKurV5VgkSgz0eMl+QPe4s8Cjg==
X-Received: by 2002:a05:6512:6d0:b0:4ad:6f9b:d683 with SMTP id u16-20020a05651206d000b004ad6f9bd683mr13709576lff.1.1672740407871;
        Tue, 03 Jan 2023 02:06:47 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id z8-20020a056512376800b004b52aea5ff8sm4754152lft.30.2023.01.03.02.06.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 02:06:47 -0800 (PST)
Message-ID: <9054a7cd-2993-840f-1f4b-7837b43a1800@linaro.org>
Date:   Tue, 3 Jan 2023 11:06:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/3] memory: atmel-sdramc: remove the driver
Content-Language: en-US
To:     Claudiu.Beznea@microchip.com, mturquette@baylibre.com,
        sboyd@kernel.org, Nicolas.Ferre@microchip.com,
        alexandre.belloni@bootlin.com
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20221208114515.35179-1-claudiu.beznea@microchip.com>
 <20221208114515.35179-3-claudiu.beznea@microchip.com>
 <2f9793fb-8840-fd3c-8af1-42c6c11ed475@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2f9793fb-8840-fd3c-8af1-42c6c11ed475@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 03/01/2023 11:00, Claudiu.Beznea@microchip.com wrote:
> Hi, Krzysztof,
> 
> On 08.12.2022 13:45, Claudiu Beznea wrote:
>> Driver does only clock request + enable for DDR clocks. DDR clocks are
>> enabled by bootloader and need to stay that way in Linux. To avoid having
>> these clocks disabled by clock subsystem in case there are no Linux
>> consumers for them the clocks were marked as critical in clock drivers.
>> With this, there is no need to have a separate driver that only does
>> clock request + enable.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> 
> As this patch depends on patch 1/3 from this series, can I have your ack
> for it to take it though clock tree?

Uh, why does it depend? I understood the changset is bisectable and
removal of unneeded driver will happen later. Otherwise it is not
bisectable...

Best regards,
Krzysztof

