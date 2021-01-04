Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C7C7C433E0
	for <linux-clk@archiver.kernel.org>; Mon,  4 Jan 2021 11:44:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3525321D79
	for <linux-clk@archiver.kernel.org>; Mon,  4 Jan 2021 11:44:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbhADLoe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 4 Jan 2021 06:44:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbhADLoe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 Jan 2021 06:44:34 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00F2EC061798
        for <linux-clk@vger.kernel.org>; Mon,  4 Jan 2021 03:43:46 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id ce23so36380754ejb.8
        for <linux-clk@vger.kernel.org>; Mon, 04 Jan 2021 03:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=s9b3G+1wnt0fqvQLZfc718wWCxYrFOqLj99ZBc9EiHo=;
        b=N4K5zTpfvEf9GyU5JoMNLIDIR+zWfC22FxvyvteNXgVR4rh56MRqOLVSZtaMupaRQP
         gIo3JpiGBYilVXPLMr/DWadV17ubcrqiOsqdkylrBeGCBRjrx2p2l+rOTSfRctypDTyQ
         PSlGBmczgSBzk6oJ5c2BiMtozqaDqZUfUceiY0Gj48bEpdLY7MmiG1h20fRD7Tv7Y+8o
         4jcb1kk53TO7c75op2kUmtSLN+wWfZPQRet16PevqVfSKjTMHPS189f0QAiPxRO3tA0N
         kRyqQB4tYaGQSjRmWpEAV/8RLIbA5TSBiFW/Ikae3HP5KC8dAZsEvktm+ZXLuznoNTi2
         av9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=s9b3G+1wnt0fqvQLZfc718wWCxYrFOqLj99ZBc9EiHo=;
        b=Va45W3gzHGto2HoJ0/ueaPW5mi/DTsQQJ1Worp6UhefwoN0gZ5DkmLs9MpmjpCk6y4
         w4CPfnOAb2O3a1DWkytBO5XT7GpyPa2+hVVIPhk5UZm+u1Z/dwlU/J4TFcNxlhN4kphw
         NQNjoMwHCqnvKSG4HZSxthEme7T6oM2MGb16LfdFeKr5XFBbsPum/nBFUmOJt/XscG7Z
         91Cgxqkltw8qcL+qpRw2cNQ92+SUS/Ec7PKMGazGiHGZkhNg4JvbmQJKCCH3TzT0mttl
         RE1AljlVG/WaZClMHOYotaHRf59vE1GjsYiKAazys+M455eM57o3q98jRHCZd0O9VXpV
         gXUg==
X-Gm-Message-State: AOAM531qaOxy1aNgL4AeyKk1gy9/+iNSICyooOB47ldWgXL8XnG5bICF
        7U2TsFuk7rhDowhP0lOdWj7qAw==
X-Google-Smtp-Source: ABdhPJwGvjTksyTEsh8ZsoIujwHjf6GyWgK9chy76WycbY1TeT6KTvHXkYeyko77ghZGFlgSLXZg9w==
X-Received: by 2002:a17:906:b793:: with SMTP id dt19mr65969463ejb.120.1609760624753;
        Mon, 04 Jan 2021 03:43:44 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id e10sm23445564ejl.70.2021.01.04.03.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 03:43:44 -0800 (PST)
References: <20201221183624.932649-1-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.4.10; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: meson8b: cleanup unused code
In-reply-to: <20201221183624.932649-1-martin.blumenstingl@googlemail.com>
Message-ID: <1jwnwtvseo.fsf@starbuckisacylon.baylibre.com>
Date:   Mon, 04 Jan 2021 12:43:43 +0100
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Mon 21 Dec 2020 at 19:36, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Hi Jerome,
>
> these patches are two small cleanups for code we don't need anymore.
> The first patch removes support for old .dtbs. I am not sure if the
> "fallback" logic still works as I have not tried this in a long time.
>
>
> Martin Blumenstingl (2):
>   clk: meson: meson8b: remove compatibility code for old .dtbs
>   dt-bindings: clock: meson8b: remove non-existing clock macros
>
>  drivers/clk/meson/meson8b.c              | 45 +++---------------------
>  include/dt-bindings/clock/meson8b-clkc.h |  2 --
>  2 files changed, 5 insertions(+), 42 deletions(-)

Applied, Thx
