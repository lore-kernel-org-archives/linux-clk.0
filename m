Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26BC6C6FA82
	for <linux-clk@archiver.kernel.org>; Mon, 26 Sep 2022 03:21:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233243AbiIZDVU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 25 Sep 2022 23:21:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231396AbiIZDVT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 25 Sep 2022 23:21:19 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 224322194
        for <linux-clk@vger.kernel.org>; Sun, 25 Sep 2022 20:21:14 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id m3so7197449eda.12
        for <linux-clk@vger.kernel.org>; Sun, 25 Sep 2022 20:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=hFRauekI8mX749A11zabMJwKnZcHcXKuDmO4So8v3vo=;
        b=AixRZnVWOzLnBwZfBtg6on2IFpinSMdiKGTGGn5iUYGSUPE1m3ciQrWBgacohOfZq9
         U71cXJlHnfjd7reOEUfvcUHl9kBuYXKnPwxe4kznA3T3bWB4rtqHA94ugxHWSNSTMvhJ
         pul2qPnhFvHhbaRs4NfMYx2PTEa67sX1Frz+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=hFRauekI8mX749A11zabMJwKnZcHcXKuDmO4So8v3vo=;
        b=kqrXBaLp/DJMTc5b5FKNi3gml2TZ51T2e6hI7ePe1xnTRxmr38sfgsW7IMd8B19Ghk
         vhxudTd5wGM/523hr1IWB1s92D+SwDmvGSK9yIObMM3CWa4hX280JPlNNGQmWdQWv3zQ
         izhRmdjxeeMUUftiP6sUAC2CFai66e3S7DZdO5Lx9FGIPdluywYJvJBeCXc/V7YUAp3p
         Qazn+WGsUhiaLiv0DMcLafWZTAA5WXS7TiJCM42uuPIFYSEO2unQNsX4JlQwejCjZXig
         cBIjpf87u+pq+zcwGvzJrnSCcDhyneolSsotg/tYJY5O7gOkgwtzXDsDppboH9jUM17g
         F50A==
X-Gm-Message-State: ACrzQf2TuA789oHlFj9Ymz8h9Ll59dDjuRW5DXAy1wAgXhLN5eXMi/mB
        aWVPKUEmR5X42lxN3wqSE56J7IgyR3gr/YXt7R2rVw==
X-Google-Smtp-Source: AMsMyM68ZDwrrQBoFqZZC3KRonbtxs8Nb2DYXYPzyNANDUSJ7C79zpcMAPR6pS/a5apEOFxLB3kTcuzXbEP655raLi4=
X-Received: by 2002:a05:6402:3904:b0:451:f01c:9217 with SMTP id
 fe4-20020a056402390400b00451f01c9217mr19718052edb.78.1664162473029; Sun, 25
 Sep 2022 20:21:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220915072458.18232-1-angelogioacchino.delregno@collabora.com> <20220915072458.18232-7-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220915072458.18232-7-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 26 Sep 2022 11:21:01 +0800
Message-ID: <CAGXv+5FePqwjXW3A=7qZEayHEKc3JQOm_AFDXNZEJaapHqbxGQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] clk: mediatek: clk-mt8195-topckgen: Register
 mfg_ck_fast_ref as generic mux
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
> This clock was being registered as clk-composite through the helpers
> for the same in the MediaTek clock APIs but, in reality, this isn't
> a composite clock.
>
> Appropriately register this clock with devm_clk_hw_register_mux().
> No functional changes.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
