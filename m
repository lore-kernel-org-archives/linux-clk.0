Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C2C341062
	for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 15:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769442986; cv=none; b=UcoDR4ivziRiSe/c0vvsgqu+nZkU1beCkF4bYqN3oOAqsddS28RXIxDUJ6bYn16SS/hNN8oiZDttri1yEDyec/V1cvJ4qYCgvQqHhPw1FqIwz7t4lAPjMLyfmCoCnnArzoIJJNEO1LCh7D5lh6DiHqyAagCpboRilMIXvp/sycs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769442986; c=relaxed/simple;
	bh=j2Ql7ryMTYd6hLKkTTmh/xjJDWhevGva+bLot43hmIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t/3PdxlOfb2+k8mK4DYAlouJizKjbFMyXCGTVZQTH7c78S0Si9e980M1/7hIBlrMQ1ECqAo72Xf1h+BQylYJTCuXTtP2bDMk/TdybQ7ZiZwfpkkl5MrtISnIu+EtLmt2ScUQa+BOtygXX2LFwIgIeZZS7t+97SPfkuFqzx7qsS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5662c2937fdso3943343e0c.0
        for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 07:56:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769442984; x=1770047784;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bW75QeMDV4a8PkPxWmQfsAC+HhpeyRhnFa7BZti7x6E=;
        b=EKU0Vc2IEWC4mDLeO7hqwfLYYKoEx1Nd7eSElHy5YkqzhlL9/aeV5Dd8fXHSCXGiYY
         +Am+CRDV5qryk5r4WQV5+9frF4rshI6RAakUip/kSknwPYRd6JWCqAMFZvsahWtvn+qe
         bo8Px4DWJ7WCw/r51K+9awaF8ORhF+es0SsZeV8HUIEc8YvprS1QTitwvt2Us8Gr1T/m
         1PxujBI63JL+R4j0bctmY2PohaiHC/A4CR2R8ZgFDPgySPNTmUhrSqWcU7X4sfNyB70R
         5/UHcRpUNR9g0r68wkWkC/SigfZcJ2D3tx4WDaYB+pwOpoCtZDWvnL0B2zpXYrl0P4aI
         CsSQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3F+4diKbbNkduL/COLdE1AVv5r+MnCIKrY1OoRkvz+8LFu/qS4iM8mvmurXA+rgJx2umvh/icV+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIh2pskBJki8ZI818VylUSpEZLPEpyWrhePzabwuQ9oAqokqPt
	jKIdQH8akmUsGCC1BvE3Cqhv9WTULx6EUOR8dvCBPd9vQc/N9RBRzbIyqix4cAAC
X-Gm-Gg: AZuq6aLfRc1Oi4XEr0C5xwAy6WHetk4aCLBI8Od4lfPW/MuK6Bf9tF0ooSF3D+5S9q1
	rKHwSEOdxhhppGoXrJGI6QksPMRKmDvpkVFdbBc4q0Dl//xkrskX70ve9bFlgSXKXtWvl1YCJse
	nfVoC6auBGuPHEU3y08t74E3vC9PC3wKwPnu5yrkkTWzj6YPj0bKY0ZirdggkCY6c3wygw3bDlg
	lQ2aP+vC6oxQRnxCy16KAkDNQEI7yLeh/W7vCzYv0zWWMKcUrDs5fy0erWj1pFhshISYE/+JtYw
	1IYoglLV+Oha/9FAFOMMIeHNgNmUZDhCLt1nx3QklrUjGQ1suTb+O5eTL8SbGm/eweiPN1JaeqS
	T/QzID5iIIh15y1cwMuFU0ReA+AfOWOS60/4KmzPbhsvyFGWgCPUsgNVS/MG02Tfwy5EqPgrM07
	X0nW0Fx7M6YnP0ggN/DmeGPZOqzZKoQ6AOf2G4hcmRA1++BJ8V
X-Received: by 2002:a05:6122:602f:b0:55e:8569:4dd1 with SMTP id 71dfb90a1353d-5665d70ed52mr988583e0c.1.1769442984486;
        Mon, 26 Jan 2026 07:56:24 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-948369daf5esm1497217241.14.2026.01.26.07.56.22
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 07:56:23 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5f5418c40daso3231631137.0
        for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 07:56:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVaenOv80To/AXuW+yldspZp/MZu93dx4c0lYAoROua+FZyjbmwO8GG/o1SBxx6WMPnrNzlMPBYjUY=@vger.kernel.org
X-Received: by 2002:a05:6102:5489:b0:5f1:b58d:bede with SMTP id
 ada2fe7eead31-5f57727844cmr1470425137.7.1769442982080; Mon, 26 Jan 2026
 07:56:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125192706.27099-1-ovidiu.panait.rb@renesas.com> <20260125192706.27099-4-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260125192706.27099-4-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Jan 2026 16:56:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUeGJO-byndbrDDEO6dLun8cyfqe9LZf6PYRP+HG4OONw@mail.gmail.com>
X-Gm-Features: AZwV_QgJ0TDPdAIJdv1mbLt6nJx-pGX34vWTaFM3iyDnGfxutud9aETDmEzc77I
Message-ID: <CAMuHMdUeGJO-byndbrDDEO6dLun8cyfqe9LZf6PYRP+HG4OONw@mail.gmail.com>
Subject: Re: [PATCH 3/5] dt-bindings: rtc: renesas,rz-rtca3: Add RZ/V2N support
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, alexandre.belloni@bootlin.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 25 Jan 2026 at 20:27, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> The Renesas RZ/V2N (r9a09g056) RTC is identical to the RZ/V2H
> (r9a09g057) variant. Add the compatible string for RZ/V2N and
> extend the existing RZ/V2H reset configuration to cover both
> variants.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
