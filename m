Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64999C6FD1F
	for <linux-clk@archiver.kernel.org>; Thu, 16 Mar 2023 15:02:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbjCPPCY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Mar 2023 11:02:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230259AbjCPPCX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Mar 2023 11:02:23 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 402B2D30AC;
        Thu, 16 Mar 2023 08:02:19 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B308C2F4;
        Thu, 16 Mar 2023 08:03:02 -0700 (PDT)
Received: from bogus (unknown [10.57.52.173])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 93FED3F67D;
        Thu, 16 Mar 2023 08:02:17 -0700 (PDT)
Date:   Thu, 16 Mar 2023 15:01:44 +0000
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 15/30] clk: scpi: Convert to platform remove callback
 returning void
Message-ID: <20230316150144.2aap5otmgblj24ty@bogus>
References: <20230312161512.2715500-1-u.kleine-koenig@pengutronix.de>
 <20230312161512.2715500-16-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230312161512.2715500-16-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, Mar 12, 2023 at 05:14:57PM +0100, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

Let me know if you want me to pick up instead.

-- 
Regards,
Sudeep
