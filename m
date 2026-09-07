Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C883932C6;
	Mon,  7 Sep 2026 06:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788764246; cv=pass; b=RLTMExh6eTP4KqcB7WBmri2AuiRc005NNKMzwFibX1yM5Pvp3mJKmfSmfiKypCRJ9XwIh3FqFgOGf4h9gKsq/MAl4AXsrrMLFTHScUDvSUI5EbRBl5Fi/f1uoZU4MddEDIc5qcx6yTch4Rk4kuEbYMHWXwk+jyYjffiNcdD8Oco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788764246; c=relaxed/simple;
	bh=1tMnWdSZi+sjkC4f5IyBKW6FS6ZeNXijReG8GKO87DM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y5A5nidk3+nglHGqqFJ4fyX01QgO7SQiaiSYHSCAm8ix8A5ZjogK2V0LuXZaZ6Al0G6utECAaMWCxRr2d0js71UGAzFV+KmPRMu7WTpq+jxXD6yh8MDW4ZQOTx1ien8j9FTYI/R8iyTip7Vaf9IGoalIsbBwslnoy6E4hGXMD2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=BMTjuTZB; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="BMTjuTZB"
ARC-Seal: i=1; a=rsa-sha256; t=1788764158; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZV1f7mIa5Ivl4k9y4SDseO7sHW+HXOhGOnNA3H1xRbt1/D/ksjOmLYeU+FS4cmX+Hts6lkL1r8M+mCPrf6tfIzMjJB0b2sVzMmjqPU/3RUMi+047Y294fhETDs6iReJrrgYolwkXDS2m+zCVwGlte7A50w8KcoeS+6v+/RwWTr0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788764158; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1tMnWdSZi+sjkC4f5IyBKW6FS6ZeNXijReG8GKO87DM=; 
	b=dS9L/KG15nTBt2++e5uDJMfTNVAaWzLOQuZasm1GbtlC0sCA0bB1YA6nKDHauAHHIGDtz4Q7ivxhvg0CLUMOobpIBo+BNKxHD/ubsyigThw9IO3SwiDnd0li8ZdtFILkmNvA3GExDWArpzFXprIV1qzIu4e5vjtHSjKY2gyVYVQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788764158;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=1tMnWdSZi+sjkC4f5IyBKW6FS6ZeNXijReG8GKO87DM=;
	b=BMTjuTZBsLIrLLQbFYEi8z0UaWGJZJjxeSYYxBVe6/DSS+g6eYH8Pw9Pt2zTuGh1
	TbGJxgPa/cjnW41iWvSPZTs1m7utVbmLnfyAbfxAueT2zyPpCg3RW0zQ94/VavjbTLa
	BT486D9MNAmUPgxRieTGSu/8tMi27JGUaSFQv9cSqgbQSXgbbbRo5g0CUZ7AzmQiGIv
	lVFA+M7C37fn+a8D09cfSBJESxToQqJg0tFdJybljjyoXRxlc8kR2Nj8pfOZ7xd/k6f
	nuh5zp+4ma19vHlgD2e4mxkAw5n7TkeKvhRfuYzEaatVRNX9eGykxhWw4vjZjD/0S8c
	upQLI3pL0g==
Received: by mx.zohomail.com with SMTPS id 1788764154825847.2528940921899;
	Sun, 6 Sep 2026 23:55:54 -0700 (PDT)
Message-ID: <72f82ae67eca7b5a594d86852c8b0dafb7d02c4c.camel@icenowy.me>
Subject: Re: [PATCH v2 13/15] phy: starfive: Add jh7110-inno-hdmi-phy driver
From: Icenowy Zheng <uwu@icenowy.me>
To: Maud Spierings <maud_spierings@murena.io>, Dominique Belhachemi
	 <domibel@debian.org>
Cc: m.wilczynski@samsung.com, Laurent.pinchart@ideasonboard.com, 
	airlied@gmail.com, alex@ghiti.fr, andrzej.hajda@intel.com,
 andy.yan@rock-chips.com, 	andyshrk@163.com, aou@eecs.berkeley.edu,
 bmasney@redhat.com, conor+dt@kernel.org, 	conor@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	hal.feng@starfivetech.com, heiko@sntech.de, hello@big-grey.co.uk, 
	jernej.skrabec@gmail.com, jonas@kwiboo.se, kernel@esmil.dk,
 krzk+dt@kernel.org, 	lee@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, 	linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org, 	luca.ceresoli@bootlin.com,
 m.szyprowski@samsung.com, 	maarten.lankhorst@linux.intel.com,
 maudspierings@gocontroll.com, 	mfd@lists.linux.dev, mripard@kernel.org,
 mturquette@baylibre.com, 	neil.armstrong@linaro.org,
 p.zabel@pengutronix.de, palmer@dabbelt.com, 	pjw@kernel.org,
 rfoss@kernel.org, robh@kernel.org, sboyd@kernel.org, simona@ffwll.ch, 
	tzimmermann@suse.de, vkoul@kernel.org
Date: Mon, 07 Sep 2026 14:55:42 +0800
In-Reply-To: <f68d95d0-f918-4dee-9443-38c64247b71a@murena.io>
References: <20260828-jh7110-clean-send-v2-13-331680c8b9d1@samsung.com>
	 <0ccb4168-ff88-459c-972d-3c091c155db2@murena.io>
	 <e780ecb8-918f-4816-99c8-b69b10b25a18@murena.io>
	 <CAAvaLCwvVUddS14MPx0FHdnp+QeZ99+ox17pXt2hSWPTCFcHtw@mail.gmail.com>
	 <cb0884b3-c9be-4cfd-ba43-27add3821ddd@murena.io>
	 <6a5f8c11a092cef83bae8d9ea0100c2fc133a514.camel@icenowy.me>
	 <CAAvaLCxMntrTbTQ9VNu4H_6LA30TRAqi7mCpn+x3hbTG9WqERA@mail.gmail.com>
	 <057d97bd4b63fa4445dd86548f2ecdcbe9c3b1b6.camel@icenowy.me>
	 <f68d95d0-f918-4dee-9443-38c64247b71a@murena.io>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

=E5=9C=A8 2026-09-07=E4=B8=80=E7=9A=84 08:02 +0200=EF=BC=8CMaud Spierings=
=E5=86=99=E9=81=93=EF=BC=9A
> Hi Dominique and Icenowy,
>=20
> On 9/7/26 06:01, Icenowy Zheng wrote:
> > =E5=9C=A8 2026-09-06=E6=97=A5=E7=9A=84 17:16 -0400=EF=BC=8CDominique Be=
lhachemi=E5=86=99=E9=81=93=EF=BC=9A
> > > On Sun, Sep 6, 2026 at 11:19=E2=80=AFAM Icenowy Zheng <uwu@icenowy.me=
>
> > > wrote:
> > > >=20
> > > > =E5=9C=A8 2026-09-06=E6=97=A5=E7=9A=84 16:59 +0200=EF=BC=8CMaud Spi=
erings=E5=86=99=E9=81=93=EF=BC=9A
> > > > > On 9/6/26 07:39, Dominique Belhachemi wrote:
> > > > > > On Sun, Aug 30, 2026 at 10:17=E2=80=AFAM Maud Spierings
> > > > > > <
> > > > > > maud_spierings@murena.io=C2=A0<mailto:maud_spierings@murena.io>=
>
> > > > > > wrote:
> > > > > >=20
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 I was still having some glitching happ=
ening on the
> > > > > > display,
> > > > > > but
> > > > > > I've
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 found the way to fix that, the questio=
n is what is
> > > > > > actually
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 happening here.
> > > > > >=20
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x29590020 <- =
0x00000005
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 This one I have no idea, it is 0x00000=
009 with this
> > > > > > patch
> > > > > > series but
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 with the vendor kernel I get the value=
 above. When I
> > > > > > hook
> > > > > > up my
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 external
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 display (regular 1440p) this becomes 0=
x0000000D on the
> > > > > > vendor
> > > > > > kernel.
> > > > > >=20
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 But I can't find this register being w=
ritten to
> > > > > > anywhere
> > > > > > there?
> > > > > >=20
> > > > > >=20
> > > > > > Maybe this needs to be swapped?
> > > > > >=20
> > > > > > drivers/gpu/drm/bridge/inno-hdmi.c
> > > > > > =C2=A0=C2=A0=C2=A0 -#define v_HSYNC_POLARITY(n)=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((n) << 3)
> > > > > > =C2=A0=C2=A0=C2=A0 -#define v_VSYNC_POLARITY(n)=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((n) << 2)
> > > > > > =C2=A0=C2=A0=C2=A0 +#define v_HSYNC_POLARITY(n)=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((n) << 2)
> > > > > > =C2=A0=C2=A0=C2=A0 +#define v_VSYNC_POLARITY(n)=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((n) << 3)
> > > >=20
> > > > Very weirdly, the original definition here matches current
> > > > mainline
> > > > inno-hdmi.c, but the changed definition matches JH7110 vendor
> > > > inno_hdmi.h [1].
> > > >=20
> > >=20
> > > The vendor code is correct and matches the RK3128 TRM.
> >=20
> > Thanks for the tips on documentation, and I verified this.
> >=20
> > It seems that Rockchip people made this always wrong, even with
> > their
> > pre-DRM display driver... [1]
> >=20
> > BTW I checked the Innosilicon dGPU driver code, and its
> > g3_ne_hdmi.h
> > source file also contains the definition of BIT(3) as VSYNC. (It's
> > quite weird that most logic of that driver is in some .o_shipped
> > blob,
> > but fortunately the g3 logic might be too new to be closed down)
> >=20
> > Thanks,
> > Icenowy
> >=20
> > [1]
> > https://github.com/rockchip-linux/kernel/blob/release-4.4/drivers/video=
/rockchip/hdmi/rockchip-hdmiv1/rockchip_hdmiv1_hw.h#L161
> >=20
> > >=20
> > > HDMI_reg08
> > > =C2=A0=C2=A0=C2=A0=C2=A0 Bit=C2=A0 Attr=C2=A0 Reset=C2=A0 Description
> > > =C2=A0=C2=A0=C2=A0=C2=A0 3=C2=A0=C2=A0=C2=A0 RW=C2=A0=C2=A0=C2=A0 0x0=
=C2=A0=C2=A0=C2=A0 vs_polarity=C2=A0=C2=A0 VSYNC polarity=C2=A0=C2=A0 1'b0:
> > > Negative
> > > 1'b1: Positive
> > > =C2=A0=C2=A0=C2=A0=C2=A0 2=C2=A0=C2=A0=C2=A0 RW=C2=A0=C2=A0=C2=A0 0x0=
=C2=A0=C2=A0=C2=A0 hs_polarity=C2=A0=C2=A0 HSYNC polarity=C2=A0=C2=A0 1'b0:
> > > Negative
> > > 1'b1: Positive
> > >=20
> > > Nobody noticed this so far because in 720p/1080p both polarities
> > > are
> > > positive, but Maud's 3:2 panel has differing H/V polarity.
> > >=20
> > > Best
> > > -Dominique
>=20
> This also solves the devmem behaviour I saw, or well, doesn't realy=20
> explain it but does show what is actually happening. As Icenowy noted
> (maybe that was on telegram only?) the inno-hdmi regs are 8bit
> instead=20
> of 32 bit.
>=20
> What is actually happening is:
>=20
> devmem 0x29590000 b reads 0x29590000 as expected
> but
> devmem 0x29590004 b reads 0x29590001
> devmem 0x29590008 b reads 0x29590002
> ....
> devmem 0x29590020 b reads 0x29590008
>=20
> For some reason the addressing is weird?
>=20
> With this change, the assigned clock change and removing the=20
> v_REG_CLK_INV | v_REG_CLK_SOURCE_SYS write to HDMI_SYS_CTRL, the
> display=20
> comes up from the start as it should!

Well I checked the RK3128 TRM for these two bits, and their field
descriptions are -- "reserved".

What can I react...

Thanks,
Icenowy

>=20
> Kind regards,
> Maud
