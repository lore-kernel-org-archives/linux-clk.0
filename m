Return-Path: <SRS0=7WK/=44=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1571FC10F27
	for <linux-clk@archiver.kernel.org>; Wed, 11 Mar 2020 10:21:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DE2E521655
	for <linux-clk@archiver.kernel.org>; Wed, 11 Mar 2020 10:21:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="awdq0pSW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726097AbgCKKVU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Mar 2020 06:21:20 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52684 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbgCKKVU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Mar 2020 06:21:20 -0400
Received: by mail-wm1-f65.google.com with SMTP id 11so1429751wmo.2;
        Wed, 11 Mar 2020 03:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vzFH0A9M/DhdMofIuuxsROnNF9huS4k0r4fbAlfX1qs=;
        b=awdq0pSWYZI/uB/hAPVKZUp4GzNf6/BNyiux9cYih71F/j0jroCf7JhFrJc7oeyiEw
         kptrLWnaFa+jCACZb+rknydlpTBbCQFv477iqqMEyltXJOEUsKg+/eezSYmXpBHkxEIJ
         k/T1tX2FL+0QOJWxTf30sN7nGnSfExqjocUXgqyD2+d6XLduz0Wv6sV73LpC2NO219Pt
         C57B68ZKmF6Q4wz2b6LKEzoWCg2rWOMbPgoQSPerwcJzKPD4rEOS8Mz6mbL6Azvoer51
         bT7kwaZ6glqGQ/sdUeG9m7FEOCW0xCwO+RmwfL6BbltRx0EPiXkTgx7bYxM9BZOraMn9
         A/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vzFH0A9M/DhdMofIuuxsROnNF9huS4k0r4fbAlfX1qs=;
        b=ZyJP6KhS+LLUapnhVUP3dbSDboRKMLltcpmaKXW6THclOjcj5EP9PPRcmOU6gwcXz4
         97qT1Ah6jcXyylwjPf9t26eBLAPPx2nwZ2g/myZH7ER5BoYXLu4rGmhBu0ZksRRgW48N
         MbYdIvDFrD9C3ig8xEprnhnsSsuajvm/h1rIR9f+em8GFeQa9y+WICRmrudunB7Zqj84
         /TCyF+lSZsRKnsYIpZ8Wc9PPTsEha9zQey/5dVM58KXMCOb+ojf3/xgX9VTEaf2kVofz
         OjwaEwR74dL19qkoxDnfcfkt0Fte0xSysbhnfji0mjVYbg5/SdIOnP4vNrY9ahquG4hD
         qfgg==
X-Gm-Message-State: ANhLgQ0wzj7bkYq4L8nXxoLL8a1lKu+Lx8slDfqpF3pPtT22gDH7pF0D
        04JocIzfgTQdNbZlzXj/RJk=
X-Google-Smtp-Source: ADFU+vughCnDTiHASFqewN+ZAUAsy3rOOMDWGrylzx7nVdnxoKSlqVnNE3gTYbm6dJoR3iiMk50mVg==
X-Received: by 2002:a1c:1b4c:: with SMTP id b73mr3044761wmb.17.1583922078339;
        Wed, 11 Mar 2020 03:21:18 -0700 (PDT)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
        by smtp.gmail.com with ESMTPSA id q6sm7660722wmj.6.2020.03.11.03.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 03:21:16 -0700 (PDT)
Date:   Wed, 11 Mar 2020 11:21:15 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mikko Perttunen <cyndis@kapsi.fi>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] clk: Do not recalc rate for reparented clocks
Message-ID: <20200311102115.GA494173@ulmo>
References: <20200305175138.92075-1-thierry.reding@gmail.com>
 <158380492739.149997.15800995149056434664@swboyd.mtv.corp.google.com>
 <21f65d74-eb09-6735-4338-8c5e865533ad@kapsi.fi>
 <20200310104227.GB2030107@ulmo>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline
In-Reply-To: <20200310104227.GB2030107@ulmo>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 11:42:27AM +0100, Thierry Reding wrote:
> On Tue, Mar 10, 2020 at 12:25:01PM +0200, Mikko Perttunen wrote:
> > On 3/10/20 3:48 AM, Stephen Boyd wrote:
> > > Quoting Thierry Reding (2020-03-05 09:51:38)
> > > > From: Thierry Reding <treding@nvidia.com>
> > > >=20
> > > > As part of the clock frequency change sequence, a driver may need to
> > > > reparent a clock. In that case, the rate will already have been upd=
ated
> > > > and the cached parent rate will no longer be valid, so just skip the
> > > > recalculation.
> > >=20
> > > Can you describe more about what's going on and why this needs to
> > > change? For example, we have 'set_rate_and_parent' for cases where a
> > > driver reparents a clk during a rate change. Is that not sufficient
> > > here?
> > >=20
> >=20
> > I believe this is related to the memory clock change sequence on Tegra,
> > where the EMC clock may have to be reparented multiple times during the=
 rate
> > change sequence.
> >=20
> > If EMC is running off parent A, and the requested new OPP also uses par=
ent
> > A, we have to temporarily switch to a different OPP with parent B so th=
at
> > the rate change sequence can be executed on parent A without affecting =
the
> > system's memory accesses.
>=20
> It's not only that. The mismatch can happen every time that we change
> the operating point because each such change could cause either the
> parent and/or the parent rate to change. The CCF always caches the
> parent rate from before the rate change, assuming that the parent will
> not change.
>=20
> Perhaps a clearer way of saying this is that the parent change is an
> internal part of the rate change. clk_hw_reparent() already allows us to
> notify the CCF of the hierarchical change in the clock tree. But then we
> need to additionally either override the parent rate in the driver, like
> we currently do on Tegra124, or have the core ignore the cached parent
> rate if the parent is no longer what it expects.
>=20
> I should probably have followed up this patch with a corresponding patch
> to the Tegra124 EMC driver that removes the workaround, like below:
>=20
> --- >8 ---
> diff --git a/drivers/clk/tegra/clk-emc.c b/drivers/clk/tegra/clk-emc.c
> index 745f9faa98d8..f29f0a0e48de 100644
> --- a/drivers/clk/tegra/clk-emc.c
> +++ b/drivers/clk/tegra/clk-emc.c
> @@ -92,12 +92,6 @@ static unsigned long emc_recalc_rate(struct clk_hw *hw,
> =20
>  	tegra =3D container_of(hw, struct tegra_clk_emc, hw);
> =20
> -	/*
> -	 * CCF wrongly assumes that the parent won't change during set_rate,
> -	 * so get the parent rate explicitly.
> -	 */
> -	parent_rate =3D clk_hw_get_rate(clk_hw_get_parent(hw));
> -
>  	val =3D readl(tegra->clk_regs + CLK_SOURCE_EMC);
>  	div =3D val & CLK_SOURCE_EMC_EMC_2X_CLK_DIVISOR_MASK;
> =20
> --- >8 ---
>=20
> But I haven't actually tested that yet because I don't have a Tegra124
> board set up at the moment.

I did test the above change along with the core change on a Jetson TK1
board (which is Tegra124) and unfortunately that doesn't work for all
rate changes. I'll need to dig deeper to see what exactly is going on,
and to see if there's a simple fix for that.

If not it might be better to leave these types of workarounds in the
drivers instead.

Thierry

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5ou5cACgkQ3SOs138+
s6GEdBAAly/uOW3jrEic+SpyKGbWH+MAebwZ1/4RI0SrLBxyN0THQo1+TqhhIZZ9
2+vHUIJ3EiOKIOb/WeciHAupYoSG8XANFpk3nbeGocLedLpNoXDGopyM7t9fS/Lc
7JzDwA8uTjZsZzPTP3kked8m4yBOoMs9zIfOWDQ31giHaovuaae/ZHTfBpD01N5t
+yUHRECkF4t7BXurC6MLgnS1XPhLN04BTPAbqkrXJjZUOV9ZHf6amZHlrWf/LCJA
RVMKaNLpZ8SoUrOKhkM5HweoYk/HThv5q4sJxOU6q9dSSlvh2EkU5xk0lxVmCazW
C7xeLJ4qVFlrmlJ66LP2fA1ek358cfngycn1gOUZzyW8fsF4TzWkqMullu2uJKKo
a0Y0tGeuSmHjZE3TOxAYGqaKXm5MW5mNy1DnDCqT7FU5evxVKAyW7jB4BQDidc2T
pqC2ol4/5sYB4NYK5xtPhlvGdVd04GnwLvxJfWcNxELj43sdJqkWqSjGlnpPBw0w
I439qiASis1RDZ8xA6799sanG/ftLfGO1Kwmeil29586t/hYixktdRqSPDHO6Xj1
55jvC+q6CV/+q5N1R76plm+fRlOFTXcx5+riqwzZDzQnHq43D57GCUlJgFKLS1Yn
z+BErYFuBJDs3wwOy6KGdPDZ8dBYiY1v5JgDqBDmXnMyNLTpzAY=
=gTn5
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--
