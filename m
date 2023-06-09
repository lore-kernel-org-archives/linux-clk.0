Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2137EC7EE29
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jun 2023 18:21:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbjFISVo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Jun 2023 14:21:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbjFISVn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Jun 2023 14:21:43 -0400
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94FD33590
        for <linux-clk@vger.kernel.org>; Fri,  9 Jun 2023 11:21:42 -0700 (PDT)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1b04706c974so10221855ad.2
        for <linux-clk@vger.kernel.org>; Fri, 09 Jun 2023 11:21:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686334902; x=1688926902;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n/+y/6j1ALrc42P2Rr76MxD2YIeDBXVc8CafCJ2zOkc=;
        b=D/yvt9OlmzqET3Spmr+JKu9d4YF0aPm4MDBBot24JYA8wNPa8CK46DOmBuIhHzYvAL
         aoPQppOAiDdxDxo2cGmiV9NjpDaQwCiHfIaZsRnZ2zqxwWFNQOdE1thVth95pVuYjIzw
         pDuE3QCQ1MzKshg98M5IfMoYb7G7TKnrUTpf+O6E2QgEMKSgsjd9TXjKa30IQMVPXukX
         q22yVoAEtIYz2U1WlCl2pVRArdh1Y6gIvYAmAqzbcZdj4z2Nvqenb6OIgLdWxuyj88G0
         J8/g61cxms5xnWGsDuucuiVfO+hvabMtc2CZ0VFxCrfnaQwaZLRC+MP2NbPT9IJkLPeb
         5aRw==
X-Gm-Message-State: AC+VfDyl6KWbbFEOwDQY16XjmF9UYHsQg7EvyZ6+FPlOOL2n/dKJhNKu
        FKHHcy1a0uPSIBsLQpWyMWZmgQ==
X-Google-Smtp-Source: ACHHUZ7RUR0qSoKvtN+A82er22MA4OCK6oYpo9NtISCC+Mhu6QhbhjQYpCYoqPSqN3+u4aYXTdNl+w==
X-Received: by 2002:a17:902:bc85:b0:1b0:772f:e3e3 with SMTP id bb5-20020a170902bc8500b001b0772fe3e3mr2039741plb.52.1686334902093;
        Fri, 09 Jun 2023 11:21:42 -0700 (PDT)
Received: from localhost ([75.172.135.98])
        by smtp.gmail.com with ESMTPSA id b3-20020a170903228300b00199193e5ea1sm3591234plh.61.2023.06.09.11.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 11:21:40 -0700 (PDT)
From:   Kevin Hilman <khilman@kernel.org>
To:     Markus Schneider-Pargmann <msp@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH] clk: mediatek: mt8365: Fix inverted topclk operations
In-Reply-To: <7hsfbjxcqs.fsf@baylibre.com>
References: <20230511133226.913600-1-msp@baylibre.com>
 <20230523114618.laajn2et5nbcxszv@blmsp> <7hsfbjxcqs.fsf@baylibre.com>
Date:   Fri, 09 Jun 2023 11:21:30 -0700
Message-ID: <7ha5x8xzrp.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Kevin Hilman <khilman@kernel.org> writes:

> Markus Schneider-Pargmann <msp@baylibre.com> writes:
>
>> just wanted to ask if I need to do something specific for it to go into
>> a rc? Sorry if I missed doing something for that, I haven't had to fix
>> something in an rc that often before.
>
> I think the  Fixes tag is enough to indicate that.
>
> Steven, is there still time for this fix be queued up for v6.4-rc?

Steven: gentle reminder ping.
