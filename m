Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795713593;
	b=OS+4pWDNqrWQITCQkQrjhjELZyi74KnBokysU2ech6IQbkz32qKSsM7noZz6Z+kCGFW/
	 Za7vWTgaiAAB50v/b7wlSyel4lb/3O20lkFxem97rnD4EeZ1IvudOVtEbMpQtL5yn4Amy
	 GPx0bZaokNmqdTmPF9P3ljk3Akt64H0GVKfuiKnfyZYIjLAyM2RHjIqp4x0W+7ZQstqGN
	 R4fknn8bIuRKPLiaLidBhgbh2RdSEZC9P/0KxzV2ccj7wel3cuT+7V0mdnzP/D0UMfz4+
	 vIxA/W2rNcv7rDSxWtxbLtrB1YvmDBU6Y4QB4b1H3MnbNyqEhPVfD/NF3T+5rsTMh/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795713593;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=IDeKDSsVbDV13k0Hy+XkX6qCopz9xoTAmCZ1Tcbq/jI=;
	b=foRBGzTK4Gn38rKCOm5oPL1Y+kFB768YmpuTnCUk2VKv9SZEnIEFlvXTsTRNNmnYlsh0
	 lMG48lCdBhcVYHKWxgkN93iDtFugZThq+oGwykpuHZzv6lIDJAzSUwRewPnCzfocsko1t
	 nKI5ELEvLXBRE3Pn8GkBT2BvmxiQ+7L1KJiLK526GFm7SHJ1XRJp+zn6Mduz62fDCQvP0
	 /fX9VqcEC4R6IPYru0VTZ1hoWeS2Z+gl+tSpPgHqnvg6xiLEmIr6Bo+YBF45rL/QsxPFC
	 ht4z1ZC1sh+JslVmTiqdr0jTb30o0rPbU3w+AE6Jr1Egz09x7icW16Y6eN2HSgpz5eA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=UEKF+kAI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C530606A31C;
	Thu, 26 Nov 2026 17:19:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C530606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=UEKF+kAI
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 93F6620583D;
	Thu, 26 Nov 2026 18:19:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795713586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IDeKDSsVbDV13k0Hy+XkX6qCopz9xoTAmCZ1Tcbq/jI=;
	b=UEKF+kAIxfh+ciOumzn6hZn1L9NuCv3VAMkQGuaovTkc9IMnNU1Ir4Z6N3mrmX6Q6wmJX5
	WRRjZgCI4799KKuEW0S9BjATjzSrFRIxUJhbTJrFl7Z+qUag+JNis8p7wUXAwHMdu6EFyR
	YYK1Dge6Fqrnn7yMSlXo95kU5tWghXqXBWL8MwaRQ+SS0dvuIlr8c9bNqA5EQsyOZiCIUl
	KDQDyPd8VVzn7q/M51930Q2+/1JEK+IPyzAq1ajTi+PaHL7pidwzPuIVjzjia+lq3iXCEX
	nsXHge1Zpo30iCc3JLjjzZImP4PrDSxxUmWB5K6jKgaJe+yw70AIM1i1Uq892g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795713586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IDeKDSsVbDV13k0Hy+XkX6qCopz9xoTAmCZ1Tcbq/jI=;
	b=B07MFOCoC8+nNbkkldFEyw5yoaeNSqqr8tFxdF/Q6wcvnnVgoWlR7G3HC0ZiD5/rqdJ0q+
	NDi1FfH7woS+mwdc4KzPANShQk+jYCfVUQNgJVNNAKMliaDVcZCtJokmrl26U9aZ/a690D
	rd+Cn9ZjBUvESYC/s/zE0smVO/rHxqDdB7i1hjGq4akSVZ0AfWjdvQZTwcrvwAtVKrIIJu
	TcP511BulGQ3qQ9LrKG6UZIHf2+/A86GZ2eAt4SQNBAMkmKGpO5LkVMYVDQHmchdiBQeNp
	Wlfb2k04tNx2PtGHVWQ8D0CZBqc/g1sVkSsez50DrIBM/Ju0rDG+6BVbnbaVYA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795713586; a=rsa-sha256;
	cv=none;
	b=MRS0mnKPu6BGbJxZjUZufAzX4rgbnLUrflyMUPDdLj+1lVe9AfZZsocXagFecyjIKeYf0X
	AHVbByd+JKt9HKSkVRDq/Nz0L4qoGbYkBk+81vb19ecvWOEyrC7YSOSNTyPSK/6TY3L/0G
	w3t5sfURtKgWJa5XBkV/+Ese2RuUE0ALaVOean3mbZAHAjTP67a/JL7oNxu7OLR93zvHzG
	WZhGgcGgnm1W58SsONxSoE+U+BulQfNqKRV/mAcCokZyGEP+VQKEjbmNFD/xRgV3ycCGfs
	RT+EdlFxBRnomDHlkSM0JRSqLYNnQvxFCD1TCMRLBxjNsS8cKXqKyO5KeWgrPA==
Message-ID: <04cb977d0a486b9574aaec5262ce92f652a29f18.camel@pengutronix.de>
Subject: Re: [PATCH v3 2/3] clk: toshiba: introduce a TC9564 clock/reset
 driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Alex Elder <elder@riscstar.com>, sboyd@kernel.org,
 bmasney+clk@redhat.com, 	jbrunet+clk@baylibre.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, 	andersson@kernel.org,
 konradybcio@kernel.org, abelvesa@kernel.org
Cc: daniel@riscstar.com, mohd.anwar@oss.qualcomm.com, 
	lorenzo.bianconi@oss.qualcomm.com, fabrice.gasnier@foss.st.com, 
	alexandre.torgue@foss.st.com, marex@nabladev.com, 
	changhuang.liang@starfivetech.com, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 26 Nov 2026 18:19:46 +0100
In-Reply-To: <e20fde6a-3389-4084-a2de-fee5426a74e6@riscstar.com>
References: <20261125202141.1288493-1-elder@riscstar.com>
	 <20261125202141.1288493-3-elder@riscstar.com>
	 <579859f0e1b53aa6506492a2e5d073f3f991014c.camel@pengutronix.de>
	 <e20fde6a-3389-4084-a2de-fee5426a74e6@riscstar.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Do, 2026-11-26 at 06:59 -0600, Alex Elder wrote:
> On 11/26/26 3:42 AM, Philipp Zabel wrote:
> > On Mi, 2026-11-25 at 14:21 -0600, Alex Elder wrote:
[...]
> > > +	/* Warn on any attempt to change state of a critical reset */
> > > +	if (WARN_ON(id =3D=3D RESET_I2C) || WARN_ON(id =3D=3D RESET_PCIE))
> > > +		return 0;
> >=20
> > Can't this be checked at reset_control_get() time (in fwnode_xlate) so
> > that critical reset controls aren't given out to consumers in the first
> > place?
>=20
> So I'd pass in a slightly modified fwnode_reset_simple_xlate()
> as the fwnode_xlate pointer?  I hadn't thought about that, but
> it's a good suggestion.

Exactly, and don't forget to set fwnode_reset_n_cells.

regards
Philipp
