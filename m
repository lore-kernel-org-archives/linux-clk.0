Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D59C4338F
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 04:44:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB167610A1
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 04:44:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234904AbhG0EoC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Jul 2021 00:44:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234997AbhG0EoA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Jul 2021 00:44:00 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9936C061757
        for <linux-clk@vger.kernel.org>; Mon, 26 Jul 2021 21:44:00 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id g23-20020a17090a5797b02901765d605e14so3164114pji.5
        for <linux-clk@vger.kernel.org>; Mon, 26 Jul 2021 21:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cDWjDEqi47ElGh7C2oNgk2vsctUysNVRiZueqRzrN1E=;
        b=UHaoDeiHmVbqUuuK2tOuOy6bmjyToLI85HN61nQb2tVZNkd2tjyZnAE0C8ix1OEXHE
         XstQvUClJfmO+QPimqaKYZmvSDcqvIA67u/9Gaj1qIRPHBetk6es9VJuqhZKINhHKAK5
         sctWUmJu06jbfbPNf6YIOTKfznU19MKvKjqiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cDWjDEqi47ElGh7C2oNgk2vsctUysNVRiZueqRzrN1E=;
        b=fxBEUJqNLJBRarJvQy8RR9i+laMUO6TfA4CoUQduF2W2vtzzL9A1OoHnbTiMYNV5Ui
         7Vw/2X2lPFt8cGRmmFrumYyEupqr4rdAgyEuA7Ltlq5gtwlZRuv3RS5FQh0yoXrk2WP8
         pP7TfYjKUQFwvjEDjpoOd0vUHbKOY4G5jFzG8ztAlAyG7B5RNBZp+KXH9KkdHkx5XIZt
         dLlnqKwEUTQ9ZWEXdIyFwzG9efhVWYvDlyxUSZC/BJjn5t/eVKH3vRI3L6xrJX1EVLGq
         mUMm+lIhjOo2Y8QMt2P7iqnlQAHo5Ek+HeDn4wQMVfQ/9Q6a/vXLL4vPrk4DOcvYdxqL
         QWjQ==
X-Gm-Message-State: AOAM533FYRlJ8nosYzLXK5Cv2xDbvKSNA4yBEWmncg643O6gSnp9B3aJ
        p2gqP6meZNHfiY0WFhuiU1siz4l6ji7GsF4Q9Ecbcw==
X-Google-Smtp-Source: ABdhPJzE5fzikckD6W8BCnYoANGcUYqKRBGEc0+o7U0HuCkBAe7GdNeibY0DL5CaQN96ISl+gJhLzrJ2WX9YBmoTOiU=
X-Received: by 2002:a63:3601:: with SMTP id d1mr21373016pga.299.1627361040343;
 Mon, 26 Jul 2021 21:44:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com> <20210726105719.15793-16-chun-jie.chen@mediatek.com>
In-Reply-To: <20210726105719.15793-16-chun-jie.chen@mediatek.com>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Tue, 27 Jul 2021 12:43:49 +0800
Message-ID: <CAATdQgDzh6yME2pDsLuHHMuKA8bfjwHMD5z9yd-VGcdDtBZEPQ@mail.gmail.com>
Subject: Re: [v14 15/21] clk: mediatek: Add MT8192 mdpsys clock support
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

On Mon, Jul 26, 2021 at 7:11 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8192 mdpsys clock provider
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

(snip)
