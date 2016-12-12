Return-Path: <eric@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-rpi-kernel@lists.infradead.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-arm-kernel@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH] clk: bcm: Fix 'maybe-uninitialized' warning in bcm2835_clock_choose_div_and_prate()
In-Reply-To: <1481529653-28133-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1481529653-28133-1-git-send-email-boris.brezillon@free-electrons.com>
Date: Mon, 12 Dec 2016 09:24:36 -0800
Message-ID: <87twa93vsb.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain

Boris Brezillon <boris.brezillon@free-electrons.com> writes:

> best_rate is reported as potentially uninitialized by gcc.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Fixes: 155e8b3b0ee3 ("clk: bcm: Support rate change propagation on bcm2835 clocks")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlhO3VQACgkQtdYpNtH8
nugRtg/9Gf/Ym5wZwK0idkYaYIKs4dCk0l3emNYGThYVyqv+gqVx/xCZ4Crk9/rx
vU4RA2EhoqRWs7iYV7UhTWdIQOjW5JKDl0xHEBCJL6zE1EylDf+ND2oj6hdv40zh
uRtHxCgKvEttCN+C3cgHtCnMZx6KBZ2K2vnvd+fi212mWwA0MQxVYLQgnlqP+zk5
oUawVGTjKrJvCopJ++4g7zS3jbX164DEGN1y75x89JjwBRckygqakKVQxBgyCMfi
CZlPE+tw4HsbYLTsRicCKDBTfdh88z1pFmjpW290IDS/Xhg6Ht25S2UeayBO7fo8
I/t+goNy+3Nf5UDkLW3gnJFnR4mo+ny9wefBhLDIe9lxZPcd1IJaeRIMIvX5mg6W
VX/1RRuahUpiDOKEFyuWlOck8heJnu952TERnYENl8eO5LjuvPhBLZJC9Hdl5Kc+
vTRjWoMoFTj/H5In84aDhO/5MoTpJo1XAr3q+wSUsCXIKwCNZg52KJAHBIY6iJIm
Txk/OHpsT4FLLiTDEgPn51Ngq0f+5g2tNh/sDBF4rmOAlIT65ZbiW5u/mp8sOhgn
YnU99rh382O5yxehUgQ45iYjr5JMUE6HpEp9MmEd6FdU/hMgMULFtxZUL674Sp1J
8oQq15iH1rQILxu5dmhCmuKwvgGFNdd9S7Fct8Ts2FeUtKiA2Tw=
=ozbv
-----END PGP SIGNATURE-----
--=-=-=--
