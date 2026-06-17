Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751C33F1AC1
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 13:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781702647; cv=pass; b=tSLhL2q+cDKCzSf12wKohHkgJEH/4avRSpT4PEl6157HRFcOsC+072N/3JpUFFlZjDDhXlU3kqscsM6GwNjOID1I1R9l3Bryym554sXw3WKoOsUGFUW+iz5+EfkwvtCfIrLNVCF/IjoBqblcPT0ZVdvZ3ItWXJwgNF5sHPcUwbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781702647; c=relaxed/simple;
	bh=ewIwtqLPbeHCWyo5VNky0uOAiOwUQBLA8CnHGrE8tvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=InDQ9Kh+2uQ5ZyI63cEwQtdGkDYhzXnvUOTlb0YoNS4uwLYocl2Grx3twHeuCzZKKbUTwo2HWMkZ+aUOBEmXPFSw3ZXE4i+An9oqQxEGta2Dw5XYz7REOmPGZj5OaJQ5L4Mb7o2cgk3MOB/Y7d+Oq4+dDgX7VElP4jEwmJyC5v0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fIfo7nZ/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=p0Il5imj; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fIfo7nZ/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="p0Il5imj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781702645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y4+YbdAEZpz2K20UW7YBz9GcZy81EsugryTwze/j0Ic=;
	b=fIfo7nZ/9FewQJkMP9XoWviDp9i6DEmiXFfXzeoIXRPWFTpbRaszdbER1AytmB9Em80SlB
	J9uipsenB+BerovQiu7QLOaMMrbMtEwdFpGzeLwPH/ZmRc8tRQLA5SsbGeI+X9z/gqOZDJ
	6rWAT138Rw3Wc6iItmoq/N//yFHZSvI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-6ZBR4C1_OHuvK_5zj9GMUQ-1; Wed, 17 Jun 2026 09:24:04 -0400
X-MC-Unique: 6ZBR4C1_OHuvK_5zj9GMUQ-1
X-Mimecast-MFC-AGG-ID: 6ZBR4C1_OHuvK_5zj9GMUQ_1781702643
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-bfea278c439so144253266b.2
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 06:24:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781702643; cv=none;
        d=google.com; s=arc-20240605;
        b=PVMCV0hnZdNFd46/LKd9ZRITOX/mfT+sC5hbfbiRTlbFvIDdu/s5wN6R6Mk58a/+tl
         pPI/ureIf36t96cv5DM4DseD9JRFuEwsVo/m+BwjIQSi98eFISuHDijXXpT5wOZfhJBY
         i8o3FpR2xXtFJQBwaH5OOcZS9iGxvabhoAt3PJKfS6dFufT23FX99BWNTZn+VGZb/xBO
         /Fu0NwyaD5XLAbHfAuB/ErdyMwazPyaABE6GEBj879emsTUw84EcNcdfGRQeqFNHHHtb
         3ZJohlSH46AUOnopw5zKYXXFynAlgVVDxEO0cIrrsZjZUMJ1lssjehom/mE+c4+qtZLE
         3Hxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y4+YbdAEZpz2K20UW7YBz9GcZy81EsugryTwze/j0Ic=;
        fh=Vdez1ZuyGMBARE1Wu5Ao39K3NQnHorZR4nW4LR7yz64=;
        b=EJkF/e+ZfcD7Ztd7Hp+UQu1GeFCrffA5TPkka8mi/Y9u9K4vKSgMT0PmX2N2JVxBB+
         p/XZXNdyfSh43osdkE0Y/Ivy3Ijdkr8r37H/ohOzhFM/O9QMC1EhBX3QcJvxXiMEJtAc
         RafNdR3HgowJ+htptQNykterQjuq/l79sK6ExQck2vZ0grUveNpll9v+o61eb3KMg+QF
         H3dFU6QaO9gSCaFaNbqhlHteXpKm5WYPiUgg09eRfsVZpDoX9pIF48TmB2vYFJ4g06qA
         81UzKPHEH/of7npeAEJ0UUaEUlWZpxStinVeczZM0H0AmIZqKqfhXoXNEAl+smHgvhIo
         W0kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781702643; x=1782307443; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y4+YbdAEZpz2K20UW7YBz9GcZy81EsugryTwze/j0Ic=;
        b=p0Il5imjC/TTIDVgCXjlKFcY+nwU9ycqyOJCklIWROW3/vr3pVkfCxQPehrAj4GRvm
         pa4+o20OjZovFcZlNBGRgj9hmAaG7fQzzPtEnO3yMDoXYmcPLzeePa+/g9TvvkZNDymD
         4xV5kLmlfFtNUu9PqQgCT/jtbQCRj9p1xmL9LgMzyXM1jZ9ym3xSZckWVodd5Rb4KTbk
         VHl32C0W6nbJBXwIEuVEWs50Xv9XkQYTyIPqKRWZ66LIiK0IvZyqC6qZudIsdg1SS7FV
         JENrXNmpSKr9AJJtkHo1wzbEoCWvSXLVe0o2JR6cITjB0o4ENP+/xQv/xddC2rLf+6Tg
         0zDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781702643; x=1782307443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y4+YbdAEZpz2K20UW7YBz9GcZy81EsugryTwze/j0Ic=;
        b=lIZeW6R4ow6A08mnW+CJwX4ONTeo4V9tPSHFtQnBYhaJVVyOy2cxwYvFoUj4WO5T97
         Re55jh3F04z94RuMMU01GpV7QAGfUTtICya2aQ5f2s44YJH4uCMHKtdYuzGCrO1qd1RJ
         WcTXM6E/y2voCPsK8yYO1KdnrFk4YIq/rGiCydkJpDkrO9JewousWmBRTs//nyk+Behm
         MXO9onzmlGS3Kbe7gbWliPkd+YY+VsioNbVKW9K+hKXKBAnaBI+I/WDmrjegRd2Ewm33
         mezP4tunV3eHTqT2dY3d8wLNoYy9H6gLb6rlVcgBZapS2nnPTHlzzvcDG+b0Nw8J5kbI
         ZVbQ==
X-Forwarded-Encrypted: i=1; AFNElJ9nb/VfULNFx6TleAkMWpst+kwcxJvlfAaHu+LmWfzj/oO4yH5bC5yr1qVPTNyUotqmUlx+ZqQpH88=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDN46dLbtglhGOs45pEj0TDe4L8vaB0XisXkcja0MLN0NqWwEC
	L7HqTsBr836YQyIGJRus5NkF30FkXqUhl6kcBSkjBL0CGp2oo62j37heFRnpSR9MQpDDuVu30cv
	kGp9UTWX8/U4qjr7EKNZzbmdf1Y4tUty0WriLJFGSN7Oibl4xuRhSUTD76SEKQCnylYl9UlX/Aa
	ju23PuuA634nR0V1ucI9FHw7Up1fC98Wh6mixC
X-Gm-Gg: Acq92OF/sTc2L4qPZVqp1UdcnWQECRhVU1ybQVF7rSwFcIuOy3VWNCu/Jtcnun81Myr
	8/2ukuV/LSmwQag+uaWjtiL5/BmeMq1AC/uwDjQhHG6gRACNce/Q9k6KBl9S5xiGLJ8W21ZDAoc
	ROa34hAnkyp9agVsOD1BKT9LafYD/WrONU1HE4mKdIN1d9SCXX9gKLIDQVRNBNRI35Tprv+LH1b
	JI=
X-Received: by 2002:a17:907:6d27:b0:beb:7979:47d9 with SMTP id a640c23a62f3a-c05a1e4aef4mr272153266b.8.1781702642942;
        Wed, 17 Jun 2026 06:24:02 -0700 (PDT)
X-Received: by 2002:a17:907:6d27:b0:beb:7979:47d9 with SMTP id
 a640c23a62f3a-c05a1e4aef4mr272146066b.8.1781702642033; Wed, 17 Jun 2026
 06:24:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <h_BA0KRKTGSANQ5Y4eqo6A@bootlin.com> <ajJ8OSemkwebmolg@redhat.com> <55Q7Bvj0QhWyFjlQP2EQZA@bootlin.com>
In-Reply-To: <55Q7Bvj0QhWyFjlQP2EQZA@bootlin.com>
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 17 Jun 2026 09:23:48 -0400
X-Gm-Features: AVVi8CemxEWrkinIgKxJX5bNWK0t7lPKZf9orMQftVSx3X5fgVpaMlEViZIkfQU
Message-ID: <CABx5tqKJXC9rrOD=PzVhtX_ZFbtzhx7Z3ijO2sPGEoHxS-_VgQ@mail.gmail.com>
Subject: Re: [GIT PULL] clk: eyeq: Support for Mobileye EyeQ7H
To: =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 9:04=E2=80=AFAM Beno=C3=AEt Monin <benoit.monin@boo=
tlin.com> wrote:
> On Wednesday, 17 June 2026 at 12:51:37 CEST, Brian Masney wrote:
> > On Wed, Jun 17, 2026 at 11:25:03AM +0200, Beno=C3=AEt Monin wrote:
> > > Here is a pull for the clk-eyeq driver adding support for Mobileye Ey=
eQ7H
> > > SoC. It has been posted as a patch series previously, this pull reque=
st is
> > > identical to the latest version posted[1].
> > >
> > > Alongside the changes to the clk-eyeq driver, this pull request also
> > > provides the dt-bindings reviewed by Krzysztof Kozlowski, a change to=
 the
> > > reset-eyeq driver acked by Philipp Zabel and a small rework of the
> > > fixed-factor clocks reviewed by Brian Masney.
> > >
> > > [1]: https://patch.msgid.link/20260604-clk-eyeq7-v8-0-53f618174cf6@bo=
otlin.com
> > >
> > >
> > > The following changes since commit 5d6919055dec134de3c40167a490f33c74=
c12581:
> > >
> > >   Linux 7.1-rc3 (2026-05-10 14:08:09 -0700)
> >
> > This patch set should definitely go in, and thanks for setting up the
> > pull. Is there a particular reason that this pull is based on rc3
> > instead of rc1? Stephen usually bases his pull to Linus on rc1. Ideally
> > Stephen should get the rc2+ changes directly from Linus. It's no big
> > deal if rc3 is needed, but the dependency needs to be documented at
> > least. The reason for this is the unlikely case that the pull needs to
> > be reverted.
> >
> Forgot to explain that: It is based on v7.1-rc3 as the series depends on
> fixes to clk-eyeq driver that were merged in that version:
>
>     79a1886be156 ("clk: eyeq: use the auxiliary device creation helper")
>     a25ab518f355 ("clk: eyeq: add EyeQ5 children auxiliary device for gen=
eric PHYs")
>
> These fixes were merged via the clk-fixes tree.

OK, sounds good. Thank you for the clarification.

Brian

