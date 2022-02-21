Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93493C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 21 Feb 2022 10:35:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355104AbiBUKgU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Feb 2022 05:36:20 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355144AbiBUKfb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Feb 2022 05:35:31 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8098417041
        for <linux-clk@vger.kernel.org>; Mon, 21 Feb 2022 01:56:57 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E31B4482;
        Mon, 21 Feb 2022 10:56:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645437416;
        bh=9ol1LLJ0MK3halGFf3UsVhNTQFeGLZcCdCTR4+oJaRE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p6d8bpTdVXU0fnX6/vuLI/9SX75NiehSbTTC2X/rBtPaxBvfKQLDGbhV3Qlgvs5qB
         mRo58D87bPnKCyFE0JoED6qE3JSHbHRNQsA0jcHu3YqQNeSNLy//eMMho71mutpqQz
         igIe0ofqXZwKOLRUNIi2mQOKaD0bkcqS3usye8j4=
Date:   Mon, 21 Feb 2022 11:56:47 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Subject: Re: [PATCH v4 0/10] clk: Improve clock range handling
Message-ID: <YhNh36zJVRXuiEwd@pendragon.ideasonboard.com>
References: <20220125141549.747889-1-maxime@cerno.tech>
 <Ygok1IPElQ8Zn4Ii@pendragon.ideasonboard.com>
 <20220219022410.6557FC340E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220219022410.6557FC340E9@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

(CC'ing Jean-Michel)

On Fri, Feb 18, 2022 at 06:24:08PM -0800, Stephen Boyd wrote:
> Quoting Laurent Pinchart (2022-02-14 01:45:56)
> > Hi Maxime and Stephen,
> > 
> > We have recently posted a driver for the BCM2711 Unicam CSI-2 receiver
> > (see [1]) which is a perfect candidate for this API, as it needs a
> > minimum rate for the VPU clock. Any chance we can get this series merged
> > ? :-)
> 
> The rate range API already exists, but it's busted. I can see you like
> the patch series, can you provide any Reviewed-by or Tested-by tags?

Jean-Michel, as you're working on upstreaming the RPi Unicam driver
which is our use case for this API, could you test this patch series ?

-- 
Regards,

Laurent Pinchart
