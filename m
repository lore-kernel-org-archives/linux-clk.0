Return-Path: <SRS0=eFQB=QN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A19C169C4
	for <linux-clk@archiver.kernel.org>; Wed,  6 Feb 2019 17:30:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E982D218B0
	for <linux-clk@archiver.kernel.org>; Wed,  6 Feb 2019 17:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1549474222;
	bh=J6TvIDHKHiGONHklHeUKYdjl4aG1RkLk9WSFNN4J33Y=;
	h=Cc:Subject:In-Reply-To:From:To:References:Date:List-ID:From;
	b=0SGUK/Osp2cgo2hnr/wdd6Tv001vbNLxLCy+4FtNh4gq6kl3hl0+1bAlW4gc+vb3f
	 Ig6Bq63TEohEImiCxEZjPNK2W6Rc7Zqz4KmFWCXQ+jA9yitLnoYFc+w2JCCIkCHVNB
	 /Tju9rONRw6JZGd6TPGVWWM2Wr+0vR5RapwaNR+A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728984AbfBFRaV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Feb 2019 12:30:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:49244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728982AbfBFRaV (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 6 Feb 2019 12:30:21 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AF14D2186A;
        Wed,  6 Feb 2019 17:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1549474220;
        bh=J6TvIDHKHiGONHklHeUKYdjl4aG1RkLk9WSFNN4J33Y=;
        h=Cc:Subject:In-Reply-To:From:To:References:Date:From;
        b=Kf38ndFXwnvin+1FL2g162dqS9vpT4h2n5jY0srNq8zDFrTFPppfgZP8jOFnj3ruu
         AsoH7GE+CyuV407FuXIVkBkr79Sbne2Wtp/hCDHTVLxIowZGjQYMBD/kmD4T8R7duY
         4K1i0evQTncDSgdCkSE7CN4wxmZBKeoTnwKMXwpw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
User-Agent: alot/0.8
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Rogerio Pimentel <rogerio.silva@nxp.com>
Subject: Re: [PATCH] clk: imx8mq: Fix the CLKO2 source select list
In-Reply-To: <CAOMZO5BYr_JXZ-ibb5JBvVtF0=Y-cz+qNsPHd0i-kkrC9Ok4ag@mail.gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
Message-ID: <154947421987.74891.17150055410578722741@swboyd.mtv.corp.google.com>
To:     Fabio Estevam <festevam@gmail.com>
References: <20190130192102.7065-1-festevam@gmail.com> <154940574088.169292.15304825462770873584@swboyd.mtv.corp.google.com> <CAOMZO5BYr_JXZ-ibb5JBvVtF0=Y-cz+qNsPHd0i-kkrC9Ok4ag@mail.gmail.com>
Date:   Wed, 06 Feb 2019 09:30:19 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Fabio Estevam (2019-02-05 14:35:49)
> Hi Stephen,
>=20
> On Tue, Feb 5, 2019 at 8:29 PM Stephen Boyd <sboyd@kernel.org> wrote:
>=20
> > Do I need to fast track this into v5.0 final? Or this is a non-critical
> > fix for something that isn't used right now?
>=20
> This is a non-critical fix and it can wait until v5.1.
>=20

Alright, thanks!

