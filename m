Return-Path: <SRS0=eZMu=MX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B538C32788
	for <linux-clk@archiver.kernel.org>; Thu, 11 Oct 2018 12:58:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B9DF220652
	for <linux-clk@archiver.kernel.org>; Thu, 11 Oct 2018 12:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9DF220652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727261AbeJKUZE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Oct 2018 16:25:04 -0400
Received: from gloria.sntech.de ([185.11.138.130]:39850 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726126AbeJKUZE (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Oct 2018 16:25:04 -0400
Received: from we0660.dip.tu-dresden.de ([141.76.178.148] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.0:ECDHE_RSA_AES_256_CBC_SHA1:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1gAaXO-00049o-54; Thu, 11 Oct 2018 14:57:58 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     linux-clk@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org, mturquette@baylibre.com,
        sboyd@kernel.org
Subject: Re: [PATCH 1/2] clk: rockchip: add clock-id for HCLK_HDMI on rk3066
Date:   Thu, 11 Oct 2018 14:57:57 +0200
Message-ID: <2017139.gVx9nH3rJL@phil>
In-Reply-To: <20181008120247.31242-1-heiko@sntech.de>
References: <20181008120247.31242-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Am Montag, 8. Oktober 2018, 14:02:46 CEST schrieb Heiko Stuebner:
> RK3066 and RK3188 share most of the clock controller but the rk3066 does
> have an internal hdmi encoder and associated clock. Therefore add a
> clock-id so that this clock can be used.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

applied both for 4.20


