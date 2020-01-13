Return-Path: <SRS0=xcQL=3C=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E31BC33CA9
	for <linux-clk@archiver.kernel.org>; Mon, 13 Jan 2020 18:41:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0923E21556
	for <linux-clk@archiver.kernel.org>; Mon, 13 Jan 2020 18:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578940913;
	bh=F76OispsopK3z/Gv8PPYNP4ATSX03q3HUiSpySdRFU4=;
	h=In-Reply-To:References:To:Cc:Subject:From:Date:List-ID:From;
	b=kYgEpmvXmvgLb/nhZ3I9PRsGQ1KDb/yvzOcSopicqDcnASXJJrz/WwewC/QIBz0N/
	 ITUATdKY293WwkhsghzY122/5IurgdxBBPFHCMPvH8XGP/mYwhGZ2igdSD9KeuOQ+0
	 /ginFPBrF0+iabIogw4Krb6AqTyjs3akYnfQDndQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728680AbgAMSlw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Jan 2020 13:41:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:45200 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726878AbgAMSlw (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 13 Jan 2020 13:41:52 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1B4D820CC7;
        Mon, 13 Jan 2020 18:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578940912;
        bh=F76OispsopK3z/Gv8PPYNP4ATSX03q3HUiSpySdRFU4=;
        h=In-Reply-To:References:To:Cc:Subject:From:Date:From;
        b=FPGYD88+UiXQdoa49yzXYM3u6Z9uWA6qjDFsfSLzMkfn4UFX0AE6M2vThFH9rN0OD
         IH/3RG6QVA/mllE8Uk2Ocdv9hXIMaPr1B3WbkBf1+6H5JPE9xMPSLWKNavBqLVZ+Pa
         3pSBROdHDswfW37ORUsyGK6IyoxsGVvxunWC6KyA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <918a4585-19f8-4753-abb1-b71702877ddf.lettre@localhost>
References: <918a4585-19f8-4753-abb1-b71702877ddf.lettre@localhost>
To:     Maxime Ripard <mripard@kernel.org>,
        Mike Turquette <mturquette@baylibre.com>
Cc:     Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>
Subject: Re: [GIT PULL] Allwinner Clock Fixes for 5.5
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Mon, 13 Jan 2020 10:41:51 -0800
Message-Id: <20200113184152.1B4D820CC7@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2020-01-10 09:12:40)
> Hi Mike, Stephen,
>=20
> Happy New Year!
>=20
> Please pull the following changes for the current release.
>=20
> Thanks!
> Maxime
>=20
> The following changes since commit e42617b825f8073569da76dc4510bfa019b1c3=
5a:
>=20
>   Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/ta=
gs/sunxi-clk-fixes-for-5.5
>=20
> for you to fetch changes up to 0c545240aebc2ccb8f661dc54283a14d64659804:
>=20
>   clk: sunxi-ng: h6-r: Fix AR100/R_APB2 parent order (2020-01-02 10:28:47=
 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes

