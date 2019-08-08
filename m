Return-Path: <SRS0=DelH=WE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B4CC0650F
	for <linux-clk@archiver.kernel.org>; Thu,  8 Aug 2019 15:00:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8AE4A21874
	for <linux-clk@archiver.kernel.org>; Thu,  8 Aug 2019 15:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565276429;
	bh=VMX4+z5KBsTfo17lWMUM0gaIU0HOjZ0tDh6fGoEHTnQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=g9CFNdhnz2yR+imWuJQUTmYVRxVNPgRco7+S5PudSy5f0briU3vXoyk+iObRH8IeF
	 HOl5s8j/X8ph5iBIk8Iu5EPXkgVytfGCKGiy1j75plrhlmv9TJVPKY9Bg1RFWMtJp1
	 QMlgqMxl80puftyWl1LcNrRtkRlsV8pxgQSmedmQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732344AbfHHPA3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Aug 2019 11:00:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:41162 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728380AbfHHPA3 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 8 Aug 2019 11:00:29 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0BC1F217D7;
        Thu,  8 Aug 2019 15:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565276428;
        bh=VMX4+z5KBsTfo17lWMUM0gaIU0HOjZ0tDh6fGoEHTnQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=OU883y23hC4qN8GDhilPPJBYsm9RaHoaxBEp4B4Yfmx5ct/s5eQvnxDMkAWfPNCMx
         0LhKJ+mhny/ztqhqol4XXyTkEWezFWSoKLMQRiMxagyObtlberNVn9uiqEQSMzFDdz
         efc9vBWwQ+rchl6lsiSNLhxHC73Fw0n03rJsc+Nc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <68e96af2df96512300604d797ade2088d7e6e496.1562073871.git.leonard.crestez@nxp.com>
References: <68e96af2df96512300604d797ade2088d7e6e496.1562073871.git.leonard.crestez@nxp.com>
Subject: Re: [PATCH v3 1/2] clk: Add clk_min/max_rate entries in debugfs
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Leonard Crestez <leonard.crestez@nxp.com>
User-Agent: alot/0.8.1
Date:   Thu, 08 Aug 2019 08:00:27 -0700
Message-Id: <20190808150028.0BC1F217D7@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Leonard Crestez (2019-07-02 06:27:09)
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index c0990703ce54..e4e224982ae3 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2894,19 +2894,26 @@ static int clk_summary_show(struct seq_file *s, v=
oid *data)
>  }
>  DEFINE_SHOW_ATTRIBUTE(clk_summary);
> =20
>  static void clk_dump_one(struct seq_file *s, struct clk_core *c, int lev=
el)
>  {
> +       unsigned long min_rate, max_rate;
> +
>         if (!c)
>                 return;
> =20
>         /* This should be JSON format, i.e. elements separated with a com=
ma */
>         seq_printf(s, "\"%s\": { ", c->name);
>         seq_printf(s, "\"enable_count\": %d,", c->enable_count);
>         seq_printf(s, "\"prepare_count\": %d,", c->prepare_count);
>         seq_printf(s, "\"protect_count\": %d,", c->protect_count);
>         seq_printf(s, "\"rate\": %lu,", clk_core_get_rate(c));
> +       clk_core_get_boundaries(c, &min_rate, &max_rate);
> +       if (min_rate !=3D 0)
> +               seq_printf(s, "\"min_rate\": %lu,", min_rate);
> +       if (max_rate !=3D ULONG_MAX)
> +               seq_printf(s, "\"max_rate\": %lu,", max_rate);

What are the if conditions about? We always output the values in the
individual files, but for some reason we don't want to do that in the
json output?

>         seq_printf(s, "\"accuracy\": %lu,", clk_core_get_accuracy(c));
>         seq_printf(s, "\"phase\": %d,", clk_core_get_phase(c));
>         seq_printf(s, "\"duty_cycle\": %u",
>                    clk_core_get_scaled_duty_cycle(c, 100000));
>  }

Everything else looks fine, so maybe I'll just remove the if statements
if you don't mind.

