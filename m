Return-Path: <SRS0=Ck/k=OT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99270C04EB8
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 19:19:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 46B132084C
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 19:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544469560;
	bh=4ecJ/i7HVkw5s0k8wEzqX7Re90Ca4MBsN2sD28Fh5Ts=;
	h=In-Reply-To:To:Subject:From:References:Cc:Date:List-ID:From;
	b=sJsZRwG4ixjSwaa1uKai1tTRM/sGpc94TSBZk8TCokwHmlQLf/8N4RC0TOcmmT9t4
	 JuhtGBU8/kGPsegxCGi3w7fWovsGJftv7fjJ5UjZnqQRn9jzpvxkbNfxJDQLCRtbIp
	 TsHxCLfzHMr1DNUx6HzualmyX31No/yoQSaP4Su8=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46B132084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727276AbeLJTTT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Dec 2018 14:19:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:41672 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726209AbeLJTTT (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 10 Dec 2018 14:19:19 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0AFBD2082F;
        Mon, 10 Dec 2018 19:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544469559;
        bh=4ecJ/i7HVkw5s0k8wEzqX7Re90Ca4MBsN2sD28Fh5Ts=;
        h=In-Reply-To:To:Subject:From:References:Cc:Date:From;
        b=FyZploLtz2q7EQ6Uq9rsmC8tsks3j0dKPvDlA9BBcJpAxYOsOcS7tr6htpRZkJlDG
         Q0xeXD59b3+oh2ZzD+8q2+LD+Lyqw9lzFQPTkr94/6VIXgQokiRhzIRStPm+wbEmaS
         ZDitKAsVk5JP4Nhuurpu7duTNlRiwExU/vM4gtWs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20181210124049.py2auqlgd37rbwfo@flea>
Message-ID: <154446955814.17204.14056899093661973978@swboyd.mtv.corp.google.com>
To:     Jernej Skrabec <jernej.skrabec@siol.net>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] clk: sunxi-ng: a64: Allow parent change for VE clock
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.7
References: <20181208180222.12608-1-jernej.skrabec@siol.net> <20181210124049.py2auqlgd37rbwfo@flea>
Cc:     wens@csie.org, mturquette@baylibre.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Date:   Mon, 10 Dec 2018 11:19:18 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2018-12-10 04:40:49)
> On Sat, Dec 08, 2018 at 07:02:22PM +0100, Jernej Skrabec wrote:
> > Cedrus driver wants to set VE clock higher than it's possible without
> > changing parent rate.
> >=20
> > Allow changing parent rate for VE clock, so clock rate can be set
> > freely.
> >=20
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
>=20
> Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>
>=20
> Stephen, Mike, could you apply that patch directly?
>=20

Sure. Applied to clk-allwinner and merged up.

