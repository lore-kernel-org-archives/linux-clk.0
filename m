Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C1CC433EF
	for <linux-clk@archiver.kernel.org>; Wed, 15 Sep 2021 01:35:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5848261211
	for <linux-clk@archiver.kernel.org>; Wed, 15 Sep 2021 01:35:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230525AbhIOBgU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 21:36:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:34214 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230087AbhIOBgU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Sep 2021 21:36:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 99DC761211;
        Wed, 15 Sep 2021 01:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631669701;
        bh=v78W32mYUHd1ukan1CzYJdfUJipkYSM5016W5PGlIr4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=CGWdZdLNKjKaUsdHF+R3OIXaT/jKBWz5AEsJRW7nZSnv8hnT5n10P4A6US/W0fSpI
         kc9h12iPdLC1OgrGXJIv9AxVAiRW3VB+On3vpT1LyOAQm6+BVjpsPcJSLUbc7B+04j
         VMhf64gifuUgA+97DZwkyYzJ5vxJxN39PKB9RTvhNoNwFpxWSu+bwB3dh9FTUX+he5
         KepS+2I8Yf7fhD5/9KsRUdES4rL8f8Hx3r5oMqJWfKAemoHELeWnyKzjkIfxHXsUxO
         3DDaJozPvI+qMti64QXojmvzwTOKrVBucQ8Q1mX/V4UoObp3edSdnx9Xd+t0UUuxr2
         AP6GyPbsedykw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <163166856812.763609.13128310400246778720@swboyd.mtv.corp.google.com>
References: <20210913132102.883361-1-dinguyen@kernel.org> <163166856812.763609.13128310400246778720@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: socfpga: agilex: fix duplicate s2f_user0_clk
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     dinguyen@kernel.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org, stable@vger.kernel.org
To:     Dinh Nguyen <dinguyen@kernel.org>
Date:   Tue, 14 Sep 2021 18:35:00 -0700
Message-ID: <163166970028.763609.7710436848359965088@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Stephen Boyd (2021-09-14 18:16:08)
> Quoting Dinh Nguyen (2021-09-13 06:21:02)
> > Remove the duplicate s2f_user0_clk.
>=20
> To fix what in particular? The patch is tagged for stable so I can only
> imagine there's some badness that would be good to fix?
>=20

Ah this is the patch that was missing. Please squash the two together
and resend with more info.
