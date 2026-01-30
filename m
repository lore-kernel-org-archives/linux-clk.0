Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA1E1D86DC
	for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 18:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769796069; cv=pass; b=UJEIOspstKqyz84tlz+2HivCpBBBkW4riNKXhrpAJdxaUXw3+JMG9ZgDSi8S1p5eifanTtsq4caDyUrVThnBoOF3yXmPdS7dlxslVyFxlE6qdIVUFl+CGFc43BgF+w/50LtBju6boyfqq0omvomJ2S1r7P3mPaGcj1S0oQHvxIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769796069; c=relaxed/simple;
	bh=sZBs6sKL1pODHnxTgxYuaLKrqindO+otYGGQxY797Bo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PKL40rZMRmr3ZMzDRjf9rEks6xzmnAIIWSFmsKxNY4Wkq0vA+bthI5nr9B/+z4xB9I4iZ4U/eBKNhjoweYvopqIElNub+ZJpnoSs9I4+2BxX+diQUmlyB+SwrxYY26ysMFWkjlHlnVGDi9+gbEl70DrRH7xYhEHX7kw4ZsNmFp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efI4iMkP; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efI4iMkP"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a0d52768ccso16057375ad.1
        for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 10:01:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769796067; cv=none;
        d=google.com; s=arc-20240605;
        b=l1fss8gHrKBETA6BjiIWc+jJVg0hgmtYJlBaBFkSY5SaGdHdP6v8B5xsePWVX5IHnN
         WyzXCJpbMmrrPyt2EG5WqZdzv5plsx9aL+BquxUyS19vVFRWAJcluXtPhVoHXEmE1ix2
         SRK0Wq/LOS4Mjm6ZsWQJfeQUdJ9xwMsRa0GL69K8X2d7CbB2hQMzZov5Mt+Ztn+cOZ04
         X71MBdnA6JA3vmWGMWSzfJ72slhw8m2zIXUUFG/6UhEuOPM7SA8ImfuQpdR8a+v14s3o
         mRsBPYTkLVVJyl/mAoPeRmC0p9sit8rf9pWZl9LZ8k+3AWnKedZ72/lkYX5JYogg/h3e
         F1MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zRzLxy/Thum6f98qlHk0+tRPBb+9BLG/RuelqcCBlLY=;
        fh=ZW/ykuy4upl/iLUGYjfhV41ZZTWSO/rPekPmxcJLJeM=;
        b=LuXTwcyqRnW406IO+BsD2amg2QeLz6WjIFo3xS0vvn70wuumX3iVvnDcC+y7d1VcFp
         xsbDYd9syCOW7yeyPmlwZezIdW1tEZjNSlpn07rQl4h6X2mDTrBNzEhiR1aYG+JEdRBk
         Jjr+BPw4Tv2krO13u4G7UNqBiceB0kIGHutOlbxRbqJZjfSiO/P4YY+KOhwA/cCbkpDI
         OPPwfnW294A/p0LvyO9uDpb6vuZiFDArJq6ijf7ON6nYsba5PSPRRbkHCJDHnpaQld1C
         IKi60iUXn0NdpcRDkrv5KjTnM1+Ot9NEJtYgW5T0ODQYw6iS/3J53eO0bWtVAc7ZbNGN
         n1wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769796067; x=1770400867; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zRzLxy/Thum6f98qlHk0+tRPBb+9BLG/RuelqcCBlLY=;
        b=efI4iMkPWg2B2rL/kSmKg1wA2+mBwNPTyI3TE+LOku6ZzFAg0xyiZP5zmYpV1kWxcX
         OBpCxT3mQa6r6J8WzqTNzu1vY0i71HuZdkv1yAN0IH8UpUNXnAuJFKiXTad5hVjW1vnG
         yI8UvFjRrZ0pVoF079g88UIY6Qw5cEfZiDoxh1Bv6VTmjxCwpuqXYRc/ROXhFvwXLGAn
         evpC8gfaggwoi8t7xYalCwuDxVeGVM9Xnv+0R819ewml8sw1JXRo8m9Cjc+4+vITlGTM
         uXWav4Vf4O/UGdCuloTgQLcXNWaIHtFkmJlGgxXYYwQNk5M1LCm0VEU6EBzj1enHMHkR
         r96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769796067; x=1770400867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zRzLxy/Thum6f98qlHk0+tRPBb+9BLG/RuelqcCBlLY=;
        b=r+TP5ox4TbkJ+pwX3oCEsMnncOaSZ4UOZI+jGME7TcWAiKB51iicBHAKToDzlHPMjc
         nC/q5hWU1UUqMdF2fI0A1mgKfCjdDl6MDfj9HBjwU1+e4S7PM4amAR2EPX7lXvopBiHR
         Fe/NoViAQiCM2aMOK2cl2rN818ptPP8thxY9U5NW0FzCRV/pEFDUxHFR4fOsbL1wSntt
         cDxbI1Etd6occxpgCuRFI8GTGrJj0n52rFFQYj8xZAbgwZUgDSE0XG33fBcfyWFn1nXf
         igHWW/Nvr/+M9nIkQMtvg9TfIepIptA+govwJTZYAn+smGNbY9otAMLNXE3ybFukK1Wo
         WBLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlVq4hXt2N4ut+wl7FWlbjUxl4pPPpthYThtM61LZqo//2zgIvlxZBptF4b2HkIOOlysyFjuhbHco=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5CBSbUm4kGl2EY72WrVBGiGFEtHSQ+fKz8C/Es+CAfsRxOKpN
	rYMl3Sd/cggZercSp6pWi/W4Av5TmaehoUB8ULaNul4bkD9spZ9bjSL+iBOwUmmq+IMnejHcDeP
	afwmmmW/RF5dwbwT6LU/9SuRlKhfLJy4=
X-Gm-Gg: AZuq6aJT7o3hZyFXt015srlRdweVqiLlkOMAHbmYq+TFnft5jfKGqSaUf4kIxQqe2/l
	wo6cV/Xgkzz+dCvmqj0jLpbqDaD9Os/LII/FJDBXPfqluErv3YpqLYMZgyN37Z6XYs9TmnFfgwI
	OUc3LMkmMb5Dn1A8wQ0mFqlJ24w/Zdx6+3on7TBhHIWGBUZZysGNv2P8zySE6bs2bnf5NTHiOah
	JrJ+hKBx6db0R9FhizBLJd7e4M1C+VZOT4mNbnGnmfrRD38RN+LWQoswdW+y2uXLNCAbNHh38th
	+EY=
X-Received: by 2002:a17:902:e810:b0:2a8:7814:47cc with SMTP id
 d9443c01a7336-2a8d96a2ba4mr35674015ad.16.1769796067106; Fri, 30 Jan 2026
 10:01:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260130-clk-imx6q-v1-1-2fa4da5dab85@gmail.com> <aXzsRreLzaCB6cVd@lizhi-Precision-Tower-5810>
In-Reply-To: <aXzsRreLzaCB6cVd@lizhi-Precision-Tower-5810>
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 31 Jan 2026 02:00:54 +0800
X-Gm-Features: AZwV_QiFOzZg6P87AjjQNpa0BC_INIoNGOBqDMXaJiczCeTxYqTXqtMAmTPol2g
Message-ID: <CAN4SLj3-0NH232gauZs1+HpL2A0oE-QTh8L8BYgjKAwNVFYi0w@mail.gmail.com>
Subject: Re: [PATCH] clk: imx: imx6q: Fix device node reference leak in pll6_bypassed()
To: Frank Li <Frank.li@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, linux-clk@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 31, 2026 at 1:37=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Fri, Jan 30, 2026 at 11:56:28PM +0800, Felix Gu wrote:
> > The function pll6_bypassed() calls of_parse_phandle_with_args()
> > but never calls of_node_put() to release the reference, causing
> > a memory leak.
> >
> > Fix this by adding proper cleanup calls on all exit paths.
> >
> > Fixes: 3cc48976e9763 ("clk: imx6q: handle ENET PLL bypass")
> > Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> > ---
> >  drivers/clk/imx/clk-imx6q.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
> > index bf4c1d9c9928..1d8e8f0891a3 100644
> > --- a/drivers/clk/imx/clk-imx6q.c
> > +++ b/drivers/clk/imx/clk-imx6q.c
> > @@ -238,8 +238,11 @@ static bool pll6_bypassed(struct device_node *node=
)
> >                       return false;
> >
> >               if (clkspec.np =3D=3D node &&
> > -                 clkspec.args[0] =3D=3D IMX6QDL_PLL6_BYPASS)
> > +                 clkspec.args[0] =3D=3D IMX6QDL_PLL6_BYPASS) {
> > +                     of_node_put(clkspec.np);
> >                       break;
> > +             }
> > +             of_node_put(clkspec.np);
>
>
> I think you put of_node_put() before if branch
I didn't put of_node_put() before if branch is clksepc.np is used in
the if branch.
It maybe not good to use it after calling of_node_put().
>
> rc =3D of_parse_phandle_with_args()
> if (rc < 0)
>         ...
> of_node_put(clkspec.np);
>
>
> There are more places call of_parse_phandle_with_args() without of_node_p=
ut().
Thanks, I missed that, I will fix it in V2.

Best regards,
Felix Gu
>
>
> >       }
> >
> >       /* PLL6 bypass is not part of the assigned clock list */
> > @@ -249,6 +252,7 @@ static bool pll6_bypassed(struct device_node *node)
> >       ret =3D of_parse_phandle_with_args(node, "assigned-clock-parents"=
,
> >                                        "#clock-cells", index, &clkspec)=
;
> >
>
> this one miss check ret;
>
> Frank
> > +     of_node_put(clkspec.np);
> >       if (clkspec.args[0] !=3D IMX6QDL_CLK_PLL6)
> >               return true;
> >
> >
> > ---
> > base-commit: 33a647c659ffa5bdb94abc345c8c86768ff96215
> > change-id: 20260130-clk-imx6q-9c4b8835fc26
> >
> > Best regards,
> > --
> > Felix Gu <ustc.gu@gmail.com>
> >
