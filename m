Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.186.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514383;
	b=OQKN/5bZiqDwKlrqlmjZqKXEkffY9+2ESmwkkPAo+gB34l/K2HQAsLvldCzOcNlkaRK/
	 SmuPj/0MmHdcXPTwGSJ0RF9+0XidQvQgMC2mJYsJ1ECodrZP9R7g2eiZl8bJnMe3afYXA
	 lWjPWi2WfNF9yujREn5o7d8A4q0xIBZJG8OcUW77yofG8Pq88/EFM555/Z7gq3RSDRq/N
	 Xwtu6Q6lT6kUvaoTLfSrgfabonnDfzmOhq/BeUMiae7hz3x4psFjDXTcS64I4zZ4cibN8
	 FiHgYXmh13Um8Qen6jLtUZxgVm0wqwH7OdZQdirKkHknfrwnpOP+WhPaEK6iv3XMBFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514383;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=UBZCLtFyDcx6tMiD2W3CXEoiJabgHbN2NvJtlqv5Hf4=;
	b=vjdvtJEDR42/pN80AZm7FbC5eMp4MhjntXlj4tENnT1HUUnnoIXcGOa9F1hURhetjsE/
	 kbKmpRd91lLV401pI3UddI+M/sBeYhPcQ4iH0U+Txyj7TON48J4aL9OTN/Q7n3rVPNfQ6
	 NemdRhVQY6iU8YalW5bRkbzVDQWr3gBghf3MKy6yvSYdIRs8oxbl1JNz4iA9ydnnz8fDH
	 ttm1ksnZU/d1bSjH33QpFtYXgdfpmNQOAezTa/jkl8M6bywHzr253+mPVimO/uKc0BrJV
	 voxgnzAEf/34NXCFFJTNxlRIxDRrRl4Xrzofq4KMk9bOIFBB1BRNDRLmmy/MzaCmT0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=krgm.moe;
	spf=pass smtp.mailfrom=krgm.moe;
	arc=none smtp.remote-ip=103.47.186.116
Received: from krgm.moe (krgm.moe [103.47.186.116])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ADDD606A33C;
	Tue, 24 Nov 2026 09:59:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ADDD606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krgm.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=krgm.moe
Received: from yuno-loong.localnet (unknown [114.242.206.180])
	by krgm.moe (Postfix) with ESMTPSA id F1FCC791B;
	Tue, 24 Nov 2026 15:29:37 +0530 (IST)
From: SignKirigami <prcups@krgm.moe>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Add Qualcomm Netrani clock support
Date: Tue, 24 Nov 2026 17:58:59 +0800
Message-ID: <AHxcMRgGRTeahvoG5rfviw@krgm.moe>
In-Reply-To: <59d34135-d280-4d9f-8517-541c4d2ac324@kernel.org>
References:
 <20261124-netrani-clock-v1-v1-0-ce10cedbfa4b@krgm.moe>
 <59d34135-d280-4d9f-8517-541c4d2ac324@kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On 2026=E5=B9=B411=E6=9C=8824=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C =E4=B8=AD=
=E5=9B=BD=E6=A0=87=E5=87=86=E6=97=B6=E9=97=B4 17:52:36=EF=BC=8CKrzysztof Ko=
zlowski wrote=EF=BC=9A
> On 24/11/2026 10:48, SignKirigami wrote:
> > Add the RPMh clock data, GCC binding and GCC driver for Qualcomm
> > Netrani (SM7435). The implementation follows the existing Qualcomm clock
>=20
> >From where did you get the "Netrani" name?

I have seen [1].

Best regards,
SignKirigami

[1]: https://lore-kernel.gnuweeb.org/linux-mmc/c379aad4-96f6-4134-8b90-0f1e=
ec8001a3%40oss.qualcomm.com/

>=20
> Best regards,
> Krzysztof
>=20




