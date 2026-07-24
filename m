Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACA84908A5;
	Fri, 24 Jul 2026 21:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784929237; cv=pass; b=K66LkqdPDLvuACGw5XiyADS/bsPKz5DevpzYIiRX7srs7uQKWTGf6D3hV4gNbHO3k2elaH4/XoYaws+4b4z3bYZpjmFiVQ7x7vg3AYPYWjWrLeO4QufsYBxVEkP5PxhjKiS3bXf6Mgs0ltCNnLzAIUHGicJhkaheB6XhDTa3s7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784929237; c=relaxed/simple;
	bh=91DX2sM86WzlyJO9j/UUt/xvs9MHmGe7lUv/17WdLfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZZS/oUCtA/yA4SVedwZsNdVq7dh2JUHiRSJr2ljWy7eeVjm3i7vA6EHtV60N0gtTpgrNm5BH69+s59NrSjqxRotkeDo9/DouiI6iCMeM2dLpQqzn6LOFNJz3jHw39ra36a3EQctIQzaqd7JGbqAJWYghuhl0KMui3+Yf3P4hMS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=JLiZ7nh0; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="JLiZ7nh0"
ARC-Seal: i=1; a=rsa-sha256; t=1784929227; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HxjQkKhvn9GcOkII4WBAQxOxk+UC7AF8Fhd2tgQrsHiTEtNN8C01n9q9H1ezFHpyK7zOWG/VRirWT2KOAd6oYjUgeX40A8WeAIS67LtV/sgQ/1r3VYGU/D1JNu8crE9t1djV14x++I7luhEfqwrEPuKkVCmerLfcdASTj6SZIkI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784929227; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=89lrFO7egukwRoRHc8AHa7XRrswN6pKZYUNX141t3X8=; 
	b=WClspMjjeaSBK0Uw6xW6nH3khr7Ro2mv4bfGxBr89/ogur5mn6OiK2e9ND99BKovbfs4gWwiz7Z1Esrwd8nJ+U91lo65EQ++m6K+qLVPP+ekajPCGGvuikPWVoBOtF1nueliNKYoij7dcLmEKdzRDNMxYKZ5I51SapUxQbB19zU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784929226;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=89lrFO7egukwRoRHc8AHa7XRrswN6pKZYUNX141t3X8=;
	b=JLiZ7nh0eX2BqeI+wCxT86V2pS3TPEhCwZj3swH03RAJgIdp4yABs218+dMX3MjL
	72+2LNWEhgVxGxehQqYziPgnWAjuC2dQ9Pukk9pIwor4aPQ/EsIRgqNVrQ7mjVUGEjr
	S1TcDwXntoY0RnCjMLiQjffV4Aok18RI20BXktxk=
Received: by mx.zohomail.com with SMTPS id 1784929224163361.91324829680457;
	Fri, 24 Jul 2026 14:40:24 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 3BCA6181F16; Fri, 24 Jul 2026 23:40:20 +0200 (CEST)
Date: Fri, 24 Jul 2026 23:40:19 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Praveen Talari <praveen.talari@oss.qualcomm.com>, 
	bjorn.andersson@oss.qualcomm.com, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, konrad.dybcio@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chandana.chiluveru@oss.qualcomm.com
Subject: Re: [PATCH] clk: Guard clk_round_rate() against error pointers
Message-ID: <amPY3TNEFwtlpzWw@venus>
References: <20260723-fix_ptr_check_on_clk-v1-1-568a7ed87746@oss.qualcomm.com>
 <amIlYNjWeJQ9tcOB@redhat.com>
 <bbea2bd8-adf9-497d-a159-1871aaa9cce3@oss.qualcomm.com>
 <amOId3MHkryiFwC1@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="44mx4itqm35snd6i"
Content-Disposition: inline
In-Reply-To: <amOId3MHkryiFwC1@redhat.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/284.919.37
X-ZohoMailClient: External


--44mx4itqm35snd6i
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clk: Guard clk_round_rate() against error pointers
MIME-Version: 1.0

Hi,

On Fri, Jul 24, 2026 at 11:44:55AM -0400, Brian Masney wrote:
> Hi Praveen,
>=20
> On Thu, Jul 23, 2026 at 10:10:06PM +0530, Praveen Talari wrote:
> > On 23-07-2026 19:59, Brian Masney wrote:
> > > On Thu, Jul 23, 2026 at 11:40:47AM +0530, Praveen Talari wrote:
> > > > clk_round_rate() only checks for a NULL clk pointer before
> > > > dereferencing it, but callers such as dev_pm_opp_set_rate() can pass
> > > > it an error pointer (e.g. ERR_PTR(-ENOENT) left behind by
> > > > clk_get() when a device has no Linux clock and is instead managed by
> > > > firmware via a genpd/OPP performance domain).
> > > >=20
> > > > Dereferencing that error pointer to read clk->exclusive_count
> > > > crashes with an unhandled kernel NULL pointer dereference, since
> > > > ERR_PTR(-ENOENT) plus the field's offset lands on a small, unmapped
> > > > address:
> > > >=20
> > > >    Unable to handle kernel NULL pointer dereference at virtual
> > > >    address 000000000000002e
> > > >    ...
> > > >    pc : clk_round_rate+0x3c/0x188
> > > >    ...
> > > >    Call trace:
> > > >     clk_round_rate+0x3c/0x188 (P)
> > > >     dev_pm_opp_set_rate+0x114/0x33c
> > > >=20
> > > > Change the guard from "if (!clk)" to "if (IS_ERR_OR_NULL(clk))",
> > > > matching the pattern already used by other clk consumer API
> > > > functions such as clk_unprepare(), so an error pointer is rejected
> > > > the same way a NULL pointer is.
> > > >=20
> > > > Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> > > > ---
> > > >   drivers/clk/clk.c | 2 +-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > > index 048adfa86a5d..8c1ad3d10284 100644
> > > > --- a/drivers/clk/clk.c
> > > > +++ b/drivers/clk/clk.c
> > > > @@ -1780,7 +1780,7 @@ long clk_round_rate(struct clk *clk, unsigned=
 long rate)
> > > >   	struct clk_rate_request req;
> > > >   	int ret;
> > > > -	if (!clk)
> > > > +	if (IS_ERR_OR_NULL(clk))
> > > Can you provide more details about the clk_get() call point that star=
ts this
> > > error? Specifically which driver this occurs in and the exact scenari=
o that
> > > triggers this.
> >=20
> > On SA8255P platform there is no Linux
> > clock for the SE, and the perf domain device's OPPs are populated entir=
ely
> > from firmware via devm_pm_opp_of_add_table() (through
> > of_genpd_add_provider_simple()/onecell()), so the perf domain's OPP tab=
le
> > has entries even though no clk_get() ever succeeds for it.
> >=20
> > The clk_get(-ENOENT) case comes from _update_opp_table_clk() in
> > drivers/opp/core.c:
> >=20
> > =A0 =A0 opp_table->clk =3D clk_get(dev, NULL);
> > =A0 =A0 ret =3D PTR_ERR_OR_ZERO(opp_table->clk);
> > =A0 =A0 ...
> > =A0 =A0 if (ret =3D=3D -ENOENT) {
> > =A0 =A0 =A0 =A0 /* ... no clk provided ... */
> > =A0 =A0 =A0 =A0 opp_table->clk_count =3D 1;
> > =A0 =A0 =A0 =A0 return opp_table;=A0 =A0/* opp_table->clk left as ERR_P=
TR(-ENOENT) */
> > =A0 =A0 }
> >=20
> > Because the perf domain device has no "clocks" property (its OPPs are
> > supplied purely as performance states by firmware/genpd), clk_get()
> > returns -ENOENT, and opp_table->clk is left holding that error pointer
> > rather than being reset to NULL.
>=20
> This looks to be a reasonable change. Thanks.
>=20
> Reviewed-by: Brian Masney <bmasney@redhat.com>

I suggest to instead change the OPP code, so that it calls
clk_get_optional() instead of clk_get() and thus properly
"document" that the clock is optional and use the NULL dummy
clock (it's also shorter):

/*
 * There are few platforms which don't want the OPP core to
 * manage device's clock settings. In such cases neither the
 * platform provides the clks explicitly to us, nor the DT
 * contains a valid clk entry. The OPP nodes in DT may still
 * contain "opp-hz" property though, which we need to parse and
 * allow the platform to find an OPP based on freq later on.
 *
 * This is a simple solution to take care of such corner cases,
 * i.e. make the clk_count 1, which lets us allocate space for
 * frequency in opp->rates and also parse the entries in DT.
 */
opp_table->clk =3D clk_get_optional(dev, NULL);

ret =3D PTR_ERR_OR_ZERO(opp_table->clk);
if (ret) {
    dev_pm_opp_put_opp_table(opp_table);
    dev_err_probe(dev, ret, "Couldn't find clock\n");
    return ERR_PTR(ret);
}

if (opp_table->clk)
    opp_table->config_clks =3D _opp_config_clk_single;
opp_table->clk_count =3D 1;
return opp_table;

Greetings,

-- Sebastian

--44mx4itqm35snd6i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmpj28AACgkQ2O7X88g7
+poXQQ/9E/jt+NjIg/F0BXn1UzKT4NopZKMPKnxz7jPwRwYGntQTmEN6IQ7PFVkv
4NNb0cXCUXrKQpKs3CLCaeDHTDIgPTuLlCS42Q1ZVYZlCo692yRDcUlxtPho2ADG
DIxEbfgYhcLOALX6Sw7z56U5hQdwcGEO+8usB3OBlL5pn28tIdJRyaP7D1lidsmJ
bLtd3rXPWS0qef6Z5Qvbsxe6NzobFOGygB6QA0mVm7y7h3TvhfYMXtu06YBCKjx0
KYZTK6JkZ3c8FnLseEoulzRrW1Z1iXlJ9rgkE+2J8U4TexgYqyWhduj/kNZOLbYS
uifvnLRYlRjyFhvdD1VOJe+yk0pMLa6YrX2M1o9PcHi4y2T0xjyyyOgSzQnWLQOG
KcqFS+qDaL2H5OOzz25XXzPVaLraOryTt5UeLrYcLsYzkg3rbQBRDtbx8Z2GzJ7F
cz4DWhU2C6Ku/Bka5JFIMw5MxBQefLA4LsVGDHALdMd3KtFIYOl5gJ0iV/PoiyAD
qkpzpY/Wp8mZMt0CtvtadQ7H0QoEno/Eg93S5quFkg/of/aq2zTjuLJX8OBAvRol
tGggJp7qfa0Mz2LiCMan6W0/xkUEMg9CAXByskq8TwzSns+89ShZThhdmKIhOl4G
dhGnYN7gm571YY+fCyihV5vTCcRlbaERpio9ugR5SrKdAn/dOWc=
=Hp5T
-----END PGP SIGNATURE-----

--44mx4itqm35snd6i--
