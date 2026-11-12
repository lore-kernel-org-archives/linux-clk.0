Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495812;
	b=JMIKl6Qfj7+ep1ut+jfSbjhh2XFLw1E9yGHfMlBCJ1M/aNlV53EBsXTaX6SUVId5AuN6
	 hW4vLMnO0+8EZEchldo9VQtcmuuOr1wWIhHEFwk4TLKy5zgjk/kcabYuvtc3ZsBMIQkTl
	 zjE8j9Bu2pNIshpTiSFRzW3jRVvWEv+FWPFDSSWDnFzP4U7fGZZbIvlHqtr1GJZ6Ut3h4
	 MyqL3uz6Rgw7KiVBfqZLZhK0n+8BhMqPlBossbddKYFKmscqwn6c5j9M73TEnWA3mRFKt
	 TgEUx4FxxUgTyx5gxJ/sdjO2x1WVxP6kbManw7glTOIH4jExfbwSYsz1x2wsQqb6MUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495812;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=mS1ut25pAkhX06KpI5+b6SzLMFwF8RaPMcofkkPb8+I=;
	b=lPwYKQvlPo/ciGrLKo0Agr88x0jNZzembjOJAgX8ENzRw7XBDa2Rp8rHobIsW+8aRbj4
	 A/QFK/CJw5nfG8CZ9tAU6ArnYPzvvfTuhud02WQOYTEHkBSDHFhxXC5tqpZ4sJHSWFuSF
	 CjbYz4qAOtfoYWb7QklufghtrGtuL/BXsYeDy2y1pa9wUBvP1oDz1OhanDvEjPz400Dew
	 qKfCL4jiyGFmLiRSchdrqYT5SjIXbtfZUhzmNgMS/ER0NynZk2zFRyL3Ni/QxCmmGKpKD
	 EKKrFPRBiz/SFnb+2vsNY8jpbubrVam3At5a6QvPFOPy4CmRXdomp8fvlWfyrgI8v4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23124606A323
	for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 15:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23124606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b3541bb1a2so26752217b3.1
        for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 07:03:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794495811; x=1795100611;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mS1ut25pAkhX06KpI5+b6SzLMFwF8RaPMcofkkPb8+I=;
        b=QCI4gIfoMpy4RwARW/na5Vmu8e2/2KnZ6+niDzQgv9AVEextkzK6CmewCXuwGrTH3M
         QKX58oT3oQ3x7aKYxQrEdJa3YnyykbR8c0w3gM2AnsyxnRdcFcf8dYRD9iQnadHHfT15
         oZyCW7QuIHuO4FoZeFo9AtmGBs6QpJ+KZX1xzFKEoFcQLMHE6P+q1c+TMRQfTh+5v2a4
         I7pRly6ihx8x5HQqlFjpPNgYe5fR5BQGO801uEMiQ2vG9KIYFVFXHIXKMw1w4IKVwHpq
         MuckKFnJ+ceZqtyy0Q8jEi+W9K8yYajyNwNyt5+SlMuEFtigU81dlJJylvVFYQet9v70
         UfVw==
X-Forwarded-Encrypted: i=1; AL+hErEe7iXet8/vKV6Jo+qR3f0zQVEri9+TdtwW1giKpz2YkopMPgHApi74QMJVxit/BjT3/aAo39Xm7Nw=@vger.kernel.org
X-Gm-Message-State: APuU4Z90kxGnmoanKkxPBbGoVpDU9Wu5nhxFc1KM9/gkcKCd3hHfpv65
	t27O+HAEQsfHAgDWeJbaw2YtlYQrZSDs39Ud4xRr2oDxFf8i6DUD2N/ddi8bQtcTVOE=
X-Gm-Gg: AYBFou1p3Z5lpGrSHt+k9VncREwWJAlL+fN/BQ/GUO6FzlI4Ay7rRLsS1WnoEUoJR8s
	LErRvZBhqe3beS1+EzL/F0SgVTlSgHQ0x8BivXTbrCXomWaVRPfZbv6cC6wM1lZWLmxUGOJ7kdm
	38MdrZKa3s6RMPyDMz3BQ37g+mVyfYox1cZQZvXtdwwPWiiLuz/Mmfq+Z0mDMpPUV1KdGtgFQHG
	lN4CMcJ6VN1Wm2i2Q2G8nQHM0rBeppMNaW/j96uNSOXRZcVrsQ2AF8GOHNYVDHUuVnX7gNiC9Xj
	70/1XSHj2CG9CtdXhxjwv+uaLb6AbjxYxuRAFGyjGGmqgJEVKb4Ha3+CB4PwADXeeiuZZ6pSU3g
	miUwCbS8JZK1d85LfSlWbI7vhPhZWamNQHi9FrJAndpRXckdiDLDY7fVcFs4lBm1w2Dgy/tGYrB
	+lXGKL9p9q4dB9XH5HhSCgXkqDJPvG5ZpDgzOETfX9gmf4r+D5KpGvFvcS+s4gO4v2cDvFJnke5
	vKKBdpl7B9XaYB6NHafBNUeCmJsUBXyT4lWvZ2ymqw6fldMJo9rQcnnz/KlDrwYNLT1QM6JS7dC
	P4cSuCgO8WpvhFT7JfnrIwLRGalAJdEjB5f3IsQdJdlfe0nBiBy1A321/RI6SE2itLE=
X-Received: by 2002:a05:690c:7482:b0:8b3:b06d:68de with SMTP id 00721157ae682-8b3b06dbad2mr29362067b3.106.1794495811121;
        Thu, 12 Nov 2026 07:03:31 -0800 (PST)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com. [209.85.219.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e76b1c3sm745590285a.16.2026.11.12.07.03.29
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 07:03:29 -0800 (PST)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91e98301805so42910146d6.1
        for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 07:03:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFId8/yLPFBxOy9eEwZB8WGYeLOoQgwPSCl/V/sNfVps1U2p6gvbwHiaSsvPetKbXH4qWQa0jsRJ+g=@vger.kernel.org
X-Received: by 2002:a05:6102:f10:b0:7c3:9982:67d7 with SMTP id
 ada2fe7eead31-7d50609c9damr2546296137.16.1794495444511; Thu, 12 Nov 2026
 06:57:24 -0800 (PST)
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
 <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-5-1b2072e8c37e@ideasonboard.com>
In-Reply-To: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-5-1b2072e8c37e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 15:57:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUUvhf=zEmd2tfodo7zf1hh9n8m88Okk7KZpq0n=mDR2A@mail.gmail.com>
X-Gm-Features: AclHuK_otbzgK2u3WYfd1DmRW9SD98NHgBcVxYwHNEPtms-IkWdgisCPqESp0Ec
Message-ID: <CAMuHMdUUvhf=zEmd2tfodo7zf1hh9n8m88Okk7KZpq0n=mDR2A@mail.gmail.com>
Subject: Re: [PATCH v4 05/13] arm64: renesas: r8a78000: Add FCPVD and VSPD nodes
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

On Mon, 9 Nov 2026 at 14:35, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> Add DT nodes for the FCPVD and VSPD IP cores in the R-Car X5H SoC.
>
> Use the SGD1 clock as it is likely to be the clock used for data flow.
>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> @@ -1574,6 +1574,196 @@ mdlc_aon: system-controller@c1338000 {
>                         bootph-all;
>                 };
>
> +               fcpvd0: fcp@c5010000 {

Please preserve sort order:
  1. Sort by unit address,
  2. Keep similar nodes together.

[...]

> +               fcpvd9: fcp@c5019000 {

> +               vspd0: vsp@c4800000 {

Do you want to sort the VSPs within the VSP group by unit address,
or by label?

By unit address:

    "vspd0: vsp@c4800000"
    "vspb0: vsp@c50c0000"

Note that adding the vspd* in a later patch than the vspb*
means the latter need to be moved in front of the fcp* :-(

By label:

    "vspb0: vsp@c50c0000"
    "vspd0: vsp@c4800000"

> +               vspd1: vsp@c4808000 {

> +               vspd2: vsp@c4810000 {

> +               vspd3: vsp@c4818000 {

> +               vspd4: vsp@c4820000 {

> +               vspdb0: vsp@c4828000 {

> +               vspdb1: vsp@c4830000 {

> +               vspdb2: vsp@c4838000 {

> +               vspdb3: vsp@c4840000 {

> +               vspdb4: vsp@c4848000 {

>                 fcpvi0: fcp@c5030000 {

Shouldn't we keep al FCP nodes together?
Same for the VSP nodes.

>                         compatible = "renesas,fcpv";
>                         reg = <0 0xc5030000 0 0x1000>;

For the contents of the nodes (except for the renesas,fcp properties,
as I couldn't find the VSP<->FCP links in the documentation):
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
