Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A176DCA6F
	for <linux-clk@vger.kernel.org>; Sat, 12 Sep 2026 00:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789172314; cv=pass; b=Rp6X5QMhwqfyevyZiGmHMnMhxZUKKPrhTrax3wy9lYdu3tfWs8f/BSy4sHPoHjsnW/A3B6w1B90E7pHCGZWLvI302EK7nIZ3aUEYNANgoACg2zx4+WTKO7asMKEMlM6Ns5rAPnAY6VSo5IMTXa4MUlWABDe/UExOiYDKd/bXAqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789172314; c=relaxed/simple;
	bh=FKzkqU4YemmerA1tbvFMUJ1w1CS/IWoGJw9B7s8wdCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kFtADmAj83DjHOcHK8BWMkuIoQJ/Ya3fUeJytaQrM/4abPRKeQ5ZcreU9lRECRvDlgvTveV9TtDaYJrkneASxtroy+Dck83YSkfkZfsYJfboOVzq9jyq08VefhbQVexHAH9G3Ps0nPdpfqiLlAKhB2QbrLzxQe4nIAeK/5SbFOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hO1GsG7f; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hO1GsG7f"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa4c24cso18108566b.2
        for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 17:18:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789172311; cv=none;
        d=google.com; s=arc-20260327;
        b=st9xjcwFMWCsiQa+dKD9W+IYuDPJkeGAGg4JopFaRsvlMoDzafNUhnJvL+W23RAA3/
         rhYCNqhKlbmvEuMqO0tPzNIrW6fLzqmzEi0qpRVNxrdZ4s7ujHOzUKZlBtZRYeL+kmCB
         iJpDIIN30boDaato0VWoi6Y2FKXJhAEKi5oPzJslWi+4yKOeWrFuaMGezESXaf1Be4oj
         wSRL7c7FjHjafSuP4x1NrGdVZXQapU2Mo731fEUE5QgctVA23pDBrPyqCNhb2IuybQDT
         DESZSfKFODh4rcRxOU+jBn5Y+lshMoYxHueA+lJ1Syk+le7JVw8DadmOHlox0Qkpn/ng
         Fzkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YaieaN1FqHtiGqiMiCwnr2vc1sRViEs9JV9afuzauDQ=;
        fh=HXaphkOA7t2cM0oZMy7jO1DDqXHBhp+nBO0bD1r6jZE=;
        b=r3NdABRf9rMz/oCXPmWMOYlNj2qyj8TCRapvdIgpjLHbLxvKGS+hN/z61FYEAt7rdG
         f6/FSaJ56TWatV7zf/UYEMMsnFW0XTqYRtPmEONdg5ypl0RgI6s4ZAkeG1G82KSbFX/E
         h7vo8oB9gZsr1iGmFmvt1HGRq3Ht1RS4GVVvq0CzAHxbAa4ocbJ1v45Wc2xXaMzElLWZ
         HE/K7ri969fAK1N2uzMTCJdjX0kMz1JbIhc78D30ZLBaAb10zBJVTjcMzXg5Q0syN21C
         fmdFzWwIZqlo/mqdHgOrdy9ZZcxoHnxHxG6sJr44w3ehw5BvfBZPk5ymXcPBxtDUQr76
         bOrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789172311; x=1789777111; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YaieaN1FqHtiGqiMiCwnr2vc1sRViEs9JV9afuzauDQ=;
        b=hO1GsG7fjV2ZeToDplrFW4r+q6Q5NsE9OBEcL4NRt5bqZpJ18skE54K3vU/daWGNwt
         UaL6nvM8I86/IT68kZ5sbTdZbQ8NV/ABbax7Ybh9GssW8NL7nF5ev6xuUTLuWz14y0ni
         hsMyLDnNhW+BwPRlsMJ0tEcqGMaWqsD3kgsVqeCAJR6HLD0+pVBqPcajKFvfB1q+9O8U
         KvD3s1TocgId8AKf/yllyP/+Kbf9N77V/YaKhI2YOfb65opv/3WR0wUb5N8E34+sq/kk
         whS3sRRgH0qAQhcHhgtwZBJf59Gpn/xZHfiu5fsLtFjTc1m8LMnyq7wh5QPMmqfFdmj3
         mzbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789172311; x=1789777111;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YaieaN1FqHtiGqiMiCwnr2vc1sRViEs9JV9afuzauDQ=;
        b=p7Q13S4xcVu4dpFAUZE2ScRemUM+jHE53SWzVcWvFhGegYTxJQOzgM5CFmGpvZdSd9
         Y43UhJ7Z8CSlF9w2Z8W6CSjTakcwI5CC/q7qdmsGN/16cu+eWTCD5ddkyMbcpvYqSOzg
         zfH3z6pRxmROs67Ii3fVZrAL4S19eG9cvbUNUPlsFIL3+JdTS+gRPnrvh05CAeuqCzon
         hRFKtNpIOI5NJ+EKM1b+ax3nTV9Mglf+1lgUs/ZpWrXkSMoH7bE5uF/uzd6MxlKZK4he
         4dWCGei7JiQpySM2mYjRpN2+zxUlrtJtYkQr9m+ubRPV4L1IHFW5NRA7nyqCq/t5/fYR
         e+OQ==
X-Gm-Message-State: AFuF++na0sG/CQeLkG73ClKbwlw6kLkFFZNf2Mh8OjWRFdkwnhXNNFmR
	uiih2vIfCK0yyEe+9lN02B4NsIFY4Zvsh1Rzfn0O4OhQJh/1R8lFmxug6MwmpsdWOlxqTlJqJO1
	aIBJXeG+iO5wAtszE0iV2BuhE9jjJm6XgOw==
X-Gm-Gg: AYBFou04fS0yf1FhZnG6WEX3oY7/TdjvaeJSIc1VEkA2+8PTpqEP/Gq44S/je19zrsP
	YkTy6s2PJ5VQtzE76CiC0pq+LUiHWlIPM6js7zvh+WrrNAGtvoLbDJ20Qb+xboiArPNyF76QH2R
	At/EKHZkzu/AjHGusQvR0yXrkNTW8T4P0XCVwxsSHD3aJYZuPnntbvvBOKSLym+RbJF/vWdP8ar
	O6h8M1XHRb4OW/5Vhjdazpx3TDN7tzNWNM9thuyXIKOQiVDfokDmObWD34idRIOC9NkfQDOtOab
	4u6zhAL7XJprBLVsmt07TN7tRXM4tEqyVLnCRG+WYNkMAwyQj2EGfCS1YbVAba9R8BmBuEiot9F
	EbUc/hrZW9JhXGir6sQ1KBg97H3qsMjxpJvBYEBRPxVMuOB2WBbc6VtNoggiD4tejQavEbqDGXs
	uxwj1erIlyZ2Kd97OIHNLp6U8uDIVwjkEqW9lqB19fHgK5gnwSHxFC5foafLNNcUJTag==
X-Received: by 2002:a17:907:3f21:b0:c28:fb3f:fe20 with SMTP id
 a640c23a62f3a-c298587f908mr30570966b.30.1789172310754; Fri, 11 Sep 2026
 17:18:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512010938.41114-1-rosenp@gmail.com>
In-Reply-To: <20260512010938.41114-1-rosenp@gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 11 Sep 2026 17:18:19 -0700
X-Gm-Features: AcwNN1VjGclVgDXoZc7y-ymy3Y4nPyfaHNvSijxFOUTu1oI1BkyysKJCgXiey70
Message-ID: <CAKxU2N-n-yCL9CbuAzdN7jJqjx1p5noVNuAze3CKNQvHFd8P6w@mail.gmail.com>
Subject: Re: [PATCH] clk: pistachio: Use flexible array for clock table
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 6:09=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> Store the clock lookup table in the Pistachio clock provider
> allocation instead of allocating it separately.
>
> This ties the table lifetime directly to the provider and removes a
> separate allocation failure path while preserving the clk_onecell_data
> lookup interface.
>
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
Should I resend?
> ---
>  drivers/clk/pistachio/clk.c | 15 ++++-----------
>  drivers/clk/pistachio/clk.h |  1 +
>  2 files changed, 5 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/clk/pistachio/clk.c b/drivers/clk/pistachio/clk.c
> index 80c722c77a1b..03e28779011f 100644
> --- a/drivers/clk/pistachio/clk.c
> +++ b/drivers/clk/pistachio/clk.c
> @@ -17,28 +17,21 @@ pistachio_clk_alloc_provider(struct device_node *node=
, unsigned int num_clks)
>  {
>         struct pistachio_clk_provider *p;
>
> -       p =3D kzalloc_obj(*p);
> +       p =3D kzalloc_flex(*p, clks, num_clks);
>         if (!p)
>                 return p;
>
> -       p->clk_data.clks =3D kzalloc_objs(struct clk *, num_clks);
> -       if (!p->clk_data.clks)
> -               goto free_provider;
> +       p->clk_data.clks =3D p->clks;
>         p->clk_data.clk_num =3D num_clks;
>         p->node =3D node;
>         p->base =3D of_iomap(node, 0);
>         if (!p->base) {
>                 pr_err("Failed to map clock provider registers\n");
> -               goto free_clks;
> +               kfree(p);
> +               return NULL;
>         }
>
>         return p;
> -
> -free_clks:
> -       kfree(p->clk_data.clks);
> -free_provider:
> -       kfree(p);
> -       return NULL;
>  }
>
>  void pistachio_clk_register_provider(struct pistachio_clk_provider *p)
> diff --git a/drivers/clk/pistachio/clk.h b/drivers/clk/pistachio/clk.h
> index 2f4ffbd98282..1b9b311b9656 100644
> --- a/drivers/clk/pistachio/clk.h
> +++ b/drivers/clk/pistachio/clk.h
> @@ -142,6 +142,7 @@ struct pistachio_clk_provider {
>         struct device_node *node;
>         void __iomem *base;
>         struct clk_onecell_data clk_data;
> +       struct clk *clks[];
>  };
>
>  extern struct pistachio_clk_provider *
> --
> 2.54.0
>
