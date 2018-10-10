Return-Path: <SRS0=fkKI=MW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD26EC43441
	for <linux-clk@archiver.kernel.org>; Wed, 10 Oct 2018 08:36:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9D777214FF
	for <linux-clk@archiver.kernel.org>; Wed, 10 Oct 2018 08:36:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D777214FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727170AbeJJP5a (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Oct 2018 11:57:30 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:36344 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726596AbeJJP5a (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 Oct 2018 11:57:30 -0400
Received: by mail-vs1-f67.google.com with SMTP id c205so4251571vsd.3;
        Wed, 10 Oct 2018 01:36:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n0ERrtMNdKKIigtHiI6OxqRYCTVBMBT1bHtUJKdT2so=;
        b=FZJI6zH+V6R94qydGiCcKp4CaFrI2LBfN8zIFwNXXTqdlByCPFvY8rHWrdjTxzqI1C
         bDwF0dcaAFKWB19fd3E7yDhJSCqaJC2OCGOgdbzNDKaQ7EyhesYxtDIFr5lf2fWuRtDR
         2XQ1qPraJGKOGDZqgw8iWKQzC7W17GbpK6vq5I4puJIGTM+BEDNsSOv4fNZnF93kozkA
         v9aa1NhmfHItbTxGB+KB+i2vrmTSImQ38SgGZRDut+H2H+3pCmc13w28jhxpRNl9QcGb
         GBzPQhzfNtpiO2FYPK5i1hyJ+n9A2A0ZlQAsQpVDLABHPci6jo8XaHxI3DvunAIAHRFa
         NR4A==
X-Gm-Message-State: ABuFfogstTmlArv7Tpt1qKF0FjbKrOH7zK/xMGYDiocvoQD/CWOb8PkT
        pp1buM7VdyVgSB0fJTxFNnogT5J35B+SXxMYwgE=
X-Google-Smtp-Source: ACcGV61i5YYFeZB29UTfjOfKrmz6d2v3MW+b/8jJD1fINVTZoHLxypS8n11WLugC1W+YfATbMzBIh/b+DJ00/tlCsO8=
X-Received: by 2002:a67:e015:: with SMTP id c21mr11121584vsl.63.1539160583579;
 Wed, 10 Oct 2018 01:36:23 -0700 (PDT)
MIME-Version: 1.0
References: <20181008162349.42957-1-chris.brandt@renesas.com> <20181008162349.42957-2-chris.brandt@renesas.com>
In-Reply-To: <20181008162349.42957-2-chris.brandt@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 10 Oct 2018 10:36:12 +0200
Message-ID: <CAMuHMdUaG_cEc+EuzDJ2+s97O0CRKEGiD8zgN-zvBUREXYuBiw@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: r7s9210: Add SDHI clocks
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Oct 8, 2018 at 6:24 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Add SDHI clocks for RZ/A2
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v4.21.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
