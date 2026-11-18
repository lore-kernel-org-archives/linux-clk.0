Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794997155;
	b=S9lSB5nv+RdPV/KAzE1SSo+JnQO9X1jLWIQp8IclhTM1MRX6V2YShqlODY30rSGgJ5KG
	 DhNcbPwmdwhYTGicOm3/cr/giTVhA+CBSIrOI/aBU3EbDdhtJg1AWUQMLrUA8LMwbsQhB
	 A860gemlFzs57Or0IPLp8HnoBD/6WiFZ+dnGm4eiWy0T7kHYa+yW8fY1CouavpqzH1jST
	 WfHT9p3yPPPUFYXBZWrn+n0G5ax1anBO1q7sjTTY55+i77rAo+TKEOzj5iPEmspXwWsqW
	 mZeZwuSuFa5hSjligev8XXnjLD5n/0K7ceer+Xzk64ZaaaJuGvDfb74vLwGI3/EPxDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794997155;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-ZohoMailClient;
	bh=mkIlP/VFkdFXEzDXzF49yA7qSDhA59GiLbzlhR/mvdk=;
	b=lw5Z4StqaeTYNb+uTmEkbegQMEgMgtR1DJF6Y873FGjloRcJwYrRqGCe16wNlAoi0a/C
	 Mx7/vEYTqqD1TcZ+avFKcT1F95P5S4dXtQeHJ67WEVc9XGEbdb3Rm/qb3avn7lwAwhZlk
	 mZUsbsZTa9MDGYtmEqmkR3RxeR9IuDgXR7cIuu7WxKy1otbHJVoM9JmXSCx439W8NewAU
	 eAFoj/zAAhlbiT24Xc8vAJoqGHbSNK+fodYt4zDLkRn+8Baqah7pfylQz/+hKbh8EcS1X
	 wKHKVpWnFrzxIb6XW0G3bJnL2/l5HMus6GUZnoUCH2hgBOz6JFvxJianJ4Kgk0mP7sw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icenowy.me;
	spf=pass smtp.mailfrom=icenowy.me;
	dkim=pass header.d=icenowy.me header.i=@icenowy.me header.a=rsa-sha256 header.s=zmail2 header.b=Oi4ByOSX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.15
Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876D2606A31C;
	Wed, 18 Nov 2026 10:19:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 876D2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=@icenowy.me header.a=rsa-sha256 header.s=zmail2 header.b=Oi4ByOSX
ARC-Seal: i=1; a=rsa-sha256; t=1794997111; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=duM/gO9A/sLm4uIjFeWEgFv+8mgswwB0RU3N1Ifzp2Ah6TAeu968wyO74dJF0VYXVz3aleUMsIbdB2IRen5xWjvuSf4dT/68uWQL6NGtg1MUmRz+LM6V78k2Atf1PqxZyXV1JL94kL36cHlI9zB0YQQTY7hS5dZt8UeeHoPlkjQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794997111; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mkIlP/VFkdFXEzDXzF49yA7qSDhA59GiLbzlhR/mvdk=; 
	b=UxNUkRRwALdBIqd+u0/1SRXfSlX+uHGECmIwZzaX1DuSs2pa10TpsUGZHRPbOovb+wmYPA5elYCOsL/zzhj7Ja/70TCDe9GHaSKebPGQ1xW8xDVoRQHqVqjrMJ5ZyDw58na/G9/5HF6c3A/XsCDs6iAkC4ALddga4NTtRLnIVwc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: a=rsa-sha256; b=Oi4ByOSXHxLX391vOuMr/ZKJCm3wX0/iKuyFiAVU8SQ65OQFej2WozQWNQhfeuQDKv6l7/BbgNydDlEIBiQg74Tb/vXKn31Guesh8GqcgI2stI6Kq1Kb9Ig8qZSjrw/TeDA8bfWI/eUtCnU+lwOcCAVfvSKix2fhpltCrtBzzXj8pu2W1CpFQNXcijLLQgLIu1Mi5Dd8eR4esbk0nYSsFbI3URs5BaQVssiEjjdppL6Y7FWiQSiOc1epm8U5ye3iBb58oenDahc2hdDesBKYIoXQUCPxxSsBJff/KGn94iCE0+QT20jdhbxNSL5wAsi+0SpyMebfRQt8RwGtWvHQrw==; c=relaxed/relaxed; s=zmail2; d=icenowy.me; v=1; bh=mkIlP/VFkdFXEzDXzF49yA7qSDhA59GiLbzlhR/mvdk=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794997109359888.2617794708957;
	Wed, 18 Nov 2026 02:18:29 -0800 (PST)
Message-ID: <bffbf989f2c99aa8c463719347930aca44962615.camel@icenowy.me>
Subject: Re: [PATCH v2 07/17] drm/spacemit: add Saturn DPU register model
From: Icenowy Zheng <uwu@icenowy.me>
To: Guodong Xu <docular.xu@gmail.com>
Cc: Cody Kang <codykang.hk@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard	 <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring	 <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Vinod Koul
 <vkoul@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>, Haylen Chu
 <heylenay@4d2.org>, Michael Turquette	 <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Brian Masney	 <bmasney@redhat.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Paul Walmsley	 <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou	 <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>,  Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
	 <u.kleine-koenig@baylibre.com>, dri-devel@lists.freedesktop.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Date: Wed, 18 Nov 2026 18:18:11 +0800
In-Reply-To: <19ceb44df3141049a955c2c30fe64766.docular.xu@gmail.com>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
	 <20260809-k3-display-v2-7-327d7910bf71@gmail.com>
	 <edd7ae1b38ebc687d0b2bfb2509c40fb8a45e625.camel@icenowy.me>
	 <19ceb44df3141049a955c2c30fe64766.docular.xu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ZohoMailClient: External

=E5=9C=A8 2026-11-17=E4=BA=8C=E7=9A=84 16:48 -0500=EF=BC=8CGuodong Xu=E5=86=
=99=E9=81=93=EF=BC=9A
> Hi Icenowy,
>=20
> On Thu, 03 Sep 2026 20:08:10 +0800, Icenowy Zheng wrote:
> > =E5=9C=A8 2026-08-09=E6=97=A5=E7=9A=84 21:14 +0800=EF=BC=8CCody Kang vi=
a B4 Relay=E5=86=99=E9=81=93=EF=BC=9A
> > > =C2=A0drivers/gpu/drm/spacemit/dpu/saturn_regs/dpu_int.h |=C2=A0 25 +=
+
> >=20
> > Is the slightly different K1 Saturn DPU registers considered?
>=20
> I compared them with the K1 BSP you mentioned offline [1]. Judging by
> the block, field and interrupt macro names, I agree with you that the
> K1 and the K3 use similar IP. But there are also important
> differences between the K1 and K3 registers, which is why I would not
> propose reusing these tables.
>=20
> For example, the blocks sit at different addresses, and most fields
> are at a different word or bit. In dpu_int.h, CFG_RDY_CLR is bit 4 on
> the K1 and bit 5 on the K3, and the underrun bit is 9 and 8.

Yes, this IP weirdly doesn't consider register map compatiblity at all.

>=20
> IMHO a K1 port should add its own compatible, its own field header

Well I don't think field headers would work for a mainlined driver;
maybe things like regmap_field could be used to mitigate the
difference.

Surely a compatible string for K1 would be needed, and it might then
set a device info structure as match data, containing the device
capability and regmap_field list.

Thanks,
Icenowy

> and its own backend file next to the K3 ones. What do you think?
> Hopefully you agree with me.
>=20
> [1]
> https://github.com/spacemit-com/linux-6.6/tree/k1-bl-v2.2.y/drivers/gpu/d=
rm/spacemit/dpu/saturn_regs
>=20
> Guodong
