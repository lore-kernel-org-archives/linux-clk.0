Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C7CDC4360C
	for <linux-clk@archiver.kernel.org>; Mon,  3 May 2021 16:50:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E8BD6161E
	for <linux-clk@archiver.kernel.org>; Mon,  3 May 2021 16:50:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231393AbhECQvB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 May 2021 12:51:01 -0400
Received: from mail-oi1-f181.google.com ([209.85.167.181]:45705 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233342AbhECQrr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 May 2021 12:47:47 -0400
Received: by mail-oi1-f181.google.com with SMTP id n184so5967417oia.12;
        Mon, 03 May 2021 09:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Oa/st9F1XP28j94dX0qihiVLsde8Rf9/JSN308vzmVU=;
        b=PmWkDZw3021Vo5u5uEACN5924U8fo7T7pxfmqFYu586ujb+KDpX0qdlSOhrbdp4Nv9
         urLqk7YQqsAqJHkmlGzmYtVbOOnfoiDV79IGGi4mkWwK4jb1cB+GSPBl2lyXGAVbwemM
         2artgnWhmJ4nf+rpvWOp5TS5J8Kls8/QU4oZPZm8VfTTDFJDMSK7OlDTguxqJfhTSRDd
         JxBCUlrqrIsxB21xU8zh3C2DO1WEYaavYdnXmm5FtIubVTVhQXosqGwdMqO0GfI2/VBA
         re2AhSF8Oe87+mrAYCsTXXWqdXRVBJ/78A3umzlF8BAgNSWgf53cAaegfOtpfaTBwkV5
         GoEg==
X-Gm-Message-State: AOAM53262syApEbv0Yw7RrWfJEKAz6dX12s2Ty5TP5LPIShIBtf6J0uL
        qMmv4YJ6rN/s6uc3kFQiXcYQhXKB6g==
X-Google-Smtp-Source: ABdhPJx/tnhQ6vjn0DMxTGdwocCI3DWXlq2L4NQ3u/Pul1LIighzqliVGW/oOL5Q/ygSfKhXPNw3gw==
X-Received: by 2002:aca:484e:: with SMTP id v75mr8582859oia.149.1620060413854;
        Mon, 03 May 2021 09:46:53 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 16sm74840otu.79.2021.05.03.09.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 09:46:53 -0700 (PDT)
Received: (nullmailer pid 1986883 invoked by uid 1000);
        Mon, 03 May 2021 16:46:52 -0000
Date:   Mon, 3 May 2021 11:46:52 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     devicetree@vger.kernel.org, abel.vesa@nxp.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de, shawnguo@kernel.org, linux-imx@nxp.com,
        dongas86@gmail.com
Subject: Re: [PATCH 1/6] dt-bindings: arm: imx: scu: fix naming typo of clk
 compatible string
Message-ID: <20210503164652.GA1986853@robh.at.kernel.org>
References: <20210423033334.3317992-1-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210423033334.3317992-1-aisheng.dong@nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 23 Apr 2021 11:33:29 +0800, Dong Aisheng wrote:
> There is a typo in binding doc that the name of compatible string of
> scu clock should be "fsl,xxx-clk" rather than "fsl,xxx-clock".
> In reality, both example and dts using "fsl,xxx-clk", so fixing the doc
> is enough.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
>  Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
