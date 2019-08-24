Return-Path: <SRS0=P1/z=WU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40CFBC3A59E
	for <linux-clk@archiver.kernel.org>; Sat, 24 Aug 2019 19:21:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0F8102173E
	for <linux-clk@archiver.kernel.org>; Sat, 24 Aug 2019 19:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566674476;
	bh=h2m5HRs3oN+X6s6A7Bth7R0M+KU0kJFHN827MW9FuFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=jPT6ETflL6mxrXJn/sAERHasDdO+f+J4n/koBP+yUKn8eWXT1TSaa4Ehf6+KMDjgY
	 CMYOTRm5stcAiBBsIhOKjDArniOvxCJR+u//lljVKpFhfCQQaHmqQiVT6aspR59E3Q
	 V9LRsD8wHCzkK/gZ1aE3Pw//IysfuBMkk/n5vESY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727019AbfHXTVP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 24 Aug 2019 15:21:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:34554 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726464AbfHXTVP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 24 Aug 2019 15:21:15 -0400
Received: from X250.getinternet.no (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1CACC2146E;
        Sat, 24 Aug 2019 19:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566674474;
        bh=h2m5HRs3oN+X6s6A7Bth7R0M+KU0kJFHN827MW9FuFQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AHXGPjSi12ZODq4LdFT+2UlPu6C04s1EEhcLYbMb4BpmaX3zl5wh/D2g1zOFO0Oar
         26l31oIW4I1vHPumcR51u2LmPEM0CPNDkjyeLXpLL2EjOH49eLn1CRcCQL9bIrtOJN
         VeMGq08ivdjjFZYZjUkUIyMPPyW6iuzuUK5C1AYI=
Date:   Sat, 24 Aug 2019 21:21:02 +0200
From:   Shawn Guo <shawnguo@kernel.org>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        sboyd@kernel.org, mturquette@baylibre.com, fabio.estevam@nxp.com,
        linux-imx@nxp.com, kernel@pengutronix.de,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH V4 02/11] dt-bindings: clock: imx-lpcg: add support to
 parse clocks from device tree
Message-ID: <20190824192101.GG16308@X250.getinternet.no>
References: <1566299605-15641-1-git-send-email-aisheng.dong@nxp.com>
 <1566299605-15641-3-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1566299605-15641-3-git-send-email-aisheng.dong@nxp.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Aug 20, 2019 at 07:13:16AM -0400, Dong Aisheng wrote:
> MX8QM and MX8QXP LPCG Clocks are mostly the same except they may reside
> in different subsystems across CPUs and also vary a bit on the availability.
> 
> Same as SCU clock, we want to move the clock definition into device tree
> which can fully decouple the dependency of Clock ID definition from device
> tree and make us be able to write a fully generic lpcg clock driver.
> 
> And we can also use the existence of clock nodes in device tree to address
> the device and clock availability differences across different SoCs.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Acked-by: Shawn Guo <shawnguo@kernel.org>
