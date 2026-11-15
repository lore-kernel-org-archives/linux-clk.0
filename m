Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794757400;
	b=V+GcEhbLsvGoBUmVbph6uKzWiMpuOM1GwHVvDAB2tStlzDbQjWMttDu7TEay2MdbOtrd
	 7n+imrQ0FyHgQkRJyBma5X0Ar/HoWEomlYUcV7slGmYkCi9QP5CbPTkdTICriDhtQqc9i
	 heW7oLc+tyF0nuk7TG8L+PsRKOhd+h7a5L7GLGKuRbKWrGsvsfajSSFOf+ShYdJYJbAJB
	 pocddKKR922dhoRwLRi/ug9FVKPapt7pB+d7+pwuMFELEuTjYSe4fREmi8GdcHnszIg1R
	 rrNG4E6WMSAlnFONDpyoxGIyL8FzqPhXl8ooSDQdZ22pY06bpLRFw7bPs/1gbtP3QBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794757400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hziuiiMUYFT/Qu2Fwgb6Sb0cIY/xqbSxPRQl/HG5KA0=;
	b=4vR1MiBPNQo9r8lKHYAJIqkrjOU8Yp2fDov5pL98C8NmevoJP44OaJF2zEIr9fIxURHS
	 AtuHR1NAlIIVR/bw+faguSsBSH6wpbhxifexPL1BRmmHiVMdAMmuGbwtgH+oQ0ne/fNTR
	 sVuJHDPg/Di/svopZGvOixUwUGj9Nkqt3ewehcISV+zIdn7lCsPKyv1W6PoMdhbxre7lz
	 mkj14xLcrsLfZeTR8LBHAGa16QfBOKhEIrJkVUzHS1J34mNYlgl7GsQxGmWDLFecH+UQi
	 mi30h0FszJf0uP1PM4kyuDJ6Er8kH+Dn1rQTdQjE+Lk41g3U0v0CAn8o3D0G1nFCLPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HBYr2ghe;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86738606A882
	for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 15:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86738606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HBYr2ghe
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so5019285e9.3
        for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 07:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794757399; x=1795362199; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hziuiiMUYFT/Qu2Fwgb6Sb0cIY/xqbSxPRQl/HG5KA0=;
        b=HBYr2gheQUl7c26Y3yfqksOaTOYrIFYUyEUzlZUZhWSZy+HAESqRcXZrP+TZZhM8z9
         75y4g55klpFlA/Qulr9Yg7kYDWq1+w93Piu62izk5f8edZNdPTqmw53yQIcVZJ8POpjR
         FCFDGpFCG+XXUQSOtyP6WZHieYuBpqKKanKZ3wnDH3I4OGAaLXxf7XH2XvGb65akJdzr
         QUEsYnB0UF1WTP5FCzRnWQED5TK5P0HAm0HJ7Hpeq/wgtIM84HN+PLhoAeYrZah9RjSs
         zqZK2w+ADZMGUpKyIfEL5w7Zfqyz1Z40uP2rSoJOgyF58OsUuKjbbaFJV/9eOLQrvgqB
         Q1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794757399; x=1795362199;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hziuiiMUYFT/Qu2Fwgb6Sb0cIY/xqbSxPRQl/HG5KA0=;
        b=zHB7tXw+4f4hgCb+LG7VhA3ufUyztu2inQRdyru/OxPumyotGQjsff3JTNWO9Y9mNt
         Ok7fTby4x8yOs5mkFcCb/PWDi/3/3hStJh2mp4RdL8q/9xFjEtzTuBa2NiYIWeZ9GACN
         gW0k1dBcj+OoDUZcv4fZ8VcgfZkw5gugNraVLN9fylJrgKr7CJ2/0DRcSErK5ryq+LsM
         WkKu4wdLcEIMlcuM7aug6hmHjn5S5+LEsicllu3KhKAyvIchDx+GcEpGNcSSJPH3/45D
         23tRMfWH8opXYi5xyekNz+z6eNokzdqGYgVo+XwCwHlRmZChJT1jyvPM1Ufo2oB6AF4E
         IwlA==
X-Forwarded-Encrypted: i=1; AL+hErE29zZ3JDjjlp2vvuOsEP016qqNVfscubDM3FlRj+nEAo+10ZVF7qbuCVVzH3HijCHc1H3csq4elvo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SLXhpnSaKBL2QX33b/KE2p6e2TjeND4pfIUe0IyCG+UvTTR/1
	og/GZCtoAq0khxKZvat5fYu5NGic2iNBULTBQpLLVqAxcPVQNPbdAhDgL0MiryxIRYQ=
X-Gm-Gg: AYBFou0goaZjACttgN5Hl3dfy99FEigaluEeSOcPGsqS4hG4CCjjfLbbx6n6LlUA9X1
	WxiOb2Bs9jpV1mzqA+ViGBishoVS86if1doFtjhruIqm+el8yt8zGer0zjH36Mi4IT/vPfmwCwu
	gQCGUlTEhIhM7CLfRt9WtWIpAY+AFq8UWO99ozz9042b/JebNyod/sqlnKDv3KEez1ruSH4rled
	3VSOw84vQ0JhuwspaQLg14zptX/W1AuBpGjx4eyHapGlzZAlzuv7CrebifjAVmvehRkTiI7K9pa
	TKKQUE3MCSrIdBcOPElVLcCq+LNhOsSG9kgWmbhXewtqHYJknYzeU+2FJAA35pp0TfY9T3v+JPd
	OkqxduYDw9rqVWiY+GS1YoPlx1TFqJgCW8sutJXX1SeEQy619P7TQDIRsZ5fFZml2ITtRakKTr+
	NGcxWzNETrdb/XyKdJD9Vx6DqDOFhMbe6uJWBS0T3thasT8PyxNNUKYtPegZGRj2RXEPJfHRlIa
	D8xkvg4Vw8PvqAHy013s5dSDrGU2IkXlzZ8U88xl1ebk9rqdxSpI70D7UAfrFrTWqFZu7xYDgnB
	2erL4FljzlufhfjJ6C1tOhXIXDIsBMxXN0kstWAFrP/5G58HBohJOLXA
X-Received: by 2002:a05:600c:608c:b0:4bb:680f:9a3 with SMTP id 5b1f17b1804b1-4bb680f0a64mr77590835e9.2.1794757398894;
        Sun, 15 Nov 2026 07:43:18 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb68c00b10sm52646085e9.0.2026.11.15.07.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 07:43:17 -0800 (PST)
Date: Sun, 15 Nov 2026 16:43:16 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: gaohan@iscas.ac.cn
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
	Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 15/19] pinctrl: sunxi: add support for the Allwinner V861
 R-PIO
Message-ID: <avnSl53KHJWGrBcE@monoceros>
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
 <20261114-v861-v1-15-eb71ec3ee523@iscas.ac.cn>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nd4yu7xpyaelhc7q"
Content-Disposition: inline
In-Reply-To: <20261114-v861-v1-15-eb71ec3ee523@iscas.ac.cn>


--nd4yu7xpyaelhc7q
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 15/19] pinctrl: sunxi: add support for the Allwinner V861
 R-PIO
MIME-Version: 1.0

Same feedback as for patch #14: Don't include <linux/mod_devicetable.h>
and please fix the spacing in the of_device_id array.

Best regards
Uwe

--nd4yu7xpyaelhc7q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr50xEACgkQj4D7WH0S
/k7FQQf9GMWHvRPfVzE3vnOHAT8nN1+INki1D4kL4uwlHr3JU4yutcwFkaHKLsQU
b4DbnyStL4d7i466zTUN7GaSuTfs5LByLE0hKNibeGI5Wa+bHdhPXZw6poTITVON
f2BwjcuK+Zq5YQKqimrjo/4tbchvvRaJ2tX4FrpWxIYNSEVPVDu3Ku1FTeQTjQiW
q3iSJsE9FH4VZAUg2tViVg4jIzTIj6ncm2+HvaOFr/vv8gwncEBYp0IlMVPyqH3A
a+UAaIoEVNFvPPDDjTGrnHlPAjkkKoP4p3OAxBnC1l6qyEx0qCChV2gqtkPof0ba
XuoM97TKUIIJOGjYertizBLa8GJ32A==
=5u67
-----END PGP SIGNATURE-----

--nd4yu7xpyaelhc7q--
