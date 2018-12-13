Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92256C65BAE
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 08:32:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4939F20849
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 08:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544689956;
	bh=O72ILo7tdWnnCZh27go6jS1BNhZRCoEoDR0EZj4VlVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=NGrg3pWpfdt9q1q2Yw1P/SUvtRBvnaPNgs0XLTWZMdI0JPeCBjj+5pgRrF4bGdVJ+
	 T4jhXe71od1Py3DznckqwDJW32o02i+tXHskayCjVaMA6kw8NU0TlK0gaQd5XPuZxg
	 x6zxS3vHCOwdGTvClYNwFgONx0/96nECCHD54MTo=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4939F20849
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbeLMIcg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 03:32:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:58276 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725949AbeLMIcf (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 Dec 2018 03:32:35 -0500
Received: from dragon (61-216-91-114.HINET-IP.hinet.net [61.216.91.114])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7305720811;
        Thu, 13 Dec 2018 08:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544689955;
        bh=O72ILo7tdWnnCZh27go6jS1BNhZRCoEoDR0EZj4VlVY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c7V0I0+cz50GNOklCfXNNpfQfCdGsYDPjZfDZnOOGkLI1KnWhNzF2hXDAXutJs2O8
         oTAMFtPe+OoFSTGgz5gbYQxRmYmfyNFNWaaq9z4gGPKu7NwpEhR/EyfsrzzZaF/AFT
         2BJmoIeFdAqzzc57ekn3GgMD/GABssFhT2eWdDug=
Date:   Thu, 13 Dec 2018 16:31:39 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH V11 3/7] dt-bindings: clock: imx8qxp: add SCU clock IDs
Message-ID: <20181213083137.GC12458@dragon>
References: <1544662938-5020-1-git-send-email-aisheng.dong@nxp.com>
 <1544662938-5020-4-git-send-email-aisheng.dong@nxp.com>
 <154468796011.19322.4309575824691854273@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <154468796011.19322.4309575824691854273@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Dec 12, 2018 at 11:59:20PM -0800, Stephen Boyd wrote:
> Quoting Aisheng Dong (2018-12-12 17:07:59)
> > Add IMX8QXP SCU clock IDs.
> > 
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: Shawn Guo <shawnguo@kernel.org>
> > Cc: Sascha Hauer <kernel@pengutronix.de>
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-clk@vger.kernel.org
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > ---
> 
> Applied to clk-next
> 
> Please send these at the start of the series in the future. That way
> platform maintainers can merge the first few binding patches into their
> tree and not drag in the driver code to their arm-soc pulls.

Right, sensible suggestion for me :)

Shawn
