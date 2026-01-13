Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EAD3375C3
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 12:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768308101; cv=none; b=N0q5lfyehy3JpdvkGhobdn8lJCIwlimGUwqkC3XNkqZ9pGzfj2ba+KBrQf7sPzc9WJxYOjzw6ZUEzq0B4KulJ6bafMEM7neVbhQ3o7nOTsmt4T7Eoy5X4bvE+DHO83WGXqYZ2FSMApNQ4hd9dZZitLbBLY3K3UCzI3FFEbRsLxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768308101; c=relaxed/simple;
	bh=eL7PVQngbIdVjMNaJ5hOZrkkQGnCOSIAXevP5xA0IX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H/IvjsDHRrU3YaWs8nKj7kBxGmraUv3tjGMZQUnssoXzgNhOzLy7Zum4BSqPKJbcRFGpLrBtChhcr8KmFlAjYwiL55Rzo+aLlDYAGI4rDATxzBNhCRRBy8Fx6hV+qIt1J84tvX5sPxW3FR3mx4NowqvnbIs2rqdqMQ6jpZFhKWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IArth0Ag; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IArth0Ag"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-121b14d0089so8278723c88.0
        for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 04:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768308099; x=1768912899; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZp2uYJnywwdgCrteoAFDiLSewAt3VeOOdwmUlnDeGY=;
        b=IArth0AgzzjGE2eBSgFxLvqq7imTbwt0DwTPHzCMcAsiYBsEj5CZXygaEnzQJiWht4
         fQoW8CkW+w0a9ytOxqV4gwv23OPzQUtkTfACQ/YTwz4vs1pNGDNz5dKJAXn3uAPfSwvE
         gDGJ+TeAG13/TI/d0raWarYpI+c7gOIEoLD/rbEUZIhfmNfnV5VgpRZCpdmb24wiKIjD
         n/TX7bS9qYb96UBhgxSryvCCPK8CCS0wAxTf+6ZsYY4Xp0OpVzFLxSClV8KuOg+6rlQY
         Sc4oBzlvEf5oDsptUeKbB/47mv6n7shyoyU8Ty3m6BgHZV00FfXzNZiWvVE1K1ZpBYMj
         3vCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768308099; x=1768912899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PZp2uYJnywwdgCrteoAFDiLSewAt3VeOOdwmUlnDeGY=;
        b=xELCQYGCKPrFmJPJH5d7jJFR4B8LVYeQ9Ys4stZFNGnj9xUfJ5HCLEUMIdb+K5dfT1
         7xcEvtUjfD5o1bRADt0mPEIgPLNlOIZ+qU1mE/01jWy4PD/Awjo29SS6Eyvdiv9pF+8L
         yPoLilbz9BaZYav3qUQezWutGbyXWtVT0wL4AIp0w5ihrFeHsO3HuTrP2AMRH5kKoaxD
         RmvRWYqmPGy5z1SEovigDUqcmJV+IzVYhj6T4IL1HU2QanOGdvUMXQ71EoW/tFyWfVhG
         4KM4a8e0lYA8z+D//fL0g2SiY+IaXKhanpyjSSbxdK5ztrk2Rmd3vYAaoJ7KDy7JaUQs
         2K5A==
X-Forwarded-Encrypted: i=1; AJvYcCWCZ+P2Mz8u/T6b5obTY0EK66oZZ6X9C0b+lAyHnbcujINCi4Rc757s4CjBZdBKXTXMsz+fMfv4UK8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGysxTu/3y7pHbBMgvPZo9y6CoDV/w6KBmJAuo5ZdSbQFJ3V8E
	ZCXK36obb8UMIesM/9pXzx+R7NE5OT9cPLLG67y/vqllH/XPMY53+e8ORy2YaFVMH9JmJWWz0KG
	DJAzg1WR8x9UgCzmJOtMFVX0DHER1x4A=
X-Gm-Gg: AY/fxX5F3zLW+EP0NSAxBIhs8DjoKnOWHdHXWklErXL55OQEVXIri4f0Gm3ckkDQHRk
	i85NNA0gy0+G1pdORcaym3jBTHOAxDKNqroJdFSs6CIgWFhofNXu6VUEUomvU+w39xdMj9ev9YR
	0UrA8fZK9029TJBrQWnSvzXAzW6I35/v2qg0Slzw0RgEGvhQIS9l5WJxpIEa9hcPxumhlH7ETap
	TXqOjTTzIQZ/sait1YXjy4K6W5pXG6oF92fyYi0elleJWvtHW1CdhwHbChdH18+Pb0mceLQnZNh
	xQNJq3L3AvIHiRft4GMzXE76vJeX8HnhvBSj7zoyGvBGM3idnp7frLPSobu7YF00BsuqXeUueEK
	emlhM9mf5sQ==
X-Google-Smtp-Source: AGHT+IGGt6V7Yz/k3MX0rPgRyPdKkJZSuXllz3mGtUOW76DiNPwxTi0xi3pikWRgsy1R8i1Svd5yXzdLFe/FFbB/yvQ=
X-Received: by 2002:a05:7022:6b8a:b0:11e:3e9:3e9e with SMTP id
 a92af1059eb24-121f8b9b014mr22821460c88.49.1768308099357; Tue, 13 Jan 2026
 04:41:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113-v6-18-topic-clk-fracn-gppll-v1-0-166e674aabf1@pengutronix.de>
 <20260113-v6-18-topic-clk-fracn-gppll-v1-2-166e674aabf1@pengutronix.de>
In-Reply-To: <20260113-v6-18-topic-clk-fracn-gppll-v1-2-166e674aabf1@pengutronix.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 13 Jan 2026 14:44:07 +0200
X-Gm-Features: AZwV_Qiv0PmBxqAtHJLJya0dhZuXAfB0G9BuxIA4zBO7u9IIMz-d50P0kVBVrtg
Message-ID: <CAEnQRZBfVjX=vpzrU9sQuOmZGt-NY0P6dt1dZpciLVFa3w2bSA@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: imx: fracn-gppll: Add 241.90 MHz Support
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 2:29=E2=80=AFPM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> Some parallel panels have a pixelclk of 24.19 MHz. Add support for
> 241.90 MHz so a by 10 divider can be used to derive the exact pixelclk.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  drivers/clk/imx/clk-fracn-gppll.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-frac=
n-gppll.c
> index 579f76494eb041dfba58b8cd10eb2453a0ec4178..eb3d5e3c53946f3caf83bcff6=
54c6481611375e3 100644
> --- a/drivers/clk/imx/clk-fracn-gppll.c
> +++ b/drivers/clk/imx/clk-fracn-gppll.c
> @@ -89,7 +89,8 @@ static const struct imx_fracn_gppll_rate_table fracn_tb=
l[] =3D {
>         PLL_FRACN_GP(400000000U, 200, 0, 1, 0, 12),
>         PLL_FRACN_GP(393216000U, 163, 84, 100, 0, 10),
>         PLL_FRACN_GP(332600000U, 138, 584, 1000, 0, 10),
> -       PLL_FRACN_GP(300000000U, 150, 0, 1, 0, 12)
> +       PLL_FRACN_GP(300000000U, 150, 0, 1, 0, 12),
> +       PLL_FRACN_GP(241900000U, 201, 584, 1000, 0, 20)

Can you please end this line with a comma so that next addition at the end =
of
the array will create a simpler diff?

Look for example at int_tbl array in the same file.

thanks,
Daniel.
