Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D981DC61DA4
	for <linux-clk@archiver.kernel.org>; Fri,  3 Feb 2023 07:32:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230496AbjBCHcA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 Feb 2023 02:32:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbjBCHb7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 Feb 2023 02:31:59 -0500
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89D382885E
        for <linux-clk@vger.kernel.org>; Thu,  2 Feb 2023 23:31:58 -0800 (PST)
Received: by mail-vs1-xe2d.google.com with SMTP id d66so4459952vsd.9
        for <linux-clk@vger.kernel.org>; Thu, 02 Feb 2023 23:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=20UFv4FYR0RNRhy2mEzLDHn9GdVhRKvFn1ySTJIDHWo=;
        b=RsxUC4vMRzdVnPDNIlpDSu6HWqexhlUr3/ndoqsY0EjcW+V0zfAdnJtijv7YsU+TcO
         KP5dbNn8LEe6vaxWWUeAbQkcVNYZxVRxSgG/V1wSR7AmvPlMMMOOGCYQGquKCmSUZ84T
         fQFD2VAWxBjKc9fP1AUSzWc+V61mf4ynPPAiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=20UFv4FYR0RNRhy2mEzLDHn9GdVhRKvFn1ySTJIDHWo=;
        b=2wsuqwzm6IwPARLSBv63BZ3XbcdQ2cRAc7qp/xrGNKnYSRVglLPUhJbK3J9y0ABoV5
         431mIGxt67E6kczJtBHkbPa7ydlF9Hwg+lstYneivJH0PSQ+hx8e/t5CWmTwmG95ChSv
         iHTIxJHMsGtnzGre+fxGuga67KLHEjzVZyDP+8HlxQI5ohJFwW87xOzzeq3/PXk/15sv
         E5o7JuP9SAHX2f5z254sPokWPM2PxfCAlPV+dLxamMaKUST8iEkyr/Z1MVOkV4BmZU3G
         f2Ssy91elb3RQKVJ4+2PCplJa5bfyTpjUxlJBX6KEUIx6/UXGl1uHgCUBhrrEwWTMs2L
         00Mg==
X-Gm-Message-State: AO0yUKWxrIalByTr9FB9W5I7R+YyoBLHds7yS5ftLfdanFYxyJJ1TbZ/
        5HsfBVWwY7WUCWDvWSC2yRPY5ZLsw1UDVa914YvlqMOD18G7cUwP
X-Google-Smtp-Source: AK7set/4FlDK7sISjom/UmIlvod48p3X4cFzfbV8Lo3q+4ml6FeokBpj89CDwYQ/JOIdYwgsnoY2RhpBJT1ZpU8fMvI=
X-Received: by 2002:a05:6102:23f2:b0:3ed:89c7:4bd2 with SMTP id
 p18-20020a05610223f200b003ed89c74bd2mr1677388vsc.26.1675409517750; Thu, 02
 Feb 2023 23:31:57 -0800 (PST)
MIME-Version: 1.0
References: <20230119124848.26364-1-Garmin.Chang@mediatek.com> <20230119124848.26364-18-Garmin.Chang@mediatek.com>
In-Reply-To: <20230119124848.26364-18-Garmin.Chang@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 3 Feb 2023 15:31:46 +0800
Message-ID: <CAGXv+5G4vvtZAcgO9SUczUDq4_94K4jF3G+YuSDYa8QvxpMp7A@mail.gmail.com>
Subject: Re: [PATCH v5 17/19] clk: mediatek: Add MT8188 wpesys clock support
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
> Add MT8188 wpesys clock controllers which provide clock gate
> control in Wrapping Engine.
>
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
