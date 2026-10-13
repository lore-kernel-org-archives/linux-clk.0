Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EF851474D
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 15:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904089; cv=pass; b=lPwTgCHFZ5V+DM5MMbUO7909C2qDXWC2j1OM+h09LaIDsXYvhc2/N+ZGFqCKW0d4t33S6wKvucz1hETC6LFcoxpuPhPk5z5vHfSLTuoHVM6FD8E6ThShGKILmLOew1FpUUJ10nHG4EcKvtFI4yjibIsZtao9bIr58MNMmVw0UW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904089; c=relaxed/simple;
	bh=kSeEty/pyx+v4Qu7BrqL5A6bwA+hTSmxB+Kegwde04I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OPTRxT7ngJDXVxELXSeu132a4zy2pszLNrzio5skFDyGPU9tFD+vTdiBAWyRFTrfwvvA+lcLe/SQHIlU89RSOHWG5IjpCcBhtzzQfG8BEyxFrkSUNbjjqW02ZvHNyOETCnfg5x8A6U+9GpnDaa0X6TXfnGMBbAWVCNa2BknIov8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=smF305Ed; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="smF305Ed"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e61ac64ec3so27074075ad.2
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 08:08:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791904087; cv=none;
        d=google.com; s=arc-20260327;
        b=SbeZOf+SNughWi11XFQlZKhBM0HEPUcyR15/yTULkaA6FBZFy/48G5vHszU6XX4gMr
         zh7fDYVpYwh+HECXvj80vP+y4IGYrcNLqn4Ia+LtBQ6nnD1wHZbKkmxvjAj6pVMTkLc4
         qlWoIRqIymEWRn1joo6JTE7It55VtHVivTNOhE5OEuEL/t+e45DEyEBKk7fnGOC+NgNr
         Vvv99EFHl/Tbbpmf/oxj8RvwfyOF68tAkHMUEQH+CjULSKXtY/40pYxfDODSICiBeZ2K
         QI6sgKHQBWcH44HOn+3Uasw91XWakyRRIQk6UFfHwvWz0Ms4+5GneAl6vIzfrmnYQE71
         7WzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LQ5BAPQzf5De6H7G8HN1TYce8oTd+xAhm08KbGTjuS4=;
        fh=2hfhS/TDdw+vB47+SyuDzTOw4Y7UogjPq+LMZLKB1/M=;
        b=YidlrvZkriuR8CpHIfMlDM07MVWcMh3l2RmvWhRqVvYABbJqOP9SFoOhnpIvy3X/eC
         a50pjvUzxDy540ge/HGgIujCjZuDr3Wwe1gSnbz2wLPxeVFqRKBziVvN0BbgvBP50Z3g
         aFOxnv4BgIlzbK0DnW3a33OQCFingZvKQaEuwm6SiHWmTgeTmZMn5EmQPOn9Q8C/LHM+
         XO3rib6+KbrwW5QOs8S5U4bwcGmGA7llVSv9B6vNR6F+zXFjpsdOMT94IdgR8legvyZx
         JiqEfggqf9bg5s6HYoYmCXBohzI4SpVNeyI9vhgAv78DMuJ6zMh2meu/PusKfdTjwQAI
         IXNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904087; x=1792508887; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LQ5BAPQzf5De6H7G8HN1TYce8oTd+xAhm08KbGTjuS4=;
        b=smF305EdPwny8M1/F2FRVkVLZhSefEb8odFniq2p4i7nPgpcNWoMVlHqvRFdgIfJRL
         VvbuvIzMXb5LEt9M6pLDpLbUh26Ncr88AVzD1xvqHbfydC0IayRfb51UxOtdmA6ODGDD
         cDWw+iXdkgWnaoALUua5Q05CYEXEp0vaUlRIHnJT4ep5v1OVo+eaM1Odt/Ia1rIHvzFe
         BKuNcdpcnYF9GsVdqP0X9d3KwoAzV2Txiu9oeviHSV9FRcAjXzlwBXPaDXOiu7KO58Jr
         W8/kKaty3Wmrq6qMbGvneZSXfEtS3dkK4Myt6eZhpT+y3K+m9efCiS6BvFDPC8p8LAme
         w/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904087; x=1792508887;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LQ5BAPQzf5De6H7G8HN1TYce8oTd+xAhm08KbGTjuS4=;
        b=g7rBtk7rPwJoJPolAUY24EXNxpSHDlGi70sH9G/BR34szmGeghePBiP43TDP+TXTvn
         k3kaq2ioOsTOdK4vtMRcarigCS1T6ELguBClJvlUemRAWGF5k7hAWDnDHnKevwLbZqU8
         dLl8UTY4buiGtQTOsod64iqf1vVzzLrFJbkl9dx+RDSyXOYaiDk3vOYltLEmSSMbhWTe
         DMkGYhE4R2OhemYtQAugGOGf9LjqKWI0Cmsjy7aLC9K/GxByq1Bk3Ydd1zHN6ilb94pr
         1vwc1IxDvdOFpN8Pnt1SNhyMy5xJLvjQm/YmGvta/m4FDkQgVuSUffOCd2ge6M2Lmm+f
         cV5g==
X-Gm-Message-State: AFq9FYK71iohjMyL4ao0kTXLuOf4PlctIIFeSXD4BtUYOWY2XWfPX601
	Wm86nGn+EUYmlEeXhNPskMWzfIc/uyjFKOsv5IUiZYw/XPRCm4g8ebKwRu3by6Ejjh02DZJjTmH
	RjO7zGCk/YFtRVxgaF2QVLFViAwfkADg=
X-Gm-Gg: AYBFou2+YmujhywBFw8g3Wsbe0ryBoZu0IAsd4e3ecKL7dFTBIi3Qk58oC1kV4fapIt
	21fNb/ZX6bOZmK8krR7S8kw+kJztY7+zGlLjGDNB8YxFBhTLr7C3ehZ1BjzJGczJc2w8C6eoPuc
	k2WIF6bsIlbWswR9svUYvQVUuU+if7NfQpLDrl1axh4LEKa6HyBzYvjd7fosSOn9SnxfOfs2zxu
	JgkaV+PTn7Ycq9GtuOKtHG0qvxB8cLjabuU38tS1P+sLj/x0Xl8mH6fbXXT2ipsK68RkxQv97Fo
	yi0320eYiavE9p1C7uZ3EVne9lCtDEJ8DrJ8VFiAd+fRawyPEfOLj5LH3Sws7WCcij/07PE=
X-Received: by 2002:a17:902:fc4e:b0:2dd:c170:2d4d with SMTP id
 d9443c01a7336-2e842abcb40mr130264665ad.24.1791904086913; Tue, 13 Oct 2026
 08:08:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012100816.331033-1-pmazzini@gmail.com> <20261012100816.331033-3-pmazzini@gmail.com>
 <sashiko-outbox-167950@kernel.org>
In-Reply-To: <sashiko-outbox-167950@kernel.org>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Tue, 13 Oct 2026 16:07:39 +0100
X-Gm-Features: AclHuK_pl3pWqTJLvh0wYDQbXNbwPmw0G3N4wD6Ym2FvqFNGBQBI95gOlewMvjs
Message-ID: <CAAxh=jvSRyW3XwnyV2RVHH9FZvq9A7A7ruXNSpAgXzdcCNjGeA@mail.gmail.com>
Subject: Re: [PATCH v4 02/11] clk: sunxi-ng: add Allwinner B288 CCU driver
To: sashiko-reviews@lists.linux.dev
Cc: linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The B288 has pll-video0 and pll-video1 at TCON0 mux values 0 and 1, so
the plain mapping is right.

BSP: https://github.com/pocketbook/kernel-b288/blob/e30bb2ed149410ef2d3245e=
a01192833d44c4e46/drivers/clk/sunxi/clk-sun8iw10.c#L468
Wiki: https://linux-sunxi.org/B288/Clocks

On Mon, Oct 12, 2026 at 11:21=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] clk: sunxi-ng: missing parent index table for tcon0_clk
> --
>
> commit 3f9c552550550b015864167770907fa314ac3239
> Author: Pablo Mazzini <pmazzini@gmail.com>
>
> clk: sunxi-ng: add Allwinner B288 CCU driver
>
> This commit introduces the Allwinner B288 CCU driver, covering the PLLs,
> the CPU/AHB/APB tree, module clocks, bus gates, and resets. The driver
> is noted to be closely related to the A64 CCU.
>
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-b288.c b/drivers/clk/sunxi-=
ng/ccu-sun8i-b288.c
> > new file mode 100644
> > index 0000000000000..c53afd6f9af98
> > --- /dev/null
> > +++ b/drivers/clk/sunxi-ng/ccu-sun8i-b288.c
>
> [ ... ]
>
> > +/* DE_CFG @ 0x104, EE_CFG @ 0x108, EDMA_CFG @ 0x10c -- M[3:0] mux[26:2=
4] gate 31 */
> > +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(de_clk, "de", de_parents, 0x104,
> > +                                   0, 4, 24, 3, BIT(31), CLK_SET_RATE_=
PARENT);
> > +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(ee_clk, "ee", de_parents, 0x108,
> > +                                   0, 4, 24, 3, BIT(31), CLK_SET_RATE_=
PARENT);
> > +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(edma_clk, "edma", de_parents, 0x=
10c,
> > +                                   0, 4, 24, 3, BIT(31), CLK_SET_RATE_=
PARENT);
> > +
> > +/* TCON_CFG @ 0x118 -- mux[26:24] gate 31, no divider */
> > +static SUNXI_CCU_MUX_DATA_WITH_GATE(tcon0_clk, "tcon0", tcon0_parents,=
 0x118,
> > +                                 24, 3,              /* mux */
> > +                                 BIT(31),            /* gate */
> > +                                 CLK_SET_RATE_PARENT);
>
> [Severity: Medium]
> Does the B288 hardware actually use a 1:1 index mapping (0 and 1) for thi=
s
> TCON mux?
>
> The closely related A64 SoC uses a {0, 2} index mapping for its TCON PLLs=
.
> Because SUNXI_CCU_MUX_DATA_WITH_GATE defaults to a 1:1 mapping, if a disp=
lay
> driver requests to use pll_video1 for the TCON, the CCU driver will write
> index 1 to the mux register. If the hardware maps the second parent to in=
dex
> 2 instead of 1, this will result in incorrect clock parent selection and =
could
> break video output.
>
> If a custom mapping is needed, it might be slightly tricky to define sinc=
e the
> ccu_mux.h framework currently lacks a SUNXI_CCU_MUX_DATA_TABLE_WITH_GATE
> macro to combine a table with clk_parent_data.
>
> > +
> > +/* MBUS_CFG @ 0x15c -- M[2:0] mux[25:24] gate 31 */
> > +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(mbus_clk, "mbus", mbus_parents, =
0x15c,
> > +                                   0, 3, 24, 2, BIT(31), CLK_IS_CRITIC=
AL);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012100816.33=
1033-1-pmazzini@gmail.com?part=3D2
