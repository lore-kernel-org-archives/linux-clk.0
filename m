Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D7933A711
	for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 01:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784595857; cv=pass; b=uyVVZ9bzz0BpXyg4NeOuYDLK3sbn/YDQEwrl0xkVeE1+wUMC+qj3SjQlAR97j7OTgNlsidtcJwNKJhjXFgpZeOggl5EMK07MRnMK3CtQAakj7bbzzdH+SzRtDzUuyvjl+kKUuJ29Hn5sYYLjIXDOTa6/wIG4oNTVqIni4ajsJ70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784595857; c=relaxed/simple;
	bh=GLZupEyovXd1SdBnMvwTWDIFj/J7xpVBqHa2aOIagrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sfvIfXiJdYvPnaQ6tWUF9AYtQ2waGl+CyRXc83viVzVAF1nh0YqN/Hh0SveWTLdAmzolssLieN2gkW9/imAH+DDVlId/exVQ5prDoAK+2v9LKglBLOfz/9rTzKxKtnXVw6OLysUYJB1mYcg1vYOlNPw3D9z0vEqWV5gaebKr7Mo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZVvVp/Hk; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZVvVp/Hk"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-69c1220bd51so12299150a12.3
        for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 18:04:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784595855; cv=none;
        d=google.com; s=arc-20260327;
        b=Lefnfd4XdkGGREY2SvQqzSXfKaR9ixIEqgnSIpiR0tMD/SDx6i6fOVrPxV5OuLBAYb
         OeTCXT4rwRDWYdO90wX3v5gReqKJr2B2OIDxLCTZHpEnErmEHlv7FaXOG+TmkAuRevCu
         EeFbMgl/IEvRf+zMm3X/GtIfaM/ErdUNY+URxLw/Zf6x4ChlZL6duPm3c4guzhQgqjVf
         qKjzkS9fiedT9iyWOwqNbry3qFC2rzEGIbCcKdsCbFSjkY1nqoO02/MXFah3oWggGM1K
         E0GpdDQZx1J3P7ywJzMpODt8hWVM4GemMNNoobp8UFtgACwb7Gep3o8JgAiYTHw98N99
         OzXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EHPTMhb9JAbcXOq5Xex7Y15eQjdJiY8OEmA13h9LDA0=;
        fh=fnjowjLvV0RzgCEX/ol4grhutagxYoCzxcCHPDy4iYU=;
        b=f5+dXTda0Q+OrUGLVaJzgrgR3k8LnOGuXRr8c079RfAPUX7M1+Wn6SIWIYut2AegwP
         WqPsiL+Qc+xr+N9VL75LlUOAcb0X3XMa3OTCnFxTbRm+ZTZkXqR0n2k+9fuHhnrrLbFP
         NsHQ/jAEQf4ii14IUUjQvGz0Rdff6ptpOiMOl/x9CqtTW56eoLbyNSDPN/lOHf6hp+TK
         JkChTnkglmZ19Kgi0q7XDMyuNzetT1Qkugv1wtTTgq10q8ECeLARWZOGlw4893TRXw+v
         8SumLviULF+DCpPEwDhWgiNWevkQzmFkDAPPQbFmxerSE0Pu8Z0Gw+QcYLAI02JH55tF
         lUyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784595855; x=1785200655; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EHPTMhb9JAbcXOq5Xex7Y15eQjdJiY8OEmA13h9LDA0=;
        b=ZVvVp/HkYcU6nhtgpKyaAyPpqnvtuT0kIXWq97bz76+og233QxSAGGmLy3kQtLZzCK
         nsHtfEqCgAqbmPAKQPSE+YPHxnx+XwrSuApX3g/InQXCoYKFZPF5VvayQYJG1fwJ6S7F
         d0Vt805KZwOKqw1sjFU6PIFfxsdAES6mk624FWbBM5ip3hk5IqI0+PoznAQbGgJ6ryIQ
         6eKEBxoCNFpQxXKGBfKoWxAGEqYKmlOpNIl45OD4iWCxieAe97XQyr1jFny/x99Kgvcw
         VFUinzIhi1SxaO5mVYEc3Dio+34vSfXp2mdm1kL32O3Mm2Y8hjOL6gZSYRNsvI+Vknc5
         rQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784595855; x=1785200655;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EHPTMhb9JAbcXOq5Xex7Y15eQjdJiY8OEmA13h9LDA0=;
        b=pj9nS7Ltv0Pbe5vhrmuzcjVSOoyU0rXPCRU/3iBrwdK3fY+suesqMy4gba2MITH0uo
         v3R/xH0bXpTLFfd8d/zHGL834dg7meDHNQ+larKLuRJqmyruaJih6VrnedujyvXgmQag
         +7nVzJUMetoX+XdgTjPC9qJGfZPsOAfOQYGLtU6yY2D4kW0Hk5u5alhKKhBeKDI19hCG
         TjAuOxI7ANDGZYs2QaIsned0kifl5Qt8R6ZKJFTz4upkd0Hnp2JGaKlUik+yxxEaSuWw
         PaQ14QUrGT4C7wiV+YIpam+VO38ylS8JQmKctY9ehD2bPc24DyhsKNQy95tox4BWeNF9
         j+Tg==
X-Forwarded-Encrypted: i=1; AHgh+RpEmO/N9bSqcgxHr6DLkSHlL5ld1X27gceAHA5d0plJYNKpNtFicgPxW7g90O+ttLEX0HGPp13X0ag=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn00CkNoIaQaFPSs+nIQoIrohzVOUnK55+xE1HIlIg+2XzJ2SS
	Elom9ZgbXednbwd6gx1pimbMAT96IV8uApdlx/xsEjtQigcrT6OvJYIdXUjra/UexCnHGAQfHl8
	N7WKVcAJlg4cKbQA/XtdSQEYQrjG1xHI=
X-Gm-Gg: AR+sD11GlwFn6sOITgRp3C49WqrwAYRvZb+E14Q41AgoqfTf3mz3Ae4az3dZBZ1dLRq
	TQzA4vo8kP+hCNgJA7EBAPpG5Jo6P2HFjvjaUN00KsDNE5x1DrMobS+lvQa87vfOmBkdzKWp5d6
	YGcI0XznG0Rs/LsjEGJ8NKwfFYGyZ/wRDyJlgp1EIHZ8Yi7uwPHsPhdPMK51Nm9keFWFTWMqR1g
	jj6CVNZisI32rGJ/AtTv0RRdoyMrf7zl45gIsZQwyo9gVQHLHLkAJQl7xG8oJcSrpSS8AfcJ1sD
	8XlJQMzKaEYcKJBGXWpam6UauROmUMntE0hSls3dTuP4I2XEB3YFPhg6wz7/ZJBFE6K+AGr8wqL
	owpggjNBKLzKqSUucshY/3xEgVqAur4mnOYLYyHP4ulNIczdCFm8EyztuoqraHUvmtXicqQxN
X-Received: by 2002:a05:6402:210d:b0:69a:a9a6:61e4 with SMTP id
 4fb4d7f45d1cf-69e65312188mr6060598a12.39.1784595854460; Mon, 20 Jul 2026
 18:04:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260719214349.734351-1-rosenp@gmail.com> <YBsaITDCQyaUWFnnWTe4Fw@gmail.com>
 <al6ALM2eIWots1Zr@redhat.com>
In-Reply-To: <al6ALM2eIWots1Zr@redhat.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 20 Jul 2026 18:04:03 -0700
X-Gm-Features: AUfX_myGWf8CrBLd-qjrAwYOqQPA4YF8JvhlVdpAVRQMWtpDnQSDVL_bsBB8gd4
Message-ID: <CAKxU2N9VoHRUGGjEsMCEyGaMxoc=Bw0tuuMb-BYn+54DJRjQWA@mail.gmail.com>
Subject: Re: [PATCH] clk: mmp: allow COMPILE_TEST builds
To: Brian Masney <bmasney@redhat.com>
Cc: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>, 
	linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Marvell PXA1908 SOC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 1:08=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
>
> Hi Duje,
>
> On Mon, Jul 20, 2026 at 04:46:40PM +0200, Duje Mihanovi=C4=87 wrote:
> > On Sunday, 19 July 2026 23:43:49 Central European Summer Time Rosen Pen=
ev
> > wrote:
> >
> > [...]
> >
> > > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > > index 4b2c089f46a1..8383f9f1da51 100644
> > > --- a/drivers/clk/Makefile
> > > +++ b/drivers/clk/Makefile
> > > @@ -130,7 +130,7 @@ obj-y                                   +=3D
> > mediatek/
> > >  obj-$(CONFIG_ARCH_MESON)           +=3D meson/
> > >  obj-y                                      +=3D microchip/
> > >  ifeq ($(CONFIG_COMMON_CLK), y)
> > > -obj-$(CONFIG_ARCH_MMP)                     +=3D mmp/
> > > +obj-$(CONFIG_COMMON_CLK_MMP)               +=3D mmp/
> >
> > Could it be possible to select mmp unconditionally, like most of the ot=
her
> > subtrees are? AFAICT, that would also require creating new Kconfig symb=
ols for
> > the PXA168, PXA910 and PXA1928 clocks, but I suspect it may be the more=
 proper
> > choice in the long term.
>
> Just by sheer numbers, the CONFIG_COMMON_CLK_XXX approach is the most
> common use case right now.
It's much simpler this way.
>
>     x1:~/src/linux/linux-next ((next-20260720) %)$ grep "CONFIG_COMMON_CL=
K" drivers/clk/Makefile | grep "+=3D" | wc -l
>     68
>     x1:~/src/linux/linux-next ((next-20260720) %)$ grep "obj-y" drivers/c=
lk/Makefile | wc -l
>     25
>
> I have no strong opinions about this either way other than to drive
> consistency across various drivers as much as possible.
>
> Currently the mmp directory currently only has COMMON_CLK_PXA1908
> defined. When the other PXA* drivers are introduced, will there be a
> CONFIG_COMMON_CLK_MMA_COMMON that all of the drivers will use?
>
> If so, we could put that MMA_COMMON in the toplevel clk Makefile.
>
> If not, then yes I agree that obj-y will be fine.
>
> Brian
>
