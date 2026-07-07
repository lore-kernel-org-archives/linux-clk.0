Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF902F0661
	for <linux-clk@vger.kernel.org>; Tue,  7 Jul 2026 07:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783410909; cv=pass; b=QT1DIdolv5GMMbZaLRbshmuzpH1nXEuV6J0ngaZ3jeKOSx/jqi8P/fkn2SWM6Z0QfbdgJbl9lenkyb/uE25N9csm1CmcpHd2zAbFpoqWuDZwCCZ/FppNQ0bbkRDZXrk59TrP5G7tdKtNrqpLMg/ARVcFNcSn4ywWaRDB/gXz8YY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783410909; c=relaxed/simple;
	bh=/Gh2T7qc+SyhpmKxqx5iG+kb1R1Vg3/r2zBeVlHJ6WA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K3997fd/sK6TKss6+7AveIbStGEiW7KBmcmWhSK5e4JMzeC4lUjcJBv2L7bB8sgWQGcpfT3ofdhIW3fpLFJkDCRQrKtJZtTmcv7eodVxpg7CACntn3ma6ijUZWq0r3IupOsOuCoYXCxvZ9+0xko1h4Oaph/GBOFwHOJ5jVKryb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sbiZpTka; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sbiZpTka"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-51c5382806fso27543981cf.2
        for <linux-clk@vger.kernel.org>; Tue, 07 Jul 2026 00:55:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783410907; cv=none;
        d=google.com; s=arc-20260327;
        b=IfJFMLhNJYTn15t6KJjvIjEnalkUpmuZ0nQwmlDgTXXgzVevVyZNyRytDwjTFnGQyU
         lQ+ZQLpdMWLBKn+iDzCfL3fxxuct2LDYrVRzuW2stDLQeEv1KhcpDJKv6kpyilJvc1w5
         znSI2Bvzc4+Fn4Zxt07u0PmTzRBwxiyDL9J1BSq4hgXa2QMng3xKn4Mqg4s4zcq+OsR9
         TDewkACb0rMgFhX1Ks1JeD4h2zpc5FrL+fBl5/qzjj/fEFtvinMk99XLZfY/cm9xgBWP
         DfenALCr8jibfB38BB9evCLyZBiTz11eYGKoFR/ZfyfCEagxSLz0GvgVkhtQQl73pM7J
         RXnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=45TUjnFLPimeXg8OXKr+ik8F39XYQsq1QYkNFiI3doc=;
        fh=u/vjB0vmMChW73oJOJ+p0NAxAzdpdPOmI7HfTBHk3JU=;
        b=PWJdN7W3kTQ8pNA/ekniXr5TmtRRGTsFsDJjbWlH7QROzTKDJKc9BwFSMIK2hv/2TX
         WYbE3SpBjIJMsa9UOIDpLjRY2RG/P8LipREh4lcHJAOW6ObLCt/8ap7R2uxJgIPzqWRs
         F1oYa3hIrf0kyyAJmMk60iuTrUIOtxnYYchYJC1yemLO4Cpro4e7liqNuuSUq7OG4K8Y
         FiXngwZvkZyYKoC9/OeRGqc9Gq9z8vcJK4g4UtKGMYUdo30etxn06ZG9MUJxxTDmJ2uC
         9clby6MxUUDBUEjRY2gnk4Smn5siNyddDjQzKPAxwZKWNcXRsq6hfwc+nm1olQCZvV7r
         1w/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783410907; x=1784015707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=45TUjnFLPimeXg8OXKr+ik8F39XYQsq1QYkNFiI3doc=;
        b=sbiZpTkaAQp1XhB6QZuIVTj0b4lvJlZSJ673hEXkJYkxCaOWZXHLpgEwKUyQKtkoDO
         xuGjQaxR3i+L5Sl1PdmPMrR+LxYsd8k+4e2k2EfKnNwk71qX8V32DoTOiqPyW4OXJQNr
         us48X+2lCQq9ftgKkOJWOyryPBaHJ7TvK3/vjcvVwztpUAGzPl1LQmRyp/Q3pHhnu3/q
         Djc+8vxquB56r5Asrwpd3q0SnpGzx664d1Tsj5wFK/w/LXFe20WiZkg+oZOTZin0gOC1
         +Dy9kEMU5Bmj+CeAML/SkXgGoCm3cDkUFoBFoQ6uFwtu65Df/5SLU9Sxx9XlhTIScaDb
         rz5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783410907; x=1784015707;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=45TUjnFLPimeXg8OXKr+ik8F39XYQsq1QYkNFiI3doc=;
        b=kc+KaWKKBeFksS/w6R7DFwYqSdzWOAlmIsn3nOpLZNveH5RRS041cfFtfZKuS4W/Qm
         1yvUs0FynzaVH0NKA1lAXBuDfH5rWxhttKlOD9YpGd4CEyrpT2lI3tlB2/ebcmbrlveH
         wNXHcYnxivmfW1Kw/DNjES76S5lu+rBXUClqBDtvL3vhwa5Fe0NcXp6J83T2/ZtH/JUt
         eP7am876YBLiHQi2DlFhddUl+l2HjaXVXjX0oHinRTjKwfguh2OrrcnFUPnA2yX04Dcz
         BSOkEViDu2ynwjD4wwmNBVHmsnbXmNIP4wtvzFG2cOml3qbOnsGPHWKLSqAiECBfGHVJ
         TAVQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqbojzy4/j97gkGBMgR7q+BFwfARMUD3kmRn3cMAdnkdYmSa8js2ivNnZHrwa1+ub0v2PDF3k2yN2c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6AXDMwNhiTjs5roPhO09Lrg+pabxg+17ysF1ncn0JSBRxoIFK
	Rnl77Wp9I1I26VGgX2YiD02etzGmGkBjr35Wa1doy0W3P8n7271cGRzuEB8ah+rso2Tvx0S1qc3
	K6Ukzpxf6TdbZR3sAovA4lCu7OzFjoR0=
X-Gm-Gg: AfdE7clb9edy9irpiDk1LB/ub8k4PpieIl/GFTlkVIrGJLi3ThhaAkPL09oqYd/sfxd
	Iq2Ja7VYRvtapc2HVrGrE3adjbl9yRbH4djTJW3g6mEliCC7lzh/379TH9oHeoQPueKXyfGU/MX
	uKtRBixXjszm8C5Cg+b7f/XQ0Hyr4tJAvn6Kt89J6ZfrYGOQ2DCvpmW9YDX6jWTIJ6182u/ZeyK
	lgcifQFf41XreZPuFV0kjL0TkaJTg092kO1HfhdZohLrm/m3Yp7RBMU0oPpJdEAK1aIOdGdXE1I
	Yr5Qlx0XGyU/wLk=
X-Received: by 2002:ac8:5944:0:b0:51a:8c97:fb9a with SMTP id
 d75a77b69052e-51c748e99d3mr43147321cf.67.1783410907124; Tue, 07 Jul 2026
 00:55:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629142348.273766-1-akkun11.open@gmail.com> <akwJmKqZJS1sJzFk@redhat.com>
In-Reply-To: <akwJmKqZJS1sJzFk@redhat.com>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Tue, 7 Jul 2026 16:54:56 +0900
X-Gm-Features: AVVi8CfBz91Cjj_2TyUNSllobZ66hJIFMho_I-2O9RLREdueZiXV-s936xkFDMc
Message-ID: <CAKr_iV5zZ2TR0cE6E8=5JLYqFwYsvGEs8vqKL-rN3RtuSu0Unw@mail.gmail.com>
Subject: Re: [PATCH] clk: mediatek: fix memory leak on module removal
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Miles Chen <miles.chen@mediatek.com>, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Brian,

On Tue, Jul 7, 2026 at 5:01=E2=80=AFAM Brian Masney <bmasney@redhat.com> wr=
ote:
> On Mon, Jun 29, 2026 at 11:23:40PM +0900, Akari Tsuyukusa wrote:
> > diff --git a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c b/drivers/clk=
/mediatek/clk-mt2712-apmixedsys.c
> > index 54b18e9f83f8..24522fc24019 100644
> > --- a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
> > +++ b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
> > @@ -129,6 +129,7 @@ static int clk_mt2712_apmixed_probe(struct platform=
_device *pdev)
> >               goto unregister_plls;
> >       }
> >
> > +     platform_set_drvdata(pdev, clk_data);
> >       return 0;
>
> Please add a newline before the return.
>
> Also, please split each fix out into their own patch to make backporting
> to downstream kernels easier.

Thank you for your review.
I fixed them in v2.
https://lore.kernel.org/linux-mediatek/20260707074839.240676-1-akkun11.open=
@gmail.com/T/#t

Best regards,
Akari
