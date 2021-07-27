Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A92ECC432BE
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 04:46:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C8D360FF2
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 04:46:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234962AbhG0EqJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Jul 2021 00:46:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234905AbhG0EqI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Jul 2021 00:46:08 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49564C061757
        for <linux-clk@vger.kernel.org>; Mon, 26 Jul 2021 21:46:08 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id c16so8798746plh.7
        for <linux-clk@vger.kernel.org>; Mon, 26 Jul 2021 21:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lQui5Bn1AetwvRytXDb4JDYFQOZL+N4GRQAdei53URs=;
        b=Th5t3G/Ufa2Ob7SpZUUyIAqxOzwb4tOZFM+k1JoB0DhM88V1pL4Yr0MkoWzKCRp8OS
         tqH8uIZnwJTKC1IkFWUfKxGxMcqRPyUn6Tqb4bCPhxgQgSaqQuyODZ7itTLs/L8/O/AD
         F6uVySNBTaE7l2hLFTzeKgys751X40fDx1XBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lQui5Bn1AetwvRytXDb4JDYFQOZL+N4GRQAdei53URs=;
        b=kpOcEN5WiBThUdFqXsCNyO3/rWYggQq70V5ePhuspeMT9afTLDVD5ltRsLv3jE+4gv
         XLv3JrD2zbZMJRl5BBj4f3JyNpaegI+dHsFm7vdP8A7ii2Rgc662dQ9V4JMWD5VsLR0q
         NWItyI9NagDQ7mq4Rgjbac89/lKBGHmDHPRm+7pt5JCrqthaNNj80iLWd+zn+Cf/P3fq
         ysIDwnuiJdhw5Dy9IzCWz4/gFssnPxhQOImU23ffciFM7K2j1pvtB+a9TXTNfiZF/JqB
         GqzSzNsh4nroQ2mDFOXnbJfO1aw1jO3L+n9QE8WmMOX/QM3exJQ7RLEbzPlFf1KT7Wxr
         jRhA==
X-Gm-Message-State: AOAM530Mc7Nv4wKcWkhWvyIsce8f6DXo91KB4zPo9JeD3P7TCRnViwHQ
        63R+0Yt4lXFyI/5lZpXv/0ebZlGq0t0yARf7c3uDHQ==
X-Google-Smtp-Source: ABdhPJyHwFZ5Iqv3unP+z+8lBwV8+TrKOxTRo0U3vA0SXeGCBVMXgm55Ilu8NwejZFEDdz1+OD/t38J49y/2dvAffKs=
X-Received: by 2002:a17:90b:2251:: with SMTP id hk17mr2395627pjb.126.1627361167866;
 Mon, 26 Jul 2021 21:46:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com> <20210726105719.15793-19-chun-jie.chen@mediatek.com>
In-Reply-To: <20210726105719.15793-19-chun-jie.chen@mediatek.com>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Tue, 27 Jul 2021 12:45:57 +0800
Message-ID: <CAATdQgDeXHhFQY8ktOYTaeZGUTuNrJOSuPSC5kuBASS7_8hsgw@mail.gmail.com>
Subject: Re: [v14 18/21] clk: mediatek: Add MT8192 msdc clock support
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

On Mon, Jul 26, 2021 at 7:00 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8192 msdc and msdc top clock providers
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

(snip)
