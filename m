Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1128FEB64DC
	for <linux-clk@archiver.kernel.org>; Thu, 20 Jul 2023 09:38:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbjGTJim (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Jul 2023 05:38:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231184AbjGTJh7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Jul 2023 05:37:59 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F344746AD
        for <linux-clk@vger.kernel.org>; Thu, 20 Jul 2023 02:33:06 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fba8e2aa52so4871975e9.1
        for <linux-clk@vger.kernel.org>; Thu, 20 Jul 2023 02:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689845583; x=1692437583;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0I/iaPEzUEhsk7qMRr53QBuJ7Bxl0Kbw3PT2/wYCuU=;
        b=2X+zhDlo5wXDWQMt5yn9fl7RnbGUecReZNoJEiI57fLEAVM+LThrgRagS36eErFlL5
         dug/3YWfk/G6c4LaPZBStvk4jMn2YlSukqK1IRNZ/dBQQPy1vsEKVHPeB9aHLEMnLyGS
         vlrEyN7gLleaIm+ErmEJMsaE7ZWYvMT635uA2detnQtc5wQ8bkpjjBcHNAuC4RA0k894
         u6LiO6aBNa3/Hqchkgm8uHN14D54G6Z7kg6bQPXa7HNJhVFbZmYIwYS+jC4dloMZLeb3
         MfXAf72x0NuznNgLsuB7VKjvrEcP/aMgfHcee6ExGTpIwN782sjk1V1OdipRLRtBRvH7
         gH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689845584; x=1692437584;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0I/iaPEzUEhsk7qMRr53QBuJ7Bxl0Kbw3PT2/wYCuU=;
        b=Qbqvs/qDSEWb2L1makGPd3ti/wm0lrBpd3ORmTbehyEmbEuA0VzMdozzej3VO4GYYl
         HISq8aLlCQp5Nn2PbO3r6klQnqDzX3sroCtjbZlYMK4ePCC3/tGOqiyiHOq7oA83kePH
         KrfRhUdX7+hEmCyESVmMqfdCU/4yc3obPL/y3Cobqo2HVrpodLo3ZHm43Jp3hafSs5L5
         E9hFQmWtgz5K/aynQO7y6uqFnt0JM8h77klNk2srqTlD+SB5hW+6jksoOP49+E4scJmi
         ei9dMNo3L2beUSekH/vvKf6WesW84qxjxWhH864CfwewpHL0l+EXd9o4T2+CtJ3etpzy
         EF0w==
X-Gm-Message-State: ABy/qLYbKewOL0mQUIDl51FJYHGq+ai3UTCDg3BL739ILndS0LkZlSmi
        1NEwYAi7KwHY3O4b0jsLCUwR3g==
X-Google-Smtp-Source: APBJJlGhEUTy8yPCE0oYTy5atycBVh9x5P2zg+Y+2dW9AT3Q1LxA7UePnVPV5JA6RXZ+MkhAmTBd8w==
X-Received: by 2002:a7b:c850:0:b0:3fb:c990:3b2 with SMTP id c16-20020a7bc850000000b003fbc99003b2mr1349366wml.34.1689845583604;
        Thu, 20 Jul 2023 02:33:03 -0700 (PDT)
Received: from localhost ([82.67.6.57])
        by smtp.gmail.com with ESMTPSA id m10-20020a7bca4a000000b003fc00702f65sm3428984wml.46.2023.07.20.02.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 02:33:03 -0700 (PDT)
References: <20230704215404.11533-1-ddrokosov@sberdevices.ru>
User-agent: mu4e 1.8.13; emacs 28.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Dmitry Rokosov <ddrokosov@sberdevices.ru>,
        neil.armstrong@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc:     jian.hu@amlogic.com, kernel@sberdevices.ru, rockosov@gmail.com,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Jan Dakinevich <yvdakinevich@sberdevices.ru>
Subject: Re: [PATCH v2] clk: meson: change usleep_range() to udelay() for
 atomic context
Date:   Thu, 20 Jul 2023 11:32:44 +0200
In-reply-to: <20230704215404.11533-1-ddrokosov@sberdevices.ru>
Message-ID: <1jsf9jnd0x.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Wed 05 Jul 2023 at 00:54, Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:

> The function meson_clk_pll_enable() can be invoked under the enable_lock
> spinlock from the clk core logic, which risks a kernel panic during the
> usleep_range() call:
>
>    BUG: scheduling while atomic: kworker/u4:2/36/0x00000002
>    Modules linked in: g_ffs usb_f_fs libcomposite
>    CPU: 1 PID: 36 Comm: kworker/u4:2 Not tainted 6.4.0-rc5 #273
>    Workqueue: events_unbound async_run_entry_fn
>    Call trace:
>     dump_backtrace+0x9c/0x128
>     show_stack+0x20/0x38
>     dump_stack_lvl+0x48/0x60
>     dump_stack+0x18/0x28
>     __schedule_bug+0x58/0x78
>     __schedule+0x828/0xa88
>     schedule+0x64/0xd8
>     schedule_hrtimeout_range_clock+0xd0/0x208
>     schedule_hrtimeout_range+0x1c/0x30
>     usleep_range_state+0x6c/0xa8
>     meson_clk_pll_enable+0x1f4/0x310
>     clk_core_enable+0x78/0x200
>     clk_core_enable+0x58/0x200
>     clk_core_enable+0x58/0x200
>     clk_core_enable+0x58/0x200
>     clk_enable+0x34/0x60
>
> So it is required to use the udelay() function instead of usleep_range()
> for the atomic context safety.
>
> Fixes: b6ec400aa153 ("clk: meson: introduce new pll power-on sequence for A1 SoC family")
> Reported-by: Jan Dakinevich <yvdakinevich@sberdevices.ru>
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>

Applied, Thx

> ---
> Changes v2 since v1 at [1]:
>     - remove redundant SoB from commit msg
>     - drop unuseful reference to clk_core_enable() from commit msg 
>
> Links:
>     [1] https://lore.kernel.org/all/20230703200404.20361-1-ddrokosov@sberdevices.ru/
> ---
>  drivers/clk/meson/clk-pll.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 56ec2210f1ad..eef6f37c8d8d 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -367,9 +367,9 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>  	 * 3. enable the lock detect module
>  	 */
>  	if (MESON_PARM_APPLICABLE(&pll->current_en)) {
> -		usleep_range(10, 20);
> +		udelay(10);
>  		meson_parm_write(clk->map, &pll->current_en, 1);
> -		usleep_range(40, 50);
> +		udelay(40);
>  	};
>  
>  	if (MESON_PARM_APPLICABLE(&pll->l_detect)) {

