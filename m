Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D68BEB64D9
	for <linux-clk@archiver.kernel.org>; Mon, 19 Jun 2023 08:06:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbjFSIGT convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Jun 2023 04:06:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbjFSIFh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Jun 2023 04:05:37 -0400
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 047A41706;
        Mon, 19 Jun 2023 01:05:31 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7624af57b21so152579685a.1;
        Mon, 19 Jun 2023 01:05:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687161930; x=1689753930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3oz8GNIosqesleY5hwO8jR0lVB7Ix3LZHCQA0peSIcE=;
        b=mA+W3uIWEkd7n3Ncfv2hqSsLdzb9hdNz3wHsILLWgszoxgchy4PVkOncVgRaZWAU3V
         YrGGF4SdCwh+KbdjIhAlafIz10/yjR/LgTeSSs8iPGgH16dtmUrQE711iFf7ShCE40aR
         OXsXMOSsJnkWLuAW5WHrRZfSswqwifLosHF47PHL1Ci5S6JSVjXduMkUYICM+DaaGbli
         mmTb8Pvdvzo4XUDUNCmJ9drV+5OwMtjFf1iZyhl9Xt71pKpxshyUpclfJq7NLYIap6Pl
         QHSDm5RTWi3XP+k52d9Br/ipzfjJ6tka/zcsD8X8Si9T7ueQiwTjvAHc9zbtk2luiNsh
         BTFw==
X-Gm-Message-State: AC+VfDy5t+8fsjO65wtr7pPveLr86I5nnBJDxt+YoILGzDJm/SHg+6Os
        mn0+db1hV068Rl6i/PgRmojYdluvZ6YAIw==
X-Google-Smtp-Source: ACHHUZ5uFi/d1xCvjgJ2p8hqehUkByFl5mUyh3EiDQynPZYxUKxn6h/YNCcj5e/9O/SYyxwpNJhypw==
X-Received: by 2002:a05:620a:cc6:b0:763:a191:71ec with SMTP id b6-20020a05620a0cc600b00763a19171ecmr503073qkj.32.1687161929830;
        Mon, 19 Jun 2023 01:05:29 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id g124-20020a0dc482000000b0056d4c86b639sm3474416ywd.9.2023.06.19.01.05.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 01:05:29 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-bcde2b13fe2so3463398276.3;
        Mon, 19 Jun 2023 01:05:28 -0700 (PDT)
X-Received: by 2002:a5b:88e:0:b0:bce:facd:547a with SMTP id
 e14-20020a5b088e000000b00bcefacd547amr6680333ybq.25.1687161928415; Mon, 19
 Jun 2023 01:05:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230617150302.38477-1-aford173@gmail.com>
In-Reply-To: <20230617150302.38477-1-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 19 Jun 2023 10:05:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWghaOLH5TOK5gCfQpF=4Qb4FvL5sW+3=hGMLJG6sheHw@mail.gmail.com>
Message-ID: <CAMuHMdWghaOLH5TOK5gCfQpF=4Qb4FvL5sW+3=hGMLJG6sheHw@mail.gmail.com>
Subject: Re: [PATCH 1/4] clk: renesas: rcar-gen3: Add support for ZG clock
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-clk@vger.kernel.org, aford@beaconembedded.com,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, Jun 17, 2023 at 5:03 PM Adam Ford <aford173@gmail.com> wrote:
> A clock used for the 3D graphics appears to be common
> among multiple SoC's, so add a generic gen3 clock
> for clocking the graphics.  This is similar to the
> cpg_z_clk, with a different frequency control register
> and different flags.  Instead of duplicating the code,
> make cpg_z_clk_register into a helper function and
> call the help function with the FCR and flags as
> a parameter.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.6.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
