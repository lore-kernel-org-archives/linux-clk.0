Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32FB4C48BC2
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 03:02:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 172CB61C31
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 03:02:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232024AbhF1DFE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Jun 2021 23:05:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:60502 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231972AbhF1DFE (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 27 Jun 2021 23:05:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F98561C2A;
        Mon, 28 Jun 2021 03:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624849359;
        bh=TwH2p0JJuZq+ovoLX4iUznJ1xOZmyZTfXxbAbf+IZC0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=iOxAvr2vpaFoYhN7bIaDe/gK+DML7KcC5g1gdXe2gjiR+So7nmFNGwWFbxJkbrYyI
         Z6sZkbNFFwHQSDQB7y7TvdOnioSmS38LTdFCrCn8MAwV1JqppvJC0u1AI6O3joMnZp
         zbzVzeFMlxx5ewl15AubxchgeScckP78kny32DhLbEa3NrTmq1Z3K29jiyAoim2CHu
         eZir/ghC851nYZ/WwtCOqzL05dEDodI+72/Se93hmIbiP0loOdpq7HaOGuevpVax74
         BrKgpGOJan+Vzz1Vj7VL1nCYarzHALN25iM7VRie2auNo1wn0IJc7Z/aBSei9wF2ck
         6ztFwZmoMW/Tg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210325192643.2190069-5-robert.hancock@calian.com>
References: <20210325192643.2190069-1-robert.hancock@calian.com> <20210325192643.2190069-5-robert.hancock@calian.com>
Subject: Re: [PATCH v3 4/9] clk: si5341: Check for input clock presence and PLL lock on startup
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mike.looijmans@topic.nl, robh+dt@kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
To:     Robert Hancock <robert.hancock@calian.com>, mturquette@baylibre.com
Date:   Sun, 27 Jun 2021 20:02:38 -0700
Message-ID: <162484935816.2516444.1945395132822245990@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Robert Hancock (2021-03-25 12:26:38)
> After initializing the device, wait for it to report that the input
> clock is present and the PLL has locked before declaring success.
>=20
> Fixes: 3044a860fd ("clk: Add Si5341/Si5340 driver")
> Signed-off-by: Robert Hancock <robert.hancock@calian.com>
> ---

Applied to clk-next
