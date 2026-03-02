Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA342DC79F;
	Mon,  2 Mar 2026 12:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772452923; cv=none; b=UERy1LWwIJbWaPiY8ZKyoLQbsZr5NHrfWO372odlX0SLlmLHuGSIvEtUC2RCOoFgMdZUMkA1WRe1mdfcsfApi0hh5ZlVRE2N49JBcLTDo9ZLPShA3HLJw6OvhP9UfTBJmI7dqnBSkw82GS6MxA47ZnPTs1C9STkdG7IHL3qGoag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772452923; c=relaxed/simple;
	bh=xzgE2dy6h92Ku6TppARxUqQObTm1N2T5eDIFIwu5fc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WP+qIKFadfPsL4NlAaxizIbKwlOMqdG80Wtmd2Ehul0f9gVlBabEk2MQQN+hDFzVgnDN4RvFgxKCOY6KKgXdrs4fOhbOfoGB0IOszZWdOweBXqXZ5hBqQbXD960B91xMHrfLX2meg4r2MzEJ0MnNXVqA/bo6fcPqAp71WPTHwMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=jIC4VcS6; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="jIC4VcS6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=xzgE2dy6h92Ku6TppARxUqQObTm1N2T5eDIFIwu5fc0=; b=jIC4VcS67TJVEaF7+mGeSVWak4
	7HYaZRR+Ar3D8UT5qeLfgIK6YNyYXQCOfY7fBDDMc89XC5jCy6FF1RG7uRdh1vUSvfvsa6CNTw5PX
	uSkklaz8oaG7nH2AKXONcqiDP74DJ8PBivT4g6x5X3pKSWucKSe2CiAaqMAF2LQi65/dXDv0vlef6
	IGpeY0+EsWqiLutxgtkfeQVv/ZmiULEsTizPrYOPbDyrbDvTOY8BDMW+TMFsMWTMxTur8mTNIfMzt
	9WdjUr+9Mun8yu//A7wGtrYqRB++KbmqTPmTWVnOmg89zHaIL7VYTnpgjq8AwHMWFJTJCqSStaGoE
	L9/bkYsQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-clk@vger.kernel.org, jonas@kwiboo.se,
 devicetree@vger.kernel.org, Fabio Estevam <festevam@nabladev.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject:
 Re: [PATCH v3 1/2] dt-bindings: clock: rockchip: Add RV1103B CRU support
Date: Mon, 02 Mar 2026 13:01:56 +0100
Message-ID: <1850487.VLH7GnMWUR@phil>
In-Reply-To:
 <CAOMZO5AvymrELSnaHQ+cThcSDdPbayLPGwx-5YB18=0zm+oJ_w@mail.gmail.com>
References:
 <20260210022620.172570-1-festevam@gmail.com> <32347982.43St1lv6Oq@diego>
 <CAOMZO5AvymrELSnaHQ+cThcSDdPbayLPGwx-5YB18=0zm+oJ_w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hey Fabio,

Am Montag, 2. M=C3=A4rz 2026, 12:46:25 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Fabio Estevam:
> On Mon, Feb 23, 2026 at 11:21=E2=80=AFAM Heiko St=C3=BCbner <heiko@sntech=
=2Ede> wrote:
>=20
> > I generally pick up Rockchip clock changes anyway and then
> > send PRs to the clock maintainers, so that'll work as always :-) .
>=20
> Please let me know if you are OK with the RV1103B clock and dts series.

just didn't get that in the list yet, but applied now :-)

Heiko


