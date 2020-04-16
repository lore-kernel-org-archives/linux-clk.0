Return-Path: <SRS0=ULxT=6A=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6197C2BB85
	for <linux-clk@archiver.kernel.org>; Thu, 16 Apr 2020 10:28:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E86C21D91
	for <linux-clk@archiver.kernel.org>; Thu, 16 Apr 2020 10:28:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="y283zphW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504906AbgDPK1f (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Apr 2020 06:27:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504866AbgDPK1C (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Apr 2020 06:27:02 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6976EC061A0C
        for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2020 03:27:00 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id x18so4230683wrq.2
        for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2020 03:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=ytcr4DNGsM/t7kd6jXgpKOZ/wK7hRn1NK12HxIXMRKE=;
        b=y283zphWTaRIHsqXboEQebyUcsf1x9LJ0OAGOqpxQTdsNtsjus/FsAB4jcOrbwQRmU
         ovPNF7Uil97R6r1wi7otHb+HEG0ZivE/3Mal3+mMpWMpsqPOwJBWmUWk0JsYvYbtgPOz
         xB2hC0AxW7bx/I9t4+kspS3NGqOmYzdltktQ1ic+DzL2O/t8O8tatfU4vxj77lCP1rf6
         STIzdzowht1EWGVfD39Z2Aogi27qNWUcCQ2LIEVA6eJ0YMMEx8XGsgiilp69jV55p5Mz
         MnUmmXnQXYlZXExyVCIqsI8j2WrJ9PcuiniGJdjht0BiqboZC/SX3qGiwcre7vT/LzJe
         rLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=ytcr4DNGsM/t7kd6jXgpKOZ/wK7hRn1NK12HxIXMRKE=;
        b=Ew1cJObrj1tuMk2ZCuWFRfkakGq28INcCbjj8Q1L/zDGgP2aWcfMuHf1oOKpFWh1X3
         ps41UCruMorDwSmm/vbqc9gVOjkBup+Vf4ShNsV+GUurmT0AG5BrxgZGJttXK/O5KDWr
         z1V/mEYGNB+b/FMIpiLhrSoXf5c3J9nHeoUsBYUH/qzr4Z0v8PvXDSP8ZBGaA64h1iaz
         crPtVFWAsYnvfdc9F79Eu8HoGqHLN5+BIbeHqzGCaRpZOtS+5ILp+IlYlKhUxkn6sjC3
         IimQTBS6FLqrVbuQe7IPUJuCDoN/cDL65k/+4WBZJY3jrf70Ze3S/sVbpiEYztUXUlL8
         rPNQ==
X-Gm-Message-State: AGi0PuY9T2dzYYR3Fx8r1VxFv+kn4ee5/jf9b69B56Va3Cic472vkLtH
        oYgKpv+bhMGR8dxA2ncvBCpduA==
X-Google-Smtp-Source: APiQypLHefjPm8Xgjdu6ICpgrvUDFrLOqOiQNSaKWVEHJV0E00xqUmBJ6qCW31i21zKvv/bei5YhbA==
X-Received: by 2002:adf:e54c:: with SMTP id z12mr23478210wrm.276.1587032818803;
        Thu, 16 Apr 2020 03:26:58 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.gmail.com with ESMTPSA id h137sm3760755wme.0.2020.04.16.03.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 03:26:58 -0700 (PDT)
References: <20200414195031.224021-1-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
Cc:     narmstrong@baylibre.com, mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] clk: meson: prepare GX and G12 for GPU DVFS
In-reply-to: <20200414195031.224021-1-martin.blumenstingl@googlemail.com>
Date:   Thu, 16 Apr 2020 12:26:56 +0200
Message-ID: <1jd087bua7.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Tue 14 Apr 2020 at 21:50, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> This contains only the clock driver updates from my other series titled
> "GPU DVFS for Meson GXBB/GXL/GXM/G12A/G12B/SM1" from [0]
>
>
> Changes since v1 at [0]:
> - update the patch descriptions to indicate that we explicitly don't
>   want CLK_SET_RATE_PARENT on the muxes
> - split into clock driver (this series) and .dts changes (future
>   series, waiting for testing feedback on v1 from [0])
>
>
> [0] https://patchwork.kernel.org/cover/11466399/
>
>
> Martin Blumenstingl (2):
>   clk: meson: gxbb: Prepare the GPU clock tree to change at runtime
>   clk: meson: g12a: Prepare the GPU clock tree to change at runtime
>
>  drivers/clk/meson/g12a.c | 30 ++++++++++++++++++++++--------
>  drivers/clk/meson/gxbb.c | 40 ++++++++++++++++++++++------------------
>  2 files changed, 44 insertions(+), 26 deletions(-)

Applied, Thx
