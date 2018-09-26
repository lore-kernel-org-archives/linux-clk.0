Return-Path: <SRS0=Lp8A=MI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30DADC43382
	for <linux-clk@archiver.kernel.org>; Wed, 26 Sep 2018 09:25:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D31AD21480
	for <linux-clk@archiver.kernel.org>; Wed, 26 Sep 2018 09:25:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D31AD21480
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727352AbeIZPhJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 26 Sep 2018 11:37:09 -0400
Received: from mail-vk1-f195.google.com ([209.85.221.195]:42946 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726777AbeIZPhJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Sep 2018 11:37:09 -0400
Received: by mail-vk1-f195.google.com with SMTP id t202-v6so1961868vke.9;
        Wed, 26 Sep 2018 02:25:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VO5UYdUiRAQQTIBi+H897GA9J7lbkaGWeJEJHD11dN4=;
        b=hdT7ygwiMylTz29M9+zg2xnQqhoFExWxAG3FyQqh726Nnyu6hmWurCGUb+Vn51MeT5
         9XaFhsN0lVjaduoJ0X4Wdkyr81fwOyefetl/Ae6c9SaJpwZMIGBECuxy11ozjFy33Ul/
         v0/+MTa97l7EL8TZmOlnymTkHNW15A7QZkfXI3WLotdj3NnRrjI3uOcfHko9H0UGpVcm
         TlCGppj+NnPiuMneX6vUKW6yBK+5O+m/bKm38JEwYGJbPp4Xrl5Y0reBGoemaBMaCT34
         MCrU+j57sm+UPmtlsWXVWZbgPj0oOZWfr7ApM1DMEfEtX6nPQLjmLBfB5MNTINevXKCk
         NBIg==
X-Gm-Message-State: ABuFfojDUs4MCY8lPelTStx7sN+RbH6RMB2SvQDHatq+EagQQoZFYLdq
        T3VnStyV7sQdanh5yz2G7QjndyHFVABhORvISnQ=
X-Google-Smtp-Source: ACcGV61ErHjIZWwBOnj8JFKq+jdRJw+LcHTIXjS06B/Ole9rrzwzy9YbOzyNDtwiP2R8m74Pg3Zq1Ou4iGdBezBZtCM=
X-Received: by 2002:a1f:8b84:: with SMTP id n126-v6mr1529678vkd.74.1537953907154;
 Wed, 26 Sep 2018 02:25:07 -0700 (PDT)
MIME-Version: 1.0
References: <20180924164937.36536-1-chris.brandt@renesas.com> <20180924164937.36536-3-chris.brandt@renesas.com>
In-Reply-To: <20180924164937.36536-3-chris.brandt@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 26 Sep 2018 11:24:55 +0200
Message-ID:
 <CAMuHMdWZ5BE4bjOCbVL5BoE4-pYRhD3x3zRs=gPGuCgNKb+=oA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] clk: renesas: r7s9210: Convert some clocks to early
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180926092455.1ybzFANi3A7QmkRTpmCBeA-geTulI_rrcKTnfbywmCw@z>

On Mon, Sep 24, 2018 at 6:50 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> The OSTM timer driver for RZ/A2 uses TIMER_OF_DECLARE which requires the
> ostm module clocks to be registers early in boot.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v2:
>  * List early clocks first
>  * Remove unnecessary comments
>  * Removed new function r7s9210_update_clk_table (to be included in a
>    separate patch)

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v4.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
