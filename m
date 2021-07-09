Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F7EEC07E9C
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jul 2021 06:39:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56F5C61407
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jul 2021 06:39:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230269AbhGIGmb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Jul 2021 02:42:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230434AbhGIGmb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Jul 2021 02:42:31 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D51FDC0613DD
        for <linux-clk@vger.kernel.org>; Thu,  8 Jul 2021 23:39:46 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id q18so21226035lfc.7
        for <linux-clk@vger.kernel.org>; Thu, 08 Jul 2021 23:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GdbwvfH2damctRl688URppCcO8HiCSnYmA4puvxValM=;
        b=KARnKsI6wDXVlxoOJqqGBaT9Cvtu6meuaoim3L0lyRJTOtNHXTW15+lu+fX2Avc4SE
         sclUFBx2eXDhb5Ek6QXiwTQZFR7u0/lkRPCyWJj7CZ75DdaQuqELDVVUi+O3wDDsq6XB
         xaCqqW3u5S+0Z+S72yZYXwfyQ8NqtI/64qcv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GdbwvfH2damctRl688URppCcO8HiCSnYmA4puvxValM=;
        b=K+Sltn2DLSN7xQ9OeUPmDkCRQXeyoYLcknHV+Gsx1TDlWGnZZdLbetayLtJZgxgb+P
         W7BmIZuxsJD/SOvmIy0na7y1o8Y4sg/nHOY2okyXQLt6KhYe+mAyd0uSPL8kdGY4+W1d
         Cmu5cLXsrdZD1WiIbrPRaXUUR2/B0uMrjpQg2Ru4Cs9SPi4GDOPT4Qb8ppjnFW8eCFWE
         ozcxCbIj9rLEudG6+14q4+jPC0sHx0ytdTfnUdBd5fPE/jKUuC0Fq+j6S6XnBNHuHaLj
         Cxy6Pn21PzZ1233op07h0V3C9xnABaafTiZW3tXXDkmj4Wgilpn2kdXCkDz75SxzV1iy
         h6OQ==
X-Gm-Message-State: AOAM5339SwKArVrWrK33LzrJAe4iEuXfCb8QrDGZvZ6VBSn2NiSKUVct
        pr6wEXf8Cv1OorKK25t5mKreg01WBlhDhkXs8c4TmA==
X-Google-Smtp-Source: ABdhPJyxfIq66PAyhcwZKY98vY9gxJePWfUzcQTs7lPlWbqVj656LIF99F/PEycna45aCaK+KtkLo7qALswN1VrtyeQ=
X-Received: by 2002:a19:ca13:: with SMTP id a19mr27080916lfg.647.1625812785287;
 Thu, 08 Jul 2021 23:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com> <20210616224743.5109-13-chun-jie.chen@mediatek.com>
In-Reply-To: <20210616224743.5109-13-chun-jie.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 9 Jul 2021 14:39:34 +0800
Message-ID: <CAGXv+5Ggv1ouJfGwfk8XbTZ1c61-QU-=M1pA=VB4oJqWwE2r3A@mail.gmail.com>
Subject: Re: [PATCH 12/22] clk: mediatek: Add MT8195 scp adsp clock support
To:     Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        LKML <linux-kernel@vger.kernel.org>,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Thu, Jun 17, 2021 at 6:59 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 scp adsp clock provider
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Same comments about commit log and Kconfig option applies.

Code looks good otherwise. Note that the datasheet I have does not include
the registers used in this driver, so I cannot confirm them.


ChenYu
