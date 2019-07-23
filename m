Return-Path: <SRS0=wHDH=VU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 635F8C76188
	for <linux-clk@archiver.kernel.org>; Tue, 23 Jul 2019 05:54:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 36FB1223A0
	for <linux-clk@archiver.kernel.org>; Tue, 23 Jul 2019 05:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1563861271;
	bh=Uy/g0mAPtlYuOpPGEkYh9Jv9h93JNBY2oSf8mrwvnDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=fpppSBPTMvXAacSC1d4L5oyv1hZB3O2TJndu6y9n8doBlAlWA/wOHrsAJFPmsdocC
	 LzsqDLNxUwX+HshIH2m/Xp1UnUwn0puHFGeBGEiXj1dx/RyBLXKLR0Dbcx3KQPxc8b
	 0MKbHXuG8jYYsGfy6kivJzeaT4WwA3vACJS0beJg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387866AbfGWFyb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Jul 2019 01:54:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:49484 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725788AbfGWFya (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 23 Jul 2019 01:54:30 -0400
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1BA582238E;
        Tue, 23 Jul 2019 05:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563861270;
        bh=Uy/g0mAPtlYuOpPGEkYh9Jv9h93JNBY2oSf8mrwvnDk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Wpr+XjeweKguKZyI7EGUKeV0aHAAaEVZZfMsSoX0KsjhMPtBZSow8fA5SWKhAZIZ9
         No3e/BgYLx1CtaCIFFGHwAeIQ4dTsXjbVQgC7sLbxNWjnGHiBf3kc8cOAQ59b6hQJj
         dAAgBonS07ZeLZmUbVsAIW6BRyKy1NLV1CZf5dtM=
Date:   Tue, 23 Jul 2019 13:53:52 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     jun.li@nxp.com
Cc:     sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, mturquette@baylibre.com, peter.chen@nxp.com,
        ping.bai@nxp.com, Anson.Huang@nxp.com, l.stach@pengutronix.de,
        abel.vesa@nxp.com, andrew.smirnov@gmail.com, ccaione@baylibre.com,
        angus@akkea.ca, agx@sigxcpu.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: imx8mq: set correct parent for usb ctrl clocks
Message-ID: <20190723055351.GP3738@dragon>
References: <20190710111917.6615-1-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190710111917.6615-1-jun.li@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jul 10, 2019 at 07:19:16PM +0800, jun.li@nxp.com wrote:
> From: Li Jun <jun.li@nxp.com>
> 
> Per latest imx8mq datasheet of CCM, the parent of usb1_ctrl_root_clk
> and usb2_ctrl_root_clk is usb_bus.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>

Applied both, thanks.
