Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651A924167A
	for <linux-clk@vger.kernel.org>; Fri, 14 Feb 2025 10:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739528448; cv=none; b=lyM1ZN0twdmbkgPL+jyao3P8Ixevxkyl/Q+EdIUmJwvq9aejM+xNf2BjaUIkqcFE7nXkfkWc7P/21/VSngR4Pk3muGRbtjMJUIqJGoSgdTtbxf3mNEEBpdXG8h+NhGdxa5jjR1pzI+qaabDoZclC774ljIPjaSl8Ht8lxoldtfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739528448; c=relaxed/simple;
	bh=CTVSHuL61/AhoBRJTC+WTqwIf//cehy9pgtd28J8H5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KX9Jp0eyxGpoKHNDMCOQ4ARBG4C+wuUOgDWD1Fd2fgjvERp04KxWpH38vdqRLeGElEoQkMBCuxnuNTtlWSrermT+91B7XiP/DxMk92ntavZu4tX5Bs3sZQSmuEMHhq8umGrRETzXon6M8mlZ8wPIfR0NLucHtxD9Myly/22ycZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jezb1I0M; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jezb1I0M"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3072f8dc069so19828831fa.3
        for <linux-clk@vger.kernel.org>; Fri, 14 Feb 2025 02:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739528443; x=1740133243; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CTVSHuL61/AhoBRJTC+WTqwIf//cehy9pgtd28J8H5w=;
        b=Jezb1I0M2617sN0MnAeELG7DWdbODlFft9t6Nr8KMJG78nUyvWKUU8krBSe63ZGGNR
         xPtCsOxZ0bJjSpTf0q0EKmFpRDi2+LwNV8f7JxbsX/iOecFylb2Pp4EX3Nb9irLERdsM
         M87AgZhkDrCz+GibkLUeDhh88GvJ/neRFY9YeT4KNqQTVdB2Q7qLSURTsL8K7QS5vC33
         9lIuO2+XTtsApbP8MiAVTLn8EOACTRzWYXNw7tfNJLzmHGigdYTxa7owR38X2R5JrOVE
         zjGNhKSJho7wygY3pC2gn3Axpcpn1U3X9P3kyF5lQm9VgcPkQdi9MqWaFUy0Y1z6UUzg
         /VMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739528443; x=1740133243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CTVSHuL61/AhoBRJTC+WTqwIf//cehy9pgtd28J8H5w=;
        b=wPOfmKy/3FbhZOocMvctNlF5RAY2hK2+U3MVYGHTxtLgwjln/Ug+jcyx1Og+jewbvI
         NMK3nt7pX6mVDdZwNldKS0LrFPx1nKMt2cis+cgTFk19HjQ03iJ5388pYqEx6aqbBh8m
         DVez8ktkPC2aphu2d9/WY9l+yisBCnn7VmajpLF7ZDhUEL4Cc8PM9h1r6fPlueF3VjbP
         XvtZbArlU/eFHGjCqJAaEsS0RAgsJnYiGFW8Cy65ChCbaUxhkZzazHISK+v35ZYu3OOk
         9aUTLGT42lPNMS7Ueu1tCWREQgPymNF/484IN3SF/oY5V5Ufx4ZXDHV5Y4nDolBHjkkC
         5NAA==
X-Forwarded-Encrypted: i=1; AJvYcCX2JNRHe7J9zb3AB+nt+wvRdsFcvuLwbEsmiJrBIsTOe89AcPaNfFLOL/E2zFqKwibt5j3D1yOaqto=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMPFZW2z+HoW945DxbKKXUlDX87CZwfD+ICphef2NbdTO1z4r7
	4A78VbiIoS3eOEbMe5+hwMRrZULD+NNJ5CeK2MwYd/UU20Yr1daiajvBMzz+nc7mjuQFarCcG+X
	iO6KJ5ro/RLDaz2vHA2FhHKJEBqejEFHr4iDZAQ==
X-Gm-Gg: ASbGncuZjdDeLfHlicVO/LkKRwzT6IEwybB4TyKhWoYDxzuhzGMrK0w2DAA5Rqgb0sK
	9wJmHCaS/IzOMsw0WjTodSCvVGfPHOPVtQhhb9Bpo+EBHT1bpp0Fv8cIcPo1dhgU/UCn7NlSI
X-Google-Smtp-Source: AGHT+IGxEKSdYAC3wifyGNgk5Eh89epo8lJDj6yQU/T/HzKQmZRPC1uyCtKYApqXa99y+vDHCBVSpmZfESb33W2+lF8=
X-Received: by 2002:a2e:a7ca:0:b0:308:f860:7e8 with SMTP id
 38308e7fff4ca-30903669b5bmr38024031fa.20.1739528443454; Fri, 14 Feb 2025
 02:20:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211-msm8937-v1-0-7d27ed67f708@mainlining.org> <20250211-msm8937-v1-4-7d27ed67f708@mainlining.org>
In-Reply-To: <20250211-msm8937-v1-4-7d27ed67f708@mainlining.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Feb 2025 11:20:31 +0100
X-Gm-Features: AWEUYZlN87XktebbarRKF7Naij4xj70q78-i9U_Bkah2OKeETlLFl7lqa7kEoVU
Message-ID: <CACRpkdbG-cS59TbB36=OrZ0MfXPdDPSpPEA8U_L_iMOgNZK70w@mail.gmail.com>
Subject: Re: [PATCH 04/10] pinctrl: qcom: msm8917: Add MSM8937 wsa_reset pin
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephan Gerhold <stephan@gerhold.net>, =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
	Lee Jones <lee@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	iommu@lists.linux.dev, Dang Huynh <danct12@riseup.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 11:38=E2=80=AFPM Barnab=C3=A1s Cz=C3=A9m=C3=A1n
<barnabas.czeman@mainlining.org> wrote:

> From: Dang Huynh <danct12@riseup.net>
>
> It looks like both 8917 and 8937 are the same except for one pin
> "wsa_reset".
>
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
.org>

Is this something I can just apply to the pinctrl tree?

Yours,
Linus Walleij
