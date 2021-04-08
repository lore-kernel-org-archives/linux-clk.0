Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24612C433ED
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 06:41:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9E556113C
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 06:41:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbhDHGlX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Apr 2021 02:41:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:38212 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229745AbhDHGlX (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 8 Apr 2021 02:41:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0A41261139;
        Thu,  8 Apr 2021 06:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1617864072;
        bh=MGM3GA2UhFPlTglyNRnEfcAx8khpllAl806BLf2kZew=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ctmW25pg2AhGIYpWlPQGWCUYImFRCj7g61Z9V1Vk87qW8HI3QYKKg0OS4ecyqoHYw
         OffpLh2sPKFZvmepGS7kAgaYNufQYBQlYREcr1LkB9cKqGFfRqemhp1p3FzOgCNn6F
         RJs8lBJRrld7Ow6gIRxXjwENhyGwQhye4NuYue/g=
Date:   Thu, 8 Apr 2021 08:41:09 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Saravana Kannan <saravanak@google.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, kernel-team@android.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] driver core: Add dev_set_drv_sync_state()
Message-ID: <YG6lhT7vuiCNvvDg@kroah.com>
References: <20210407034456.516204-1-saravanak@google.com>
 <20210407034456.516204-2-saravanak@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210407034456.516204-2-saravanak@google.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Apr 06, 2021 at 08:44:54PM -0700, Saravana Kannan wrote:
> This can be used by frameworks to set the sync_state() helper functions
> for drivers that don't already have them set.
> 
> Signed-off-by: Saravana Kannan <saravanak@google.com>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
