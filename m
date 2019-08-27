Return-Path: <SRS0=sRHc=WX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC81C3A5A3
	for <linux-clk@archiver.kernel.org>; Tue, 27 Aug 2019 17:04:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 65A3E2189D
	for <linux-clk@archiver.kernel.org>; Tue, 27 Aug 2019 17:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566925492;
	bh=TF583lpqGqAfqYIr5T81s/7fUoHvU7Jv/F8trRtgTAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=u8ZdLVu30tVx+drdqDDlYxIcF9aoUCmWL1fMgGTlLZgK/ocskJIjfee8xFYdbx+4E
	 Mg5XTEAVuhqrabbFt4h83zAjV71djhRm5LK7LhT28Vt0QwP3LOLWedJRm9KqCLCzwi
	 jzKY3EV85XVjabU+eCCuF5zb2f08EyEobw0765nY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730339AbfH0REv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Aug 2019 13:04:51 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:33512 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727807AbfH0REu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Aug 2019 13:04:50 -0400
Received: by mail-oi1-f194.google.com with SMTP id l2so15549433oil.0;
        Tue, 27 Aug 2019 10:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MOuzbil80+G9gYzAiopiCVDBooAH3B/XNeV0uY3F0I8=;
        b=YIIPYcz48I8nZWggVktuyWDaA3H41zM7eAmuhqHXxqLl/azfplN1y62/yzTXORkL7x
         OipwvPdTHJZBfwcjnDeUFoiWb2AchQJoQazgSlUQj6wpbDG5EF6Z/LdqvnnIvQO2F+zR
         an5DE9EiHLt+KIXEvLhgMSr01ezIEOinrXvCwy7auEf3JCQ95//1i+uSX3fyDoF1bdsJ
         5eHekpcpGWlFyO5dMVeKq/eQ0qtFaZCnmofWACm0vyy0bFLe/otPwmTNpNQHLfnqB4Tq
         aYGhVOT68ApuQF5NTe68fS4nFotWIcEMOo3JXWA2BXXaJ5tk12sd4txzybEW2Dzrh8lr
         SgpA==
X-Gm-Message-State: APjAAAWd+PQo81pbt11/qzFUM9BmBDFw4KyppG+S8eC0HogXtalTQqYm
        mSVGtiOnDeJVbq5l1L7ziA==
X-Google-Smtp-Source: APXvYqxQM/gESOiP+h1wYgpZhd53hKVRGNNezbbV85qz8HiBzlfPBARHfluEK6KErDc/DhbhvNrKoQ==
X-Received: by 2002:a54:4414:: with SMTP id k20mr1968312oiw.120.1566925489593;
        Tue, 27 Aug 2019 10:04:49 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r3sm5366680otq.10.2019.08.27.10.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 10:04:48 -0700 (PDT)
Date:   Tue, 27 Aug 2019 12:04:48 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        sboyd@kernel.org, mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH V4 01/11] dt-bindings: firmware: imx-scu: new binding to
 parse clocks from device tree
Message-ID: <20190827170448.GA15803@bogus>
References: <1566299605-15641-1-git-send-email-aisheng.dong@nxp.com>
 <1566299605-15641-2-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1566299605-15641-2-git-send-email-aisheng.dong@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 20 Aug 2019 07:13:15 -0400, Dong Aisheng wrote:
> There's a few limitations on the original one cell clock binding
> (#clock-cells = <1>) that we have to define some SW clock IDs for device
> tree to reference. This may cause troubles if we want to use common
> clock IDs for multi platforms support when the clock of those platforms
> are mostly the same.
> e.g. Current clock IDs name are defined with SS prefix.
> 
> However the device may reside in different SS across CPUs, that means the
> SS prefix may not valid anymore for a new SoC. Furthermore, the device
> availability of those clocks may also vary a bit.
> 
> For such situation, we want to eliminate the using of SW Clock IDs and
> change to use a more close to HW one instead.
> For SCU clocks usage, only two params required: Resource id + Clock Type.
> Both parameters are platform independent. So we could use two cells binding
> to pass those parameters,
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
> ChangeLog:
> v3->v4:
>  * add some comments for various clock types
> v2->v3:
>  * Changed to two cells binding and register all clocks in driver
>    instead of parse from device tree.
> v1->v2:
>  * changed to one cell binding inspired by arm,scpi.txt
>    Documentation/devicetree/bindings/arm/arm,scpi.txt
>    Resource ID is encoded in 'reg' property.
>    Clock type is encoded in generic clock-indices property.
>    Then we don't have to search all the DT nodes to fetch
>    those two value to construct clocks which is relatively
>    low efficiency.
>  * Add required power-domain property as well.
> ---
>  .../devicetree/bindings/arm/freescale/fsl,scu.txt  | 12 ++++++-----
>  include/dt-bindings/firmware/imx/rsrc.h            | 23 ++++++++++++++++++++++
>  2 files changed, 30 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
