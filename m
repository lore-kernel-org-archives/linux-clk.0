Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E60C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 15 Sep 2021 01:16:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B283C60F23
	for <linux-clk@archiver.kernel.org>; Wed, 15 Sep 2021 01:16:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232597AbhIOBR3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 21:17:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:54986 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230016AbhIOBR1 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Sep 2021 21:17:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7165C61164;
        Wed, 15 Sep 2021 01:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631668569;
        bh=EPMjzT9CmpmeSBZZ/dKY05KEdumngv3Jpbvv3OS5YNg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=t/BgS3HC/Vj61/gJPJCKRJnD4liPd50iyniKRoYucCxpgAAgGNneANdg9HYIMVQxQ
         6n1XfRq+6+XZCyS07HfuaFftTnamNnQRDnd5iyCfr1Pj2kmZAaZCcVOWZ5fnn7OXTf
         C558nTmSV3NCowkzLKpwSZctS4360OHww5an6dB5IK9naeS4nW5JBx9EP5CYs4ZHWs
         ME2eiIaygmnRsdwjSv56bTu9UMVHReVW2bT6QfiZsNvDLlTnNQBugEgvJrLU2lZxqw
         V/81HOuWBBxdRDeHcCOnwasXL4furhVtImpB/N0OUtIZGJ4wsZw7xUNebCSTjOj3H6
         BUGz7i6tkkHyA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210913132102.883361-1-dinguyen@kernel.org>
References: <20210913132102.883361-1-dinguyen@kernel.org>
Subject: Re: [PATCH] clk: socfpga: agilex: fix duplicate s2f_user0_clk
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     dinguyen@kernel.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org, stable@vger.kernel.org
To:     Dinh Nguyen <dinguyen@kernel.org>
Date:   Tue, 14 Sep 2021 18:16:08 -0700
Message-ID: <163166856812.763609.13128310400246778720@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dinh Nguyen (2021-09-13 06:21:02)
> Remove the duplicate s2f_user0_clk.

To fix what in particular? The patch is tagged for stable so I can only
imagine there's some badness that would be good to fix?

>=20
> Fixes: f817c132db67 ("clk: socfpga: agilex: fix up s2f_user0_clk
> representation")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
