Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7C4350D42
	for <linux-clk@vger.kernel.org>; Fri, 23 Jan 2026 11:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769168383; cv=pass; b=fvr0oS6u51CPPnrX6ObAGMrNjqF3MB20S2S4KS/edD+MSSYWzRgt978r3xMpaM6x8l0qlPrF9sHksm9TR6jXr0Pse94GOncDR6D0EyffOMLD3Q+9GOFE0TPQgC+W0lo7iUTw7SWonmel0Vcz8do1lj2dheKEc1OYiAZ9o9SkUuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769168383; c=relaxed/simple;
	bh=aisLc2ieM5f1wTihT8PCwhs96cakpU8DJktm3rN7jzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UzvYzuZUIZE4lmMw1rj+50VvH+Lr1K2Mho6jtMbHjJk8CjjD6tnssx38Vhx2ziLGuXUlgiBt42QhVABF+WP1mfTossXrEb1QuisjkvRGrR2CemTZmJFwwJ7omOTH7dFJMwn2myto8oH4Fl0ra6GkDJQJXzOIrGKe9g6ZQKr/o9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=awxm0fyh; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="awxm0fyh"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4358fb60802so1206897f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 23 Jan 2026 03:39:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769168376; cv=none;
        d=google.com; s=arc-20240605;
        b=LFW6/YKxU+2aGWDYiMoX9qtMyXH+HBZno52iIks8WMzfXsqyCWAfLAcAGBvCGOCDhX
         1ICGUMmWiDEIbA0l6sU+Bbap1xR054YAgrU7nnygZeRaQsOEWwdbgEFcmBKU1T8e0TYL
         gEwsIWbHorseuCAC9+WyS5koI4N1b6OaJl2Ut3n02ROq3p/5+QjSqlTbfeLKXpbO2SG+
         3BlV/ZkTK8awAYy6aBakZrdeHXhwqubTDCRZFD5CbpWHwuEP1DQHKF66H/ZL370ZeyUu
         kFjAgw9AsF1A2E7Ej1z4Tb4P2gRFEJztDXozMnVdz9raSYCI2nxgRVduasNQysrV+lMf
         s1ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aisLc2ieM5f1wTihT8PCwhs96cakpU8DJktm3rN7jzE=;
        fh=ztmpBotUg/8tuNW1PJOoC849iVbU9DCOzVNsBdNwj18=;
        b=VS7CjcWxiXD4D1VCBcG6eNlG7AD3oU553zC5Hh+QETKhyHOwlovGlebeyBCChMyyq5
         WCGbumSRkSpmAM91Z+GL1koXOkNwzNFgHymfkblLcUSEKk3i7kmKCyn9ici82gC9Iorm
         EesBXI2DijQF7hOFR9hJVfAcdCRNT7Vqm5454gsEkCjh3QPlzFzTQAypEG9ZOdyrknFU
         FQn1S/Yf3TzLTeYAHH6AQmadt2+lKfXvDSPwcunV6+aJl93xeKgHaOlq9ROleC+vpAJx
         iGyvAZ46zTY0HhUt65w6j4EZDFxu/uaETlJHjphG/MwGT5eeXY8FM1WOYyU/42DxZaj/
         24Vg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769168376; x=1769773176; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aisLc2ieM5f1wTihT8PCwhs96cakpU8DJktm3rN7jzE=;
        b=awxm0fyh/ZuqSBJYDoyOrvalD2PTMdShhFS5lFlTUkzxdPCgj4vDnskcz+OY8H2NKx
         RF6a/PkK5l8UOMmu4I6gNf8LVzTk58x1Z6ztbSpBWclkK3hu5G48x06ZF7KaKHLjw80q
         0cLEtRETx1w35OlP6pf+Fa8hZn+sbzBlGxp3wa1Z0pSNpXmcsg6Xbulh/dwXfOJ2DR5h
         sRB54auc0BeL+U91KMGU0Y/4leHeewREx9Tz0zhEIrvjfuISZEX/sXqWezZfaxGWjEQc
         YJkLfgxWjzP489vpPygx3Cjvye5KnSD8edaxL4DJpTBqfZoIZ8mxLlAgPI0mRixsB9Hd
         v6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769168376; x=1769773176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aisLc2ieM5f1wTihT8PCwhs96cakpU8DJktm3rN7jzE=;
        b=PM6PYyeRZCEp2ia5mEIUaaw+Mkvwq6opxVeQgv3jR7tehfUmovZ7QYSVvVd256h1XJ
         pAkdOsBIBGLGbeCwQjlwWijN3kIaQeDbQLrdrjO/VUboZO6uCzfGBpC2vH3E8m2nxgCm
         g+PiUCSDp4SGiTsf6Fjfb6mt/aO71KsRQ0UDqdHScy+8fotaq2fkahmla1jOEs4tum6q
         KNtT0TZFAynFC+a5RuWo1/nKRhQ0yI+qr2T5RVo07m7iKiMJO5Ds5pgprXAa4tCIK89r
         gUU8GKQiwmvhh4aFySi+PfWIpgdJ/aBq2/fWBeW4r8AU6uVFS1yuQ8u7jo+GZZY8M1aD
         MSRg==
X-Forwarded-Encrypted: i=1; AJvYcCV5N8+4Fp7jbcfyGDO4Vg0+lksHt6lKiJPXqUAMkNtzVTPxfjK8Ve8Um9YFjvdNmQYd78ZYNItll+w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAL6j8GfdG7UX4JBiOeZOqxX02Gv/GFIrDnk35E1k0kZ+UbPbA
	gTqlabwi9fsFm8zsLubH2gLHBqJAelYs+nB84z3EAKons3798iwhCPGlIihoQg2YiaoizMzZrjb
	ggf3zmkHSVoZ/CgfjPL15aajg/b1K0TI=
X-Gm-Gg: AZuq6aJHAlTKxEwAQdOEUAGpegB5MLJUvchi0C0wM7fWGdPHYGzC2OyW2hcOt91SON0
	CnSsokixkvmLENd1C2wqzpiIoFdqnulgWniYLuAkaf1jbf4vlua7F9LlXU1WcNnr7xpCM1W6MCe
	oa5J2QZHUZwpsDt6GNXOxnBCA/cgP+K/ar0t7CHO27psWUV+hNpf9IlwR860wS3h/o3P6BMcFq3
	EuXP9BFyvAqu1ZutOog7suujT9Q9Yz3P1BRpNbJncMl74YI2wBSIPTNOkkwfitI2JWTEBwhCzOc
	Ba8NHbMwPNgDKYaQIyz4p9cGGg6drXKS5ENazF1W4eBgyRg/pE9dV15yoHyRn/lIi+MyETslphC
	kOZ7PWiC7p8bpPg==
X-Received: by 2002:a05:6000:400a:b0:431:2ff:128f with SMTP id
 ffacd0b85a97d-435b1ab836dmr4926768f8f.6.1769168375446; Fri, 23 Jan 2026
 03:39:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114153337.46765-1-john.madieu.xa@bp.renesas.com>
 <20260114153337.46765-4-john.madieu.xa@bp.renesas.com> <CAMuHMdXAAUe_0kboQ9C0AMPn5re-1kCagecp1fMCGramDpXGRA@mail.gmail.com>
 <TY6PR01MB17377AE5807504FFB6594471AFF89A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
 <TY6PR01MB1737738E302D0BA716AAA2650FF97A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
 <CAMuHMdXk6A2-isnLQCgrjjWRX=pYKbUvVz-nfDwy72i1qo1-rA@mail.gmail.com> <TY6PR01MB173770856BD4044A79150F6E8FF94A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
In-Reply-To: <TY6PR01MB173770856BD4044A79150F6E8FF94A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 23 Jan 2026 11:39:09 +0000
X-Gm-Features: AZwV_Qi1ncDRUlLnXwWZ1l-P3_ht124RPLuPAwvq1Re_E8LiTcuyHXUL4gel0CA
Message-ID: <CA+V-a8uNpNPCyePQrRDQxaGfN2gZE3-2VvCMs3FOqFaU3mKjLw@mail.gmail.com>
Subject: Re: [PATCH 03/16] clk: renesas: rzv2h-cpg: Add support for init_off clocks
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: geert <geert@linux-m68k.org>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>, 
	"mani@kernel.org" <mani@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "magnus.damm" <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "john.madieu@gmail.com" <john.madieu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi John,

On Fri, Jan 23, 2026 at 11:29=E2=80=AFAM John Madieu
<john.madieu.xa@bp.renesas.com> wrote:
>
> Hi Geert,
>
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: Thursday, January 22, 2026 5:29 PM
> > To: John Madieu <john.madieu.xa@bp.renesas.com>
> > Subject: Re: [PATCH 03/16] clk: renesas: rzv2h-cpg: Add support for
> > init_off clocks
> >
> > Hi John,
> >
> > On Thu, 22 Jan 2026 at 17:21, John Madieu <john.madieu.xa@bp.renesas.co=
m>
> > wrote:
> > > > From: John Madieu
> > > > > From: Geert Uytterhoeven <geert@linux-m68k.org> On Wed, 14 Jan
> > > > > 2026 at 16:36, John Madieu <john.madieu.xa@bp.renesas.com>
> > > > > wrote:
> > > > > > Some peripherals may be left enabled by the bootloader but
> > > > > > should be explicitly disabled by the kernel to ensure a known
> > initial state.
> > > > > > This is particularly important for PCIe which requires proper
> > > > > > initialization sequencing.
> > > > > >
> > > > > > Add new macros DEF_MOD_INIT_OFF() to declare module clocks that
> > > > > > should be turned off during CPG probe if found in the opposite
> > state.
> > > > > >
> > > > > > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > > > >
> > > > > Thanks for your patch!
> > > > >
> > > > > LGTM, so
> > > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > >
> > > > > However, I am still wondering if there are any possible bad side
> > > > > effects of disabling the PCIe clocks, e.g. when PCIe is in use
> > > > > (network card, SATA card, ...)?
> > > >
> > > > I'll test and let you know.
> > >
> > > I finally did the test, disabling the PCIe clocks while a WiFi module
> > > connected was performing pings. System got stuck, unusable until next
> > > reboot.
> > >
> > > Was that the kind of test you were expecting or did you have a
> > > specific scenario you can share.
> >
> > Not really. I was thinking about a scenario where the bootloader would
> > configure and use the PCIe device, then transfer control to Linux.
> >
>
> I can't answer to this exact scenario right now.
>
> The idea of these init_off was from the PCIe host HW manual,
> Explicitly requiring tuning the clock off and asserting the reset
> as part of its steps, while this is not the case for other IPs.
>
Can the PCIe driver not handle it? ie in the probe explicitly turn off
the clocks + assert reset + continue further (do you see any issue
while doing this from the PCIe driver)?

Cheers,
Prabhakar
