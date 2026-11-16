Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826875;
	b=Y9viqYRACTKIpfPqakARtjaBJVUpF0sFvYOWA1+3P9h6bvftOS3zsS0oMBYTA884yPSA
	 tNj1O9sbOqMt99C7knvKSELdN08wtzZ15f/DUvlm13eVP29J+XlAgCHiQBsMGKjOVrA4V
	 QFas2z8rKI9D5JarmmhjO1FnnsEjyrfjGf3fQCwI8mGxAHUVkCrADcrvITQaB/LnjUaRF
	 fR1QrJikZtMchUNgLdmP/YfepS4URFhzmzkLOmSWxmk+xG0W0X4qO7iqrswVcgFClgtjC
	 +AUm4rLeBrnoLfFSKg6CeWed6qSR/wEMAQgm8rmMzHjeiazlyYfh6O0mF8Z3sccqRFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=PO8kzyBm9V5PzLhTMJiyGSgb8yl8oDzcJ3dWIao7QlY=;
	b=MH9S5WzweH+4mEsl11DLRkeOw73vZPj9vLTPX9GhWV8e817WEJNuYX81h1d2qO/46uRD
	 iA+h3/y027+cAdFo14tLWMXdGkYqry2YxWjiVMSzbb8KuYwsGG8sGypRnfSpwP77ZpAuK
	 P9Wu45bwD7RCI+baL1kF4H0GR3cIUrPgJrgxn0WK1ipcPO2IY9zgVygs/Xh3DkX8bJssA
	 glhW48d22kv6DG4v0MYqEjNU62KgdiLaOXiIyaS2JO1Ah7YN7Mxli7u06YlJJDfHbzLVw
	 dizFOa+QeB2SB8zAv1eVt+79r6Br2cke3GhFtOq9KFouEWuZ0uVjNFANPliYm9XQ6uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=SvotkKRl;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6811E606A334
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 11:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6811E606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=SvotkKRl
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b65d69f5c2so4641692a12.3
        for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 03:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794826873; x=1795431673; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PO8kzyBm9V5PzLhTMJiyGSgb8yl8oDzcJ3dWIao7QlY=;
        b=SvotkKRlYBvwtIFWsX8nRzjtx/PzkSgkwTPAjzhHDPZbgzyc//SjhL3Da1P/qC8Z6M
         KfC65hlK1ug1C9hhXyMscIf1OtiNcuApPmhy8IovSx5LQk6xiSxawQ8rrU4Gt+Q45krb
         BCWAfTIAAbRSvtGro0l8FfuMwk8syj8t6LDfS63dghDVCmmH0hBQ8AjHf5D4a5vkDIza
         IWMIqfrtfRsjsk183LcRkcpEylAhLhz/qeo5hyzpSV2Lh1EDmupHS6ySwIJ5/m8Cu/RD
         166FXiA1HVe7HcxJTyaF1RhFCGZfQxg/4AUibgcqjpcbboqRqF4wz2h1daCYqgoJz/Pl
         F3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826873; x=1795431673;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PO8kzyBm9V5PzLhTMJiyGSgb8yl8oDzcJ3dWIao7QlY=;
        b=yFGySCMt4PEQ14pQg13Rwu4zeThTYzClXxrwMQtJ5aCsVMrdfGJoNj3H1xa7QDDwda
         9nF1XWlnvgpaSFfdzLULcgOe+fVFWHYuTRKLZW/sXh8CizRxHyK6S/ajYM78hwVu/AU8
         0UrpkasXAIKpeg5oyf7AatfSZfEqWLQQUKGuDuFGKi6n4I4lwD8SYnkRK0wfnkRQGhjN
         0ICnsEB4EGdsJIEfNt7G0EuDe71lzLSIK6CZfKggIcP+0hpGtbj5t6YUt8rEUGIEIWDL
         c7HtaiykWfKqAmOy2ViQJeE1n18SqdcGnb46g/lG+UptWgsXP+BXC4YXlgl01Z0BJFbd
         qylg==
X-Forwarded-Encrypted: i=1; AL+hErGLDX9Xvh2wcLjg88HjvKZ/6DXC1GCZgWlvxKdMoxTpSFFbQfoJeBsDn7nYgx/1cL4E+gDBGgoOEGU=@vger.kernel.org
X-Gm-Message-State: APuU4Z81ZjJ/pmfFQ/iVzCoDchJHljCidK0XyR4gPKtvI26LwAupeTeV
	Mx34fDrdnlmBN1yA9FIBDwOVtJj4cGPPCefspxxe7+uvo/ib8lJ6dG4gvdlQgV8fAEw=
X-Gm-Gg: AYBFou2WlYUQ8XMQwC6KeJDNZbQCd2MNYo1mwZs+V3+gVvlvfzshrdhUcDvhvW+hno6
	ME7l/PLVg+XT/mQYVLmSp/RtMOPLib+GWhYXjclRSukKiUhTRCDnTBKOCvEphsT1lCwr6sGH3zx
	oW9UmB8N8KMziiZ45T7YcsS/3XSKo2T8+ZzyLAZ1y0fr19MJlmPni9pOo0Edb0XOfPJyL7MFC1r
	kZGfrztrjRTuW2G7zEMJk4EnnDhj2AapihcYpnwLBIzSNeByNXDy5Y8f4XXq76vy+9j31vse8O8
	Yp92fyiP+42+PLrydXxKJhi8YWyCllG56jGcPMjJ+IPslVM8ydvi4b7gU3Ob3vx5pNaYmOEeQck
	ONFfiSreOhX0ljKN3YjIBPCnUttEXWiqwrvK1AfSkD/L5itpXFO/h2Fk0R+sWUL4G3sv/XvS3RC
	hIhJjHpa9bfp8rtoKkJcTDP2WxpywL6qBbKSSeEYuThajGYqwbDZoCD3ihOk30YDYkkjlB/AC4L
	xzg5cJcmroMQ0wy/nDBnsJ1XTIHFjuxzO3W/DUDn8ut+7rlzpPNj/PnUm3JAEo+y/EsWTIr13FP
	nOJV19MC803i9k8xuaaHrOOaABU0nkmqjPVLVBBSOy6ex6U5
X-Received: by 2002:a05:6402:4024:b0:6b6:4dcd:968c with SMTP id 4fb4d7f45d1cf-6b7c0997f8fmr7094170a12.16.1794826872584;
        Mon, 16 Nov 2026 03:01:12 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c69406640sm21221288f8f.12.2026.11.16.03.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:01:10 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Brian Masney <bmasney@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v1 2/6] clk: starfive: jh71x0: Move reset controller
 registration to jh71x0 common code
In-Reply-To: <ZQ4PR01MB1202C1DD9DE098DB4674A940F27C2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20261013102707.9207-1-changhuang.liang@starfivetech.com>
 <20261013102707.9207-3-changhuang.liang@starfivetech.com>
 <179475230833.3873592.13070196353304136001.b4-review@b4>
 <ZQ4PR01MB1202C1DD9DE098DB4674A940F27C2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Date: Mon, 16 Nov 2026 12:01:09 +0100
Message-ID: <1jqzgl2g7e.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On lun. 16 nov. 2026 at 08:01, Changhuang Liang <changhuang.liang@starfivetech.com> wrote:

> Hi, Jerome
>
>> > jh7110_reset_controller_register() is only tied to the JH7110 system
>> > clock driver by its location. Its logic is generic: hand the CRG
>> > register base to the reset driver through an auxiliary device.
>> >
>> > Move it to clk-starfive-jh71x0.c as jh71x0_reset_controller_register()
>> > so that the clock drivers of other StarFive SoCs can reuse it, and
>> > make
>> > CLK_STARFIVE_JH71X0 select AUXILIARY_BUS accordingly.
>> >
>> > While at it, replace the open-coded auxiliary device allocation, init,
>> > add and release handling with devm_auxiliary_device_create(), which
>> > already implements all of it. The register base is now passed to the
>> > reset driver as platform data of the auxiliary device, so struct
>> > jh71x0_reset_adev and the embedded auxiliary device go away.
>> >
>> > The auxiliary device ID is dropped: every CRG already uses a distinct
>> > auxiliary device name, so the ID is not needed to keep the device
>> > names unique, and it is always 0 now.
>> >
>> > Since the helper now lives in clk-starfive-jh71x0.c, the auxiliary
>> > device names are prefixed with "clk_starfive_jh71x0" instead of
>> > "clk_starfive_jh7110_sys". Update the auxiliary_device_id table of the
>> > JH7110 reset driver in the same patch to keep the tree bisectable.
>> >
>> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>> > ---
>> >  drivers/clk/starfive/Kconfig                  |  2 +-
>> >  .../clk/starfive/clk-starfive-jh7110-aon.c    |  2 +-
>> >  .../clk/starfive/clk-starfive-jh7110-isp.c    |  2 +-
>> >  .../clk/starfive/clk-starfive-jh7110-stg.c    |  2 +-
>> >  .../clk/starfive/clk-starfive-jh7110-sys.c    | 59 +------------------
>> >  .../clk/starfive/clk-starfive-jh7110-vout.c   |  2 +-
>> >  drivers/clk/starfive/clk-starfive-jh7110.h    |  4 --
>> >  drivers/clk/starfive/clk-starfive-jh71x0.c    | 24 ++++++++
>> >  drivers/clk/starfive/clk-starfive-jh71x0.h    |  2 +
>> >  .../reset/starfive/reset-starfive-jh7110.c    | 19 +++---
>> >  include/soc/starfive/reset-starfive-jh71x0.h  | 10 ++--
>> >  11 files changed, 45 insertions(+), 83 deletions(-)
>> >
>> > diff --git a/drivers/clk/starfive/Kconfig
>> > b/drivers/clk/starfive/Kconfig index bd29358ffeec..51716655554f 100644
>> > --- a/drivers/clk/starfive/Kconfig
>> > +++ b/drivers/clk/starfive/Kconfig
>> > @@ -2,6 +2,7 @@
>> >
>> >  config CLK_STARFIVE_JH71X0
>> >  	bool
>> > +	select AUXILIARY_BUS
>> >
>> >  config CLK_STARFIVE_JH7100
>> >  	bool "StarFive JH7100 clock support"
>> > @@ -32,7 +33,6 @@ config CLK_STARFIVE_JH7110_PLL  config
>> > CLK_STARFIVE_JH7110_SYS
>> >  	bool "StarFive JH7110 system clock support"
>> >  	depends on ARCH_STARFIVE || COMPILE_TEST
>> > -	select AUXILIARY_BUS
>> >  	select CLK_STARFIVE_JH71X0
>> >  	select RESET_STARFIVE_JH7110 if RESET_CONTROLLER
>> 
>> You've switched to imply for the new controller you are introducing later in
>> this series.
>> You should probably be consistent and align this one too. Not in this change
>> though, it would be unrelated.
>
> I'm not going to put this suggestion into the current series for now. I plan to send it 
> as a separate patch later. Do you think that's okay?

Ok

>
>> 
>> This change otherwise looks good to me. It requires Philipp's opinion as it is
>> touching reset too.
>> 
>> --
>> Jerome
>
> Best Regards,
> Changhuang
>

-- 
Jerome
