Return-Path: <SRS0=pf3n=S3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2951FC43218
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 19:37:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4714220693
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 19:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556221033;
	bh=BnmU6Zad0Dh1dJg+ZChXgY1zJXhwhqtNeBqnFYotOcY=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=hu5I+gEPN8LFfT91vTPHAgRu/HrHmlwBbpckakWeL5OTRjD61qLKjjUlp0rv4Zz9T
	 LiEwbh5jU1n97v5qleJo9yHOPi3O/R6B2bj1WYmuO+IeUFNy5nvafV6DNp8YFbxoLl
	 rlvlxun4tFN0AI0+T2L1bMBq4GyYTwo1u/Xa2Zl8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbfDYThM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Apr 2019 15:37:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:33718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725937AbfDYThL (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 25 Apr 2019 15:37:11 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4813420685;
        Thu, 25 Apr 2019 19:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556221031;
        bh=BnmU6Zad0Dh1dJg+ZChXgY1zJXhwhqtNeBqnFYotOcY=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=t1aB5YUHxdwLB0ecQwE936e8QEY5/XINbnxPMlDZ3OQhVtibuBE0ScSdyigqsM7FZ
         AZ5Zb1hfqdPO6/PvMx86tJgpBY8V85OT9M+90R6SzGW4AHu006AjVmA+1Nd3lgIKVW
         ixVc/6e+AIhkCJmNHyCJjsAEEnQKnrtxCEcNoKCw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190402125056.21509-4-alexandre.belloni@bootlin.com>
References: <20190402125056.21509-1-alexandre.belloni@bootlin.com> <20190402125056.21509-4-alexandre.belloni@bootlin.com>
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 3/7] clk: at91: usb: Add sam9x60 support
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Message-ID: <155622103020.15276.15294662021105247484@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 25 Apr 2019 12:37:10 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Alexandre Belloni (2019-04-02 05:50:52)
> The sam9x60 USB clock supports four different parents, ensure they can be
> selected.
>=20
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---

Applied to clk-next

