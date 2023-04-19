Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE92BC77B73
	for <linux-clk@archiver.kernel.org>; Wed, 19 Apr 2023 15:55:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233706AbjDSPzn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Apr 2023 11:55:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233605AbjDSPzl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Apr 2023 11:55:41 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECEE561B3;
        Wed, 19 Apr 2023 08:55:36 -0700 (PDT)
Received: from [192.168.1.141] ([37.4.248.58]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MKKlN-1pbk8T2YO7-00Liy8; Wed, 19 Apr 2023 17:55:14 +0200
Message-ID: <1dcd711f-681a-a80d-4007-b808a29e46b9@i2se.com>
Date:   Wed, 19 Apr 2023 17:55:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] clk: bcm: rpi: Fix off by one in
 raspberrypi_discover_clocks()
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Maxime Ripard <maxime@cerno.tech>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        "Ivan T. Ivanov" <iivanov@suse.de>,
        Dom Cobley <popcornmix@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org
References: <9d4496c2-e102-4fc6-afe2-5a917930d15a@kili.mountain>
Content-Language: en-US
From:   Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <9d4496c2-e102-4fc6-afe2-5a917930d15a@kili.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:uH5fIfUmZHx7tfVaT8DUZ3SZefMG4UEeNkEX4vQxqgYVFrvJg50
 +vIp3nXgrlW1DhF1TNZOK61NVcPQK/7Ih47M6p86EnJg4DUM8upHUZoWY9MrXiKVAYxYnKm
 jTC4YlyPGiNNz+0VcFyMiyzQGcx34KbG9KilGOTBefhq1FTmpIYOVwkZnQut5JUPx+fKULx
 XNq4zfrDtrMQuLN66oowA==
UI-OutboundReport: notjunk:1;M01:P0:8kHETrSuQ+Q=;9jtWSrAHHqtrXqADL8qYyoRZ0V1
 /lA6NGzbw2I4eeEWCy1R7NxO7WwtDCbXS3bK0VLDNJk1NaE5Wqp9Uf+QBp0DWKP6NqWnCoIYv
 CBrzQO5Y0Y1P9CSJtWVnrL6cHBNVZTaLT8Vwbd4DD2EPOJZPH7pwGc+fMqxnfgQD/7/kCtFaY
 dJhT62Q+W2q72BQPfXBQE4zraOe6nIb/KJvb7X46bMfOAhVUX376cXRVNYrBvj5zu0+A7WY6+
 oCcgMioZtIOHLPNDe3UAxQ8mem62VLhJv3GVAFZY9z9Y/TirPhXSNla6zZwBAcUOuUcVG+mmu
 2umP7Ibkc+JGH1GIFAoAU/tstTdkYtvyey02BQr+s81tiVEIThK6jyKqjmo+fk/VDFxwvVo/h
 VJYQOsGFXsVs+Swo8HPyFn9d8P/+tmKD2BK9fvz4j12oqqXHSRSyykDXY32mSfXNBsayE4DER
 RWuo2x8xavIgA0MhXswMww+ocoTi05zxJ6D5CQvOWOHpz8fs8ne3VETbD/lTYVZiQQwNKjQIx
 UnQrzP29Af30ieA6j7poIO96okexm/5JIpPJOoPuwfBqfHZPaAb5XTQKOEab9SQlfwPx2UmAy
 IUoMsWfqznat9H/6OnGrOfN07QEWER5XbBMetAtMjM8uvZ22evnXAXjnIIcJ0HV6XHEfhwb2u
 dcFmvMWbNZbyQS2iVQeWnHjALa/TXagRSzpZp50WyQ==
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Dan,

Am 19.04.23 um 09:56 schrieb Dan Carpenter:
> Smatch detected an off by one in this code:
> 
>      drivers/clk/bcm/clk-raspberrypi.c:374 raspberrypi_discover_clocks()
>      error: buffer overflow 'data->hws' 16 <= 16
> 
> The data->hws[] array has RPI_FIRMWARE_NUM_CLK_ID elements so the >
> comparison needs to changed to >=.
> 
> Fixes: 12c90f3f27bb ("clk: bcm: rpi: Add variant structure")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> The clks[] array, on the other hand, is correct.  It allocates
> RPI_FIRMWARE_NUM_CLK_ID + 1 elements because the last element is a
> sentinal.
> 
>   drivers/clk/bcm/clk-raspberrypi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
> index eb399a4d141b..d4b43e33035c 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -356,7 +356,7 @@ static int raspberrypi_discover_clocks(struct raspberrypi_clk *rpi,
>   	while (clks->id) {
>   		struct raspberrypi_clk_variant *variant;
>   
> -		if (clks->id > RPI_FIRMWARE_NUM_CLK_ID) {
> +		if (clks->id >= RPI_FIRMWARE_NUM_CLK_ID) {
>   			dev_err(rpi->dev, "Unknown clock id: %u (max: %u)\n",
>   					   clks->id, RPI_FIRMWARE_NUM_CLK_ID);

the change looks good, but shouldn't we also reduce the max in the error 
message by one?

>   			return -EINVAL;
