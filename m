Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F23A1C5496
	for <linux-clk@vger.kernel.org>; Sat,  5 Apr 2025 14:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743863352; cv=none; b=C2C4jqwPoOraY4iFgPKxDha2oUmvdBc3N5WMH9u/lB9cwgV+pYKK2gslM/m26q6/DqnQt1Rf3WcTS1yQkUglGfqeoeae+7JXRCZvnULywe/flB73I7Ta6++55T41Q//0V356f1G6XAwgzjXGsMz1SItOssAM0MjC4iKW3KhICD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743863352; c=relaxed/simple;
	bh=GiHxnNFMXpNIIyTnynX7IxDP/p9NCTJMguIsJZ7Y6h0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fNujs0BCz99COMaOQF4nf0UCQPfjd/DEEUZ15CO14TXtsN7+qhf2Qa+h3/B7Z9lHJT64d2agAu8Tsnqd2yLTnxUjagWCdypej52rEgmOTWrQv1uZj/XfVyXf7asqkjyOmnqy8S0NlX5c7FtFYslgK9V3QFOknct3wBq91b+JK5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dl0xft0C; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dl0xft0C"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso2220402f8f.2
        for <linux-clk@vger.kernel.org>; Sat, 05 Apr 2025 07:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743863349; x=1744468149; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GiHxnNFMXpNIIyTnynX7IxDP/p9NCTJMguIsJZ7Y6h0=;
        b=Dl0xft0C1X6gds1VaxF4D5yQc5Q88d18FDmfNNaoHDAeEbBFisYX9phxnpr1nP/Gxj
         8QEoy+ztXWcQ9J2mbRIfa4u8GkQf0qP+xsm7bfceb5+HGS6QG8SuJ18Bc8VXUvaQJiKY
         s6yC/lmUCLL8sndZj7Ts/n3mOClo8tclwSL6dUQubk2xc5Qpt61Xs0C9mzzhIm9VNmhA
         0o4FMCDxMN8x094tEbzL4bQP6/fLF65CYZ76CUVLCF/HtfURT0eWs5fNCKBTKPFRzUbM
         KFCF0tWTOKc01yLQVVmzaGoK5NLzZfLS/Jzfs5iUk9VHJf8a7SF0h19/6yx1d8tLwrHO
         Lcbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743863349; x=1744468149;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GiHxnNFMXpNIIyTnynX7IxDP/p9NCTJMguIsJZ7Y6h0=;
        b=K5fMWwkjdiAV+swUcji5HKQHeD60M2J1f88497KblPqKNNhtLmCiWOT2JKOaMWznGP
         oNjltIkefxo9QOevQTyHOE510Jo4Br96DhslUF+Pr6QxpoOPwDXlcJQapkupvbMvpD0H
         ubiGoMcuC6imGwMuLuZWwSMnBVHurI4AoFZmpMClPqerftN+3AlYe0RIGsPZGv69ZMUB
         VX/g/Rp5yvJ+b2mlfrmiVkvxQySPvr4reJ8nnVJOikkgAC0caE7trKcQEqD7w9cso3+d
         0bXnKIpib7SUKHaDYliSBhr4oVQtakGwDDZhFPypm1KLgo31ymyatkwxByXx+EIGK2iL
         sTrg==
X-Forwarded-Encrypted: i=1; AJvYcCV4FqIKH2B89q661fpO3zlwRJnE+T7uLeSmB+Y7uojUOJlgbAvANaoWsuM4mc4YmNfHOYEnJo5yH9g=@vger.kernel.org
X-Gm-Message-State: AOJu0YytBI81J+ezCcK0KlHGAgx0RGxuXYrT9swgsWYyLVIj/y4EY+1P
	jX27FJbioWJfGKyBM+9HhxIB1pduJroWxgKpmn69XAtiL6eam4X54s1+hHECrRc=
X-Gm-Gg: ASbGncuQ5jKtgwpfp+ww7MyoIUcks6+TvG3ao7oQxrWfs5SuA9Q8zwjnhb3RclFh03m
	KvjypLBxZHSUOqB8XJT4l5JoYQIAYKcvOdbihaYV+HZRDxAJtZwBrxVmJWlq3ksWNEvtMRKPuwf
	PDExufFTnyuthpBgsp3AEUBvf3Q8XkjtR6vAaYb9COFrpsiyqUFo0kawZbiNO3MQAX0ATrnjg2C
	8QrMhQPpF5R1zl6hbz1GGlyLoUyUGH9PD65p0N9DnkDiqsC/VjCJ3n5L4NM/cTn1yeVfHWpxaJC
	Ty3mcaFOXF9OChDkDLCd3/w4GRjJtSkkLoVIUpp0h/UfehM4
X-Google-Smtp-Source: AGHT+IG+Z0ir3xm5RCrAq1SN4ZDlwjVRgFNS1Hr6WM6JjZY4zAku9AfXOB4reUpFaHMAVqmVf3D7Rw==
X-Received: by 2002:a5d:6d8a:0:b0:39a:cc34:2f9b with SMTP id ffacd0b85a97d-39d6fc291b3mr2358345f8f.16.1743863348783;
        Sat, 05 Apr 2025 07:29:08 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d63csm7230344f8f.69.2025.04.05.07.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 07:29:08 -0700 (PDT)
Message-ID: <73d99b656c405a19f75633796b696cc1aae71b90.camel@linaro.org>
Subject: Re: [PATCH v3 00/32] Samsung S2MPG10 PMIC MFD-based drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Chanwoo Choi	 <cw00.choi@samsung.com>, Alim
 Akhtar <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Russell King	
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon	 <will@kernel.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker	
 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 05 Apr 2025 15:29:06 +0100
In-Reply-To: <20250404093035.GD43241@google.com>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
	 <20250404093035.GD43241@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-04-04 at 10:30 +0100, Lee Jones wrote:
> On Thu, 03 Apr 2025, Andr=C3=A9 Draszik wrote:
>=20
> > This series adds initial support for the Samsung S2MPG10 PMIC using the
> > MFD framework. This is a PMIC for mobile applications and is used on
> > the Google Pixel 6 and 6 Pro (oriole / raven).
>=20
> When you resubmit these, please note that MFD subjects take the form:
>=20
> =C2=A0 mfd: <file>: Succinct change description starting with an uppercas=
e char

I've followed your suggestion regarding the prefix when patches touch just =
one
file, but for patches that touch multiple files, I've kept the 'mfd: sec:'
prefix, e.g. in patch 18.

Hope that's OK.


Cheers,
Andre'

