Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C02DC61DA4
	for <linux-clk@archiver.kernel.org>; Fri,  3 Feb 2023 06:53:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231761AbjBCGxu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 Feb 2023 01:53:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231691AbjBCGxt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 Feb 2023 01:53:49 -0500
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABE478E05A
        for <linux-clk@vger.kernel.org>; Thu,  2 Feb 2023 22:53:39 -0800 (PST)
Received: by mail-vs1-xe2d.google.com with SMTP id i185so4419522vsc.6
        for <linux-clk@vger.kernel.org>; Thu, 02 Feb 2023 22:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nfNQZUW7vpWk49el8p5YyTuQXOt0xJcu7Hm6/2uj/BA=;
        b=JsBkmFybia9ZW4Tn80tNqvi4ejQ4duK48gNUWa7XECiICD86WWBXRtTBeA6TxCaLj1
         3YLNlaQfEKLP73hBaYLAGIzg/4qXKBvekULoYrWh5JHUTM/TahtLg4+g5d0N7DcgGtfm
         JAUetCNYzeWrNrUklnq2G6/DceDMZl4M+Ms2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nfNQZUW7vpWk49el8p5YyTuQXOt0xJcu7Hm6/2uj/BA=;
        b=fYZ2lFNFkiEUzjPKDa4IoaGe4waGaBu69Q73lZWTEX+1HnKBj39MJAV5JkSFK3qSfZ
         dpNSHqNTLQmtVDq6ABrK4V8V467ZX5b095ZPlslNr8e09ApajR6zPFjExh9XhBc0/u97
         NbnGZXmpAr5Mu/0+MOEN7goQqMCfWU5NWJgUE2IF3vE6EVSqVSWfPErBv7z8pDPjR195
         zBDEuPODrJIQuPGYxBIrGRSW53TwOQBMp7FCjjV2WeIwychN8/e1ypRHi8x98L5ZBea8
         JZU0sMw+t6jN+jWxeXp0fKGkYz5y2Y9xrjiZ34SPY5OUml87tcvbGJlp4Vv92cJJSqex
         eGCg==
X-Gm-Message-State: AO0yUKXv9MuLOK8g5m2Q38mBUC/9SDZFsm0UE3vCi5J02ddu/TRPjHso
        U7crZzngLtyrXjKn5edH2jHULC776BUzGObU8lP9yQ==
X-Google-Smtp-Source: AK7set9P71C7AZ8SPapudPPTNAfMRfdB/difo4XxWPYnTOB9xKAd3pZpzwIwaKo3jyt1LgHG+/GWReE5O9LqeBd1xBU=
X-Received: by 2002:a67:fc92:0:b0:3f7:93c4:9e56 with SMTP id
 x18-20020a67fc92000000b003f793c49e56mr1689947vsp.85.1675407218866; Thu, 02
 Feb 2023 22:53:38 -0800 (PST)
MIME-Version: 1.0
References: <20230119124848.26364-1-Garmin.Chang@mediatek.com> <20230119124848.26364-7-Garmin.Chang@mediatek.com>
In-Reply-To: <20230119124848.26364-7-Garmin.Chang@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 3 Feb 2023 14:53:27 +0800
Message-ID: <CAGXv+5HsQ-sG4+_uKdp5x++wzZvQMjbUpSrgyvUS+Tyo1kC-hw@mail.gmail.com>
Subject: Re: [PATCH v5 06/19] clk: mediatek: Add MT8188 camsys clock support
To:     "Garmin.Chang" <Garmin.Chang@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-clk@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jan 19, 2023 at 8:50 PM Garmin.Chang <Garmin.Chang@mediatek.com> wrote:
>
> Add MT8188 camsys clock controllers which provide clock gate
> control for camera IP blocks.
>
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
