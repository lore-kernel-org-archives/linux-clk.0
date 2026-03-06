Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14EB35C181
	for <linux-clk@vger.kernel.org>; Fri,  6 Mar 2026 23:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772839658; cv=pass; b=cVsZ91hvXQ+3kdUgc4JRMXblIOvW1GpGOpBkNxgktmdcBTst0ZEm2HWzu5ddiQQfTg4P/76SKvKo0JIUJjyhKgw9tr3prMlq0VdnBWc91zyN5wBEqqSPVXyypcJGNx0PGCeiMfqhRhI2io4OizYLGM9oy7r2ocVtqF5O23AJq7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772839658; c=relaxed/simple;
	bh=miLnnTGHi5wNa5u8dKX4lrgopohiQ/GLithTECaVPHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bF4H7GfnxDWVVE2AX3phz/tjqfRdAS/Y/ENNt7cYN9OdpK8QuALNPjuPLh+0L1vaOLgzFd7rqZc6IQNJBb3ucsDO8Gt0wUehI4Iq5+Lnipr6hNxx0BimvS1KpLtBNX31l/LZGHttbTXn6XNYQVQs/RRy7kO5OTOGRP/rf7e1D1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V0smB4rc; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lw2uoQlm; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V0smB4rc";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lw2uoQlm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772839655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=miLnnTGHi5wNa5u8dKX4lrgopohiQ/GLithTECaVPHM=;
	b=V0smB4rclnM31HdcCQJHRi3ZGWZ7OajQOKzOQb4WQLxvrjubsipMx0zjB22CLKwU8AKbD9
	GxXebOoD4/HgU7UaFaov8E0yiUBehvuF2ZgtcUZXxMEN0eCTK/Zx2C2sQnPrWN6rGvJR23
	AdiVtwGAQk+XIq0K5dYrhYL8pFTR32g=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222-mjDoLHOsMmmmDYIDa94Jrw-1; Fri, 06 Mar 2026 18:27:33 -0500
X-MC-Unique: mjDoLHOsMmmmDYIDa94Jrw-1
X-Mimecast-MFC-AGG-ID: mjDoLHOsMmmmDYIDa94Jrw_1772839653
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b8fbaa0787cso1244166266b.1
        for <linux-clk@vger.kernel.org>; Fri, 06 Mar 2026 15:27:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772839653; cv=none;
        d=google.com; s=arc-20240605;
        b=cwCOznoeqb0/kOYGYIngeVjnqPCi1HwNh6GUYvfNQ9O4Dye4BmCj0KzVa8LvJHuitX
         +69v6D8H6CG+OBiJOp0c5IpXW4eNFs8TnY+jZmgL0mItQGWonbBE6lBDGe9KPh2Ikqsr
         PkkRvzXicJK4fSliSfqd+mg0G+7K9xuSM5m+3y/x/Vec3NMaeWm4/Swco8KMRSayWtCv
         5Kvywi2hiDRB7hF0/vSPA0/VILGj0jIawI7gcKHn3kl2Ot0EUFUwnOJO5g9RyYdDob+v
         p1LkS82Sy1rDv8pRvoexa9e0jHTISOvKB8HCejYUHcAShXvpSyCTQKd7VA4bumT565fC
         ygJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=miLnnTGHi5wNa5u8dKX4lrgopohiQ/GLithTECaVPHM=;
        fh=KCyCoc2Mp2Wb76Eq6JEMDeNH6GYvTKI2ZMJ5XQ7uwzY=;
        b=F3R84JM6wdsl/4IIIRvbzQFYAZhl8y7OA+gc7++n2GxoONRsaTeag5ZTPsejLjHP5d
         vxAOmP0pqkmodPHWSlTEGpJj9C7drcIE8H2dv8AhE0mhDU9+UQ6TusqSysrgBXsrg+B9
         rAEMMNLAwDLTt9PDA6j7IPBGtX75mPPcUJFq9ylx9pK+O3nNq8w0/45cyMZTmrcZIzqB
         jIArYjXPeAOawx9dl2WhIIJbXXuK2T52a/luB/3xX52JThUQ8Xfv0ue4M143TQsrZzgn
         tSuDzD8ixKt4PLxXanhhwJc3w59wkEVL91I9ZLn3uZ/StgC5mb5s4KnrVlTtWpqGPSXH
         PEfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772839653; x=1773444453; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miLnnTGHi5wNa5u8dKX4lrgopohiQ/GLithTECaVPHM=;
        b=Lw2uoQlmSh3y323NZNg3c+e0/V2EkG1rPAwmqhowW8yMnM+W1JPww3OB4j0VaPN2++
         s25PoH2M2ifS+pfhJgiT3V1TiG4yj9fsNrx/Vj/aH3bxEvxt2PmaKOQQxZA4ycsO5hre
         6ZY1EMhiZ0r54nG3gtDUmbqKKQ5e5RuUcIs/FVRz8LPOYVOmark3so22jM8cyuS0DZzw
         tWmiuGm8aN5kIYfbcy71/aoXe5cKou4pTxWU2WgrnhPC/sJimR5Qmb+0HeePObPhZnMA
         LlVZhKpJsemhsUqEJXm6B3k3e1WqbqqWOCZKK5y7EZHkqA/NdohI+83gX7wXAB+Dvhvo
         /NdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772839653; x=1773444453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=miLnnTGHi5wNa5u8dKX4lrgopohiQ/GLithTECaVPHM=;
        b=j9D20TVWBS44dbBfhMMkAdSyuhX6VhL2K5tkcaw+cUDuGMBzyHRxM9+62Vy0RFUsos
         buRTT/HBPe9du6N6IwYuk9W34X8G/WKEo8jV4PEytuRuDl4u94i8mexZX4iNg0werOeJ
         ymq1kHsF1rHusVLumgxZl56Tkeaj4K3VZBG675OPVE+AJzJq+W2sgOpl7bX2TsGu1jTQ
         QXmUtCOYfaG4QONwoOZWv5fUEZlFPnQcujyF20Ds1/7wmJaQJ+3K37vEAUoFpStZ8Tdr
         rzxFvZLA2AyBkulMeLZCuhnXuEiOiVKUk4EkcULNwz0VdKBmydattlBJt4lIQR3rCcXc
         cZXA==
X-Forwarded-Encrypted: i=1; AJvYcCW/xoj5qQp8gtjP1/VDh6fMuEbXMuHbfF9fAMSAZoSDEO6irODSMxB1PYjQ9X87UYqQtUyrEJCjfeU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ834xrK+vduhwNt1AeEDAS00EniRIlPzy6hsgcJGygKygJgM7
	Y6FfhlMKtHXnIlwWZE8k4zyaJwXshFP5TbnpmBin2RWaTZWuYhlMAqzxgOLOAX0ZxG92PpoW2SB
	034ThYkwQUmiLvPUkSaILgOpdX0G5DRx+iKjlU+GaeXx7W/KjPKUz6LnwbzTH8Ybg3ThaDE9Wyr
	dQCpY8ty350zAT8T9PB9gWFPy+IyqtcIPG7LeG
X-Gm-Gg: ATEYQzySKV2ACT5d6CUNSyHeIeb6fDgEE6cKxDYS55EJ+BevU/80soasdDafKNCoZNQ
	TrHtrBJWEwW2/nVSP2rV0kVI2dkqn2gBC7pxOKSRKl0OWR2wWRDvxwKqmDYd7invxhNY/NwOPiV
	3OhD1pfPhSb1qr1MGCw/4aB0G+J5kkPh0hToQisBEUGOJwix5o6dq9nFNSpKLitViIyb4N5aACw
	tVnWvbJTcPc1A==
X-Received: by 2002:a17:906:ef06:b0:b94:1224:c605 with SMTP id a640c23a62f3a-b942dbc8cb1mr222234866b.19.1772839652689;
        Fri, 06 Mar 2026 15:27:32 -0800 (PST)
X-Received: by 2002:a17:906:ef06:b0:b94:1224:c605 with SMTP id
 a640c23a62f3a-b942dbc8cb1mr222234466b.19.1772839652254; Fri, 06 Mar 2026
 15:27:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303115550.9279-1-mitltlatltl@gmail.com> <d2cdaa7e-1a17-4e6b-879d-266844958410@oss.qualcomm.com>
 <aahGtIkxtNPeeWKc@redhat.com> <CAH2e8h5oHvaADPgE_GdPQsWrU00XUT1d0ktbE25ztMeBEE51Yw@mail.gmail.com>
In-Reply-To: <CAH2e8h5oHvaADPgE_GdPQsWrU00XUT1d0ktbE25ztMeBEE51Yw@mail.gmail.com>
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 6 Mar 2026 18:27:20 -0500
X-Gm-Features: AaiRm53k_VlQZv4zMVb4sFgV2r0nAPClUd_D6xpjJDMSvftewW2Q5sUxd4oiHeU
Message-ID: <CABx5tqJ_spoZrhX7n91rTOaMcp1G_n8jB5aJV-rNbSPYZBZxEA@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: dispcc-sc8280xp: remove CLK_SET_RATE_PARENT
 from byte_div_clk_src dividers
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	White Lewis <liu224806@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 4, 2026 at 10:08=E2=80=AFAM Pengyu Luo <mitltlatltl@gmail.com> =
wrote:
> On Wed, Mar 4, 2026 at 10:50=E2=80=AFPM Brian Masney <bmasney@redhat.com>=
 wrote:
> > On Tue, Mar 03, 2026 at 01:10:43PM +0100, Konrad Dybcio wrote:
> > > On 3/3/26 12:55 PM, Pengyu Luo wrote:
> > > > From: White Lewis <liu224806@gmail.com>
> > > >
> > > > The four byte_div_clk_src dividers (disp{0,1}_cc_mdss_byte{0,1}_div=
_clk_src)
> > > > had CLK_SET_RATE_PARENT set. When the DSI driver calls clk_set_rate=
() on
> > > > byte_intf_clk, the rate-change propagates through the divider up to=
 the
> > > > parent PLL (byte_clk_src), halving the byte clock rate.
> > > >
> > > > A simiar issue had been also encountered on SM8750.
> > > > b8501febdc51 ("clk: qcom: dispcc-sm8750: Drop incorrect CLK_SET_RAT=
E_PARENT on byte intf parent").
> > > >
> > > > Likewise, remove CLK_SET_RATE_PARENT from all four byte divider clo=
cks
> > > > so that clk_set_rate() on the divider adjusts only the divider rati=
o,
> > > > leaving the parent PLL untouched.
> > > >
> > > > Fixes: 4a66e76fdb6d ("clk: qcom: Add SC8280XP display clock control=
ler")
> > > > Signed-off-by: White Lewis <liu224806@gmail.com>
> > > > [pengyu: reword]
> > > > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > > > ---
> > >
> > > Looks like more platforms have this issue.. thanks for fixing this
> >
> > I hope within the next week to post a new draft of my patch series to
> > keep certain clk rates intact when sibling and parent rate changes occu=
r
> > [1]. This will be for certain critical clks, such as the ones used for
> > DRM and sound. I have it working with kunit, and just need to clean up
> > some of my new clk helpers and commit messages before I post a v5.
> >
> > I'd like to test this on some real hardware and I have the Thinkpad x13=
s
> > with the sc8280xp SoC. Can this issue be reproduced on this hardware? I=
f
> > so, can you provide me detailed instructions about how to trigger this
> > scenario?
> >
>
> Quick answer, no, x13s uses a edp panel, not dsi. This issue is
> related to dsi clks.

I posted my latest clk scaling work in an attempt to address the
underlying issue here.

https://lore.kernel.org/linux-clk/20260306-clk-scaling-v5-0-d21b84ee6f27@re=
dhat.com/T/#t

Feedback welcome!

Brian

