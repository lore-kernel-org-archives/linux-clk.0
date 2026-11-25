Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618388;
	b=Qst97dlKYcLquQrJGYJ9xCj2LZQIJjoYbzvNS5FrNAPCsAuRXJbSesBxCSGMc7cBDdoR
	 xcUqHNOYSTYZYTyYVaFSLtW9yUf0t+Mh/gRolzE1v2MMpl2V9ngRSHsDf4WzQ9915qwSd
	 VbZUNCQwCPJycfIVU5ZkTiVDzcMTqZvq0INIccMV+X486mZDhNxVobyhN0LYHHPUKIaj5
	 OI6pQ5rW8WnvSoiWcxY0l7n1mfJPr10NPqKMNzYUWcEBVl1SC/lEiPJbpHb5xvjxMCfxq
	 Jmhw/TJpyNX1aYBaKkYoxoqh4IF98D516thXB8rAYOxOQIricdV3tiWJ0IzNEvQQRbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618388;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qhCwXvAyXM1RHsJVCIWLLXEAUGswl0Dh6+s1SkrTVk0=;
	b=5MpCvug5hlahMDWfob3S/sHDc0hqoTPCYS7HC+qNNhZZuEZVCblTFB0ilmfeVRoX9qiu
	 +fzfvOntE8xGMjWvV/DpIGmiIr8jyGUC/ocXrakupY+Qv3OBdJ8cPchZIOi2wbSUy3e8k
	 ux9pXLePvJ516D3D7gDP1ivi9QCxeeopkl7HqopLm1MrglfrlU3yF1IBZFh3lls9Qg3oR
	 0xZe0LA6Ti0AJCAFT7fIYyvmZG+GFp8AMgVjNrRUGCCNcdj6sy/4rgbAnh1D4rZJad4XY
	 +PK/Zzaz/KpchCDkEgDrsl39Bh5Qmh8Yo4ATsG2MgDbZhTezxeJFEjhEUiT2+lOY/UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9497A606A689
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 14:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9497A606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67c24619b19so4837971d50.2
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 06:53:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618387; x=1796223187;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qhCwXvAyXM1RHsJVCIWLLXEAUGswl0Dh6+s1SkrTVk0=;
        b=voOm1+tgT6bE7X1eb/7hkcOD748n6WsmzJALG2Q5klKYVsRTflwU389MTXh2/L4Wx8
         2V8ZxT6DZKQaUPNCcv9jiCg9qnjDnxgCmYei11UVvkani9Msv1qbT7uciPiw7oaBfAYX
         PZTirvoX8EP2WdbgZ1mohMakjR9wb2F5s+M8l4rjPxG3E/hJ3tiRujXgOPEP37r/r72I
         rUXL6PGmlQD/3agZ/dPWnp2UQisAgmGQpqpI84GD9aF/j+ubV77uA4abD6V+vr/qT+QO
         QUAVp/IzXq/A5P76BtXYmMa5GSthO/00rNo9dIXKbnWpV9DwuiuMs5Aje+/FvuoaYlVX
         BEkQ==
X-Forwarded-Encrypted: i=1; AL+hErEbtwKIGQuSYP1dvS9ZUaWhzaNSq9+ptxh5UVd65uNaFx3THRgZImyaJZ/5SI9BQCD99qy77Qt/izA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SFyzNaySQtrJQwTN/jfOuLrR3Oqlk1GHTANZ1hnQKu6s6ZSh2
	tHNxk70YyRmC+aZcSykueiv/Iy4fYGCstmltTzmMa8dZxYFVIEdNtB3Gl5IoouMR
X-Gm-Gg: AZFdTZfiyhcOi7KfpaCwLd6VxB9swHZqqikunSmMJ3CEf1OW8VRMfF5IDi8zx1ul/Tb
	C6jkz2yBYCQ9GR8//EBic/7A8e68FWRlULVLEF+ZSv/6PP/RWHfY2dN7+IR4SmFatCTlhaik/gw
	StThGWygeX0ZhaOIezVe5z1cMYYedJJtPFUI05NrzbAbIRtxJmeb66zJXoCja0ah7GVjPG/+b1l
	TZPyNkrebm3ncuML2W9IkCyAKYn/sWEDVA6bAYTBWZPZvlbkRnKy+0dpYq0aUaL3hJhCDaEK+lV
	QP0qIYAhRuQpbRUFmvebifHmTccYWZSkKkwZbm/vodRrzhllqaD2qzF8GTX+LW0EXQLmBeN5jtZ
	35I4TwkuiLyxWUn/ITjkzqQ//+jCnt68zF+B0IyWztnzbEsL51HPr+nPDYrUWHbbg1/qdfhe63k
	hMykKaenrRMrMvgm8J4AGc+EWAxDHV/nfn5IBuGy8FgGHMNjFCcDISgQVPecu7Fp+e1wPNKduB+
	7giNK9bmRbxueSCvBxQj5axYBnWOLjKX4cRPh7+MvnmuCTRXmr0SL8IFeAMzjyMsvApzvioIifM
	PM6pKhaoG6QIRJEtDGSWAUnz3gT/MWLtFCopYj/J4ZZykbqnE6Wfs/31CqiX+RNCeME=
X-Received: by 2002:a05:690e:1a9c:b0:67d:af3b:24f3 with SMTP id 956f58d0204a3-67df4479fa8mr5543208d50.57.1795618387458;
        Wed, 25 Nov 2026 06:53:07 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df31fa7afsm8492742d50.1.2026.11.25.06.53.07
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:53:07 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7d2bf046ceaso3576902137.3
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 06:53:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFz8NFFdzKOSFZRtZ/bU1xuCcgXCfyfpK4dTkYT9gAGxJhvn/lO7dtKqgpflngn7o5MnzcvUtQYuR4=@vger.kernel.org
X-Received: by 2002:a05:6122:2192:b0:5ec:7589:f9e0 with SMTP id
 71dfb90a1353d-5ee8af4a3d9mr11210352e0c.11.1795617963345; Wed, 25 Nov 2026
 06:46:03 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795029012.git.geert+renesas@glider.be> <1e9c5ac3-d82b-4af9-9946-0302cadf7404@baylibre.com>
In-Reply-To: <1e9c5ac3-d82b-4af9-9946-0302cadf7404@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Nov 2026 15:45:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX2BEAK27P0Da7Nei=DLaHgTdi=FiC5ZMhVegNuGwM5_Q@mail.gmail.com>
X-Gm-Features: Aa3M54o5mrxb1PGlHbFHaQn6zx-fZm6HZYf4SleH1VTd0nBeXxZvXoTTF6NrZag
Message-ID: <CAMuHMdX2BEAK27P0Da7Nei=DLaHgTdi=FiC5ZMhVegNuGwM5_Q@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] R-Car X5H Ironhide CPG/MDLC SCMI remapping support
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Paul Elder <paul.elder+renesas@ideasonboard.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cl=C3=A9ment,

On Thu, 19 Nov 2026 at 15:47, Cl=C3=A9ment Le Goffic <clegoffic@baylibre.co=
m> wrote:
> On 11/18/26 8:44 PM, Geert Uytterhoeven wrote:
> > TL;DR:
> >
> >     Describe hardware in DT, and perform mapping to abstractions offere=
d
> >     by SCMI in Linux.
>
> A question on the approach
> An SCMI variant DT could mark the CPG and MDLC status =3D "reserved" and =
point the consumers at arm,scmi, while the U-Boot IPL keeps the hardware DT=
.

In theory, yes.

Status =3D "reserved" would work fine for a leaf device (e.g. a network
interface), without further dependencies.

For core components like the CPG and MDLC its different, as every single
module on the SoCs makes use of them.

> Since v4, the series assumes the SCMI ids are stable:
>
> >   - Remove dependencies by making assumptions and dropping disputed
> >     items, to move this series forward:
> >       - Assume all SCMI IDs are stable.
> If they are, why not using them in the DT directly?

Because:
  1. They are not stable!
     We only _assumed_ they are stable, so we could relax dependencies.
     With that assumption, there is no longer a need for the (contented)
     addition of scmi_get_base_info(), which would be needed to
     distinguish among different firmware using e.g. different ID
     spaces.
     FTR, without scmi_get_base_info() we're at the same playing field
     level as some other SoCs vendors that don't bump their version
     numbers at all when making incompatible changes ;-)

  2. That can't work for now, due to limitations/deficiencies of the
     current SCMI firmware specification and/or firmware implementation.

  3. Last but not least, they are not hardware description.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
