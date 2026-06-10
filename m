Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9603546FE
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 20:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781122845; cv=none; b=LlmuDekkI7bBPYuXMr7+ML1jKIT3bXni+JLAN1Dpj5JSKtN5T+T8ZZy30QSS+RhGrSqegf5z9whG9g4EQpQxZNtEbmGnOH2icOuli/77+gEZJZPs25ZaVYQjV9Wz/tiImHOl4XesVP4ZjhRLrOOukWj04ChZsNgX4sKqmZPr+C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781122845; c=relaxed/simple;
	bh=w3l3yDnbgm+Zaj+XQNyNJmfkqfafywFr6Cmccn8YRwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eLysZ2YLYFoHcEEDbYeIBwIHsJCT4GkAyQcZSe1GzgkrK3Ojbm2v76WDEh08Qin8AifDFKXS9vvni52EqiqW2G4EqOCFl60bR75VDODe2yRSaJ8dMb74tji+uME4Nx9YzxsNmUlSa15RmdZKuAq9X167BVDuvw4u17/8obQ4muw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZNChPuis; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZNChPuis"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 556E81F0089B
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 20:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781122844;
	bh=7MpVecaUgdguCZfjn9ebxCVN59RtMPrEJAnHrmgeaQs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZNChPuis+DRqvTb74zzV7UJNQY5CSiP2uU9K9IbZdL07E7PA1aoospdwvIsl5xHEd
	 LpsJNiB15KPwS8Y1qHOsHbckvpCHbuGRCT/fhoLx1XVvVCh762oo2yuohsgd7HIN8T
	 CrLg/RtKeZh669N679G4t0WfjaDwun+ORpp5hf4vjMvqvanUwRJZ38MGpmKT3WDGTi
	 DcGmWEgApgomiDTRxRc4WAo05FpI4MQGFp2X0uukyHF9rVVauOsFPmXZqeRBnPMgOu
	 i21KnUHxXpe3lBNk5Lu+ZfvsWprpVOEWKbiRVfcIBmtKOWTsgs0lgQwJ0g495iRiFV
	 1fPdBKes55kqg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aa68d9d4a3so8190397e87.2
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:20:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8Dlh76SyXar9hmmkByvPL//dCbT4tooSxnPYDp1dfA++FOAksUXASvpL1DRC9OttHdpaMMZYEBfzU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ1xy0NnZunmpMHknXnkEzEr4fMIydsfq5njoRC/8h4U6tsEVK
	DTTThmQlDGjB6jM6q1VSZqmaiC60wA8OWR00eaWAxt2umkv8zDc3oFSZZxK4wpt817YSVUs//DJ
	huNvq7P2+7ix56Qixnx4G0yMlgSZYwNA=
X-Received: by 2002:a05:6512:ba8:b0:5aa:8823:e312 with SMTP id
 2adb3069b0e04-5aa8823e397mr6377779e87.48.1781122843097; Wed, 10 Jun 2026
 13:20:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1780148149.git.github.com@herrie.org> <dae03d8bbd4a9cf14622eff86f8f83460fac5e86.1780148149.git.github.com@herrie.org>
 <a3a6f1a7-5539-48cc-920e-5a555ba04e7f@oss.qualcomm.com> <5umlewznxfu7pmprbvbprsqt5uwjzb666kw5gwdxethpfgur54@mlggwypljii4>
In-Reply-To: <5umlewznxfu7pmprbvbprsqt5uwjzb666kw5gwdxethpfgur54@mlggwypljii4>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 10 Jun 2026 22:20:28 +0200
X-Gmail-Original-Message-ID: <CAD++jLmm6VyFCrxYA14e-Cbj_7dQu1OkkazYiWS_=tSZgCRqyA@mail.gmail.com>
X-Gm-Features: AVVi8CeCLiBaumQSUbgPkZj57tEY-qUT1_X9vl0wjqykeH1ritjqt_KRYleR8XY
Message-ID: <CAD++jLmm6VyFCrxYA14e-Cbj_7dQu1OkkazYiWS_=tSZgCRqyA@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: qcom: add MSM8x60 MMCC driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Herman van Hazendonk <github.com@herrie.org>, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 3:39=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
> On Tue, Jun 09, 2026 at 03:44:39PM +0200, Konrad Dybcio wrote:
> > On 5/30/26 3:58 PM, Herman van Hazendonk wrote:
> > > Add a clock driver for the Multimedia Clock Controller (MMCC) on the
> > > MSM8x60 family (MSM8260/MSM8660/APQ8060) - the Scorpion-class
> > > generation that preceded MSM8960's Krait CPUs.
> > >
> > > The MMCC layout on MSM8x60 differs from MSM8960 in several ways that
> > > make a separate driver cleaner than parameterising mmcc-msm8960.c:
> > >
> > >   - the pix_rdi mux requires a custom set_parent op that temporarily
> > >     enables both parents during the glitch-free transition;
> > >   - the IJPEG GDSC requires releasing AXI, AHB and CORE resets;
> > >   - several rate-source pairs (MDP pixel, GFX2D/3D) only exist on
> > >     8x60 (e.g. PLL2-derived 228571000/266667000 for graphics);
> > >   - the camera CSI / VFE / JPEG / VPE / ROT clock topology lacks the
> > >     later 8960 reorganisation.
> > >
> > > Used on the HP TouchPad (Tenderloin) for graphics (Adreno A220),
> > > display (MDP4), camera (CSI/VFE), JPEG (Gemini), VIDC, VPE and
> > > rotator. Reset IDs are exposed via a separate header so consumers
> > > can reset the GDSCs and individual blocks.
> > >
> > > Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> > > ---
> >
> > [...]
> >
> > > +   .clkr.hw.init =3D &(struct clk_init_data){
> > > +           .name =3D "pll2",
> > > +           .parent_data =3D (const struct clk_parent_data[]){
> > > +                   { .fw_name =3D "pxo", .name =3D "pxo_board" },
> >
> > Please drop .name (the kernel-global clock lookup), this is only a
> > backwards compatiblity measure on existing drivers. For new entries,
> > .index is the best (because well, it's the fastest)
> >
> > [...]
> >
> > > +static struct clk_branch camclk0_clk =3D {
> > > +   .halt_reg =3D 0x01e8,
>
> From msm-3.0:
>
> +#define DBG_BUS_VEC_I_REG                      REG_MM(0x01E8)
>
>
> So, it seems, it is a debug reg, not an actual halt reg (but I might be
> mistaken here, I haven't looked into the details).

I think the define just has a bad name. You have to look
at how it's used.

This define is in msm-3.4 for msm8960, clock-msm8960:
#define DBG_BUS_VEC_I_REG                       REG_MM(0x01E8)
... and then it is used in 10 different places as a halt reg:

$ git grep DBG_BUS_VEC_I_REG *
clock-8960.c:#define DBG_BUS_VEC_I_REG                  REG_MM(0x01E8)
clock-8960.c:           .halt_reg =3D DBG_BUS_VEC_I_REG,
clock-8960.c:           .halt_reg =3D DBG_BUS_VEC_I_REG,
clock-8960.c:                   .halt_reg =3D DBG_BUS_VEC_I_REG, \
clock-8960.c:           .halt_reg =3D DBG_BUS_VEC_I_REG,
clock-8960.c:           .halt_reg =3D DBG_BUS_VEC_I_REG,
clock-8960.c:           .halt_reg =3D DBG_BUS_VEC_I_REG,
clock-8960.c:           .halt_reg =3D DBG_BUS_VEC_I_REG,
clock-8960.c:           .halt_reg =3D DBG_BUS_VEC_I_REG,
clock-8960.c:           .halt_reg =3D DBG_BUS_VEC_I_REG,
clock-8960.c:           .halt_reg =3D DBG_BUS_VEC_I_REG,

and in the mainline msm8960 driver 01e8 is used as a halt reg
in the as well, see drivers/clk/qcom/mmcc-msm8960.c.

Some qualcomm clock registers being named DBG_* has no
semantic meaning, one has to look at the usage. Maybe at
some point some engineer thought it's a debug feature to
be able to halt a clock.

Yours,
Linus Walleij
