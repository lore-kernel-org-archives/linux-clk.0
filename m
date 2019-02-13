Return-Path: <SRS0=hoZU=QU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBCD3C282C2
	for <linux-clk@archiver.kernel.org>; Wed, 13 Feb 2019 08:40:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 970D7222C2
	for <linux-clk@archiver.kernel.org>; Wed, 13 Feb 2019 08:40:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1yZNOTCK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390760AbfBMIkh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Feb 2019 03:40:37 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42414 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387969AbfBMIkh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Feb 2019 03:40:37 -0500
Received: by mail-wr1-f65.google.com with SMTP id q18so1456706wrx.9
        for <linux-clk@vger.kernel.org>; Wed, 13 Feb 2019 00:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=6uT2+UA6yn0rcHTMvIP/MBTxOkvBxyWG8VSGdzDRTFQ=;
        b=1yZNOTCKutPPE55+mNpGBKozypxhrvkadz1kxAXp9OiIBLTHXqQlq1/rtzTuQShGlS
         14ZPEMO8DsNsp8phdPu1ZauDmXUy8i8oDvXcvXWp4p4A/4lKOyverx0xQs9Vogdvxw+o
         WUeqouG2DVEYi0tCVESrwU5CZIrRoxbiB7SW6Adzs5EPcAKpv1Dn+ZQuboXj5tu5QHRJ
         hWktBayTuQSfHwyobrvpR+uHZCn3PmoltNaiqGXLxSDDpSs6c3+58xTUPmhS9Rx8mk2+
         zL33koEbsbp8AwK5x6vF8xvBFvZlvVk3wGSpDQ5u7y1DzpHxhRBEHEhlMTLquDHkhlRc
         gqYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=6uT2+UA6yn0rcHTMvIP/MBTxOkvBxyWG8VSGdzDRTFQ=;
        b=gzrdmqy90Nwv5hfytisYYWl4SeNXk0PH3PN3KLZOpite0NC7zD8PW5eyx5MXpXXZgp
         14nZ4Wbj5HJ+jUMREDtw6m2T9A0NdeSj4QRc/d2Ly9AL7F8RpRBMMBkyZzRtWnRRu0/F
         02ojc6TP+lJaYiowDdvq+U3VPyg+iFVCtAH0OIJuoXuEl07SfMTCYfhpLMtmurBIDP4z
         FWYIc32saLflr5SosxGzyG/2nXx7oDON7ktLi+PIWYP38c9KE5btlydWjNYKiwYuJ+0a
         E/t0u7jWYnS94144VxzsnLQnEaqdIsc9GzcOnoJPr8FCf2NLb9nQLRn5AtxCO3zbznGD
         fT0Q==
X-Gm-Message-State: AHQUAuYHnA/E9ZwNBRE2Lx4u3CSanANdOTggA0aV3/LNCIvm+/Rx5KPl
        0gNBn6IXHBFMP9L1kn8VVzhDOQ==
X-Google-Smtp-Source: AHgI3Ianfn8sdNuun1GX3VCGyVRzPbztB3flDFRP8+4dH/HK+XuUTwll1RCxyNKW2y9cuM3yi+I5Rw==
X-Received: by 2002:adf:edd1:: with SMTP id v17mr6110872wro.300.1550047235224;
        Wed, 13 Feb 2019 00:40:35 -0800 (PST)
Received: from boomer.baylibre.com (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o18sm29858337wrg.40.2019.02.13.00.40.34
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 13 Feb 2019 00:40:34 -0800 (PST)
Message-ID: <fc50a3a7f1efc8d2f6054a944848897ed8baf536.camel@baylibre.com>
Subject: Re: [RESEND PATCH v2 0/2] clk: meson8b: fix typo "ABP" -> "APB"
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org, narmstrong@baylibre.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, sboyd@kernel.org,
        linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com,
        mark.rutland@arm.com
Date:   Wed, 13 Feb 2019 09:40:33 +0100
In-Reply-To: <20190210222603.6404-1-martin.blumenstingl@googlemail.com>
References: <20190210222603.6404-1-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.4 (3.30.4-1.fc29) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, 2019-02-10 at 23:26 +0100, Martin Blumenstingl wrote:
> It turns out that I'm not good at spelling "APB". Unfortunately an ABP
> (instead of APB) typo snug into two clocks in v5.0.
> 
> Currently there are no users of that clock yet, so fix it now
> before it's too late (meaning before it's used by <something>).
> 
> I decided to go the "normal" route where we can have separate
> branches for the dt-bindings and the drivers in the clk-meson
> repo. This means:
> - new (typo-free) clock #define
> - change the clock controller to use the new #define
> - (next development cycle) drop the old #define
> 
> resend - changes since v2 at [1]:
> - include the device-tree maintainers / mailing list
> 
> Changes since v1 at [0]:
> - split into a dt-bindings and clock controller driver patch
> 
> 
> [0] https://patchwork.kernel.org/cover/10742001/
> [1] https://patchwork.kernel.org/cover/10772199/
> 
> 
> Martin Blumenstingl (2):
>   dt-bindings: clock: meson8b: add APB clock definition
>   clk: meson: meson8b: fix the naming of the APB clocks
> 
>  drivers/clk/meson/meson8b.c              | 26 ++++++++++++------------
>  drivers/clk/meson/meson8b.h              |  2 +-
>  include/dt-bindings/clock/meson8b-clkc.h |  1 +
>  3 files changed, 15 insertions(+), 14 deletions(-)
> 

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

