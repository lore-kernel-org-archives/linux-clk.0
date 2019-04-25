Return-Path: <SRS0=pf3n=S3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E4AAC43218
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 17:39:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BA68420878
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 17:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556213955;
	bh=RGZVoIkWoyiIjnhRavvqGcCbfMKb8iFu9mmjyyXkcLY=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=0wfQy9LFZAGJkVaTwrdgsyWUNYWf5k900SnB+SXKpkynj9a2j+TWluglac3f5C87Y
	 bvtdETSP16SZ9hi7URqqz4MOBI57/63/d3A6yNLNJiFdSJQO9haYnakYpx7fb+2wVh
	 4c3dZHIw+xvOEc7crmOpO3kX4wu9TPqrC8U77TnM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727414AbfDYRjO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Apr 2019 13:39:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:51970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726916AbfDYRjO (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 25 Apr 2019 13:39:14 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A82EE2084F;
        Thu, 25 Apr 2019 17:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556213954;
        bh=RGZVoIkWoyiIjnhRavvqGcCbfMKb8iFu9mmjyyXkcLY=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=WIXRjX5DYlpHrMOzrIZ00esyy+5oKkeQSbVt/ying9yMr+AwWN6rTXLmW5JZpsWeL
         3aq8SbYEEJxZB5gV2ZkjDW+dckHVxAq8nWeVH1ECl39U+GkSkZuA8adoutTpHV6SEg
         Gbyop/B60fsrR+2R3ZrHZ4T2PAIwImKfFzUf7LiA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2075886.jWuYUtlPVG@phil>
References: <2075886.jWuYUtlPVG@phil>
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [GIT PULL RESEND] Rockchip clock updates for 5.2
To:     Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
Message-ID: <155621395307.15276.12161393001768759522@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 25 Apr 2019 10:39:13 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Heiko Stuebner (2019-04-24 10:36:37)
> Hi Mike, Stephen,
>=20
> please find below rockchip clock changes for 5.2
> with quite a bit of attention for the rk3288.
>=20
> Please pull
>=20
> Thanks
> Heiko
>=20
> [RESEND because I used a wrong email address for Stephen]

No worries, I still got it.

>=20
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa23=
1b:
>=20
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v5.2-rockchip-clk-1
>=20
> for you to fetch changes up to f4033db5b84ebe4b32c25ba2ed65ab20b628996a:
>=20
>   clk: rockchip: undo several noc and special clocks as critical on rk328=
8 (2019-04-23 12:17:11 +0200)
>=20
> ----------------------------------------------------------------

Pulled into clk-next

