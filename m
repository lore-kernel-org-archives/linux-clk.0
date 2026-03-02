Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B99E36F428
	for <linux-clk@vger.kernel.org>; Mon,  2 Mar 2026 12:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772455036; cv=none; b=C39Pf+tVKMLeNFDFrCATJv7pSloeyzmItZvx8SwxQRWiJMN9Dgp+VbaE8+a6r66IPLbpH9kRfbK6M/2wjkyCoLFn3q4MHWMFn3TsNr4ACKBXU8Q0p0HQKSreQ2GWKKKRHjvZXzqxnfo6aAT1Y2/SWPe4z5+OKRdXgXa4ic2K0Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772455036; c=relaxed/simple;
	bh=ieLd8uA33XYRvC/1/m1UwSIxYq2+WBaleB8sHCAJgK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BxzqN9XTmIeSdGEM5UKvwk+0ZFRqXDyNt4HPKy4EHVrHWHj0uLN1e8gXLcKW++wVp+hzxWUR15Aod2M8pHskrSm839GGJf6jYyzrhdKlCgi8UAE3Jr0ZvWjdJ+knjow5b+SsGMwU5FB44axT4wBqqkVwW9jtl39o3m/OE97xKcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56a973a7bdfso4015160e0c.3
        for <linux-clk@vger.kernel.org>; Mon, 02 Mar 2026 04:37:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772455034; x=1773059834;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGJIr8wFv9hr5lqBHLuRLwT5yQ6DlyeOxeauruYedWE=;
        b=JflhBn8EW6G2KIEfT39V3SYdLdAIbUR7vEQ62+ia7TvnKGob/UVA7KDtO1SaHc41xr
         6URv7ssuFHrJq3+0MczZyE4PHFHXMx1CBxWHe1u3OPsRtHJKVz+Gt8a5n0Sw/r65Jvox
         zZjIuzSVF2/dVT2PZupg3NunPcWvwg/9iqZ10yyAMEBS4oC7RDJxvfgKGHB2q6+pvJOQ
         xbIhN6mVHVyNc7Jxg+PG9jzIXctrNeMat2wNRy3zGjPOrbvfgX5nICR5edQaVHlNDRq3
         wwflOUIKqzpuqRv0x4kL0QgZW8wuUT8p8jfWDAqKWC0i30SNTadPaCpS/fKXmhfQyNOG
         6Ozw==
X-Forwarded-Encrypted: i=1; AJvYcCWH+ciJ3zZp9VpIOqzCLIUL8eMx8I6F/MYALw8qpVmZFWT+WSw/XCt0XIwn4YY9TPbWKLz1TiB3A8g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEib2koSBHlSAt8AWRJIYXH+abE911vn23gFhqIUfBiT5zKljI
	tE4mmTH3eoaWi6wMzZyaiXz60rf4MPb3HliD5n+poj63Dqll5qpZ7GTzwhJTTleQ
X-Gm-Gg: ATEYQzxPkrU8II70JPYHjrpoQZOmONLqu0rIUrf56HugXP9SDpSGvvlyCU0zMQj+BMZ
	+m7z3FeU//r/0GW0+2wi15roVVdZ1g70m3Ou10laNSBFxiYcXT9V4a6RxSHQwkRKbb+4TdcPl7J
	0chq9wFKTRbObmVP70nK3YmZiY3VPwXxFHNtq+MEla/cqFzZ/mFsH7eYGEMNfguLoTrM9n8KPh4
	KuBWmCiJorGnblvq73rBN81fmvk/UZ6w2RSmJdyz8Sejw0w92xk1leSAEGoOXIOkxVq4/8lwL0T
	HlvBL+R6QqfPVvEKs7QRv/OP35Q6D136lvb4zto4kb3KgjmzjXjYvd0eajr+n1K+hFVjACRuE2x
	MOWLA1GqRP7r1cpINdu8m2vwFrwEHlROJgyMLJm7nOpp5C+cG7Is1BZqkI66620lJU85/zGUZS2
	M4yfxgGNbbTd7yBKy9VoM84EfkJWt8Tk/JeIR4ILkqau0mo7naTt25T+E2hGfbgLum1XsBAew=
X-Received: by 2002:a05:6122:20a5:b0:560:2368:191 with SMTP id 71dfb90a1353d-56aa0a818f2mr6180024e0c.10.1772455034075;
        Mon, 02 Mar 2026 04:37:14 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91bd2291sm15326859e0c.9.2026.03.02.04.37.12
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 04:37:12 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-94ac8cbf3feso2868060241.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Mar 2026 04:37:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX1UdHgBdxp3lF8f7S3exliq+4TNa0XagfR0IMB4qVF04i01zjBxh/sDH1qJwz9FrEskhMJiBEUr/Q=@vger.kernel.org
X-Received: by 2002:a05:6102:1629:b0:5f5:46f6:fb29 with SMTP id
 ada2fe7eead31-5ff324e81ffmr5803667137.26.1772455031730; Mon, 02 Mar 2026
 04:37:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260227153225.2778358-1-cristian.marussi@arm.com> <20260227153225.2778358-2-cristian.marussi@arm.com>
In-Reply-To: <20260227153225.2778358-2-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2026 13:37:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUZjZvhifzh0W2wbMZf2DYgZjO=gXepsS2nQtSG0weCag@mail.gmail.com>
X-Gm-Features: AaiRm53-o6YuVgiLNI10tKCGvgnqzSehuU_fUzxc3DHRL4EGR1lrqXZ8SrXsMvo
Message-ID: <CAMuHMdUZjZvhifzh0W2wbMZf2DYgZjO=gXepsS2nQtSG0weCag@mail.gmail.com>
Subject: Re: [PATCH 01/11] firmware: arm_scmi: Add clock determine_rate operation
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, dan.carpenter@linaro.org, 
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com, 
	marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Cristian,

On Fri, 27 Feb 2026 at 16:33, Cristian Marussi <cristian.marussi@arm.com> wrote:
> Add a clock operation to help determining the effective rate, closest to
> the required one, that a specific clock can support.
>
> Calculation is currently performed kernel side and the logic is taken
> directly from the SCMI Clock driver: embedding the determinate rate logic
> in the protocol layer enables semplifications in the SCMI Clock protocol
> interface and  will more easily accommodate further evolutions where such
> determine_rate logic into is optionally delegated to the platform SCMI
> server.
>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks for your patch!

> --- a/drivers/firmware/arm_scmi/clock.c
> +++ b/drivers/firmware/arm_scmi/clock.c
> @@ -624,6 +625,46 @@ static int scmi_clock_rate_set(const struct scmi_protocol_handle *ph,
>         return ret;
>  }
>
> +static int scmi_clock_determine_rate(const struct scmi_protocol_handle *ph,
> +                                    u32 clk_id, unsigned long *rate)
> +{
> +       u64 fmin, fmax, ftmp;
> +       struct scmi_clock_info *clk;
> +       struct clock_info *ci = ph->get_priv(ph);
> +
> +       if (!rate)
> +               return -EINVAL;
> +
> +       clk = scmi_clock_domain_lookup(ci, clk_id);
> +       if (IS_ERR(clk))
> +               return PTR_ERR(clk);
> +
> +       /*
> +        * If we can't figure out what rate it will be, so just return the
> +        * rate back to the caller.
> +        */
> +       if (clk->rate_discrete)
> +               return 0;
> +
> +       fmin = clk->range.min_rate;
> +       fmax = clk->range.max_rate;
> +       if (*rate <= fmin) {
> +               *rate = fmin;
> +               return 0;
> +       } else if (*rate >= fmax) {
> +               *rate = fmax;
> +               return 0;
> +       }
> +
> +       ftmp = *rate - fmin;
> +       ftmp += clk->range.step_size - 1; /* to round up */
> +       do_div(ftmp, clk->range.step_size);

step_size is u64, while do_div() truncates it to 32-bit.

> +
> +       *rate = ftmp * clk->range.step_size + fmin;
> +
> +       return 0;
> +}
> +
>  static int
>  scmi_clock_config_set(const struct scmi_protocol_handle *ph, u32 clk_id,
>                       enum clk_state state,

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
