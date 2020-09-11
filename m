Return-Path: <SRS0=ogEK=CU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C0B2C433E2
	for <linux-clk@archiver.kernel.org>; Fri, 11 Sep 2020 17:12:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C83D22204
	for <linux-clk@archiver.kernel.org>; Fri, 11 Sep 2020 17:12:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PJHJwRXr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbgIKRKt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 11 Sep 2020 13:10:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726025AbgIKRKh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 11 Sep 2020 13:10:37 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01C3BC061573
        for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2020 10:10:33 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id z19so7839317pfn.8
        for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2020 10:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=i2W71MrrzMNYcyB/z7lfhjSe/syd2lqbfSWnk+mqe6k=;
        b=PJHJwRXr9q+ni6PIu74aQcOfM/Gl7Qd/RuGgGPBdnIh4ZmUSrOh9BEI/iTWgtvVFHl
         nRj+qkLuIElk8sldSasPp/NSKofad/GikGmmlQ+rQHDNxxLPJOQ5gQw/qJaAuFKtU+xS
         i/DW3GLj2V1MfalSaa3iJNvwxCWEmQReah/J3+C+VqFxbCQeD4pucFyb3WrDldANR8HA
         8YWWkFVg+7TTaPVL9ay2wrJZUZOeou50SMQDK5t7e4VqNWozSj0d+rT0unmUK2WfMgLw
         5UAQ8WT9x8QScwXmP5aPjOQdbP8FW2IVwvPfcIJi+KRFFcszbfBtvxo9jLlhRNsH1yi9
         KZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=i2W71MrrzMNYcyB/z7lfhjSe/syd2lqbfSWnk+mqe6k=;
        b=C5Mq1XZvLyde4cc4wC+HnmrZeGrQwDQF4IfsuyP8H71ilc3XMaUz0CsulGU1JJobaj
         xvJ/nRr1aaEVmpZfjbsq02gXlwjdwfET/boAs9Ie7kLi9BAcBKxxb1ZjHuHV+bOhcyYO
         tNz+ueepyupTYXrBQ8Lz5KkfIgrVmHkNnJnkq4JLcPuj78NXRFXtkds1yl82iYG2s0+u
         8NHa6oBjaJ+mk7PfWBptHFpJFoj3pB+8MR1RRzt6yefT3CAf+705G6loAmNtZe+a92zm
         KpXFoYFdKZsHa2vNTYtlgCQDymhKu8gRhuvv2JfIbRAVT+Q0YRgULFxv6uVDFT32nr3/
         ReGA==
X-Gm-Message-State: AOAM532LEuW+EZ+gPk22jMAHXhjDKoDVlroddY3ln+oSZ/mSVaLBCepz
        dljorUVqfSJYcPQxScNRzOOi2kG9pSvoFuj0
X-Google-Smtp-Source: ABdhPJycx615a/xlcejhPU3i6TW6bxV5D53F0plZu7u8/oXnECZBgQgnYzPAAWChPwnxp/0WDO63qQ==
X-Received: by 2002:a63:ff06:: with SMTP id k6mr2295126pgi.321.1599844232413;
        Fri, 11 Sep 2020 10:10:32 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id z28sm3161139pfq.81.2020.09.11.10.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 10:10:31 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>
Cc:     linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: meson: axg: add Video Clocks
In-Reply-To: <6132edc1-0256-8eca-d5fd-8870aed5bb60@baylibre.com>
References: <20200907093810.6585-1-narmstrong@baylibre.com> <20200907093810.6585-4-narmstrong@baylibre.com> <1jy2li9bym.fsf@starbuckisacylon.baylibre.com> <6132edc1-0256-8eca-d5fd-8870aed5bb60@baylibre.com>
Date:   Fri, 11 Sep 2020 10:10:31 -0700
Message-ID: <7hr1r8xmrc.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> On 10/09/2020 12:13, Jerome Brunet wrote:

[...]

>> Why is NOCACHE ? Is there something poking behind CCF back ? if yes, why
>> is this required ?
>
> I'm surprised you ask this since the situation hasn't changed since I pushed the
> video clock for GXBB, then G12A.

Even if the situation hasn't changed, providing context is very helpful
for new reviewers or reviewers who might need a reminder of that
situation.  I for one had already forgotten the video clock context so I
had a similiar question as Jerome when I saw the NOCACHE and UNUSED
flags.

As you know, new usage of those flags is always highly scrutinized, so
providing the right context and explanation, even if it's repeating
stuff you've stated elsewhere, can help preempt any questions.  

> The switch to CCF for the VPU is still planned, but until now I was unable to allocate enough
> time for this huge rework.
>
> Since I'm the single DRM driver contributor and lacking any other reviewers, I must deal
> with new features & bugfixing before moving to CCF.

Not at all a blocker for this patch, but just curious do you have a TODO
list someplace for this driver in case others might have some time to
help you with the migration?

> The clock situation is far from perfect, and I'd also like it to be solved at some point.
>
> I'll add the same explanation I gave for GXBB in https://lkml.kernel.org/r/1541516257-16157-5-git-send-email-narmstrong@baylibre.com

Yes, that's perfect.

Thanks,

Kevin
