Received: from mail-oo1-f98.google.com (mail-oo1-f98.google.com [209.85.161.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF4F2FCBE3
	for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 16:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769791982; cv=pass; b=Kcy0fHYGEPotAbi8iJj/cXAkSxvl659GaZl8rYW8i5ep+YAzAEiA7TPKVCTOjrAfOAwRFFecJACXCw7pEcW5dFDw1eBAzo7mftcJA6i6PHODuXELZ4CwGbvolYi5OL3Ot0aD+mNDbzOEef/Dxzp4KXUTt9wGCSvWHea2aG3P2+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769791982; c=relaxed/simple;
	bh=4G+oUenDEJcFNbvCbTngycMqAZ6LWiba2WjeGm3TmjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mup+N6BAFET5XHfloU3DTudzEpYiN10TG897fc1ndwhAHe65WivCZa9rvJoC5vcyaB9RfwaZgJ7ttMHaVsBgsWPBZYGZB6e7sHGRYAeH4wdCTytqOfTi1FIIwd5yFrtqne/NEu4F7Ch0TUsJxHVjtpWkimkZZ6MvtvOa3zfHZ5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Xoe667WN; arc=pass smtp.client-ip=209.85.161.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Xoe667WN"
Received: by mail-oo1-f98.google.com with SMTP id 006d021491bc7-6631375bf14so402453eaf.1
        for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 08:53:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769791979; x=1770396779;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hSUjmHqlyDCBYTWfDF/AqkaTeXzVzUW5/NP5A3G0ImA=;
        b=QJeNQkSNmIbb4TMDJbL2Fw03/+02J8qvfPKrRUDrbcEA9HJ0OUbeoOzVaFPpaUqZ3G
         SgUScy9OQCrk31i5e8Ib1Skt/visumJqZXgq3yMAOmjx3ARXLpgFMdxRpep6cE+SNP5u
         6rnrl3AuN7PrsQ+u8LsSnD/qdYpJuLpOV/mQ9psmyNywCH/B54dsru0UaIcfrMHVII1G
         txrVcVM17B64Ut/XG8zEqGOXQ8Mb26X1bYSZ3SxxjLF/CVpyrl6KXkdkkQFo0/16ayak
         LlPtMoJRBX9lMOU2h/dpkj68Mk7j3+B7DoF4uoSeVdYTlxKWv2i7qVpmrOUIHs69lvQE
         nFCQ==
X-Forwarded-Encrypted: i=2; AJvYcCWOrToYSkgP/y2qBRKnTSakFhM7lBqyIw3tzvd2uD7JVeYGapG+Yr+KjAWgqXkl6PJVoSkzMEp6XG8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuB104CItJQjZb2Oqel9oVMvLRLxQ1J3pq7gtC07cWTcmDS/t3
	6J1xxdePoqnt02QjbRIsZ479HetFCWSEkR3VEixzI6LVFckpHd5/U20JfkcPt+E4yif6QBBLfgQ
	Cudr5VyGFVq5fLntEXEhYVNPaDnCXEL1646aeBFQdM1GHbTlVwhtTuwy04P62KuxEVVkl6E1IUN
	7rpV0dEUT2MDEauenV07zMSo6WZ/Phddy+e0ib7RRUNEKdEiDN9y2rtmOsr10Tt+UP42q/9c6D9
	SmQ7SMfBW0=
X-Gm-Gg: AZuq6aKeloyem2qrrGZQKkmJYTLFfb/N+xVGLUja+DFbfOpikVzxlW3rAZY19lngaEp
	WLBa7ORUWY8/LYf6Xg1Xm/ZirhPVl+J3wPcPvDTkWLtCn9WFo1PPEsBaScdBMZcMqz6elPZOdb2
	7ySQIUaiFfePmc6wLpliMSvgNhcpcnK2fkI+c5xliFFEoU8NWQN9+ReW1HPmcwGbG0t37VUH2jK
	nZL5Dpwl0ZzBqbjYBUeGn2h10sCIuhDfD7SRW53+OhLseSJ3oExj1XegzJtFCBqEhqv+pD04bmU
	GzFiKz4hKIYzDRLcfpb9BXj1aYcOeetMnp4qvM1MHWBJ539hrbZUbQ4FWJxIYAgGoC9xR6Wm3vW
	sQEMjIPZcpc3QPKrvEYy+wnuOoF92n3Ilg07DqEy6q7Rby6p9RVPwHSmsTOrpr48DZCl4ALL70K
	ULdFePAF48FqEYAvbRBftOZafV1RzFQgQ1tjzrKQ==
X-Received: by 2002:a05:6820:2288:b0:659:9a49:8ef6 with SMTP id 006d021491bc7-6631040b4c8mr1214938eaf.42.1769791979450;
        Fri, 30 Jan 2026 08:52:59 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id 006d021491bc7-662f981a8fasm210587eaf.0.2026.01.30.08.52.59
        for <linux-clk@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Jan 2026 08:52:59 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a2cc5b548so82717876d6.0
        for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 08:52:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769791978; cv=none;
        d=google.com; s=arc-20240605;
        b=PoNnGuMsmTOldh005sj6zIj2IfTzZahg96noyq9BGiZKRJ6FdxITs9edm/yxiC8T21
         1jF7SukX76Ko2Vco6mNVAfvz2yMioP+6EeE8QeGYWqJ4valfUaylf8nzqykj4olCICRo
         Vbdy1i2jHdsGDT5aq7ixMULngZ7GjRVv5sgXXv/ndfohMTLOQtbjhO/eW52PtnrsmikK
         ZkpreBs50JRtboJ7rBJvSb6giSnYaOe5zH7GT27c4DiASGlO7mM1LsXMPC124uqFtxy/
         NTTnUwNvtQfY9jfQFkU9NRDzTj6O1r7Q7HkwRWde9LM3am18L26t7H41FGbOg9xZkdkB
         SVeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hSUjmHqlyDCBYTWfDF/AqkaTeXzVzUW5/NP5A3G0ImA=;
        fh=ORsF+nn2FLfydTp6L7YmutFjLg/29jTa3uydHBB6GyU=;
        b=BOuWRKgc4bpuKhZKc5r53sWQq6of9l5t0lCqgujKf2xBeNvUS4rbyuGU8PbYAxTG1a
         ckVFUGwxk2ME0bOLj0Uz4FozRPMEud8arjrRZ9Y/m0jV0+T3F2UPDeyFWXC6JRm3oSFM
         r3xS2jZdqLWn1jYvcQrRhFYWrLIYVJyfPLE0ErpVj2PI4lpij8EDIGjQaxW9gTGDwOXP
         RV/ufSi9hK0M4DHDHKtrP4rMzwm0CpyHEnLa+cm0cNioSLlbSlejiII07KN2W7gODhMu
         7l2K2R8m6BgSFfMX4V5Dlcld5ojxtkutc7ltYCb0UU6K3mw3TGF7GcWpCUjTCt4k/0oT
         2ZUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1769791978; x=1770396778; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hSUjmHqlyDCBYTWfDF/AqkaTeXzVzUW5/NP5A3G0ImA=;
        b=Xoe667WN6LN+lAzN9CJG8ZBC1NiZl8FB64M/ZTp5XqYif1qgbt2PI6WLNjsraTw/Dh
         Opf+j7A716Lfo2E+OswrggFVsG1XbKXHRor9/NLEpAYEwhU67KxPT/u+pTVx5VC0SnUi
         59g6tNO4SYlghgjOfBxF116ZZ4UQXKxZn/jF0=
X-Forwarded-Encrypted: i=1; AJvYcCUDpXEokMOspwSidWqIoIfmGR/O2MZd+IXHzj+2spuN2ecxa00DNGUxyH3RxNBlnFlO7y4WEZYvhYk=@vger.kernel.org
X-Received: by 2002:a05:6214:ca7:b0:894:713f:65a5 with SMTP id 6a1803df08f44-894eaa3c7ecmr44570846d6.35.1769791978526;
        Fri, 30 Jan 2026 08:52:58 -0800 (PST)
X-Received: by 2002:a05:6214:ca7:b0:894:713f:65a5 with SMTP id
 6a1803df08f44-894eaa3c7ecmr44570556d6.35.1769791978141; Fri, 30 Jan 2026
 08:52:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129003958.1410626-1-mark.tomlinson@alliedtelesis.co.nz>
In-Reply-To: <20260129003958.1410626-1-mark.tomlinson@alliedtelesis.co.nz>
From: Ray Jui <ray.jui@broadcom.com>
Date: Fri, 30 Jan 2026 08:52:45 -0800
X-Gm-Features: AZwV_Qh1Y-x0tdeun_Ga4evB5IfkZsuxhV5mRH1kS68MEM5IHjhBfuJCEcaAlLo
Message-ID: <CAJ8Y1dTNM-oXVK4bm0hCQf6Vb+QGUA_YL5T-L89Dv3HZYPzsFw@mail.gmail.com>
Subject: Re: [PATCH] clk: bcm: iproc: Fix overflow in clock calculation
To: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
Cc: sboyd@kernel.org, rjui@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000003997a206499dce31"

--0000000000003997a206499dce31
Content-Type: multipart/alternative; boundary="0000000000002f0ed006499dcee2"

--0000000000002f0ed006499dcee2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 4:41=E2=80=AFPM Mark Tomlinson <
mark.tomlinson@alliedtelesis.co.nz> wrote:

> Some BCM iproc devices run at 1.25GHz. This comes from a 50MHZ crystal
> with a pre-divider of two, a post-divider of two and a PLL multiplier of
> 100. As the multiply is done first (50M * 100) this overflows a 32-bit
> value. The multiplication was done as a 64-bit multiply, but the result
> assigned to a 32-bit variable before the division was done. To fix this,
> use a 64-bit temporary variable and use the do_div() macro to perform a
> 64-bit/32-bit division.
>
> Fixes: 5fe225c105fd ("clk: iproc: add initial common clock support")
> Signed-off-by: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
> ---
>  drivers/clk/bcm/clk-iproc-armpll.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/bcm/clk-iproc-armpll.c
> b/drivers/clk/bcm/clk-iproc-armpll.c
> index 9e86c0c10b57..665f1c531c4f 100644
> --- a/drivers/clk/bcm/clk-iproc-armpll.c
> +++ b/drivers/clk/bcm/clk-iproc-armpll.c
> @@ -180,7 +180,7 @@ static unsigned int __get_ndiv(struct iproc_arm_pll
> *pll)
>   *   mdiv =3D ARM PLL post divider
>   *
>   * The frequency is calculated by:
> - *   ((ndiv * parent clock rate) / pdiv) / mdiv
> + *   (ndiv * parent clock rate) / (pdiv * mdiv)
>   */
>  static unsigned long iproc_arm_pll_recalc_rate(struct clk_hw *hw,
>                 unsigned long parent_rate)
> @@ -189,6 +189,7 @@ static unsigned long iproc_arm_pll_recalc_rate(struct
> clk_hw *hw,
>         u32 val;
>         int mdiv;
>         u64 ndiv;
> +       u64 rate;
>         unsigned int pdiv;
>
>         /* in bypass mode, use parent rate */
> @@ -216,8 +217,9 @@ static unsigned long iproc_arm_pll_recalc_rate(struct
> clk_hw *hw,
>                 pll->rate =3D 0;
>                 return 0;
>         }
> -       pll->rate =3D (ndiv * parent_rate) >> 20;
>

50 MHz crystal * ndiv of 100 indeed > 32-bit, but the right shift by 20
would have ensured the result is way less than 32-bit.
I guess this is not a real world problem (you won't have a crystal as
reference clock of a PLL running at a frequency much higher than 50 MHz).
But just to be safe, using a 64-bit temporary variable for 'rate' before
further division below does not hurt.


> -       pll->rate =3D (pll->rate / pdiv) / mdiv;
> +       rate =3D (ndiv * parent_rate) >> 20;
> +       do_div(rate, pdiv * mdiv);
> +       pll->rate =3D rate;
>
>         pr_debug("%s: ARM PLL rate: %lu. parent rate: %lu\n", __func__,
>                  pll->rate, parent_rate);
> --
> 2.52.0
>
>
Acked-by: Ray Jui <ray.jui@broadcom.com>

--0000000000002f0ed006499dcee2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 28,=
 2026 at 4:41=E2=80=AFPM Mark Tomlinson &lt;<a href=3D"mailto:mark.tomlinso=
n@alliedtelesis.co.nz">mark.tomlinson@alliedtelesis.co.nz</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">Some BCM iproc dev=
ices run at 1.25GHz. This comes from a 50MHZ crystal<br>
with a pre-divider of two, a post-divider of two and a PLL multiplier of<br=
>
100. As the multiply is done first (50M * 100) this overflows a 32-bit<br>
value. The multiplication was done as a 64-bit multiply, but the result<br>
assigned to a 32-bit variable before the division was done. To fix this,<br=
>
use a 64-bit temporary variable and use the do_div() macro to perform a<br>
64-bit/32-bit division.<br>
<br>
Fixes: 5fe225c105fd (&quot;clk: iproc: add initial common clock support&quo=
t;)<br>
Signed-off-by: Mark Tomlinson &lt;<a href=3D"mailto:mark.tomlinson@alliedte=
lesis.co.nz" target=3D"_blank">mark.tomlinson@alliedtelesis.co.nz</a>&gt;<b=
r>
---<br>
=C2=A0drivers/clk/bcm/clk-iproc-armpll.c | 8 +++++---<br>
=C2=A01 file changed, 5 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/drivers/clk/bcm/clk-iproc-armpll.c b/drivers/clk/bcm/clk-iproc=
-armpll.c<br>
index 9e86c0c10b57..665f1c531c4f 100644<br>
--- a/drivers/clk/bcm/clk-iproc-armpll.c<br>
+++ b/drivers/clk/bcm/clk-iproc-armpll.c<br>
@@ -180,7 +180,7 @@ static unsigned int __get_ndiv(struct iproc_arm_pll *pl=
l)<br>
=C2=A0 *=C2=A0 =C2=A0mdiv =3D ARM PLL post divider<br>
=C2=A0 *<br>
=C2=A0 * The frequency is calculated by:<br>
- *=C2=A0 =C2=A0((ndiv * parent clock rate) / pdiv) / mdiv<br>
+ *=C2=A0 =C2=A0(ndiv * parent clock rate) / (pdiv * mdiv)<br>
=C2=A0 */<br>
=C2=A0static unsigned long iproc_arm_pll_recalc_rate(struct clk_hw *hw,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long paren=
t_rate)<br>
@@ -189,6 +189,7 @@ static unsigned long iproc_arm_pll_recalc_rate(struct c=
lk_hw *hw,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 val;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int mdiv;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u64 ndiv;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 rate;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int pdiv;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* in bypass mode, use parent rate */<br>
@@ -216,8 +217,9 @@ static unsigned long iproc_arm_pll_recalc_rate(struct c=
lk_hw *hw,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pll-&gt;rate =3D 0;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pll-&gt;rate =3D (ndiv * parent_rate) &gt;&gt; =
20;<br></blockquote><div><br>50 MHz crystal * ndiv of 100 indeed &gt; 32-bi=
t, but the right shift by 20 would have ensured the result is way less than=
 32-bit.<br>I guess this is not a real world problem (you won&#39;t have a =
crystal as reference clock of a PLL running at a frequency much higher than=
 50 MHz).<br>But just to be safe, using a 64-bit temporary variable for &#3=
9;rate&#39; before further division below does not hurt.<br>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pll-&gt;rate =3D (pll-&gt;rate / pdiv) / mdiv;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rate =3D (ndiv * parent_rate) &gt;&gt; 20;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0do_div(rate, pdiv * mdiv);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pll-&gt;rate =3D rate;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_debug(&quot;%s: ARM PLL rate: %lu. parent ra=
te: %lu\n&quot;, __func__,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pll-&gt;rate,=
 parent_rate);<br>
-- <br>
2.52.0<br>
<br></blockquote><div><br>Acked-by: Ray Jui &lt;<a href=3D"mailto:ray.jui@b=
roadcom.com">ray.jui@broadcom.com</a>&gt;=C2=A0</div></div></div>

--0000000000002f0ed006499dcee2--

--0000000000003997a206499dce31
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
Kea1UXiDNimY9XcISXAUrVauS3TPqfSofCP4tOVkOfR2zFsciCJ7DPbmanfMXAR2cY6kCgkZCqxY
9Szy6beT2XZUSE9/jFymRSjXZNnLqAe30YCaVeVQUqW9X3NqlPdzO9Ce8AqKdgBlVt4isO6s3zJ5
djaWSUM3zrweXgaVpSRF3iBUxK45Nb0qOkvz0hrBYM2r+iLWR2YbF+Z7W7lw2QMvkbeT1gXn+4pC
K8f1aWKsB9e6Id7uBOkCAwEAAaOCAdgwggHUMA4GA1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8EAjAA
MIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3NlY3VyZS5nbG9iYWxzaWdu
LmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEFBQcwAYYtaHR0cDovL29j
c3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1UdIAReMFwwCQYHZ4EMAQUD
AzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5n
bG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAyhjBodHRwOi8vY3JsLmds
b2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwHwYDVR0RBBgwFoEUcmF5Lmp1aUBi
cm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQwHwYDVR0jBBgwFoAUACk2nlx6ug+vLVAt
26AjhRiwoJIwHQYDVR0OBBYEFLfOZFpVhKW7s+LOyKdJX5PQH0f8MA0GCSqGSIb3DQEBCwUAA4IC
AQB5Y3tHNG503cqE6g1lZJG3Z1SbuQD8ZXUbYqDNZCnUAd/+zUCraK7TYIOI83X+oof/CscTxVhf
5mazzhESPjHYlC3TLkkxDHQZi06GwKbI00651REpC78vd9dOdZnKnGjpFeDiwJKNxdarSaYiZi/t
6cZD3FIvDaJwYIQ+8HvZOm7FBicC41sMoaxGWZ/tdC6yRoLFckWRvhq0e7wyaBOH2ae8l30V6NXB
RtJd4XemoNk74ybCcGMro0zyBCzQhREo2slK5r/uflroC607XCCIGjLuB6TptSxV97L/9/QSrE2U
4JteFGVwRBJw1s7k8ICf4s22debUZ+OlB0mXjI+8EUDt6vdMeregn5ilQQSsDmBMnz2GzHfV30tb
X92uoE5xui1g4Q3BWkUVwd9wVHaganr3rzc+lQDnQq5cddu1supu3SWp5FqKq36rtf3RX/3zHZ0C
P2pCAlilDHYH2NRF8CYb+gqFySS/PUxwPmFWuD897Hewokex+ux0oZscsuRe0IttCbYfjl/+tSA0
a6Rd+AmkiyASFgEHsLGl6q2OTPYU1PikjUe5RXTp0UC7bdPQXzxaORlh/KWilnz/kV2XblDdybuc
Qz3eVIGvTANnIqPpz94oImrgHX48hMGiH5gGNznLwDBoQl4ZSfvlSi01TcUsYlHJD3LRZWbsh4VG
PDGCAlcwggJTAgEBMGIwUjELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2Ex
KDAmBgNVBAMTH0dsb2JhbFNpZ24gR0NDIFI2IFNNSU1FIENBIDIwMjMCDCsjlIbQJoxUU3h/cTAN
BglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgFGhm2zx7g8m7BLeF5vflKAhD7oIWVl8d
DQt1Sx7onIMwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjYwMTMw
MTY1MjU4WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJYIZI
AWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEB
BQAEggEAkoPz8JwLXqr9yE/lHb1Sp9rdDiy9toKTUiDnAv0LR4xdNlKAE02//n/HkcKqUHPObZuI
XrMahOu+LVAyKASk0eakAHyG0wEN+7gIPwscrvjld0b/Yi+inUZACjZLTTm4eo05ustMkFWgB9bJ
uoMJoaceFt7OOED7Mu9CP+1tLUqChDfZjPHGmB16bfJV7hWsDB9t+Rn5zdC6+WY0BdTJX8DStHTx
iiWHge0ILNdRyhTD6xPwH0sUlOddEA7KPhBBdieLJRyiVHshFHybqxp1nhTZ4l9Nkzqp2mek2LdF
Ubvmo69v/yA8OzybyfSDnnZA8d2b+VzBZzUaAu9DtYTz3g==
--0000000000003997a206499dce31--
