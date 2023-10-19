Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD34FCDB47E
	for <linux-clk@archiver.kernel.org>; Thu, 19 Oct 2023 00:53:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231470AbjJSAxO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Oct 2023 20:53:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbjJSAxO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Oct 2023 20:53:14 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F02F113;
        Wed, 18 Oct 2023 17:53:13 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64889C433C7;
        Thu, 19 Oct 2023 00:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697676792;
        bh=CEQdIpYGiXQ1Tk7MRzCm63RnC1FrMtAZVv/NGqOXQo8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=gULiuu8YLZe0MpC175uhkmbaVC1wD27JwZpDeaJcpCo/fkwThsCHTxqjngljeCq+d
         EeL9LOe9z/asi2QvcgORfUvTGMDiUZFKeSAUt3vhVppIGe7uBmFbFy90FXMLYYesWn
         dqjQTjN5ieeSQx3s9Q+WfO1FBL/fEc33dJgjv4KTej7EtLIKDWT4srLX8xAgQG12eW
         z9p3TKWJ3tktcqP1xq0qrG+bicLQtYGAR1m9MxXwbVx8lp9NGa3gl/N8L24CYd3I1S
         6umkzHoXVrO0Sytmzyg/8q/Upfun/oxOvPseIcoWRc1Gpj7RoIDrHxDYs1/ez+cI4s
         LiFlPU3yVE4Gg==
Message-ID: <ccb799ac301df6b59fc64bb4df49a761.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d9da4c97-0da9-499f-9a21-1f8e3f148dc1@moroto.mountain>
References: <d9da4c97-0da9-499f-9a21-1f8e3f148dc1@moroto.mountain>
Subject: Re: [PATCH] clk: keystone: pll: fix a couple NULL vs IS_ERR() checks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Santosh Shilimkar <ssantosh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Mike Turquette <mturquette@linaro.org>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Santosh Shilimkar <santosh.shilimkar@ti.com>
Date:   Wed, 18 Oct 2023 17:53:08 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dan Carpenter (2023-10-05 07:01:57)
> The clk_register_divider() and clk_register_mux() functions returns
> error pointers on error but this code checks for NULL.  Fix that.
>=20
> Fixes: b9e0d40c0d83 ("clk: keystone: add Keystone PLL clock driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Applied to clk-next
