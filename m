Return-Path: <SRS0=mYc5=R4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03AC9C43381
	for <linux-clk@archiver.kernel.org>; Mon, 25 Mar 2019 09:48:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C7F9920870
	for <linux-clk@archiver.kernel.org>; Mon, 25 Mar 2019 09:48:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="uzlHV+6U"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730346AbfCYJsk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Mar 2019 05:48:40 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41593 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730216AbfCYJsk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Mar 2019 05:48:40 -0400
Received: by mail-wr1-f66.google.com with SMTP id r4so1591802wrq.8
        for <linux-clk@vger.kernel.org>; Mon, 25 Mar 2019 02:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=tBC5OtGtmN7x85dPX6xr2NlJXzvSgP8RiHmhhpk+SWM=;
        b=uzlHV+6UMXSg0tjYKE5trY4EL/bIkIe7rrqKL/k9OSsZq6JewmtnBfoxvbZ5L3R45i
         SjSVcKdYuy7qQOBIWqoge/FQWx3y+mXiB7tUNzOKeCnrQyxDlg90/2rDwYrJpk9neqew
         8yaBrEPFkqLcbvRHiCh1lJ9hdjf93Wb7/4isxEtK1iknXeZvAKRCpOGTCsdBdpqTtORc
         b1BJ8zUBJfYmwGgcaHQrf4yLS3BXgTKFoEj3k5VSkwGS+QO2jxx1OjoXeTwdbTGs7XN5
         L2BdRbnw9GWR2w4KhVz2m1BUs4qAQySjhyEJ/23tmrZtcyb5JrF3uLozgvBJ2yaD0Yit
         IdQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=tBC5OtGtmN7x85dPX6xr2NlJXzvSgP8RiHmhhpk+SWM=;
        b=LtRXMNG6/vKgEDoKwTjhERCQnqqIE19VPgJtrgAqlOm6ogJ0K7AAw4GyUB9uZWfjP4
         P8+sRmvIZcyI6tj4Xkx9zdG5MP/Hrk8CDdFevu57j+n/XyTwWwtqHK+Ip2FUDa+zycfy
         vPBckT0k0q/UVpib2q2Tk3Ei/1gF2k3NQtR8s8ZgweHswgABkmI1W372V8zeSr8BFjEo
         0PNXUAVqSqxEJIG7+UW8warU5S6uCvzN/fvRbKtsIFhgPIEEnFJ5dISx6aRBC1Pv1b3H
         8H73J1EBKUyyLiioy6jp1NrGbTSQ42H0j5tbd0NdNQm9V7NSYsSsjvHgL74b/WBp/DQm
         lO0A==
X-Gm-Message-State: APjAAAXLUtQYMO2FxOZaTYTeIYBiO3Rp6W/KMbvUKyk22kgP8czW44OM
        S9+gLylSpnhOT6JeNy5FJejDyA==
X-Google-Smtp-Source: APXvYqxADaFe4JjXnTVcMbFHpLwZxeARdWhEGN7SDBrC6Ul6sbUsuKrhwm83htZKnHlmhTgpcKHQgQ==
X-Received: by 2002:adf:dc88:: with SMTP id r8mr8719485wrj.28.1553507318621;
        Mon, 25 Mar 2019 02:48:38 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
        by smtp.gmail.com with ESMTPSA id f9sm16675248wmb.36.2019.03.25.02.48.36
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 25 Mar 2019 02:48:37 -0700 (PDT)
Message-ID: <c8328cbe29fe905834a618dbb263f4fb79be3d22.camel@baylibre.com>
Subject: Re: [PATCH 1/1] clk: meson: pll: fix rounding and setting a rate
 that matches precisely
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        narmstrong@baylibre.com, linux-amlogic@lists.infradead.org,
        linux-clk@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date:   Mon, 25 Mar 2019 10:48:35 +0100
In-Reply-To: <20190324164327.22590-2-martin.blumenstingl@googlemail.com>
References: <20190324164327.22590-1-martin.blumenstingl@googlemail.com>
         <20190324164327.22590-2-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, 2019-03-24 at 17:43 +0100, Martin Blumenstingl wrote:
> Make meson_clk_pll_is_better() consider a rate that precisely matches
> the requested rate to be better than any previous rate (which was
> smaller than the current).
> 
> Prior to commit 8eed1db1adec6a ("clk: meson: pll: update driver for the
> g12a") meson_clk_get_pll_settings() returned early (before calling
> meson_clk_pll_is_better()) if the rate from the current iteration
> matches the requested rate precisely. After this commit
> meson_clk_pll_is_better() is called unconditionally. This requires
> meson_clk_pll_is_better() to work with the case where "now == rate".
> 
> This fixes a hang during boot on Meson8b / Odroid-C1 for me.
> 
> Fixes: 8eed1db1adec6a ("clk: meson: pll: update driver for the g12a")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Good catch !

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>



