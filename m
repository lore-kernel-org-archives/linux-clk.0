Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67BE4C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 13 Jul 2022 13:23:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235487AbiGMNXG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Jul 2022 09:23:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236105AbiGMNXF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Jul 2022 09:23:05 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AA9A1580A
        for <linux-clk@vger.kernel.org>; Wed, 13 Jul 2022 06:23:03 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id r10so9339491wrv.4
        for <linux-clk@vger.kernel.org>; Wed, 13 Jul 2022 06:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=9jwqqBJfdxKjWccC9szHdC/zvGaFkSuVkkwLLOb/9Bg=;
        b=dJCL1ec0GnPx7C3/9gqFjc7opWfaRcsUaFTL+86buE5YkO4s4/ACjLAES0TEXJP6kb
         RaPZoHeqgu7R2L3RPt99JEGEbFmsonPdhd4IechqQf8rGXtktHaBArDZcVO0YWZguwxR
         yl5ZIFWNRyUjltaqmyipvtAnGt1Qk0dcMFZYZX15GJjW+VbRSfKfpvSapM5aO7xOXIja
         VLUrq7W3D1zj4ZvT+qL3YRVBMXG5Gl1e2l4hlcaXg3TLhr7ZhveE1qbeIYSVPe2PA3gK
         jsOsq6k/Ketb/jF7nyZZrNpHaHd5YponLeXOQH3322egDqMyCCd4w13ZKknt7SeqZvOf
         wRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=9jwqqBJfdxKjWccC9szHdC/zvGaFkSuVkkwLLOb/9Bg=;
        b=t1CqBJG3W/gBBl3QGBNZjafXvfA3UOX8mAttghCuNLpeeT5+TICR+hHShtfJ/mPsDB
         251aizBT72d47fbLzQqXk4luSfzmXrqRMFgGSbJbnzy5Y3gTKNFdnFcQ2Av2WFE3MPYi
         Qre51X7K52JcGLHZzytBw2y0Nq0fepxkwsxN9ScDPcsb6vNJBL01+SiBYSPgkEHQ5RUC
         d243oKFI2VfoECBGUeSsHQEVdlUbY5V2UQePGmCyAFz/cE4ESqXCa720JBBs3wbO27Qr
         fXCM9og6iinVAjxOMfCy2M/aMvuCBRZeSKq3i3iZXFQlEzNHoKc5rQh1QO2wz3MOweZj
         jizw==
X-Gm-Message-State: AJIora+EClwylwz0HcqirAzN+MgtgBnfOaIz+ROIF7Amz89L5zcl9wxO
        1i8/z887ECvvaOrmwYznaTQ=
X-Google-Smtp-Source: AGRyM1tcf5OpL0RXUYhTLXvC8JnsrSkMRBnW/fEcXgcBKK9xu47fHKuZsjbmumAuT1CTX11B+txYWg==
X-Received: by 2002:adf:fbc6:0:b0:21d:3fc3:99e with SMTP id d6-20020adffbc6000000b0021d3fc3099emr3285996wrs.550.1657718581494;
        Wed, 13 Jul 2022 06:23:01 -0700 (PDT)
Received: from p200300f6ef036f005de6a4d0d791ed01.dip0.t-ipconnect.de (p200300f6ef036f005de6a4d0d791ed01.dip0.t-ipconnect.de. [2003:f6:ef03:6f00:5de6:a4d0:d791:ed01])
        by smtp.gmail.com with ESMTPSA id n18-20020a05600c4f9200b003a2ec73887fsm5598849wmq.1.2022.07.13.06.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 06:23:01 -0700 (PDT)
Message-ID: <6c8e89b04e41244c9ce1c0899d35bd6bb9c0555d.camel@gmail.com>
Subject: Re: [RESEND RFC PATCH v2 0/4] Dynamic OF and use after free related
 fixes
From:   Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To:     Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Date:   Wed, 13 Jul 2022 15:24:04 +0200
In-Reply-To: <20220623121857.886-1-nuno.sa@analog.com>
References: <20220623121857.886-1-nuno.sa@analog.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 2022-06-23 at 14:18 +0200, Nuno S=C3=A1 wrote:
> This series is a collection of fixes with things I encountered when
> handling a system with device tree overlays "fun". This effectively
> means
> removing and adding devices which led to me the found issues.
>=20
> patch 1 is fairly straight and indeed an issue related with of_nodes
> not
> being put.
>=20
> For patches 2 and 3, they are only triggered if someone first removes
> the provider which is a dumb thing to do. However, I guess we should
> be
> prepared for that and the framework even has some efforts to deal
> with
> these cases (eg: clk_nodrv_ops). That said, patch 2 is more or less
> straight (even though catching the guilty line wasn't), we add
> something
> to a list during resgister, we need to remove it on the unregister
> path.
> Patch 3 is a different beast... though I think krefs are the proper
> solution here, I'm not sure I covered all the corner cases with all
> the
> reparenting that might happen (mainly reason why this is RFC).
> Nullyfing
> clk_core->parent during unregister might suffice but I'm more in
> favor
> of proper refcounting (for now at least). Patch 3 also does not have
> a
> fixes tag because I genuily don't know when this became a problem.
> Maybe
> right from the beginning?
>=20
> Patch 4 is just a minor improvement and not really a fix...
>=20
> v2:
> =C2=A0* add an helper function in '__set_clk_parents()' to set each paren=
t
> separately;
> =C2=A0* massaged commit message in patch 2/4
> ("clk: fix clk not being unlinked from consumers list") as per
> Stephen
> feedback.
>=20
> Nuno S=C3=A1 (4):
> =C2=A0 clk: clk-conf: properly release of nodes
> =C2=A0 clk: fix clk not being unlinked from consumers list
> =C2=A0 clk: refcount the active parent clk_core
> =C2=A0 clk: use clk_core_unlink_consumer() helper
>=20
> =C2=A0drivers/clk/clk-conf.c | 126 +++++++++++++++++++++++++-------------=
-
> --
> =C2=A0drivers/clk/clk.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 83 ++++++++=
+++++++++----------
> =C2=A02 files changed, 131 insertions(+), 78 deletions(-)
>=20

Hi Michael and Stephen,

Is there anything missing on this one? I understand that maintainers
are very busy people but this is already a RESEND and I already waited
a fair amount of time before deciding for this mail.

Let me know if there's anything for me to do or if the series is just
something you are not keen to apply (even though I think the series
makes sense and makes the code more robust).

- Nuno S=C3=A1
