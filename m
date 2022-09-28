Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FAEAC32771
	for <linux-clk@archiver.kernel.org>; Wed, 28 Sep 2022 23:21:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232666AbiI1XVu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 19:21:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230431AbiI1XVt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 19:21:49 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD1D22AC5E
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 16:21:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6F1B4B820F5
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 23:21:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B2CC433D7;
        Wed, 28 Sep 2022 23:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664407306;
        bh=Wju8vNTjiTNwQ87StIzFJEpsx4u6F5+fKymrF8oDKSA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=EWn/Az/XfXzKZvfLlnennqt8YREmylrTRY5UuYn+9M/mbyFDeSwKCpJYMjR8ykYSi
         3nIrIqw7Ewc+e/nc1DGTMby3gOqGjGVO+ioj3eBFDQ54rOF1p4YTZ9HSOyHjsGC6t+
         2GThVEH4gaA//a2UioqsbyRehqHqyzmwglSjviZYLU5XCo4+kNbHcT9zJGW/lbWGLz
         9nPr6d/gy39F7+YIAHusjHzFHria/UVWNk5JazP7vECHv3NMDq3whcMmS8ehfz5o5E
         8KzXGpobdkLslR9nG00iBKg4QtgIupmp4Hyb45s3C174dxMh6PJ6ApWyXwTrHLrGFa
         h+52YvZoxLY/g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YyePpKhg42LfjGQn@kista.localdomain>
References: <YyePpKhg42LfjGQn@kista.localdomain>
Subject: Re: [GIT PULL] Allwinner clock changes for 6.1
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org,
        linux-sunxi@lists.linux.dev
To:     Jernej Skrabec <jernej@kernel.org>, mturquette@baylibre.com
Date:   Wed, 28 Sep 2022 16:21:44 -0700
User-Agent: alot/0.10
Message-Id: <20220928232146.28B2CC433D7@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jernej Skrabec (2022-09-18 14:37:40)
> Hi!
>=20
> Please pull following clock changes for 6.1.
>=20
> Best regards,
> Jernej
>=20
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b8=
68:
>=20
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/su=
nxi-clk-for-6.1-1
>=20
> for you to fetch changes up to 6a6434482fc6184e8fc73092aea755253205ec5b:
>=20
>   clk: sunxi-ng: ccu-sun9i-a80-usb: Use dev_err_probe() helper (2022-09-0=
8 21:59:01 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
