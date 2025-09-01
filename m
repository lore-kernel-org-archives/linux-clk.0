Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5F32F37;
	Mon,  1 Sep 2025 00:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756687592; cv=none; b=MMT19iK80ZGWWS1OKXqb1a67wq7xSl+G37uKhxJ5N1Ieevurw5Buj1RaDXmCd3dUKQlWfFvj+cUJms+g22vD8pf2TwEa4676tBLAt4IW8lun3OzonJBwAnngQuSoSvTu4gHk9/AyfgZHf46nzQkiAqV7YudP2BMg7OY7waOm40M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756687592; c=relaxed/simple;
	bh=LJ9GAsj4wRBSuTPUCfudh2FqI6Sygd5HE/K6HnaBUmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a5VJzt2FmOBV57Owb2bIiGFO3OHm5qIk3o1ihmpsVED/KP+TKO4C6BKmbCMCKYXCWz5QHsOvFPiYQgevaqp6n7kc0OfXK9X4/hXu9M3rV1uuW67HlDutYNeiQ4+7YJrdUQNRn/iYZ24rfyC9rVDTbQ2bmLpFmMcw6+BItDFp+OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XCV45I5N; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XCV45I5N"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-61ca9a5b41bso4929808a12.1;
        Sun, 31 Aug 2025 17:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756687589; x=1757292389; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=caq28f0MR5Zp2zVT+QmZvY0xnQl9VUoGhuuYwcNrVy8=;
        b=XCV45I5N0IbMwLcflw586M75XVvbmjNdCZJf9GjUbVIqJoBbuQMumzvnTWA/EoucIW
         EmmQDJxWKcP4dn34h5sHZKfbvaZwlybEd+tKRBeKbUjuqwn/oOzVVvIfCLpd8S/T5hTF
         I8aDj80ozxYhgudDC1GJMNuXXZ5cTTv13R3mB2OES17jLRJw68VRAINoPCS8FBWsbrkj
         SBODuVJQ1m6WjUgdEJTy5nMwiQJvRNk2spDkB/wOjQVuvHKGcpvvzH68nyYsiTWxn1f3
         pYNivX41vzPtXLqpfPTI+4kK2Mi2SloXTaEGTHzrcbAMxFG0NLCjy9huq+/vGl93Z5uL
         +onA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756687589; x=1757292389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=caq28f0MR5Zp2zVT+QmZvY0xnQl9VUoGhuuYwcNrVy8=;
        b=FEm8vTsaVCxsURErnFTPEEUPKiNKEsmDqNlu4XuS9yeT0RDAhI95ce2pkNbelMnRSF
         dlRP5I6DeS5xI7ENJJwM81/ZUe5FTGj4gNL1I/XKhDWA14CfOLgKT3OnXoBXgqCGaoLT
         xwVCUuC/wJKZoahPHzz+Tu3lMQ8onuPtHc6MstZlpDn+0fTtcTNzbXRFLsaTJqfDCu6o
         mMbuxAQ1He2FBFnw1UBGLtpb8H9QylRQdtEbx7Y0GoXHIDH687EcsQrJuGyDtCdYoitJ
         Owav48/dONxpBdZRogiRiyArwnjHm+a8XZHLKzrXnQ8Q95hNosgeLbK0LM/K7Fxo9CQv
         3b3A==
X-Forwarded-Encrypted: i=1; AJvYcCX67ryS5Nc0tZc9RyuMqifkEg4MXXgJ5LrS4U9huHl96uz70LbAnjlojvF2AV/cRocrVP1PjMNVC3Gp@vger.kernel.org, AJvYcCXHi+j9UZmWHsvpBB0Y/cwXmQievHM/SykvifR+r9WOjVYNgsjMTKzUHekIq/ViwDwW6JROYg+elVx7@vger.kernel.org
X-Gm-Message-State: AOJu0YzpfoCfZHHLaGlVS75dTMSl9/LlX8a4ugnfmFnwRO1DEIFJWozG
	+4pPi1b9kiyyh0hxyQ587o4+94EOgYCH4QKd8CCyDoN3u2g8F1DmLWy2GusrpPxGHMZP4CDXybX
	B7ao4Qm+o66P5xRb1W5OFQS5R7HNVc3iU+5Bk6cGR4xRt
X-Gm-Gg: ASbGncvetgFOrg7Eflx8Ea2OtTOkytdt6PgVUodcJ54AXbsiS9hnff8sVQfM3QciIbd
	OToc7+kmumetIBi/nmKg0FCCsHdH9DnUXMlR59VoDGfzYjjlCUNcD9L0EOZviATbHGzffrlOlqz
	UFBAXB8vjL4HLSMlG5If2Mb/KZ2p5pBSc3b4K8oKsEVX5IrymmLmAqxC8igiJFBVXNjvVaV34HP
	4WiMsWW1+pYFg==
X-Google-Smtp-Source: AGHT+IHK3Leq+3fJeu89rJWaErCRBW5RO5impY2LzaF/J9OxH2CGpEFncXZ0kPXeWO36QfuOyJpThlBtVSnMBaPVn+c=
X-Received: by 2002:a05:6402:42cc:b0:618:38d6:7819 with SMTP id
 4fb4d7f45d1cf-61d26d78d3cmr5362734a12.21.1756687589297; Sun, 31 Aug 2025
 17:46:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250831104855.45883-1-cn.liweihao@gmail.com> <22816630.EfDdHjke4D@diego>
In-Reply-To: <22816630.EfDdHjke4D@diego>
From: =?UTF-8?B?5p2O57u06LGq?= <cn.liweihao@gmail.com>
Date: Mon, 1 Sep 2025 08:46:18 +0800
X-Gm-Features: Ac12FXyd3Kd-w_dxJLbuguLcQGoKS7dFJvAoLApW6pAwLmBXGkKQ-alchoyDVCE
Message-ID: <CAPEOAkSm+6WtzSL1GzU_srHQT0ZBKKoFD1v5+ePqHTPBndPS=g@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] drm/rockchip: Add MIPI DSI support for RK3368
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: robh@kernel.org, hjc@rock-chips.com, andy.yan@rock-chips.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Heiko St=C3=BCbner <heiko@sntech.de> =E4=BA=8E2025=E5=B9=B48=E6=9C=8831=E6=
=97=A5=E5=91=A8=E6=97=A5 23:10=E5=86=99=E9=81=93=EF=BC=9A

>
> Hi,
>
> Am Sonntag, 31. August 2025, 12:48:48 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb WeiHao Li:
> > This series adds MIPI DSI support for the Rockchip RK3368 SoC, enabling
> > native display connectivity through the MIPI DSI host controller and
> > PHY. The changes span multiple subsystems, including clock control,
> > DRM/VOP integration, DSI controller binding, and PHY driver updates.
> >
> > Key changes:
> >   - Update the Rockchip MIPI DSI PHY driver to preperly handle RK3368
> >     phy initialization.
>
> which patch is doing this, because I don't see any phy-related change
>

The first patch, changes for dw-mipi-dsi-rockchip.c, some settings for
mipi dphy.

Maybe I should adjust the description, it's a bit unclear.

> >   - Add missing lut_size of vop_data for RK3368.
> >   - Add missing clock ID SCLK_MIPIDSI_24M to the RK3368 CRU driver,
> >     which is required for enabling the 24MHz reference clock.
> >   - Add MIPI DSI node to rk3368.dtsi with correct clocks, resets,
> >     and register mappings.
> >
> > These changes were tested on a RK3368-based board with a MIPI DSI
> > panel [1]. The display boots successfully with console output.
> >
> > [1] https://ieiao.github.io/wiki/embedded-dev/rockchip/rk3368
>
> Do you plan on submitting this board to mainline?
> Because having an actual user of the code you're adding would
> be really really nice.
>

I'd be happy to submit this board support.

However, after searching for a while, I couldn't find the manufacturer
information of this device and mipi dsi panel. I am not sure whether
the devicetree support of unknown manufacturers allows submission to
mainline.


> Thanks
> Heiko
>
> >
> > Tested-by: WeiHao Li <cn.liweihao@gmail.com>
> > Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
> >
> > WeiHao Li (7):
> >   drm/rockchip: dsi: Add support for RK3368
> >   drm/rockchip: vop: add lut_size for RK3368 vop_data
> >   dt-bindings: clock: rk3368: Add SCLK_MIPIDSI_24M
> >   clk: rockchip: use clock ids for SCLK_MIPIDSI_24M on rk3368
> >   ARM: dts: rockchip: Add display subsystem for RK3368
> >   ARM: dts: rockchip: Add D-PHY for RK3368
> >   ARM: dts: rockchip: Add DSI for RK3368
> >
> >  arch/arm64/boot/dts/rockchip/rk3368.dtsi      | 79 +++++++++++++++++++
> >  drivers/clk/rockchip/clk-rk3368.c             |  2 +-
> >  .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 20 +++++
> >  drivers/gpu/drm/rockchip/rockchip_vop_reg.c   |  1 +
> >  include/dt-bindings/clock/rk3368-cru.h        |  1 +
> >  5 files changed, 102 insertions(+), 1 deletion(-)
> >
> >
>
>
>
>

Best regards,
WeiHao
