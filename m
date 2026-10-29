Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793268918;
	b=4EdOBjqSvY/cMos13w03W+UVn7+EhAJ8llmq2K3qJNu+smm2z+NhFnE9Ij/jkZMCfAoD
	 8mQWzR8eZTRhzep18EC8lfYnsk3ebxMJI3r/QtQH8BTMrO1tnKjGq26ueZT71LM44miZA
	 JCfYH2sFCGrUymO4V8P2b/qcdAqXS60tWVt+fNg7mPoFef+HRVYLYu00smOSfXi24hGHs
	 3MOWPdY1X4Qn5W77inNE5/KD/I6U+Xfi619Fy1qiPa6EMmwNkKLyvF2UjU1049Oep0XN9
	 +3AkqOIoot+84Q78XUNb//4hAiXlHPwh/BfHjqD6KeJNXBHxi4QFeKK7wr22nV6ek8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hZhJRYKRYnpA55dTVl2RVAnPezaQl7o2LFp27rGTjlc=;
	b=mAPC7hNEQEBDV/ZI98n0B1Tvb4bNu5XIDk3lRTwtJBwk/jMJUbXdZm2TW8JJY5KRPLhI
	 vE8TZ8RmZuXuduWvGy6OtkzFRI2VWlK5mloIjXMFJoeOU5+/clh3p5dD2amwwZMUUx9Ea
	 F4Td8M1ydiflaguIa7yrzeQeRn4D/lV1ZI6qWcTcwtSQrotiUx7Cf5Umz1M270hDxW39Q
	 hVLoLZxB+jyCFPS4IHTkId5QOPGNB11jrwQDRohchWQKHYjS6IH72s2bU1mLzxqYFr1+z
	 pjnUx6G6acSbvIJ3PXkSux7i0UQe3EArD5qWTeoUKy91VqSjkPgB+yvBwkSDvrBMIjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYaDw9Qa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DCF606A32C
	for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 10:15:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8DCF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYaDw9Qa
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so2980254eec.1
        for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 03:15:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793268917; cv=none;
        d=google.com; s=arc-20260327;
        b=LQZ40ruoPAlpSef4Onbqf2MmNzNE6eL2rV8EEThXnjiTT2CbDMm2qUB0VSUHATCB93
         nIU784ypF46did6AD+gYX7HjRJLc3HNd6+quYOqzQuuRs2VGdnDRJffTH/Mm21v3iSye
         S7FdHv2oueagtDBfehASiRkVIltMdlhaj3I91qEIryoJMhcxKXayUVWSVdxiKxwJu4Ec
         nlFSiELax0LGIgK8miFfnAfM+ul55LR4NS7IpX6z52jIhIIqmtARAyfX4+CTPMDVdIsM
         cQmvnEwHAc5WhcRh3Oz+7jIN7LA8EH3v14A15F+IOMukCNmjDZ7/vBikK8WrlxyZWv/M
         xXTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hZhJRYKRYnpA55dTVl2RVAnPezaQl7o2LFp27rGTjlc=;
        fh=a5Ic7tlVHJ4HqNuXlfni5Kwlb8pEWFuoHkFAN74aJSM=;
        b=g9z+MTSTJHE5EXzhfhCYwXTw3uEeBdK+uwnxV6JP/Lr5i+3Fd0zi7YcwAtKRRKAVJF
         ZhTRiaDYgoUpJNktfVnN9R32H9vXh3993dOflcLL7UWtP8XYmk7ApVvaAUkcot4+ebPP
         qcyUKAPuL2TXdIN8cy4QRKzlf7HO+3EQ3J0MCZ3+6Mqd61O41+4Oj3rfuiaqEMKGDjyz
         Bim461QTWuHHHX3uPGIM6AJmElJ2qdFrj+X/H0G6WPuhB8cewiH5s0v/hlyjayHA77GH
         +tDX81HPCA0+aLqoGgCLxk/CsflesiB0IWIEHBoHV2ycox9xVtWLuqDqZtu3uYE8ChU9
         NjUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793268917; x=1793873717; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hZhJRYKRYnpA55dTVl2RVAnPezaQl7o2LFp27rGTjlc=;
        b=yYaDw9QaXvy/ey4C72CgmAyNvMVNhiCEbTAs49OXnei/ZdR9HQ4ujPrhIh3QcHQSf7
         NDNxbOTB3YbR4C5RZkRF1VYNQP/S9u9CTY/EcbOtaFoOwTlwhStsSoAYDGToa1nmQtNO
         YzwjyQR+93YuejSkGmUY0kn2j9hcgkPiDJwI1AyQp59CWfrSnG03qEcX6cdeyJsEzFsw
         kCBMMLbhIyYKc0Cd6jkfxWdtQZ0o8y/ZdFG7wS24RfvUZMiGg+y1laVgz5IwvjdD1ZxB
         vlAGCgNtoUkDkkfWdDnkBwwJ8+30su/Nh5RoEMMkpkUI5HlQCyjPh5KDG/1XUj1VvTak
         iP9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268917; x=1793873717;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hZhJRYKRYnpA55dTVl2RVAnPezaQl7o2LFp27rGTjlc=;
        b=nko1vgoN+NLmSuggBUJ958QxepG2ht4KCBcl+Oo1aio0YzW8PH/mcsZr/eqa0bQEYU
         y5Gdn+heatTWGOXsWz7UK+v9AvLoTe00+dtXe8Jh1ouQTEH3w7bdCTSf88N7p7l/K4dz
         9x52cn2VoWdbXKtTJjUdizZGi0wOk7MUpa5mHMIuzxHLTYbuUp4nMO34OylXRUqtCR9u
         gMwzvhohsF5IVULsAARKNKhVn5kcd2BUz3W0oasSG9RWQ3LxjaONAhtQo6AnZSaomWzH
         KkNfL5gca6ByZzaUbdReMHEHZ8lseULQrWr3WIPZkFFixvzRuL8QB8DpaR6uOkI5W/Jw
         JH9w==
X-Forwarded-Encrypted: i=1; AKwUvBzhUyGwznHcl3Dl9mTqxfPWDmNrx9kpU/FxECzWUo6nD5pngVAA+vXiPZav47g4R7k7uYL4au1J03s=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1Qq+KtYTNwtzVYvDecUARFvVlcySyfcfyb4m0yqhpvlagkpZQ
	pCZaOw2KQK1kIp1O7k9hlvTNbBK34ubgewyq7q7rBeip7UVNZV7oGYjpDkjZ1YtYCk38IBRMt7x
	CAFGdIsSXnVQWUF+TrNZhDObHTRSy2hE=
X-Gm-Gg: AYBFou1hQSKHftCbZOw6Q/K0NPnB+Qqzh83zceJ6o2dOtb9JUEnZ3wyq8no2Bt6/Ogi
	1Qhe0YRpDOcu9yFRq8T6vDF7WgTEjMLR9ATRc4UwbFyswt02ZTkM9etGNzzOyYK3PqppKWTiJnQ
	aCTkfjRWDa8tSjMahznWIW27BeqH1kYh7Ln2rL4RAH3Uk400z+2wVj3Zp+qov9ZCwkoiYbh4FK1
	uM47MW/eCkomuFf7llcgk5FweJJcjyaeWuzE4aBZXZ9ZR69pgxVFZI+GZJn0d585jTuEozQyIFC
	40BcnND4x8F/dcpRab1EEIP9gBzSbrRroNiLGt70EkTcy6MdJhPlAies9SldpM1HQMw8b+8BX6J
	hilZnUHlOA7g7wTNDPEu0fOKvS+4wSpUazyMSxSI3nFcCu1yGvdfCoArcqq0DUBfMvNrUrclRRN
	OrqlEtEORlgriUsJw=
X-Received: by 2002:a05:693c:69c9:b0:36a:279:c93f with SMTP id
 5a478bee46e88-36a203e2a52mr6817742eec.33.1793268916731; Thu, 29 Oct 2026
 03:15:16 -0700 (PDT)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-upstream-speedo-t114-v1-0-81457cc9d94c@tsv-stahl-riesa.de>
 <20261029-upstream-speedo-t114-v1-3-81457cc9d94c@tsv-stahl-riesa.de>
In-Reply-To: <20261029-upstream-speedo-t114-v1-3-81457cc9d94c@tsv-stahl-riesa.de>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 29 Oct 2026 12:15:04 +0200
X-Gm-Features: AclHuK_nKjJOvqTdHrlTm0y6eXLR-uFJwQRZTvfrnf6NnzkRQXlz5soPbSPOmYM
Message-ID: <CAPVz0n13YHVAGNoEYZaef7HL1HkQK9w+mLUV-h4AGC0mr3bkpQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: tegra: dfll: Get the voltage step of range-based regulators
To: admin@tsv-stahl-riesa.de
Cc: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 29 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 11:3=
3 Patrick Fischer via B4 Relay
<devnull+admin.tsv-stahl-riesa.de@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Patrick Fischer <admin@tsv-stahl-riesa.de>
>
> get_alignment_from_regulator() takes the voltage step from
> regulator_get_linear_step(), which returns desc->uV_step. Regulators
> described by linear ranges, such as the SMPS of the TI Palmas PMIC,
> leave uV_step at 0.
>
> With a step of 0, round_cvb_voltage() returns 0 for every OPP, which is
> then clamped to min_millivolts, so all CPU OPPs get the same voltage.
> The I2C LUT is broken as well: find_vdd_map_entry_exact() and
> find_vdd_map_entry_min() divide by the step, and on ARMv7 with hardware
> division the result is 0, so selector 0 matches every voltage. The LUT
> ends up with a single entry and the DFLL never changes vdd_cpu.
>
> This affects boards that run the DFLL in I2C mode with a Palmas SMPS as
> vdd_cpu. In mainline these are the Xiaomi Mi Pad (Tegra124, since v6.19)
> and the Asus Transformer Pad TF701T (Tegra114, DFLL enabled for v7.4).
> The AS3722 and MAX77621 used by the other DFLL boards report a linear
> step, and the PWM mode does not use the regulator.
>
> On a Tegra Note 7 (Tegra114, TPS65913) all 16 CPU OPPs are at 1000 mV
> and vdd_cpu stays at the 1.10 V left by the bootloader. The CPU runs at
> about 1.34 GHz whatever cpufreq requests. With this patch the OPPs range
> from 1000 mV to 1270 mV, the LUT holds the 1000 mV to 1270 mV selectors
> and the DFLL follows cpufreq up to 1708.5 MHz.
>
> If the regulator reports no linear step, use the smallest step between
> the voltages that are usable on the board. Fail the probe if there is
> none instead of running with a step of 0.
>
> Fixes: b3cf8d069505 ("clk: tegra: dfll: CVB calculation alignment with th=
e regulator")
> Cc: stable@vger.kernel.org
> Signed-off-by: Patrick Fischer <admin@tsv-stahl-riesa.de>
> ---
>  drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 26 ++++++++++++++++++++++++=
++
>  1 file changed, 26 insertions(+)
>
> diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/teg=
ra/clk-tegra124-dfll-fcpu.c
> index 457a77c5bb62..5bdea4775076 100644
> --- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
> +++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
> @@ -642,6 +642,7 @@ static int get_alignment_from_regulator(struct device=
 *dev,
>                                          struct rail_alignment *align)
>  {
>         struct regulator *reg =3D regulator_get(dev, "vdd-cpu");
> +       int i, n_voltages, uv, prev_uv =3D 0;
>
>         if (IS_ERR(reg))
>                 return PTR_ERR(reg);
> @@ -649,8 +650,33 @@ static int get_alignment_from_regulator(struct devic=
e *dev,
>         align->offset_uv =3D regulator_list_voltage(reg, 0);
>         align->step_uv =3D regulator_get_linear_step(reg);
>
> +       /*
> +        * Regulators described by linear ranges (e.g. the Palmas SMPS) d=
on't
> +        * report a linear step. Use the smallest step between the voltag=
es
> +        * that are usable on this board instead.
> +        */
> +       if (!align->step_uv) {
> +               n_voltages =3D regulator_count_voltages(reg);
> +               for (i =3D 0; i < n_voltages; i++) {
> +                       uv =3D regulator_list_voltage(reg, i);
> +                       if (uv <=3D 0)
> +                               continue;
> +
> +                       if (prev_uv && uv > prev_uv &&
> +                           (!align->step_uv || uv - prev_uv < align->ste=
p_uv))
> +                               align->step_uv =3D uv - prev_uv;
> +
> +                       prev_uv =3D uv;
> +               }
> +       }
> +
>         regulator_put(reg);
>
> +       if (!align->step_uv) {
> +               dev_err(dev, "failed to get vdd-cpu voltage step\n");
> +               return -EINVAL;
> +       }
> +
>         return 0;
>  }
>
>
> --
> 2.56.0
>

I can confirm capping CPU opps at 1000mV and this patch fixes this. I
have tested on Tegra Note 7, ASUS Transformer Pad TF701T and Xiaomi Mi
Pad which are all affected.

Tested-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com>
