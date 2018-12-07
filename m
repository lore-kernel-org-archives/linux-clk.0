Return-Path: <SRS0=jGkl=OQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 841E5C07E85
	for <linux-clk@archiver.kernel.org>; Fri,  7 Dec 2018 20:41:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 374F520892
	for <linux-clk@archiver.kernel.org>; Fri,  7 Dec 2018 20:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544215273;
	bh=Yc0dRxw0Jepsddn/3hjkpROAC2x54HhwYVQha610dT0=;
	h=References:Subject:Cc:From:To:In-Reply-To:Date:List-ID:From;
	b=Ed2KgE6aHMjmbSloXoPlogJz8KjVH2PXqjnUg84dSjvnhtcgLDqcNdihQ+jQxUa/m
	 4ktjTfn2rxupQY24CiddJQZhPQgkraPyMuzoElfcfh3HJvZRQUjCiFYFj+mL8lQTiw
	 EOa2vn3VvdtrDKSsqpybvqzsHZJZ34AES5fqkxSc=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 374F520892
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726070AbeLGUlM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Dec 2018 15:41:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:54302 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726041AbeLGUlM (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 7 Dec 2018 15:41:12 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2A05520868;
        Fri,  7 Dec 2018 20:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544215272;
        bh=Yc0dRxw0Jepsddn/3hjkpROAC2x54HhwYVQha610dT0=;
        h=References:Subject:Cc:From:To:In-Reply-To:Date:From;
        b=ORdJPgScik6OlUe2RjwMPun0kdqwkmjjnbNl2VAU8YKMyZGq6JbhZstk/vJNcL6YM
         hcNPBU5Rb5Zpo+5qhv/T5Yrl5Vc9U1d0sok+lP1puuv1AIn0pKddl3efKNgfIJeP1M
         bT7biifaF35k0YQp5c0u/0ISg92mINttzZ2bKENc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20181207150158.vvfpjcxjikjjyj5m@flea>
Subject: Re: [GIT PULL] Allwinner clock changes for 4.21
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.7
To:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Message-ID: <154421527147.168715.17089570196269110319@swboyd.mtv.corp.google.com>
In-Reply-To: <20181207150158.vvfpjcxjikjjyj5m@flea>
Date:   Fri, 07 Dec 2018 12:41:11 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2018-12-07 07:01:58)
> Hi Mike, Stephen,
>=20
> Please pull our usual changes for the next merge window.
>=20
> Thanks!
> Maxime
>=20
> The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d=
2a:
>=20
>   Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/su=
nxi-clk-for-4.21
>=20
> for you to fetch changes up to 6e6da2039c82271dd873b9ad2b902a692a7dd554:
>=20
>   clk: sunxi-ng: a33: Set CLK_SET_RATE_PARENT for all audio module clocks=
 (2018-12-05 12:08:20 +0100)
>=20

Thanks. Pulled into clk-next.

