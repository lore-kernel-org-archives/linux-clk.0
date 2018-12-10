Return-Path: <SRS0=Ck/k=OT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A29F0C5CFFE
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 22:29:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5E2622084E
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 22:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544480980;
	bh=nKRsI69WGNc4YoygQD4mqFr8z1dMNwVibT30zWxBSX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=1AUKw5FPvhpYp6R92H0l5Grc7TN5Q6M+KHgsDTHwtQUISEGre4JJ8AtmGLTarPd8i
	 8EyazcrOjfEPqbLkQG8PBwMH5jhV92M9FLgj2WRux6DT/szKAhtiAvQmOVdITQxIdi
	 glVh3dxIy88XnRbojG+c+Ft62kykuB27D3sZcWg4=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E2622084E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728691AbeLJW3j (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Dec 2018 17:29:39 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:46407 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726024AbeLJW3j (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Dec 2018 17:29:39 -0500
Received: by mail-ot1-f66.google.com with SMTP id w25so12040488otm.13;
        Mon, 10 Dec 2018 14:29:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=O4lBjFXXGXDlcobkafoj6qomGc4eWjdDcY8muBLkQRU=;
        b=LHTHS3a919lnZpwmDfgmIyrEfHtv58oYPu7d0uwb+BK2gQm1UlWttHxnP5+wtbQbJ2
         mzaSmVS54U+rmyz9/3dU/8YJrZl83G3PlLesJHnpcxYmHNS0mTNyGGreC2sjio2srqRs
         24Z480CsiHRbl19SHKtmWltTdbAhzqJ1rohXCuibCW6q7sY21ymIZwOCQObX4nTKF5f1
         bZQgQni+t1NGCgFJhdj0ekfgo+onkSML3Mm7RZRV4t9OvdOfXCUJ8L3yrHjsLi4tOOLF
         N5G/n+CE+lK4yz7+nrv6FS7Ug4cBxoBVDu9Z1XuZcc0uiyo9h9F/VxuFN11Ioy3zKdXk
         hrZA==
X-Gm-Message-State: AA+aEWaD2e039kIX4nRgSb6nzihwEEDiAuooFcCt3IzZ6b4eX5R7U56K
        qelCbUwBC6a6JGQjZjswSDI5BUw=
X-Google-Smtp-Source: AFSGD/UXADU0evLtbv/ZC6C5RPmxFLQ/6UHugp2wfUWKlrnCumDXpqeIXOJCtX2PUmGTnI2JXThTeA==
X-Received: by 2002:a9d:5e0f:: with SMTP id d15mr9241128oti.243.1544480978771;
        Mon, 10 Dec 2018 14:29:38 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i5sm6443264oia.46.2018.12.10.14.29.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Dec 2018 14:29:38 -0800 (PST)
Date:   Mon, 10 Dec 2018 16:29:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     Kamil Konieczny <k.konieczny@partner.samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v3 2/5] clk: samsung: exynos5433: fix name typo in sssx
Message-ID: <20181210222937.GA9739@bogus>
References: <20181204165248.17572-1-k.konieczny@partner.samsung.com>
 <CGME20181204165316eucas1p2ba063b96e83d2d2be93ca067d32d7926@eucas1p2.samsung.com>
 <20181204165248.17572-3-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181204165248.17572-3-k.konieczny@partner.samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Dec 04, 2018 at 05:52:45PM +0100, Kamil Konieczny wrote:
> Fix typo in sssx name, there should be three letters 's'.
> 
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5433.c   | 2 +-
>  include/dt-bindings/clock/exynos5433.h | 2 +-

Acked-by: Rob Herring <robh@kernel.org>

>  2 files changed, 2 insertions(+), 2 deletions(-)
