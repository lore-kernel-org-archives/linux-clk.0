Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8792533E367
	for <linux-clk@vger.kernel.org>; Sun,  2 Aug 2026 23:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785713676; cv=pass; b=TwIKJj7gRNIafS5Uea/i31TbqPFbFzGVJTDEL4cNWXatBe4uDKr5XWfgl4QNUOvcLwe1Zh53y0uQKpLPEoaBsW5p1inYF2eqLCTMCZuoEZUECaE5BxdCA+W4AoAeg/xQTBRz4O3tyTWxDTlC031cMcVhuNizMua43Xa0Fsz3Erc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785713676; c=relaxed/simple;
	bh=r9KgUTKyyUoonVl1aK1Qv482tGrP1f02ChjstcnUuJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oAr+uiB1unhzhE0Z21Dypa+cIq0IHd0GUh2kcId0BohcrpBUTangSHhZbU2t6i/Q+Ec0JAQyQj/rHvixRQei3/XiBZsLyFo48gu0Rc61he7m2ppnV4wtVdUtOyPUlQjJffSlK81HIJYq10eo/crmJC0Zc51Z2yttIHojxiuq4Ws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=hVfYhs79; arc=pass smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="hVfYhs79"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-74748e3a4d1so1304997137.3
        for <linux-clk@vger.kernel.org>; Sun, 02 Aug 2026 16:34:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785713672; cv=none;
        d=google.com; s=arc-20260327;
        b=OQWBcRXLHjmvVz9eJtT7GmWyyJGO5dWme1JqMxgTEzr7zXaOL9vqZbcNk/GQNYkKzt
         LJ7XzuYl0KZZ1I0y+8+z//IZEuesDsYcTAmNMT1o481RWCCGr491kQIm0nYmEYHStbrT
         ROIGYG+z1LnqgDhkzOvLbmOwchOAAEh12jqhuPzgm7Fg1WKGXTELREiaICc5YJPUEIIa
         HnplxUiDY5y9zvt5DgASocquUDGLTIkbW0KLZDyCJySifaTHraRaQGR9JDV7vyw2u7Jc
         Uro0cfHnGPr52n8ZEy4dpUm2A8sn4UFtpLpzbGccIheIAbYRKsSLqMuPHu0znr7uN7wG
         3hgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a5fAHkD2zOI/5n+d95DiXodWWMBfRxDbm6CSk1Cj6bA=;
        fh=2YymucwA/KzFwjnQXjPDSTTQ1cPwmyn1AzSKGalD2eQ=;
        b=MbFxiMgXlFwZjD7mJgyBTWhLG2NstQ9vkecAN8sq6UZHMTWmHxbjWHGmZBXNuzZ85c
         aHeULGMUhvt0+VMX5DSI4zmwODd8BNaNoCERPJkS3vqfal/Eo5dkxN17o6nDAnHAhiAh
         9MVoAs8gj2oESW7U5Drq6j19akbnwkOD9DYhguri3izB5USyeFsPxcCj4zs3H8Ml6x2T
         dnFdMOORMqiP0/BFHEHxTWHPCYCd9jKLVY9dhFMEpIWNxmbtUSz03QJZuti6zTRFGFFx
         cSMQQcpj8YFeZ/nDrNkUqOFNLqvV9TCIrl7viPrc20ngz8sgkSQlB0Zylbu2TonyhMkw
         uyYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785713672; x=1786318472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a5fAHkD2zOI/5n+d95DiXodWWMBfRxDbm6CSk1Cj6bA=;
        b=hVfYhs79Ub1p1Pc+0MtO3vf6cx6LKYWXfz3vPy0zRIpznKojwQgXgLk3x21sEEc+Ja
         3tZ165D5Xud/W5aJ59WUl5k9YMmBB/78fA3TVuQRZ7HaVlTf4VtIodtxnpnalykqBisS
         8rlGKt09RqY7kG0tmsJ6Do1FYmbe6a6+boI4XMGT0CTPuy4jXhUQ6TvpoAT0mJOimAR5
         2xJpyQ9dciarkQvgVOhqOP9QU6gkf1/KcwOjxxapx2q831847tsF94Bm7WB7SQUkw+vm
         PTIK7G6gN3Sbqo4BEUE9fGS8pyCeTkQnHMEHD3lOuaX3ENQBMpb4exlouq13jQLwaN7x
         WZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785713672; x=1786318472;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a5fAHkD2zOI/5n+d95DiXodWWMBfRxDbm6CSk1Cj6bA=;
        b=hZi/pIl7XZ6Qzb/lpWzbyDJePohbRIFcCzzhwT10cd+IjNnGT7ketr+DlM9rnLhoXH
         rtsXqtJ3/btEaMPWeAHn4DNLxSrG91Mn4u7/nGd/o2Cvl2rlI5Qb4ftiDYK5l/yK48UA
         iC4dF23N1ehhhoAfkbXdJ8qYtzYOfCWdEOZEB1IZXLr5W/AkH4OMzTZnwQAauLof50JE
         pakonT8LpLoPDewp/upItsl4J+CJ4l6K+4Wt3v6IyvRiSbtKfcMHgT21OSZMFVBBoYma
         eNbuoQaf581EX0nOKlgEiqmYQ2jSNr1bvYx8xzgOdi2msZGvo5OKhjqYRnGXhJA4chFp
         yCHg==
X-Forwarded-Encrypted: i=1; AHgh+Rptf8toA+R8Tdvz81a7+pSYCat/08IytmZVuRwwwABglHHteBsQOch8vKYgf4ivZk59taukbMJFdpg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPyoN5ohrCz8Jm8Dg/9/JyctRI4yTivSokgG6zqozQcXuX0QXo
	nIaBYX26VHK3XqmW04G19PtlCMbJz65Kfff6RxhI3XCB0J2wo9uWb6iz7R3IKOi9Qd/GK9OAZbL
	up7b8WLp0XlQ/uKpko/rHJdKSyD2QPhJJXPePNz9wasjWcuXXrb/mchI=
X-Gm-Gg: AR+sD11ksFCFUy5cvX7U8O87BPTsXCY5SPKzRpAtSTNQGn3ad4WPm3ap1FsU3Tg2iNv
	NHlZiWFKb0aOZ0tLsc97UDXcyWuVEZBjJIbqHNKzCbnhAmBxKCAtnNXJznWApod2/zV2J8w9dtH
	Sl7vmWh0MBmeUTDGyDXADSsUUVsyf+am3layLINj4VmtaYxNh+jLgbMN6FWdl/EIRei0nGQ7qC7
	gxFXxvogkZD6EN7dj/0MKlm7I0yuOrcxnv6rkabXExfyaVxSmjgHbz04uh4d4KhFgkWi99w/YJC
	LpQg84O/lWPzgGEKnQk1y7n84/YiFiZuIwqIeEqTrz/VyFtQlUBXep1Dwr9sqBMwy+wucJr6cdk
	J7B8=
X-Received: by 2002:a05:6102:4191:b0:738:133f:8d5e with SMTP id
 ada2fe7eead31-75b2406db04mr6382421137.12.1785713672465; Sun, 02 Aug 2026
 16:34:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729121640.3864006-2-ukleinek@kernel.org>
In-Reply-To: <20260729121640.3864006-2-ukleinek@kernel.org>
From: Michael Turquette <mturquette@baylibre.com>
Date: Sun, 2 Aug 2026 18:34:06 -0500
X-Gm-Features: AUfX_mwPFzjNyFdiLCGxkGzU-U7WKJnaTqykiRyUcV4PV6lH3oA44wPFRJTkn_I
Message-ID: <CAEG3pNCwa8ZyQHuDLDiCWXDUrGcuLpT8n6O75yN8tLsgZ5x-Lw@mail.gmail.com>
Subject: Re: [PATCH] Drop Michael Turquette's clk maintainer entry
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 7:16=E2=80=AFAM Uwe Kleine-K=C3=B6nig <ukleinek@ker=
nel.org> wrote:
>
> Mike wasn't publically active for the clk subsystem since years. Stop
> pretending that there is a maintainer team caring for clk.

I was hoping to send this patch myself, and to recommend a couple of
folks for promotion to the clk subsystem. Alas, you beat me to the
first half of my plan.

>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org>

Acked-by: Michael Turquette <mturquette@baylibre.com>

Best regards,
Mike

> ---
> Hello,
>
> I recently[1] wondered about the state of clk maintenance. I think the
> part of my doubts implemented here is not disputed.
>
> Best regards
> Uwe
>
>  CREDITS     | 4 ++++
>  MAINTAINERS | 1 -
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/CREDITS b/CREDITS
> index 0806ab21c1d3..acab439013cf 100644
> --- a/CREDITS
> +++ b/CREDITS
> @@ -4107,6 +4107,10 @@ S: 4226 Landgreen Street
>  S: Rockville, Maryland 20853
>  S: USA
>
> +N: Michael Turquette
> +E: mturquette@baylibre.com
> +D: common clk maintenance
> +
>  N: Stephen Tweedie
>  E: sct@redhat.com
>  P: 1024/E7A417AD E2 FE A4 20 34 EC ED FC 7D 7E 67 8D E0 31 D1 69
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e95fc6f2ddc6..686431042bfa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6484,7 +6484,6 @@ F:        include/linux/comedi/
>  F:     include/uapi/linux/comedi.h
>
>  COMMON CLK FRAMEWORK
> -M:     Michael Turquette <mturquette@baylibre.com>
>  M:     Stephen Boyd <sboyd@kernel.org>
>  R:     Brian Masney <bmasney@redhat.com>
>  L:     linux-clk@vger.kernel.org
>
> base-commit: 3652b49adac266a3d27cb41cdfdb7d8790fc3633
> --
> 2.55.0.11.g153666a7d9bb
>
