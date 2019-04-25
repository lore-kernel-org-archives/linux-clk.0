Return-Path: <SRS0=pf3n=S3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D31CC43219
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 18:15:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A8B6420717
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 18:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556216125;
	bh=jUq9xXmXEN4h8LwpT1ei4MBMY4VNvCddkTvm6/ErCo4=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=OlqMgJ8N3y/l64oTqCCh2jCg69r2B99/iYoBN6AdbuQi+oYQqCWth2q3k8Jg4h8e+
	 nZVbHYBuJFM1Xgnl69KvL2jXUBRkJwe260oEJmFWZKIOOprXLrW3/x0apMtFxYIeQ4
	 MZW7jUehboq3r98WfsmiNsmVOvA95cMhaukT7nXE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728946AbfDYSPY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Apr 2019 14:15:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:36636 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726150AbfDYSPY (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 25 Apr 2019 14:15:24 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8B7E320685;
        Thu, 25 Apr 2019 18:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556216124;
        bh=jUq9xXmXEN4h8LwpT1ei4MBMY4VNvCddkTvm6/ErCo4=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=i8yIZQ0YOCTUBscyAygKZ3GZbMHQfN9SGVsWuwAhoyZyyxuvaS5a0CXo9FzIRGL++
         v03iIZnRdR2pXAXFzN0ZbVIsAKFT/na52nuiX99zp7V05YY+uiMU57FTFfWBziRJJv
         3no9dIYjmSNiRZR2tAro8uxVomywYLGsfXLT7xxI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1554365467-1325-5-git-send-email-t-kristo@ti.com>
References: <1554365467-1325-1-git-send-email-t-kristo@ti.com> <1554365467-1325-5-git-send-email-t-kristo@ti.com>
Cc:     tony@atomide.com
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 4/6] clk: ti: dra7: disable the RNG and TIMER12 clkctrl clocks on HS devices
To:     Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org, mturquette@baylibre.com
Message-ID: <155621612324.15276.10854183637444556718@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 25 Apr 2019 11:15:23 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Tero Kristo (2019-04-04 01:11:05)
> RNG and TIMER12 are reserved for secure side usage only on HS devices,
> so disable their clkctrl clocks on HS SoCs also.
>=20
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> Tested-by: Andrew F. Davis <afd@ti.com>
> ---

Applied to clk-next

