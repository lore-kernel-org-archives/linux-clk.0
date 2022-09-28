Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82FC0C6FA82
	for <linux-clk@archiver.kernel.org>; Wed, 28 Sep 2022 23:07:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233492AbiI1XHi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 19:07:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231782AbiI1XHh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 19:07:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7F13754A0;
        Wed, 28 Sep 2022 16:07:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6D84B60C61;
        Wed, 28 Sep 2022 23:07:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C057CC433C1;
        Wed, 28 Sep 2022 23:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664406455;
        bh=EcGFsT4UFB2sWM+bfgnEvl+RUw14xzpgADolDn2tos8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=CBGODeis3FSd2o+Q+nU3GxiDdASVWGsr8t7fZ9/0ABNxgxg6QX0/IaQQJcY0ba7w0
         U6dMLpco/SwTYiV9Iy3pOF2nnpvU+z3BBElgtGqrhk6KJDj3E8SiVOPYkT6R6pc2EK
         tdDhP/GneRTlJM3XD/WxwOe7aYs+L8XMBeGWXTMYraWz/zSdtiIN95XIyO+TCD3aDn
         yIRXX26e9TF8jzGEytrRbSdiqXDnLmEQLOqivWWdbNDyAZIBNW2U9wtOW1zEVxJkDr
         a5ttkqCuO9kcvvmd0NYj2oU1tj3Oak38CcYAuSZayb0+2o/jQG+s23P2EmIKLXHbxi
         JAc8UDIaIJ64g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1663589800.git.geert+renesas@glider.be>
References: <cover.1663589800.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.1 (take two)
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 28 Sep 2022 16:07:34 -0700
User-Agent: alot/0.10
Message-Id: <20220928230735.C057CC433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Geert Uytterhoeven (2022-09-19 05:18:30)
>         Hi Mike, Stephen,
>=20
> The following changes since commit e312ae92077f90d6ccdca05fb6d640bd9624c3=
7c:
>=20
>   dt-bindings: clock: renesas,rzg2l: Document RZ/Five SoC (2022-09-02 10:=
47:30 +0200)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.1-tag2
>=20
> for you to fetch changes up to e46a1a9943c0e84f439b971d6ce03f87e3d67441:
>=20
>   clk: renesas: r8a779g0: Add EtherAVB clocks (2022-09-18 14:43:51 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
