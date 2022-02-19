Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A8F7C433F5
	for <linux-clk@archiver.kernel.org>; Sat, 19 Feb 2022 02:24:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241095AbiBSCYa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 18 Feb 2022 21:24:30 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240107AbiBSCY3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Feb 2022 21:24:29 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75B4F26BDEE
        for <linux-clk@vger.kernel.org>; Fri, 18 Feb 2022 18:24:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0DFF562024
        for <linux-clk@vger.kernel.org>; Sat, 19 Feb 2022 02:24:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6557FC340E9;
        Sat, 19 Feb 2022 02:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645237450;
        bh=yPRKtgQu4GoU2E3EJ/r7/t6YDtCFdyLtldZqUmtKk1I=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=CHMAQy2Fx1KB3hk0uLcpyvmJmCAeVSZimmmYQzlR2ryLPph3ywj5Duxj9AKHMW6LV
         q1o0i2NM6HdfmcrYuMW+y4J7KkeoFZllzlZo2WB/0zCoaeQ2cGwUAdhoyyAov7/IUg
         cUCHNKVSLJIWt+QbVCgnv2k4CMwu3CuzaN7cNJa8XN+rqmGOZ5RZziPK74KyrQQnlP
         hP7+ETsKvC4ccBmXIr6MEj7aNQQ7v44XvykHzmi3iBLkPqitzqGS0jJCXN0/dKTMX0
         N88QNMR3HCDsGsdAqqy/l22InaL752izL6ro/cJRBnjdh3hhthna6ATgdm3WjQtc4g
         0b6mMWVAhNGyg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Ygok1IPElQ8Zn4Ii@pendragon.ideasonboard.com>
References: <20220125141549.747889-1-maxime@cerno.tech> <Ygok1IPElQ8Zn4Ii@pendragon.ideasonboard.com>
Subject: Re: [PATCH v4 0/10] clk: Improve clock range handling
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 18 Feb 2022 18:24:08 -0800
User-Agent: alot/0.10
Message-Id: <20220219022410.6557FC340E9@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Laurent Pinchart (2022-02-14 01:45:56)
> Hi Maxime and Stephen,
>=20
> We have recently posted a driver for the BCM2711 Unicam CSI-2 receiver
> (see [1]) which is a perfect candidate for this API, as it needs a
> minimum rate for the VPU clock. Any chance we can get this series merged
> ? :-)

The rate range API already exists, but it's busted. I can see you like
the patch series, can you provide any Reviewed-by or Tested-by tags?
