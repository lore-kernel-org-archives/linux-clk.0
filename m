Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A03C636D7
	for <linux-clk@archiver.kernel.org>; Fri,  3 Feb 2023 06:58:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232152AbjBCG6s (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 Feb 2023 01:58:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231994AbjBCG6s (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 Feb 2023 01:58:48 -0500
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54CD065ECD
        for <linux-clk@vger.kernel.org>; Thu,  2 Feb 2023 22:58:46 -0800 (PST)
Received: by mail-vs1-xe2c.google.com with SMTP id 187so4415704vsv.10
        for <linux-clk@vger.kernel.org>; Thu, 02 Feb 2023 22:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BPezifRRh17LMgbOCetI5RBHb7FvOfUfqVX0Agy4qtY=;
        b=N02LErE9dq3/R+ouQXbCmArYXakhpEsijaOrlNridYJmj530ETOeWePoqlx9jusdKT
         iPfDHYES4HEyQQxPJu19zeJddM1thZLxnlq1uMSzUslbpFkGddTouvlTW54+4K6dADtr
         VAzgIeSwiO4kIkWN6we4elrNZOzpqpXh4Jg08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BPezifRRh17LMgbOCetI5RBHb7FvOfUfqVX0Agy4qtY=;
        b=EuNa0Qzi1SpRE1lBNfvWAewXjCFNznJG92j36dfBiMklVM7tXuk0nT8HboNgAbhlWu
         Di79DgIw+3snNO496PXz2vmOZrrJ2lV5sI0nrkaWLNRK1QZ98BMRQR8cJARVpMyoQyta
         ocNkHMDpS1zvMhMVJPk6ok2TfjXHjRuZvtY1+ODMnNy/kEoJ62YVg7XpOrqKXryyyG8H
         wh6MZxVxcJEeKSRm4TyOsDEcplENTElsjuUIPjSOGy60Ae6RiFtdNvJ4PiUHo1xOE1CJ
         9gS0ImYjeXblTTNXQRNq0rkCT/zaNrTyjNIF48q16lwC5qCw0s2dgZjKajCg58uSvXGt
         kqMA==
X-Gm-Message-State: AO0yUKVZCqXrDqI3MYFVfWxRNWDQQmDlqulSaIFCac+5XQhH/i6IhRhx
        N8IEaiIvrqp5fyhW8sR9WNIgaD4LJqJ8VqaJWk+HbQ==
X-Google-Smtp-Source: AK7set+oNQywJdjoNKiBRoVLc3BLNQgwROOiiULh2qZGXSFUG24dnj7Lf6sHKTrCEF1O2JAiqeFNZ7IgIlv8x4NVK58=
X-Received: by 2002:a05:6102:23f2:b0:3ed:89c7:4bd2 with SMTP id
 p18-20020a05610223f200b003ed89c74bd2mr1663085vsc.26.1675407525498; Thu, 02
 Feb 2023 22:58:45 -0800 (PST)
MIME-Version: 1.0
References: <20230119124848.26364-1-Garmin.Chang@mediatek.com> <20230119124848.26364-9-Garmin.Chang@mediatek.com>
In-Reply-To: <20230119124848.26364-9-Garmin.Chang@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 3 Feb 2023 14:58:34 +0800
Message-ID: <CAGXv+5GEHXqtYffimHzH2srMZKa2dnMAmN5wgTW+91bfFFf6gg@mail.gmail.com>
Subject: Re: [PATCH v5 08/19] clk: mediatek: Add MT8188 imgsys clock support
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

On Thu, Jan 19, 2023 at 8:55 PM Garmin.Chang <Garmin.Chang@mediatek.com> wrote:
>
> Add MT8188 imgsys clock controllers which provide clock gate
> control for image IP blocks.
>
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
