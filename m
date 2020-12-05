Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF196C433FE
	for <linux-clk@archiver.kernel.org>; Sat,  5 Dec 2020 06:25:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88CB222D07
	for <linux-clk@archiver.kernel.org>; Sat,  5 Dec 2020 06:25:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727233AbgLEGYs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 5 Dec 2020 01:24:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:35532 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726999AbgLEGYs (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 5 Dec 2020 01:24:48 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607149448;
        bh=r8vnqMmsHnbgwMXfSQZu84loY6DvrmHia8Sx1hc/RJQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=T4bFniftvCd2jeC6yESokQyOHoTMxC9vK6miqN2mi2XZsBNpieVpWrZWJ4/ROoVau
         zIweZB3ouv+2OYfFYhW50zG34k1z/GoAAlXVdYhFfPpHAER9uNSy+ACWR4QnDhGuRN
         uF3ewwCPsC0jNHoOsylZXbRo6pbi2K8WY92Dbcw+L49AQqk8J0jnR3fXB3D8pc9QKD
         HkId29E+OBrSUtnds5+Pr4+rygtaP4uF6TpHP1UUg/g/s/MIu62pjr25Y6h887D3mo
         0ABFaab5sm2/qsL/H6aOQgE5NCXBPsqOngGLlOeALbEVA6UTuZ/AUtHNc8K05eNVem
         BV/WPUFP1yU7w==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201130085743.1656317-1-geert+renesas@glider.be>
References: <20201130085743.1656317-1-geert+renesas@glider.be>
Subject: Re: [PATCH v2] clk: renesas: r9a06g032: Drop __packed for portability
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Gareth Williams <gareth.williams.jx@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michael Turquette <mturquette@baylibre.com>,
        Paul Mackerras <paulus@samba.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Date:   Fri, 04 Dec 2020 22:24:06 -0800
Message-ID: <160714944657.1580929.4595234852977229885@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Geert Uytterhoeven (2020-11-30 00:57:43)
> The R9A06G032 clock driver uses an array of packed structures to reduce
> kernel size.  However, this array contains pointers, which are no longer
> aligned naturally, and cannot be relocated on PPC64.  Hence when
> compile-testing this driver on PPC64 with CONFIG_RELOCATABLE=3Dy (e.g.
> PowerPC allyesconfig), the following warnings are produced:
>=20
>     WARNING: 136 bad relocations
>     c000000000616be3 R_PPC64_UADDR64   .rodata+0x00000000000cf338
>     c000000000616bfe R_PPC64_UADDR64   .rodata+0x00000000000cf370
>     ...
>=20
> Fix this by dropping the __packed attribute from the r9a06g032_clkdesc
> definition, trading a small size increase for portability.
>=20
> This increases the 156-entry clock table by 1 byte per entry, but due to
> the compiler generating more efficient code for unpacked accesses, the
> net size increase is only 76 bytes (gcc 9.3.0 on arm32).
>=20
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Fixes: 4c3d88526eba2143 ("clk: renesas: Renesas R9A06G032 clock driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

Unless you want me to pick this up for clk-fixes?
