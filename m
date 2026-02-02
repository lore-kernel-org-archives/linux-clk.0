Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF4F36C0C5
	for <linux-clk@vger.kernel.org>; Mon,  2 Feb 2026 14:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770041843; cv=pass; b=dWaF5IUZ52yYQvq7Eg5PGqRW8uGrqdJl7b0PgQc6m3NquECwEZvF/vi86Xzp2C3wxofb+NYlUTpT31DZMRYdArGnsIj6LlgKlOtgFOFYi38oInEj1AgkJKMt6nAvGY6/5Egf+nJmIx6L1QhkElpeo+0HrkX/7dLeOsJzoROw0e8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770041843; c=relaxed/simple;
	bh=8kTR9QPGFqxQjrlyBR2RFv6GOSbe116yVA/R+TPaP8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rdQyWmE+bEI4K3TTkZkeFJgn2WZ4rOYvLuzwxZ8EwO2/Mw1A49waTEz/tCxinXVgiWZjY89fkHSkuoYqFpBJShW6SGATqdg45DIpVD9+rL03MR+lgq1lbCcwPzcFwaO7k0ZGwTsjkXAZndBCzsqSa0sR7fnXLy6zScDs9Y3OBBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDvQAlBf; arc=pass smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDvQAlBf"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c5513f598c0so1861803a12.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 06:17:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770041842; cv=none;
        d=google.com; s=arc-20240605;
        b=C9OesndZjv25a8u08dc246RWsbUGmakgOyV/I0mYzUlb+ZEEHhp6IAtyk3XfkfpZgC
         2+I1qADJbpG26xcxVnPL05bN17cpAfujsLFjVs3ZZw8p6vtZhQjgxOjRCVgs3UH/UG8q
         POEPK+f0PY9bOWfFvqV29uSIEKQ9tEvjbqt+kkCg0xSKEg0gOb14su/Bc7fFZwL7DSau
         X9NK3LPimGrQUrrY+0qVK/LirXirqRZF27bxNNuB2oGZUxzvAel64QYAPNCPXmptPuGM
         i3TM9nUEDh+4AKB9tDxUc2Qu0N342SYe5n2hbprO79iSfBKjicQlhp1nsE0vtg8Y/Buy
         rR6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6DwlNJWcSSWiB1RJVuYLclaV0gPVuBf1c2xRk/9v2KU=;
        fh=FxhyCJTAtWjgu43zW21N+5HG87lKfYOpsoQ96s2wB4E=;
        b=Ldgi9s9S00h/GqqozsVucPm51SNLd4iYKkCoXGwQ/TAz9cLyKiOUeEzCkVIBnJwmCW
         I5VOyngWVnOjyYXPJSKeTyyS2y5NHT9DLGExJ+VR+owPtDeSY7ixY7VV2t2FBWQc6jW1
         ISYn8ZuTt/ECBrOR0oDv+qO3mh/KFpWtIaIqq127JokTyzkqnnsVIt5WBM/carrYOT+b
         eSdqjHknxT8BZVJ5fnK78HNXoW6+YyfiRAZZmtj+e352VLuFE3Ml+IElE30DAsn17dB9
         0gR0ChvYx46Wg+rYc3X9NT6Rx6yX9/y/kyAFOU6jcicrbchWeZW/jnbAVoIfYOMEKiMu
         /TKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770041842; x=1770646642; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DwlNJWcSSWiB1RJVuYLclaV0gPVuBf1c2xRk/9v2KU=;
        b=SDvQAlBfk4fMkm6tAFfFF3AIO0Vkwe/gLIr0LicHAYHw1LdOlijhMOgxUOfeOUYOai
         aQgW1KOViCdQ+NO5qir/kXFVROaNszqBdfh2YqVwqh0PvJxCKPxmcLGJqDFNy4CGCeIJ
         LOdcVjnDdg3gR1zd1aWw3jjzWRhOnfnr3zXCpV/HKhxfS8YRPw8VmhZWSQULFscAP5Aa
         IPIYnZBNPvuRXg/XypQYqiIAkip30+4FJ38wW9zJXCQTd+v5ZCF5i+Tergnd9BEWBpdm
         lgsotkM6/rmUDWHGGm/Xjk4iz1+6U2gyKcT4pLVWF4kpBP+9E/ZhEsl4McHO0zdEgvk/
         PWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770041842; x=1770646642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6DwlNJWcSSWiB1RJVuYLclaV0gPVuBf1c2xRk/9v2KU=;
        b=wibz/qtRnXkJchenM4o/hAUs2cFUtLbfrW1yE3MF2Ef99aQQxABHVFJUdxHAi7A0uw
         ypxlQDog5eO+kwqA0ZgwJXvan0M/xSgClmekufn+VtxIwbIE6ZC2IpPH7xkciZ7EgDqy
         ier7tYiRstGXs4ajVCtrKK5p7e8gLflicfyQH8LAUZF6/XAnK65lp/4ASmLOH5ZbHkmF
         U10lMSMRymT4lJ0iXwFrGuFrrdhy2sZufSbJ9vckoSdIE4N1UdnIUBZVlcqHgqbsRCvZ
         h0CCuzQEz2uiVb+zAfOj15gtHMEQOb/NiWVOKx2vInQ7l5bR1i02t5C+vvS6kCUjcfXH
         fDJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtWu3BitmKGcoV1nE4TsNBB18XgXm0atvTZmx+rST5nZg6BC/ELGHAdprLYnIfBnBDuZNMLHSQN5c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjg3dpvU8bQwLzZ5F/0dWd0v2cj/nYleLdZWgSv15aPqUmpOoW
	PR1+U9zzG2hrxLbQCWK6PKobzpMrLHJnbDVLn7zMT7K7/xSvlm8opDj4dD7QgsXRs/oIL1RJVY1
	Vxsh4/b2/sOME7OYPnSS6TVaj32h6jO0=
X-Gm-Gg: AZuq6aLXsRxinXeSFRSVc0/pSV0pmSYy6vWtRegbiuuV+bu5GDe59WJGdOPo/Noxo8f
	Xvl4Pahg34YC10yOGxdH2NP/chCcWAkXId+Pwjts8KBb7LoumNSbePbNlVx4IQaWfjeIPQXcOwb
	J/9fMtpKjdiaLIAm7Idm6oQSaLD8pvW7QYQdAtgjoEaS1k1Am+veb+do/iPZLhRPsz+leyNuZFB
	8WZnDY6JdY/gzoCLi6YEZ/cXjSmkdZe5Qigp4tvl3lTHNBHqBvrILH9qBNP03EwOMUsNbzsixQ+
	G6M=
X-Received: by 2002:a17:90b:5145:b0:34a:9d9a:3f67 with SMTP id
 98e67ed59e1d1-3543b3eff19mr11142088a91.33.1770041841526; Mon, 02 Feb 2026
 06:17:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260131-clk-imx6q-v2-0-70471ddc99e0@gmail.com>
 <20260131-clk-imx6q-v2-1-70471ddc99e0@gmail.com> <aX4q+W3Sjx5SRHrC@lizhi-Precision-Tower-5810>
 <aYAGMAE7ppXP/lbR@shlinux89>
In-Reply-To: <aYAGMAE7ppXP/lbR@shlinux89>
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 2 Feb 2026 22:17:11 +0800
X-Gm-Features: AZwV_QhoCxlCzLAcnWkBO4ogn0VW2M6mcHRnmBpiFBphn4q3UInMNacf8_hKx4Q
Message-ID: <CAN4SLj3AaM8qiS=DefEWT=EZKQJ6MVa2zEFhU4vgpJZzDBFq7g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: imx: imx6q: Fix device node reference leak in pll6_bypassed()
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.li@nxp.com>, Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Akshay Bhat <akshay.bhat@timesys.com>, 
	Ranjani Vaidyanathan <Ranjani.Vaidyanathan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 2, 2026 at 10:03=E2=80=AFAM Peng Fan <peng.fan@oss.nxp.com> wro=
te:
>
> On Sat, Jan 31, 2026 at 11:16:57AM -0500, Frank Li wrote:
> >On Sat, Jan 31, 2026 at 04:11:34PM +0800, Felix Gu wrote:
> >> The function pll6_bypassed() calls of_parse_phandle_with_args()
> >> but never calls of_node_put() to release the reference, causing
> >> a memory leak.
> >>
> >> Fix this by adding proper cleanup calls on all exit paths.
> >>
> >> Fixes: 3cc48976e9763 ("clk: imx6q: handle ENET PLL bypass")
> >> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> >> ---
> >>  drivers/clk/imx/clk-imx6q.c | 6 +++++-
> >>  1 file changed, 5 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
> >> index bf4c1d9c9928..1d8e8f0891a3 100644
> >> --- a/drivers/clk/imx/clk-imx6q.c
> >> +++ b/drivers/clk/imx/clk-imx6q.c
> >> @@ -238,8 +238,11 @@ static bool pll6_bypassed(struct device_node *nod=
e)
> >>                      return false;
> >>
>
> One more comment:
> Put one line here, "of_node_put", no need duplicate it in below.
Hi Peng,
Thanks for your review.
Frank also mentioned this in V1, but I think it may not be good to use
clkspec.np after calling of_node_put().

Best regards,
Felix Gu
>
> >>              if (clkspec.np =3D=3D node &&
> >> -                clkspec.args[0] =3D=3D IMX6QDL_PLL6_BYPASS)
> >> +                clkspec.args[0] =3D=3D IMX6QDL_PLL6_BYPASS) {
> >> +                    of_node_put(clkspec.np);
>
> Drop this change
>
> >>                      break;
> >> +            }
> >> +            of_node_put(clkspec.np);
>
> Ditto.
>
> Regards,
> Peng
>
> >>      }
> >>
> >>      /* PLL6 bypass is not part of the assigned clock list */
> >> @@ -249,6 +252,7 @@ static bool pll6_bypassed(struct device_node *node=
)
> >>      ret =3D of_parse_phandle_with_args(node, "assigned-clock-parents"=
,
> >>                                       "#clock-cells", index, &clkspec)=
;
> >>
> >
> >If ret is err, clkspec will not touched. So clkspec.np keep old value,
> >of_node_put(clkspec.np) will put twice for previous np.
> >
> >So need add if (ret) check here. Or use difference variable clkspec with
> >init 0.
> >
> >Frank
> >
> >> +    of_node_put(clkspec.np);
> >>      if (clkspec.args[0] !=3D IMX6QDL_CLK_PLL6)
> >>              return true;
> >>
> >>
> >> --
> >> 2.43.0
> >>
