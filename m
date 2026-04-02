Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934C529AAF3
	for <linux-clk@vger.kernel.org>; Thu,  2 Apr 2026 13:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775136609; cv=none; b=XDmOJm5RYPuy+nxWbHoZ7Ow2obd7hmVvFGsabNXP7iXOikVtWZAu+4vOqQ5tIS761WKM4Fpa8gshNwA14GnSUJD4MHCyNKyjBvcqiwAS089gGYCqj6hehMiIvZP9Rpi0Sip/2d5wwgY2hYQ2YQG/ldOJioZ7CIyA9C22XRocMV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775136609; c=relaxed/simple;
	bh=mBTUXQ3PD2dZuBmcg7mtDUejMVNBN4mR3Nsq6fwUhdE=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=cTCABBOCSVKoGI9D/HEQrVNtWtEpqxE67Vxp7qu0aDv8AsvD6U0vAG1NXfiSwKE/28iRO8Vk7YNd+BlG5A5sW1mjiEp+LJNCZa1UCMfsEqfjmGH3byYFUpqsex7qmXuQBYnbEzZPTOm/qGi2i71fE8HiZhsdHyBM3lwnDGrAox8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kJSykyLd; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kJSykyLd"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48374014a77so10949175e9.3
        for <linux-clk@vger.kernel.org>; Thu, 02 Apr 2026 06:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775136606; x=1775741406; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8WxgO0tK9ltbloE4Oc/9lVYcELxtyYhqEk3PbV+jR6E=;
        b=kJSykyLdApeIzmSaNWXOBQqUuLBtHsUCO3rY7BNGCQeBsOzXxKMfu3f4mT9Szv2izV
         ASWHp4nozx4QWwwe2m7MQjvfKd2rcODsePNdDdwZ6dg2j+NpPMy0N8dID7vOPyu/fSBZ
         spPV3vf5217uIQMoxdHh8GYPd/V19IesbLT20RZr0CBHoHaH0OHTfGdsLyW7Oad1S9+o
         Cag81tcCj4nzHGJOeWXD62W6QzN0MDdWTQCGREMThnvTlpDDwJkR0mPTp4UI1QVZ4YW1
         NQHhZjfiGbZloLIQnhZtnWw4U0tE8HrCLSfp+tbZ22c8XJOB3/roqVvKy5N8maecQQcg
         Jj5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775136606; x=1775741406;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8WxgO0tK9ltbloE4Oc/9lVYcELxtyYhqEk3PbV+jR6E=;
        b=HLtsUhudw6HrOEayTzfiJKKXyaavHvn4cu30Hnks/myYFZrVnVQCaL+gBF4wkukxTW
         9BfOZjfTBRFin7uLodGAGdjdKGe8+xFRzuRsRvUT4aotBoWN/4AQxw/cv0Dgn3krbHgx
         0XaMOUfJsnWTgrDGMTfnQCiX10O5zGs8nP8V/I8c59xnGqLfgkMMrWPBdsgspzrb1uIJ
         cNggjqGANPZGJ1fc28aTKJp17on9iEzBH4Cp1QKh/voMojaV5aiG5f/DNvnORj2D+dRe
         eXQu2D72FbQ+35/b60t0LiRURtuGcydpSYrNTNYzjogrRfi6AJoJNikOKr4j3mpm6OJ0
         b1CA==
X-Forwarded-Encrypted: i=1; AJvYcCW5N1IJOtb++R0Mh+IbDftLZwAc51qZFNTz8l5exm00gOiMQI4ml7Oi7Ardd7TZzvjczrZ5XArilwk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm20FpdjTFVSLRxm5FnlteILdd96xEoRIFxj/DyPtJm0vw2vHD
	jEHPqPxlqZEv9PxUi2989+70m31Rxtdq13+22ZB8YgQ15ouhdas/jpsZ1maEFA4idWA=
X-Gm-Gg: ATEYQzxPQ3aFWjL2S//F3sVXQ5fPNdJypsfh4Qe0lnswnwhDaotdnaGHoif3E+6X0g3
	ypqjoc0+bOf6Kdhi52SC6u4Us4kmb3fZQaQqAw294EZqgrGXGPQBpmSST14Ii4TtUFw2pzHl3l3
	91YQa/eadHx8FWQCzcZYqNp9kARAunEZ7SGfW4uNiL79JzFDY9hzGCN7dI2bRgUNuUNGc4/iKYp
	ohDJBIq761a2oimTgkw15jaXtnYNF9v1TU08Oo1e/gGTmHP8OoSnUbfHeMT+rSQtjmduEXo+Iay
	CWOdmTybztoW8tKGfxGpRz23+/A70wKAzlyJgYVvlKO/oVQwBnG0AYwH1lX7Oc9YKrpTVDw1rS3
	TNLa4EuqrTx7PYt18lBr6jDY0A1GZ2T4ghw0oaFzgVwUk0LkAok9y5OIsydj7AKUipSsbcQ+lek
	lSrQ4CnxTGoUi7HYRbkkOWZXAbAhAGEz8oYXyEmTdYWL7+oTyNH1s4uf4iq/Ur/8+EsU8fXNKMD
	hyX+I33XkQ3CJlW
X-Received: by 2002:a05:600c:a10f:b0:488:81b1:ae36 with SMTP id 5b1f17b1804b1-4888b78657bmr38517325e9.23.1775136605817;
        Thu, 02 Apr 2026 06:30:05 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:a0c1:4037:aafe:5dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887ad8d28bsm85916235e9.10.2026.04.02.06.30.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 06:30:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 14:30:04 +0100
Message-Id: <DHIPEQ4XDUI6.297HDXTP84FFP@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: "Sylwester Nawrocki" <s.nawrocki@samsung.com>, "Chanwoo Choi"
 <cw00.choi@samsung.com>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Sam
 Protsenko" <semen.protsenko@linaro.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Jassi Brar" <jassisinghbrar@gmail.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: exynos850: Add ap2apm mailbox
X-Mailer: aerc 0.20.0
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
 <20260402-exynos850-ap2apm-mailbox-v2-3-ca5ffdff99d4@linaro.org>
 <20260402-free-foamy-gibbon-acad72@quoll>
In-Reply-To: <20260402-free-foamy-gibbon-acad72@quoll>

On Thu Apr 2, 2026 at 9:01 AM BST, Krzysztof Kozlowski wrote:
> On Thu, Apr 02, 2026 at 03:20:16AM +0100, Alexey Klimov wrote:
>> Add mailbox node that describes AP-to-APM mailbox, that can be
>> used for communicating with APM co-processor on Exynos850 SoCs.
>>=20
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 9 +++++++++
>
> What DTS is doing in the middle of the patchset? If there is going to be
> resend, then fix the order. If the order is intended, then most likely
> NAK but I need somewhere explanation (but I really do not see the need
> for it).
>
> Please read submitting patches (both documents).

The dts change goes last in this series, the commit 3 out of 3.
There is no DTS changes in the middle of the patchset as far as I can
trust my eyes.

If the order in this series is NACK, please explain why.
I suspect that potential confusion is because 2 clock patches from
prev series were accepted/merged, so dts change shifted from its 5th
place to 3-rd place.

BR,
Alexey.

