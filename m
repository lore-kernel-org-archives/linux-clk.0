Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40710944D
	for <linux-clk@vger.kernel.org>; Sat, 27 Jan 2024 03:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706324493; cv=none; b=T++nEVzDtgiUJw5euiGRZBRdOrrUY+ajCRAi9xD+62O8+ZZ2fr9eG1Uf3z+Uh8ioRIDx9qWvswC8fkN4qfGL+DqRFyCIXnrNyk4Bl3iDtWbn30DAVXpMJwv1JaK4uJGrDSmcFKXHt4c5GdNB5i7Mkn+8T75CAAZPG9LmKEGZzhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706324493; c=relaxed/simple;
	bh=mpZkUl+aoY0RPgreyHKlJ+srTSeRBx9b883F7RwVZk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mez+F4o37ZQxyiW1WQfTBqECEKDA0GRUxkE2bXwifpZBCf55r50yAsncIRS7swZAQfJJ2uS5BKE133EJlL+uacz4EMT0ZVXoy5a9wXuEVryc6mUYSrvXKJ4dbcBc2C7thT7v85C6r45lVIpGIXUdk9NUYPgcQQVKY5CSpOwomtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VevkzP4w; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VevkzP4w"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-783cd284528so74189385a.2
        for <linux-clk@vger.kernel.org>; Fri, 26 Jan 2024 19:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706324489; x=1706929289; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vkFM3dPZG/f/Fgbkzo0F5rzKiKhEW9FsgweYkZSxkY=;
        b=VevkzP4wss52AckR2Xw64PJqIlrwgsfeqKhyXWMzUmjWjASYj09SgR99kCLr4e75Gu
         xpyKLSWpsUWewOdFcGkjkslnkAsRLGOPJ/C6t56XWtJ6GNkONIGqtWL0OETo51vnbTpx
         CiLigDnTfuuho4tQbBoNnnNcdg1pzh5GlFjY1MaOIsW1tIE636Nica1kM9ISym9ggbFF
         eAsmKZjyD4HRJ7kygRqM6Ynobb1nzYj6bjO6q/+46qHQ21oHFdMxlSBIn8tmaDcMe+F8
         Tni684OAHHtpFNE6xFTLUJrlgnFnJPRJu0KDZACDm3Rdas5fwYDxpi2dGPiD4xEcYFfy
         WcFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706324489; x=1706929289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6vkFM3dPZG/f/Fgbkzo0F5rzKiKhEW9FsgweYkZSxkY=;
        b=EBx/hA0+7x+RQeDyRYOdPO30BeWdNBmzxJUZ+4wlOYn/J/PYf+BFqBiF4eAEIJDJSX
         4PWTkakYtAfzEPGbZj/py6W/upepGuxrXIUNdSao3j+O2EJDBFlI2docl9IxFTwh6aEh
         vDC+W5iY+iyC6UK82axf3Vrag42yNw5bFM7+l7KW+bFrTWKFyKIzvGBSK+DAFWHRR/wj
         Pgc+k7MUsNMU/Uof3p/r4LcrbhRGg2MYFOY6aKfqYDd66MGlOaiXtmaHPEEp3Nc7vLI+
         AqqSYcYcY7Nlf4d6seP5uHsSUoGNKfJuYf4guoMWPlVZgjQHron2S/xITlBKdDsvdbjE
         OzDg==
X-Gm-Message-State: AOJu0YyLXBuwjtwaWmbF6fp7RrBlthu/ResU3soN60Ro7yusW/fa08Qt
	WU/8ajNN1BlLT7NeZpxR6RTUAFePyGnukcuY7cPJc/IdCufn/NEKjYWGutDqWWDWDfYT2X1y/R4
	DJZVlgVAyyJTg4d1x2KG6qgG1IVgVOdi73CkZhg==
X-Google-Smtp-Source: AGHT+IFAX35xMXfkakOwP8K3SMKnMDyNTO76q5ljD0La4S0xUuY7z3pgZcTD6gNcSa50u6yVPmp8bpq8bGmPXbkujUM=
X-Received: by 2002:ad4:4eaf:0:b0:68c:3df8:735e with SMTP id
 ed15-20020ad44eaf000000b0068c3df8735emr72545qvb.63.1706324489202; Fri, 26 Jan
 2024 19:01:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240127001926.495769-1-andre.draszik@linaro.org> <20240127001926.495769-10-andre.draszik@linaro.org>
In-Reply-To: <20240127001926.495769-10-andre.draszik@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 26 Jan 2024 21:01:17 -0600
Message-ID: <CAPLW+4kY-K2hnDTTeB_KkkqrZLai_V6xVV5DEm4tY6+yX-zKQQ@mail.gmail.com>
Subject: Re: [PATCH 9/9] clk: samsung: gs101: don't CLK_IGNORE_UNUSED
 peric1_sysreg clock
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	tudor.ambarus@linaro.org, willmcvicker@google.com, alim.akhtar@samsung.com, 
	s.nawrocki@samsung.com, tomasz.figa@gmail.com, cw00.choi@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 6:19=E2=80=AFPM Andr=C3=A9 Draszik <andre.draszik@l=
inaro.org> wrote:
>
> Now that we have hooked it up in the DTS, we can drop the
> CLK_IGNORE_UNUSED from here.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/clk/samsung/clk-gs101.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs=
101.c
> index 7f6c3b52d9ff..d55ed64d0e29 100644
> --- a/drivers/clk/samsung/clk-gs101.c
> +++ b/drivers/clk/samsung/clk-gs101.c
> @@ -3393,7 +3393,7 @@ static const struct samsung_gate_clock peric1_gate_=
clks[] __initconst =3D {
>         GATE(CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK,
>              "gout_peric1_sysreg_peric1_pclk", "mout_peric1_bus_user",
>              CLK_CON_GAT_GOUT_BLK_PERIC1_UID_SYSREG_PERIC1_IPCLKPORT_PCLK=
,
> -            21, CLK_IGNORE_UNUSED, 0),
> +            21, 0, 0),
>  };
>
>  static const struct samsung_cmu_info peric1_cmu_info __initconst =3D {
> --
> 2.43.0.429.g432eaa2c6b-goog
>
