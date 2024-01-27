Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99A3BA28
	for <linux-clk@vger.kernel.org>; Sat, 27 Jan 2024 03:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706324521; cv=none; b=XM7T33s990dSHKjRyalo+U5vtIMUN868w71XqtrcamZl1vPfkPTNq383M/sOM5epTWvgj8CRt4ZJ24N6BIffVe4oHYXRsLz/RJZm7qy+vEyg7xJ4DmEoolJYlOzkBgzjFTF7WLY0NoxvnnJB3CetrldlatRqdwHwz076HIgw738=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706324521; c=relaxed/simple;
	bh=dpCL270UQPI5eSppcdrsOlocVyO13KcXBRgxFoQDaO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pizaKs4DBmYWiSjx3rEe39MSnEziKN6ImoFCmawKofTfs96Oizxd/kd2uW83e6laX6P3P7+IuFG+/S4Q75GntoLg5omMq7AZYuOcFKjxbeS/3ij+ulyjQ0I7D+OktVH8zlRbf/MMcG8ra726ldBezzr5ZXgRloQizuy1X603Tsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QCx9qNXA; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QCx9qNXA"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-68c37bf73aaso4448326d6.2
        for <linux-clk@vger.kernel.org>; Fri, 26 Jan 2024 19:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706324518; x=1706929318; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pmcMqTe74whx9rEKa8Rswz2LGLtHny0L7TpbU7oKD6Q=;
        b=QCx9qNXANqe731od4L38foRK7cROElujdSNFMkLjImuR7ZqyotI9VxZw3lkwi30FTT
         oSm0nb74P9XNioiaVbOmXuUA/v0cIN7PK840W0ExL89sJxpxufxnnh24IHlkqZ9M8IWF
         mCnQypVvqsETmo+VX3/70ATm0irb9+FxNV67dMigbo2lpaXryIp70CevzUPp+tG4AJml
         uEbK03W/j5wfPOc0h+L3xgrOXQKy4jb8cFH2BgzntstW+k8CoPbqUTVWi2hpIk+s2kdW
         bl9970qK6FnLkpev6ERmzVvS4s4CRvya5etuwwAcgC/mV+DPoBIeNZAMLiwXrT4ntC9S
         F7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706324518; x=1706929318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pmcMqTe74whx9rEKa8Rswz2LGLtHny0L7TpbU7oKD6Q=;
        b=Qh382CUom7mGGsERI4hslkyCrpQc4Ni5Og+9FnDhe9TYAI9bduVszP0EnhhuP/8wjM
         cKm657vFbk+Ol5yxbL1/Ikc+4hrUWUtDlYtQcH2OEZCwowO89jMPkB+0Y2gjXRRnzgaj
         J0uIkNzVyzZuNYyrVXHN8y3f9wKEYx43w+RZ2M37uTubr2vJnstz82vKM7HfPIiY23uD
         BdWblRw0qXRx0QG8Sqo0C6eH8/cboiqp7uC+0bvupZNvDj+fX2/mEQdhIa41ZawF0SeS
         nA3+dsOt2HPcsDYxzruGrz7OUIsEvGSUM0V38OrqERSycA5nZrZIs2MYjrM7DTeUFVNd
         ZGbw==
X-Gm-Message-State: AOJu0YxzvF5ijzQqfGqAUpuwoNp+r1SUm8xMLbJkg9je1TCEdKbybCUZ
	B5/9L2Xg1CYNRUe2wOo63Pv7Wn2V+EnI2s4gqwgkuKmEfnlYr5vLZgLgdRlzLHJf3FhJc7ESGEq
	E9WRhQDqsPke9eeHmDdqoqMAof5Pq4Q4mb3+uAQ==
X-Google-Smtp-Source: AGHT+IFl0pTq8D+qlRGElaXOH+Jp+6F2IhaN1xuPOVWBs/rLWvnBMzTHzpUbTXgaCK5ievjh3HGeFhyktkjJY70TJoU=
X-Received: by 2002:ad4:4ee8:0:b0:686:aafb:2696 with SMTP id
 dv8-20020ad44ee8000000b00686aafb2696mr1130335qvb.29.1706324518010; Fri, 26
 Jan 2024 19:01:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240127003607.501086-1-andre.draszik@linaro.org>
In-Reply-To: <20240127003607.501086-1-andre.draszik@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 26 Jan 2024 21:01:46 -0600
Message-ID: <CAPLW+4mLuisoxQqOagFjjQ3n9yRYEDQTbGYz21_kO0zDMoRYkA@mail.gmail.com>
Subject: Re: gs101 oriole: peripheral block 0 (peric0) fixes
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: peter.griffin@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	tudor.ambarus@linaro.org, willmcvicker@google.com, alim.akhtar@samsung.com, 
	s.nawrocki@samsung.com, tomasz.figa@gmail.com, cw00.choi@samsung.com, 
	mturquette@baylibre.com, sboyd@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 6:37=E2=80=AFPM Andr=C3=A9 Draszik <andre.draszik@l=
inaro.org> wrote:
>
> Hi,
>
> While working on peric1, I've noticed a few issues in the peric0 area
> and these patches are the result. They should all be pretty
> self-explanatory.
>

Looks like "PATCH [00/xx]" is missing in the title.

> Cheers,
> Andre'
>
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 9 +++++----
>  drivers/clk/samsung/clk-gs101.c              | 8 +++-----
>  2 files changed, 8 insertions(+), 9 deletions(-)
>
