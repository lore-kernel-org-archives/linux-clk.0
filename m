Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C3DC43334
	for <linux-clk@archiver.kernel.org>; Mon, 18 Jul 2022 21:13:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230427AbiGRVNg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 18 Jul 2022 17:13:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229916AbiGRVNf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 18 Jul 2022 17:13:35 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F10B326FD
        for <linux-clk@vger.kernel.org>; Mon, 18 Jul 2022 14:13:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0C825B81616
        for <linux-clk@vger.kernel.org>; Mon, 18 Jul 2022 21:13:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A160CC341C0;
        Mon, 18 Jul 2022 21:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658178811;
        bh=3ZeacVnqNecYCnFgRv8FYWYVoPrKJUcCC4ed0oBS7ak=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=PCdCZCsvn+r9ZtkjQqGHzkdN21cfynSrjXjFyP5miehsHr8iGx7OQIUgfoDo0WlmC
         8ebdtcwMqiR8sU09qrIKvthuJIee6f/4Ia0yvWBWLA2vlH9o44ChYvBsEKrF/chC5d
         h0TR/rm1om9KGJttczLhB2rW9RMoqlGF0/Be4ildZ+71vpksDDSw+h+aHP0IF3vQam
         QSHCyLsmalISHXmlUwEezsZKFumd7o0xfioWG7jB0RKFZVqAfDiwwwbqZGPXJNLl7H
         /TqBsop5kpmd5ABEpqIH+zoUmdgg/q3fwwOZrmotij9cJsZou+yuZO+NrSsxUDqXz7
         bVZEn/DIQLskA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YshcQP6rsWJHgfYO@kista.localdomain>
References: <YshcQP6rsWJHgfYO@kista.localdomain>
Subject: Re: [GIT PULL] Allwinner clock changes for 5.20
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org,
        linux-sunxi@lists.linux.dev
To:     Jernej Skrabec <jernej@kernel.org>, mturquette@baylibre.com
Date:   Mon, 18 Jul 2022 14:13:29 -0700
User-Agent: alot/0.10
Message-Id: <20220718211331.A160CC341C0@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jernej Skrabec (2022-07-08 09:33:04)
> Hi!
>=20
> Please pull following clock changes for 5.20.
>=20
> Best regards,
> Jernej
>=20
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a=
56:
>=20
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/su=
nxi-clk-for-5.20-1
>=20
> for you to fetch changes up to 4167ac8a657e4f0860419adf24d4b91a26580488:
>=20
>   clk: sunxi-ng: sun50i: h6: Modify GPU clock configuration to support DF=
S (2022-07-08 18:13:50 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
