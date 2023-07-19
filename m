Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D55AC001B0
	for <linux-clk@archiver.kernel.org>; Wed, 19 Jul 2023 19:38:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbjGSTiw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Jul 2023 15:38:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbjGSTiv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Jul 2023 15:38:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C59982100
        for <linux-clk@vger.kernel.org>; Wed, 19 Jul 2023 12:38:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6EF78617F4
        for <linux-clk@vger.kernel.org>; Wed, 19 Jul 2023 19:37:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF362C433C7;
        Wed, 19 Jul 2023 19:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689795478;
        bh=RoApuEBZHp8i1pghl2j5zeKB/PC8LoNvYwsxZUUhu+w=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=sScyy0ELuGvtqYrV+O9/LFoCKVPRZtcLiMgOe3CodM81MSZsxikyT7L7RZNj664b8
         Tiju3xlAucu2poBrWiWtZndeCtI9V17NMyIGPw/D6XCuIoWyo8RSVoB+k9JhSRDaHT
         6kOnku2OPg+3ff7yue7SfH3cMnO7wDqe4KzwafZjWwPH9Nz5vWh2VjfrWIYCH/uT3H
         6k92HkfR1kSawoxbi7xlT+iF3svX0OQouuZmwOPyLM3iX2uJ/kvRUZVcA/BVs71hjT
         /tfTzG/TsP55Dapp9xluZVs7JJkx5qQub4MdZzKs6ELEDqr6c+C2kVPj8xF3mWGLfl
         KETPSG8iveSMg==
Message-ID: <7d208aae212aa2101e8a9ca998a6a355.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230719-trough-frisk-40b92acb485a@spud>
References: <20230719-trough-frisk-40b92acb485a@spud>
Subject: Re: [GIT PULL] StarFive clock driver additions for v6.6
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     conor@kernel.org, linux-riscv@lists.infradead.org,
        linux-clk@vger.kernel.org, emil.renner.berthing@canonical.com,
        xingyu.wu@starfivetech.com, walker.chen@starfivetech.com,
        hal.feng@starfivetech.com
To:     Conor Dooley <conor@kernel.org>
Date:   Wed, 19 Jul 2023 12:37:56 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Conor Dooley (2023-07-19 10:37:55)
> Hey Stephen,
>=20
> Please pull some clock driver additions for StarFive. I've had these
> commits, other than a rebase to pick up R-b tags from Emil, out for LKP
> to have a look at for a few days and they've gotten a clean bill of
> health. Some of the dt-binding stuff "only" has a review from me, but
> since I am a dt-binding maintainer that's fine, although maybe not
> common knowledge yet.
>=20
> I've also gone and re-arranged the patches in this PR relative to their
> mailing list postings, so that the dt-binding patches can be used as a
> base for adding the clock controller nodes & dependant peripherals to
> the jh7110's dts.
>=20
> I'm hoping that next time around, someone from StarFive can send you the
> PR, maybe Walker, Hal or Xingyu are interested in that.
>=20
> Thanks,
> Conor.
>=20
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaa=
a5:
>=20
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/c=
lk-starfive-for-6.6
>=20
> for you to fetch changes up to dae5448a327edef952faaf31bb3aedb0597ba62a:
>=20
>   clk: starfive: Add StarFive JH7110 Video-Output clock driver (2023-07-1=
9 18:08:05 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
