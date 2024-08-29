Received: from a7-48.smtp-out.eu-west-1.amazonses.com (a7-48.smtp-out.eu-west-1.amazonses.com [54.240.7.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32285187843;
	Thu, 29 Aug 2024 23:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724975084; cv=none; b=DZD1jpDTk/A7DsrfrLOGu1BFrPIocnH7rdrDk7Zk6cZ4ATiMyWNu9Jg/gagBK7iS5ezNdEOxgs/OZWKKAm39+oVJBWIGJZ5BBa00wFdbNAgS/zoccxiWGhdYWs8rh/gjyTE7ce7i+k2nMI7s+7Hz45T/Ktm0C0v+WEZlZV5nvJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724975084; c=relaxed/simple;
	bh=JNe30hLjclDSWQ+beOj4C/oInzNRg8Au53WBSYUzM3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EY2lgQ5Q4Smjy7ANJGo4eO3sDim22MCZm8S0qVtvU/sbFcAxkt2fJWATwJNtHS+L/FqTw0lcy5H5K2I9JuvCXVpc07rAFjW9wPndQ8nUA3AHkkHZK4SCoyiPLkHDZT0j/TMeiaExzhosLlYBzJYnu8ZvUrakpbix2SG1tWuE/fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PPDx35qr; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=cPcLKFte; arc=none smtp.client-ip=54.240.7.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PPDx35qr";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="cPcLKFte"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1724975080;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
	bh=JNe30hLjclDSWQ+beOj4C/oInzNRg8Au53WBSYUzM3k=;
	b=PPDx35qrqDrnrPh/vnb6b3aJgbJlYlNCTeQeplGa1VG17T0Nj0UMXWx+oKF5Hbw4
	k5iAEYE3qBWATKjz50uJyyCBJtBzarVcxhf0duX5JTrFV7akQm/DWorO30F5dTn4q/y
	Q5MZiMPG0c9O8ZnjeilVgOVfaJfyF/tJ4B4/vsZkJifQDV41Z1vtewKbvKKTzVFZK4m
	VfObByPQ8lgmVFk4zWH+fwT1nebHB55uDbxgToyDSljY227f15QXiLgLsveyHGc3x8+
	YNdrLQOu9X742kbBR8hiMSyc1Yu8Re9SMsjYXoHMkqBC+HJ23wKxMwEzs6qGN0Od5KR
	5+rZa1SSrQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1724975080;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Feedback-ID;
	bh=JNe30hLjclDSWQ+beOj4C/oInzNRg8Au53WBSYUzM3k=;
	b=cPcLKFteRKM4E53/LuG5tpCpaLr8AuLNb3FwKinIDn2cf/v8ac7A9pMRMh+6tOVA
	ax+pwv5AbrXP/NBLfDn7CUv+Q7sr4FpBt3a4C75RM3F3g9NPn9J9iuGhPQKAGxvhoS4
	Mtq8YY1gYXapk/lMoGfGvWYJwwPegriNcb5lfEas=
Date: Thu, 29 Aug 2024 23:44:40 +0000
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	kernel@collabora.com
Subject: Re: [PATCH v1 1/1] dt-bindings: clock: remove assigned-clock* from
 rk3588 cru binding
Message-ID: <01020191a086e42a-3479ac20-3dc6-4ab7-a743-455c3a053f40-000000@eu-west-1.amazonses.com>
References: <20240829165933.55926-1-sebastian.reichel@collabora.com>
 <6207501.2l3rmUXbR5@diego>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2q4n2isjklvb4fvo"
Content-Disposition: inline
In-Reply-To: <6207501.2l3rmUXbR5@diego>
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.08.29-54.240.7.48


--2q4n2isjklvb4fvo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Aug 29, 2024 at 11:54:17PM GMT, Heiko St=FCbner wrote:
> Hi Sebastian,
>=20
> Am Donnerstag, 29. August 2024, 18:58:05 CEST schrieb Sebastian Reichel:
> > These properties are automatically taken over from the common clock
> > schema:
> >=20
> > https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/=
clock/clock.yaml
> >=20
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> >  .../devicetree/bindings/clock/rockchip,rk3588-cru.yaml        | 4 ----
> >  1 file changed, 4 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3588-cr=
u.yaml b/Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml
> > index 74cd3f3f229a..4ff175c4992b 100644
> > --- a/Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml
> > +++ b/Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml
> > @@ -42,10 +42,6 @@ properties:
> >        - const: xin24m
> >        - const: xin32k
> > =20
> > -  assigned-clocks: true
> > -
> > -  assigned-clock-rates: true
> > -
> >    rockchip,grf:
> >      $ref: /schemas/types.yaml#/definitions/phandle
> >      description: >
> >=20
>=20
> I already applied a similar patch from Krzysztof today:
> https://lore.kernel.org/all/20240818173014.122073-4-krzysztof.kozlowski@l=
inaro.org/

Ah great, I didn't notice that patch. Sorry for the noise.

-- Sebastian

--2q4n2isjklvb4fvo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmbRB+AACgkQ2O7X88g7
+pptlA//RNy59k2EzzRS76y/9AwVGaW4t/cH5m4r6c7RVs/lFg3sztl26pooRyIQ
YKunI1IG6bTuSDWIshs/N9ahh+Kh9xYTx3ITvQ2sfuyDun05nCYofjfUdRy8PAkF
Srr6F8va2KPmw1+6Zr396G6FRcQhqsKyTOU5/HAJaUGNI8kWFzs/koEewpc3jgQA
JIaS3G7u7u4O+2IqRC+NTexTjPFBRa/5Umjlb6MtMison0wdMr9+8caYPCFD9ulM
bnF5mKII7GQuGJXsSkJVHz9CdjtrIPT+G34hIqk008ldnQ6TqMFzvYmA4DDjMEBw
ZX23zZfFVR/cMuCurLSTzACSQsEcfbLXbg80T59+1IvRs9FWmrPNXHJpO9HUy2bq
N/TqgLGpRsgiimUsA0WesQJZRiS2uK6hWzlEuepu2Ql7SLrYnnU7vT/A19EOM8k1
H0R4VYNQJJs0+Pwm65VHqPl/wHP2x561O5em07P2X9oENSygl0WPl/PKS2cYdzYm
R76gJmQW826Xx3QCXCnl4wzdNiMoaNeMmvna2jkbazuD9XmXBXH9XTNAN7PsiidK
Hc+MlCTRSZK5PLuhHL8c2FUmlrJEuiam3l8fkKdASkM5lAU8sQIH5Fbv3SmV54W2
EzPNBkY3rQPkFe77RkFgWVQUO+RnJ/KkUjY7ALI+tNbFnjqB4kg=
=wkIR
-----END PGP SIGNATURE-----

--2q4n2isjklvb4fvo--
