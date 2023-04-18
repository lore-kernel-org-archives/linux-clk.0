Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB962C77B75
	for <linux-clk@archiver.kernel.org>; Tue, 18 Apr 2023 19:52:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232733AbjDRTwe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Apr 2023 15:52:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231262AbjDRTw1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Apr 2023 15:52:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3224A9776
        for <linux-clk@vger.kernel.org>; Tue, 18 Apr 2023 12:52:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CAE0063890
        for <linux-clk@vger.kernel.org>; Tue, 18 Apr 2023 19:52:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D9F2C433D2;
        Tue, 18 Apr 2023 19:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681847545;
        bh=QasSaerAtohg7ykreL21ffqcC+7SvICpzBMcX8ZdkA0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=XuslHpNzXY2xmqlQ4PlmaTwTOJZwZ9CFEeSfukfQTbI/NxA9GOdxlBSBKAWvi+LDI
         iA7Qy08SpiN2VRnWXBiowzovDpwNslABKmInOPYD+tqPCpUrJ9WL76EL0UyQ18RVyJ
         rU2BzEnjnJrJxicH00JyoOyi/lGJcd/qAJyPwyW4d0LHGo20b9KTfqVqZWCmp617c3
         f1lohOO4H9QsA0Ra0m2hIROf99tet4ZNsuWVpc12rVfY85t7EKpzQ084++lAY5MqQy
         E1B2qDIFQI8dMljLHWzj3JryUcBbQnuPsc+iin23FQDlnKQxu6pIiTpcsIT+RtuSP8
         FfE+eSyR99jbA==
Message-ID: <56408ef68eff1456426ef0e62fdb3b99.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3292931.atdPhlSkOF@phil>
References: <3292931.atdPhlSkOF@phil>
Subject: Re: [GIT PULL] Rockchip clock changes for 6.4 #1
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
To:     Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
Date:   Tue, 18 Apr 2023 12:52:22 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Heiko Stuebner (2023-04-17 16:46:35)
> Hi Mike, Stephen,
>=20
> please find below a pull-request with some small Rockchip stuff.
>=20
> Please pull.
>=20
> Thanks
> Heiko
>=20
>=20
> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4c=
c6:
>=20
>   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v6.4-rockchip-clk1
>=20
> for you to fetch changes up to 64042c28c3bb6729df8e2fda89bc7ebbe3790907:
>=20
>   clk: rockchip: rk3588: make gate linked clocks critical (2023-04-18 00:=
54:04 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
