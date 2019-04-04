Return-Path: <SRS0=Ee6+=SG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D49A1C4360F
	for <linux-clk@archiver.kernel.org>; Thu,  4 Apr 2019 14:07:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE0882082E
	for <linux-clk@archiver.kernel.org>; Thu,  4 Apr 2019 14:07:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727165AbfDDOHB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Apr 2019 10:07:01 -0400
Received: from muru.com ([72.249.23.125]:44322 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726618AbfDDOHB (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 4 Apr 2019 10:07:01 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D1F1C80D4;
        Thu,  4 Apr 2019 14:07:15 +0000 (UTC)
Date:   Thu, 4 Apr 2019 07:06:58 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
        sboyd@kernel.org, mturquette@baylibre.com
Subject: Re: [PATCH 2/6] ARM: omap2+: hwmod: drop CLK_IS_BASIC flag usage
Message-ID: <20190404140658.GB49658@atomide.com>
References: <1554365467-1325-1-git-send-email-t-kristo@ti.com>
 <1554365467-1325-3-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554365467-1325-3-git-send-email-t-kristo@ti.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [190404 08:12]:
> CLK_IS_BASIC flag is about to get deprecated, and as such, can't be used.
> Instead, the API call for checking whether a clock is of type hw_omap shall
> be used, so convert the code to use this.

Acked-by: Tony Lindgren <tony@atomide.com>
