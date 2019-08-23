Return-Path: <SRS0=Qq/y=WT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF55AC3A5A2
	for <linux-clk@archiver.kernel.org>; Fri, 23 Aug 2019 08:51:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE46722CEC
	for <linux-clk@archiver.kernel.org>; Fri, 23 Aug 2019 08:51:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p6SBn6sD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405047AbfHWIvT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Aug 2019 04:51:19 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44502 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390826AbfHWIvS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Aug 2019 04:51:18 -0400
Received: by mail-lj1-f196.google.com with SMTP id e24so8120756ljg.11
        for <linux-clk@vger.kernel.org>; Fri, 23 Aug 2019 01:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FXtQDuMScF/1nReve4eretX2TO/jfCiedtGuRQR2hjM=;
        b=p6SBn6sDUBeFLX9nMJmZGZC+PTQMLkZJ8aTvGmL+qINEfOstq/jNuLob/ghlirv1KJ
         cZRyeXtQ1faKYUnTHuBCVNy/y+gs5O1Ob5u1hV9AU5ut4mXZX+Okq3HmZsxsT+DBbIGs
         J7sCK51VUU3lrdn3m0sttx9PyWO3QwemGQnd1cRnP0eZPC4Pa8fqdl0xMWR23wDeqeAt
         FBxKNcv/H0DFEFdPjz9wsTwbnCzc2Hnz2I0UXU6Qlf1/20m+dC5NojBZhY02m301Xx20
         8SBl2+ZAWxgHnmt/joknqH100+Al87qai/W4q6tyFUZ1rvjBxGuZwVUWExcs1/CQ4lLY
         4fhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FXtQDuMScF/1nReve4eretX2TO/jfCiedtGuRQR2hjM=;
        b=GX/6sEroD9JyiNNNhjTBGcMN+biz9hgPp9KQAIBe9qXocZuCGbZ+Yd67HiBkjjvhjg
         7JR4ei7+SM7r2QOec9mpekVjSU8VBWI5hGxlPe/dFYvOQitGZQCFC9iFJq9PgD6P9ED5
         S4kYUIJCmSTK0AQqwQmy4/bO5xfpPASvSG6mMcA+qEADORFhDJ0Xh9hEXHewo6ln0hpk
         2pil/VRFzE+OrvlloSBP4oBmK/+ZRVwU/8vqFEPSyY0wduATfH0UFiHy+bHCmebFUbA6
         TS1c6I9q3Ho3GnO8cnLFmQQCE+zr+tgtd/7N9t2O1A91hu116yL+81an3/GLa2uHBF/o
         W/Ug==
X-Gm-Message-State: APjAAAW7Urz/TPgViY4P+yf+let0sEM/LamFp60mWJM04LIWa7IaWmNS
        DFojvIwFvoXTRhl//8PWHFMJg5JvPwSMkinTG3zsfA==
X-Google-Smtp-Source: APXvYqyppYyNq83SxxmmRdWOnL0oOzeUD0rB8qh3X7YKYtXA9sxXcXqHi/9iYmrgLahKeTty/OM4UHWE1xxoqpX3Dgw=
X-Received: by 2002:a2e:80da:: with SMTP id r26mr2124440ljg.62.1566550276856;
 Fri, 23 Aug 2019 01:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <1566206502-4347-1-git-send-email-mars.cheng@mediatek.com> <1566206502-4347-4-git-send-email-mars.cheng@mediatek.com>
In-Reply-To: <1566206502-4347-4-git-send-email-mars.cheng@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Aug 2019 10:51:04 +0200
Message-ID: <CACRpkdY4sVV5oyFa+a30dY2A9tsKpzTeuQ8ChmnXcm-5_eZkVA@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] dt-bindings: irq: mtk,sysirq: add support for mt6779
To:     Mars Cheng <mars.cheng@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, wsd_upstream@mediatek.com,
        mtk01761 <wendell.lin@mediatek.com>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Aug 19, 2019 at 11:22 AM Mars Cheng <mars.cheng@mediatek.com> wrote:

> Add binding documentation of mediatek,sysirq for mt6779 SoC.
>
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>

I'm relying on Sean to review this and ACK when he's pleased
with the result.

Yours,
Linus Walleij
