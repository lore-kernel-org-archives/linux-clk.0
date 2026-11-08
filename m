Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794156432;
	b=aLHbrHg+HCgeK+FY/8/R4Zx6NO3jd1yznLyWqTfiw0QAS+kHlASxlsupSBJ/SkPDxnz1
	 tmfoXstsRD1lgCXxl0sYu7/WS6JGmo7ao96fLLm2ubiTEcoKUHf7a/UIG6cSCYJeOFtRB
	 jbkcGAG3THMUZ7xo21RI2AfYAGsaQ8kY7qA885HLKcu0wKJ5ubiAFWubxtwyeoEVxhluh
	 oklUDlom8HWJNuvKZ3gUrYB/X+aUUrMtOEv30yxmuqmZOFD9QchKseahKxGnhAIRmubBI
	 wEuhTdt9qNHjBSeKaQfznenpsCSGYjf+5ziy1qR1FWa7KLJANKp4FHdBg7zDxzSCqZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794156432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=r7i5HS1agzi9a9cyD3qvLBRlAYW8TYHB/KLXRsgrFvw=;
	b=baav6KAXwgYAAdSUqOPkrTgd/KFCh9NbzJNCwSy1ZyEtWeo7azg7mCZiT9ejGRevTpbL
	 Yo7CmikxXlQAtomO3Rw8c+K1vzQ6LCLz4gPT5cvIR7UOL1vRQtiTtLzX0fpJvVxaBP5bx
	 wWV69OuP00Anlrusjf5ZDKqYM3/jZm4fnZccFW4fmwQyPJmkhuhI/1PZqktSyJwN/Xw6u
	 EGubSSUn4EEpGfmf9TbdYFsOQAnF7/l7bnO5i8/NI8qjNoE52rH6pcBoz+LHAfZXo7Azh
	 8bXSwCmrTfrqNE74FRsXzockRCiDZYGRklR+TwMH2CDsYmTvUH4hcj/L6dqVn9WhyNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VslSLkPt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FF8606A321
	for <linux-clk@vger.kernel.org>; Sun,  8 Nov 2026 16:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97FF8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VslSLkPt
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b612fd74e1so37770b3a.0
        for <linux-clk@vger.kernel.org>; Sun, 08 Nov 2026 08:47:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794156431; cv=none;
        d=google.com; s=arc-20260327;
        b=XGwulrXPMAHIT+DgBErA9oe20Ho40LtZq6THRa8KNVK+x2zrwbW+dJAOTXQ8/lUK7N
         YcPSRndnK/mH37Pu5WliSYPD0ULBIx6zwYkWKPvhzf/FUaEZTgfpeJ6fvcAeEJGZb8cB
         shDdQMoDYfgTdK4Xud7zunheLomviFZYqTH7jCm9EYGsMuggQTg31e4r6wbje9o40ntF
         oQZgfOx7NN3spS7zni8/6ciuitGh1a1u72FjnM7FA3I45uo7Ey9ZE2mdO49W/InqHRkb
         NhDos904e7WGGFRZEOMnq4olU8pmZunY5PvMKd6Rzc4hRgDIgeim73vFLeYobtJw4dmR
         KCpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r7i5HS1agzi9a9cyD3qvLBRlAYW8TYHB/KLXRsgrFvw=;
        fh=GETTHMxdT2x+95mM7Il4EYBqk6HEJbouhsgIJn4GcN4=;
        b=S83q4i4uV0LWz7aH8ZkltICT9NykCkbPaP5N0q0H3JtCpDVYVXrEBpd4CSZX3xjqef
         Vjwx1BQztccSH+DlDy8DSK2jt8bVeDjysSi1voYifPd9C3BZ95HJAML1weMTLmjHvTcR
         vd9Og5XVfWZ9mrViFrdnZdlYt006IRmKSZO3eyJCBOt2TrpeXo/7aH4jipUURntlo84Z
         s4S8XlyvBPYhK1MGz4s4Uj3sfHOsM/ISiOfYhdu8gSBPegl7a3vkl5imAruDHCiMTQrJ
         UlqlR/LPO0Oq0oGcV+71Y7bUKTP6sJ9X6deDmA+1ME5XYGXnNhNbDnJqUaNGld2yHWOF
         QR5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794156431; x=1794761231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r7i5HS1agzi9a9cyD3qvLBRlAYW8TYHB/KLXRsgrFvw=;
        b=VslSLkPt41g9hvB0sJB8LEaUD7FB2blU4ynOh4sgrwEMc/XfwMRdj+lcEBf+F3jAHD
         ef714OwL94V0cAlf0nY9MZTVAmaFN62NHFOC6YotOo0OR65idRY8SwGIFNjUlccMdBR/
         tssTM9SKa6Nt86FneUnN0RWQuTYrlC1iB3QoEsApkB6g3vJTETsb8uFIPjaDtcGRIGlD
         IxJdShtFrash7+wfHb4rgLKezkDkIrmqvxMRMG+AFOVmcvp0RWocsc0syXO1+sJ+nE79
         elwWb+u15oQpBooKO+bJe3rrrjNB5Z3HkNlXVPWhAH+IRgMBWGrufxRmxGBkfVGRF/Xg
         UGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794156431; x=1794761231;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r7i5HS1agzi9a9cyD3qvLBRlAYW8TYHB/KLXRsgrFvw=;
        b=sNwqpVsXaHn9Xe4O2M5TvJOMUtNU0asMrhUU1u/7MqBYqSGYAmP34/hDSLId8UiMNR
         ccWSKlltqAThjtNiUoLHRQZgg52M8myI3R2vWkPmY7z/t1MkhLg/AX+DB4yTq/4w99l+
         M5rbRp67QdCa5LYahw2Vs/4oeyFzvoiTxTR6dR/kdDV+EYAMg+l6PowL6a+SdFvQUnNw
         mkjk8N90ba9JyZgc5oE5PMhgQSf5bV6knArFC7vnU56Gv/17+NO/2mmnd42JMFK3jBFX
         jhQir259O8mGr/QIiumslKINo6sCTSJ+0yuGFNkc1hcTG3/UYeO6n+8SLvtvPGHeKWXL
         ZmZQ==
X-Forwarded-Encrypted: i=1; AL+hErGKf1lUNbZ8TstF/4zmP+u7oRq5+tGXy+Iyfiz57mcYr1G8clJhC3sfICNYnqQNePUE77XlOXFogX0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8c6ASUDvTGsMFs933aJAco0Tie6naV4rUlQtdRVTEPS18cAaFs
	nEvQmSALeE699UG4grBHVMxGW3lpTui58Ll8x7iXOaEI/FFx4rEg+lR4MhNphKrOCYzEcU/gfB0
	HVosbkqi0KpFOHSqgffIHZmfCxTcOX5E=
X-Gm-Gg: AYBFou0wkFz5vz/ZmwESTkluMjYiTWou4vGPxSP1W/wjmLeauK6YqVJjMHCAvUvRg3w
	D+uMBJxYVacZuqq1qW2JP70p7Zd32kVJKnSGrXyqOP+63Sm7A3LNSfhdXMyaqR4kevv4SR1IoJL
	MCDbCfrJ9Tzk6sodghj1LpOwzcm+xtmVU485x6AUgE4Urs3bUiTAMNh7Gf7SeYKbsGAL1+FgvmD
	ymjSuyKNI92VQD+LCPFJM/BQBctH/7Cj+GxwFgX0Q2EUeDgboo67u7oUpy6VNaFuoHcKEFS8Cep
	qeqy2+qfM5IvRsbaP/TeF16QEMBrr7JFzN5PGXi3FuzlhXNF4Mc0kkR8Y1R8a8t+OK0NCaBI67V
	sIPyk9Qp1z20k4dvlF3DWfsKupgdX3laUh5Vayel91wmknozF5gL1
X-Received: by 2002:a05:6a21:7907:b0:3e1:29b:bb35 with SMTP id
 adf61e73a8af0-3eed59db277mr1575456637.88.1794156430631; Sun, 08 Nov 2026
 08:47:10 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108155702.361022-1-pmazzini@gmail.com> <20261108155702.361022-2-pmazzini@gmail.com>
 <sashiko-outbox-203873@kernel.org>
In-Reply-To: <sashiko-outbox-203873@kernel.org>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Sun, 8 Nov 2026 16:46:46 +0000
X-Gm-Features: AclHuK8Aes8U3tn1e6jW8hKMbpOMmvpbiNePg-NqNlB0EoDX7OzrjxLvUYhO9U4
Message-ID: <CAAxh=jt9_hsJkEuaWsdAcLMS6mSS0O7PYQj_p6-oWOsQ5B9Shg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 4:11 PM <sashiko-bot@kernel.org> wrote:
> Could these macro names be aligned between the clock and reset headers an=
d
> with existing sunxi-ng CCU bindings before they become ABI?

Yes, I'll use the names the other sunxi-ng bindings use in v2.

On Sun, Nov 8, 2026 at 4:11=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] dt-bindings: clock: sun8i-b288-ccu: inconsistent clock and reset
>   macro names
> --
>
> commit fb1a7b2f6dc03665d0714b13f4a0587e1bb34467
> Author: Pablo Mazzini <pmazzini@gmail.com>
>
> dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288
>
> This commit adds the Allwinner B288 CCU compatible string to the
> sun4i-a10-ccu binding schema and introduces the clock and reset DT bindin=
g
> headers for the SoC.
>
> > diff --git a/include/dt-bindings/clock/sun8i-b288-ccu.h b/include/dt-bi=
ndings/clock/sun8i-b288-ccu.h
> > new file mode 100644
> > index 0000000000000..c9b9eaf979ad0
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/sun8i-b288-ccu.h
> > @@ -0,0 +1,82 @@
>
> [ ... ]
>
> > +#define CLK_NAND     18
> > +#define CLK_MMC0     19
> > +#define CLK_MMC1     20
> > +#define CLK_MMC2     21
> > +#define CLK_MMC3     22
> > +#define CLK_SPI0     23
> > +#define CLK_SPI1     24
> > +#define CLK_SPI2     25
> > +#define CLK_DRAM     26
>
> [ ... ]
>
> > +#define CLK_BUS_THS  32
> > +#define CLK_BUS_NAND 33
> > +#define CLK_BUS_SDMMC0_BUS   34
> > +#define CLK_BUS_SDMMC1_BUS   35
> > +#define CLK_BUS_SDMMC2_BUS   36
> > +#define CLK_BUS_SDMMC3_BUS   37
>
> [ ... ]
>
> > +#define CLK_BUS_USBOHCI0     46
> > +#define CLK_BUS_USBEHCI0     47
> > +#define CLK_BUS_USBOTG       48
> > +#define CLK_BUS_DE   49
> > +#define CLK_BUS_EE   50
> > +#define CLK_BUS_TCON0        51
> > +#define CLK_BUS_CSI  52
> > +#define CLK_BUS_ADDA 53
> > +#define CLK_BUS_SDRAM        54
>
> [ ... ]
>
> > +#define CLK_BUS_TWI0 63
> > +#define CLK_BUS_TWI1 64
> > +#define CLK_BUS_TWI2 65
>
> [ ... ]
>
> > diff --git a/include/dt-bindings/reset/sun8i-b288-ccu.h b/include/dt-bi=
ndings/reset/sun8i-b288-ccu.h
> > new file mode 100644
> > index 0000000000000..6751456545487
> > --- /dev/null
> > +++ b/include/dt-bindings/reset/sun8i-b288-ccu.h
> > @@ -0,0 +1,45 @@
>
> [ ... ]
>
> > +#define RST_BUS_MMC0 2
> > +#define RST_BUS_MMC1 3
> > +#define RST_BUS_MMC2 4
> > +#define RST_BUS_MMC3 5
>
> [ ... ]
>
> > +#define RST_USBPHY0  14
> > +#define RST_BUS_OHCI0        15
> > +#define RST_BUS_EHCI0        16
> > +#define RST_BUS_OTG  17
>
> [ ... ]
>
> > +#define RST_BUS_DRAM 25
>
> [ ... ]
>
> > +#define RST_BUS_I2C0 34
> > +#define RST_BUS_I2C1 35
> > +#define RST_BUS_I2C2 36
>
> [Severity: Low]
> Could these macro names be aligned between the clock and reset headers an=
d
> with existing sunxi-ng CCU bindings before they become ABI?
>
> Specifically:
> - CLK_BUS_SDMMC0_BUS..CLK_BUS_SDMMC3_BUS vs. CLK_BUS_MMC0..CLK_BUS_MMC3
>   (matching CLK_MMC0..3 and RST_BUS_MMC0..3, without the redundant _BUS
>   suffix)
> - CLK_BUS_USBOHCI0, CLK_BUS_USBEHCI0, and CLK_BUS_USBOTG vs.
>   CLK_BUS_OHCI0, CLK_BUS_EHCI0, and CLK_BUS_OTG (matching RST_BUS_OHCI0,
>   RST_BUS_EHCI0, and RST_BUS_OTG)
> - CLK_BUS_SDRAM vs. CLK_BUS_DRAM (matching CLK_DRAM and RST_BUS_DRAM)
> - CLK_BUS_TWI0..CLK_BUS_TWI2 vs. CLK_BUS_I2C0..CLK_BUS_I2C2 (matching
>   RST_BUS_I2C0..2)
> - RST_USBPHY0 vs. RST_USB_PHY0 (matching other Allwinner CCU reset header=
s)
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108155702.36=
1022-1-pmazzini@gmail.com?part=3D1
