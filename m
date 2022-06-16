Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA65C43334
	for <linux-clk@archiver.kernel.org>; Thu, 16 Jun 2022 17:49:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238632AbiFPRtU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Jun 2022 13:49:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238314AbiFPRtD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Jun 2022 13:49:03 -0400
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2C9A4CD6E;
        Thu, 16 Jun 2022 10:49:01 -0700 (PDT)
Received: by mail-io1-f41.google.com with SMTP id n11so2228360iod.4;
        Thu, 16 Jun 2022 10:49:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GpgnyOGirY1fRMfZeEcbkMY+INEkBvHVjqqjd76dKiE=;
        b=Qzrj5t+9Mw5Oo7kaGH6I+hUyBMb2vroUZ+kMy3tnyr3XVmbWWyx6mydsZWmXL1V4fv
         cUta6M8Ewx8HlIX8bSoDnUrXPogJzPK3aBXx5k1ug9Oo8aNOmxAsp1YsNxXgGxuTDJsW
         f1nd7vFKgIYL7d0ouexogPsqaEwGbSJE8QFxKcBSkJYeUK4JTyYF/WZwPWXd5GWmkYTe
         E/mzTvDU0IoffkLH6XPq0v0Yk8i4WRVXVmUVsmKiSzMlU1G5+zhXXT+qjcvvEoaH4Mb/
         CCsrE73GaDAnufCg8erwkJwCqF+VTlZw0Trp12pvSA0ej/A6KHMEZDUYVfolL8phxWZF
         4epg==
X-Gm-Message-State: AJIora8ASV3Qaa71Tw7lkPyF1HrniRErlfZc2RctSsU9b6/turHyihDS
        Q+qXUsgqNwkfP/a2SCtzMQ==
X-Google-Smtp-Source: AGRyM1uB2Sp51DNn7pSDqbT3jVbi8WyCg5ZtCiiUOeNTVwhRsLG658tdp6ufu0C1a4h72SbIWfUVYw==
X-Received: by 2002:a05:6602:3408:b0:669:cf03:f342 with SMTP id n8-20020a056602340800b00669cf03f342mr3143194ioz.166.1655401740894;
        Thu, 16 Jun 2022 10:49:00 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id h126-20020a6bb784000000b00660cd45bcbbsm1455158iof.0.2022.06.16.10.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 10:49:00 -0700 (PDT)
Received: (nullmailer pid 3711900 invoked by uid 1000);
        Thu, 16 Jun 2022 17:48:59 -0000
Date:   Thu, 16 Jun 2022 11:48:59 -0600
From:   Rob Herring <robh@kernel.org>
To:     Doug Brown <doug@schmorgal.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 09/12] dt-bindings: marvell,pxa168: add clock id for SDH3
Message-ID: <20220616174859.GA3711830-robh@kernel.org>
References: <20220612192937.162952-1-doug@schmorgal.com>
 <20220612192937.162952-10-doug@schmorgal.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220612192937.162952-10-doug@schmorgal.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, 12 Jun 2022 12:29:34 -0700, Doug Brown wrote:
> There are four SDHC peripherals on the PXA168, but only three of them
> were present in the DT bindings. This commit adds the fourth.
> 
> Signed-off-by: Doug Brown <doug@schmorgal.com>
> ---
>  include/dt-bindings/clock/marvell,pxa168.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
