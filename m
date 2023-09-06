Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 598E7EE14C3
	for <linux-clk@archiver.kernel.org>; Wed,  6 Sep 2023 21:37:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244803AbjIFVhX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Sep 2023 17:37:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244804AbjIFVhW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Sep 2023 17:37:22 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EB1F19AF;
        Wed,  6 Sep 2023 14:37:14 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B589C433C8;
        Wed,  6 Sep 2023 21:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694036234;
        bh=VWz69qCidAW4eY587FfNE7Ut5ePeITucYZqjg8X5KWg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=DwSburqj7K+fZcs9m+n7jzwCZD00+YF3Qzk2m/c37Jll7xhaw/KJlbzQFvdL2WExn
         fiucGEr3tentBGGXVk6Rkgc91eOqPmXgthCZRIXdOALEngWiSE4HQ31Ja/TQy6GYHt
         LWz9ln7In/vpUYVMdGI+1IVP4NLdTc/cNa+HFIsb/96rF7JQNRBg+58c95HPXmfiZ3
         FjfdIv2/2ljgGZfclVPemXM6RQQtbmehFWQ0wC4iwG8RIL7fKDbesyKS7dolrva4yx
         5ZGcd0TW5a4XF1V8Qff7jipAJowBFCIzJcx0PdlU9F7a6s4AhQI24z3MmJBMoFjqog
         LwaVlqegQ4wXg==
Message-ID: <1301b37b3aa489f8025d68ccbb42a72b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230826112524.4134627-1-bigunclemax@gmail.com>
References: <1669569799-8526-1-git-send-email-badolevishal1116@gmail.com> <20230826112524.4134627-1-bigunclemax@gmail.com>
Subject: Re: [PATCH v5] Common clock: To list active consumers of clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     badolevishal1116@gmail.com, chinmoyghosh2001@gmail.com,
        linux-kernel@vger.kernel.org, mintupatel89@gmail.com,
        mturquette@baylibre.com, vimal.kumar32@gmail.com
To:     Maksim Kiselev <bigunclemax@gmail.com>, linux-clk@vger.kernel.org
Date:   Wed, 06 Sep 2023 14:37:11 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maksim Kiselev (2023-08-26 04:25:24)
> Sorry for disturbing. Just a gentle ping :)=20
> This patch looks abandoned.
> Is there any chance that it will be reviewed?
>=20

You could review it. Or resend it.
