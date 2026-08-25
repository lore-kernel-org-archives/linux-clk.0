Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2422C3A75AC;
	Tue, 25 Aug 2026 05:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787635465; cv=none; b=aY87N2ymbaFcAJqhX2B0m0TzBxUe1XWG5+Dn8y7V8WsnJTkwEuNZtvVqQ3KujqqBfHJikKPUJCxbjaRSAxaxsA3S4bqw8k6SoQfr3mdW5UCXDLcD0PQVjFipBM+pH/aiArFkW6Z0ORHdJvYRRJFXPctGCp9sWsivTR9aXGOntlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787635465; c=relaxed/simple;
	bh=zb20ISP2gr7FDz2MvJ6HGryWyLUUe/Bz/Xwe6hxKwm0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NSoh9898xN1om5Qkdgo9E/AL0alUt1rUQrFCOpj7X3NUyolDwfCuhdVXoojJGwrycCUvmWCYa0Hizc1BzhDnoIHuoQhGX4LjKbn//38PkBarikSr8IA5ydKLxzn2Bm56L/vf7hG0xEbCXOO6alFAZU5AECGm4LqqqiyuRbtChbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fB+o2ZsT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fB+o2ZsT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B5011F000E9;
	Tue, 25 Aug 2026 05:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787635463;
	bh=zb20ISP2gr7FDz2MvJ6HGryWyLUUe/Bz/Xwe6hxKwm0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fB+o2ZsTVfTUKGNl6aI3WwwZyG5oCZaFDwyID1tc7pCJfdPf5tizcbVMJxm6rh2P1
	 3rY9Rozmto8Cpj7nJ41TlBnq9spp7zRwJ1Xf/9mVKV3frDHu6Hgs+vyERrOqvxfUQ0
	 gWXzka1VIszywKPlMOfosY3rp7P8uc0EVfsoeiiiHh/Mh2xxpJ4mfp3/xKGTyn7ByL
	 +CYsvtNaykmcv6omEQekRwrp1GG5HC45uX8abF7ZWYqZW4z8whokU/82hAix5DJcR2
	 eaGKq7/j2jEhH7iSplq8lXkX/UfFs5FFQH9snMJLFEwlVey8f30sZaLB8N7/GdjfzJ
	 u6OrrotS/gXZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: rockchip: Enable the EG25-G modem on
 the Pinephone Pro
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rudraksha Gupta" <guptarud@gmail.com>
Cc: linux-clk@vger.kernel.org, lee@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260824-ppp_connectivity-v2-1-a4b0e11cd62c@gmail.com>
References: <20260824-ppp_connectivity-v2-0-a4b0e11cd62c@gmail.com>
 <20260824-ppp_connectivity-v2-1-a4b0e11cd62c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 05:24:22 +0000
Message-Id: <20260825052423.5B5011F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> From: Martijn Braam <martijn@brixit.nl>
>=20
> The Quectel EG25-G modem is soldered to the board. It sits on the USB 2.0
> host controller behind u2phy1, with uart3 as its AT command port, and
> draws from two switched rails: vcc_4g_5v off the RK818 boost, and vcc_4g
> off vcc_sys.
>=20
> Neither rail supplies anything but the modem, which has to stay powered
> for the board to work as a phone, so both are always-on.
>=20
> The modem itself has no binding and no in-kernel driver, so it is not
> described here; its control lines are driven from userspace.
>=20
> Based on work by Martijn Braam, Kamil Trzci=C5=84ski, Ondrej Jirman and D=
ang
> Huynh.
>=20
> Signed-off-by: Martijn Braam <martijn@brixit.nl>
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-ppp_connec=
tivity-v2-0-a4b0e11cd62c@gmail.com?part=3D1

