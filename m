Return-Path: <SRS0=Um2U=74=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 661A0C433E0
	for <linux-clk@archiver.kernel.org>; Mon, 15 Jun 2020 14:02:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 398E5206D7
	for <linux-clk@archiver.kernel.org>; Mon, 15 Jun 2020 14:02:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pY/CM9zo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729666AbgFOOCh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Jun 2020 10:02:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728510AbgFOOCh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Jun 2020 10:02:37 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31825C061A0E;
        Mon, 15 Jun 2020 07:02:37 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id s28so9516899edw.11;
        Mon, 15 Jun 2020 07:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=H/I16QzIcgZuuNr7TvHVEb2ZvJ/su1VA0igQPyblFHY=;
        b=pY/CM9zoLr5+Qvi1sPZYDPwjv4WFKkthBSJykclV776GXcBClitnueD+8Tb9otC69Z
         zUeDIWN4pvMShWfGU+SbmtjLSc9VliomZBQc0QwwUuBdzwT0T4Af0rp1UqEUXrk9mI9X
         2qDX/XowIPk7WKrVLQ+AnOsRi9BQW6SgWRibU7hrkvPhFsJE4ceMj0jMXvN3H3C3RtwY
         OhQwYsrllVlNg3rKB/xBNtqDeXRDaZqMjkuTasat0I4oT0t8c+UCdPyoF/UULXSCWfWD
         YKT8HUmK5F78tGqXIz7L1c3hYtuYhDG2uevuQws2xAMd+qCcFwIXl65/XlvexZgJY/Hm
         Ytsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=H/I16QzIcgZuuNr7TvHVEb2ZvJ/su1VA0igQPyblFHY=;
        b=LYJFPcI2oAc2DtUKMNilEIT7H1jSlMG//Sc8kwcG3AQg0KExqWVGc+33SnUzusZbaK
         sModgGwGHh1Gov9EudiB0ntc5ci5LHn7ySqGG7V/eN05whUwbUcuCxxrbAifXz86Q2Rs
         dhr90rWXa9hOrAdMTHCUsj7OGyceVBmHDokPl2KdH/NT6hPYAknXfncofD9qQQPAiVCH
         q8Djs+/qYpmeyfv6FngWMBL5luNVhQEt56FtWws9Q2TaUVnZ5+eDVEk+30CF5lTNbfeg
         mS+5fBL79qd5iPmV84W0SksCJ7sKVia2VOB70yY5A7e1a7KQqh0egR5QFnVIzbaSCHVx
         FVGw==
X-Gm-Message-State: AOAM533AzIXVxgc7YjKe98fuRwV6pNBP8LAuEdIurX9q0GZv+WefwEW8
        cX9xu/7sTm7OShu3GmFgdbU=
X-Google-Smtp-Source: ABdhPJwFy5wyb6mOMFbSozmcKmPQ95hcvYCNNyE1BdDoJwex/WBTFLKDkBSu6K0j7gz9aD9KEWWiGg==
X-Received: by 2002:aa7:c15a:: with SMTP id r26mr23019460edp.21.1592229755767;
        Mon, 15 Jun 2020 07:02:35 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id p13sm8489879edx.69.2020.06.15.07.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 07:02:33 -0700 (PDT)
Date:   Mon, 15 Jun 2020 16:02:32 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, arm@kernel.org, soc@kernel.org,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: [GIT PULL 07/11] memory: tegra: Changes for v5.8-rc1
Message-ID: <20200615140232.GA2812318@ulmo>
References: <20200515145311.1580134-1-thierry.reding@gmail.com>
 <20200515145311.1580134-8-thierry.reding@gmail.com>
 <CAK8P3a0kqjt8UNxe2ruRDOJNedOcqWxP-i5y2uW6YsaMNJgejg@mail.gmail.com>
 <20200526114054.GA2935745@ulmo>
 <159053113019.88029.6264653349405850933@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline
In-Reply-To: <159053113019.88029.6264653349405850933@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2020 at 03:12:10PM -0700, Stephen Boyd wrote:
> Quoting Thierry Reding (2020-05-26 04:40:54)
> > On Mon, May 25, 2020 at 11:52:30PM +0200, Arnd Bergmann wrote:
> >=20
> > > Waiting for clarification before I can pull this.
> >=20
> > Given the above, might be best to hold off on this for a bit until the
> > clock branch was pulled by Mike or Stephen.
> >=20
>=20
> I pulled the clk branch into clk-next now.

Hi Arnd,

looks like this pull request didn't make it into v5.8-rc1. Was there
anything left here that you're waiting for me to address?

Thierry

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7nf3YACgkQ3SOs138+
s6FTUBAAuSroJTRcRlre6LWMudEbVF+IX0fsiiFUYRwa9bnlDm6U9pKP9bR7pi9Y
00g6DRvMP6w6P6h2tEg0PqZun3DYAE0rVWZIwr70QbeJmA6BDf85pKNNXmJD/TeB
9Y/EOivRxznw/NP7PSuWfmIWAX/5YWsX7l6PS3iMkf0xNIzJDS5XxWRJUA5sx5Sv
kUiXbgdKrZJTu3JvGDT+3l0HVbZR4wLglBKt7cMJIZGwPaVz28lTiw1PtZzgziVJ
Y9es9piW8fRiAi9MGDNXKcRtfRIYsfdZA98dHeEljcJBloBlhxpCAbqXEEt8OnHc
plRWkPBo3g9QAhhPU2NZoIYdKprbf38bfmXq7zDfrNZdutZ0+gC7cNNe0toloyYR
S/1fEk3Fy+fuIVgiONaRT7HSui9XxDLfMug6NBpOBiJCtv12tU6ODJhoYtCKhIXK
3gfN9sxxQODCvFDHzjiBc9kfVBkfRrhhM+sLlEksjfe3230NBHMvVju2C4t+Avw6
bTqYNCZF7H71IBBDHjVNqFBBKhy36SFxqh+J+8e20rzl5tDiyrM+jlmUNR7s2a/H
9LlB9TA3iQpO0KjnOQeZc11KUmX5di1C+EfIA7unHmB1PhP4HdVBSkRn1Gx4b8JN
sxLFetx7OPh2c573oEb6IlsHdfbL8HS4L+29b6Vvd8Gak0unXXc=
=2YI7
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--
