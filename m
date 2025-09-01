Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1C11C695;
	Mon,  1 Sep 2025 00:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756685832; cv=none; b=ngTLh1xDEBrxlRBubTfefDMaTfZshE0hrM3+FSp4tYR+0gKMJbUXOaTlvD4sagL6NGoYbDMgKpedbRhSoCrtvWbyJdthSGzpOM89AWmfzb54YpwqjDBwqJLque4xHdCMuujy9YjGn1w46BqL+L+0gToEEcAHflGR8SSB9kqAKqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756685832; c=relaxed/simple;
	bh=gGThJYxLSsj2Y3uJd7egWJeIaoc8wMHRv9pymEmf1Dw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IVdL1LdWU44OBlGwgxQYqAhcwfYY9JS2Lxb4MHhU7a46S/ct2dTRi5WsdS6sQ3yOIRZ6e3FNrDp+raW4TfdalUnsPgM6nnbuBTRprtcMCztY70sTNilGkwXDFnH1zqgKxB3vrNunEb1OAlHVZmO4gz4eh73RNTib/1WBbr0Ehlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mUs0df+b; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mUs0df+b"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b042cc3953cso41768866b.2;
        Sun, 31 Aug 2025 17:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756685829; x=1757290629; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ktkbla4NPIaC9jC6psct3vSFUUII2FVq3tu2TmWqa/E=;
        b=mUs0df+bSjcwU0ItUaFM7RYE00yV/vrl7hW6QeJ6MGy7krbHu0ca3j+tT2YzRmSfys
         TBq1XxFEUWQraRs0MBQs7/tIncjTY+UC/UGQ6wfS7yOulhghuijBIbAvxOe52+MLkZK0
         kh7hQ2ML2+F1MmsHoQKsXGF/Xopd3RlzgTvrJ0pVkNrRC0ZpLQcUCXxPpZsgC2xzBf1q
         UtIfCX3PWyIbmWLl2uJwuQlJ4QTOjmAOarXGqKLuk1LUYthuYXCNTecj8XRtWs1Yjh+i
         nmvoLJpGKIz6xgBvSpTa39DeIdiELmdMCGDSla0jd7T0PfekjQBpFyc/NP/IHIinqjk7
         9Vbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756685829; x=1757290629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ktkbla4NPIaC9jC6psct3vSFUUII2FVq3tu2TmWqa/E=;
        b=OcxGt2tJ05NEjiydY/gXJt3SNyKgGizaKkTsGJB3B4ZmoPOE5h5s3y04JH0moINRjF
         crxEb4ISqke6zwluLVYjIxq9bTfrUdXs5InZFCYw8Wbu+6LCNCIjedxMTU1OOphX6QcG
         GssgoQCRwOMkVIyzQO6Xz8lVOQL3B0Qakop1WfID36qvudS7kzn9thpSTnjQf736shAS
         X/PHDCFMvMhieLcSrteRs4qeVudfqt1nL0DUV+LOk9JWxwf6UiBQczbXYaSZt0P64xHd
         gQ2w+1YlwRYkpmst/9QczOM3mXFAKY7AUzvvUdO2AKwm/PF/xlv99s5d9xtAEJxyOxMJ
         soZg==
X-Forwarded-Encrypted: i=1; AJvYcCUYF/bAARvXJn4zIflNCldyAi+cGSR1kHt+sixnpzSnv5Mfbr1er5Qqhlit96jmacPMIVxkHQuJ5hfD@vger.kernel.org, AJvYcCVP1XoUBAMIsWkri2LxBILEvqX7aPz4UknDKfWDhT26q0TvLdLLEGOaP4slbzCExs27O8VtRYJhgtD8@vger.kernel.org
X-Gm-Message-State: AOJu0YycF3k76dZj7u9d5wuAqpLTEGE/wFkDdIDG3eGsB+/TaQ6WfgzU
	+7NKxG7AlSQm3eRJ1bWxhijHKBRPmpcyMBkk/4I+cKWJx18EZ3vLrv1sGxoSnmitKM4pIimuR+b
	LpL0cCbsu7eNF9r7w3q1UmnT7RkSsyxg=
X-Gm-Gg: ASbGncs/K5DKGJPcrlnJC+HIg2+GePlPIJrwxQFJ0l3dH8Hq6ZYvoytDEqdq9BXAAxs
	6KcIcQtven0Pl4o/ZVnEFqEFXsecoOOBwU0aa7EcDq7iaF89DY1HURF4a70T69eFEpP5H5QdukB
	pz4Fvma9gMXdqxi/0BIXSLevhXNn46mXMMGuTaB5xX2EXs1gUkTHdhIehhm9S48guPyjwRsGfUl
	Ezcv/m09IFMsw==
X-Google-Smtp-Source: AGHT+IGHE8aXMx7ALK07ZZk4ApSRlHpCLRxAscpFITkZtZyfxE5oqk93LXZDU0pPe6ZM5AlFYhwbpT0EWRO3nMFED/w=
X-Received: by 2002:a05:6402:13d0:b0:61c:cf8d:e51d with SMTP id
 4fb4d7f45d1cf-61d26d78f71mr5111270a12.22.1756685829050; Sun, 31 Aug 2025
 17:17:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250831104855.45883-1-cn.liweihao@gmail.com> <20250831104855.45883-4-cn.liweihao@gmail.com>
 <2235041.irdbgypaU6@diego>
In-Reply-To: <2235041.irdbgypaU6@diego>
From: =?UTF-8?B?5p2O57u06LGq?= <cn.liweihao@gmail.com>
Date: Mon, 1 Sep 2025 08:17:00 +0800
X-Gm-Features: Ac12FXwV9Ji8b_vqPwpDGDVUUVyRfoYaArbF6DLUc5xbBllmI6nYQLBSmIsHBpA
Message-ID: <CAPEOAkQYA+XSx9QJSmNFLypH0ifE1jvui=MHiEHZ+5a3SR7=uA@mail.gmail.com>
Subject: Re: [PATCH v1 3/7] dt-bindings: clock: rk3368: Add SCLK_MIPIDSI_24M
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: robh@kernel.org, hjc@rock-chips.com, andy.yan@rock-chips.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heiko,

Thanks for your review.

I actually used script to get the maintainer list, but I was not sure
whether I should send-to or cc every maintainer, so I consulted the
AI, and the AI said to try not to do so because it might be considered
noise email, and only send it to the main maintainers.

Should I cc all the devicetree maintainers with the next patches?

Best regards,
WeiHao

Heiko St=C3=BCbner <heiko@sntech.de> =E4=BA=8E2025=E5=B9=B48=E6=9C=8831=E6=
=97=A5=E5=91=A8=E6=97=A5 23:00=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
> Am Sonntag, 31. August 2025, 12:48:51 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb WeiHao Li:
> > Add a clock id for mipi dsi reference clock, mipi dsi node used it.
> >
> > Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
>
> you missed a number of devicetree maintainers, Rob thankfully does
> not need to do this on his own anymore.
>
> so please get the appropriate list of maintainers via scripts/get_maintai=
ner.pl
>
> Change itself looks fine though.
>
> Heiko
>
> > ---
> >  include/dt-bindings/clock/rk3368-cru.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/include/dt-bindings/clock/rk3368-cru.h b/include/dt-bindin=
gs/clock/rk3368-cru.h
> > index ebae3cbf8..b951e2906 100644
> > --- a/include/dt-bindings/clock/rk3368-cru.h
> > +++ b/include/dt-bindings/clock/rk3368-cru.h
> > @@ -72,6 +72,7 @@
> >  #define SCLK_SFC             126
> >  #define SCLK_MAC             127
> >  #define SCLK_MACREF_OUT              128
> > +#define SCLK_MIPIDSI_24M     129
> >  #define SCLK_TIMER10         133
> >  #define SCLK_TIMER11         134
> >  #define SCLK_TIMER12         135
> >
>
>
>
>
