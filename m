Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED388ECAAD5
	for <linux-clk@archiver.kernel.org>; Mon, 12 Sep 2022 07:11:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbiILHLc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Sep 2022 03:11:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbiILHLb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Sep 2022 03:11:31 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 480B918396
        for <linux-clk@vger.kernel.org>; Mon, 12 Sep 2022 00:11:30 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-127d10b4f19so21020003fac.9
        for <linux-clk@vger.kernel.org>; Mon, 12 Sep 2022 00:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=x/2i1JA/Bt9shuywkidBxVnItTivpDmF/loDg8ttrKk=;
        b=qxey8A46tPDbfscVc4+OTNp2Zo5dgXh2tK0wgb128SGYRigvVjGSuTinWnAfHPOIbQ
         j7hxb4R6jIZfkjKcfoKLHc4JUTGczO4ui+DP3zV86+Y3jqMBP7waeALKTbcm8DN4tQqx
         tEyCkuUQMFZ1nVvOWujmpT17bTqTJ5Y/3t4EGwIrA8VMir95XaAA+kYPEoNuVAgMDnra
         CsupY9/zC3d2KtwqqustjruKvdjyD90Sa+3nn6Y/Em9Tj2p6xuhQ8Cv3uzgSrxmRaHEz
         BB+bYTMfD2dPCBNhEylZOQClOBauHNj8OQgKPtZA+aeWHjA/36iIFEbEAl4n99pDgTW1
         FI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=x/2i1JA/Bt9shuywkidBxVnItTivpDmF/loDg8ttrKk=;
        b=ANXVyDveZRnI8NiaQLteUBoQ/nmEKN+avk5Djnjk0FGzIvQ6MuaDD/iDQ3PKHfJxeC
         HCZiP2xxFow3nxPYfEfjV3tX3A7Wwjp9NXvusykvXqMPUb6EmLDZC/txSaUw1k0nt/9M
         vxHD/3ZtSvimqLk994B/41X4eNk4r4Sihk1Ua9WrH9o3HbUabnwLXFrQYLiC8l7rlqm+
         4PA+hwXTpVKUfsFy8IequlfKWkPXggB4c4DBXnqQ/FW+rPkYhvOgmaUvik3ryE9o3rvF
         P1cBfnnn54M3NJdy7B5hM6V0e01jlk8Oo9QdIJqy3CHSM+PrA2Fk+urAJwX7mCZYsBCB
         +V4g==
X-Gm-Message-State: ACgBeo38mODRfeRvWKROR+drD+xgNYu8Lzxsw9m6WSII8tIs8a+dIUIK
        ckjBiByyigzvfkPTV0KaxkwG5zxcTRm6bPih
X-Google-Smtp-Source: AA6agR4EAu9VU/snDrY1IbWmaYtbSd3Og1GyfYawhujFBkz01GcIxI9T2U9Wz2bDKxO6QU0MjuyH8A==
X-Received: by 2002:a05:6870:c213:b0:127:a748:4aab with SMTP id z19-20020a056870c21300b00127a7484aabmr10564398oae.52.1662966689470;
        Mon, 12 Sep 2022 00:11:29 -0700 (PDT)
Received: from p200300f6ef036f005de6a4d0d791ed01.dip0.t-ipconnect.de (p200300f6ef036f005de6a4d0d791ed01.dip0.t-ipconnect.de. [2003:f6:ef03:6f00:5de6:a4d0:d791:ed01])
        by smtp.gmail.com with ESMTPSA id 59-20020a9d0141000000b0063695ad0cbesm4119715otu.66.2022.09.12.00.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 00:11:28 -0700 (PDT)
Message-ID: <7d5b94e77c38d0c3351812d190790aa3db964afc.camel@gmail.com>
Subject: Re: [RESEND RFC PATCH v2 0/4] Dynamic OF and use after free related
 fixes
From:   Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To:     Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Date:   Mon, 12 Sep 2022 09:12:44 +0200
In-Reply-To: <6c8e89b04e41244c9ce1c0899d35bd6bb9c0555d.camel@gmail.com>
References: <20220623121857.886-1-nuno.sa@analog.com>
         <6c8e89b04e41244c9ce1c0899d35bd6bb9c0555d.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 2022-07-13 at 15:24 +0200, Nuno S=C3=A1 wrote:
> On Thu, 2022-06-23 at 14:18 +0200, Nuno S=C3=A1 wrote:
> > This series is a collection of fixes with things I encountered when
> > handling a system with device tree overlays "fun". This effectively
> > means
> > removing and adding devices which led to me the found issues.
> >=20
> > patch 1 is fairly straight and indeed an issue related with
> > of_nodes
> > not
> > being put.
> >=20
> > For patches 2 and 3, they are only triggered if someone first
> > removes
> > the provider which is a dumb thing to do. However, I guess we
> > should
> > be
> > prepared for that and the framework even has some efforts to deal
> > with
> > these cases (eg: clk_nodrv_ops). That said, patch 2 is more or less
> > straight (even though catching the guilty line wasn't), we add
> > something
> > to a list during resgister, we need to remove it on the unregister
> > path.
> > Patch 3 is a different beast... though I think krefs are the proper
> > solution here, I'm not sure I covered all the corner cases with all
> > the
> > reparenting that might happen (mainly reason why this is RFC).
> > Nullyfing
> > clk_core->parent during unregister might suffice but I'm more in
> > favor
> > of proper refcounting (for now at least). Patch 3 also does not
> > have
> > a
> > fixes tag because I genuily don't know when this became a problem.
> > Maybe
> > right from the beginning?
> >=20
> > Patch 4 is just a minor improvement and not really a fix...
> >=20
> > v2:
> > =C2=A0* add an helper function in '__set_clk_parents()' to set each
> > parent
> > separately;
> > =C2=A0* massaged commit message in patch 2/4
> > ("clk: fix clk not being unlinked from consumers list") as per
> > Stephen
> > feedback.
> >=20
> > Nuno S=C3=A1 (4):
> > =C2=A0 clk: clk-conf: properly release of nodes
> > =C2=A0 clk: fix clk not being unlinked from consumers list
> > =C2=A0 clk: refcount the active parent clk_core
> > =C2=A0 clk: use clk_core_unlink_consumer() helper
> >=20
> > =C2=A0drivers/clk/clk-conf.c | 126 +++++++++++++++++++++++++-----------=
-
> > --
> > --
> > =C2=A0drivers/clk/clk.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 83 ++++++=
+++++++++++----------
> > =C2=A02 files changed, 131 insertions(+), 78 deletions(-)
> >=20
>=20
> Hi Michael and Stephen,
>=20
> Is there anything missing on this one? I understand that maintainers
> are very busy people but this is already a RESEND and I already
> waited
> a fair amount of time before deciding for this mail.
>=20
> Let me know if there's anything for me to do or if the series is just
> something you are not keen to apply (even though I think the series
> makes sense and makes the code more robust).
>=20
> - Nuno S=C3=A1

Pinging this one more time... I'm happy to rebase and resend but it
would be nice to have some feedback. Otherwise I'll just forget about
this which is, honesty, very sad since I did spent some time on it :)
and it is fixing some real bugs (even though in reality are very hard
to trigger).

- Nuno S=C3=A1
