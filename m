Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FC730496C
	for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 10:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756462294; cv=none; b=LwXzQY4oo/zDgy8jJ1Ii2O/odg/zwIEP0p869TQ8kwjxeXbVilZEEZqeftw1zkRvBWFrBi77EwV4uT2B5x2jvVrMZt+1yBVt29w0stZedHRFA2NSRu+eZWa7CZWIQJW3QmxEKiIh9GwREbm9AZpNdVLacHgOf+klQk3hM7GTn5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756462294; c=relaxed/simple;
	bh=Xjnj6nPS6qYYbzWCdNkcP1fjnBYRMWrLTWZgkTJjBnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e1zuyyDRMhbi8dLomP8OBQ+NkFhzcVg8k9/RjElTjydZEHN8Q6ghGOXKGDRXFXrnsNI3GQrb234/rKIysk10inH8qNjCqRkB/PRtf5psfinLSP8phhJ2Cg9XyS/22ih1RxIklTwlxp0By4v2maIKz7+VrC+GxeYuuzVm2L/OVZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DQLGjcyQ; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DQLGjcyQ"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-336ada26e92so10495011fa.3
        for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 03:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756462290; x=1757067090; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xjnj6nPS6qYYbzWCdNkcP1fjnBYRMWrLTWZgkTJjBnY=;
        b=DQLGjcyQB8xVGY7S69JpGxpY6sCHLHcxJV/51sAplv9/X9wmIcg4D01ovqDL77/Fet
         sO+9ayzFFnuhb5iOT8W+A+N1nB062Rs7lZBiQgXG/GEnJ5VuFTX1GAoYcRaribtIXTrV
         wk1tCsMNcqEj+vNTDYpDBUT/LXP4BNHKZkPZKgUIT/5fStZWnFtQelIspvGenGvAbU+G
         f2wknwDktiK6zqlcQkSHnOXAUx5nKxkcCfBjgQrcRaGpqd1zUd2NtVVOIIGRrWoZMKTA
         0++9nhcRLeW1Cw0SKqRjmY1tXmeVwmDqQOH8EVeSZwBLcPLPnhOMrOBBcpND5aI+p+jb
         4dpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756462290; x=1757067090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xjnj6nPS6qYYbzWCdNkcP1fjnBYRMWrLTWZgkTJjBnY=;
        b=EKAWaDBpAw5dcdlhAbSqQCxGlumb/hQY9gGYTf1i5zj3w6kbmvi3qv5QfbxqGoxpNj
         3p7sGbzv6zhuGmFO/dzItf0iH+QRfEWKm+t3ThDd1t1XmcN9y+C15erJcBbrxw3eztDH
         J1istMpD0I+tV1eDuQcVKiPoo+bYyBJ+34VZa4ripW203+fNICzJh9sIjuKV0m0mpieE
         MUHm/2kNv4E5ZE74WaAQfbMnIuxcegsgRv6SRxhLAX5Fh3Rlmr2Q6DY5IAiz5b2a32Tz
         DaDCZUDhZ9CfcxAfocn0RNin7NSOCCvoEnaMmt/x0mtMf8X7SC80A6GD9H3voHkgHg9f
         bEFg==
X-Forwarded-Encrypted: i=1; AJvYcCUBg7Vsy3jJw8SC6aQE/F8HygV639KZF/tcvDuOmB3bI9oqc5kigsHklbWj2galipx/t/Y/XhQo+8E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/SHNRdk57JkAickKNTPnyig/tDdd1foGyhCL0Pa3qqtP5WYui
	UJIF6VNasWyE3krN1TuwRtM9uX/A4wcJB+y+Sn587F+b2V4rY3um6OyvaWEVWF1pzmSPwkfra27
	/1108sU1kxsJyg36G5juSV1YHDuuOLzrfGFPFyeKqpA==
X-Gm-Gg: ASbGncuaS1KLyn7uLKAZcfruQiz8xLzxznBMC9+0F/imX1aq5YJvFG1a3/L3WmnUSpp
	Tli2KZNNvMrMjLt1ElXvTf0jVpRLudWqAGj6UkUBm7zR6skEsiDN9mO0VBw87NhmTe/qWU7PcxU
	S7xJWAX9m1TgKmbqV35pZyTxkrtdj2TNv+QO0oMMgYbqwRQWgWqx9a7kETFfxdW1gw9UKjjb1fy
	QBXmfU=
X-Google-Smtp-Source: AGHT+IF2rckuWDB0N8TfxkqBuz+CSPuYoKPwq0L/OKD+eFOshcmaXOwCLTHg9xCg7qGXInQk7y2zM1fsjZxdnfUASAE=
X-Received: by 2002:a05:651c:1544:b0:336:a8fb:937a with SMTP id
 38308e7fff4ca-336a8fb9b93mr12812201fa.19.1756462290440; Fri, 29 Aug 2025
 03:11:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250825120720epcas5p491e16bbfbdbcd751acbb0c0e55f9e2a2@epcas5p4.samsung.com>
 <20250825114436.46882-1-ravi.patel@samsung.com> <20250825114436.46882-6-ravi.patel@samsung.com>
In-Reply-To: <20250825114436.46882-6-ravi.patel@samsung.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 29 Aug 2025 12:11:18 +0200
X-Gm-Features: Ac12FXxjnbVzeqW8L95iuuSr2TZOHM52rnOiOuvqvFvgSGHYE7jxXOy75cPjyPs
Message-ID: <CACRpkdZwz8C=MRgo1tQrkQzNtKMLV+P-LK8XyRA3eSFW-cbFCg@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] pinctrl: samsung: Add ARTPEC-8 SoC specific configuration
To: Ravi Patel <ravi.patel@samsung.com>
Cc: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org, 
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tomasz.figa@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	arnd@arndb.de, ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com, 
	gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
	smn1196@coasia.com, pankaj.dubey@samsung.com, shradha.t@samsung.com, 
	inbaraj.e@samsung.com, swathi.ks@samsung.com, hrishikesh.d@samsung.com, 
	dj76.yang@samsung.com, hypmean.kim@samsung.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@axis.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, soc@lists.linux.dev, 
	Priyadarsini G <priya.ganesh@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ravi / SeonGu,

thanks for your patch!

On Mon, Aug 25, 2025 at 2:07=E2=80=AFPM Ravi Patel <ravi.patel@samsung.com>=
 wrote:

> From: SeonGu Kang <ksk4725@coasia.com>
>
> Add Axis ARTPEC-8 SoC specific configuration data to enable pinctrl.
>
> Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
> Signed-off-by: Priyadarsini G <priya.ganesh@samsung.com>
> Signed-off-by: Ravi Patel <ravi.patel@samsung.com>

Please avoid CC to soc@kernel.org on these patches, they end up in the
patchwork for immediate merging for SoC:
https://patchwork.kernel.org/project/linux-soc/patch/20250825114436.46882-6=
-ravi.patel@samsung.com/

I think this is not you intention, the pinctrl portions will be merged by
Krzysztof who sends it to me once that part is finished reviewing.

Yours,
Linus Walleij
