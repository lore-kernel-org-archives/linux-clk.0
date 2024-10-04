Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FE3157484
	for <linux-clk@vger.kernel.org>; Fri,  4 Oct 2024 11:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728042303; cv=none; b=jrX4abtRvrck9+pzGEd4wqpqu5Wrl+J9HfQ2/REglsEEt/saqkvt5oY4A2vEzx9HD1vl4Pgbu91uURCYfyGUEtM0gf9g2nIldx9cGi3QGDoQ1iGFKjAsVt1L8NcsyDOYGq07pd3r17AzkR2gyUdGV6MSS44PzpMMiO6PQYR1SgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728042303; c=relaxed/simple;
	bh=ddGvXf1L/Fq3c4RMPyxrOA14cqgWI9P90J4zJ4pJs4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JsGJIry7yye/SgqUXPygZiXOOkWbPcjSvgf/XIy43vcerGi5zoih+pEIjwd6pFQpBovpxC7su69ZIERCDSaZWYeuAifd2t/tbVSGzbBmOxJdviMUvFjvl8dSSzJL+VH1tKO5wWT+xBEPH+D6vPPZNBDRrTuayyjYgSofK1fEwa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HjR8GugK; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HjR8GugK"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fac49b17ebso16400821fa.0
        for <linux-clk@vger.kernel.org>; Fri, 04 Oct 2024 04:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728042299; x=1728647099; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Khwkr05lsMPVSpq7TCjaX0gPVi7sWovxm4CAOdt4/3s=;
        b=HjR8GugKRCDjLPeodO8HloyjgQ1OLPxVoLDlQlXKO2iSZOkvjJy0DTvLv2+4rxk8A2
         9QtantMsXz4bxkjCWgpec8Nhg9JuUgDOeTjdVEFVgGtnNqcOMvwq36OgW1nPFYPT2760
         H7fUVJRbq7EXeYfn7sEZMaTr1OYR5cJZuYS+tpPdlNKEtALPfKBeh9XkJ/e0Ta61XMXh
         c6QGKeRXtjX5gB1uBpNfUrarXzxpsKiV52MAsiv86aduOF4HO7FMIT67lAttqYVjp6Ak
         EoeC3GBL1oqtoKOPwM9D7toIcqNiuokz8gBOFcgK6dl/x0Xsbosk7zgOdMuVK+3hc5uu
         If+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728042299; x=1728647099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Khwkr05lsMPVSpq7TCjaX0gPVi7sWovxm4CAOdt4/3s=;
        b=KRmFdQFShpKKBIewXE5mWuJdHqHkpT6DaTQX6zEBYCktdWUZb6LykSgE7juBeZsWkN
         K1PL1NBycga6pbZCC7wJWeXnaaHiv5kTaeAaFK9E8PYtIsV64BhbyvTSKBa2J6gdg0fz
         er7tQyczwnxTMG4xvx7XwoE6Cll+uFot/ct+c37Z9SKQz+0B9wsvqHggaG2yPSQO7Vvn
         PWMZsFOW1RdAMbjZX2ZUrElvEJdw03+gMuiF0yCWD/flhKutL3pUq3GqvWxTm+IWsiDx
         K2nLCMhX53b9pABF368KT5jd7gw1Unf0MlKrbJTkrG5i0GKQ4HXSFf9vauAV7Ca+8Zkl
         bRzg==
X-Forwarded-Encrypted: i=1; AJvYcCWAsXqyTMx8b610MUzpxlh3L08E8YTJfESoP8lGQgT/oRbYG3ep4aBnP5uNF/qhNs7eZjBnf1CcTrE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxD1z+IaHUaBUsYmaANxaNwVYtPMlbVSsMPjpH6he6a2YMxTXIu
	wC0iorF3JDoxBseiMD6LAbCvfRO4SmYB5fp/vA3pgjYDLqHRB2DJ6yBdu8Am9/e5n6lwZXkygFz
	C2dId757sr7pCR6jMpf9vzBXEBTaNTBX8KlCHZw==
X-Google-Smtp-Source: AGHT+IGiTQzYERLjm/jzUGh/crV6ATYuQpv4nXIEVrS7JrXOOcQzJB/z1NXK08Yox/oqqZ9WwDQ8tFMFsN0Zrte3h1I=
X-Received: by 2002:a05:651c:b22:b0:2fa:d4c1:3b6b with SMTP id
 38308e7fff4ca-2faf3d74e2cmr12168961fa.33.1728042299452; Fri, 04 Oct 2024
 04:44:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241002232804.3867-1-exxxxkc@getgoogleoff.me> <20241002232804.3867-5-exxxxkc@getgoogleoff.me>
In-Reply-To: <20241002232804.3867-5-exxxxkc@getgoogleoff.me>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Oct 2024 13:44:47 +0200
Message-ID: <CACRpkdZnBBAEgHZ=HShwvaXaN-6icC5hzwHqDNWWy_PKJDh+Fw@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] pinctrl: qcom: ipq5018: allow it to be bulid on arm32
To: Karl Chan <exxxxkc@getgoogleoff.me>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 1:29=E2=80=AFAM Karl Chan <exxxxkc@getgoogleoff.me> =
wrote:

> There are some ipq5018 based device's firmware only can able to boot
> arm32 but the pinctrl driver dont allow it to be compiled on
> arm32.Therefore this patch needed for those devices.
>
> Signed-off-by: Karl Chan <exxxxkc@getgoogleoff.me>
(...)
> -       depends on ARM64 || COMPILE_TEST
> +       depends on ARM || ARM64 || COMPILE_TEST

Can we get some more context for this?

Is this another one of those cases where the SoC is actually a
64bit core but vendors just choose to run it in 32bit mode because
that is what they want or what is the reason here? AFAIK
IPQ5018 is always Cortex-A53?

I just want to know if this is something we should encourage
or leave out-of-tree.

Yours,
Linus Walleij
