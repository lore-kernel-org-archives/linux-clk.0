Return-Path: <SRS0=HA4W=OO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E291C04EB8
	for <linux-clk@archiver.kernel.org>; Wed,  5 Dec 2018 01:08:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E67F320834
	for <linux-clk@archiver.kernel.org>; Wed,  5 Dec 2018 01:08:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="m6zEc6xD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E67F320834
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726031AbeLEBH5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 20:07:57 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45003 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726082AbeLEBH5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Dec 2018 20:07:57 -0500
Received: by mail-pf1-f196.google.com with SMTP id u6so9098747pfh.11
        for <linux-clk@vger.kernel.org>; Tue, 04 Dec 2018 17:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=Cy5kmxnxBc9jiMESB2Fi/ZbfKvsekEyB466CDdINpzs=;
        b=m6zEc6xDAb+9i/kiw6NABISTpveKYVdflw52GKStlQ9KwRboXk7/H0VzFIEqY898No
         RSk9bxBK2iyXu2Re4VVaztSSHHWxoR8Yap7Z/PXRBU179Xl8R3PBjcpNEvWitw8V9aFo
         fQWD+nm2+54Dx7UOl3Cw3ZinnaI+74J9GZXkHh+vM2xmCsAGTjUPcLy0xANd6P6AxWOZ
         CuwvVakMXOZyh5YJvUrjK9IffzBke2W8m9i07gjjORa30eUxjFJ8KKup97sf/ZxMcT3U
         yamyF/TTK/YuVXBVZv9Bj0+TCo+Ul6cnoPkYWpNnQ9/kF4w3obWqXlnzG4c/gPvPkLlW
         zL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=Cy5kmxnxBc9jiMESB2Fi/ZbfKvsekEyB466CDdINpzs=;
        b=ivuHGxONwy/kTXPnxpl7GWAJBM+7M2x8AickmNONO9v4jrL2wtsOJPy9CxQ/lFAG5/
         XwWTZydfXwIt7yv2sTgappTN5/B8HGFEKYaPpFg+JxncUaAUGkUqyQPVm73C8ipAPOct
         DJ9Glk1BHY3sfUdzhSV2UPha/N585dL6JWDMzkEUzpecm7KLFzwNwFlF8+KK/cpJimBd
         3C2U+Rslx6PCjV0tkTgS0BR10+3OavTjIw8bCwmAmfSwqL6JlDzoefyPNlmxGETVrfEd
         U3NQvkifIM69doWzUtnlNHtvaUYoyUMCKmPbCrV99ziDbaJu7jeUbiHCdcHFWkOvL7Rp
         t2cA==
X-Gm-Message-State: AA+aEWaolnV/cvtd3vRxlm9a1G16+adoUVa9B4Azb8f91pfJSIpv/7B5
        Nd8WHNrzNvDePZujDU251r/JmAvB9e4=
X-Google-Smtp-Source: AFSGD/UAEjE+Bisxh3FLwoRVHZiako0AtYLHWSb69uWpTvsPNf0zZmnKA0i6aTuY9t8Hd4D2kN71lA==
X-Received: by 2002:a63:1444:: with SMTP id 4mr18846301pgu.430.1543972076240;
        Tue, 04 Dec 2018 17:07:56 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.googlemail.com with ESMTPSA id z8sm17915419pgg.62.2018.12.04.17.07.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Dec 2018 17:07:55 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Carlo Caione <carlo@caione.org>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] dts: meson: add clock controllers input clocks
In-Reply-To: <20181203171640.12110-1-jbrunet@baylibre.com>
References: <20181203171640.12110-1-jbrunet@baylibre.com>
Date:   Tue, 04 Dec 2018 17:07:54 -0800
Message-ID: <7hmupkbx1x.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> This patchset is the first step that needs to be done so the
> amlogic clock controllers properly claim their input clocks
> through DT instead of relying on fixed names.
>
> I'll be waiting for this hit mainline before sending the related
> driver changes.

Queued for v4.21 (branch: v4.21/dt64) with Stephen's tags.

nit: $SUBJECT on this cover letter is missing arm64 prefix (v2 had it)
and, some lazy maintainenrs like me are starting to rely on the new new
patchwork-bot which will auto-superseed series when a new version is
posted, but that relies on matching subjects.

Kevin
