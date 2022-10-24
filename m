Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 594DCC38A2D
	for <linux-clk@archiver.kernel.org>; Mon, 24 Oct 2022 23:45:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbiJXXpB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Oct 2022 19:45:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230410AbiJXXof (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Oct 2022 19:44:35 -0400
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 200702ACBF3
        for <linux-clk@vger.kernel.org>; Mon, 24 Oct 2022 15:02:55 -0700 (PDT)
Received: by mail-vs1-xe2f.google.com with SMTP id 128so9218501vsz.12
        for <linux-clk@vger.kernel.org>; Mon, 24 Oct 2022 15:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PQO3SP/T7mx2gTBdrb26vhHeh//fHC6TncgJjNKUlYk=;
        b=Z2jdLbMLpmR99cxAypgqWbtshKYj35Ebkj3fTaxTstePFu0H4CEsORE/+N7wFrwEmz
         S/V+Csf+m+CzpG6iUJdChy/UPbuZNn5bkt0lnfgo9MjI+y6nCdCgZI5ZXuAWjBjy2q9L
         C/NwSuG10/nz1AaJX3BLGjYT8/toKDF0M0nco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PQO3SP/T7mx2gTBdrb26vhHeh//fHC6TncgJjNKUlYk=;
        b=OUeWmpSVj9vyuIXpg4ip/GDwoKxvK988A1x4tpHg8G1MGG+sHJQBJMR9Eiy5puNgMr
         A6Lrcfaumb1Or2nQuVoZz6l/J8KCHgyzvch2dO1JI3FzXL9HnsH8EjQ1HB/8HlpyZtp2
         ci2MiecZSdl82+S6nt3Rx+6/7sPbOU4QPMZQP3RFoUVNnzYTrj9MlwF1W8dAFOj40V20
         E/BCPDmrYVbqux7LRC0Gx0qwzghex2ZJxSGB3+kfUBwG2DwljueI2xpHH5P/1NRv2zAc
         HANH7oZIxSy3D2XY8M4MZ0EagoUOGUTUKgqSA1A3GWz/9bDiUujbQstxvtPbHQFj0cht
         DSmA==
X-Gm-Message-State: ACrzQf28t0rULhekTUTRel+kQBZwVzIfpLEoaTmxzYsbBHlEBaoZT9oe
        z+DqVUBXEIzopJWqABMqHAxyr5HEHmJ4zEjpx6fPjw==
X-Google-Smtp-Source: AMsMyM4Nc2SEf14KxCoAjSdAd9I9wEQsYdGBrpODBvx0PQyqe810u6vS6uHm6Jb+ldd50UX+leY9mLoXV+Dk3qKhG48=
X-Received: by 2002:a67:f684:0:b0:392:ac17:f9b0 with SMTP id
 n4-20020a67f684000000b00392ac17f9b0mr20548005vso.85.1666648974339; Mon, 24
 Oct 2022 15:02:54 -0700 (PDT)
MIME-Version: 1.0
References: <20221024102307.33722-1-angelogioacchino.delregno@collabora.com> <20221024102307.33722-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221024102307.33722-4-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 24 Oct 2022 15:02:37 -0700
Message-ID: <CAGXv+5HgWwjNz73wdvQv-9qTiQCvbmE9kMp6ts+DccdBUQZ9HQ@mail.gmail.com>
Subject: Re: [PATCH 03/10] clk: mediatek: mt8183: Compress top_divs array entries
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     sboyd@kernel.org, mturquette@baylibre.com, matthias.bgg@gmail.com,
        miles.chen@mediatek.com, nfraprado@collabora.com,
        rex-bc.chen@mediatek.com, chun-jie.chen@mediatek.com,
        jose.exposito89@gmail.com, yangyingliang@huawei.com,
        msp@baylibre.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Oct 24, 2022 at 3:23 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> There's no need to split each FACTOR entry in two lines, as each of
> them does fit in one line just fine.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Git word-diff + ignore whitespace showed no code changes, so

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
