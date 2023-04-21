Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4938C77B75
	for <linux-clk@archiver.kernel.org>; Fri, 21 Apr 2023 11:05:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231208AbjDULFz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 21 Apr 2023 07:05:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbjDULFx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Apr 2023 07:05:53 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D76FA5ED;
        Fri, 21 Apr 2023 04:05:50 -0700 (PDT)
Received: from [192.168.1.141] ([37.4.248.58]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MAfMc-1q0lrW2CjY-00B1GQ; Fri, 21 Apr 2023 13:05:30 +0200
Message-ID: <bb8bf083-1d00-616d-f25d-44b4b362399b@i2se.com>
Date:   Fri, 21 Apr 2023 13:05:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] clk: bcm: rpi: Fix off by one in
 raspberrypi_discover_clocks()
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Maxime Ripard <maxime@cerno.tech>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        "Ivan T. Ivanov" <iivanov@suse.de>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Dom Cobley <popcornmix@gmail.com>, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org
References: <5a850b08-d2f5-4794-aceb-a6b468965139@kili.mountain>
Content-Language: en-US
From:   Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <5a850b08-d2f5-4794-aceb-a6b468965139@kili.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:CQ0YM4GSV0XDqdNu4e3uiMJ+r1RDUIfRVgwvNT8+9Q8rs32aGhI
 basyO+nttfkSvq+yKSWd5BpSDnM4BsFiN9WNbT5SCYkKQUV8hnVQF8jQb8JbNwCOTdeFuB8
 r3tVCq7hbbbTnpq/9euhX61uwEJ1Tqh54RFQecJXC+JkzEhueNrWVwkeOIDqX2gvuKRE5Ew
 JtgZBIruRoSDGEZXLMRKw==
UI-OutboundReport: notjunk:1;M01:P0:qIwRPYCkjoM=;1/CRKEk9pp6U36vKDdsSD1qi6Yj
 xkSST/6PhyI1MRT85tSbTU4eCYwJvBYc8EOoXQE9dry/V1FNXq0EwX3m48UveDaAWXklGaZ5O
 feMmcV7NwuIyOR/6wE8vCj8a3e7gBma39QLxOI/Mqo6ilixtzluhQpOh46WcUSblD6rsQlY4j
 a86opJL9lf3860cLmrGe1gVxp0h1LqEZgyAafTAenrOiPwwETjkuJMM5PFyvON02EelE4Bw0T
 SqeoiQA7LALaqzj3wqQu3tQoJd58pSvwnQadUiEQlczMW7dcEm/w5ENCDzE21jmWP8uUl7Al3
 u/eSPxjTrjuZT/F0FakIlX1kI9+ZV+KWVj4TdEyJPlI9f2Nr6C56XsVPEhOkhsimAplBKL4eB
 16G5fk4laRHdDDpUfgOgHipZaz66X8Y57qfBemqzWgWqrQcDh/ZKCt0q8hMZFz3q4LCfw/9uq
 p2FaGi5AIH0fq+CN8o1/9Uyeg7fNhfJiubQj3YwKa1z/hK8ah8Q1dYvcEClC+Gx8nukf21rnT
 Wm0Gei+6Dot6sl/ZTTpatQUOnS+CrzNyafa/uC9c/K4ZOu1JCgAeHIgI2sLuVHPRl1195L8GD
 87mFwmS6stX8nSAhtB3r1zopi/TfvjmR42pPsXUobH2ku8zoVpJqwon/8d+YXURMcGzsiXlSI
 BCYhQQxOMddk0+rxAfSws0IDAplM46dJiegaIzrpng==
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


Am 21.04.23 um 12:41 schrieb Dan Carpenter:
> Smatch detected an off by one in this code:
>      drivers/clk/bcm/clk-raspberrypi.c:374 raspberrypi_discover_clocks()
>      error: buffer overflow 'data->hws' 16 <= 16
> 
> The data->hws[] array has RPI_FIRMWARE_NUM_CLK_ID elements so the >
> comparison needs to changed to >=.
> 
> Fixes: 12c90f3f27bb ("clk: bcm: rpi: Add variant structure")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Stefan Wahren <stefan.wahren@i2se.com>
