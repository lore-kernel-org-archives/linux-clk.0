Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332B132E128
	for <linux-clk@vger.kernel.org>; Tue,  6 Jan 2026 12:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767701448; cv=none; b=Jo2MgQ64I0sclWZVCwdSvoYsc/63DoYolaoseP1dZ+KvoN2I+GyQTOiZMkSap5KBD94qcBrfZ8VeGPKuAi1qTkgQ4TYVbQwR2dodB9m42W4iUoZaSl2ZbK4476cZi5E1ckjcICxojeUDz33oyFjxdIO3q77GjXgyzEN+zPLf4v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767701448; c=relaxed/simple;
	bh=eTgHCNChjNd4nT4RI+bK0AEaWQQTs324Bn0hklbY4Vw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mtHS9QBS0seMjOtms6PLJdjzruZyHkZtXd8fxyNeuN3m+KCva/zbWaKlb2tngeTgy8htjuBNuuE6AfeTD+epSVDYJvblfC+qWpSlnXl6JAl2qjxPTyB1bsDMAwWbn+6yoOosldIS9LN5EydRM4q859n/052W4F7zXWRQDouxL5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=HbNNOF3K; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="HbNNOF3K"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a0ac29fca1so9424095ad.2
        for <linux-clk@vger.kernel.org>; Tue, 06 Jan 2026 04:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767701446; x=1768306246; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lu4UdpjKL0W6oqeLyvjU5YjPqjVIJexotO7ZxwODpnY=;
        b=HbNNOF3KzsDY2x89gCiUaOiOR69LnNYoF4XLL1A8qePPfE1+Lv7nvsT2420X/Par3M
         T4Z0+cP/m0VqYmVBnnAbeXyYFxIEb+4PSMfxnlNmy48BIgBBjM9kGljWc+y7pSoxJkkQ
         9Yu50lcsf6J2cFtqvjzJtmOeYnyhIDo3Aw0gu/2mgU05cunpm1H+Y/6cPE1Uim+HZAIB
         sOldGG2knXsG7wIZzJTsguU2QjdKQ0Z6gOdB40u6OhTdWlUzKbYWtvGmraNCg+u72ZBy
         pnuc+HR+3QyXdPF22y0OHYQryj7vqDarhkWLxCmcN6bOpf6FYJlXsd5q+Rn5Us3K/IHx
         ReOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767701446; x=1768306246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lu4UdpjKL0W6oqeLyvjU5YjPqjVIJexotO7ZxwODpnY=;
        b=QhJHEosCsP1p4UOUsiqgJvbUUQKiTGdLjlMnhLyE7fIPJL3j/5UgUIB1kcEWsEOyG3
         +/tNB65aLLPCFp4rjpzE6kD1G4EcYwj4ZQlxrwHYQrFmmeTFfjWlcP40IGS19KKcseFL
         PBt8ybTFsopEVjAFKqyER5bTG49IP26mp+/va2NaKMBHm6YEzQWN+tEZdClwLss+Na7d
         r68jt4s8VlE7v0LUFQWZKB4KcDU3h84sDhblB+uhZilea8YcJ7Qz2jZ2yDDJ9hCV2MIP
         dd3L+90Y1UtuMCR1YOzVDFNHlpyg5lYKN6qRCMMR3pIup3jcTQxr11+JRLEtPe8i0m0t
         mFRw==
X-Forwarded-Encrypted: i=1; AJvYcCU1wXBB+CwLL9R9Axq85liO9ubjBFgyJaajAviZzWHQURZw24jFAIhXXCpL7Qvt8DJ5sMO7n0R1lQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq0XNYlo4jjiNSM2NYJWpncjzEqWm1khExPVblk6IfPzVL4/5n
	BWhSNv8Vp5uAVUlxnmrpY8cPFTZY1RnZmm+9x1gH/fHmZYfaf4rTXlxJrY3mAzcCNozZcl14DxJ
	xVK25rJogpJTqY/QizSPXka03gnxsnbA=
X-Gm-Gg: AY/fxX4PMgX3A+zXosnJjesLgMYD9/8khhOD6dJ8eSFGa1yFatZaphw2imlni6Qhq+6
	wdTe9UrBhBv7Uc+70fH4SyfVl2MzOnjIklj16CIoHV6255Wi5DjxICnOfXJRjwIpMY4Nm2+ArMd
	8gR/BhX2wc7CXcozuPPt8RfxmH+R23EG3aS1Pqp19V+zbbY9ByR6LlNGx5iFcUqO6Yse6xV3Wgj
	YuhUY+ae6y/tocVIkA1uSmv81Sq2S17g6YIlMPV9Al28YLk5DU9MIw5gYXgM1Cgaumx+8AVmn1a
	yMqmJjH/HmlrMMqHdhBkj2riyKY=
X-Google-Smtp-Source: AGHT+IERFxDvDyxM58p44igbMDmAinSOq4k8E/VpLs0ECbN/nL2j5w231U1e4IjWyRKHGXv8g0yfXLtUOkPrS0reals=
X-Received: by 2002:a17:903:1b0c:b0:2a0:92a6:955 with SMTP id
 d9443c01a7336-2a3e2ca5661mr29241295ad.23.1767701446433; Tue, 06 Jan 2026
 04:10:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105204710.447779-1-martin.blumenstingl@googlemail.com> <1jfr8jdomn.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jfr8jdomn.fsf@starbuckisacylon.baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 Jan 2026 13:10:35 +0100
X-Gm-Features: AQt7F2rhaIwEaER7uzhe61Gje-3tMQEv-Jz_Lw7J4PipXub8W6EZ-9ebNWcXzOY
Message-ID: <CAFBinCALRXSmYQEXWWfOhXWUEKC8sYC5vg2=G0K+P=UK+TJhgw@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] clk: meson: small fixes for HDMI PLL OD
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	jian.hu@amlogic.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jerome,

On Tue, Jan 6, 2026 at 11:25=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
[...]
> > Martin Blumenstingl (3):
> >   clk: meson: gxbb: Limit the HDMI PLL OD to /4 on GXL/GXM SoCs
> >   clk: meson: g12a: Limit the HDMI PLL OD to /4
> >   clk: meson: gxbb: use the existing HHI_HDMI_PLL_CNTL3 macro
>
> Looks good.
>
> I'd like to add a comment like this in the code
>
> +/*
> + * GXL hdmi OD dividers are POWER_OF_TWO dividers but limited to /4.
> + * A divider value of 3 should map to /8 but instead map /4 so ignore it=
.
> + */
>
> (and a similar one for the G12). Is this Ok with you ?
Sure, I'm happy to either have you add the comment when applying or me
doing it and sending a v2 - whichever you prefer.

Best regards,
Martin
