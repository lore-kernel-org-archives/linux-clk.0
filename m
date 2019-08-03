Return-Path: <SRS0=KU3F=V7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33DEFC433FF
	for <linux-clk@archiver.kernel.org>; Sat,  3 Aug 2019 08:58:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D6C3021773
	for <linux-clk@archiver.kernel.org>; Sat,  3 Aug 2019 08:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1564822701;
	bh=SOx2wBzy9M6YJWlyIwmJDGGWwRw0nMUM4cZrl73eq0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=lCbOJv3+/rebCmcKKo0Dsq9QqKW3L4PYM6VoG/5N10UuZX3zjqeQLOktYn0mpa5+h
	 cRUgKDhg8p2sp9khC2qYWczbPz45LkGsCiTs6qkWHZohkgsNocnN2xb0c6CLjrJud7
	 ulkSn6I3bMtblFFggRs/9CX6mffFMJO9zp+KLPzk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387778AbfHCI6V (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 3 Aug 2019 04:58:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:42562 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387730AbfHCI6V (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 3 Aug 2019 04:58:21 -0400
Received: from X250.getinternet.no (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F173C21726;
        Sat,  3 Aug 2019 08:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564822700;
        bh=SOx2wBzy9M6YJWlyIwmJDGGWwRw0nMUM4cZrl73eq0c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XK+52QswD+LEz+tHzZjmI5nnPJ0HCrkQK66CAPHwBijSyw0bgOwnU3kNSWPAZ4tAU
         rjQ0h/QoqE7+nJF3jhO/xlVV5taKwdkv4iqyExbOTfAEdLf+mZvWAGPMb4qSyDEuvG
         X/tj1jca+lmjoFcM1ezPTsEG4JGMqk3UPyuHIevE=
Date:   Sat, 3 Aug 2019 10:58:13 +0200
From:   Shawn Guo <shawnguo@kernel.org>
To:     Anson.Huang@nxp.com
Cc:     mturquette@baylibre.com, sboyd@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, abel.vesa@nxp.com,
        aisheng.dong@nxp.com, l.stach@pengutronix.de, ping.bai@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Linux-imx@nxp.com
Subject: Re: [PATCH] clk: imx: Remove unused function statement
Message-ID: <20190803085812.GH8870@X250.getinternet.no>
References: <20190724062435.28074-1-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190724062435.28074-1-Anson.Huang@nxp.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jul 24, 2019 at 02:24:35PM +0800, Anson.Huang@nxp.com wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
> 
> imx_register_uart_clocks_hws() function is NOT implemented
> at all, remove it.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied, thanks.
