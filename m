Return-Path: <SRS0=mH3q=NR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3506FC32789
	for <linux-clk@archiver.kernel.org>; Tue,  6 Nov 2018 17:35:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F2C2A2086B
	for <linux-clk@archiver.kernel.org>; Tue,  6 Nov 2018 17:35:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="iA+6ut05"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2C2A2086B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389688AbeKGDB2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Nov 2018 22:01:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:47374 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388987AbeKGDB2 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 6 Nov 2018 22:01:28 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BC0DB2085B;
        Tue,  6 Nov 2018 17:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1541525711;
        bh=Ml7qeam43eowZNtrVW1tWnNTL0Lj6FAIeYFK2JwCVJA=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=iA+6ut05uC9eP6WQPfDNKZOJB7EkwqCZMQnNH42ulUWwsicima68wijvXhCDv7UiX
         XcXPJQFbQrK6bD+z4F16FGESL6leAPLx29JUxHVick0eiKDkSz4PvCB4Z3d1eMF9Oe
         K5TyoE66AFt5cZ5W4ZWwuogxOgCmwSp+ScC9eWdg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Chris Boot <bootc@bootc.net>, Eric Anholt <eric@anholt.net>,
        Florian Meier <florian.meier@koalo.de>,
        Martin Sperl <kernel@martin.sperl.org>,
        Stefan Wahren <stefan.wahren@i2se.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1540292769-5905-2-git-send-email-stefan.wahren@i2se.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-clk@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Stefan Wahren <stefan.wahren@i2se.com>
References: <1540292769-5905-1-git-send-email-stefan.wahren@i2se.com>
 <1540292769-5905-2-git-send-email-stefan.wahren@i2se.com>
Message-ID: <154152571120.88331.10791829613264707458@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH 1/3] clk: bcm2835: make license text and module license match
Date:   Tue, 06 Nov 2018 09:35:11 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Stefan Wahren (2018-10-23 04:06:06)
> The license text is specifying GPL v2 or later but the MODULE_LICENSE
> is set to GPL v2 which means GNU Public License v2 only. So choose the
> license text as the correct one.
> =

> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---

Applied to clk-next

