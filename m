Return-Path: <SRS0=BgTf=NW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF3A2C43441
	for <linux-clk@archiver.kernel.org>; Sun, 11 Nov 2018 09:10:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE6F720871
	for <linux-clk@archiver.kernel.org>; Sun, 11 Nov 2018 09:10:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="JmslvLEd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE6F720871
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727344AbeKKS6J (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 11 Nov 2018 13:58:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:60076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727334AbeKKS6I (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 11 Nov 2018 13:58:08 -0500
Received: from localhost (unknown [171.76.98.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C6D8420872;
        Sun, 11 Nov 2018 09:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1541927408;
        bh=+WcNf6m0/ugbygWhT7sccu6J3/SZF/jG87JMqxdXiCk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JmslvLEdej+p9nmYfp0iEhDfkKx8WgFA+NunjZOmHbczg3OkXW2gBHg7hNAHU1A83
         In4EL2kEKyTc/t8GOK99HRmsCcy9w0mQ+fn5L1n6R2gPtFUwSL0F2AXQMinw3YDlYm
         BJC15egy0DSLRhOzsu49sKxXGVZLmdjI6Cp9SkOg=
Date:   Sun, 11 Nov 2018 14:39:59 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Florian Meier <florian.meier@koalo.de>,
        Chris Boot <bootc@bootc.net>,
        Martin Sperl <kernel@martin.sperl.org>,
        Eric Anholt <eric@anholt.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] dma: bcm2835: make license text and module license
 match
Message-ID: <20181111090959.GX12092@vkoul-mobl>
References: <1540292769-5905-1-git-send-email-stefan.wahren@i2se.com>
 <1540292769-5905-3-git-send-email-stefan.wahren@i2se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1540292769-5905-3-git-send-email-stefan.wahren@i2se.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-10-18, 13:06, Stefan Wahren wrote:
> The license text is specifying GPL v2 or later but the MODULE_LICENSE
> is set to GPL v2 which means GNU Public License v2 only. So choose the
> license text as the correct one.

Applied after fixing subsystem name, thanks

-- 
~Vinod
