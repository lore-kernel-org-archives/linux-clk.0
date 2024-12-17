Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E661F3D30
	for <linux-clk@vger.kernel.org>; Tue, 17 Dec 2024 13:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734440451; cv=none; b=mpqjcjSuSPHmgu2OpCzyz0GYnvXellhhydTm1Vr2tumTzaqJAcZxBxKZaO72wuysXWs75KUd7kgGTR+318rmoLfYT3SDwjOBACuGSWjcksZrk6qpXsSxSBGzIcrWn8yNukd3gBf8jwrAtc9uHoNtHIx/cmK7sBezqxYky78MFYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734440451; c=relaxed/simple;
	bh=GQIWeq5N/1+/+kDvpSpnt8IVUMXNOzsNCXvdUhT2KmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sNSNH5YcffA+R7BBpiIhG9K5xjurdVgVlch+RBtDeiAto+9R1xaSw4p989u2TYo1Fps2j2OEMSZO4ip+jPD8iZlnlQhdvXvQ7nevicWWKx98eoqLcVJkFpsiV6rzX8ds/dVar0bZIpTImcdS3VYlU01snIGcTQtCrscKAAQApZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oDshkeoo; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oDshkeoo"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53f757134cdso5943137e87.2
        for <linux-clk@vger.kernel.org>; Tue, 17 Dec 2024 05:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734440446; x=1735045246; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQIWeq5N/1+/+kDvpSpnt8IVUMXNOzsNCXvdUhT2KmU=;
        b=oDshkeoomomkIWzWQtd40b2V5rwgwFkhB7Eu7YBZGDvIYVgrDvlPqAjvxUdLBWF9uu
         2eSFlFRSUmS3lgz62kRmWj+Fway0aioruT2H4RepwD0PYuC+KOO67uBEYJ1b420tKwyX
         SzPj/DWyPya0fN1WIQP7kluPUlE/7mpclvMFDagnOQp+RTL9iepc57XYBCISnMeDeRlJ
         ey5hJ4amtgEWvmvw8ebabxfDkQdp5xB3O+4ZeLIVHkDbNDlE/2HNVsS1StdG73epPkrX
         zwawVFoq/IDIcv+gE8TCRFc31FGfhttkRGDvdPHSItlFlhNPBYqBZoG6gpgOl2sb9ZEz
         Yovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734440446; x=1735045246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GQIWeq5N/1+/+kDvpSpnt8IVUMXNOzsNCXvdUhT2KmU=;
        b=esfrfN1eYhObVknwapdw9hoczJELVnzdS/I+uS1gOfaHvnuV+ghZlnmQl94XoJtlbS
         mFXxWd02PkcoAH0g+I0xS7dsvHTm4oassKPC/3r2MrKAEVsj1YQQBgZzhvpXuqqU/ekZ
         CTroJDbffL6I4ZMFhoJu4MnHEvzJ1JT0j5yP/DvPiiAqXtRd/AY8wS57G0YY1G8cdrVs
         vrtH3URRJVSOb3WVhdl7aglrlQKJWXpcbIsstfPQK73XJL4TaAMY3M+f7e4g+4Cv3WBB
         1JwYf7zvRkL412aB9QNx4Vtw0PyVitNrQXseWf9HkqZCPoHP8oEw44E7Sh8yllWOSbxr
         Kv4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXy+/qoUk1d0W/rZhd8yb137x8PQBoyjUmmOTD5tuYByVuMjEZ6hGCknqybZL8Rv25nXS8SHzrm6+4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsMDvuYMJeQt+0q38+mhwamWKX2AH4ab3K/zaik44eFbL7647L
	0rLIKTtgPsuh/3dg1L0d3DrsMUN/fhdVcJ8ymPT+vNQUdahpiCCezsaDOperHeWhqhRblctXXn2
	olRW9HDV159B+jCvVW3iA+0MgcTRR5JTbZN2rQg==
X-Gm-Gg: ASbGnctDbAnKXvl3hOJeqREOdSIW4y7ddYY4D0l+EtGpIPcIFaWQ+6WhZg25JIV/1uF
	RfhOx5Wch/868YWdUJlcOUG8zoZOKkPccUDhGNA==
X-Google-Smtp-Source: AGHT+IE11omUaJ4WXf3M872hwf4LKHvl3NeeSE6hV/ORlMdadi+NJj5MwYpomF9yj0vKXlTRigYPF4Zh1hB/AzSqds8=
X-Received: by 2002:a05:6512:220c:b0:540:3566:5760 with SMTP id
 2adb3069b0e04-541310a37fbmr1037395e87.35.1734440446299; Tue, 17 Dec 2024
 05:00:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1733136811.git.andrea.porta@suse.com> <42e09506979d878547d1140d7f6bf68ace76549b.1733136811.git.andrea.porta@suse.com>
In-Reply-To: <42e09506979d878547d1140d7f6bf68ace76549b.1733136811.git.andrea.porta@suse.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Dec 2024 14:00:35 +0100
Message-ID: <CACRpkdY+6QPRH-Pd9SwXV6dsdah-otMa8bkt=-avzF6Aiaz7gA@mail.gmail.com>
Subject: Re: [PATCH v5 02/10] dt-bindings: pinctrl: Add RaspberryPi RP1
 gpio/pinctrl/pinmux bindings
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof Wilczynski <kw@linux.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Derek Kiernan <derek.kiernan@amd.com>, 
	Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Stefan Wahren <wahrenst@gmx.net>, Herve Codina <herve.codina@bootlin.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 2, 2024 at 12:19=E2=80=AFPM Andrea della Porta
<andrea.porta@suse.com> wrote:

> Add device tree bindings for the gpio/pin/mux controller that is part of
> the RP1 multi function device, and relative entries in MAINTAINERS file.
>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I can also just merge this patch to the pin control tree if you like,
tell me what
you desire.

Yours,
Linus Walleij
