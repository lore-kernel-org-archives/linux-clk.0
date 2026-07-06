Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0573C342A
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 18:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783363904; cv=pass; b=cIJZGWnD5SKC18x55EBNFEfwRMfF3TfoXgTpixxgu2CWuzH1Vsm1O3W+n66K6rRz8r05kh2U6I3JQTcQSNyoDLpkKetsRXHh8B7FjCaJD8f/Z+5kXfKsUL1i8XXjoayJH7RbvXP+lv6KMzwd1Cdz2gIYOT6TgPqlfWIIWvQNXqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783363904; c=relaxed/simple;
	bh=fCdq0lYopj7korz3DO/dq32zkKygeRyx2BE0Wg8f5OY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oZaWA4EdxX+P6RWDTh5WWpwOBHx6TbdLnIuriCeYP02DOa2zK/Eo6ZU592t7Sbl2Sg9dsPnPbaQHkBpZAmL4NmbpJw72ZrYFwwY6dd2vZT/eHa5unsEAmMHU4RV9ZSFItrCNsob1RVfbgfIcT8Hp5YS/KqE/v4WeXuKdVx+0YAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D2DB+V1p; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D2DB+V1p"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso34579075e9.3
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 11:51:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783363900; cv=none;
        d=google.com; s=arc-20260327;
        b=hcNYgZ/WHy2hwjXMJTvl/Mi+1sym0hVrZDOZuaOZCfk3cqg5HTTbv/kuNBgwat7d4k
         Te2GP296UMUxsHy7A8ovIlXjFC4unXE3LWTNEkBp1y4JL5PG8CVgbfS9b/j0H1I3rvPY
         oYWRoP2iLuETxi8GfqqCSujCfyRNJU5PfED2Hdl9X3JNhTHygHJwtbyMHpoppFfVha7+
         DzBL1enGu3UKx7gjcAyY2MpKSFgJYxwLz5r54jP2U25F56IKzNBcb5ReEkLL+ucILApx
         ynp1NW1XatrOSOt7EOepcah67nmKHr4jxyVLcWOpN290LQwo0lG32iR/QMo1fo8ObbbB
         4JoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/CSAQ86wMiX5Gp6AT84n1QfYe5hGWs1YjlnFkunec7Q=;
        fh=j6nxv1FQwcXwA/e6OD9xpGdGKVfsw/5ziclpo3tqzdY=;
        b=dS3rEf5aM0rLyd6bEPlQZiQDtz9EtyPtDDVSIiRItBzHiiJqyUXj59tZCMD3DEkG+b
         YLTJ1k1rSM0yDjf5QSW8bFVWJcT9FFn74f1Xw9WH0mPKPi2U2G4wBLUYljW3qmfewUs+
         ArCU2HfhNQnmFKblUJmxR9GqV0oPeTifwQXlcITTGnZKp1ujq+Gev9ryd13dWDDIp15l
         GfKn/9FlmhbtZsH9K6MX8ENhqFJnv/n0NNBZp3qG/oNBlHGFK9KUZx7pPNVV2y+BpLDB
         R5q5IkMSTrMl007o2bjFx97LEuWTgycnTyiFEbqR2cCSJFfPFHeJ5mcF4GerYtcgekjn
         rxjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783363900; x=1783968700; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CSAQ86wMiX5Gp6AT84n1QfYe5hGWs1YjlnFkunec7Q=;
        b=D2DB+V1pu9VZk76gbHmhZs2FWtDSxbjxD+6jk2xSBrzpA7nzl8bqO0aKfE4303aiaz
         3D9r+dis1GGFTHWYfnRfvnZGWQX3jYP0+iqKGWsYowGxafGoUOqWh2NhTNgUJ8H6vXqP
         qfQTFVBcm2UYE/nTJyTm2/E6kr68K1nIhPsZ3wR6ePFV66jqa+sEWwqvItsKYgr4Zv63
         Ik6JoFB8JxYhhN4mwBlNM9lFOUINzhgYN+Zy7g/HpON63rEZ0hiuzuUaB/sRfM6OkYfT
         bnO8xc+NI6TuiuRQui6d+XcjupSpez2q5AjaYtWi0i8+Khha5e5GhyB3lirnGjubuYto
         Tnuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783363900; x=1783968700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/CSAQ86wMiX5Gp6AT84n1QfYe5hGWs1YjlnFkunec7Q=;
        b=fUzKUdzpMln5KmJpZ56wiVLN+bJ4g1hP7nvG9YP8d9YlBdh45KhFtd82mAdn2F9t9V
         8ilFhYhN3TprN9Xns5I2sXY9ob+VPWfdN8ZkdQp277FRCf+9b5fBhhdowNEtDGItjamx
         fN6N0RuN2ZidKy8oZlSc+C7X1a7eAjwR7QRi+pzQKcKP/Rp20W2quUtk1A+jveUnjrjm
         BsMOkmV0PNj0VJ7XCLMCarMwUXyvazx+emE/Kje6WD8YPlZE3VS3eNYNFxMnBQaCpN9b
         0kUZXcZYyB+2wMJ6gEBlHELkaelCaVCEDOhAwtN6tVH3c3ewwb377Ep5MacZOBDRVx1t
         mxOg==
X-Forwarded-Encrypted: i=1; AHgh+RqLOaD8rBsVTgjBmnfmT2SISXJ9foMqKhPf0oqEXgcdAeQOJqoPLr56I2wQIEIzN/CVuiHXZqJrqSI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNGwVVhyRcQPZdSc1iGufATaIS4SYdOYTgq5U38/WlYuLPtxjc
	N/138EHUbtRqj+xFj5wE22sL8joeS/esV1FTk3e0LmEkxP7M7Z9O4nWWKaIElrKuDNXUVVNrpb7
	xAQMhDlYkuyDWcuMC8D2o1vIBJyjUUMk=
X-Gm-Gg: AfdE7cnq4Jhz7dlgjdSSEk6UWbynsGKVVuV/bH+sJcUnCFJkYJDal3nyT0AUIs+bDWh
	qYoEW+QmxDlH0cwvD8N34FrjjyEFHCglyfBnwHULti2LH1rONW8uhra7c27/zrkOp7VPJyI1ykb
	GD6uH8cV/md/xJtwVK02Chnde93F05bw1DZBACeGtQM5/ENzrudIXF94vKnwFCu4du0vXc8g7A0
	P4RhtLAhcM8DHzxFBUzFnBySPOeVyyhNlp7YCxXTDZxKfAKRqHdAUD3dU6FQsoOy/MTCQU7daiL
	8lsPM1e3gw3kgUzsdJnQdaYFqxsPISb9Irb1Qn+rU6W+A9+jwEDKj/D5eQ==
X-Received: by 2002:a05:600c:4f84:b0:492:5030:5e7b with SMTP id
 5b1f17b1804b1-493df06a26emr18953135e9.10.1783363900368; Mon, 06 Jul 2026
 11:51:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260702123112.161160-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUTDRkq-WaXNxGzBLAEY90cn1i_-UOuDkS3PBs3xKooFg@mail.gmail.com>
In-Reply-To: <CAMuHMdUTDRkq-WaXNxGzBLAEY90cn1i_-UOuDkS3PBs3xKooFg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 6 Jul 2026 19:51:13 +0100
X-Gm-Features: AVVi8CdhZOFc6S2n05FV9nlTvx9urpSzJPBcWirnqMlmue__2oziyda_FreEG6M
Message-ID: <CA+V-a8vxjms+yqzO_sfFo19nMAuhZ5aFSuBsy1Hm+0PLFio3KA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 2/9] clk: renesas: r9a09g077: Add SYSC regmap support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Mon, Jul 6, 2026 at 11:08=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 2 Jul 2026 at 14:31, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add System Controller (SYSC) regmap support for the RZ/T2H SoC.
> >
> > The RZ/T2H SoC features two System Controller (SYSC) blocks that handle
> > low-power management and access control. These blocks are defined as ch=
ild
> > nodes within the Clock Pulse Generator (CPG) address space in the devic=
e
> > tree. Implement support for creating regmaps for these SYSC blocks.
> >
> > Register the regmap using of_syscon_register_regmap() against the CPG
> > device node so that consumers can access SYSC registers via the existin=
g
> > syscon phandle.
> >
> > Add a sysc_init() callback to the CPG/MSSR core to allow SoC-specific
> > initialization of the SYSC regmap.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2:
> > - Made use of for_each_child_of_node_scoped
> > - Moved sysc_init() to the end of the probe function
>
> Thanks for the update!
>
> > --- a/drivers/clk/renesas/r9a09g077-cpg.c
> > +++ b/drivers/clk/renesas/r9a09g077-cpg.c
>
> > +static int r9a09g077_sysc_init(struct device *dev)
> > +{
> > +       struct device_node *child, *np =3D dev->of_node;
>
> error: unused variable =E2=80=98child=E2=80=99 [-Werror=3Dunused-variable=
]
>
Oops, I will fix this in the next version.

> No need to resend yet.
>
OK, I will wait for the review of the other patches too.

Cheers,
Prabhakar
