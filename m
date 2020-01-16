Return-Path: <SRS0=DYql=3F=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB1BAC32771
	for <linux-clk@archiver.kernel.org>; Thu, 16 Jan 2020 01:38:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7FB4B222C3
	for <linux-clk@archiver.kernel.org>; Thu, 16 Jan 2020 01:38:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="eLFvuZsy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729195AbgAPBiQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Jan 2020 20:38:16 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:34586 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729048AbgAPBiQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Jan 2020 20:38:16 -0500
Received: by mail-qk1-f195.google.com with SMTP id j9so17739157qkk.1
        for <linux-clk@vger.kernel.org>; Wed, 15 Jan 2020 17:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1fru5OiodLrKKngSwZ1rXnYTcEIToyQn7zBfis7QmWk=;
        b=eLFvuZsyTiRfK7UV4g57mGstNkFvCjCnxduScp0C7DmHg8+IwAh/uXtGCI29EKebne
         fW9BzLh3/yLSiMPYrCkLGzZpSvWgU6YjtlUL8Bb7V6Dx1R96ECCvlqpek3XmKqOl03Mw
         +nVOKn3pe9vKfZLSCrw4vL2kS5/Zx5kWaMk6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1fru5OiodLrKKngSwZ1rXnYTcEIToyQn7zBfis7QmWk=;
        b=UOsqctYx5gvlh0wR2RX+xa1r5i/y9qMspLFPwoR+W4O0ELB0RKWzpShqusif5ZWRKp
         FRrxIv9wK7wJb9+g+pMxCH5sN37RV+KTfzCC5FzRWy8UXHdx2Ur5K1ZTku54acLCifSW
         ZPQh+wsN9K9MS0l0B8tOEI2JiZ422q7GVWMw/PRa0FIir36vBlJUtNCZkkDYx7GlX2H/
         Wwm2BCoFhP5mhLIJrWf1X9wFXow104Ey4OdoF0STsv09/y/7KdpjItaqsC/1NbGh1wZZ
         xsC3UIlX8wjQpOE9joLSO49r8X5Z6w+SqivWduwQQua/XU4sq8Y4ZSAaqWaJnaKPCsjh
         Ampg==
X-Gm-Message-State: APjAAAXj61Bm/cvGZHa8kPbDGzT7yOMKavz5jDgFtjmOsCwmo8rlu7JS
        9JxzGKp9eod3PBOFgbgO2dgS6PO2FlWL2kNuhAs74PYD
X-Google-Smtp-Source: APXvYqwTAo+CmTUw+bJLllvdDSV6lyyIY62kprsec+Zi9ebDT80z5kEIrhWfU2baF0O9XaijPpjm3ylEz71Wg5G94fk=
X-Received: by 2002:a05:620a:849:: with SMTP id u9mr30843053qku.414.1579138694765;
 Wed, 15 Jan 2020 17:38:14 -0800 (PST)
MIME-Version: 1.0
References: <20200115212639.4998-1-jae.hyun.yoo@linux.intel.com> <20200115212639.4998-2-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20200115212639.4998-2-jae.hyun.yoo@linux.intel.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Thu, 16 Jan 2020 01:38:02 +0000
Message-ID: <CACPK8Xez9XQPQCsUU1Fu_POTJ3dh3tGJvK=otJdMYv40aZLqsw@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: aspeed: add critical clock setting logic
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>, linux-clk@vger.kernel.org,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 15 Jan 2020 at 21:25, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> This commit adds critical clock setting logic that applies
> CLK_IS_CRITICAL flag if it detects 'clock-critical' property in
> device tree.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>  drivers/clk/clk-aspeed.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> index 411ff5fb2c07..d22eeb574ede 100644
> --- a/drivers/clk/clk-aspeed.c
> +++ b/drivers/clk/clk-aspeed.c
> @@ -541,8 +541,11 @@ static int aspeed_clk_probe(struct platform_device *pdev)
>
>         for (i = 0; i < ARRAY_SIZE(aspeed_gates); i++) {
>                 const struct aspeed_gate_data *gd = &aspeed_gates[i];
> +               unsigned long flags = gd->flags;
>                 u32 gate_flags;
>
> +               of_clk_detect_critical(pdev->dev.of_node, i, &flags);

This makes sense to me.

> +
>                 /* Special case: the USB port 1 clock (bit 14) is always
>                  * working the opposite way from the other ones.
>                  */
> @@ -550,7 +553,7 @@ static int aspeed_clk_probe(struct platform_device *pdev)
>                 hw = aspeed_clk_hw_register_gate(dev,
>                                 gd->name,
>                                 gd->parent_name,
> -                               gd->flags,
> +                               flags,

For completeness should we make this

 flags | gd->flags

>                                 map,
>                                 gd->clock_idx,
>                                 gd->reset_idx,
> --
> 2.17.1
>
