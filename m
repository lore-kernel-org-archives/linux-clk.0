Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F9C4C54EF0
	for <linux-clk@archiver.kernel.org>; Fri,  6 Jan 2023 17:00:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbjAFRAy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 6 Jan 2023 12:00:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232218AbjAFRAx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 6 Jan 2023 12:00:53 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5001B43E50
        for <linux-clk@vger.kernel.org>; Fri,  6 Jan 2023 09:00:51 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id w13so555299wrk.9
        for <linux-clk@vger.kernel.org>; Fri, 06 Jan 2023 09:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NPGjO3GLxwuKoc7lZtIvtYmPySePxCmc9A8414gqSgU=;
        b=euSC14S8bRke4P9nxYzrLsV7/Rs+V6Xwl16eqrk35fgRXHrcJW5M+EQ3TnnmVVz0OG
         imulyWr/yTkRznDSLBl6k+WUX9Hs08bCyaj/QtWTBFWr7PY4Bs/uZgGVLA+u+G0kjK1Q
         qXyAQWkNWXr2Jtmwao2CR7rfbv8Gr9gBMeR00JF4LoZPF4CGI8jAAZLlvp+/VbpPfmIo
         4eeQb6ZkqPijQpvRdJPZbbz8MfSqPjoTyC40kWVWydVWtcd5HC6/wjxYGrCZJJ8aS6w/
         OHJDK985nTHcaHYGlN3Uos/RdUc/afXFpdOH7junzOIQUY5F7bbBQggu0lFe/Q4h5PNO
         TfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPGjO3GLxwuKoc7lZtIvtYmPySePxCmc9A8414gqSgU=;
        b=EBWi7cwDskA3pI8LCaN9zNIcgiDLZMMlhkOewk/vzE33uwyKVIhGH+kvWCnqr8Ik6Z
         2xl2+TxLpcKeauA+3pPVQSm+95i7bkqfYLL1A5f8Yusq/n26pbgVFoy+cEK33lDp2R95
         7LiFhxvWj2tJe6c4WIQjHQSfryxYsfF13Hu4tIUG/k8SxiJSV9A9bRBXOiKEn/86zns9
         6Z3rC6LAFemh1Os9KFmexlXGnY6v/Fr4wgFgu4tFFFNMb7t00iEL4imGuOn9yfOmh/Cq
         lNqC3gm3kUfAKK3pWUZmLG0nP/9K1WNWUwc/titaw3L97ycAybirt+qU3WNwVmvuFCXt
         XGDg==
X-Gm-Message-State: AFqh2kpUcx/c460FX4TxcoZ5WebIgZ3BPQiXcRLT/qtY9mozWGNJVLc6
        7RldHxq+oRUQe+SM0U5HZh6BTQ==
X-Google-Smtp-Source: AMrXdXuFqZYcBKNOWyaXZXz+967P6PyjNmHIk3ic4subWD87vHVwOE8AwQVtHuWeEOjpKP7UFEo2PQ==
X-Received: by 2002:adf:da51:0:b0:2b6:daf8:52ad with SMTP id r17-20020adfda51000000b002b6daf852admr3402719wrl.52.1673024449899;
        Fri, 06 Jan 2023 09:00:49 -0800 (PST)
Received: from blmsp ([2001:4091:a245:805c:8713:84e4:2a9e:cbe8])
        by smtp.gmail.com with ESMTPSA id f8-20020a0560001b0800b002423edd7e50sm1633417wrz.32.2023.01.06.09.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 09:00:49 -0800 (PST)
Date:   Fri, 6 Jan 2023 18:00:48 +0100
From:   Markus Schneider-Pargmann <msp@baylibre.com>
To:     Chen-Yu Tsai <wenst@chromium.org>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, mturquette@baylibre.com,
        sboyd@kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johnson.wang@mediatek.com,
        miles.chen@mediatek.com, fparent@baylibre.com,
        chun-jie.chen@mediatek.com, sam.shih@mediatek.com,
        y.oudjana@protonmail.com, nfraprado@collabora.com,
        rex-bc.chen@mediatek.com, ryder.lee@kernel.org,
        daniel@makrotopia.org, jose.exposito89@gmail.com,
        yangyingliang@huawei.com, pablo.sun@mediatek.com,
        weiyi.lu@mediatek.com, ikjn@chromium.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        kernel@collabora.com
Subject: Re: [PATCH v2 04/23] clk: mediatek: cpumux: Propagate struct device
 where possible
Message-ID: <20230106170048.p4d3rq6kehmf3adp@blmsp>
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com>
 <20221223094259.87373-5-angelogioacchino.delregno@collabora.com>
 <CAGXv+5F8QZGc4oDKJAGbpvubqiewvngURpNhrenS3pcGQNrOYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAGXv+5F8QZGc4oDKJAGbpvubqiewvngURpNhrenS3pcGQNrOYw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Angelo,

On Mon, Dec 26, 2022 at 03:07:10PM +0800, Chen-Yu Tsai wrote:
> On Fri, Dec 23, 2022 at 5:43 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Take a pointer to a struct device in mtk_clk_register_cpumuxes() and
> > propagate the same to mtk_clk_register_cpumux() => clk_hw_register().
> > Even though runtime pm is unlikely to be used with CPU muxes, this
> > helps with code consistency and possibly opens to commonization of
> > some mtk_clk_register_(x) functions.
> >
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> 
> As with the gates patch, could we make the |struct device *| parameter the
> first one? Also for this case I think we could even drop the
> |struct device_node *| parameter.

Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>

clk_hw_register and others are using the device pointer as first
parameter as well. So I think it makes sense to do it the same way as
ChenYu suggested.

Best,
Markus
