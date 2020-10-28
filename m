Return-Path: <SRS0=O9me=ED=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D56C4363A
	for <linux-clk@archiver.kernel.org>; Wed, 28 Oct 2020 23:03:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D6152076B
	for <linux-clk@archiver.kernel.org>; Wed, 28 Oct 2020 23:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603926201;
	bh=SnWAKf7Tea+FrzUzm1yo5r4j/+Bi0jaQLvfj/3JFVXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=nMPchhyAeop1s024ocrv9oc1vnwkpKTv3v3Qgu9lHn4eVOxMcN2SgJ4ybKmnda3yg
	 Pb8emv6dqtfq0h69ICXmvVPbkhUgXA73i/Sgsub7YGy4dgMYdu7yHnBttwS901rtlI
	 n7G+wbDgjo/QWhYsioNe4lBoT+ZczZNBDXYQ3A84=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389911AbgJ1XCv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Oct 2020 19:02:51 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:34806 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730802AbgJ1XCl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Oct 2020 19:02:41 -0400
Received: by mail-ua1-f67.google.com with SMTP id x11so205457uav.1;
        Wed, 28 Oct 2020 16:02:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0G4ddUyBDAmFIJZfLdJeZ5DORv/CzVKctJJjdwMQ2hA=;
        b=oz+h/9W+vKiikyttr3MXE6n+al9sEwMYTXDWlFY7XMk5RchM/TbVPM4aj6wR9DmKJm
         Vf9IsFYIRJyXHOOW1hzEUSgzn2vQFIXtXpDltuN1HxA1Dw/T/9Q/oAEQ/U1Ckw2kMb7P
         jm7ISi1ZusltCQhKECpunGF00fS3hzWoCKa9iVuBF03EbIIM3JsDwBpoivb1bTT2tD96
         exVxUpNct4ew8+p7F9T1EaJ4kC9dk3Z3eYdB91wf89KL1cZX7t2fNT1Qhj3QD8NI5BCQ
         0XHkLy6O88W8egEK2ieyAMxUTe1YFMLx/Jxm/FCmJBJlet3vNiIBFKHziOv5hupjD1vQ
         CQeg==
X-Gm-Message-State: AOAM532VNSrf0ULp6L8Edy5vqVeNuHT9s59n4H8suuYNR1if3NryFrZv
        6bI8Jw+OfQRkXAWlwQsdN+LBjasn3A==
X-Google-Smtp-Source: ABdhPJzjsODVzwEavFHnP2SeXAsiY9C71CRqgTEGh2Z6Q40K80z+BHN5EwtDNrj8BkTr0cnmJRhWGw==
X-Received: by 2002:a9d:5b3:: with SMTP id 48mr5823698otd.110.1603899170988;
        Wed, 28 Oct 2020 08:32:50 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y8sm2733386oon.16.2020.10.28.08.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 08:32:50 -0700 (PDT)
Received: (nullmailer pid 4063907 invoked by uid 1000);
        Wed, 28 Oct 2020 15:32:49 -0000
Date:   Wed, 28 Oct 2020 10:32:49 -0500
From:   Rob Herring <robh@kernel.org>
To:     Abel Vesa <abel.vesa@nxp.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Anson Huang <anson.huang@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Lucas Stach <l.stach@pengutronix.de>,
        Adam Ford <aford173@gmail.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Shawn Guo <shawnguo@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peng Fan <peng.fan@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
        Marek Vasut <marek.vasut@gmail.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 09/14] Documentation: bindings: clk: Add bindings for
 i.MX BLK_CTL
Message-ID: <20201028153249.GA4063845@bogus>
References: <1603740750-10385-1-git-send-email-abel.vesa@nxp.com>
 <1603740750-10385-10-git-send-email-abel.vesa@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1603740750-10385-10-git-send-email-abel.vesa@nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 26 Oct 2020 21:32:25 +0200, Abel Vesa wrote:
> Document the i.MX BLK_CTL with its devicetree properties.
> 
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
>  .../devicetree/bindings/clock/fsl,imx-blk-ctl.yaml | 60 ++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/fsl,imx-blk-ctl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
