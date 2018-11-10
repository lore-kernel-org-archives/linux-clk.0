Return-Path: <SRS0=kVDh=NV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E83AC43441
	for <linux-clk@archiver.kernel.org>; Sat, 10 Nov 2018 12:45:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B3E9420892
	for <linux-clk@archiver.kernel.org>; Sat, 10 Nov 2018 12:45:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3E9420892
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=martin.sperl.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728996AbeKJWaI convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 10 Nov 2018 17:30:08 -0500
Received: from 212-186-180-163.static.upcbusiness.at ([212.186.180.163]:55522
        "EHLO cgate.sperl.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728983AbeKJWaI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 10 Nov 2018 17:30:08 -0500
X-Greylist: delayed 3611 seconds by postgrey-1.27 at vger.kernel.org; Sat, 10 Nov 2018 17:30:06 EST
Received: from msmac.intern.sperl.org (account martin@sperl.org [10.10.10.11] verified)
  by sperl.org (CommuniGate Pro SMTP 6.2.1 _community_)
  with ESMTPSA id 7750507; Sat, 10 Nov 2018 11:45:10 +0000
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH 0/3] Fix MODULE_LICENSE of bcm2835 drivers
From:   kernel@martin.sperl.org
In-Reply-To: <1540292769-5905-1-git-send-email-stefan.wahren@i2se.com>
Date:   Sat, 10 Nov 2018 12:45:09 +0100
Cc:     Florian Meier <florian.meier@koalo.de>,
        Chris Boot <bootc@bootc.net>, Eric Anholt <eric@anholt.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-clk@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 8BIT
Message-Id: <B176A2C1-D221-4F36-9A61-571EF5AB6FEB@martin.sperl.org>
References: <1540292769-5905-1-git-send-email-stefan.wahren@i2se.com>
To:     Stefan Wahren <stefan.wahren@i2se.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


> On 23.10.2018, at 13:06, Stefan Wahren <stefan.wahren@i2se.com> wrote:
> 
> In preparation of a treewide switch of all bcm2835 drivers to SPDX tags,
> we need to make sure that the license text and MODULE_LICENSE matches.
> 
> This series starts sooner than usual to have more time to collect the authors
> ACK.
> 
> Stefan Wahren (3):
>  clk: bcm2835: make license text and module license match
>  dma: bcm2835: make license text and module license match
>  spi: bcm2835: make license text and module license match
> 
> drivers/clk/bcm/clk-bcm2835-aux.c | 2 +-
> drivers/clk/bcm/clk-bcm2835.c     | 2 +-
> drivers/dma/bcm2835-dma.c         | 2 +-
> drivers/spi/spi-bcm2835.c         | 2 +-
> drivers/spi/spi-bcm2835aux.c      | 2 +-
> 5 files changed, 5 insertions(+), 5 deletions(-)
> 

Acked-by: Martin Sperl <kernel@martin.sperl.org>

