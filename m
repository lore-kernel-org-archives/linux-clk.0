Received: from maynard.decadent.org.uk (maynard.decadent.org.uk [65.21.191.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60CCC13B;
	Sun,  2 Mar 2025 17:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.191.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740938171; cv=none; b=HSv5q07w0kDDcwo/lAGBZnPITHQpZ55vgVWzis44tjMlw5UGTe19Wg6Uvx1UwVmw7QJgeHP5gHlsUJ55BIOyPk8rE92P58VorglkyimIMZcXQzmlNEzi/ybuI/3/M1i9jZLjXsMOAXE7AKsnvJzLvWv9F9XM6YqPHl4s5X42Qw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740938171; c=relaxed/simple;
	bh=lnQZAyT6pee79h3cEN16oOAZ7yiLgLiJJjZhexo20uE=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=TGdlAt1nGic/6FSwZmmo1qvTdG2bVlNKi/u/i/FBxz/iMOWwn+cTpQFt6ebJAXgaBwfVZl7ot4GEDxls032r4aOIQ4v98/4QVMAPvrK6BF7HhVQIwl2JYSUqVzBkV+BJHLiMgBi4J4Dk2FgxLqrGA8f16lW/qZ0unWe3WL69ejY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=decadent.org.uk; spf=pass smtp.mailfrom=decadent.org.uk; arc=none smtp.client-ip=65.21.191.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=decadent.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=decadent.org.uk
Received: from [2a02:578:851f:1502:391e:c5f5:10e2:b9a3] (helo=deadeye)
	by maynard with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ben@decadent.org.uk>)
	id 1tonXr-007Sul-2g;
	Sun, 02 Mar 2025 17:56:06 +0000
Received: from ben by deadeye with local (Exim 4.98)
	(envelope-from <ben@decadent.org.uk>)
	id 1tonXo-00000003rfR-3Wo5;
	Sun, 02 Mar 2025 18:56:04 +0100
Message-ID: <5a5a21d119da57ad16d6971951e532b30465bf1c.camel@decadent.org.uk>
Subject: CVE-2024-50181: clk: imx: Remove CLK_SET_PARENT_GATE for DRAM mux
 for i.MX7D
From: Ben Hutchings <ben@decadent.org.uk>
To: Peng Fan <peng.fan@nxp.com>, Abel Vesa <abelvesa@kernel.org>, 
	cve@kernel.org
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev
Date: Sun, 02 Mar 2025 18:55:52 +0100
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-jI3jpvw8/Aw06qBarYxD"
User-Agent: Evolution 3.54.1-1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a02:578:851f:1502:391e:c5f5:10e2:b9a3
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on maynard); SAEximRunCond expanded to false


--=-jI3jpvw8/Aw06qBarYxD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

CVE-2024-50181 is supposed to be fixed by commit a54c441b46a0 "clk: imx:
Remove CLK_SET_PARENT_GATE for DRAM mux for i.MX7D"=C2=A0but I think this
assignment should be rejected.

Based on
<https://lore.kernel.org/all/DU0PR04MB9417404E8E89CB82386146B6881E2@DU0PR04=
MB9417.eurprd04.prod.outlook.com/>
it doesn't seem like there was a real issue to be fixed in the upstream
kernel.

Ben.

--=20
Ben Hutchings
Any smoothly functioning technology is indistinguishable
from a rigged demo.


--=-jI3jpvw8/Aw06qBarYxD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAmfEm6kACgkQ57/I7JWG
EQmmxg/+Nb+BEUyQ7+twwSbrEVBoCaFG2DTaOn+HLgmmFenpoj04ynMfZJc0GelB
B6YJ/vj7jY+LzWFKdZ0DKRNU5++TK8pLD2p2sMiTQhA3W7xSDGRcGKB6KjEkmsVv
cjHTB67tgeGCsd0CpcI05iTeDyHXF26fJEHOPOEp+vsPTcD3BqnX1D+wC62dqDKP
RMN6YNJ6Klo2/vRsp4rspdb3T+e7PPjE9NDfuqx7YF3Qx3TY4lUiW8kYq2VE+J35
iwAwXKPwjzFJekhDJsOU0vPorAYF19isZjXmsJ8aYm67ODHM06YiLPo8+x+9FUPu
mnyZDTtUDnKzUdpyDJHh6wokACwdiP1QirhRmBL77VpNUawyPNsoIJ879J6PHmd9
0k7L+GD/LbDJXJoA1p9i8FPp4m0LOoEWCUAW1CyaY7JrGNpq7Gt0gaaQl45qpPsJ
z7rvPaT/dy207oxp/suYNvcBRKZB2iuabBVNfaGuTtPs0U/2999NhQokn23savpR
9Ow/kD2OH286Kg7+OxReGUm3eP0jUyWyR6Iec+Bzj/3QFfIeiyXtmxC7Qu46amSC
XhwxELnTzPX8H3m3jI8mTfTxH/QBumXxAd6rlIrW/AD2BZpRdn9+xfHp/AvoN2lA
GcYHbh+/tydSwssxuMv3z7wlAQFXeBqpbp1ZC1bC5Bec3QnCEEw=
=CxY6
-----END PGP SIGNATURE-----

--=-jI3jpvw8/Aw06qBarYxD--
