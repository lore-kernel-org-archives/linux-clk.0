Return-Path: <SRS0=/KpE=56=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5860C2BA19
	for <linux-clk@archiver.kernel.org>; Tue, 14 Apr 2020 13:02:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4DAA2075E
	for <linux-clk@archiver.kernel.org>; Tue, 14 Apr 2020 13:02:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="F+NDxTzt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502467AbgDNNCB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Apr 2020 09:02:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2502407AbgDNNB6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Apr 2020 09:01:58 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2099AC061A10
        for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2020 06:01:57 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id x25so12893794wmc.0
        for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2020 06:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=YVNWdCQPKJKUDqzVBB1EjscpuxC/BVDNlLQR4zPQltE=;
        b=F+NDxTzt0jSNyYuibeNcpYS29kH/dH9SgCKN6b+K3wMYaZUuxlLfgfyGcAbP2h0qdZ
         v5ty2KiP40jcS2YPnLUs9N3wLbBGFlPsmxLBz9vYkJmAglbzu5s+mOrpAJ5SHAH1gCk/
         RbLkmcGHtlfzo0bULOJlIvArXgTW/oEjAnUAiJ0LCi4ZBNTgD1NgT8uDdMRaxaKs0iUW
         GAi8PV/bvtqXnJSi3/taYGo2up50KspNB97UU4DtyFS78WE7jbTDyHVMSY2dQLxInGjw
         UQht2jQM0IoMKbzEzH6Mc/oo535EjsNaJEY0ODfgPfo0e+H/6DJngLZRx793PprZeo1D
         rvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=YVNWdCQPKJKUDqzVBB1EjscpuxC/BVDNlLQR4zPQltE=;
        b=hrUi1EK0myhEnq8SOyXDveJWvnANOB1OQq96OnxnjD2rmiVUt6eBslyaJ72Goqydbx
         Tqq3xpkdRW0q1IczCaH55UEb7z01/xUr2QETMm29Y5YQK70G47IeDs6rdCBoZqicssci
         vdhMvjnKiwjezCW/3Zh87tx9HyEwQgwBwwymzFsTp1ceXNPYgL0tVE4LNvSaihlAuaK9
         1NGfXvsyGVFWhpr8Yosu0es7qnKeqdKFW3gLUo3wes8rURFIHyPCJfVREg7FJKQs6oy3
         z0N0ZZdRpPwzvTiG8imipAUfpcTDv7X4tQiIM41ca4EPu8wN9MimDvtiJXE2IYS19DE3
         kTWA==
X-Gm-Message-State: AGi0PuYEMp9XbtW7W4Eog55AreqJeP1+9VUKk1nj2z6IqrUM3o2W1pZH
        J16/PwGy8lMh8dGFO/M/hm38Ow==
X-Google-Smtp-Source: APiQypIOrOF7YYEaKaXDccoLPvbc0JkxGKYNccCQyRAQHIKq/YkGUH67S+Cjj2L2nU6/ItuV/nM6cA==
X-Received: by 2002:a05:600c:414b:: with SMTP id h11mr23316590wmm.9.1586869315652;
        Tue, 14 Apr 2020 06:01:55 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.gmail.com with ESMTPSA id h10sm21260991wrq.33.2020.04.14.06.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 06:01:54 -0700 (PDT)
References: <20200330234535.3327513-1-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org, narmstrong@baylibre.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: meson8b: allow the HDMI driver to manage "hdmi_sys"
In-reply-to: <20200330234535.3327513-1-martin.blumenstingl@googlemail.com>
Date:   Tue, 14 Apr 2020 15:01:53 +0200
Message-ID: <1jh7xmte4e.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Tue 31 Mar 2020 at 01:45, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>
> Martin Blumenstingl (2):
>   clk: meson8b: export the HDMI system clock
>   clk: meson: meson8b: make the hdmi_sys clock tree mutable
>
>  drivers/clk/meson/meson8b.c              | 6 +++---
>  drivers/clk/meson/meson8b.h              | 1 -
>  include/dt-bindings/clock/meson8b-clkc.h | 1 +
>  3 files changed, 4 insertions(+), 4 deletions(-)

Applied, Thx
