Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9286C77B7C
	for <linux-clk@archiver.kernel.org>; Mon,  8 May 2023 02:36:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbjEHCgi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 7 May 2023 22:36:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjEHCgi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 7 May 2023 22:36:38 -0400
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D572411547
        for <linux-clk@vger.kernel.org>; Sun,  7 May 2023 19:36:34 -0700 (PDT)
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-77d456fa0dbso1359124241.3
        for <linux-clk@vger.kernel.org>; Sun, 07 May 2023 19:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683513392; x=1686105392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dptqg8r0UsWrR3n0HKBRHqVrggh1ivQ7IQr3yU5eDRA=;
        b=ABTrz6Kj/Gn2qx7IKb+RJD9gjgl2klGp6PIajxFslkI7N+K3PdelDUbcnk+mL+cywm
         878ElpMOODX9eaTWjRh6k7XadkTUhqbpSexVNnjzRNotq9TZVozK8oczY60o0a4Tyb4Q
         fyUqIO+KGn9QKm49zoSyVRHOfuQMjOG6sw9XM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683513392; x=1686105392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dptqg8r0UsWrR3n0HKBRHqVrggh1ivQ7IQr3yU5eDRA=;
        b=Ypk77YwmcCXDPW73gvj2dibDK1unoUcCF3iWbzEQp+u6GGFBqcPVN/WCFpfQLqoq6J
         Qsf9742Ou9XrSIhNZubChbLTf2iNxXFZFYy3g5Zp/bFCW5qRmv0taoiNrJFP/tm2AH21
         4+h8SwYSAuuPkC15VE80527CBL5duqsYPgCicWC6oWDzOCRsVXyA9xdiWjCkMpfTzu45
         mk5E5PRfcMTbL0/RdZ9isFBmscYVaHB67CBneTl+cyBamxT19v/lHSSY80W75UZq+ztf
         o3Tcd9a9UnpuTYNtSIW7dHEf2hmUX8wo2g8jgR8DidBBLKV0rgong8z65keXnlnyd8wL
         4QIA==
X-Gm-Message-State: AC+VfDwBdWz3POrt/k2WcJVuo9dn0XKSTh3uDA9XAl+FxP0PwJetVfTL
        r9P0YL/uxC6k02sdqHV/ofABgQMv7pbyjCwPqeWGRw==
X-Google-Smtp-Source: ACHHUZ50gsiXHy03kBM5uO2R7gxdLyM9XFldG88yruZf0Axm2n6Ko9rRM3MEf/5h29DiqpiBoLZjjoiG7pZ94fUBcuw=
X-Received: by 2002:a67:f353:0:b0:434:8479:1812 with SMTP id
 p19-20020a67f353000000b0043484791812mr2281063vsm.18.1683513392157; Sun, 07
 May 2023 19:36:32 -0700 (PDT)
MIME-Version: 1.0
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech> <20221018-clk-range-checks-fixes-v4-29-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-29-971d5077e7d2@cerno.tech>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 8 May 2023 10:36:21 +0800
Message-ID: <CAGXv+5E7pi5_R1u=dpTSVdBPhG6_GFnJpatbExhB2W2dhue9cQ@mail.gmail.com>
Subject: Re: [PATCH v4 29/68] clk: mediatek: cpumux: Add a determine_rate hook
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, May 5, 2023 at 7:27=E2=80=AFPM Maxime Ripard <maxime@cerno.tech> wr=
ote:
>
> The Mediatek cpumux clock implements a mux with a set_parent hook, but
> doesn't provide a determine_rate implementation.
>
> This is a bit odd, since set_parent() is there to, as its name implies,
> change the parent of a clock. However, the most likely candidates to
> trigger that parent change are either the assigned-clock-parents device
> tree property or a call to clk_set_rate(), with determine_rate()
> figuring out which parent is the best suited for a given rate.
>
> The other trigger would be a call to clk_set_parent(), but it's far less
> used, and it doesn't look like there's any obvious user for that clock.
>
> Similarly, it doesn't look like the device tree using that clock driver
> uses any of the assigned-clock properties on that clock.
>
> So, the set_parent hook is effectively unused, possibly because of an
> oversight. However, it could also be an explicit decision by the
> original author to avoid any reparenting but through an explicit call to
> clk_set_parent().

The consumer, the cpufreq driver, assumes the original parent to be
the dedicated PLL that drives it. It gets a reference to the original
parent with clk_get_parent(). It also gets an intermediate (stable) clock
via DT. It does explicit clk_set_parent() calls to switch to/from the
stable clock, and does clk_set_rate() on the dedicated PLL in between.

So yeah, they only use set_parent hook.

> The latter case would be equivalent to setting the determine_rate
> implementation to clk_hw_determine_rate_no_reparent(). Indeed, if no
> determine_rate implementation is provided, clk_round_rate() (through
> clk_core_round_rate_nolock()) will call itself on the parent if
> CLK_SET_RATE_PARENT is set, and will not change the clock rate
> otherwise.
>
> And if it was an oversight, then we are at least explicit about our
> behavior now and it can be further refined down the line.
>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
