Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEBC6C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 21 Sep 2021 20:13:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE3A561131
	for <linux-clk@archiver.kernel.org>; Tue, 21 Sep 2021 20:13:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233851AbhIUUOh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Sep 2021 16:14:37 -0400
Received: from mail-ot1-f47.google.com ([209.85.210.47]:46889 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbhIUUOh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Sep 2021 16:14:37 -0400
Received: by mail-ot1-f47.google.com with SMTP id c8-20020a9d6c88000000b00517cd06302dso114413otr.13;
        Tue, 21 Sep 2021 13:13:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uHUL6Iz8EXHQvPOcnqiZYyFyZ6VM6tNjGeJr0wxEX7E=;
        b=BhlPiEJqmD0mExuYzMbbgGpkDszgabPw6p7nt0Ihaldc0L5unGldagC8st4epZgTNo
         OBw2Pz5YeZO0r2GdXfdE0z8eLHhBlR9hA4hko/8ubCb0moCcRnidrWvv63wppWSxItgr
         iKfvqgRqn45Q2iJvR0TUzDWhKdluiedVzWtdtck1h8OxpsP8EX/d9VaErOIqx7BS8hb2
         ReRdC4L50Or0i3ht6MI+XZbRt67FHFRNyxj/xuTgTdR4Ku172fuvhu1yEvEqWIkYGqE1
         w5UiNyEtfsiSZe2HQKgGx2JKZQJ5G54AErTLARlWjVr+YLe5II9gljYI3P5/moFAS5ay
         PKFQ==
X-Gm-Message-State: AOAM533s/+UZB+AWIBzVdCxprqWt/3vDrfqaA9Xkd6N+9i49hxYtQnk4
        Ki6bGs2tmL3RL9yEnwHB3Q==
X-Google-Smtp-Source: ABdhPJxPslvEjD7cgvwIQogk2+Y1wTDq7UrCFB2M1PkVz6HzMsaylWC1bJf3/seTJhFZ/5tUGJ7Avg==
X-Received: by 2002:a9d:615c:: with SMTP id c28mr35002otk.381.1632255188349;
        Tue, 21 Sep 2021 13:13:08 -0700 (PDT)
Received: from robh.at.kernel.org (rrcs-192-154-179-36.sw.biz.rr.com. [192.154.179.36])
        by smtp.gmail.com with ESMTPSA id q5sm21569ooa.1.2021.09.21.13.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 13:13:07 -0700 (PDT)
Received: (nullmailer pid 3253929 invoked by uid 1000);
        Tue, 21 Sep 2021 20:13:05 -0000
Date:   Tue, 21 Sep 2021 15:13:05 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jens Renner <renner@efe-gmbh.de>
Cc:     devicetree@vger.kernel.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org, robh+dt@kernel.org, sboyd@kernel.org
Subject: Re: [PATCH] clk: si5351: Update datasheet references
Message-ID: <YUo80QE+/n1I32eo@robh.at.kernel.org>
References: <20210913074823.115212-1-renner@efe-gmbh.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210913074823.115212-1-renner@efe-gmbh.de>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 13 Sep 2021 09:48:23 +0200, Jens Renner wrote:
> Silicon Labs is now part of Skyworks Inc. so update the URLs to the
> datasheet and application note.
> 
> Signed-off-by: Jens Renner <renner@efe-gmbh.de>
> ---
>  Documentation/devicetree/bindings/clock/silabs,si5351.txt | 2 +-
>  drivers/clk/clk-si5351.c                                  | 8 ++++----
>  drivers/clk/clk-si5351.h                                  | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
