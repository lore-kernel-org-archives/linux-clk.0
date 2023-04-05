Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5BFDC7619A
	for <linux-clk@archiver.kernel.org>; Wed,  5 Apr 2023 18:56:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbjDES41 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 5 Apr 2023 14:56:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230465AbjDES40 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Apr 2023 14:56:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B57073A9D
        for <linux-clk@vger.kernel.org>; Wed,  5 Apr 2023 11:56:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 50BA762B25
        for <linux-clk@vger.kernel.org>; Wed,  5 Apr 2023 18:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9687DC433EF;
        Wed,  5 Apr 2023 18:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680720984;
        bh=q5qYr0bDTHFNnVhax8wxJFcwYPGay87vGGt/38MrzVM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=glqBOJMr8awz1mYdAzkoze7HARaPDSh33fnCgunQmkPD1kudtRvLMlJWOUK6+5qmk
         e/LhCe6gVRYUNG6k78yW9cdgZmKRURvAoUVC8LUaY0noQHyOn9sLCrSMw9mIcsUK3u
         /h/XTNwc9/KkhV5bPSKtUJsKgZrTuHVMbaTwcNcK+sF7J6b7MD74x3VagG8r4Jc+rr
         TE9Bsew1Dbh0TlCg58VQM6E0Tma3v3hUku5wy5mPoSsBQjeYh58Pk27gwj3IOCGdye
         lFCAYpldQM+wQn3bbHoY77/Mvuq8T7hzyCA7Pa6rmBwQ5MH9iiATTsSV/Rj/Bp6MnS
         /xFM20BGXz1Yw==
Message-ID: <85648045b35c889f61a536cdd568b867.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230405-constant-dreamily-0128e071c665@spud>
References: <20230405-constant-dreamily-0128e071c665@spud>
Subject: Re: [GIT PULL] Initial clk/reset support for JH7110 for v6.4
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
        hal.feng@starfivetech.com, emil.renner.berthing@canonical.com,
        conor@kernel.org, mturquette@baylibre.com
To:     Conor Dooley <conor@kernel.org>, p.zabel@pengutronix.de
Date:   Wed, 05 Apr 2023 11:56:22 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Conor Dooley (2023-04-05 09:05:01)
> Hey Stephen, (and Philipp if you want I guess?),
>=20
> Here's a PR for the StarFive JH7110 clk/reset bits since I'd like to
> take the DT this cycle & depend on the binding headers.
>=20
> I've picked up R-B tags from Emil on all that patches, despite him being
> listed as an author, as things have changed quite a lot since he was
> involved in writing things many months ago.
>=20
> The base here is -rc2 rather than -rc1 as -rc1 has issues booting on
> this platform. Please pull and all that lark..
>=20
> Cheers,
> Conor.
>=20
> The following changes since commit eeac8ede17557680855031c6f305ece2378af3=
26:
>=20
>   Linux 6.3-rc2 (2023-03-12 16:36:44 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/r=
iscv-jh7110-clk-reset-for-6.4
>=20
> for you to fetch changes up to 63a30e1f44d5e3afbb47efe8a15fd86feeb62b4b:
>=20
>   MAINTAINERS: generalise StarFive clk/reset entries (2023-04-05 15:52:25=
 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
