Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F08C433EF
	for <linux-clk@archiver.kernel.org>; Tue,  5 Apr 2022 14:07:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235618AbiDEOJX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 Apr 2022 10:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352128AbiDEMI2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 5 Apr 2022 08:08:28 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AE1484EDE
        for <linux-clk@vger.kernel.org>; Tue,  5 Apr 2022 04:21:43 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id yy13so26044459ejb.2
        for <linux-clk@vger.kernel.org>; Tue, 05 Apr 2022 04:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8HBpgOGIWG9ETgsG7Wst3wSQlsF6QqlUH/m56PYbcF4=;
        b=r+WQ67jWrMQNbPPlSV6FaBSfL3cneBxyAUt8105r5J1wNlYb7d2d4cmBZogrNadtBD
         4wbXAeKy3Fu17tpfyBJprZ5HroGpb+HIUitxYNkt//jw3+QfW0dkNKorw/46F+jpI6fB
         ax8MJ3H3ufgSqV5PqItN5Skfbn/UhW0h9QMww4RXGg8rut3iqu7ZV0eBGk2oLAQOLXPA
         ahCOX/6pCMCF3W7Y8HbW8F11M4gLfIPaNB/LFi9mnznGKmrPHOsi5JPuzyyjElkWielN
         utf8nZEecvkvtE6HZ0eXr/nxd+eezu9DXFbd3u5FJhLEXmLGuBVeBwbz/gc4tlioJPO+
         pQfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8HBpgOGIWG9ETgsG7Wst3wSQlsF6QqlUH/m56PYbcF4=;
        b=nj5cWqest/eS0D5Yam+NoNgGAH0EQ4XcghW6BPIxnf8qpC7JAMarr3Kz/viOvnhRYC
         iJnJI0OJYgDeI4TxCnQKhbbixNkg162P/uuvkDb89dxqgFPEJAzJe5/5DQabZKGfGFEg
         EK1ax2N/p8RB43w8JP+mxkHu3NbHH1TF9Me+dmLpULQz7nmn16Z1wpbUK0TBintSZ1ZQ
         iABS9WUfIps+X2Oy0/qy5NlnMJc3Ch8+f714CDYfwnVdZlCNOhaYr1fXLO2coL3Qc/a5
         rXn4u0NPCfTEWQNKq9++MUJVgEj4BLO+297ohiIaJ9KgtlKdQGjOZ8GWokDObUO+38ls
         qyuA==
X-Gm-Message-State: AOAM533PF5PaKywQG8rB8um4NEsFilHzgS8cjMOysK9aWwSlpZqCQQcs
        CaozwSmc0zgpIov6NnjttYc1EV0LYFWveU12YRR02Q==
X-Google-Smtp-Source: ABdhPJyN6ppDedI3VMUC8U84lVxFeRBGhb1ZgnbQuS7fhmJY9CvlWntbMJkTzXTB78FnsDDUaV+P9/XPaAAp+5Wojlk=
X-Received: by 2002:a17:907:1b1f:b0:6e4:b202:db68 with SMTP id
 mp31-20020a1709071b1f00b006e4b202db68mr3138316ejc.294.1649157702311; Tue, 05
 Apr 2022 04:21:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220405082503.61041-1-iivanov@suse.de> <20220405082503.61041-3-iivanov@suse.de>
In-Reply-To: <20220405082503.61041-3-iivanov@suse.de>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 5 Apr 2022 12:21:25 +0100
Message-ID: <CAPY8ntArikrec3DOv_yB9kdhZex97B2aY5bfK7ye_fkjjRSgxQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: bcm: rpi: Handle pixel clock in firmware
To:     "Ivan T. Ivanov" <iivanov@suse.de>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Ripard <maxime@cerno.tech>, linux-clk@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 5 Apr 2022 at 09:25, Ivan T. Ivanov <iivanov@suse.de> wrote:
>
> The clk-bcm2835 handling of the pixel clock does not function
> correctly when the HDMI power domain is disabled.
>
> The firmware supports it correctly, so add it to the
> firmware clock driver.
>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/clk/bcm/clk-raspberrypi.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
> index 2e2491d85835..530820d13104 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -129,6 +129,9 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
>         [RPI_FIRMWARE_V3D_CLK_ID] = {
>                 .export = true,
>         },
> +       [RPI_FIRMWARE_PIXEL_CLK_ID] = {
> +               .export = true,
> +       },
>         [RPI_FIRMWARE_HEVC_CLK_ID] = {
>                 .export = true,
>         },
> --
> 2.26.2
>
