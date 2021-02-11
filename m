Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9318DC433E0
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 00:02:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6461164E2A
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 00:02:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233070AbhBKACj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Feb 2021 19:02:39 -0500
Received: from mail-oi1-f172.google.com ([209.85.167.172]:44334 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234038AbhBKACi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 Feb 2021 19:02:38 -0500
Received: by mail-oi1-f172.google.com with SMTP id r75so4144382oie.11;
        Wed, 10 Feb 2021 16:02:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kvatFB0Q/jr1PiFB301MPBK04OhOQf953p+PeRkyKoA=;
        b=K/dpqn8pR2oz5GYqSJYougxCa0M7YNlpVqiGB+8rAx0irUqb9vEGYi9SZUV4XrNnUq
         0fCadCSQMCVZWjbAiznRIdKg8q/z0FfX0Lm0ixb9Jbo9Pdyz1zNWnIoAjSbsjJAMVu/y
         pfbcv6k7HMs8pAYFYIXi5VUjESgKiYmcZc3b1ppceGOGU2mXzOF/NCkz31Z8pc9cXGH5
         6crOxeiFQQsdJp1NT/+LtSypauBZwJUdpb55EJzbjrEMXxF4cP6FBqVUKPcM9a+UKKIy
         ZPYGbHoDGhDtxutkgsaRWMLBUWS41rAzjru5fZQ9TzoecI2IIKfWk9Ky/sCiTcEdxq+K
         0dYw==
X-Gm-Message-State: AOAM531EEiEwtrnbMFmALdGUpoP/cLITsSDAqKGYAjuisApnt7io3mCt
        9Kqj/cwCQ9DCJQqkSQIpCw==
X-Google-Smtp-Source: ABdhPJwpSA4lnsqjKtHEt463nu5bmS2soWKAQMwlo1HXdvr0lig5/HWrq3DE7uI5cCxI47QIQU4SYg==
X-Received: by 2002:a05:6808:f09:: with SMTP id m9mr1102641oiw.92.1613001717507;
        Wed, 10 Feb 2021 16:01:57 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e25sm701131otj.23.2021.02.10.16.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 16:01:56 -0800 (PST)
Received: (nullmailer pid 3091448 invoked by uid 1000);
        Thu, 11 Feb 2021 00:01:55 -0000
Date:   Wed, 10 Feb 2021 18:01:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Cc:     devicetree@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>,
        robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        git-dev@xilinx.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: si570: Add 'silabs,skip-recall'
 property
Message-ID: <20210211000155.GA3091392@robh.at.kernel.org>
References: <1612496104-3437-1-git-send-email-saeed.nowshadi@xilinx.com>
 <1612496104-3437-2-git-send-email-saeed.nowshadi@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1612496104-3437-2-git-send-email-saeed.nowshadi@xilinx.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 04 Feb 2021 19:35:03 -0800, Saeed Nowshadi wrote:
> Add an optional property so the driver can skip calling the NVM->RAM
> recall operation during probe().
> 
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> ---
>  Documentation/devicetree/bindings/clock/silabs,si570.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
