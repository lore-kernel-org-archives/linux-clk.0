Return-Path: <SRS0=eZcb=7X=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CAA6C433E0
	for <linux-clk@archiver.kernel.org>; Wed, 10 Jun 2020 02:20:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EDEB62074B
	for <linux-clk@archiver.kernel.org>; Wed, 10 Jun 2020 02:20:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LshfhBDc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbgFJCU5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Jun 2020 22:20:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725798AbgFJCU5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 Jun 2020 22:20:57 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 317E1C03E96B
        for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2020 19:20:56 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id h95so230250pje.4
        for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2020 19:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=dC9/KQFuZY34yyqjXgNCYCIKz+z0z+M8UxzxcZfntAU=;
        b=LshfhBDcAKWKw+BwL1711CUtdj63qrkSDCAl1hU9a4s8T0Drnxqgtvu2sGmOsJJ2yl
         hhnoTDwRU6tZveA+vXZWA7u1LgoUgm7DV4DVmTHTRN8gEI2fuqMAjW+hkOhnQRcep6A+
         esCNzWyueKfigoevJr9Sf8d9sDZ06p66fvk6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=dC9/KQFuZY34yyqjXgNCYCIKz+z0z+M8UxzxcZfntAU=;
        b=F2xvPc5exnXO88L1MyQl4kJuH5m2P57FdoBytlbyz9+eeZ4uDzcWNKFKJ48Kwwmr0E
         lhbTayiV8dfimTpvTOyyrT8G+EPr2iu5rxy/QhH8Suhh3Kud5UUoMHa7mdCB4mjauuw9
         gKojj6qYMNT55xNxSAUP3OtK3brkOfaWVTelCtR8FzkSNkiu73b9aYo4m9m2N0HVqf5m
         PcVvVZHRZLNGldiRwmtmR9AQGthkoRiN79UPvEIPMyMmMiJrZIgtQJxv+plmvu4aU4kY
         e//nLNdpBAqLfyZN1/NznJW31Mbp07KqBHooimZ4m5LHIwEbf3hjMSB0lkluCziDh1VK
         qwLg==
X-Gm-Message-State: AOAM532IyM7OJOL+1FwkoPpqW88dNE0DCOWQIliNDqDovwz/256RvhYI
        w8YwpIPfEtZBSaL2n0Syk63wow==
X-Google-Smtp-Source: ABdhPJxmED+EAnYjUtWkB7dB6RYq/eITyPggCRbENMcrnsfK8Hlc1oCgRoX7471ZCmTD51mFldzUag==
X-Received: by 2002:a17:902:aa88:: with SMTP id d8mr1082183plr.257.1591755655666;
        Tue, 09 Jun 2020 19:20:55 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id d2sm9249070pgp.56.2020.06.09.19.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 19:20:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200609034047.9407-1-tanmay@codeaurora.org>
References: <20200609034047.9407-1-tanmay@codeaurora.org>
Subject: Re: [PATCH v6 2/5] drm: add constant N value in helper file
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     sam@ravnborg.org, seanpaul@chromium.org,
        freedreno@lists.freedesktop.org, chandanu@codeaurora.org,
        robdclark@gmail.com, abhinavk@codeaurora.org,
        nganji@codeaurora.org, linux-clk@vger.kernel.org,
        Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>
To:     Tanmay Shah <tanmay@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Date:   Tue, 09 Jun 2020 19:20:54 -0700
Message-ID: <159175565407.242598.7527036274929582020@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Tanmay Shah (2020-06-08 20:40:47)
> From: Chandan Uddaraju <chandanu@codeaurora.org>
>=20
> The constant N value (0x8000) is used by i915 DP
> driver. Define this value in dp helper header file
> to use in multiple Display Port drivers. Change
> i915 driver accordingly.
>=20
> Change in v6: Change commit message
>=20
> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> Signed-off-by: Vara Reddy <varar@codeaurora.org>
> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Can you resend this series as an actual patch series? None of the
patches have the proper In-Reply-To headers so it is hard to track the
thread.
