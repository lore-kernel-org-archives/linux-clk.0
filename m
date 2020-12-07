Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30394C4361B
	for <linux-clk@archiver.kernel.org>; Mon,  7 Dec 2020 21:29:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D80DD22ADF
	for <linux-clk@archiver.kernel.org>; Mon,  7 Dec 2020 21:29:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbgLGV3k (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 7 Dec 2020 16:29:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:38090 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726003AbgLGV3k (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 7 Dec 2020 16:29:40 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607376539;
        bh=1NyZkq+r9GIAEnDMcrQBgRznt4H6S0WMSlyeNHODLi8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ljnj/MMt+fOyRRqNabC/peq8Ji71Hj4LxbgsZD9iBhHlSzKOLoIUbPgY204SbyFbF
         nGT5nPPnEV1k+Q8Xyb1FSxX/G3RQbUiHAgkSkXKJnGhrH8spInhKF4hRbZnOen3xDR
         bUt5LIClEhBHcUQLSwml9YeCrvMGGFiaUbRtzDN9V55+sE1gqPOG5H82DUVRfkyYHG
         1LKw4IHizUXChoRcis169b6Y5ctnNmFLQ4CoSe8ENrCwnraMT9SxK4mL4B5bAVbgrU
         q4cxqVapZMB0Cfj5XrHmgYhV2UXzkg8lrc+IOoyqV7J4k/gBIbqMpRhmHImzWBf9YV
         Yju6JxBzfoYTw==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5662766.lOV4Wx5bFT@phil>
References: <5662766.lOV4Wx5bFT@phil>
Subject: Re: [GIT PULL] Rockchip clock changes for 5.11
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
To:     Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
Date:   Mon, 07 Dec 2020 13:28:58 -0800
Message-ID: <160737653822.1580929.2930727213908816182@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Heiko Stuebner (2020-12-06 10:27:36)
> Hi Mike, Stephen,
>=20
> please find below Rockchip clock changes for 5.11
>=20
> Please pull, thanks
> Heiko
>=20
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9=
ec:
>=20
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v5.11-rockchip-clk-1
>=20
> for you to fetch changes up to caa2fd752ecb80faf7a2e1cdadc737187934675e:
>=20
>   clk: rockchip: fix i2s gate bits on rk3066 and rk3188 (2020-11-29 20:10=
:45 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
