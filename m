Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2409C04A6A
	for <linux-clk@archiver.kernel.org>; Tue, 15 Aug 2023 07:41:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233514AbjHOHlW convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Aug 2023 03:41:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235457AbjHOHkn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Aug 2023 03:40:43 -0400
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06C4B1737;
        Tue, 15 Aug 2023 00:40:41 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-58c5642701fso5167967b3.0;
        Tue, 15 Aug 2023 00:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692085240; x=1692690040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvzrsyQ0VeP4Buf8o1bS+U3ITedOgmzxQDcHmxq+9HE=;
        b=Eyl5jt4ynVpuBl64qGRxuiUda/8J4uSLrQna20DLapz0CL3eC5FAPjJzFKrBfpCFwR
         KOMUgbYk6+59vGrPVO9+s/1WaMRv7zy1RG9dU/QdICPWmImzEfzn+wkLAoMDKOhsL+bN
         MpnElSRnq6gYViGLaq8YKZAkRIvv+KwU+qiXGAjuCAAtotbFy2F7rFaQKAwjCoGzZC9Z
         /ewpJS8ieFs8tntGPj4gdXbWjwspAMm7TADOVmQsyANR1IAtCjJyFaeIipTUrIMGy79e
         DGhAK7JAmLo4FlfQBXX0OxFuJOTqI4PXHMqDnM81RlYJXUVpwxDhc0EZB+GNv6wvniWc
         ICrA==
X-Gm-Message-State: AOJu0Yw/z8BGRuspiTrjjhrWpPp3Ylgk1w73+NJipesCMCyngR3MC0JB
        u2wyh3yU73JPiFxrWYCQrSI5AxIkV3/iBw==
X-Google-Smtp-Source: AGHT+IGeKPOyeeqnZDQXuhqPxVqXblMnqPUNVD11H1isj3k/cXcgwONDeE3blWb+ODOsji3YqJ6GAA==
X-Received: by 2002:a0d:e810:0:b0:583:f837:2c1 with SMTP id r16-20020a0de810000000b00583f83702c1mr15498302ywe.8.1692085240032;
        Tue, 15 Aug 2023 00:40:40 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id s131-20020a815e89000000b0057087e7691bsm3286689ywb.56.2023.08.15.00.40.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 00:40:39 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-d682d2d1f0dso3303707276.1;
        Tue, 15 Aug 2023 00:40:39 -0700 (PDT)
X-Received: by 2002:a25:b286:0:b0:cf7:770:229f with SMTP id
 k6-20020a25b286000000b00cf70770229fmr13652267ybj.46.1692085239544; Tue, 15
 Aug 2023 00:40:39 -0700 (PDT)
MIME-Version: 1.0
References: <87r0onprph.wl-kuninori.morimoto.gx@renesas.com> <87pm47prox.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pm47prox.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Aug 2023 09:40:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXvcR-SdhOB_GZ=qYay6i8UbxCQbaYOrQPbuk_BwRmAgQ@mail.gmail.com>
Message-ID: <CAMuHMdXvcR-SdhOB_GZ=qYay6i8UbxCQbaYOrQPbuk_BwRmAgQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] clk: renesas: r8a7795: add 922 ADG
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Aug 1, 2023 at 1:49 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> R-Car Sound needs to enable "ADG" on RMSTPCR9/SMSTPCR9 22bit to use
> clk_i which came from internal S0D4. This patch adds it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.6.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
