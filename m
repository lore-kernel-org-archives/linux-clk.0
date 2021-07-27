Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F13DFC4338F
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 04:41:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5097610A5
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 04:41:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234865AbhG0Ela (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Jul 2021 00:41:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231932AbhG0El3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Jul 2021 00:41:29 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F367AC061760
        for <linux-clk@vger.kernel.org>; Mon, 26 Jul 2021 21:41:28 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id j1so16048059pjv.3
        for <linux-clk@vger.kernel.org>; Mon, 26 Jul 2021 21:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qE4/SqkNnix+M7ct3sQdpg0XGV25TlRZol1gYI9jQFI=;
        b=SCeefJ6MY5kkt/BX3+hEMJXuqVRb7DbGmYWeLSrICIWjinaN+FKm5jW6v4DshennXn
         NTVN6p9TA9qhHO+woUgxz8TUN2f6WiPKk3E5Evj5azRnV5IxJPiQOLSJMWij4QT/13J8
         ZndpPOVcaTZ7xjSKLLzoWlCVq2dmtPo+XgR8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qE4/SqkNnix+M7ct3sQdpg0XGV25TlRZol1gYI9jQFI=;
        b=J+FcOf0W7KOE7JFWvOTTHhAuE7UV/OJdSkmlaR5HgJOvuRSYKasgiOyKqf3HUqJV+b
         SzsOmhBSyK3Acwg+xFFkmzRz/9OXIfF3zYVh8VtAG5+Sfgk4wKTBmhq4VHLBPB2qicTy
         TRjdYIU16W3Em9whFr/WVepBC1fOzJCNPW1LsSXNGWgdW2TX4W9Oex79+qDMlpDUC/cl
         EjTjKkc1rX2cheVz3t4PSOeD4HvfIEGRKCe825OEdAHjzS0XtHAXsTbD2VOx9X/UI9Oe
         g08EaBR0tplKQ2kAZK1LDObNDDZUM2K3DhMKOcRTBqMOp99J2Bc5GtwJNSg+cPJtHmCY
         JhFA==
X-Gm-Message-State: AOAM532zCijjXUxoQWyPE2pjbzIAbbrzo8eHy2W9JmflNvm4pkYj0+AT
        3n5IaqilnqK1PKkh+JM+TfRA5LgKAK/223uxwVIRlw==
X-Google-Smtp-Source: ABdhPJxtKF+/H1IGS0dCsxbFgQ/EnNk+IvHAoHpsU0C9gCRh2mE2O3I3otmdRgeARUulaPAzYLSWEqGjBM75ihdgrEI=
X-Received: by 2002:a17:90a:8403:: with SMTP id j3mr2300678pjn.112.1627360888489;
 Mon, 26 Jul 2021 21:41:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com> <20210726105719.15793-12-chun-jie.chen@mediatek.com>
In-Reply-To: <20210726105719.15793-12-chun-jie.chen@mediatek.com>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Tue, 27 Jul 2021 12:41:17 +0800
Message-ID: <CAATdQgDJhe7BvNHs0FgckMaS+XSDco4mGAyjAq6PrMFwpeL=bg@mail.gmail.com>
Subject: Re: [v14 11/21] clk: mediatek: Add MT8192 camsys clock support
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
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        Weiyi Lu <weiyi.lu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Jul 26, 2021 at 7:08 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8192 camsys and camsys raw clock providers
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

(snip)
