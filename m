Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8193DE438
	for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 14:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786373838; cv=none; b=MsxEzYnH+ZVlYE/CTBu/ne8lP6AvJlg1VRmaA2IgvSEVU81w9eojQD57L8c1OzGHJBreO0Jd6GItZB5VE0yD7fAOvutn8gCRczhRyDVtq8PuqASWpHqT1ox/agoV5DYPMjQBbq4at0/4P4ryv4tzGJPeW9xJ+7Bi3/bkYofYn8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786373838; c=relaxed/simple;
	bh=n5rMYOLB08GVMHx1R8PCKx0D3UZSKzHrcfaS81rxPSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sE4/eOBoxONgIpdI2nmsNpUAUG0U1zGOvEuUQKur4mGk9c3uytLwmX7RrtWeDlHG5PrQXWdHJMW8o8ugVsXb0EUepHoxK6VTPsMjWS9efD5F9ls/S09DFCYButi9axvg9sjcciT2G2HCl4l6dA880Gck8tTuQs8SRPnNeQLTZaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6acb63301acso1391369eaf.0
        for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 07:57:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786373836; x=1786978636;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LDUVqF9bGKPqsW39iH6LzgBQf6STHLl+9ztnXalCrFc=;
        b=mnZvVSMVF5NXT9Xw7iI07zV05GJW5bac3iDoQCR92wk/pYqhgPTsHS0LRHSEZTkg+V
         gMRcei/nqrLzPnbLh6QeWCTav/jd7kwaTOm/z/Qg/mNNsZR3xPEWItThfcnbOcprC2uD
         KJgUlQr8x9wGCJY0sEVuMb5/q3RbUVnC10gS62tYMKCSsICDZVThJ9Glni54pxaNbMt/
         T/v1Oxg1L8z6x9BRlO4rcu7vi5w+RXwG5Q4H3Tp7Dsj/d5CReuHWyEicSSqd5wg1v0LV
         2NiJmoIrQXxburiDF51PIPKhH4nJ/nwU8IxBbh1ooh5Ownn5YfRinryZrq5g5i7WLg+a
         YlyQ==
X-Forwarded-Encrypted: i=1; AHgh+RpMcEVXkZKYsP5P4Rb+N+vUra7tU4frkQWh8oCP/wOsu3jwg7g+WIN8RsTUHapTOhwuW2jKY9J11kk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy+7I4pPEG1ev0yNxrraIPwQu+V2isGpYOOvBJ3UJu9XVxu/l1
	AApTLaXf1UDUowdmunAt2O+rOQB8BdYUSmpp+jcZKdm8w+QvVZolQ8izGJWS13ts
X-Gm-Gg: AR+sD134xkxWcZxh2UxJoUQ24TTcpr9EmAcQMPKisfC0fPcUIrlHlW9+OddgOfSe6zN
	l3gLeoxnMAAPlsXNLIJ2+Dnm+1alk8QKrI8Vt2SQrZNfyIHThBQm9Zf3/YorAjra3v8cS4gad39
	wvzO9PvRFbVxymzWePKjkQHBJigDwzZe/PSx47HZAa5N3i5hsHlejJROcA8hQ89JnRpEWqW7QHl
	anTTGViq52haku4Vy1bJCzqiCAx4ISq9At5yjX2Ef6cbvbfRjdiS+TGKbtoM5rxAzgNvharSNHs
	TLMKgqeok1ckrVxq9GNPpQ96U65YczqVO4EcS3VXHuHMlCkN9PhjYs8RxAfCtrWo0MGCZDTQDb3
	0qcFFDmlclXpPVoxLe4qohVbDhotyMmlKDPD9S5CMnIYhdU4OnoVvOhv9j5emYLRBj9mV5IPqkW
	08Dw4q4P4bMDh6TfgZzlurWKQoN2HIXKT+SmdJoFifI0/0KPzpVjMggmzbQwi66vvqiqSnY9Ml1
	UMnzJeFl2ZZ6n9hA7MkTb61NQ==
X-Received: by 2002:a05:6820:4cc5:b0:6a1:64df:7324 with SMTP id 006d021491bc7-6b044e79196mr9420244eaf.7.1786373836350;
        Mon, 10 Aug 2026 07:57:16 -0700 (PDT)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com. [209.85.161.50])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f35b76fd4asm7562344a34.15.2026.08.10.07.57.15
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:57:15 -0700 (PDT)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6acb63301acso1391355eaf.0
        for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 07:57:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqaaVqGwRo909nG8sqK1/g7z50wP+pPICcIs6skA81K76AujsEJGp+2WDWcInlVddQ4Aj/9zPHM+DU=@vger.kernel.org
X-Received: by 2002:a05:6102:2082:b0:74d:5456:b6fb with SMTP id
 ada2fe7eead31-7652241d10cmr1596982137.16.1786373431244; Mon, 10 Aug 2026
 07:50:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1785941595.git.geert+renesas@glider.be> <CAPx+jO87d7H92KSR7R7ObR05sM2JcHBCo+YuUf_1gE-KwhR7CQ@mail.gmail.com>
In-Reply-To: <CAPx+jO87d7H92KSR7R7ObR05sM2JcHBCo+YuUf_1gE-KwhR7CQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:50:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW78wFHKP8n2P_MEVASO3MFHCjXkEWSFXfE3-mCjkhsgA@mail.gmail.com>
X-Gm-Features: AUfX_mzSDh0l0A6CyrHddRhefJg-h_HSruJEAkSrbmndCIqd_rMaLktXcM1WovQ
Message-ID: <CAMuHMdW78wFHKP8n2P_MEVASO3MFHCjXkEWSFXfE3-mCjkhsgA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] R-Car X5H CPG/MDLC support
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ulf,

On Mon, 10 Aug 2026 at 16:18, Ulf Hansson <ulf.hansson@oss.qualcomm.com> wr=
ote:
> On Wed, Aug 5, 2026 at 5:21=E2=80=AFPM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > This patch series adds minimal support for the Renesas R-Car X5H Clock
> > Pulse Generator (CPG) and Module Controller (MDLC), to aim for replacin=
g
> > the dummy clocks in r8a78000.dtsi with proper hardware description.
> > These two components are closely related, in the sense that they are
> > both supposed to be accessed through the ARM System Control and
> > Management Interface (SCMI) on the Ironhide development board.
> >
> > This series consists of three parts:
> >   1. Patches 1-2 add DT bindings and DT binding definitions,
> >   2. Patches 3-4 add minimal CPG and MDLC drivers,
> >   3. Patches 5-6 update the DTS.
> > Note that this series depends on v7.2-rc2, due to the use of
> > <linux/device-id/of.h>.
> >
> > Changes compared to v2[1]:
> >   - Add Acked-by, Reviewed-by,
> >   - Add fixed-rate clocks to kerneldoc of r8a78000_cpg_priv.map,
> >   - Use devm_clk_hw_register_fixed_rate(), drop unregister_fixed_clks()=
,
> >   - Drop fill_clk_map(), as it is not really needed until SCMI remappin=
g
> >     support is added later,
> >   - Replace <linux/mod_devicetable.h> by more specific
> >     <linux/device-id/of.h> in v7.2-rc2,
> >   - Add a comment to document only always-on domains are supported,
> >   - Consistently use /* sentinel */ for zero sentinels,
> >   - Drop trailing commas from sentinels,
> >   - Sort MDLC nodes (alphabetically, by label).
> >
> > Major changes compared to v1[2] (more detail in the individual patches)=
:
> >   - Add default support not using SCMI,
> >   - Drop everything related to SCMI.
> >
> > Note that this series does not use or rely on SCMI in any way.
> > SCMI remapping support will be added in a subsequent series (old versio=
n
> > at [3]).
> > Full hardware support without using SCMI could be added, too, if anyone
> > would care about that use case.
> >
> > For testing, I have pushed this series plus additional work (including
> > a rebased and updated version of [3]) to [4].
> >
> > While I know it is getting late in the cycle, this work (especially the
> > DT bindings) are a dependency for about any R-Car X5H progress, so it
> > would be good to have it included in v7.3.
> > Hence I plan to queue the clock patches (1, 3) in renesas-clk for v7.3
> > (Stephen still hasn't merged my earlier PR for v7.3 anyway).
> > Ulf: It would be great if you could take the pmdomain patches (2, 4).
>
> Patch 2 applied for next, but I left patch4 for now as it didn't apply

Thank you!

> cleanly (drivers/soc/renesas/Kconfig had a conflict), thanks!

I guess your tree still has the duplicate "default ARCH_RENESAS"?
Patch 4 just adds a single line there, and the conflict should be easy
to fix.

If you want to send me a new patch, please let me know.

Thanks again!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
