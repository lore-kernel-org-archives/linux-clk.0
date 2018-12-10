Return-Path: <SRS0=Ck/k=OT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37DE8C04EB8
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 19:41:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EDD9520870
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 19:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544470876;
	bh=eT6QUacECgY13eWEa+Kk0VTLFDH2pcazlSIC8G7U32A=;
	h=In-Reply-To:To:Subject:From:References:Cc:Date:List-ID:From;
	b=CQAhfvv1e4pCEyXe21kCsViZQpGLAKayzJ2DFrbcIz9N9BBJgjPpaiYk9kCvDg/sC
	 qq2xqIquAjnXEX44DhOC91qzSrAy3DC54JwL5UYwJPv1AQUBXPzYZ+V0pUsRsWR5B9
	 QmFysAyWv8XwwAkYsXQu5o8PzBLtvaagMLL28vgs=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDD9520870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728099AbeLJTlP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Dec 2018 14:41:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:52584 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726693AbeLJTlP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 10 Dec 2018 14:41:15 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D57DC2086D;
        Mon, 10 Dec 2018 19:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544470874;
        bh=eT6QUacECgY13eWEa+Kk0VTLFDH2pcazlSIC8G7U32A=;
        h=In-Reply-To:To:Subject:From:References:Cc:Date:From;
        b=wIY1Q/IIrFIZtIWm1DfzrQ6DMxBeNDT7ajhrQ5bneLqlRX16c3NhUIfVTZrhy0/P5
         5LtOOBvFwKoxoj6ILyBpVGMQBGuZ5XbN/wj+CC1cAigwGhfQH/eqZxT1T6td78BkGT
         Utu5GBavY8LlRALWrm28Xiiq93UQTWZ8dYe01g9o=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20181115143028.19087-3-l.stach@pengutronix.de>
Message-ID: <154447087417.17204.15229374543848791608@swboyd.mtv.corp.google.com>
To:     Lucas Stach <l.stach@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v2 3/3] clk: imx6q: handle ENET PLL bypass
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.7
References: <20181115143028.19087-1-l.stach@pengutronix.de> <20181115143028.19087-3-l.stach@pengutronix.de>
Cc:     NXP Linux Team <linux-imx@nxp.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de, patchwork-lst@pengutronix.de
Date:   Mon, 10 Dec 2018 11:41:14 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lucas Stach (2018-11-15 06:30:28)
> The ENET PLL is different from the other i.MX6 PLLs, as it has
> multiple outputs with different post-dividers, which are all
> bypassed if the single bypass bit is activated. The hardware setup
> looks something like this:
>                                 _
> refclk-o---PLL---o----DIV1-----| \

Applied to clk-next

