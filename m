Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C29D3C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 20 May 2022 04:53:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345445AbiETExN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 May 2022 00:53:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345452AbiETExE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 May 2022 00:53:04 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2AB314ACA4
        for <linux-clk@vger.kernel.org>; Thu, 19 May 2022 21:53:02 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id kq17so13498742ejb.4
        for <linux-clk@vger.kernel.org>; Thu, 19 May 2022 21:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HelS1YSgoBW0SE2UIxwjEVxXmUoAGRP6Ud70VaUb1RA=;
        b=H6iH3aexSzoRS3xXyRLeJheX9vWo0LSI92UAWGJj3vVnikNVcBAUVV//3jW+OoHWMo
         c6QuxxhcpXAZBwmBxi7/BCYKY2HuDVbJgHBMKEtcou/69yjh3SsfubfIpwV8ZiWSmLnM
         9YQff4597xej1VzxR5vTD6CKVagarFZCMisUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HelS1YSgoBW0SE2UIxwjEVxXmUoAGRP6Ud70VaUb1RA=;
        b=4Q7Q7garXANIAcfqZxVivo3TXseePMg767CabWWMCy3W63FEEHU7ip8xkii+gcSw6d
         z1IEi+vHLDCIi9pZrDu8wwTJOgmOt08iT2GUzJfbUt5ZAXev1mrbbxg0tCEGoIx5+OSb
         Rx8zNTxl5fLoOqi3oAfSOt9bST6AYX6UUC9nd+mUaDil1ZI31ToLmvHadozzw3CON8Yu
         9/4rocxw6B18h8IqbSxyztDUmZ3yowzevjsVmBnxKZOUERCpCcnYsRbk0Gz+Ip6bMCh7
         UdlmCZ5SpXlxdJooJ7ZAAddENGiULO1Ldk66Va2H+LcHWhpKa55ddjsY/ixc1hrB1npm
         qjXw==
X-Gm-Message-State: AOAM533DyrBvyqf7bGCxAB89UAuLbenmzpFUYvR3fqcrEfIBlXxFzsDj
        JZPMn1jTiY8mkJewQS+t9MJhld3y/8fCI8qVnvfQLQ==
X-Google-Smtp-Source: ABdhPJx//tzm42OLUTVgIaPY6+uQ1fk21PSPAoxge18XjLdO9zIresHOvI3h20PeWG9DGgGmlfuWizAbefFCfNTPqQQ=
X-Received: by 2002:a17:907:c12:b0:6fe:22bb:7a0 with SMTP id
 ga18-20020a1709070c1200b006fe22bb07a0mr7327804ejc.450.1653022381201; Thu, 19
 May 2022 21:53:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220519134728.456643-1-y.oudjana@protonmail.com> <20220519134728.456643-2-y.oudjana@protonmail.com>
In-Reply-To: <20220519134728.456643-2-y.oudjana@protonmail.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 20 May 2022 12:52:50 +0800
Message-ID: <CAGXv+5GNoi_e2Ms3rcTTZ59k+_TZOB9qBM0p_BtE8EtDKYfpOQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] clk: mediatek: gate: Export mtk_clk_register_gates_with_dev
To:     Yassine Oudjana <yassine.oudjana@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Miles Chen <miles.chen@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
        Rex-BC Chen <rex-bc.chen@mediatek.com>,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, May 19, 2022 at 9:49 PM Yassine Oudjana
<yassine.oudjana@gmail.com> wrote:
>
> From: Yassine Oudjana <y.oudjana@protonmail.com>
>
> This allows it to be used in drivers built as modules.
>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
