Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B21ACC04A95
	for <linux-clk@archiver.kernel.org>; Mon, 26 Sep 2022 03:22:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233403AbiIZDWQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 25 Sep 2022 23:22:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233435AbiIZDWL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 25 Sep 2022 23:22:11 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B5C810072
        for <linux-clk@vger.kernel.org>; Sun, 25 Sep 2022 20:22:06 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id z2so7273482edi.1
        for <linux-clk@vger.kernel.org>; Sun, 25 Sep 2022 20:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=yQsxXFVnnycu0Ai4HAskpMNXUco0LHrZ9qALshiE0Kk=;
        b=TVddU5EuFj2t8KIz7T3zCcDHTC4WeulJBoHq9EOsixQxw9p+2NBuF8VMquNFeDbozy
         G0mxNI+BTMiiYOluXsqZBzifT5mNk4PwqWXe9qc/RUX++dzObFco3u6ohP87bJ2o7kt3
         tA7AC7/8JQ0rMS6oFMZfwH6xivu21fXZrzUxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=yQsxXFVnnycu0Ai4HAskpMNXUco0LHrZ9qALshiE0Kk=;
        b=cAr44WN3G2O3u/+4zlPbY5o+z5E7/k02FsnFt2IzoLEcSxWxrh4Jv8MIkDMO+qXkgq
         07HZbd+7bo7c+eYTipia9daaRdrW9hT0fQi4OF2O16ch+FlLY+QnU/9+yXkTZaGOBWeD
         WbpVKomVpULkVcerYF7PH8QnaA/TR4vQAdVV+x4HntXIiNcAoivbEFMkb19AaEGCmCyI
         a39VS7uS3C7URaAkyKQP9qiUnHXcHKKZSgxAKIIbb27tR6hY+c7rVgHk5wa3SgbKF1N/
         4E3P7O9cAAyI2L4tT2nW8krITwb7bx+7ru/rz/ZYleChHmAI1y34hG3BmaKm3boGDgRx
         BxYQ==
X-Gm-Message-State: ACrzQf0HSLZ10GWI3tOiwKOuZOGdfZmz68uw++NsTZ7okLOeG1FiSBpR
        mhb30iW9P1uOoO1bC7Too1kWdWFXGuJ6UfzSE52rqw==
X-Google-Smtp-Source: AMsMyM4D/ZSyLsYSyu8xNz2kCJSqJ/H1GIkKLJy/AFRCNUaeLI2dpgccDtbydmm91X48YfUGORxcS3U01CQX45V/rng=
X-Received: by 2002:aa7:cc02:0:b0:453:b0f3:9927 with SMTP id
 q2-20020aa7cc02000000b00453b0f39927mr20858524edt.66.1664162524995; Sun, 25
 Sep 2022 20:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220915072458.18232-1-angelogioacchino.delregno@collabora.com> <20220915072458.18232-10-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220915072458.18232-10-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 26 Sep 2022 11:21:53 +0800
Message-ID: <CAGXv+5GwYEv2O70_3rjDmY=RHZ900x3RKSaFYqzb_nTumT+YoA@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] clk: mediatek: clk-mt8192-mfg: Propagate rate
 changes to parent
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     matthias.bgg@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
        miles.chen@mediatek.com, rex-bc.chen@mediatek.com,
        nfraprado@collabora.com, chun-jie.chen@mediatek.com,
        jose.exposito89@gmail.com, drinkcat@chromium.org,
        weiyi.lu@mediatek.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Sep 15, 2022 at 3:25 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Following what was done on MT8183 and MT8195, also propagate the rate
> changes to MFG_BG3D's parent on MT8192 to allow for proper GPU DVFS.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
