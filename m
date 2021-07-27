Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E957C432BE
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 04:37:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D15161050
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 04:37:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234745AbhG0Ehn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Jul 2021 00:37:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233496AbhG0Ehm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Jul 2021 00:37:42 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B5BEC061760
        for <linux-clk@vger.kernel.org>; Mon, 26 Jul 2021 21:37:42 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id ca5so3677138pjb.5
        for <linux-clk@vger.kernel.org>; Mon, 26 Jul 2021 21:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sHCpjMG3bJheGspgPwPgXoTuuhMeCojN1Vcw1raYNbg=;
        b=XImY6I5BO9PSo6vX6AyLIflKwvN5weee2a4Oh4nHjX8SbZeTMAYJXg0QeK2FKOnAh2
         J7Iao0Pmh2ZE30+livAgtKfi6ljvex1FccPw3GWqwx2pJ3E6axqUC/LTf0Atarck2uor
         KuPkt8VrZlVVYG3ft4eCSuLwyqmxlEFIJFots=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sHCpjMG3bJheGspgPwPgXoTuuhMeCojN1Vcw1raYNbg=;
        b=jg2EwUEf7Gp3Nia21Pw6FWcJVIe38XkrI4/l7n0CfPPzNftwpupiWCAvqFOzOAG90M
         85TXJ5UNQ07g65+WEz5jdPBNdBC3w/d06RIIhiDnxTocflrV82p9Kr+FkEyTl6X+htMS
         DwhQbFY+3kl4tWarVI/wrVGdZAF0MBmwncW3ExEXTJq+wlt5ESF8Z1pxE6otRMas52Uu
         SvFgRL9/cXuz2iOKnkFdMmLbfl76MfKm/C4MjhBbJyq3Rx7P2zphaG8x4T+yTjMFj394
         aQPeDLxyLYQeB8u1FwLME+aCPIhxrWKGwWBd2TIY8gtRKND9PupHOpDHuumxmWsGPAXN
         k8ww==
X-Gm-Message-State: AOAM533rsgeceQJfvAv8XrTbZLZ6CGjofZjiR/vf3hFm1kCGq6Y6DLxp
        R4vrOyPdSAlcuFJSzPDvYo+RO0Anw51VPqeLsTcz4A==
X-Google-Smtp-Source: ABdhPJxoMQnZyC8tW7HpIKMFF7+41G/TLa4K7yYK4o+MYvmtPlRKMcIhTLK2m30euPRcf43I2fDHvUwmfzLx9pB6wjg=
X-Received: by 2002:a17:90a:8403:: with SMTP id j3mr2289387pjn.112.1627360662060;
 Mon, 26 Jul 2021 21:37:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com> <20210726105719.15793-6-chun-jie.chen@mediatek.com>
In-Reply-To: <20210726105719.15793-6-chun-jie.chen@mediatek.com>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Tue, 27 Jul 2021 12:37:31 +0800
Message-ID: <CAATdQgBdSqotJ_ZWSGzq7SbK-=qzwc+ptQidNgXFjR2C2VcPgQ@mail.gmail.com>
Subject: Re: [v14 05/21] clk: mediatek: Get regmap without syscon compatible check
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

On Mon, Jul 26, 2021 at 6:59 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Not all clock providers need to be marked compatible with "syscon"
> for system configuration usage, so use device_node_to_regmap() to
> skip "syscon" check.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

(snip)
