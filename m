Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F822749E6
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 05:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773033931; cv=pass; b=p0Le6Q5VIjfgwvWTe0hxvjKIL8hx2bm5awWrEVVeb3P9xBkroWQQnviELEm8s6TDjY0skUNQA/g2dpEbgq1ObVl6KjT568lmQjgkbCKhSX2oGPUo9uZaEL+lbm7ASsCnEmz9+WkPAqOaQMJPsRPeHQa8ZXRfO+Zy/i2Bv1UF8w0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773033931; c=relaxed/simple;
	bh=DUExVCyNdG5YpObz2nxsxQo/pWFxavqjeF1Iya74LKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jrkb7XDiUtnIZV9sRpYNqPSwLTKHbKrS446SZbXd9cbblM3Tl1tvBf0c6Vnq/MScSyRuGN4++4gIysQDpVPIRkk1SVjKps0bPACQbjLbxSqX9Quc3RCy44vyv9N3rtevy/qvQva4K2DQsPpyx1GwMNXSeCntYO2RZBBr7Nd4YhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=POZRvXL7; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="POZRvXL7"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a133502accso4089560e87.3
        for <linux-clk@vger.kernel.org>; Sun, 08 Mar 2026 22:25:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773033928; cv=none;
        d=google.com; s=arc-20240605;
        b=P5D/QygMzuRHvwihn/WVcntAPyrsz+vWFBgGiK5qdtEY80B894rBU2yUD07LW4fzNB
         w6T9kx6V27FkGGAhv8aA48m9rL/eUD8CS2FwIunJwVW4UhHEKOoT7IjlaECk0xeXjSCQ
         2QqxgNejz3ufeua6RE/qfEV4nYIe7pgqNRAUw8/unJihFCAXwy0bcl6xj/nQoQWVbhrX
         Su0nFJlwWPd/z62j8Dbcy+GdyNmHyxG1uzWus+hrp+dsgLKpCiLBJ7qTLQ9iZ2B9RPf7
         HMi6ul8BPNrxSoIdrMqKGsCKoJvVI9eAt6l97UBgX4vfvpftj6PuMPEl6NrKTfTdNh4J
         w6Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DUExVCyNdG5YpObz2nxsxQo/pWFxavqjeF1Iya74LKQ=;
        fh=ri1KWL2X5xJA7g26vaQIeJQtQohuYadjEHWgoJrZ3Jw=;
        b=dVfCGXN1XpuP2FjCQvY/X+xSvgicczMzMMDRlCXOB9D/fsE5YCO+mZ4t2zyB0GNBU3
         /tMOp2edY3AyyruE7TsxNA6QRvVVeoPcJ+r5pSl6/R4MRANIG6snu3YZ9D44unKLgLOm
         hjWTowS8Y0AANhxX+rJfk3LB+KjAjBS/MXg3fzd3aqABEfYVUynn3ftDl5Df2Z3/aR0t
         uM1GSLxpeuwW50PWHqbxc+EFd25hTQBlYGz2HOO2kvRappHDFS6pLYEDMm7XNkZvu9mu
         shTISLe4IRbEej5RdxL+D5+equv8OBWEZhDenAez7RVpSd2igmeOrw1/glZ33ad0BaBo
         a/tQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773033928; x=1773638728; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUExVCyNdG5YpObz2nxsxQo/pWFxavqjeF1Iya74LKQ=;
        b=POZRvXL7JkcIdJGdufQAKIWUOv0aU+9gFZj3Q+bL6+h5ZnGxjoGAEvctLg0jCXp7RF
         dc8m5rxC3WXkrvBFVMTvL8zJlHjSW4549cRA5rYyropwbyh1awrNHxIFeNxPjxyQzBYi
         u33GrJAZ19xzQUlY/50+AtWvA7tIum875h200=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773033928; x=1773638728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DUExVCyNdG5YpObz2nxsxQo/pWFxavqjeF1Iya74LKQ=;
        b=pbESo6EdgGiRp9e+qJnuocsdZmERbJOxDuzQ7IHj1KnakdV6szb+SyShu6/xO5+65b
         ZKrMEeVsetEri8FbIHCdttj5Tl8nkSg2b9sNAT+QUtBagdUjbWAprVToX5kWQleXK98P
         Gg48XuflqEJ0FIJMOmYbbF68Tx0eYoWDt28NsFiZ1XqWLaNlP2wb8M+dfU77Xqfn2j0Z
         HWKMrbcrbqWcsdqdy5FTB1GPrkofqy7RhETurFAlWQT5DTPMnjMcUq/shfG/b4D3Yjb5
         9IK/3p2NkHIo3W5mCpdbW432jfpviFlYUgfknH8jOwWMepFvnO0IeEPt5KpGzUZdo6uc
         CXkg==
X-Forwarded-Encrypted: i=1; AJvYcCV3b9U8ueCbBKS1dY+XmIMOFbUtP8wnGkrmAgU7vGN6GhZQLKtaihMl68115XqykaI1aJyQFaaP1Ls=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRlFaJ2XR6wyHs/R3YzqwQ6gD4KwmD3r1Fgy07zOX+e9uEcPZB
	H2Y/rVdtNwqd0ljcWqt05u89LRXBqRvzvTHAeU60S6cbVQkCVl8y1ytpHIhXyma15N/OA8Drfle
	jNwARuFfN+9kDTpOxpwnbloftGBso8uBvb0umTlv3
X-Gm-Gg: ATEYQzx6sCV0lxe1qnJyJPoPdDLnTKmS/k99jX4sgPK7RNkWNas2NNn2psZOvH2xNBn
	tPtKIVssifa01SFXfcyRpyUeOfB5U6H4cIwBnkKTl9AcXWDr05KYKm2M3WDBrYcNPRtscv2CT1Z
	gAKdNUU41PgLxyOrercxURPt4D4ymBu6IJSz4wJm2hQ+Ha86mLp8FjPtktlLxfuA2Q/wdOA/0KT
	q0bd6vnPxASyCDlon035oMqbprf8sXda0+UoOQVM2wxkYiacVHWJF8MaQOKj+AZW4+PvyMepgg8
	xyf+1RnkBsqjFbwqyod0gyEmivBAhDwJjk5R1ML/zvJYaEO/
X-Received: by 2002:a05:6512:1554:10b0:5a1:3f54:b3db with SMTP id
 2adb3069b0e04-5a13f54b53bmr1623132e87.8.1773033928040; Sun, 08 Mar 2026
 22:25:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304181024.738391-1-akkun11.open@gmail.com> <20260304181024.738391-2-akkun11.open@gmail.com>
In-Reply-To: <20260304181024.738391-2-akkun11.open@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 9 Mar 2026 13:25:17 +0800
X-Gm-Features: AaiRm50OIiHuDB6An0GfjyAzF0gVfkfGW4EfH-a3Pnq4RMgefi_HoUtnuYAX_9Q
Message-ID: <CAGXv+5HnCqNsQxnW0oKV52A9xYVQg-ur018S3=TzhVR2Jhfqzw@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: mediatek: clk-mtk: Add cpumux support to common
 probe/remove helpers
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 5, 2026 at 2:11=E2=80=AFAM Akari Tsuyukusa <akkun11.open@gmail.=
com> wrote:
>
> Extend __mtk_clk_simple_probe() and __mtk_clk_simple_remove() to support
> cpumux clocks. This reduces boilerplate code in drivers for SoCs that
> require cpumux registration, such as mt6795-infracfg.
>
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
