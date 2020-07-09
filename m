Return-Path: <SRS0=8I5m=AU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D05C433E0
	for <linux-clk@archiver.kernel.org>; Thu,  9 Jul 2020 17:16:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 09D2E207D0
	for <linux-clk@archiver.kernel.org>; Thu,  9 Jul 2020 17:16:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="kdFWAGk0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728158AbgGIRQc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 9 Jul 2020 13:16:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbgGIRQc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 9 Jul 2020 13:16:32 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C173C08C5CE
        for <linux-clk@vger.kernel.org>; Thu,  9 Jul 2020 10:16:32 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id l17so2750921wmj.0
        for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2020 10:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=hmI2pr2O9KFjOijImT0+FbwAxpzgzTC7FzYN5zC+JMs=;
        b=kdFWAGk0iUZjedKRxztU8bWiH5sKHhTAW2YDVKwD0F4snsgNQbd7zDLFvbt/82x6v/
         VH1bMVKIQDTNUk6wRU09AL4x949Kvdk8Fmy7jJfhaCgoAi1Oeb2oNn2ZDZQQOMoN/XzS
         z6kVLGhD+PUMmrjZhruiAd1VNsJvMHq3ra6DhjOP/+DFzGt7VECEJFvxMpk/44knnKOA
         bgMRnTP7942Eg9Vbn6StDNLbyB/Ry5kzQvGOpKZc6hJKnxS2JoSPonOfOHxSenJT2SE9
         5OQXVdPkvF8hkOV5keFg7XHUveIvwJn8r+6yDyv6pP4aHQYaINL8izDOd7s17Ae0glYq
         bNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=hmI2pr2O9KFjOijImT0+FbwAxpzgzTC7FzYN5zC+JMs=;
        b=DkJhRq3RpmPeb6unTalbXn/1ugveI+PepVtxfTjA7MHcpN6TwclbK/jjKFfcznbiwb
         3QiCeBufQodIQaoD0RtI0uzPq6NCWELVmQt7ZZ4kU3Vc/4OgHqPzekXIBlivjPE50yzD
         nHu5kAyUxlyYY1QuRXGXZnsz87yKXDXFmu3YX+MYoAKDu2XMXmTiUvpryAo1XeCZ4lYs
         bhL+yeLcX+m2PhjvTzitXCLcmgJ1/22ry0QE0Ue1HUDJy/9RtB3vo9RdhM50DWVzEm6M
         +h/uTNetDawUXRs9ZN8fPN4epyrffxQNo5jDI89FcmFunK4Whzo2bRYznVM1whhgWxHs
         PN8A==
X-Gm-Message-State: AOAM53267C4eNsms5RPGCLQDkOdO2kyyZuQeatVmFSymj0vnAQ8u9P5f
        8gbDDUl6OtUM11HjV0g91gVlPr57TS9rtA==
X-Google-Smtp-Source: ABdhPJxoDnl4uLj+qPytb0Ar31Lq542I0abu2UkCil0ADdhflQlq17LPcs+qSc6RV6scXxwjkK5nZA==
X-Received: by 2002:a1c:a74c:: with SMTP id q73mr1006135wme.96.1594314990921;
        Thu, 09 Jul 2020 10:16:30 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id f197sm6043371wme.33.2020.07.09.10.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 10:16:30 -0700 (PDT)
References: <20200629203904.2989007-1-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org
Cc:     narmstrong@baylibre.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: meson8b: add two missing gate clocks
In-reply-to: <20200629203904.2989007-1-martin.blumenstingl@googlemail.com>
Date:   Thu, 09 Jul 2020 19:16:29 +0200
Message-ID: <1jk0zcip76.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Mon 29 Jun 2020 at 22:39, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> While trying to figure out how to set up the video clocks on the 32-bit
> SoCs I found that the current clock tree is missing two gates. This adds
> the missing gates based on evidence found in the public S805 datasheet,
> the GXBB clock driver and 3.10 vendor kernel.
>
> I didn't add any Fixes tag because this clock tree is still read-only
> and the HDMI PLL (the top-most clock in this tree) needs more work as
> well.
>
>
> Martin Blumenstingl (2):
>   clk: meson: meson8b: add the vclk_en gate clock
>   clk: meson: meson8b: add the vclk2_en gate clock
>
>  drivers/clk/meson/meson8b.c | 60 ++++++++++++++++++++++++++++++-------
>  drivers/clk/meson/meson8b.h |  4 ++-
>  2 files changed, 53 insertions(+), 11 deletions(-)

Applied Thx.
