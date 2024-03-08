Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5272A40875
	for <linux-clk@vger.kernel.org>; Fri,  8 Mar 2024 13:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709906379; cv=none; b=t2BNc2FqXkPU54sMZlPQC1nxfl7nXu/XWiNmsRuDJky8CDi9d+HT1XIylXa2b/uVfhOmC0nTyW77ApDE3Ru3Jacsn5pBN1aD+PrC/vvSCFj37x7LUl8+i2j1WYvZIGzviLFOMKwxrG/7lswIoM9U3sQfgs3sKuJ4+6mlmbV7aqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709906379; c=relaxed/simple;
	bh=wSi4nzC0Vzt08/nuVCBCe2oCPowOBtKD5PTL8hk2eX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K8apEFeK2YgBDFzZST1oPIA25DopihbcPcpFa+zu4Mdz9FygRal7phxwwDQOMkt/K9BlMJMvAqpArLcyXFq6BnHCIJR1oe6Py5w+CFwa1KLxnVLbhTGWPpYRiheyt2p2M/Meh8yNHzGdttsuuh3LCb33bQ43iwttQffrSP2ZMfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DO5OmbA7; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DO5OmbA7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709906375;
	bh=wSi4nzC0Vzt08/nuVCBCe2oCPowOBtKD5PTL8hk2eX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DO5OmbA7WAJ/hucDDXeUDMSVsX5f2wVSGBCDfJb5/6S4uvD5LG9jc9nU9btKXMUfh
	 2UdDujqwmY87UsHm5P2r8Etf33wzHsQZKeSvRaqO0O3/bd7PQkuNUqj89gXAdrCYB4
	 1HnyCR+3AUsRqOxONFC6Zaf3dmLd1K31BZTm8tT/hE9d0U4Zh4Vwdnpbo1HrlY5wBt
	 EM9cPPwMi3r9Kxy1vVXRVw1X/kY7fiHNnTSfSzIy8S6rzDk7IhVZy2LMRF0Ej5ogRs
	 W/2vROjVYSkkWR3xcvmGTAZusk96kyTcY63Kc10AqV3vUoFZ1MoOrnJXliTi2dlYDV
	 XPrUhwxljOx1g==
Received: from mercury (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1F15437820E8;
	Fri,  8 Mar 2024 13:59:35 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
	id AE8CF1060B10; Fri,  8 Mar 2024 14:59:34 +0100 (CET)
Date: Fri, 8 Mar 2024 14:59:34 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Ilya K <me@0upti.me>
Cc: "andy.yan@rock-chips.com" <andy.yan@rock-chips.com>, 
	"heiko@sntech.de" <heiko@sntech.de>, "huangtao@rock-chips.com" <huangtao@rock-chips.com>, 
	"kernel@collabora.com" <kernel@collabora.com>, "kever.yang@rock-chips.com" <kever.yang@rock-chips.com>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, 
	"sboyd@kernel.org" <sboyd@kernel.org>, "zhangqing@rock-chips.com" <zhangqing@rock-chips.com>
Subject: Re: [PATCH v8 7/7] clk: rockchip: implement proper GATE_LINK support
Message-ID: <wzvv4x6lnb6caocrbt3zrwmeyszfzamvuiw4r4rbq4l5oigsni@ivkdrnkbqdtu>
References: <1456131709882456@mail.yandex.ru>
 <uwr335fla4nfvv3mdppcoly6hcsayav26r4r6txmbwrb25ftw7@rxwjtan7evww>
 <20561709904626@c6cdvt45gvthiay5.myt.yp-c.yandex.net>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i6ww3rv7vsc4trrr"
Content-Disposition: inline
In-Reply-To: <20561709904626@c6cdvt45gvthiay5.myt.yp-c.yandex.net>


--i6ww3rv7vsc4trrr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Mar 08, 2024 at 04:30:26PM +0300, Ilya K wrote:
>>> This change seems to make my Orange Pi 5 (RK3588S) lock up on boot
>>> :( Any suggestions on how to debug this? It doesn't really log
>>> much...
>>>
>> I suppose with this change you explicitly mean the last patch, which
>> has not yet been applied? That patch effectively allows some clocks
>> to be disabled, that have previously been marked as critical (and
>> thus always-on).
>>=20
>> If that results in a boot lockup, I expect you have a peripheral
>> driver, that does not enable a required clock (e.g. because of a
>> missing clock reference).
>>=20
>> I assume you have a bunch of other patches applied on top of
>> upstream and not just this one? In that case it might be sensible to
>> first apply this patch, do a test boot (it hopefully boots). Then
>> step-by-step re-add the other patches and check which one breaks
>> when being combined with this patch.
>>
> Thanks! I think the email bounced from most of the mailing lists anyway..=
=2E The
> exact tree I'm running is here:=A0https://github.com/K900/linux/commits/
> rk3588-test/ and the last revert commit is what makes things boot again.

Please update your mailer to send plain text mails instead of HTML
when working with the kernel mailing lists. Also please do not
top-post.

The tree seems to be more or less what is working on Rock 5B and
EVB1. Please try a partial revert, which just undos the removal of
RK3588_LINKED_CLK (the define and the usage of the define). If that
works the next step would be to step-by-step remove usage of
RK3588_LINKED_CLK again until finding the clock that needs to be
critical.

Thanks,

-- Sebastian

--i6ww3rv7vsc4trrr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmXrGcAACgkQ2O7X88g7
+poVbg//UJ3XmMkd6xZv540xz36f77DgCd0fGZQ4aDs6BquhWebJOq0ZeYy/rKJp
C+zZWWDTU3LMeOxd4AaNcPom3gxMcMNtq1iozq5lcLShj6iZF1i2MQkdKAD6SZu1
aTWSIfcWgkb0hRVJsiDEh0rO1Dx1BZLTvDz8XoJXBjU3p1e9NTg0qo/Oexdrp/6U
JSFA51qpZiBXKflT6WBWkS1WnqKtQxZaQPUHVpie2t0slipvibk8TH3YU2x6rFKr
iX3mMjvGqZJajHWZpD6U2n8gWmmHkLYXE4/HZIWXpI+ZfzeXd2ztM+ok6szMzj0E
RhuTKgQWgJw8MRXq3UnLnWSIpIVNTEVp4tUOixAEHfiQNtFeP63q7WPK7QCKKoEp
JFoBf5tK6yE/2JAkocBceSUa3yP9hVwX8Cj5AWgqYODtJtKfpmDBUq9i0q9SABtW
JgAGVXDa5DFl+uR5gpKb+NS4gj+JNvHutMvSYUdOv+kjdPeywjQ23hbWxzIYQ0sV
Ixy0cIzSZAq5Yj4O7h+IRktdAiV9wRBGF4EY6NWKVInp5Ebgmu3yKgykWJUnU6jE
+DHdsH4daIF/kXG/fS7ZskGLbZjQxgATydpU2d+0q62JGNQMFClG5LIFTOGk56+4
hx6rDthq1plpMB1AjI45SZJcbkMBg6bPLS2sXqwK3606HzBEdm4=
=SQIQ
-----END PGP SIGNATURE-----

--i6ww3rv7vsc4trrr--
