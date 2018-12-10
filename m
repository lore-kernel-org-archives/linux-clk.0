Return-Path: <SRS0=Ck/k=OT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C24DC04EB8
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 11:06:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0C74A2086D
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 11:06:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Av7Rdyrn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C74A2086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727261AbeLJLGA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Dec 2018 06:06:00 -0500
Received: from mail-ed1-f49.google.com ([209.85.208.49]:32951 "EHLO
        mail-ed1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727259AbeLJLGA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Dec 2018 06:06:00 -0500
Received: by mail-ed1-f49.google.com with SMTP id p6so9125162eds.0;
        Mon, 10 Dec 2018 03:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2LoAo0WUj8Un3Q9f981rYvsqu+F2AhGN+7kJadUrfzQ=;
        b=Av7RdyrnEGtyXvSrx1BWSbKjOoRL0x269LIZ3a2DKAg4GaFRfTeQP/+a7fvfpcWl6C
         gV5heYDgmttfuRbkAFBJ7ybySsMXJlgnXeSVoDnszNkPpELIGMA5rk7uaVUp/kCDMmsJ
         HHdq/0bQ0K5uvD4rRWNKtORuOMZtvttbBOZFpgzQlg3I+DoKpoJJEf1cyik8UAO5EG1w
         mVUuqWkDJl+ba2VgbGC5fFkgXw1rxj2S1FKEuN5Pq+m9pQWvs8hGUT43bkFWSh7gep1G
         hXKqW0mE76IVSj2i5nu6ByWellOlenNZmDa6+ONu0uvmBwW6VzJ77KAs6wOVLcxxjSQ0
         +Mjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2LoAo0WUj8Un3Q9f981rYvsqu+F2AhGN+7kJadUrfzQ=;
        b=IWn0Lx5gnLU0vBHvbach5w9oeEg8mlLtIkNOCBfTtAE8SBg3i3LJrab17c0BZXRIZF
         y372ELHFPVoLjlMMnX+v+LcqRjky5z2+SGU3X/CQ8clmavqPGhwGsocdI4FWtFklAgdP
         TaHkQ/Du5lbPuq+2FoSM+HfknTvpnBw+wQiW7bTOdrRTh2KJx8GRnrigpQP6RSV6OOkm
         4kxXxmzlnC8T2YcgqZoUUxnm1fmxfWgFC6XGb/Fr3uUf7h9f8omlIIYhd//1BS2jefUT
         otLm3KDqbml/cQZh9/nZ3JsvoY1heKx8bkgmvMhkyVDP5hS6g7raAMU9uGF8Qk2Hlg/u
         Os9g==
X-Gm-Message-State: AA+aEWa3xA821xuFOJGCoSORfp08YFtE6bQIEHRa9fASUbdxo30zQPnh
        tCWgf9xJO3Egvw7pf7Qez095rLGt
X-Google-Smtp-Source: AFSGD/WrBKLcyLJt4HvNmwxwkMDfJRPHoXbPO8kMKbzQOq6+OecrqvVy85L+r744gDwbe5bwQMIupw==
X-Received: by 2002:a17:906:1e57:: with SMTP id i23-v6mr9669438ejj.146.1544439958271;
        Mon, 10 Dec 2018 03:05:58 -0800 (PST)
Received: from localhost (pD9E51040.dip0.t-ipconnect.de. [217.229.16.64])
        by smtp.gmail.com with ESMTPSA id p22-v6sm1734446ejb.76.2018.12.10.03.05.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Dec 2018 03:05:57 -0800 (PST)
Date:   Mon, 10 Dec 2018 12:05:56 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [GIT PULL] clk: tegra: Changes for v4.21-rc1
Message-ID: <20181210110556.GM15154@ulmo>
References: <20181207142119.9574-1-thierry.reding@gmail.com>
 <154420452153.57851.10805463686191930083@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LJm8egi4vkexsie5"
Content-Disposition: inline
In-Reply-To: <154420452153.57851.10805463686191930083@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--LJm8egi4vkexsie5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 07, 2018 at 09:42:01AM -0800, Stephen Boyd wrote:
> Quoting Thierry Reding (2018-12-07 06:21:19)
> > Hi Michael, Stephen,
> >=20
> > The following changes since commit 651022382c7f8da46cb4872a545ee1da6d09=
7d2a:
> >=20
> >   Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)
> >=20
> > are available in the Git repository at:
> >=20
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/te=
gra-for-4.21-clk
> >=20
> > for you to fetch changes up to d14ce174ca02ee2a9f390b9e279663b3a848a48b:
> >=20
> >   clk: tegra20: Check whether direct PLLM sourcing is turned off for EM=
C (2018-11-08 12:47:18 +0100)
> >=20
> > Turns out that these were not build-time dependencies for the EMC series
> > after all, but since I already have them in a branch, I might as well
> > send them out.
>=20
> Ok. There were other Tegra patches on the list which I guess I can just
> pick up on top of this tag?

Yes, correct. I'm not aware of any conflicts between these two patches
and the others on the list.

Thierry

--LJm8egi4vkexsie5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlwOSJQACgkQ3SOs138+
s6GJ7A//exeAtWoSykjO6gg6krJPa3i3bpdgfyvwubHQ1hg06Gadq2f0pB+15hjV
1zNt34/AYrjniJ9Ry7t/0EUoCWvasuOtD2AT13eAR4krCnhc6E2ihC/y6ssYgDr2
gp91WN+UEvJO9/Qy3fwxbc3sJHdQRcli2H1y9EpOvjltmd2y950ouqfYwkb+xnFy
Q5kzTN5a7bv62jYOHRT7IXL7Xln/Hkvuuzks4oDaqwUaQe2iVN0kREYX5Pst5ovk
ffFT9bj7ZlZado1AvQYKATRkVArZIfXfrqPO7XGBOEUsFBnqguTSnK6F6B3sD3ap
zV/48RNPuwqypojX5hr/0pf89U5jA/7WXp4stymlvA0pl8nvXGMFe9rG9uh/cCfY
NpMkUrqvZwhtHbNYOfznSsRAaT1auudn+amx8XL88V0LoxDtWIcpiGG8FlWHrSbU
DPUoKmRM1YFCIVH+CIbDiY3HAIZumwHbj4Xpk5hNnbyyFsIB4p1uuxCSCOlgBW7Q
aty6Ht8RTyUZcPZ8aK8MCz/aolu8guPE26IQrK+88GQ8IVk7VGVTuAdtE8KbiKHV
2WO+Pmy5/p8dlVq7vpepF9VzkrCsADcKRmrFTTtD6Eb1nCFERLW5jAUE813SqQld
H4+zvJ5KY1pd1isHyQG4gxLZTMopKzPB3i3uwM/Xb0k/Iylv7e8=
=wZr1
-----END PGP SIGNATURE-----

--LJm8egi4vkexsie5--
