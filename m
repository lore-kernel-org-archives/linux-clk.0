Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233461;
	b=HxV9jIcmd9+tMkglrT0w97qjqYqZN63ZlzkYrGm4IBLethvcXdY8ed/nPwEn5SsCEamz
	 YVoMwQaj1LEbEqm/mdc6h3kfjOHS5CD0naIdoWBN6oar/ey9Jhht2+a+TbtQ6exG1Go4H
	 bkuyehSiAns/7VQB7daxMOWkcvs2jTeJJII/OQmGSNBBYF1Yxe38L/sAT/Z67CnK7njEc
	 +FF9K7Wzt19nFC2EHCUdQ/sTn0BjGwAyXMWFEn0S6w/fRXJWLDX/RnDm3MMTehOW9A1uy
	 7j/eyX6B41lDZs/lJNlYAORu7v2ROCz3K16ydrzgrCoirL4IKiR/1oBsexQZaKDmFGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233461;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Tz1cDpa5AepSCwsliEOBWV2ZbIXpdMUmAVTrHLbgBBk=;
	b=PLfi3iRbADAEQsFDy6g3DubWLbafe807iJmokOIkNe4kf82AXFW7CmUnEXLRKadI/P7x
	 Uj/GrNPjLtIFS3hDYsOdoPzUqfPRJd4IpOnkbBakbkrG8BkqYgkz5ADyQeOKlIu/7aPIA
	 /NL02dHykDvAnLwY7UxRwk+P+KQ7UJM5pM8E0ivcXVfUIbfaYj/4BimFDgOPXGbq75yiM
	 h33nG981HHwIQXaDYFt2T3NkGuqG8AIEtpqaSliMevjvu6OFq/haCUQI1TYe06bRh+e1W
	 yz6sj+bcgexigIV9buH+roiP8C2boLgjo0Rxy9i2t7BzYuex9z+rhtwjPSURUhbhytg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA53606A33C
	for <linux-clk@vger.kernel.org>; Mon,  9 Nov 2026 14:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCA53606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so1370538a12.2
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 06:11:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233459; x=1794838259;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Tz1cDpa5AepSCwsliEOBWV2ZbIXpdMUmAVTrHLbgBBk=;
        b=XfTfJq05oYBC904IVmOlhIXEypIGcYca+tFcPzmDLyijUQ2tLWWAvkMb5b7TuYkbTz
         kFBLhQsBlcApKvb5kvFqde+nUfnVDHlvRd6YzLKZdl7AGVjjcHKL/EYBoc+s+e/Mq6ZM
         gVOP6ZNsmMCBCTXZpzoaQNNd8vztvP/OoKVKqnDwngR15Cxzy46qBzJamIP4NJPcPXrv
         Fi7k+T9r4dn0zeInrji9xsVKe7FmNzrBIG57fowB9oes1kzVj4CWxmT0Gz8EWPDQb4u1
         3T9Fc1xan+97VJqTL4+/q8HdIvh+dAHcnjg6NP8KZdu4+7w9FSlV5NJaof4jg24TIPkp
         m6kA==
X-Forwarded-Encrypted: i=1; AL+hErFCRBPkitp6zfRf3VUYV7vsup02qqWD6tFPmYLwAnxRZLLeGEedC+6SweYoihFg8Jsx3aJ9QAW1gVo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gY70JoNl6S5mbc/PTCqGvxQub6J0v3ohpQCML35RtOmABvoyV
	5dPBtlKkLO46ESJKincjbRTH6G8aYf7ASUoLoFWPcJ7/D7/W0BE+Kuuxu/PObOiNxgc=
X-Gm-Gg: AYBFou0gzvDSfVPG3bMIipVK/WUXSS175GWgsl2dsa+vDqSShbITlHJuTp5mahP8DsX
	ocik4/Jr9yIYvaXu005luk50gYKcQREOVFNSRdNeqjOJ8/yf0hXTy6af4SVDxblrBqueIr7TVi+
	MGJUutQed+PdbXAT7QNyZq6iH4ciZEvs1qF0yhLEzdhuTYcHoF5nQRHyhUcEN0IuCfQJ1ZJdFRh
	Y4Wv9f2nfipn5tGgvs2GOTPK0E1vOngXYeHkHbeosQ4lvrHPxtI9ZJ5KXn0KD8XndyAY+4Pue9Z
	+6FQfT45UIt14famKzSudhseevcVkvyo4q3cw9OmYFIC/tAApeNhHGxoNXjeUVImAB5wlN2Xjrh
	ng6HcpbiEb0TNvKsyigK2H2a/FoDwWvunSJ+lf37xf8B20NN2IR36dTHEH3rnL7lpTq7FcI+Ix0
	+H1XVwWF2vqxYyVb+hqDgzPfdxt+bbbn9342RqVha3/VjNvIkGxBlPquNxvveY+XtaMZc9iBXzk
	Zg16/NK3q6lm1Xz4tf+JMD4EiOCzzrYUxl7I1fgwHfFvfx4jvRt48Cn5eLbzgkIAT99ivbP0BWh
	zOcjtc1sB17N5EN71Xolk62FOHM2iFa0waRC++Rv6BmtHmWsbATyN3Qo3q/nfSwbaw==
X-Received: by 2002:a05:6402:1f12:b0:6b4:203:a1a1 with SMTP id 4fb4d7f45d1cf-6b72245ba00mr2718811a12.25.1794233459069;
        Mon, 09 Nov 2026 06:10:59 -0800 (PST)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b75094be40sm155174a12.15.2026.11.09.06.10.54
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:10:55 -0800 (PST)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b65d69f5c2so1227836a12.3
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 06:10:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHIdqxcO5973zBOfJKvB4R9oe4iYLDsNGDsfe9yFWX7sgt+NB7IMjSDLuLGC3hrcNqFxu6Q+pQd0Uc=@vger.kernel.org
X-Received: by 2002:a05:6402:51d0:b0:6af:9a96:5324 with SMTP id
 4fb4d7f45d1cf-6b722473406mr2715103a12.33.1794233454340; Mon, 09 Nov 2026
 06:10:54 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-0-1b2072e8c37e@ideasonboard.com>
 <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-13-1b2072e8c37e@ideasonboard.com>
In-Reply-To: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-13-1b2072e8c37e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Nov 2026 15:10:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVh2RiRhBHmuYupK5H81njgaqNCuFWVUiHjTN17+8a+dQ@mail.gmail.com>
X-Gm-Features: AclHuK_UOMGJNMSt7XpVPImhuSlb374iqFlByrKa5-w4LBZZoP4MvZOgp7Ag9nE
Message-ID: <CAMuHMdVh2RiRhBHmuYupK5H81njgaqNCuFWVUiHjTN17+8a+dQ@mail.gmail.com>
Subject: Re: [PATCH DNI v4 13/13] media: rcar-fcp: Check device revision at
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

On Mon, 9 Nov 2026 at 14:36, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Verify that the device revision register reports a valid value,
> otherwise reject the device.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>

Thanks for the update!

> ---
> Changes since v2:

You missed the changes since v3...

> --- a/drivers/media/platform/renesas/rcar-fcp.c
> +++ b/drivers/media/platform/renesas/rcar-fcp.c
> @@ -14,28 +14,80 @@

>
> -#define RCAR_FCP_REG_RST               0x0010
> -#define RCAR_FCP_REG_RST_SOFTRST       BIT(0)
> -#define RCAR_FCP_REG_STA               0x0018
> -#define RCAR_FCP_REG_STA_ACT           BIT(0)
> +#define RCAR_FCP_REG_VCR                       0x0000
> +#define RCAR_FCP_REG_VCR_CATEGORY              (1 << 8)
> +#define RCAR_FCP_REG_VCR_REVISION_H3_ES1       (1 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_M3W          (2 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_V3M          (3 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_H3           (4 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_D3           (5 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_M3N          (6 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_V3H          (7 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_E3           (8 << 0)

For R-Car V3U, the revision number is 9 (according to the documentation,
I haven't boot-verified this), which is missing.

> +#define RCAR_FCP_REG_VCR_REVISION_V4H          (10 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_V4M          (11 << 0)
> +#define RCAR_FCP_REG_VCR_REVISION_X5H_V1       (12 << 0)

"git grep -l renesas,fcp -- arch/arm64/boot/dts/renesas/*dtsi"
shows a few more SoCs having FCP blocks.

Interestingly, the documentation for all of the recent RZ parts (G2UL,
G2L, V2L, G3L, G3E, V2N, V2H, T2H, N2H) claims they use 9, just like
R-Car V3U.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
