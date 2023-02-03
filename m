Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CFD3C61DA4
	for <linux-clk@archiver.kernel.org>; Fri,  3 Feb 2023 06:59:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231245AbjBCG75 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 Feb 2023 01:59:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjBCG74 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 Feb 2023 01:59:56 -0500
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4D7565ECD
        for <linux-clk@vger.kernel.org>; Thu,  2 Feb 2023 22:59:55 -0800 (PST)
Received: by mail-vs1-xe2d.google.com with SMTP id 187so4417639vsv.10
        for <linux-clk@vger.kernel.org>; Thu, 02 Feb 2023 22:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yWWZ38xBlh3IVnKVLJVzuuNvI9iBwD+sciZ9Pk3h+ho=;
        b=Htk4ARYKUfpuvvqRJ2EeEUMvEHXAwrSb4+aIGuFbpWu72hwBzv7b3TBWYbT2WQhSKd
         P8TqXPmsrih4nuOihR7J87XRnApwAKXOxOqcU7LscwlLkh355223dPFLMU71E6OGPQ8s
         LRpy8cdSz+Ppo9W6DlE9HNaYjnMNkqN82kktU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yWWZ38xBlh3IVnKVLJVzuuNvI9iBwD+sciZ9Pk3h+ho=;
        b=Y84BvImHuA4I4JpjunBqDlgp090XsbUsYyq3Abyv13T9fH/IJ/YpNbfrjyqN/+C9X8
         /M2Ai0Zbfqok8v3WlUUwoC3iK1oMqx1FWY1XM3Kjo7XuTIW7p/UxrHlOyI/AvMsyOaHM
         aWM7d95WHUUCw4DUyhEGZpnEhVBjEkd969ZFnIvouj5HckiUDhuQio0W4p7E3UG12nQq
         qXczz+89o6apDzYQ7Mu+q6DObfmmFInJFnBzfrZCoGVEb7KBRXmXTJz/Stb5uUqYN+CR
         7FntdJPjqnSGaMiO+SzyShtNBdZBBur+pQFNYdV5SHx4EoYndBfMhsv2X3Pq2wWyV3fj
         1WHw==
X-Gm-Message-State: AO0yUKWj4t1mvnrUW9s5YzdjV9BiY3qfff3DRMOoCvxeXHu6edX0G+9+
        gc/qKE+jH41S8GoY/6SCIiUXvJ0RqDjnZPon+fy78g==
X-Google-Smtp-Source: AK7set/fvJef55OrCmgQPy2cey2QzW2vrXkOL7NADQDH9KEQEyy17KPIvRILeWRl3DyHoXydzUx1IzSjdM17JG3i+Jc=
X-Received: by 2002:a05:6102:23f2:b0:3ed:89c7:4bd2 with SMTP id
 p18-20020a05610223f200b003ed89c74bd2mr1663573vsc.26.1675407595078; Thu, 02
 Feb 2023 22:59:55 -0800 (PST)
MIME-Version: 1.0
References: <20230119124848.26364-1-Garmin.Chang@mediatek.com> <20230119124848.26364-10-Garmin.Chang@mediatek.com>
In-Reply-To: <20230119124848.26364-10-Garmin.Chang@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 3 Feb 2023 14:59:43 +0800
Message-ID: <CAGXv+5Ef_=s8nXQn_rtaSgdx0jroKoaJ7DdxxyumKfT2SaLV0Q@mail.gmail.com>
Subject: Re: [PATCH v5 09/19] clk: mediatek: Add MT8188 ipesys clock support
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

On Thu, Jan 19, 2023 at 8:54 PM Garmin.Chang <Garmin.Chang@mediatek.com> wrote:
>
> Add MT8188 ipesys clock controller which provides clock gate
> control for Image Process Engine.
>
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
