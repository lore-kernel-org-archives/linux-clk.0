Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502546;
	b=lxdc+4a0cbCviOHAoKaekmt/HieeSGZKhto9D4Uwk5qsH2tCZZxHb9XhuYZOlc14kA3b
	 VAeNqh2EAvGzO5rYpI2WhbpS9Kp4l57Q5qsMZ0qaDoFdl9ZRQ0U5eW4taLQlCRHQyrMuU
	 m+3Q9FyZwKYiESB9M9SRSN7xhEgfIR+q6HtdcSiFoHc9Zy9geOVg5dJrgv/jqcjD6xN9r
	 zfoyikT86rmT5D/KAByt5bm1PnWwFbwL4kRqo26Paahn3yGLZv81wQFXNHh7nj2rU1QUC
	 RLWaa8br2E/aHIOd/zs2g6soWbsyIZg8BGfEWbjpdADqNIBUgoRAAJSDs5IQa1eG5mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502546;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=D+mxgjdi4ZCAmeQ/8ywDwvDse5W9MOG3smctM4dikj4=;
	b=vCKL0F/XNlxfrkuzT8MWDb4A7VstQpLQ88Vrr1vUAzaJcaLPtJt8DhKv+X626jrIvXPQ
	 4oMUsc7ehxPw9vy3gNqHUkuXNG2RPTlWC8fy/kjsX3lGWcRTQ1aQpu6LofHlr2Bm7Hjhj
	 NIEpuZ3TyKAtw2vodey2nsM7J7JMqzhzES0K5fVtdNO0jZZ/cBsapklSjzXLlC8Pfmmw8
	 M+7iWce/wihF/2V6wcnoyCjvuiX49UxSdKwl9XhJin3Dfu/o5LrdsgkkOr16rJBxpKxxh
	 Kbil3TPwkU47kwK05gp8WUFMfehM/BqEb3EnHFIS+D1Hicna/Apm0c9XuW91FXfRF1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E12606A31B
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 13:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88E12606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2a4e013a44so425756066b.2
        for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 06:22:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792502544; x=1793107344;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D+mxgjdi4ZCAmeQ/8ywDwvDse5W9MOG3smctM4dikj4=;
        b=EFNy2ioAiNZZPPhSKqgYsAmD0kV/dbn/4UbViy0X/h8ZAtI0mvIdMsHZkwShPzATLC
         WvEu1ITwo1n/4xt2BfBq3KfMFZOvGdDpQH5U9PJFDSF75f6aj5u/2oMaCWac+kUaBneH
         o5rtxHIil7FWFulabu3Crk9YSaL+fOPgJZDV3NxdfSYk6c7ahCi61cEKywj06aDqtYPM
         iG3gs6HtX10DnUXuEbnjFNLrLph8ug0H/7a18BfsGs+2IFS1VISJg4xS7XQJtO4zfzCn
         lqqD1AIFOqOJPasNtXtNdm1UzItMN7R8oHb1L5UEDpHkzh+eHPJyUxK+QwclC80qqWBi
         NxHg==
X-Forwarded-Encrypted: i=1; AKwUvBxmsZQRADIe+S7jmLKnTZ+Q+tDLE76GpcenD8pT0FuoojQUBmk14s36eBxeYSGQtho4JklBtKRhjMs=@vger.kernel.org
X-Gm-Message-State: AFq9FYINfDV+eqIhDQ644j6R9lXcXBDDoE7bY9h9vgycTnwH65DZ2Aiy
	8CWp3qRWrXpJ/5PzK3gP53yQ2fGP7QdA1syyeoOujDRK4vNQBWm96O55SYYCD3XbnLI=
X-Gm-Gg: AYBFou3mYqWuWHn90FZ3nltL4lxK7MgbudrTH5OmONysTuyXGI4K88bARr3yn1Vu7v/
	IIwSBR3agEhzBoGu0YKBhDUdabD7nIsuRmcqdwM+DqahA7fCAaOydWbyEhfZdmThFtjPNoF3XrX
	hnW6uKcy13QBfPc0mGJz24rvbaeMhqNNWdrRmTkxpT9N3fImKJrzI+XeAJsrhKoiKnDZsL4z4nR
	qlTV5zEntYQfngF+Is4mj1BflD6U+jjE/8fICsF6trFkcPVq0bnklv9W+ngoF8fx7SUcm9DN87o
	wCuoyjB0uWImGEKPBU9goDKtDiB3U94+SFKO5yLzDvuZjAKsMYFpX0ErEMsZOvhyv5CvChYZqR+
	xenyzkYuVcrl/1aJybrge08yRlwQrVJONpf0mAM8F5k8B5myYxAj+M2mAVnxOUHEugo94BDjRZV
	lmnwOx8uCoNAet4l5QAc5SAR8lw00CtFbCGarG8b10wv4DqxMMorzNwdpDTrxMdhBNmOmJjgy3A
	j4DFBqJ3XTQ2nOOQesjay7I926AI0C6fg5dzJBg7TSNQl8lly1XF9KB+8UvgevcRpIuJv4v5pw1
	ARajUBs08FIvfe1dfg==
X-Received: by 2002:a17:907:c008:b0:c40:f89f:d91d with SMTP id a640c23a62f3a-c419fafad52mr821208566b.28.1792502543695;
        Tue, 20 Oct 2026 06:22:23 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c466de84b94sm47543766b.65.2026.10.20.06.22.23
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:22:23 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso4993023a12.3
        for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 06:22:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxhOBoEp/MVWAK5PH5vaRGMo5w1DPTTGOtYGKXhiUOOxYcO2GreZ0eIo0taZHrjR/oM5yOfXcSRzlc=@vger.kernel.org
X-Received: by 2002:a05:6402:270d:b0:6b1:c7d9:b631 with SMTP id
 4fb4d7f45d1cf-6b3a8191a46mr7499369a12.23.1792502542847; Tue, 20 Oct 2026
 06:22:22 -0700 (PDT)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015-epaul-v7-3-rc1-x5h-vsp-fcp-v3-0-e052903a3832@ideasonboard.com>
 <20261015-epaul-v7-3-rc1-x5h-vsp-fcp-v3-15-e052903a3832@ideasonboard.com>
In-Reply-To: <20261015-epaul-v7-3-rc1-x5h-vsp-fcp-v3-15-e052903a3832@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Oct 2026 15:22:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUHcR8-9g+KZ4Ssj+mJKYBz1h6QSjWnaPL1BcQWC6v8RQ@mail.gmail.com>
X-Gm-Features: AclHuK_uZzRO_WalfaTseMvUVupoP686uPVQ89YYU5UfnQv3EiXJeP7RDzX6u2Q
Message-ID: <CAMuHMdUHcR8-9g+KZ4Ssj+mJKYBz1h6QSjWnaPL1BcQWC6v8RQ@mail.gmail.com>
Subject: Re: [PATCH DNI v3 15/15] media: rcar-fcp: Check device revision at
 probe time
To: Paul Elder <paul.elder+renesas@ideasonboard.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Thu, 15 Oct 2026 at 09:53, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Verify that the device revision register reports a valid value,
> otherwise reject the device.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>
> ---
> Changes since v2:
>
> - Add FCP type information
> - Reject devices with an unsupported version

Thanks for the update!

> --- a/drivers/media/platform/renesas/rcar-fcp.c
> +++ b/drivers/media/platform/renesas/rcar-fcp.c

> @@ -154,15 +204,67 @@ EXPORT_SYMBOL_GPL(rcar_fcp_soft_reset);
>   * Platform Driver
>   */
>
> +static int rcar_fcp_setup(struct rcar_fcp_device *fcp)
> +{
> +       static const char * const models[] = {
> +               [RCAR_FCPF] = "FCPF",
> +               [RCAR_FCPV] = "FCPV",
> +       };
> +       static struct {
> +               u32 version;
> +               const char *name;
> +       } versions[] = {
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_H3_ES1, "H3 ES1.x" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_M3W, "M3W" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_V3M, "V3M" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_H3, "H3" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_D3, "D3" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_M3N, "M3N" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_V3H, "V3H" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_E3, "E3" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_X5H_V1, "X5H v1.0" },
> +       };
> +
> +       unsigned int i;
> +       u32 version;
> +
> +       /* Check the device version register. */
> +       version = rcar_fcp_read(fcp, RCAR_FCP_REG_VCR);
> +
> +       for (i = 0; i < ARRAY_SIZE(versions); ++i) {
> +               if (versions[i].version == version)
> +                       break;
> +       }
> +
> +       if (i >= ARRAY_SIZE(versions)) {
> +               dev_err(fcp->dev, "Invalid FCP version 0x%08x\n", version);

You're missing a few variants:

    R-Car V4H: rcar-fcp fea10000.fcp: Invalid FCP version 0x0000010a
    R-Car V4M: rcar-fcp fea10000.fcp: Invalid FCP version 0x0000010b

> +               return -ENODEV;
> +       }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
