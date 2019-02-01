Return-Path: <SRS0=rfa6=QI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA85C282D8
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 06:21:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6B3CC21726
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 06:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1549002108;
	bh=jolWSSfNARvH7BtFErROH2CTYBirDCtLxDlkO90VyKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=KieYHmVstxmoQFbeTKuwS1PXuhmlYUXCr47f78DdLVmbrBZ8o+RZNVj9D6WJU4c7v
	 9Gjm/IEocccPiB0qJjwOItqZmpjyCBxycHFyjtLOdGAqVKc2dJNbpJ9LDum8h+3y2P
	 FUZUduwha4FSxSlSwdVu9b9Mk4A7Fc5tQs/Y+N2Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbfBAGVr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Feb 2019 01:21:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:36990 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726339AbfBAGVr (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 1 Feb 2019 01:21:47 -0500
Received: from dragon (61-216-91-114.HINET-IP.hinet.net [61.216.91.114])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 63BEF20869;
        Fri,  1 Feb 2019 06:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1549002107;
        bh=jolWSSfNARvH7BtFErROH2CTYBirDCtLxDlkO90VyKI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PhPO9XIru8GuvPztKawGwO/xB8EYcoh0r5hS5hPVhJ1NWJXdLPUNyKVB8StEMnygx
         kVFPY5cQaAt1ook6Vxmz5TQvnP5PttP3E78rqYM+VaQsMZmcyVFmNRCvNKK0rWyJZh
         AGMMCkblhwPdXe0pXAE96oWUp3Sw25kBdBHiOsIQ=
Date:   Fri, 1 Feb 2019 14:21:35 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Aisheng Dong <aisheng.dong@nxp.com>
Cc:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH V3 1/5] dt-bindings: fsl: scu: add fallback compatible
 string for clock
Message-ID: <20190201062133.GJ19882@dragon>
References: <1548335800-6438-1-git-send-email-aisheng.dong@nxp.com>
 <1548335800-6438-2-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1548335800-6438-2-git-send-email-aisheng.dong@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jan 24, 2019 at 01:22:32PM +0000, Aisheng Dong wrote:
> SCU clock can be used in a similar way by IMX8QXP and IMX8QM SoCs.
> Let's add a "fsl,scu-clk" fallback compatible string to allow other
> SoCs to reuse the common part.
> 
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Applied, thanks.
