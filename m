Return-Path: <SRS0=uslk=OM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76BFBC04EB9
	for <linux-clk@archiver.kernel.org>; Mon,  3 Dec 2018 18:38:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4063D2145D
	for <linux-clk@archiver.kernel.org>; Mon,  3 Dec 2018 18:38:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jmfVODjy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4063D2145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbeLCSii (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Dec 2018 13:38:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:56382 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726564AbeLCSii (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 3 Dec 2018 13:38:38 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 39E7520848;
        Mon,  3 Dec 2018 18:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1543862314;
        bh=t0rzd98XH2a4s/L1Bz0TvjLoIgoyWJGe68VS1eBbfBE=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=jmfVODjyIbDPCfgNW5xlq/cuBFxuzZTGDU2kd/pKoDXzhu0GeQtLNLy5/JTbnTb4c
         Yv/TS2ELSG2u8Z9Ly9EMSETkG1rIjoyQeUiBj+u4qrhCLBkpXVqjKhZKH2ahLOm4lh
         oJE9KruZulWYou8UTzRJRcfa9swMXRo+EAkyCqIQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Aisheng DONG <aisheng.dong@nxp.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <AM0PR04MB42110579601320F59219CB9E80D10@AM0PR04MB4211.eurprd04.prod.outlook.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
References: <1542809234-539-1-git-send-email-aisheng.dong@nxp.com>
 <AM0PR04MB42110579601320F59219CB9E80D10@AM0PR04MB4211.eurprd04.prod.outlook.com>
Message-ID: <154386231357.88331.6991254616792618686@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: RE: [PATCH V8 0/7] clk: imx: add imx8qxp clock support
Date:   Mon, 03 Dec 2018 10:38:33 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Aisheng DONG (2018-11-28 09:18:47)
> Gently Ping...
> =


FYI, when you ping the thread, it floats to the end of the queue for me,
and then I don't review it for some time. Sorry, this is how it mostly
works. The bigger topics come to the front queue and then I try to get
to those sooner and let the stuff churning as newest in the queue become
lower priority because "someone else is doing something". I do sweeps
over the new stuff every day or two to pick out the easy one liners and
simple things because they may be critical, etc.

