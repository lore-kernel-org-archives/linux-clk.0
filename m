Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF82436B05D
	for <linux-clk@vger.kernel.org>; Tue, 11 Nov 2025 16:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762877439; cv=none; b=Ixko32KLQfGZ/LGH3EjRcs4XhLCAEf9HwsBD+D41FQr1xy9qxG81isPmk2PzX40O2oUqhjeNgA1c8FRFK9MhWIHfTnGisjuiGugggIyaExV3En/Zale5MbyfdTykB9YMKv4J4W4kEGeT1YEuHQM1SezvcMRfUkxBvatHRu9ks48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762877439; c=relaxed/simple;
	bh=InVSf2VLeK6C3DaC3wVIKtW20lKJD3AjozSf8c1nhDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BL3WbQU6iJQLoqNmC5tfAkipQCV8XUDQgkkuS1M9vwZ0GQL2o/m4MJSRJ5X+VWIVThXjY9MHT3x2wZiA8x2G0UEd/GTiUWFmafusPuqpIfmm5tRKbq/QBMZhu5kkpo2JWDLpqxlQbiPSAgrOxkz1dmpPlR5jEEhTLv9UBQZinU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AVXzhqCf; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AVXzhqCf"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477632cc932so17841175e9.3
        for <linux-clk@vger.kernel.org>; Tue, 11 Nov 2025 08:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762877436; x=1763482236; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VoJADF8RVNix0LYicXeY00wntRyKPKYW1PP4cuBTQ0E=;
        b=AVXzhqCfOqy/ZlipVxTgK+ZR0HmCtzkMhaFuK8bD391teLceyujymIE6NoVAkk0Tf3
         ou9Nxd1PoZqaK9Wh3d6Z0MZPUkjSSsexheFWOPkaAqaEwLW4rhoej99nmzTmSSd9VpPt
         9YF9Ut2BqcmeOw7bOFCu1FQYzyaOu34CXFrf0xMnkyHKtrZZd7QJ170k0E5Garay84oa
         oXNxkd1jSJyF1NoZ/N82m97xeEc/VONDul6Hbg361Y5TzupQxO7c22AF6D2X3VHE6moG
         f5sPtZtDJr1iTDoBy/t6Sx81xt1XudMBmvypNhHDEZYztpoH5X5LfL0XgXoss4jgbOrx
         E47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762877436; x=1763482236;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VoJADF8RVNix0LYicXeY00wntRyKPKYW1PP4cuBTQ0E=;
        b=ldLjSdu0yenkUTJ01EEWqUuDJ1VW44TAsiVVALHKxv9c4Yt8Hk9Qd7/+RET8YhE8/5
         +vDRxEoJvmM+PeZ4uK26pGhvhZycvwWCwz6uoATCiJpOmHk/Xe70EfGft+l81/AZuw9J
         gH7s63/wZqbaTc77yhlWHDPu+Pf6jTxXwcfPLRlIvuB96HglXDSKDGrUBLXnD21z/Tqa
         FzkAb75fprlslLDiHAuqapb+6lhvPkXkKuprzb2eoDsPh/m2hrFpsQxZhuql1k5HkeSx
         Jo45f7MhnXBKHDurxeKjHgxRBKm3Zf027s/J8Gybu4ZWJ/6gKycaGilAMeJ00IkLCBBO
         Mwdg==
X-Gm-Message-State: AOJu0Yy0nyQ55FrhvdR+tHCwTETU4P8mB/Sth6DybNrJzNt8XxgZqgnS
	Ug2bM3vV+/1BogcyQY51g1yUWI7VL8IyQKZBtVk4iou4WRSwdNgyJUPfv4K9GvW2xnA=
X-Gm-Gg: ASbGnctqw8UpQ1wMalwhOIvIOqhclmICEzdC5ZvF1YPgmNWC00btvFvayfGZ7Isv9qR
	kNFi/vpaQR6dTf7z5i92Bufd5JTpZYJCV+tiFddSlrFx5iD80+5V+jLgDFuMGj7zkUE2XiRVZ5T
	UyW7p4a85fTphqQ9Th5Cuo5wc2SppwAocovjZehj/O/PMp5Gjfri7FmEBVNkJtplt1cZNxc6WYP
	I+UQUZgyqghgHAPmKpL+du5fZTV6Wcv/Fu0yZuS0+8Yb0giIyC9mrgUVtI5Z2B/AP1FG8D+8Rcp
	WR/vPEFTtonpp76ALfzogQqiPGgK4RN3V9E68ZnYySeGsH19idoSIKGy8kV3QFi4kQAvZPjn/ma
	0nQG+IN4e2zlaztymp93S8WOlpcDgfV1bf4y2qAvsnpNGsmK56pJzj3Q8qRKyU/7rXzrqkfH0ws
	Ll/6W1230=
X-Google-Smtp-Source: AGHT+IGf3h4aOkXPIFGmt6Elh6BLQ2gmD9PXDCWL3w2nhAYHGTWFyL3xlC5Ggf4g6An8feZ4EFRkWg==
X-Received: by 2002:a05:600c:1d1d:b0:477:561f:6fc8 with SMTP id 5b1f17b1804b1-47773236fb7mr110096475e9.5.1762877436034;
        Tue, 11 Nov 2025 08:10:36 -0800 (PST)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775cdcc528sm390576215e9.7.2025.11.11.08.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 08:10:35 -0800 (PST)
Date: Tue, 11 Nov 2025 18:10:33 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abelvesa@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v4 0/8] Add support for i.MX8ULP's SIM LPAV
Message-ID: <rqtqzjjn35pibh42holg7ld6pjkjdyf4taljycu3zw32cr6inr@b7xck2bicm7s>
References: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
 <176287713958.95002.12532568280694164920.b4-ty@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176287713958.95002.12532568280694164920.b4-ty@linaro.org>

On 25-11-11 18:05:39, Abel Vesa wrote:
> 
> On Tue, 04 Nov 2025 04:02:53 -0800, Laurentiu Mihalcea wrote:
> > The LPAV System Integration Module (SIM) is an IP found inside i.MX8ULP's
> > LPAV subsystem, which offers clock gating, reset line
> > assertion/de-assertion, and various other misc. options.
> > 
> > This series adds support for the IP by introducing a new clock HW provider
> > driver and by modifying i.MX8MP's AUDIOMIX block control reset driver to
> > allow it to be used for i.MX8ULP's SIM LPAV as well.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [2/8] dt-bindings: clock: document 8ULP's SIM LPAV
>       commit: 3b521bf8c51246466e2c337f1f2b60acfdfe82d6
> [3/8] clk: imx: add driver for imx8ulp's sim lpav
>       commit: fdc1dc7dd53b95805d3943ed36785c1ec812915e

I only applied the two ones above. None of the rest.

Sorry for the mess-up.

> 
> Best regards,
> -- 
> Abel Vesa <abel.vesa@linaro.org>
> 
