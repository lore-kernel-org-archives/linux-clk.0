Return-Path: <SRS0=klTJ=DV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA1CEC433E7
	for <linux-clk@archiver.kernel.org>; Wed, 14 Oct 2020 17:17:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B7E222247
	for <linux-clk@archiver.kernel.org>; Wed, 14 Oct 2020 17:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602695830;
	bh=/9+hPphOwWOhBgh7zb6H0KJlYZ3YxcUAZQLUYZsqqTY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=uSjAX921VCNTCza1mSCkoEAKcGEJd+Hi5tazIvbUl2bsQnKnYTKKoMSRSsG62t+iU
	 sFrdOiq+lK+AQzPBCnwKPm3fb/aJu8TpCAepwh2CvuQ3KkBjGLV67PigDRB1zw00lg
	 XZsoOMGiYDnHn2qboiiHfkA9H9QZvCqQH6WqJ+5o=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728368AbgJNRRK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Oct 2020 13:17:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:49674 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728468AbgJNRRJ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 14 Oct 2020 13:17:09 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 35B2A22227;
        Wed, 14 Oct 2020 17:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602695829;
        bh=/9+hPphOwWOhBgh7zb6H0KJlYZ3YxcUAZQLUYZsqqTY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ANJDUbSax3qv1tg6wVJgWi8LmJ+MjmFj/MwyRcfma176GQpQl4XLvipzkA7ZrVTys
         g4f2FMTwS4qluN0YN43MWHd6iGatNxsaN882m6pYO8TWhpDi6JCyPN769Oit1Ul+6Y
         ukYw4e2sLgbKry/o5YYNmnAbdSAPCt74oazeYfuo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200807094351.1046-1-geert+renesas@glider.be>
References: <20200807094351.1046-1-geert+renesas@glider.be>
Subject: Re: [PATCH] clk: Restrict CLK_HSDK to ARC_SOC_HSDK
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 14 Oct 2020 10:17:07 -0700
Message-ID: <160269582783.884498.12840721581540843817@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Geert Uytterhoeven (2020-08-07 02:43:51)
> The HSDK PLL driver is only useful when building for an ARC HSDK
> platform.
> As ARC selects OF, the dependency on OF can just be replaced by a
> dependency on ARC_SOC_HSDK.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied to clk-next
