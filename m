Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F5AC4338F
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 04:42:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D11D861078
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 04:42:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235068AbhG0Emu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Jul 2021 00:42:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234983AbhG0Ems (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Jul 2021 00:42:48 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CCECC061764
        for <linux-clk@vger.kernel.org>; Mon, 26 Jul 2021 21:42:49 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id k1so14263323plt.12
        for <linux-clk@vger.kernel.org>; Mon, 26 Jul 2021 21:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JAG3r4q1eXvW4jnmIxPlqvAFPEHnfRa806/4BqgTPyc=;
        b=e7wngxPzpp0yJQOTn+ibbOBw2mwLX4Sys3bp7NiFrw+mlxjWp6RHpc7h/0VT+sGgJK
         Aeev4HodmIPg0iBkKNcOQFWj58CYndJ8oCY+gZn8C1RSygbYI6G8sm0+hnfTXoHe6259
         0I+UhsI0GlYWAUpmtZjsOGa7VRJio3Nb5CSfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JAG3r4q1eXvW4jnmIxPlqvAFPEHnfRa806/4BqgTPyc=;
        b=fdk31xmzKZZo5ocUVCmphTCVZdqHLoQrwghT2mvGVzoZ+VSmC8ImlsL6g64qdkLFNC
         G3QHzaka80sn0H/fznS/cvyAj2d6QCDPP+MH/oa2RJ4NQeCGAMg+kDWcngRRyOqDUr7W
         sk0Fd4jFLc28gDpd7TZLGsdalHeyL8gZRVd1EcQz2RgC5jufD6ijEVyEYrrS2cZJXNBL
         +0TcsYE4XZJYobn1qhlMZ0gL041JFJMOzpn+lq+6+/q6M0Ui31C++4JQpqq37Gysl3zr
         yk3Fqaxg9/rLl91FvrfKkvSTs14rDDCy6Rp+ZXlBdU3AVifAl7ciA0QvevrkRImWL3gX
         Jviw==
X-Gm-Message-State: AOAM530zdkRVmMscpWRVJFjEHZxEKU6vGDCSScAwYGdbV0H8NVguZO4N
        16Xf6FuRO5tij2xb3uLiyuoNrLOP5LI09r165bPVNQ==
X-Google-Smtp-Source: ABdhPJwdTmIIqDIkRt5Ak/lU9NfF+K5qaQxw4lncfdy5vGygLf6ht6RWYKwum/QaKt4mbq4xALxTpF8TnTjnoO5kRaQ=
X-Received: by 2002:a17:902:b788:b029:12c:2888:9589 with SMTP id
 e8-20020a170902b788b029012c28889589mr6389338pls.60.1627360968879; Mon, 26 Jul
 2021 21:42:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com> <20210726105719.15793-14-chun-jie.chen@mediatek.com>
In-Reply-To: <20210726105719.15793-14-chun-jie.chen@mediatek.com>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Tue, 27 Jul 2021 12:42:38 +0800
Message-ID: <CAATdQgDuSuaP=10-WN5DpCEisJYMVjbGdSb81tFyGC5CXyBs2Q@mail.gmail.com>
Subject: Re: [v14 13/21] clk: mediatek: Add MT8192 imp i2c wrapper clock support
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

On Mon, Jul 26, 2021 at 7:08 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8192 imp i2c wrapper clock provider
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

(snip)
