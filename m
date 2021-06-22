Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27530C2B9F4
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jun 2021 19:59:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07A7A6100B
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jun 2021 19:59:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232565AbhFVUB7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Jun 2021 16:01:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:39348 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232418AbhFVUB7 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 22 Jun 2021 16:01:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D545C611CE;
        Tue, 22 Jun 2021 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624391983;
        bh=iJZU1mLgSvHpTDnNqWBtFOnV6/1UXxJ2KdDlFoEyjHQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=gRY5mODRMM8hC+ju12tpU5/hm55jqVsWj5RGVumOVSln5qXifFn9a2C69k0ZCRVdA
         LZ4JqR18GKvgbb4MoHCWGCVD5WvruVwyRoiSfj6t32VchaL54+C5kfqGUsAcrZZao6
         PDfOKdn8Wm5BCq1EZeIHluZ3sB6guD2TQRIWwrguusLOaA4ofVyDmULXUs4H0+0R8L
         C2Q1aI37arELLYy6kNs3Lxso/W3XPbSSAxZ9KvdTzJw6d31jxl6dLLAR97ZLrafqzn
         CXKoP/E3FOR2Q/Wlum5Vdn0lD9OmC1Uv2kSfIiAN7n3gmgrJJqpQVD0jsgsP0+NKe3
         3KGJ9JRFwfVBQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4340280.LvFx2qVVIh@phil>
References: <4340280.LvFx2qVVIh@phil>
Subject: Re: [GIT PULL] Rockchip clock changes for 5.14
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
To:     Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
Date:   Tue, 22 Jun 2021 12:59:41 -0700
Message-ID: <162439198156.3552334.16445859558117444993@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Heiko Stuebner (2021-06-20 15:31:52)
> Hi Mike, Stephen,
>=20
> please find below Rockchip clock changes for 5.14
>=20
> Please pull, thanks
> Heiko
>=20
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627=
b5:
>=20
>   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v5.14-rockchip-clk1
>=20
> for you to fetch changes up to 2adafc0512625bbd090dc37a353ddda15d525e9d:
>=20
>   clk: rockchip: export ACLK_VCODEC for RK3036 (2021-05-28 17:53:19 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
