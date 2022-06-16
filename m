Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 103B5C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 16 Jun 2022 17:49:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346366AbiFPRtq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Jun 2022 13:49:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358129AbiFPRtc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Jun 2022 13:49:32 -0400
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F350F50019;
        Thu, 16 Jun 2022 10:49:20 -0700 (PDT)
Received: by mail-io1-f50.google.com with SMTP id d123so2213057iof.10;
        Thu, 16 Jun 2022 10:49:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mOPPwzLWoxb0/h8SEJJCse/bQQu0kg0sWwvxZcFiXqM=;
        b=CftQG0c7EBbXCHCqr1gmXSDQUhGCm90kB/JkZgkLLv7TFUlz/Kv5UwrlDRRQaXVhGB
         JOI5XQiqRS7nMvKAG0ZxpY/IQRaGMfjWmaI8N0DJy5feXa+7SauzQjBPu1Z1xLNKTS3j
         hDeitXB+PyNS77NsIPxBQviDn5+ukJuTmX5Jrar0fi2rXneJKwkGMLYJZXtYTJ/DMN1N
         Av5BKHqSYKvS+vzffb4UEMNRf100KPkDA0BDHIhyMX/1Lq1N45CrQ7Z98wET8IXfctPS
         g/NDb7lFe7hVf7stxIgIilJMlcAUGOWfFlnqZGJNoYHDFoyXiniXF74GYxc0RfA64Tfa
         jO0g==
X-Gm-Message-State: AJIora8G+mcuSveiGt5yBrMOatTQA56rj20KsjVI6oxP/WL6kw7JtgxU
        Wwku6Tz8iD+TqfRFws/6hg==
X-Google-Smtp-Source: AGRyM1v4v1slS72nidN/dA1RRsDCAUZX7YRVf2NoDbp4wc7AF8lVWouaIvXcsjHtgQCeeEYFleI/+A==
X-Received: by 2002:a05:6638:168a:b0:331:9c9a:90b4 with SMTP id f10-20020a056638168a00b003319c9a90b4mr3436720jat.236.1655401759449;
        Thu, 16 Jun 2022 10:49:19 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id z14-20020a056e02088e00b002d11888a1acsm1278082ils.34.2022.06.16.10.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 10:49:19 -0700 (PDT)
Received: (nullmailer pid 3712442 invoked by uid 1000);
        Thu, 16 Jun 2022 17:49:17 -0000
Date:   Thu, 16 Jun 2022 11:49:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Doug Brown <doug@schmorgal.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 11/12] dt-bindings: marvell,pxa168: add clock ids for SDH
 AXI clocks
Message-ID: <20220616174917.GA3712343-robh@kernel.org>
References: <20220612192937.162952-1-doug@schmorgal.com>
 <20220612192937.162952-12-doug@schmorgal.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220612192937.162952-12-doug@schmorgal.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, 12 Jun 2022 12:29:36 -0700, Doug Brown wrote:
> These are clocks shared by SDH0/1 and SDH2/3, respectively.
> 
> Signed-off-by: Doug Brown <doug@schmorgal.com>
> ---
>  include/dt-bindings/clock/marvell,pxa168.h | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
