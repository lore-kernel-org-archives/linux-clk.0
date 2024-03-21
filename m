Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E5F13699C
	for <linux-clk@vger.kernel.org>; Thu, 21 Mar 2024 20:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711053928; cv=none; b=SkbIhvzE2W8kJBBTIVITxaVCmmkvud7s6bD4xxHSqaY7y0icXW5FySF1C8WXmP5y7G7Iwgjgnix2CdTCdwivG+saUTE/dK2LPoYBUcEZyOsKbfPyUHo537sT4St5cCRMXysmINAf4xpWEAY6xt6w+vH+2yYMImOU4cdErXuDA78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711053928; c=relaxed/simple;
	bh=J3EkheC27TouDCwQoI1Xcs4QrnTzmZI4j/PiqszkMA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U2nSH0A/p6YUNyTUc0Vot9N67SQ+Xq1xZCvZUuTPXLD5jmgdcWLHtWAED9Tr7UvszN9VNbQpM3Jg+PRNpKUWvNZm5ZqcReKeKtA4NDMPEj3Mns1ZVolNal+cJ+es3Pal7pUAC5U+dml7Acq/9ZCvAD7P3ca5H57lj8/mL5JjZ+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=0LQK9pr5; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="0LQK9pr5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711053923;
	bh=J3EkheC27TouDCwQoI1Xcs4QrnTzmZI4j/PiqszkMA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0LQK9pr5gXACUsGM13hgm4eg1lGPVrby1iggpdupsJbcqFTMdJ5zTNUui7eiE+s3f
	 /ANht8lRT5MKKCORaC4e36Oj95KNejTOYVRsdX0t4JYsCE7Rzcp4S3d+3Jss3nCvDg
	 Y6l+ADK3A+rSpvrV5uOkd+ZBsR68f00UHDrCc9TMS/+CxwVuk0kHMltLFoWsEkRiVU
	 slCXl3to8VMVMKBUiqh1nLqWPiII2i8gkg9y6uLQyKJfc4l+tSi+C2GKea/hpWSQ0f
	 qI8BwnrwXiRd5xQWvZzZl2fSfX9DqO4JqM4ZnTVpMLBjXkGx74t0Avi6g28wiIeXJG
	 QVHcL/Xvg025Q==
Received: from mercury (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 913D937820E7;
	Thu, 21 Mar 2024 20:45:23 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
	id 46BE91060709; Thu, 21 Mar 2024 21:45:23 +0100 (CET)
Date: Thu, 21 Mar 2024 21:45:23 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Ilya K <me@0upti.me>
Cc: Chad LeClair <leclair@gmail.com>, 
	"andy.yan@rock-chips.com" <andy.yan@rock-chips.com>, "heiko@sntech.de" <heiko@sntech.de>, 
	"huangtao@rock-chips.com" <huangtao@rock-chips.com>, "kernel@collabora.com" <kernel@collabora.com>, 
	"kever.yang@rock-chips.com" <kever.yang@rock-chips.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, 
	"sboyd@kernel.org" <sboyd@kernel.org>, "zhangqing@rock-chips.com" <zhangqing@rock-chips.com>
Subject: Re: [PATCH v8 7/7] clk: rockchip: implement proper GATE_LINK support
Message-ID: <qepnk6poq6md5hewkf6otcjgeuj5mkf63azwzjqe75gbyi4fxm@6s7vijaz76uq>
References: <1456131709882456@mail.yandex.ru>
 <uwr335fla4nfvv3mdppcoly6hcsayav26r4r6txmbwrb25ftw7@rxwjtan7evww>
 <7f4b3f38-50ee-480f-a341-ab577e19bb32@gmail.com>
 <2rsu6qa3pwbqic6b7ej6txa34jw4ztrnybzcfcfysue2mky37h@dyrdefbimzdn>
 <97f8b9e7-983c-435e-8fad-11e71be158b8@gmail.com>
 <vetdlmrlwx2bpwliof442zjiir7jy5irs737qu3v7qjhcvubn4@wslcvkis3tsf>
 <5287754a-e488-4365-9e88-811eb028a91e@0upti.me>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jfxuo2eajis6pcnq"
Content-Disposition: inline
In-Reply-To: <5287754a-e488-4365-9e88-811eb028a91e@0upti.me>


--jfxuo2eajis6pcnq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Ilya,

On Thu, Mar 21, 2024 at 10:01:10PM +0300, Ilya K wrote:
> On 2024-03-21 21:31, Sebastian Reichel wrote:
> >=20
> > Ah, that was actually not setting up the clock links at all. Sorry
> > about that. I reworked everything again and moved all the GATE_LINK
> > code into the separate driver now. Please give it another try.
> >=20
> > Greetings,
> >=20
> > -- Sebastian
>=20
> Applied this to my 6.8.1: https://github.com/K900/linux/tree/rk3588-test
>=20
> As far as I can tell, literally everything works now - it boots, runs, an=
d I can read and write the flash even with ROCKCHIP_SFC=3Dm.
>=20
> Thanks a lot for digging into this, y'all!

Great, thanks for testing. Can you check if it still works with
ROCKCHIP_SFC=3Dm when applying the following additional change on
top of your tree?

diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-r=
k3588.c
index fea7e7fcc4a4..f0eb380b727c 100644
--- a/drivers/clk/rockchip/clk-rk3588.c
+++ b/drivers/clk/rockchip/clk-rk3588.c
@@ -2413,7 +2413,7 @@ static struct rockchip_clk_branch rk3588_early_clk_br=
anches[] __initdata =3D {
 static struct rockchip_clk_branch rk3588_clk_branches[] =3D {
        GATE_LINK(ACLK_ISP1_PRE, "aclk_isp1_pre", "aclk_isp1_root", ACLK_VI=
_ROOT, 0, RK3588_CLKGATE_CON(26), 6, GFLAGS),
        GATE_LINK(HCLK_ISP1_PRE, "hclk_isp1_pre", "hclk_isp1_root", HCLK_VI=
_ROOT, 0, RK3588_CLKGATE_CON(26), 8, GFLAGS),
-       GATE_LINK(HCLK_NVM, "hclk_nvm", "hclk_nvm_root", ACLK_NVM_ROOT, CLK=
_IS_CRITICAL, RK3588_CLKGATE_CON(31), 2, GFLAGS),
+       GATE_LINK(HCLK_NVM, "hclk_nvm", "hclk_nvm_root", ACLK_NVM_ROOT, 0, =
RK3588_CLKGATE_CON(31), 2, GFLAGS),
        GATE_LINK(ACLK_USB, "aclk_usb", "aclk_usb_root", ACLK_VO1USB_TOP_RO=
OT, 0, RK3588_CLKGATE_CON(42), 2, GFLAGS),
        GATE_LINK(HCLK_USB, "hclk_usb", "hclk_usb_root", HCLK_VO1USB_TOP_RO=
OT, 0, RK3588_CLKGATE_CON(42), 3, GFLAGS),
        GATE_LINK(ACLK_JPEG_DECODER_PRE, "aclk_jpeg_decoder_pre", "aclk_jpe=
g_decoder_root", ACLK_VDPU_ROOT, 0, RK3588_CLKGATE_CON(44), 7, GFLAGS),

Greetings,

-- Sebastian

--jfxuo2eajis6pcnq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmX8nF8ACgkQ2O7X88g7
+poxghAAowHQsxDDCHEy4G6Noi1/XUJr82t2q8ilGU5EjMgWqU4l3xCG6eiASQ/1
X7q/a2d5MK0NhHTQYMRTSKa+gCWatNiLAfB14oPzGYugtnK9TxJXNVjYuNziaDfb
n+tB1U5DM3PjHiq1cXbJiMMa88iG17pVzXjjlex2cxoFFK4JEFmB4oaUKDVq03+a
QlnqYw/lgzZRPpAeMFq8HNrrpBXhrY/6aq0UMpb/DaYKC2e1rI8Doled3Z89fiWB
N1mJ1g79/vqbyCnZ/18MqwPAqSJqdc2x7+KJxAb/Kp3ogFXyImRdygJz0NoV59GT
sBt0uDor8zoVowsYim8Rq6MPDJRGhZMsNfTPeCiYGdUrHIGFR5NbqBwPik7aVog8
CQkOXYHnOFFdGMVOWdWRF83HJaJJt1PDYQ4a1d+LmSiUFM4dC4mROMZ8DZqDoiQd
eDFdGiFKluuaZ2SqxDf1M7UeA1zEMv8tvwgBjdOQIYxpP0yt2Q4yjFpqq/Y92Pnv
1qKHgD2Qd2BnGHJhtWLd8CQ8jSTC4OUajP8ahKzWh7KjpKsHi8OmOtfgzEfqmToP
njI4lDGV4gqiKJf5qaLtFLcx1wRnw/dOBNCEGpdVGg6V9496KwmlNVdy/ueDhGNk
ch5kuPWltiTRi1sWXfN/qbyQElQpf6ElCJ44i41FyClSVMOlezE=
=ngYT
-----END PGP SIGNATURE-----

--jfxuo2eajis6pcnq--
