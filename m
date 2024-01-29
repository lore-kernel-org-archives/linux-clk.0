Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC545576E
	for <linux-clk@vger.kernel.org>; Mon, 29 Jan 2024 09:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706520803; cv=none; b=YY5TQHq6QGHFWSN3XHVVKLP9T9jQHcsTuC/WmIfPVwGloS6G267acc2j0Dh0JmYnmGgFMbpBDzqbSf97wWbcyPySpDjvHaCGNwe1UyPhRj1dSIuutefUlZXg4n0vY161voj4kU0kJSlxBOyd1P2U2kxx8bkc80WBNfPt9Wqm+ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706520803; c=relaxed/simple;
	bh=lnkFjsphcezQpZWvGOYGk0VDXPFFwVinksF+qkpMu5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mhp5gCckVaNEHESk9yqOAK5F6wnZjr+qSX1YtU+eadrjYXkBZQQN2oWUqeaCLHFVuNxkACRZm99GjNskybf2IfyYAkL/uEQHM6yKpKfyNBf4ZnHyAuYs4T4dkh9ygmpWqzgYwxsFvCYQu4OA1E9ziGc8XFLrgzxKqbtbu8zoD2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zpcYOqIM; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zpcYOqIM"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-68c41c070efso8574476d6.0
        for <linux-clk@vger.kernel.org>; Mon, 29 Jan 2024 01:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706520800; x=1707125600; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dq424Qli/Kfhhi0JPG1g3XUSsIiCTsFPRy5rSRMY0fc=;
        b=zpcYOqIMU7I9qR0m4vb8f8kl7BLNdHvQomLmR7gPYjUXX+yPoSz/5O272i6mDkau8x
         x3KS1iQFwLhs9vB25IorpHRYL52rBVinzcF7+RfIcEbTYqZI14Izdp6UpjJO6eCBCnGf
         cyTPd/KKjKD/KyhXfAhFcK+mf8aA8U82uJv6Soh4BjB3bMoEY7n8eNwDrFHilP31l2vQ
         VlnTtwRxn3vzlZTrgK3q9VgUi9gYpAc+j2VHNNIyylx7InS+cKlFnWLn9C7gP1k+VfEc
         Y2AuB8kZCvAG+aqS/JJxPVTBVEFFCStOTq+VNgAk0BwADwYOlcYCQRL4PCvCp2FqpF9v
         YY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706520800; x=1707125600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dq424Qli/Kfhhi0JPG1g3XUSsIiCTsFPRy5rSRMY0fc=;
        b=dCSzGWi1VHEIV+vzH3GAkJjIsPzVPXWfeo9JDrwTTqUhXDlhtKMna1y1nEo2o4FGG4
         WeFSrj5XYWu9sB8aTTpQisG09vFqGqp3qYjPS9qPAxAlNcH0rJQiw1QC9DX1QhvqwPSP
         SUXvUC72PnWRYhLbFNBe4u2I/JiKTeIz6ii9LCmRnFO/imyC9s+db0wxdlR1WtqRw7IQ
         bTVyg+GHwjSBFIE3JvfTO0WFEbbw7QZJDQyFMunY4R/1AE6DGGL/YApGlq0Pm8bHNh4e
         zjLsPy6C3rCG1dZA8AjIgG4v1q+klmMo4+adfNtTQH9L9U+Xa46FNe9uxX0zG1nvR7iW
         q5KQ==
X-Gm-Message-State: AOJu0YxJIe+2dCnhXD2jxdLVFLeyjW3wmhgjBUnpG/20P6iy7CUD1ohw
	ggtq4q8FXOShDu4SzUIgQrn9MGsj1wYuzmibZ4pVlhHMgjU4HcscH4QE3nMbWLvDB8WJ6iqLC8p
	T0C3e8ixNh0+n8wQwk8vKQ/LCvoF5zqkpTKS1WQ==
X-Google-Smtp-Source: AGHT+IGlninTsbthRgv7YfGO6TDhLl3jpQ6rysNWVNRWFEYfCzjOfdh3Cea6xHHl58XzEXklrGeXPz+XTkTDWVwwfAw=
X-Received: by 2002:a05:6214:f28:b0:68b:5142:ba18 with SMTP id
 iw8-20020a0562140f2800b0068b5142ba18mr10003938qvb.9.1706520800405; Mon, 29
 Jan 2024 01:33:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240127001926.495769-1-andre.draszik@linaro.org> <20240127001926.495769-10-andre.draszik@linaro.org>
In-Reply-To: <20240127001926.495769-10-andre.draszik@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 29 Jan 2024 09:33:08 +0000
Message-ID: <CADrjBPpDfaXWBJ07Xh8sm6jDjHy94=3m8TFmeOFnSFDRs9hu0A@mail.gmail.com>
Subject: Re: [PATCH 9/9] clk: samsung: gs101: don't CLK_IGNORE_UNUSED
 peric1_sysreg clock
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	tudor.ambarus@linaro.org, willmcvicker@google.com, semen.protsenko@linaro.org, 
	alim.akhtar@samsung.com, s.nawrocki@samsung.com, tomasz.figa@gmail.com, 
	cw00.choi@samsung.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 27 Jan 2024 at 00:19, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> Now that we have hooked it up in the DTS, we can drop the
> CLK_IGNORE_UNUSED from here.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

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
