Return-Path: <SRS0=MyMj=2B=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC1DC43603
	for <linux-clk@archiver.kernel.org>; Wed, 11 Dec 2019 08:06:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C1807222C4
	for <linux-clk@archiver.kernel.org>; Wed, 11 Dec 2019 08:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576051601;
	bh=aZtYd98mzUkDYBimIJiIk+xpvUxyvOdwk4skO2rZsWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=1TPndoGhg67oLz0xSasTBlsvzho8NklKMsHiYqzTvhGmolZUoAlUUrUjtK/in6XL6
	 APWq68xNKfZMuzpLOU4DPn08pbRqOpDC5BVVB7XNJurCRxezipRLJ0f6QxR4jnIiIR
	 4a5Bbe4RV/tgBy+p+GlNys6G6Ilt1PSVMiX4nVmQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728222AbfLKIGl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Dec 2019 03:06:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:58576 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726543AbfLKIGk (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 11 Dec 2019 03:06:40 -0500
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 35EA12054F;
        Wed, 11 Dec 2019 08:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576051599;
        bh=aZtYd98mzUkDYBimIJiIk+xpvUxyvOdwk4skO2rZsWU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tRBOLd7GogVABRX6jLstcnMWcS5/AnpxkmChvjpnfYJ61Yl3+pM15HSBu7xDVKBOM
         a0qVMbdC9b8ZZBPDpXgJLlkljluvdJxDZdGVCCmp3uVb/d8nfu8+RAVGvmN0gQ/giB
         dPp6V5vJDVJaPuCvdOKFJu9emxfjAjYrvgrWftO8=
Date:   Wed, 11 Dec 2019 16:06:29 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Leonard Crestez <leonard.crestez@nxp.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com
Subject: Re: [PATCH] clk: imx8qxp-lpcg: Warn against
 devm_platform_ioremap_resource
Message-ID: <20191211080628.GT15858@dragon>
References: <329ac54993d5eb955249d037241a7213faff508f.1575924858.git.leonard.crestez@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <329ac54993d5eb955249d037241a7213faff508f.1575924858.git.leonard.crestez@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Dec 09, 2019 at 10:56:28PM +0200, Leonard Crestez wrote:
> On imx8 the LPCG nodes map entire subsystems and overlap peripherals,
> this means that using devm_platform_ioremap_resource will cause many
> devices to fail to probe including serial ports.
> 
> Well-meaning but boot-breaking patches were posted multiple times so add
> a comment explaining this issue.
> 
> Suggested-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>

Applied, thanks.
