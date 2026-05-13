Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C806282F39
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 13:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778677998; cv=none; b=fzqYmsCRDliUhTP+O9gs/nV/jtP4+TQg2Uaae5c4esrnk4ERwhF/roqoyO/8/XZsftVF3o6BKzaAH0tpSEPcHRjGHADIR/tjJbWwSMKc+7gVQaOhJ0Dx4vdrxiaswTgtq3adowhGSWp3QaApW78egRFzLYV1eNx+AHvIau9WocU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778677998; c=relaxed/simple;
	bh=ptGVfY8dowl21jHV2wAijSOBwL93DMJ7Wdq/sitHQUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A9VnEkSuCSzcVI4sFDxxzvBSvJWmVyz8N1GfpwMF2a5n2+JTD21O2hHP2+IyXApRi8UmDJho2PjDVdK4ec4o4EaF31ImDBCNtvuNEoCzMtKSSJTAgzu+OKOeb5sa1QqRtOczwXressDeFbLWkRTFlREq3RWJiPtXbnWbH4FxdP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-6312bdd281eso4957810137.0
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 06:13:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778677996; x=1779282796;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dw4EVFD8umbNXj6ZLEY6BaqpT1xcbjLyZmag6+hF/7o=;
        b=iBqHqTnzh2VxLL95fIbWJ/motwAluY+UoK392Ceq+gpt6oyraqXVPr2WEu2ZG3SExQ
         /Cc+UYQ+6hBesVI+rvYKpVIY/mzOWhHEP0dTs3potvrXSqPo+fLYFNGFJUXbufqqDgs+
         7N6uS/ZScktl5cwIPJppMjgDFDVLVE152BhDJB5ncL8cwr/o519CNkH9zJFBixTcMzxG
         /RT2bpgFPqO8YFyCvMkx7TugqxPxAL6VmqZSALbUmD0NtjpbhEHpt8O7ocE209flubIJ
         n4YZPm59rw8fq97oF5eavSS8GMil/vSh8xRvDcAXXoDZrPnRpI4FVjftf8P6nObTgYjO
         bAwA==
X-Forwarded-Encrypted: i=1; AFNElJ/3NqglDBOGh/N4A8Gxfkyr45twDQ+SmhAV2FlByfDymjKKVBrZHwiodaBOWSS9zWPIxXcnY4gk5lA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeEE9tZfqxJCIOgJj5cRm+ICG7fw3H+5ZwDuiiucR5jQo0liUk
	5k7x18IcOmJPiUcCCq+ZyJ7R8ijlmRILKoRbic0M5qodm674jN4VN1/Cjq2gqIEd
X-Gm-Gg: Acq92OEmVW/gbpW7tUFiAwCHqnFldJv1O2eDRydA8DEFkgtb0FY7CX1Q/EXmhZIa1D3
	fohNouj+BhIvKOzN5NRxvmPlQXWSrYF0GnFgqcUOo76nADaqnq8yJNAZ3P8U6xGp/8O/86gAA1q
	p+Qy0iZJpgYDD4zA/PQhMRfhaJ7fEMajbsjl6m6tRkGTeIniVugOo/o9Th6I5BkvHayo1vo6D1v
	dbcn+mmzoWQq/lJAZhZ0jQAi/gq22Yni772Cf+0kqm/xjzOQ+FySQI6S/x4Gal+WMclR2eVFYlm
	KYKv++dZ+B6mTAITAiVuY21wSBE2NmNUdHPwP1n+NsO434d3rVHvrcfO7/s7xSNghW1/OgGXwOM
	YKIuafGN1hWH4S6OO4Pjw7CLAOV5T35zSAwwte+eP1cA8QABuTuYfJ3ousaVzb0NP8S+8b4YA6J
	0yXs7A13QjLWWC+/vhcyoypcl9KSDLJhVmprhywEy3YBzn1Sf8v+VS6XznFX+r
X-Received: by 2002:a05:6102:4a88:b0:631:6403:b12c with SMTP id ada2fe7eead31-63761a489ffmr1199747137.5.1778677995952;
        Wed, 13 May 2026 06:13:15 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-631402487f3sm9677400137.10.2026.05.13.06.13.14
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 06:13:15 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-95ce0cf2d4bso3905144241.0
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 06:13:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8dLfX7RGqsBl0PbdiIbM4gsbrNWxLSW+XB/JN6F+D+71tsuR3DpGpBmAoFtPU+QIt9yvxV9BSfKJc=@vger.kernel.org
X-Received: by 2002:a05:6102:148d:b0:611:959c:86b with SMTP id
 ada2fe7eead31-635d1ea150cmr3550416137.16.1778677994300; Wed, 13 May 2026
 06:13:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org> <20260502185557.93061-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260502185557.93061-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 May 2026 15:13:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXmwyFSP3TsVjh97=wDmGLYNfX=Nr=97NnDP5H=Czdwnw@mail.gmail.com>
X-Gm-Features: AVHnY4IveyelRqFQvstMxxryiMS78Fp-yg20GxMmqsqgU9kR07zLUMeO9C8m-YI
Message-ID: <CAMuHMdXmwyFSP3TsVjh97=wDmGLYNfX=Nr=97NnDP5H=Czdwnw@mail.gmail.com>
Subject: Re: [PATCH 4/4] ARM: dts: renesas: r8a73a4: Describe coresight on
 R-Mobile APE6
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 2 May 2026 at 20:56, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Describe coresight topology on R-Mobile APE6. Extend the current PTM node
> with connection funnel, TPIU, ETB and replicator. The coresight on this
> hardware is clocked from the ZT/ZTR trace clock.
>
> Note that only core 0 part of the topology is described, because the
> other cores are still not present in the DT.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
