Return-Path: <SRS0=m775=ND=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83CD1C46475
	for <linux-clk@archiver.kernel.org>; Tue, 23 Oct 2018 18:31:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4CB5820813
	for <linux-clk@archiver.kernel.org>; Tue, 23 Oct 2018 18:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CB5820813
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=anholt.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728099AbeJXC41 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Oct 2018 22:56:27 -0400
Received: from anholt.net ([50.246.234.109]:43944 "EHLO anholt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728052AbeJXC41 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 23 Oct 2018 22:56:27 -0400
Received: from localhost (localhost [127.0.0.1])
        by anholt.net (Postfix) with ESMTP id BA47110A12D8;
        Tue, 23 Oct 2018 11:31:54 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at anholt.net
Received: from anholt.net ([127.0.0.1])
        by localhost (kingsolver.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id YjJoJH7aXMPV; Tue, 23 Oct 2018 11:31:53 -0700 (PDT)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
        by anholt.net (Postfix) with ESMTP id 95F4A10A0414;
        Tue, 23 Oct 2018 11:31:53 -0700 (PDT)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
        id CA78A2FE1BEE; Tue, 23 Oct 2018 11:31:52 -0700 (PDT)
From:   Eric Anholt <eric@anholt.net>
To:     Stefan Wahren <stefan.wahren@i2se.com>,
        Florian Meier <florian.meier@koalo.de>,
        Chris Boot <bootc@bootc.net>,
        Martin Sperl <kernel@martin.sperl.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-clk@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH 1/3] clk: bcm2835: make license text and module license match
In-Reply-To: <1540292769-5905-2-git-send-email-stefan.wahren@i2se.com>
References: <1540292769-5905-1-git-send-email-stefan.wahren@i2se.com> <1540292769-5905-2-git-send-email-stefan.wahren@i2se.com>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/25.2.2 (x86_64-pc-linux-gnu)
Date:   Tue, 23 Oct 2018 11:31:50 -0700
Message-ID: <877ei81pm1.fsf@anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

--=-=-=
Content-Type: text/plain

Stefan Wahren <stefan.wahren@i2se.com> writes:

> The license text is specifying GPL v2 or later but the MODULE_LICENSE
> is set to GPL v2 which means GNU Public License v2 only. So choose the
> license text as the correct one.
>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

For the series:

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlvPaRcACgkQtdYpNtH8
nuhl0g//QCNHTslEb1sIYbZw+iQFG4Qi0n2TjzPw+JVxnNFYAuU9sBM/roll1IsD
dmykkOeeTtH4+SEYC1H1SuuaTaTqXO/AF+0JP7TGlN9DmZootrWXENIAbABZjfQp
lyLmyGUlI8MYmRQzgQ+YN4p0dQ/9yNfVOspX06akGYT3OYEMmEEGJ6ADyc8I63Ae
HxM6zl374y2BMp3vQx7F30l11uq8bk+boQ8DiPsty4kRx9fxVGml2Eo+k8mSjCTl
ItnvlsY3IbHeAS/zyvqm0CicbgTMiwy/1jwDGImmLTEKcrcf/uyGOAHe6whTZctn
q8bclvbIsyXYswDNkSKorQUGjWINQ7s/8H3ywRE4SIRxLGUXzqs9Y2xss+WTsImP
POIo0VTJWH+gkQX55qGfiJ3yWX+r3eRGqKzxRAQMdhWIbz1dlKFda2r4XNeWdTgA
7zN27MpzpRux8a8kpjDwoMmsuLAGiCxtjFRtlGODCmpRY0v4Mk0Q567ubUe4byYa
f+nh9diHbj1YIZD0kIcTeFImPgJYYtUvQuwV8/FELS2PIjBHgzarYd4pz4f7704+
plEXHeNzXQ4b2nzSTg2iK2QwBA+GNjazV9jLg7BDtTaP2RjFEE/fz0C9L+4eMVzj
0GLFavyNTovd9QGGW5m54XmbyOsoJE4ObnIsMSP6qhaLwgmXfnU=
=HIXV
-----END PGP SIGNATURE-----
--=-=-=--
