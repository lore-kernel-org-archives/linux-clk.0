Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DEC326952
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 16:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772208103; cv=none; b=hWXBxImES4mmFUbhJBgFM8Rpmm0+5Cdp85+uy2qTYdS8qxW6rDDS9nIE08xcbpm2tdLWZx3RbHTzSjj1/i69KERWi33KIlI6QX0fIo178CvzZFdkS8HpQGxC8NeN/CVretMZkj4CgBApzbiQ538dFlaRpsxdfXLbEE43h6Dnyz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772208103; c=relaxed/simple;
	bh=GEpYX/P0WY1RhW6hann8hF8mI2riWLr8Lux98UfllWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jm5Q+cTT61C1FJisZX4R3RAEaXYbJpmqtqlvCUP6r2CUy+zNeuHBlFYZM4R+RB2oABJ2KyAgdN53jAMkvq5P9KW83z6ey3RyfD97C/cJpB+h5ZqqTYjT79pnNmC8Vu7o7F6FXaeHsxMKQvUYfwWGNU5i/6GGOxf0MqsMjndDFMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56a9a7e762bso1627731e0c.3
        for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 08:01:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772208101; x=1772812901;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+Y4y+vPkdKot/5rJtboZ++IN0e4ri4EdT9ZINxJblQ=;
        b=aPb3UmG+DP3XImcxI22VdYQADEEKWxc9dFE5wxi81WZGDsckSnpEBYwIvYR8zq/q7V
         IrvIjWxcIQQ/FLQ1JHxqj3kKbxPG6b/20McqSpp2lpowzbrArCdKND4zQ+z5hgKQxcpt
         BeDoImTQWAWU+7gKBCRkadeb0xZ7z/D4Oyuyu8GYFJH4B+EHQ6lc5oCoIFrMAxfR33Mc
         QxuX2E/N0GtxC4o+x3RJOknDR+SiEDEg4ZzVCbTqNcqK2bWHXIwtKDRsrVCfHaqGWyH8
         roWBAwTx4Za0vi9j06qzmBsaDOGWTvMA5n7An71UPVqZOJ7yRkqJ4jxOaa1z6iru28y0
         Nhug==
X-Forwarded-Encrypted: i=1; AJvYcCXJqh0QlOhCMkYvFUve8a3MnXx8K+VjtST2PZPc/Nz8wkKou7cbkMXyge0TwvsyTHBudQyR5fbJzmI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLvp2ZvkuGfnTHjBOV2q/osNUdEyVThAfz5I5LK8LKbLUysvFz
	HOFPr80Mj/uQe4SidQv//5QU0Z6eYjUpUhGkkIk6xfQZvXehRVfdG5yNBniHwmcN
X-Gm-Gg: ATEYQzzV0zV7gOSOdV0tf91Epr7J9Qi4vi5xQcFodMTLd8YCD22XhtQDNLVcdTE1jXZ
	+upHeAkRUrHlmEuoZ/cfucuv8HLkyFAmCMk2ItoQiNe1/1J009Zs1dvi4fhFZJNQYoZIdQomYAv
	sXLAMTVofAO4lCRTRdUd8hyuHuAgb/XSaq67A0X7jZFzVB+mmW/NiVs/3zH9M/0NIQ3keZXvTM+
	T0vvD41IHzcLpqvXvej6eHI4ETQQuISYnkW3olj5pGrBBfCr2ThfBXNXTGrTNHPVdmwLiwGQUqy
	DqIP3Ntoc9UmMrX1iQynJvQ5GZqadbsvQrehsT48vyl1eALdIKYaB3lYhKCnWP1Jya4lQg9dWwI
	f+DyB7agDIhK+BHDPSI+N31YnO1D1Eclcy8A+6r2S8QY0O9kVRbJfHJ/LGIIBtxdjCCbCPeY2oE
	ILMRre8QRaWmYcZirb+4hgILmfbbvPasUSmtbOzokUNAH2+Pf5dbTvrR+M+NTE5xtu
X-Received: by 2002:a05:6122:9006:b0:56a:899d:6869 with SMTP id 71dfb90a1353d-56aa0a2898emr1945483e0c.8.1772208098381;
        Fri, 27 Feb 2026 08:01:38 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a92177fbasm6747996e0c.16.2026.02.27.08.01.36
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 08:01:37 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56a8e0ea02aso2355737e0c.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 08:01:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX/y3/Srk5ivEzNeoSmggf/HwvXUxhPKb5P1TvNjLzTGJs4eQKONusLHD6TfLxXd9AT9gKpKdYFrcw=@vger.kernel.org
X-Received: by 2002:a05:6122:2218:b0:563:702b:e2ab with SMTP id
 71dfb90a1353d-56aa0a8c538mr1985853e0c.12.1772208095876; Fri, 27 Feb 2026
 08:01:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
 <20260226-clk-det-rate-fw-managed-v1-11-4421dd2f6dc6@redhat.com>
 <CAMuHMdWPiy2OYEntYNEMjkxYPrQBED2segMfND+4VtzdeQE6+g@mail.gmail.com>
 <aaGxrm0SqwaJWCph@redhat.com> <CAMuHMdXR1T-VUnk87qpCmdkrYZr=UbjRJNznLw3YV98JAoN=hw@mail.gmail.com>
 <TY3PR01MB113460B83239C8251DD2FA39F8673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aaG8v-y9UqsgOZxy@redhat.com> <TY3PR01MB1134626136D6AE06C9A699F798673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB1134626136D6AE06C9A699F798673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Feb 2026 17:01:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVfyfoETQ1dHPv7_N2Z-LJjw8DnE5T4YuOUNGpjqpsWZw@mail.gmail.com>
X-Gm-Features: AaiRm51rTzMU_GNOTDAxYquJVGa_Qe96mTu5YWYDiTP7adhStQvfPh5SXkuubWU
Message-ID: <CAMuHMdVfyfoETQ1dHPv7_N2Z-LJjw8DnE5T4YuOUNGpjqpsWZw@mail.gmail.com>
Subject: Re: [PATCH 11/13] clk: renesas: rzg2l-cpg: drop determine_rate op and
 use CLK_ROUNDING_FW_MANAGED flag
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Brian Masney <bmasney@redhat.com>, Chris Brandt <Chris.Brandt@renesas.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 27 Feb 2026 at 16:57, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Brian Masney <bmasney@redhat.com>
> > On Fri, Feb 27, 2026 at 03:23:19PM +0000, Biju Das wrote:
> > > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > On Fri, 27 Feb 2026 at 16:01, Brian Masney <bmasney@redhat.com> wrote:
> > > > > On Fri, Feb 27, 2026 at 09:20:09AM +0100, Geert Uytterhoeven wrote:
> > > > > > On Thu, 26 Feb 2026 at 19:18, Brian Masney <bmasney@redhat.com> wrote:
> > > > > > > This clk driver has a noop determine_rate clk op. Drop this
> > > > > > > empty function, and enable the CLK_ROUNDING_FW_MANAGED flag.
> > > > > > >
> > > > > > > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > > > > >
> > > > > > Thanks for your patch!
> > > > > >
> > > > > > > --- a/drivers/clk/renesas/rzg2l-cpg.c
> > > > > > > +++ b/drivers/clk/renesas/rzg2l-cpg.c
> > > >
> > > > > > > @@ -1041,7 +1034,7 @@ rzg2l_cpg_sipll5_register(const struct cpg_core_clk *core,
> > > > > > >         init.name = core->name;
> > > > > > >         parent_name = __clk_get_name(parent);
> > > > > > >         init.ops = &rzg2l_cpg_sipll5_ops;
> > > > > > > -       init.flags = 0;
> > > > > > > +       init.flags = CLK_ROUNDING_FW_MANAGED;
> > > > > >
> > > > > > Iff this is the Right Thing To Do (TM), it needs a comment, as
> > > > > > this clock is not managed by firmware.
> > > > >
> > > > > Before I start a larger discussion on patch 1 with more people
> > > > > about a name for this flag, help me understand why this provider
> > > > > has a noop determine rate. Is the hardware eventually programmed
> > > > > with a rate that's close enough to what was passed in? Or it
> > > > > doesn't really matter what the clock rate is, just as long as it
> > > > > is running? Or should the determine_rate function be filled out in this particular case?
> > > >
> > > > I'd like to defer to Biju, who added the empty round^Wdetermine rate function.
> > >
> > > PLL is capable of generating any frequency. that is the reason.
> > >
> > > But we could, call rzg2l_cpg_get_foutpostdiv_rate() from
> > > determine_rate() as modified rzg2l_cpg_get_foutpostdiv_rate()[1] can
> > > return errors
> > >
> > > [1]
> > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tr
> > > ee/drivers/clk/renesas/rzg2l-cpg.c?h=next-20260227#n590
> >
> > OK. So how do you all want to proceed here?
> >
> > Do you want to fill out the determine rate in this driver? If so, we can just drop this particular
> > patch from this series.
>
> We plan to fill out the determine rate later, as it can return error.
>
> >
> > Since the PLL is capable of any frequency, do you want to keep the empty determine rate functionality?
> > If so, we could use a different name for this flag. Maybe CLK_ROUNDING_NOOP?
>
> I guess, maybe we could use CLK_ROUNDING_NOOP, till we have proper .determine_rate() for this driver???

Just keeping the empty function should work, too, right?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
