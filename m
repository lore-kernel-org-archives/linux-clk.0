Return-Path: <SRS0=Q/QO=DB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7C4AC4346E
	for <linux-clk@archiver.kernel.org>; Thu, 24 Sep 2020 06:18:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 838D423741
	for <linux-clk@archiver.kernel.org>; Thu, 24 Sep 2020 06:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600928290;
	bh=zV0zcBuOmJZQZOUiyJKCQ6sMzk4PN9wLqIZyao9boNg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=JnyMYxOiN9C8rNAdnPbghkSpDxgn9guwxKNdETxT+3xPitLaTA08O6MBSQ0YD338y
	 WlwUqRMvGNWkpBVoZYR6asSYZfRN3lkD4jUF1a9Nhl9kDA7xJnVGqHFp0R5Gpxhxg+
	 EPSBYtGn04v3jOBy+xUYhmVrE8FRnK2+fNOeM6tk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726950AbgIXGSK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Sep 2020 02:18:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:41208 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726919AbgIXGSK (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 24 Sep 2020 02:18:10 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9679E208E4;
        Thu, 24 Sep 2020 06:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600928289;
        bh=zV0zcBuOmJZQZOUiyJKCQ6sMzk4PN9wLqIZyao9boNg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hpwdy7vIDJ62cT0vCYyimu8hrxG73bgcQmz7IeH8InLUFirRembi0vkXaKmtZ2Vvo
         5VU0l9/WsceFsTam6pPxpaHC+3p/T/G/7G36LEzLC9+4dlOEqfO/921jdsGRVg1264
         ZvoPSq9dcBlCpq/cufbQ66qxUmt1QZRbFCU/TWmM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2431097.4Q4uIW3KjO@diego>
References: <2431097.4Q4uIW3KjO@diego>
Subject: Re: [GIT PULL] Rockchip clock changes for 5.10
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
To:     Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
Date:   Wed, 23 Sep 2020 23:18:08 -0700
Message-ID: <160092828844.310579.8167865385489225339@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Heiko Stuebner (2020-09-23 15:20:38)
> Hi Mike, Stephen,
>=20
> please find below Rockchip clock changes for 5.10
> I gave the module rework a spin in a number of different Rockchip socs
> and all were happy so far.
>=20
>=20
> Please pull, thanks
> Heiko
>=20
>=20
> The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bb=
f5:
>=20
>   Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v5.10-rockchip-clk1
>=20
> for you to fetch changes up to 70d839e2761d22eba6facdb3b65faea4d57f355d:
>=20
>   clk: rockchip: rk3399: Support module build (2020-09-22 15:16:54 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
