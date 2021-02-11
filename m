Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08FA3C433E0
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 02:28:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C497564EBC
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 02:28:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbhBKC2n (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Feb 2021 21:28:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:52618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229454AbhBKC2n (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 10 Feb 2021 21:28:43 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2916464E30;
        Thu, 11 Feb 2021 02:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613010482;
        bh=cEVcWPt97Wr0bZy0eBDwrn3QC7JXXN8/X6TxRjqIjXI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=dUyAPvKQwvu5ZpSHZQF9oi1vVselOwj8N8gpDkRJH7AmecXuUKgz966VnXazG8j3T
         CLxlRRONFsk3Abx3fHBbnnFatbmZZjlX9xiOLElKy4T0kRFc91vjsS3VjJ5IpkhJV3
         WVazt1eTx7enpR1xyCvSfmziW143xCJRaq2p7vb+EBpwwNiOAVekvIrX4S2sGTDp25
         k0jEqGOlimqaHTG+KwdTHdzWv/UOI7twDrySJTI6E7dJLR9QFgwitVUlfwjcwlmhPW
         ZHH02SPvCWdE4TFLipl9t7PbL2cOlWh+DA5J70pdXyZbjf1l3JuEO4ug67sAK+lD3U
         ulskgMw/tTOnQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210210102904.xyr6bftn4ueuu74z@gilmour>
References: <20210209175900.7092-1-jernej.skrabec@siol.net> <20210209175900.7092-2-jernej.skrabec@siol.net> <20210210102904.xyr6bftn4ueuu74z@gilmour>
Subject: Re: [PATCH v3 1/5] clk: sunxi-ng: mp: fix parent rate change flag check
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     wens@csie.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sunxi@googlegroups.com, Andre Heider <a.heider@gmail.com>
To:     Jernej Skrabec <jernej.skrabec@siol.net>,
        Maxime Ripard <maxime@cerno.tech>, mturquette@baylibre.com
Date:   Wed, 10 Feb 2021 18:28:00 -0800
Message-ID: <161301048085.1254594.6786751472945742937@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2021-02-10 02:29:04)
> Hi Mike, Stephen,
>=20
> On Tue, Feb 09, 2021 at 06:58:56PM +0100, Jernej Skrabec wrote:
> > CLK_SET_RATE_PARENT flag is checked on parent clock instead of current
> > one. Fix that.
> >=20
> > Fixes: 3f790433c3cb ("clk: sunxi-ng: Adjust MP clock parent rate when a=
llowed")
> > Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> > Tested-by: Andre Heider <a.heider@gmail.com>
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
>=20
> This is a last minute fix for us, can you merge it into clk-fixes directl=
y?
>=20
> Acked-by: Maxime Ripard <mripard@kernel.org>
>=20

It's also fixing a problem that's been around since v5.0. Is something
broken that needs fixing this late? The motivation could be added to the
commit text because right now it looks like a typo fix spotted visually.
