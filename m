Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70B9435EEA
	for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 12:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787661061; cv=none; b=I9Zt5kW4+qAIe/8cPHMQTme7Tk93y24colmam4ATjwVqWgjPsdsYDIEz7DB66+5Gtd4ku9R1CLtd6t5gs9dh7S/wUpFnEXka56uvCB8rylfhOfRkdWdchCnk/g+PW6sItKKc86jkEw7qfH+JOviJNpu+fFxrUu5gPLjVhz8MWas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787661061; c=relaxed/simple;
	bh=XVZs/xqSmR+34+BrwmpxC0cd+dGU1Zxb/J9zlN0cTU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ChFklvleClSaiRhy0DDQtTPnEdsnF7Xez9Qn51M7zqATl+u3vjbv/SQDZmJBhAF0efpaK+IZp1HjKNo9a19uoXFpb8531FGerbfrSYUI9iuR5G34ncDEdXMRUUPF8ainFTxMBUtw05gPT9/MqmL4Mg4ulqdzhv8UpcyqktNKZDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9773c6ea885so1190098241.3
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 05:30:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787661052; x=1788265852;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ILP07iJKBmCL4umuQJDRJxi/o8MvR2u5/1eDo+tc9XU=;
        b=YnrRkJH1lRFWAbrQxFTwzkpQ/Gi3DdkSDNi/csFiErSmKEzhdM367hFfWDi3bd0xLF
         OzQE9kV2iQgnGAIIipY1XlvAJaQg/x2B3VK1l8r75Uvr4HI2wF6QDLXG9QKotWqsILkY
         ++6q7K0Ddc1XA3TlgVBNXb1D/sKcFyJyLRDgAjH78RwyS1MPYl3dpQbcKJSR1ZtX6NiQ
         jbX3ClEARvQ8goIUkvgi0m/yNuTID4Y3QbZa1wIRXzGFVGimLow1xOo7WGBfcC3AruQw
         kfPQXaGiQ5N1vyP3YHRWchNY2vb9QcAhQwws99DUr6jQ/X6ttISputY1AvaEpg4UK4sQ
         XjYQ==
X-Forwarded-Encrypted: i=1; AHgh+RqdUetJEojgd6+dMQx9HaPlX7YAvon7DN4ElDYmOhJKApKp6mqy/0HnEVJdC753fKMpauvTGVHpVG0=@vger.kernel.org
X-Gm-Message-State: AFuF++kQDonRgLNA1/5B61/fmyWpygKC8hbGj3Kzb7StrJvLysc1Tymq
	8MJrzSMALn45/0Mj56ojGIemYtKnGVAkxt0vvDshyh0YCk5pjjdWJkwL0q8U8GOQoeQ=
X-Gm-Gg: AR+sD11m1wq2zcpuwnS8rAcy6JWeF9n2H0UsgQYtS68R8N726hBaG4dxiFz7iz5JBmK
	6fKBh7rlxVyxL3FK3OZLNWyklG4arj5T4/p/QrCrjXd3vvmMEyK7QNNFDWa+WlYvyKq38JgK3v6
	JwZUBpmGLfKlQ8O0Sg39W5HoAFGzudQUfwnslbx2HSoXKzXGpcbKzS4gPqdNYCjk7dGm28so7TU
	gPWskRfY142/QAisclMuyV6xjWbfAY0KTzs5ZfQCkTe/hplxrSjn5Rz8ehjYYv9M6rk2W2hMxE1
	BYlKmHN+GCce+6KYTASFSIzhcsZMCSYJjMFytnnU8W/9zGCzCstMP+CNrgoowugQvtrBSTZFv10
	iMp9tVWUROSR1qdlh9ux5WrKrj34k1gs7ureo4RtOdOT40Ne9z5bBpMEAhkk70sl6niP4iCmiV3
	el+d/AyMcbKVWglqwctDIc4DPczNaAaYOp142AS6SnqANLwppZohMeF+k84YJWqtSlpFW95eqD6
	TQWbGwEsNUrQLckqAahibxWKA==
X-Received: by 2002:a05:6102:2912:b0:778:71e5:45d3 with SMTP id ada2fe7eead31-77a6434e104mr9993717137.9.1787661051888;
        Tue, 25 Aug 2026 05:30:51 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97c836fa8bdsm10482590241.9.2026.08.25.05.30.51
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:30:51 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9773c6ea885so1190087241.3
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 05:30:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqeqmwU2NvsWaQG5eFq2oS1ukVj/jhVUgdTL653kfocSzwEuWmsmnHBP8EglBDJ3byK8NU09n9djIM=@vger.kernel.org
X-Received: by 2002:a05:6102:5107:b0:778:4c28:6725 with SMTP id
 ada2fe7eead31-77a6434bfc4mr9788298137.10.1787661050975; Tue, 25 Aug 2026
 05:30:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260817192540.423994-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260817192540.423994-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 14:30:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWO8ARCZtT7m+bndN5szyzRxPwQmZ-GKQ+ho+yLgTH0bw@mail.gmail.com>
X-Gm-Features: AcwNN1XXro5QQ7iyl-KmnWQpVLzoicJmI0T4QyJFnTkTZ2UbLlORJ3tn7mvhDjA
Message-ID: <CAMuHMdWO8ARCZtT7m+bndN5szyzRxPwQmZ-GKQ+ho+yLgTH0bw@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] arm64: dts: renesas: r9a09g087: Use CPG/MSSR
 syscon for WDTDCR access
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Aug 2026 at 21:26, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The WDTDCR registers for wdt0-wdt5 reside in the second register region of
> the CPG/MSSR block. This multi-function block is now exposed via a unified
> syscon regmap interface.
>
> Replace the direct mapping of the individual WDTDCR registers with the
> new "renesas,sysc" phandle property pointing to the CPG/MSSR block syscon
> node.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
