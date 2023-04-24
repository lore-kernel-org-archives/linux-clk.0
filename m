Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C6F2C7618E
	for <linux-clk@archiver.kernel.org>; Mon, 24 Apr 2023 22:37:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232815AbjDXWhX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Apr 2023 18:37:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233134AbjDXWhE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Apr 2023 18:37:04 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06CA5126;
        Mon, 24 Apr 2023 15:37:03 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-63b7b54642cso3776359b3a.0;
        Mon, 24 Apr 2023 15:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682375822; x=1684967822;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TfVuBjqbPrda2V4JgOmJGuE9f+TlylUgWhlc/W6i9V0=;
        b=FPQSG90ZXSUc5P/yeV7Ty842LoGViNqLiRh835nar/kqyUOmMd3Sdfd473qwlVozKO
         G9fJYG46Ml8SwmmrRAXtovGGPNVv3BtZHM1l5+rkPfUvfi204l1aNR1eP03GEM4Eyca+
         l6e8tFFdiaah8ENGQ1jLztg8EbSXXtpV/DPEOGLK81XLZQO5tFxYBT6hyZQoQkyAyPkE
         sUnS3iP5uhRkjrsypQF5m3VmwyOQd7U4TKamduNKTYDV22X54R2uPf3OUaxzOyjUrzAM
         6Z4op/Cf5aC6TscrRxhdNgpoNxWrZkvN1PHv8kdAV1wgQ7/Xi5KB+BV3WGCWX+Y8BqaR
         2sew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682375822; x=1684967822;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TfVuBjqbPrda2V4JgOmJGuE9f+TlylUgWhlc/W6i9V0=;
        b=K5OnKvuwkmkMQ9frrzwU5Kl22tsjMTvruof3TNyrQO9EU9mnDapWXe1BNsLtCj+26+
         YHhmouBM/niPw/oLadvQRcvJOPot4tw9VkRxi0vz0TZg+liEleXht86uWsgeLIKEpXTE
         LQdHr3hYyl9vgZScrt4LZVzTrd8QM48HSO/C8tuzosxl8Yj16CAnEZbJjI/Uf/FIrHa1
         +9xw/TgMwJZwmuwUiediap633Ir0bJeYadMI5u492o8MjMjTmo11RlDBTTZargbSs/C0
         o6uggZ+2tsjptISLtWADPVQuQwh6Lg4NPTBUo18Ewwc0iaKukJfx+D8yvMcZraJ5N52Y
         ja3A==
X-Gm-Message-State: AAQBX9c1hRPetwNLlJ4HgFldVlpxmq/AzVMdl0KgU5cBLK5ye7ruUoMX
        0YwQuY+eUx2OkgZmC6sV43I=
X-Google-Smtp-Source: AKy350bQkD9qEKt0AXaIEoQV+2YVispEViRqtBeF0JlyRIcvdnq3SzLC7lBttdklkKb+7Mpd7n7YGQ==
X-Received: by 2002:aa7:888a:0:b0:637:f1ae:d3e with SMTP id z10-20020aa7888a000000b00637f1ae0d3emr21117099pfe.25.1682375822356;
        Mon, 24 Apr 2023 15:37:02 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id i64-20020a62c143000000b0063d328a690fsm7821812pfg.25.2023.04.24.15.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Apr 2023 15:37:01 -0700 (PDT)
Message-ID: <185ac214-a94e-682e-0ec2-2beb25ec16fb@gmail.com>
Date:   Mon, 24 Apr 2023 15:36:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] clk: bcm: rpi: Fix off by one in
 raspberrypi_discover_clocks()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Maxime Ripard <maxime@cerno.tech>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        "Ivan T. Ivanov" <iivanov@suse.de>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Dom Cobley <popcornmix@gmail.com>, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org
References: <5a850b08-d2f5-4794-aceb-a6b468965139@kili.mountain>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <5a850b08-d2f5-4794-aceb-a6b468965139@kili.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 4/21/23 03:41, Dan Carpenter wrote:
> Smatch detected an off by one in this code:
>      drivers/clk/bcm/clk-raspberrypi.c:374 raspberrypi_discover_clocks()
>      error: buffer overflow 'data->hws' 16 <= 16
> 
> The data->hws[] array has RPI_FIRMWARE_NUM_CLK_ID elements so the >
> comparison needs to changed to >=.
> 
> Fixes: 12c90f3f27bb ("clk: bcm: rpi: Add variant structure")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

