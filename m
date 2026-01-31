Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04C635D5F5
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 18:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769882486; cv=pass; b=WRX5VMUbOSPw/zXh1NnUG+uGJk88LqRTxpti8j1A43PWCpV2cmS3pW0DBtcKVeZEmsZhqPr4Zlzn8/B1zKy979jPrCgFi9dISA4/67mMtvi1X+MV2bDLX3Esf269/qJejv5aSzXZv9CXdaK2TaEcZFl6d4GgKZ18rM+ZOAAEU/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769882486; c=relaxed/simple;
	bh=nyp82ApQeh091VtiCt4DbocbdHYePxEla0FvQh0eQCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jNMZr1RM8Hzc+CHTkjkAFfQmOueIlHY9yk1mCDWS5m6PRtqtBtOICXj+52DttJzn5tBqahmV0OilnBOK4DVqSWfmRg5n80ukmYjvkIDIQkZ/Dge9pr03cdmiymm2BO2PuRE8D5k/PjJN5WVJPkdoZxAjgzFSb2klX2kVkssuOUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dsy9gfuX; arc=pass smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dsy9gfuX"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c46d68f2b4eso1902108a12.2
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 10:01:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769882483; cv=none;
        d=google.com; s=arc-20240605;
        b=GaBkt20v2Blpo3bJolh7c5AezdisA+e/0XYkj4+YkCGdgA6dJ4x1RH3MD+6+X/5Mtu
         ds5LvH0G/QQ49IKtoC9CuDmU3BEXe0ANUJJObU5SILciiW4qqertWeaZDK/LLr6lA5Dw
         uRevSk2eCbxSaKxxILxBd+a+TXkmy3jr3utLE6MLoHcdrDeOBcIxirdeKGw5EktcsOMa
         QXR4VWloqbury6AxaXqAoALr6UbzDLTMvmOKPiEc8DWfpQHQYsg4F4cTttDSn7sqkX3Q
         i333B4vv3Reo9N3dgVsnxgf9GsA9AEZGn/3aBcsIAlD1e+DjpZjzNj6IWip4pj2PkcjK
         RFNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pCrEKDN74Yg1HcvVzMQvEOY6ZE2OP4wRbYz5bxWYTv4=;
        fh=9qnJte1pDj0xWIAwOHIzWomqTUCXEPVjAoZsvnNXyWE=;
        b=ZLCYSKQr1qvI3KATdHGJwMt7TIgR6liDyW1bYwl48Mc9/jGE3qbTQEmpJ5kDHqYILt
         HZiLPjWRhMEyuaAWaMFfljXVVKPOx2WlDGBXaSwm6PXiHbKEVKlDed9ef1Lrgos0Oc1d
         7B7QfItBPIV3WQJcp/hHkyRH9N2pgL/4RuHJX0xQXgWNr+6TSAwtzyl9+NVXqYnWOHyg
         +zHTmfkLuJ3yRUZ+DcJmusSAWSTcaTBVSSrCUPXZNlZlg+MleAmSJyMrAF5KaSzed/gn
         ZKNlxYO/0swrP1a/aHYbFcGTyLtolE8TJsHLhKrhjC8iz9OAHyhNLDJXrASRMm8Mv6yj
         8J0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769882483; x=1770487283; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pCrEKDN74Yg1HcvVzMQvEOY6ZE2OP4wRbYz5bxWYTv4=;
        b=Dsy9gfuXVjDMLiDtrwMB+rJJAnbzD0oVtEu2XO2mYkmQl7TggXbOXNbL1tbT15iF7N
         7AnVQjgucFAxztGff/1oOug+nLgLSV3RAdS6BhCP5q1xK4S+0etVL+Df+UItFZXyGFR4
         Gj98eIn1sTIQOSDdM/zwwEZ39Vh30CV5pV0OdlmmwlYloJbDj0afy5DYlw2T5pQOvTUm
         WArT/1zh6qblji/QgL4AF2xTkJ481TZluVc94OVIUyCd6+Vc29DVlX5vBwIDWLZliw5z
         Sj6InBqqXsWB8dcD+1xSN/bAwEbOb7QB8QtdJaRcUl5ZO33HPGvqBh2r97G96jxewigN
         Gs4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769882483; x=1770487283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pCrEKDN74Yg1HcvVzMQvEOY6ZE2OP4wRbYz5bxWYTv4=;
        b=XCctZ1fpD1bzilqYYGhgKMnFGKDh+klwO3CP+QctbBqcmFB7Cd3MUgeY/Icc7QXnVc
         kEWSDHQC9VHJkC27zypgTKfmwH+4Bn2OM3aATJvIEVzgz0Z9UrhQU6d/wFZcAEEslgl2
         RZN6VPmXXcfmpcBwc5VEUndV05H/v6pRZUK9kUTMpEJl+Yr+XZz8FabZz+bbRlIGBWQa
         1q5kYbQ0niA/vnnvL9uVRSIxPnWxz5zkcLKLOi99TVR34tSboj9pPW+5kie14nMDKvop
         fK/l7IGyypYby1D5UG2uSyW5PaZqGA6UAp7NvnCUPYgmtHSLbgNwttlexomw3vEt0FhD
         rBOg==
X-Forwarded-Encrypted: i=1; AJvYcCWG82nCrLpP0gsxRidK4YhiRcyq/qK8jaWlCMqFuOEVhvJxOuaFjw44lNsJYxjJAUaV+sqzdCKBRQM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUpPxlgJ9Z6JZWGNH0WFXYoc90fQebF2K9hHWHLslUQX2Nf+HO
	LK3v13c5IFhUcdb6lHJZkg1j7LLDIj+N/TY54x0EB00RotyucpTxbjSPvt8136YOHFvEQ93/zFn
	04rnhQTRhmsiVOc8jCjoWwB00S8xMUZA=
X-Gm-Gg: AZuq6aLJ61f+BFYNVGqr1OqtnlEvjUJspdfivGcAlatYcNZZw0Qe9wtm8IAvLDttGK5
	PmHYOPz6fF56RlVT84r2100aiwx96fiWFDDpQIkcx1Gp95c0HOVCR8IL0aiMrVLbI1VXo/PlU5s
	Jo4TJq/e8ADmGaFg7qP/ZRI3lMYKl9uLWloGTHUMDAnYLyGX0hJjIaofvrr+wzsx/gnEQ1eKpgN
	TfPinkTzHozRycf7GJFloKrUHNIThmO0lLsQJczgycYpWRyP6hHVr6OpyShY+Rroksn
X-Received: by 2002:a05:6a20:728a:b0:35d:d477:a7fa with SMTP id
 adf61e73a8af0-392e0052a6bmr6468927637.23.1769882483020; Sat, 31 Jan 2026
 10:01:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260131-clk-imx6q-v2-0-70471ddc99e0@gmail.com>
 <20260131-clk-imx6q-v2-1-70471ddc99e0@gmail.com> <aX4q+W3Sjx5SRHrC@lizhi-Precision-Tower-5810>
In-Reply-To: <aX4q+W3Sjx5SRHrC@lizhi-Precision-Tower-5810>
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 1 Feb 2026 02:01:11 +0800
X-Gm-Features: AZwV_QhLWLb-FDStR9zG6fjnRX1upvQjUilJNBF9vy-1P4S-LT2FD_90PT_gXlw
Message-ID: <CAN4SLj0D2PV9vFW4=dAF3ypAtA8JvhJpEut8Aumsx4JaMSEsiw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: imx: imx6q: Fix device node reference leak in pll6_bypassed()
To: Frank Li <Frank.li@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Akshay Bhat <akshay.bhat@timesys.com>, 
	Ranjani Vaidyanathan <Ranjani.Vaidyanathan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 1, 2026 at 12:17=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Sat, Jan 31, 2026 at 04:11:34PM +0800, Felix Gu wrote:
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
> If ret is err, clkspec will not touched. So clkspec.np keep old value,
> of_node_put(clkspec.np) will put twice for previous np.
>
> So need add if (ret) check here. Or use difference variable clkspec with
> init 0.
Thanks, I will fix it in v3.

>
> Frank
>
> > +     of_node_put(clkspec.np);
> >       if (clkspec.args[0] !=3D IMX6QDL_CLK_PLL6)
> >               return true;
> >
> >
> > --
> > 2.43.0
> >

Best regards,
Felix Gu
