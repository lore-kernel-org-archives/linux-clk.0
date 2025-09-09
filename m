Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF012322C66;
	Tue,  9 Sep 2025 16:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757433988; cv=none; b=KKF5fxhR00hbpbvsaHWLKMIBeY7lB9VxoK1CgK10qGiylu7E3ngz02I7gEfsVxryZU2AiFu1stKnUqCuwF75w4EHbeQWGVKaXLxbFqeR9r/eTuTpKYr6/Pu9UtXK1q7FnH9vpAfxn3/9jnQfV54dJeiRAePN6EuN6jZEsLl2iio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757433988; c=relaxed/simple;
	bh=mqM7enTl5JCEBh5L5tH8TyjNRitV3B594uobCX8eDCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bJ5Kyj37hJjwZfJj+e/UN7Xv7DNMzjh3NjK+zFieAKhGhtoKNjxP7ACHSpvWoxu/4YBoWgfwONJ+/XhVEaGoJIaLQeqvRdh0xCcMfY4/eLfiZBURDLfdaxRRCd8ruKMZ2JTR73IdxIHuHGEKlEiS5GsFZfRpPeyszmJ/HsjguQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5688ac2f39dso986840e87.3;
        Tue, 09 Sep 2025 09:06:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757433983; x=1758038783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mqM7enTl5JCEBh5L5tH8TyjNRitV3B594uobCX8eDCc=;
        b=tKdzS47bmvbIsYNUSr+fqYgytkxWsnk50V1aNonOvpyvUoor4grs6wWmGOnHB9m1Z4
         xoWlFlpU3nC/rAddVdDij6ZmFpW4gC6h8+4+LBV1Bvi0stFyh5BCBLyvujSPP1gTE0DW
         6kDj2vvuqOqqZH4ccy6jG+McBQ1YeHxi2UImRlchfwq2dyf006t27IF6WeRfUJDDrVHR
         AhM7F5fJ3/Jvp0qwB7DbS5Md2g30m2OZyhdodvxExhOLXRg2fL0rREYkGbx7W1QnrcYF
         lEgbPIs2LDhKRDQ4t9tveeVMwWcnTOcZlNxCsIgrMcRLYaaExInRi5fXkr7GW6zC8Oxl
         9OJg==
X-Forwarded-Encrypted: i=1; AJvYcCVLXvKe+bXDyOVrdzYPLHJyUC/iuNT52YHLX6+f98ne8TFaTQiLh7QcCfm+OP5Fqjgen/nyOS7pH/Ah@vger.kernel.org, AJvYcCXh/GhjCroRiF7hpv69B3xTXxcuSx7uL5q+Sj4jggbIId9Tw+NYlXYVUQsGPNP/BGvPGxY9PkkAKasw@vger.kernel.org
X-Gm-Message-State: AOJu0Yy73qB6UGJhI6H28d8unrzf5S9q6UUu1P+PA1iFPUygOKhg1YUm
	NBbGDDNF9PRFveX/a8bRPdW6CnP3+1FV/5aQQyKjsfklCIRUSMtf01Px4hpXiQxp
X-Gm-Gg: ASbGnct0NsAKojv+ixt+gTDt/67ZgbhxmXqSmxXztKheL6vSYDzwjUAk8H+pHOeaCSH
	+Q0pD7muM5ShJ0HyGLK5nQUzjPWhKyeTdJqxYs0jXgiPelxt/vf8dS5Z71KlcfG7FKO4qlPb+f+
	gesNl1RyOBxZh3zsTFaZ0G+LFSmG2/0iMybgF3wxwVyS9MjfqYnSSH0l5kqXGSg7tEOQ1Fbmj2+
	MYKF4lRgzJBh57Ko4lMnWJQV4pgsUHlbJA30OpT0Mf5xybLQqeRd8Uc05XWEkASDeEkkMvb5gbP
	tQdSr+f+fwbG+0edOIQtFkfj0vPCJhbzhakyR3sP9iKUMQWxcCejiIqvQ4iptTGNkjHbBkqg2e2
	zg4mpRFSuHpJlD2WN0+v8uDArPAT2f4FxV60vFj/MCg7Wfn1Y1Od04NlrTkOTvJhVMnR/cgW6l9
	Nk
X-Google-Smtp-Source: AGHT+IFvKPRugc3wb6yNdKOZU08GPmJzFfdq9AxadUXw2ixPAK257Dcjw7AmxlZHTYvIIzBPcKZnRg==
X-Received: by 2002:a05:6512:1546:10b0:562:d04d:fa05 with SMTP id 2adb3069b0e04-562d04dfad0mr2788980e87.54.1757433982398;
        Tue, 09 Sep 2025 09:06:22 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56817f57ca7sm606522e87.100.2025.09.09.09.06.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 09:06:21 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-333f901b2d2so59633611fa.2;
        Tue, 09 Sep 2025 09:06:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUnI9KKhITCBsCgT+dIDiUsGmZe/Wl9FeuZgSD1cmx1JZrHwEbCo/RJspslFzztkni8HK+dzjWPjXuJ@vger.kernel.org, AJvYcCWpulw2elKwTrFCdVwwqSMEvDSxR/Vxn1wB8qCzw/x+9Jqx/zQ7SKUtl2dgsv8RCB7ajVs9L6SZcpPZ@vger.kernel.org
X-Received: by 2002:a05:651c:1118:10b0:336:de52:5c33 with SMTP id
 38308e7fff4ca-33b58cbe583mr29181991fa.16.1757433981198; Tue, 09 Sep 2025
 09:06:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903000910.4860-1-andre.przywara@arm.com> <20250903000910.4860-3-andre.przywara@arm.com>
 <CAGb2v65rRqTWvn2NR-OSeP-zVJzheJ=L0YeG5DOrCTPJ8Haiyg@mail.gmail.com>
In-Reply-To: <CAGb2v65rRqTWvn2NR-OSeP-zVJzheJ=L0YeG5DOrCTPJ8Haiyg@mail.gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 10 Sep 2025 00:06:07 +0800
X-Gmail-Original-Message-ID: <CAGb2v66DEh3ZGTsBkX6RELRs+0ZPbMq7bsNQhdUcpxHHMxDhhQ@mail.gmail.com>
X-Gm-Features: Ac12FXxEC7pM8O5XaLI0ogPtLktnWEqjnqEb6kXbRdWLZTDBJ17zyeRXdPd0u4w
Message-ID: <CAGb2v66DEh3ZGTsBkX6RELRs+0ZPbMq7bsNQhdUcpxHHMxDhhQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] clk: sunxi-ng: generalise update bit
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Mikhail Kalashnikov <iuncuim@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 6, 2025 at 12:15=E2=80=AFPM Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Wed, Sep 3, 2025 at 8:09=E2=80=AFAM Andre Przywara <andre.przywara@arm=
.com> wrote:
> >
> > A few of the Allwinner A523 CCU clock registers introduced an "update" =
bit,
> > which must be set for changes to the other bits to take effect.
> > Of the three clocks where this was used, it was always bit 27, so we ju=
st
> > encoded this as a single bit feature flag.
> >
> > Now the CPU PLL also features the update bit, but puts it at bit 26, so
> > this flag trick won't work anymore.
> >
> > Add an "update_bit" field to the common sunxi clock struct, which takes=
 a
> > bitmask, so we can encode any bit to use, even potentially multiple of
> > them. As uninitialised fields are set to 0, we can use this as a defaul=
t
> > bitmask to set, so can OR this in unconditionally.
> >
> > Change the existing update bit users to use this new encoding, and add
> > support for the ccu_nm clock on the way, since we will need it there
> > shortly.
> >
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>

Hmm, actually, we also have the "key field" feature. Maybe we should
generalize that one and merge the two?

What do you think?


ChenYu
