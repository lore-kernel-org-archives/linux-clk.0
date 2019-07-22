Return-Path: <SRS0=ECv2=VT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF3ABC76196
	for <linux-clk@archiver.kernel.org>; Mon, 22 Jul 2019 01:51:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 97EB5218B8
	for <linux-clk@archiver.kernel.org>; Mon, 22 Jul 2019 01:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1563760282;
	bh=Ifmw1kwQs1PBl3C/XBm2CuGOQOQuGLamhmGWLqcBvlQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=CqekZ1XOdRC51KMV6iSDqK4N+S4WyIHseXQUYdQQcuk5Bxpq/zaWPaxTFDbGVJZS0
	 o640damQIVA76/t0TvbYdRTBKFpVEdIXoDqR/F+78uovnz1LRLBW6pfHGTIudYaJHj
	 gLF9SP2rspV3kyyTimk0BUbkp1wNfPiz5jff4lZ4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727875AbfGVBvS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 21 Jul 2019 21:51:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:41750 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726440AbfGVBvS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 21 Jul 2019 21:51:18 -0400
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1C7B2218B8;
        Mon, 22 Jul 2019 01:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563760277;
        bh=Ifmw1kwQs1PBl3C/XBm2CuGOQOQuGLamhmGWLqcBvlQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r3axg1iCHjWk3zZNu6E58/7oxdmAxHyfW8pbl617pfU55iT9sbpwBxszDM2LlZYyq
         HOiaN5LfiaDf14u3csRk1tJvv1Jl88RPoJ7y6qiiCJAfCR3gu3Wx8y7mm3uJSsJKmy
         uu/9H7Q2VW5ZDGMI3fbzJcCo+YeM2vvXmk1/WLQU=
Date:   Mon, 22 Jul 2019 09:50:44 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Anson.Huang@nxp.com
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com,
        will.deacon@arm.com, maxime.ripard@bootlin.com, olof@lixom.net,
        horms+renesas@verge.net.au, jagan@amarulasolutions.com,
        leonard.crestez@nxp.com, bjorn.andersson@linaro.org,
        dinguyen@kernel.org, enric.balletbo@collabora.com,
        aisheng.dong@nxp.com, ping.bai@nxp.com, abel.vesa@nxp.com,
        l.stach@pengutronix.de, peng.fan@nxp.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH V5 1/5] dt-bindings: imx: Add clock binding doc for
 i.MX8MN
Message-ID: <20190722015043.GP3738@dragon>
References: <20190619055247.35771-1-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190619055247.35771-1-Anson.Huang@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jun 19, 2019 at 01:52:43PM +0800, Anson.Huang@nxp.com wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
> 
> Add the clock binding doc for i.MX8MN.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Reviewed-by: Maxime Ripard <maxime.ripard@bootlin.com>

Applied all, thanks.
