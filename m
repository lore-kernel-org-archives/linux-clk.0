Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F42250B8B1
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 10:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059547; cv=none; b=Ve5vgoJzQ2oQNKg6i/CCp7IbRAoxuDelvxcIR5xNPWbc/ABQjAZeDHcHzdowCuxCrSncy4Sym7jPRH4aK5p2nj5GyMmy99hMHe1aGFJGhuUORWYc3ttqI9yBIXeVlrirMu52lDv0w8NkSIoEeY0FgHz9Fz43VG8XLpCqgnI1D3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059547; c=relaxed/simple;
	bh=obdjFi+DflTCXCJ4HEjroz7TuWbaqLtU7AT1ZuvIE9A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=togEx8VvORexug9qVd3h1KzdMGtOiwZl5dhtmmQWk2/kbtrux9J/LI1sQJZVBzWNzPdX8bsmBskqxSKMly2fsHxk4UnTKM2BThQLw7S/8SLnx49+PJ3HGXbf1lVUhIhqDDhRLidC1amWaaNo6tv/j2LiuRPxCILsuXKcShF5wcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=arsA4alg; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="arsA4alg"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1af482519so22565515e9.1
        for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 03:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792059543; x=1792664343; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WA8n8+ZwxN0dqwBSyImmmXrtU+HU1AvHwOdHA7+VJNU=;
        b=arsA4algxrbrYAbK3kb3VETgYlANl1fMZvpu5yaVUvL+ZGKh2Rg8yumyUKaalS1/en
         O/JmXIVuu+7SKMMQch+m2wC9MaB62GAjqtJhPts2iYP8tepUcPfPes6UJcdYnvUEP9mq
         vGLo0JXzqNa2z58LcJSTNdkrud8DU3DF9XF6iQwGEnceDLOPbpG2Od4i6aFVCt6DTZ5v
         k8xwVZ7oM/e6FDD0cKg7VdFMAKB6KJikTiid2rhoWZ18wylTZnhj+WmfY1o+bGU8B2TU
         yy3pvm0TxiL3wYVkLTw3qdfQ4KTkeLLQfI36flvHksSzfFPmeyWvemxTPiPQBu3aF5b+
         W9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059543; x=1792664343;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WA8n8+ZwxN0dqwBSyImmmXrtU+HU1AvHwOdHA7+VJNU=;
        b=D8jKCEYcFBDT/daCBbDWVh0Lmt1BOVq88QlHu1aev4v0CDkmCnntVrxJhuGdH27KG+
         w52/0dnR4dgi1vf9ut8uAeXyss5tA9XsUfJAKIBm00VKuUmnWBKtp/6eWNitvB68xkW0
         lAbZEB7tQLwV2Pgzl3iLwBwlkJ3gzNEJSLmsdcZHdGKeH764wfZC8mlhglwWYBSAB/Tp
         RKwwsyyFLZ6cOYlAIuob3im5CokZtoe1KifHit5qUfzQYXtS9hydbteNzzu34HsX/ErK
         tsu50OFmD0Z8v50YCw39LSKpNF7xmW2VTDRNI1/W+dZp1U11uquP2sFoDORvSZRbJlQq
         +iqg==
X-Gm-Message-State: AFq9FYLnx1BEUnH7dOT11eVlewaFN8aK0LMhUoDDpVraBJa3fIlDTICf
	obZ48g9+Yed1eOZcpwonoP04HswLZAgck9Z+K34l/tj6bzD4ZK94H95ozH2oETZFseo=
X-Gm-Gg: AYBFou3XhXheZSLmm82PL6Bp/nVfJTbccrLfEruTvb/6TPx+Rbf2zEyDW1HOO7TFhOs
	Nc1J5U6tgZ4YxYYePVaW9h/K2O4/NBrbfvSwyj8cyxBRCefnyulyQ/qPLtju4pA4PiuqTrhrJGS
	xWAkh4qmTOq02TMY5/tobP3DPb5WljQ4jPNINMx2PMInY7S065mpZojm/05tC99s9UZYqy+R2QI
	h1eydz6W0tnFtMQBUNm+xQwLj0QbsiDVwBYZp2lD2JdX4SY9jbNQeRA91RecHly1K0ySRLCtkDA
	G0K9VPlaLg/ERQOmoH26NGfECxVZmkvyviK3h0zH4oLbErgux7adyNY0EIuTquvssOlaG6/UiID
	/1VfWWta8QSDfYQFiLafSM/Po4cf/RK9dOnJTsN60jxggG7S+96xrEthtH4jZd30ZUATQRebQm9
	onUL3oScknsyKMQlHf/hLibu6KeAWNgCRBuUj9W2pwjqCHFZWvbjwYqZTzFt+GESzvhWyp02JHN
	2vvXr7f0Ciy9l2aMQ==
X-Received: by 2002:a05:600c:64c6:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4a1c27de583mr23492775e9.10.1792059543225;
        Thu, 15 Oct 2026 03:19:03 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd96fed4sm60950835e9.2.2026.10.15.03.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:19:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mike Looijmans <mike.looijmans@topic.nl>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Michael Turquette <mturquette@linaro.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: cdce925: Size the PLL child name buffer for any int
In-Reply-To: <a61f0060-c43c-4c0f-afcd-1db262cf62ae@topic.nl>
References: <20261014-cdce925-truncate-child-name-v1-1-00136be00c49@baylibre.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.1dd36950-a9a7-41bb-847b-d859a91bcfad@emailsignatures365.codetwo.com>
 <a61f0060-c43c-4c0f-afcd-1db262cf62ae@topic.nl>
Date: Thu, 15 Oct 2026 12:19:01 +0200
Message-ID: <1j7bjjfeqy.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 15 oct. 2026 at 11:18, Mike Looijmans <mike.looijmans@topic.nl> wrote:

> Met vriendelijke groet / kind regards,
>
> Mike Looijmans
> System Expert
>
> [cid:topic_3fa16e61-8444-4c42-bbdd-4da663de69ef.png]
> TOPIC Embedded Products B.V.
> Materiaalweg 4
> 5681 RJ Best    T:      +31 (0) 499 33 69 69
> The Netherlands E:      mike.looijmans@topic.nl<mailto:mike.looijmans@topic.nl>
>         W:      www.topic.nl<http://www.topic.nl>
>         L:      LinkedIn<https://www.linkedin.com/company/topic-embedded-systems>
>
> Please consider the environment before printing this e-mail
>
> On 10/14/26 18:11, Jerome Brunet wrote:
>
> The PLL child node name is built from "PLL%d" in a 6 byte stack buffer.
> The PLL index is bounded by the chip's num_plls, at most 4, but GCC
> cannot see that bound and, with W=1, warns that the formatted string
> may not fit.
>
> Make the buffer large enough to hold any int and use snprintf() with
> sizeof() so the size stays tied to the declaration.
>
> Fixes: 19fbbbbcd3a3 ("Add TI CDCE925 I2C controlled clock synthesizer driver")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com><mailto:jbrunet@baylibre.com>
> ---
>  drivers/clk/clk-cdce925.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/clk-cdce925.c b/drivers/clk/clk-cdce925.c
> index 4d49cc1659c0..56b69d4fe4c2 100644
> --- a/drivers/clk/clk-cdce925.c
> +++ b/drivers/clk/clk-cdce925.c
> @@ -625,7 +625,12 @@ static int cdce925_probe(struct i2c_client *client)
>         int i;
>         int err;
>         struct device_node *np_output;
> -       char child_name[6];
> +       /*
> +        * The PLL number isn't a compile time constant so GCC can't infer
> +        * the number. Make the stack buffer large enough to hold any int
> +        * so Wformat-truncation does not complain.
> +        */
> +       char child_name[15];
>         struct regmap_config config = {
>                 .name = "configuration0",
>                 .reg_bits = 8,
> @@ -697,7 +702,7 @@ static int cdce925_probe(struct i2c_client *client)
>                         dev_err(&client->dev, "Failed register PLL %d\n", i);
>                         goto error;
>                 }
> -               sprintf(child_name, "PLL%d", i+1);
> +               snprintf(child_name, sizeof(child_name), "PLL%d", i + 1);
>
> This would also avoid the warning, without using a larger stack:
>
> sprintf(child_name, "PLL%c", i + '1');
>

If you keep snprintf and properly cast i, possibly.
Feel free to send a follow-up change.

NOTE: please reply to PATCHes using plain text emails.

>
>
>
>                 np_output = of_get_child_by_name(node, child_name);
>                 if (!np_output)
>                         continue;
>
> ---
> base-commit: a5929cbf1406eb3da217d4a182ff6c5b73f3ed91
> base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
> change-id: 20261014-cdce925-truncate-child-name-a4d9db9cf003
>
> Best regards,
> --
> Jerome
>
>
>

-- 
Jerome
