Return-Path: <SRS0=eZcb=7X=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CB48C433E0
	for <linux-clk@archiver.kernel.org>; Wed, 10 Jun 2020 15:26:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E6992078C
	for <linux-clk@archiver.kernel.org>; Wed, 10 Jun 2020 15:26:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNMgHeFC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728481AbgFJP0S (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Jun 2020 11:26:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726979AbgFJP0R (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 Jun 2020 11:26:17 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC870C03E96B
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2020 08:26:16 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id x11so1077469plv.9
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2020 08:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FndB9mE7XEJ2sIQ4EBxvg7M1KNya5kZSTJIb+5ksj7M=;
        b=ZNMgHeFClRTQl+vubc0Qjw6apwf2tnicTGnReSCunIPAbTa7/9bZUXBghg2jMtq6AI
         NtSks0whqup43PGa40/dQjIbqgKnSynvvuQo8lQ+GbeQzx/a3FrZJR5MipQKX877/ud6
         85qbCReU3lGtze9I/Ee3ycJehyy6Kf0IPZ9JwG5asaLuWnDDAtKvVRo2dRw4Hy+00a8k
         2+cFh1tOR/fAiIoVowYNh9AD7ijoSJRFINGc3dXy5Gjn8B4eYHfER50BrEVFZ5R92ity
         msXhYZ6Odwpncuv00KDuNqFquaAgJO44vGQn0u5N+7VPM84aX+hYgyAqMgRH4mR5oFWC
         O+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FndB9mE7XEJ2sIQ4EBxvg7M1KNya5kZSTJIb+5ksj7M=;
        b=fOK+tmGSl5QqFypB+jW5gAzkEHggZX3qP3RZ9QOqTovvV8h9OOY64AGwEb7sda7Y/O
         ODqG3B1APQexcvs3c6SjYesi5Jy37cv3RLS414gjoACDW6GAn2QxRMo5P/peOEQrgYjw
         SVG1FHN+38S6x0dytgM9fq7g/lDr1HZOxqufnZDs0Sy8K5D9cvgZovc4gnZvRUXXaKWw
         7ammmKwYYLDcxJLSsYRcBHLVa56ZAhZad6NDABJtnmWf8uqQdS+0Rz8/VW/BZtwzJBIw
         FnB2BqPzZWYcWp6vctT/49lVlGbX0MRaldinLi9amEyL2HzU4SGWrX69r7RQbXCniWrJ
         +/nA==
X-Gm-Message-State: AOAM531eNpnXPiTDT5y3jffChS+fdYwN8wzrXy77WHO4Wspb9ijuZSN2
        16f3JsrHYOLxtu1kYZBduN8=
X-Google-Smtp-Source: ABdhPJygwQ/XO57nKEz4pvU09JfCGRMtvJhuwVq0aHszfZgbUArLVKCMvQLeEwFYDhxEup+uqQTGKA==
X-Received: by 2002:a17:902:aa4a:: with SMTP id c10mr3586608plr.0.1591802776008;
        Wed, 10 Jun 2020 08:26:16 -0700 (PDT)
Received: from ola-2jp9dv2.garmin.com ([2605:a601:ac62:2200:56bf:64ff:fe6f:26a])
        by smtp.gmail.com with ESMTPSA id j13sm271798pfe.48.2020.06.10.08.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 08:26:15 -0700 (PDT)
From:   Sarang Mairal <sarangmairal@gmail.com>
To:     sboyd@kernel.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org
Cc:     Sarang Mairal <sarangmairal@gmail.com>
Subject: Re: [PATCH 1/1] clk: add lock protection to clk_hw_round_rate() API
Date:   Wed, 10 Jun 2020 10:26:12 -0500
Message-Id: <20200610152612.35781-1-sarangmairal@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200609000816.23053-2-sarangmairal@gmail.com>
References: <20200609000816.23053-2-sarangmairal@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

> Sure a documentation update would be a welcome addition to this area of
> the code.

Posted here: https://patchwork.kernel.org/patch/11598085/

Thanks for your time, Stephen. We can close this thread.

-Regards,
Sarang.
