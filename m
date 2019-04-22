Return-Path: <SRS0=Z5yo=SY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60CB5C10F14
	for <linux-clk@archiver.kernel.org>; Mon, 22 Apr 2019 00:42:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 284F120870
	for <linux-clk@archiver.kernel.org>; Mon, 22 Apr 2019 00:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555893768;
	bh=0rhA6kLEkw4r6fZtl8rEBYAttu61+s//ILPJ2PZ3hGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=jitRkpNUuLrIyESlZ94pReRFVKphrGphobpl0/sPbLzwrOvn8Kio6Mh2RTvhtDV/i
	 elX7RZ+kF5qU/sSsv8xwAXDatTEcQtgzJyIwJfxWSlqnuErQS0kmo32IzzkBi8TIib
	 vgm7rUeCbq6fMvgQSQ2UoLt5w2EFmf7VSkyxH7DM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726033AbfDVAmr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 21 Apr 2019 20:42:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:40078 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725872AbfDVAmr (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 21 Apr 2019 20:42:47 -0400
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 97BB920833;
        Mon, 22 Apr 2019 00:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555893767;
        bh=0rhA6kLEkw4r6fZtl8rEBYAttu61+s//ILPJ2PZ3hGs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kHPhHIU5FBwzVPUD0t91qzqVEX1j9I1lKOZwwkXqsnC0aJqWEcoE+6y4i1t2ktuXU
         N3ZxoUOpdsVrGGlcJGK+x3smQJNEoZghSe3DLxqdlqkqamh1J/iimeLnWVSNoO8raU
         cvnn2QwCik+mHJAeAzPu7gOjYwURkXLVP3pVm++I=
Date:   Mon, 22 Apr 2019 08:42:29 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Leonard Crestez <leonard.crestez@nxp.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Robin Gong <yibin.gong@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Angus Ainslie <angus@akkea.ca>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        "linux-pm@lists.infradead.org" <linux-pm@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 2/4] arm64: dts: imx8mm: Add cpufreq properties
Message-ID: <20190422004228.GH19962@dragon>
References: <cover.1555077720.git.leonard.crestez@nxp.com>
 <9e2f3a885ba69e29ec5592ea7b07b6595bca3404.1555077720.git.leonard.crestez@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e2f3a885ba69e29ec5592ea7b07b6595bca3404.1555077720.git.leonard.crestez@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Apr 12, 2019 at 02:10:03PM +0000, Leonard Crestez wrote:
> This is very similar to imx8mq cpufreq-dt support.
> 
> Operating points are from datasheet:
> https://www.nxp.com/docs/en/data-sheet/IMX8MMCEC.pdf
> 
> Higher opps were omitted (just like imx8mq) because it requires checking
> speed grade from OCOTP fuses.
> 
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>

Applied, thanks.
