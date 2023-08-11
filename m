Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2FAFC0015E
	for <linux-clk@archiver.kernel.org>; Fri, 11 Aug 2023 06:44:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbjHKGoY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 11 Aug 2023 02:44:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232351AbjHKGoY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 11 Aug 2023 02:44:24 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D95722D44;
        Thu, 10 Aug 2023 23:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1691736265; x=1723272265;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=62aZCWkl304Ybn00jUKrwjIQ+57E/+NemMNU6pZ9RYQ=;
  b=qZTvf0M4nvTaGF01EK3cu3sa0ytndsPE8Bz9NJa0Ar56h3qPgDSws8qC
   FDcbbQKh7hjeH+4RhG0DJ5Zyv/Eb57QCYYBvY6tN/Eukv5JJUwyIq/zXF
   JWFl6cuipwnNxIwgyyyyroov3Pn8UvLfnYoPGjwiwzsk4LOgoyCLn0Y1F
   X4yh4EVaHwgRS4+cQU0m9bUgheQK2/mlljAjMkU65yVsaXEdwbk94t4q/
   T/97Ow5sKJ2zLG0H4JCirfewMjJhXQS8jyA02P5K9lxdCWXQMHDdOQjVT
   ooBZ/ojDv/SZGF7m1M/5Idtqloj5ufwGIVOySmzMi5lZBzDoquVYzHE8s
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="asc'?scan'208";a="229269131"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Aug 2023 23:44:24 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 10 Aug 2023 23:44:22 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 10 Aug 2023 23:44:21 -0700
Date:   Fri, 11 Aug 2023 07:43:43 +0100
From:   Conor Dooley <conor.dooley@microchip.com>
To:     Xingyu Wu <xingyu.wu@starfivetech.com>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        Conor Dooley <conor@kernel.org>,
        Hal Feng <hal.feng@starfivetech.com>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v1] clk: starfive: jh7110-sys: Set PLL0 rate to 1.5GHz
Message-ID: <20230811-jiffy-nebula-a8ea5ef15eee@wendy>
References: <20230811033631.160912-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hZwpuXrQpI5n8goB"
Content-Disposition: inline
In-Reply-To: <20230811033631.160912-1-xingyu.wu@starfivetech.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

--hZwpuXrQpI5n8goB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 11, 2023 at 11:36:31AM +0800, Xingyu Wu wrote:
> Set PLL0 rate to 1.5GHz.

Why are you doing that though?


> Change the parent of cpu_root clock
> and the divider of cpu_core before setting.
>=20
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>=20
> Hi Stephen and Emil,
>=20
> This patch sets PLL0 rate to 1.5GHz. In order not to affect the cpu=20
> operation, the cpu_root's parent clock should be changed first.
> And the divider of the cpu_core clock should be set to 2 so they
> won't crash when setting 1.5GHz without voltage regulation.
>=20
> This patch is based on linux-next which has merge PLL driver on
> StarFive JH7110 SoC.
>=20
> Thanks,
> Xingyu Wu

--hZwpuXrQpI5n8goB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNXYnwAKCRB4tDGHoIJi
0uWJAP9mVNiZnBYeDdnT4omRhp6951eRqXNkvFzp2LLd6LmcSQEAxpUscGjdQm5E
5D/O5d3cn4SpHxtz/HRSOeD/OopQFwo=
=t6g3
-----END PGP SIGNATURE-----

--hZwpuXrQpI5n8goB--
