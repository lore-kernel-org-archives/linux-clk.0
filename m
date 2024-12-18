Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F0E19A;
	Wed, 18 Dec 2024 06:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734503781; cv=none; b=Kd+VGK0CbBwXDdR1lqPO/TnyJDaeK64Imbm/iQXwqCTPOFAY5pDkxUhlDu4BkKbFlmBM4UEatYGM8xzvpEVc52uqPJ0aTTDA/oz2OCL7gUsFhSZEQGybF6eYRwZCDp9gttQ0BoIVrl/qBoO39vntIPh7j6UuJKPP5AswWA8mkSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734503781; c=relaxed/simple;
	bh=vwWXD8zvh9hmnZ6QxYEzB+FDN7i50BUIb92pyDHG0lo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L4VsBpYg7elga8kTnvSA/XBZFjHAWEdqBjAKSoT8beFeDs2ZA35Z/g0owA0QHlhRuJV4KIx6GVnrg0SkKK/HuaLCbWrnIauXUa811gLuSLADlxNkvhtIuqdJZT/s4+JJQzKxEjmmkkzup6SGdOg7kIhMTKJD0jGcLNWGcPuwQc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FTvdwih7; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FTvdwih7"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5f32168ddd8so2114340eaf.3;
        Tue, 17 Dec 2024 22:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734503779; x=1735108579; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tg+exyt2bEd/acPRMVaty3D/uVegz4OUg+5qQVFiOTE=;
        b=FTvdwih75Qu8Hqf8S1EEnXOExCfJcuWiSdQD+iIz65HqOk2rkH+x9KXjxsQ8wBSz6L
         nTzuAjUHwXMEgs99NEEgIxAHuVRnLWryRV3pw1KS8huaU0BiA51lX86cXwAQs2BRkNFh
         yGN8nPUYMNbcnkkDtWLfeH9PYK3rxIXbpZAIXsxq/ZFCA37mxT/41sOAMAL/C4JCqnXQ
         NTrbu80Fk1ixEA0Wu4IVnwHuAAcD2Szm/nRAHZ3syEl2WhTx0iH/yqX1Q/2iTfrjHvFS
         LAGaRpRZNSOK78JgYU+6q2dWiPWlSfC2cVhfhfHYrWkBACPtie0IFziJbue00l7f2M2o
         YzhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734503779; x=1735108579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tg+exyt2bEd/acPRMVaty3D/uVegz4OUg+5qQVFiOTE=;
        b=geuajLAn45luIyu3a2gukPauObG0qCeg3Kxvm4znxRYYZ4NnPuEB6Y975SGKgNvsLY
         MSUdjP3OJXF716+k9zxJfiALBrYHHGiAEHd71ikCeD2fKJmq6j6MKxESFVhrDbSRFUIP
         IVCXwZKnjVT5jXcCob/rt+WF6MN17DV3JkHLYMeVJ24VFkJJ+GX5BAiU0XVdjJRb0z8d
         6nHc6sMChToAVhYz1lJA/HcziMUdRNPdyohng4hZEvZ4i06xTq9hTGDnU++WEttqJe4q
         JKj7kdmZHnlUEfMmFVpBatTx3jFRmSmVxqqea5gifv9q1HUeYRXYFJSUU4XPuyqZmYe8
         YDXg==
X-Forwarded-Encrypted: i=1; AJvYcCV5rJC5ra2TkEKwaP9UXc9bGqsqQmIQb8InU/iM1ouzVJo3I+4mEEP79TFnD2tfL1BVVrUUiZMNWKkM@vger.kernel.org, AJvYcCVPx3CB/bebeInMlPuWkNfNF/KFJ90qeDoibz0U6ypYTyM2SsmJE4CeyD/3RLp2ptEh0fvZKf4ioIEoaMaT@vger.kernel.org, AJvYcCW/6KfuuWiqwBxcGHlYmA67Cbj6DKzVUfXDDjiIdiBRIFNQCHReV3kZp63ctZKn8fzYGecg5ANAa9Y8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0m0ksZIaaP9HGt7P1aADAu0TA7CinSJ0ll7oqYcPyfcrt8G1Q
	P0waT/Y6iRAqWfkp92lGIRBDdA9xL9uxR7YDtF4E+t3JTzP9dfzqldNCyCDy86HiVVwOiOXSXZC
	JoMtVZvL/0mgQqhJI2+alHa7bSLiRYhTD
X-Gm-Gg: ASbGncsAEo3agTO9RuothCxd0py7cjo1+5yco7Xl05ZPanzl1YYmEVn4i6TgBGil0BX
	QlGpXB1luBcgMHl2C8bFPbHD3uQwVzECxWmisVrShDsVHO73fOPyB4jIlJR8sG6IJj6skmEQM
X-Google-Smtp-Source: AGHT+IGDZx1A4lzjevZaetM3q0p0F9NGqZ4KJyg/ET7Jin7l5ozux8ML2xLClyaZEmXGWB3tap3fvdMwxeQKOyK0U2E=
X-Received: by 2002:a05:6870:340c:b0:29e:2345:c656 with SMTP id
 586e51a60fabf-2a7b3435b4cmr635905fac.43.1734503778886; Tue, 17 Dec 2024
 22:36:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241215053639.738890-1-anarsoul@gmail.com> <20241215053639.738890-2-anarsoul@gmail.com>
 <qbtp4jvkx3r5azufe4k3vtapqpfs54dyjiu4cy5v5wkkzumrzx@vy3xzkfplbue>
 <CA+E=qVeQ8uHBCeFtw6_2cY3252-YXc6eWrf5_YdeVgbp5LJo5g@mail.gmail.com> <20241217211505.7f9c9e4e@minigeek.lan>
In-Reply-To: <20241217211505.7f9c9e4e@minigeek.lan>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Tue, 17 Dec 2024 22:35:53 -0800
Message-ID: <CA+E=qVcU9V+8LZ0Xnh+oDROVf8H99t_kiku7iSdXTHP43d9E_A@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
To: Andre Przywara <andre.przywara@arm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Roman Beranek <me@crly.cz>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 1:15=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Tue, 17 Dec 2024 10:00:45 -0800
> Vasily Khoruzhick <anarsoul@gmail.com> wrote:
>
> Hi,
>
> > On Mon, Dec 16, 2024 at 11:33=E2=80=AFPM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> > >
> > > On Sat, Dec 14, 2024 at 09:34:57PM -0800, Vasily Khoruzhick wrote:
> > > > These will be used to explicitly select TCON0 clock parent in dts
> > > >
> > > > Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in =
TCON0 mux")
> > > > Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> > > > ---
> > > >  drivers/clk/sunxi-ng/ccu-sun50i-a64.h      | 2 --
> > > >  include/dt-bindings/clock/sun50i-a64-ccu.h | 2 +
> >
> > Hi Krzysztof,
> >
> > > You cannot combine these changes.
> >
> > The patch basically moves defines out from ccu-sun50i-a64.h to
> > sun50i-a64-ccu.h. How do I split the change without introducing
> > compilation failure?
>
> You can just have the binding part first, adding the (same) definition
> to the binding headers. As long as the #define's are not conflicting,
> this is fine.
> Then remove the now redundant definitions in the kernel headers, with a
> subsequent patch.

Thanks for the suggestion! I'll address it in v2.
