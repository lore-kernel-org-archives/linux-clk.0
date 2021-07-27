Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B801C4338F
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 04:47:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3582861078
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 04:47:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235050AbhG0ErA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Jul 2021 00:47:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234865AbhG0ErA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Jul 2021 00:47:00 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC2BEC061764
        for <linux-clk@vger.kernel.org>; Mon, 26 Jul 2021 21:46:59 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id k1so14272985plt.12
        for <linux-clk@vger.kernel.org>; Mon, 26 Jul 2021 21:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ti5+nTjIMGmJGpw/z6LqKbHFp/KaMX3fxXfNJ8H49/4=;
        b=diXZU81t4iyvnv/18XGbkyNKsHyeTT9MhBeINHDsCaFjhj3nWJ+Rjt3mLI+jjXblu/
         MsWhavsHPf+L3BrTp4KG1nB9DENFuRXtgIl7F+eti+sB7higo79QsJAGV3StfU/AOJwI
         1LQjVuXldV3S5ZFqCm+iiqPFuli0bfz7aGmUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ti5+nTjIMGmJGpw/z6LqKbHFp/KaMX3fxXfNJ8H49/4=;
        b=bUPAUSBkyIREzrTqup2mtHCg7tPFSYcSrBuLlXaimpEA+lpHaR7kIIT00HyldTzh79
         GLafWN3bRvmNzJGv9it/pNO3kzi7cLMJvpmW/zrnBgCFat0HeTkLN8Gc+ZDEcDzpaQOt
         2pmoQkC2s8xI7/q6ENdH58ekOnaFcakHAgLNX3f5dP+T7Ul1++i8Bx95jL6jqRTEHGFU
         c8bqhXl/Pzn6UlF7O2/GdCkBqVuwO771qD/SDeVk87Yzif3SBI9oM0GrPeInlhtQq4sa
         3f8P/SZ4g6droxugsN/AxpTrop00Mz/EtrUlXO18Op4z9uz6HEKP7kDCFvuDAlTULoin
         V5Fw==
X-Gm-Message-State: AOAM533FiMtxQ1/ZZyXWlha/7YzShgXrTEZxPPN9wQbhtld+Tk9NmoTl
        PNe2yKb7L4LAxFKPNmiF8AQe4dBpeRZPs/KQpg3LzA==
X-Google-Smtp-Source: ABdhPJzNMWhPWVTRIcWwCN3GmAc9IllPsC7xBOZ11CfMOfTT+kPcwdmug6nzk8s57FDGJfS0aOZkGmjiKvm8+NzOl8s=
X-Received: by 2002:a63:3601:: with SMTP id d1mr21382265pga.299.1627361219535;
 Mon, 26 Jul 2021 21:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com> <20210726105719.15793-20-chun-jie.chen@mediatek.com>
In-Reply-To: <20210726105719.15793-20-chun-jie.chen@mediatek.com>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Tue, 27 Jul 2021 12:46:48 +0800
Message-ID: <CAATdQgD5EpUv-R7J8keHodbkBOeuQGxWQO-9HXsCFxDu4_916w@mail.gmail.com>
Subject: Re: [v14 19/21] clk: mediatek: Add MT8192 scp adsp clock support
To:     Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, linux-clk@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Project_Global_Chrome_Upstream_Group 
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Jul 26, 2021 at 7:12 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8192 scp adsp clock provider
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

(snip)
