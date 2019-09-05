Return-Path: <SRS0=zpb1=XA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB7EFC43331
	for <linux-clk@archiver.kernel.org>; Thu,  5 Sep 2019 18:48:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ADFB620828
	for <linux-clk@archiver.kernel.org>; Thu,  5 Sep 2019 18:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567709327;
	bh=w50tD+33F5R8dc2fXJEl8SIoqEQOVGYCi7R9J3SrOV8=;
	h=In-Reply-To:References:Cc:Subject:To:From:Date:List-ID:From;
	b=sikPpHliCw8PO/c9BDgsl3qzAjywYUbUvH+YxW6qM4OQT/miK6FVSuYCIYaqGFh4I
	 ihKa9Ay1yn+VFhAVytJskTRstRp5nnF702A9DoxxAkuL2GxLyp6iOqIx4JQnziU4yq
	 xP7rn6HfynAGKMLtPVvTHzg+udOvqsrQP8LYUWiI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391351AbfIESsq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Sep 2019 14:48:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:52276 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388142AbfIESsq (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 5 Sep 2019 14:48:46 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C015520825;
        Thu,  5 Sep 2019 18:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567709326;
        bh=w50tD+33F5R8dc2fXJEl8SIoqEQOVGYCi7R9J3SrOV8=;
        h=In-Reply-To:References:Cc:Subject:To:From:Date:From;
        b=VIMSHFkGskoaCxhINBinMken3pf2l4A0IuhKPUF4mfZOBRhqcF7b0aF1PD94/mrwm
         rtXpBvt2jZgnEkBPLs92JcDYq+8ot6ai7g6YVCHIx+5LCOQ/Uz6+D8S/84de+0k79C
         zLknPoufl0L7JxAyxHxIZOo/Bb+EKRpe9048KHb4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1787421.rStINWtZbh@phil>
References: <1787421.rStINWtZbh@phil>
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip clock updates for 5.4
To:     Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Thu, 05 Sep 2019 11:48:44 -0700
Message-Id: <20190905184846.C015520825@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Heiko Stuebner (2019-09-05 05:25:14)
> Hi Mike, Stephen,
>=20
> please find below rockchip clock changes for 5.4
>=20
> Please pull
>=20
> Thanks
> Heiko
>=20
>=20
> The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca=
4b:
>=20
>   Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v5.4-rockchip-clk1
>=20
> for you to fetch changes up to ac68dfd3c4836bb2636fd37f3e075ed218afdb2b:
>=20
>   clk: rockchip: Add clock controller for the rk3308 (2019-09-05 12:43:39=
 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

