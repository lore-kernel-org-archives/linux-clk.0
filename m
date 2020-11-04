Return-Path: <SRS0=af6Y=EK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C518C2D0A3
	for <linux-clk@archiver.kernel.org>; Wed,  4 Nov 2020 22:34:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D469A2080D
	for <linux-clk@archiver.kernel.org>; Wed,  4 Nov 2020 22:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604529254;
	bh=JhIFYQBZMU/6mRToxTnMkOdvkhsPr9VgD+iPyFQzJwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=FWBXDL7q+8hqS9COT7chlZ0hDEd/Y12/mlWtnI9cqBCQLTBrmRcHRXC+eWcmbYgiP
	 BvMJ8FaH4l7PX90i6fXSJDewqh0vV7mZtv+jLdvavXYcF++lrpBRiKb9T6gNTvST6X
	 ndnBwFY9jLHHcaPErkT/T0vs3lNsbBCBRJwB87do=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732439AbgKDWeO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Nov 2020 17:34:14 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:36752 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732367AbgKDWeN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Nov 2020 17:34:13 -0500
Received: by mail-oi1-f193.google.com with SMTP id d9so17957512oib.3;
        Wed, 04 Nov 2020 14:34:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kGLpzsKIYhuP2vsF9IWvrtBr9wgyFG/xp8noHXujTnU=;
        b=pN51tjhphd2ekhME4W6OgKRQE87GB3RDblAC0xAwOml7HMTWDBg4OLaYfY7hbUaReR
         hVW/Sw4MjzFtH0J6Gv5qECD6xFYOzhsBaXzRxmFhiRQaN34HtObeXxTYCzLuQzw5SdlC
         nZX+K4WhNIjYjBSS0ZJAEjbUoRrKCk2olhinYuKO1e7Fnv9ZvodTs54dF2hBuTR7AeYs
         8RRlCD4WeyGKmXv8nqPyf1SBRb79NB47Q24fEE2QFiHZLSt1ouPTg+YUj/Ya2c9HWXvE
         ZHmZdx506VCXJjBEd3lkwHFuc5DNno6XtQynQbuaEAH6zRyoqQGxq+fHHdosuqNVsIkL
         v4uQ==
X-Gm-Message-State: AOAM532nbNHj3YSVtIB3ztDRPRErX6jqBDocHPtaRUtCxdkNYBQ/WetQ
        7qVPqs6KCDkxit/G9nvXFQ==
X-Google-Smtp-Source: ABdhPJyOIymHCe/ZIubxgK5CUBmnGtFwaV6QBxsW28rHlx/A/KzVi+5QcrltMklh3b3ZNJfUJN/AZw==
X-Received: by 2002:aca:4c8d:: with SMTP id z135mr3471oia.23.1604529252375;
        Wed, 04 Nov 2020 14:34:12 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z12sm846380oos.12.2020.11.04.14.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 14:34:11 -0800 (PST)
Received: (nullmailer pid 48103 invoked by uid 1000);
        Wed, 04 Nov 2020 22:34:11 -0000
Date:   Wed, 4 Nov 2020 16:34:11 -0600
From:   Rob Herring <robh@kernel.org>
To:     Michael Walle <michael@walle.cc>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>
Subject: Re: [PATCH 1/4] dt-bindings: clock: document the fsl-flexspi-clk
 driver
Message-ID: <20201104223411.GA48059@bogus>
References: <20201101192053.18644-1-michael@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201101192053.18644-1-michael@walle.cc>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, 01 Nov 2020 20:20:50 +0100, Michael Walle wrote:
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  .../bindings/clock/fsl,flexspi-clock.yaml     | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/fsl,flexspi-clock.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
