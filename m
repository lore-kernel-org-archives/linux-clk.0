Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60547212548
	for <linux-clk@vger.kernel.org>; Sat,  8 Nov 2025 21:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762635872; cv=none; b=irxh7HbiFPhDVI8k66B+iJH07QlZUXJXieVDBQb7omeuXjs1R3y31VVEeAfxk43iUHxIJWigQ+zF5BhR+7Yte58vZ/kDMwJ80L+usMe7WCmcKJEwXVx8oY9DCudhCOcJnWibU3+189SAbUGTW9IAvkKhlhyhOmXclWYjBYmhvDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762635872; c=relaxed/simple;
	bh=QfBxOPKy7fDifZhi6nSzMhp9yBd8dZHhu1E69GOcGH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B12q4pYfXV4m23fhHW/7F4nLAalOqj2A9ccWQZAJvt7wEpsEwcWyNCPqQYUmQBgly0hmLXFOmRPWpiI2xBTe0MOJ4b8z2Sy6/4WAdY+OWe/QbakHDd1YsgMwUHcJWDBlNMBJsUUYwLi6o89/9EJHxyvUacrrqOL4wIOWMQ0Iu/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=NIt5V8vI; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="NIt5V8vI"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-297f8c26dc7so1984525ad.2
        for <linux-clk@vger.kernel.org>; Sat, 08 Nov 2025 13:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1762635871; x=1763240671; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfBxOPKy7fDifZhi6nSzMhp9yBd8dZHhu1E69GOcGH8=;
        b=NIt5V8vI8gtkwns1f02byN+rk+Uf4rfhvYku3G0xEUuGj/P/ccNfVEJZRsi31AcsyE
         JAGSSVrxKDlVfKNXl2BOjeMFwWbMmN7YCL9fvUZhr209IBYO39f3rk7npIromLXM2J7l
         o+K5200niKwKuKR+3UtV7AWAv+SawwXkBL9K3PTc5H9ZmoBuhV6Q8L0jhuSvmIql3msZ
         B115eMNTFC9sgXb98GngUZZZkhodK2yMjbi9csfI3MhMlxCkK4ux/rWOdLtGsCXkFUm+
         wc9zvnB7iKNxNt4YM9AEsN2V+kOx7W8Tuluge2zRuTjoiJz1jJCfDCL7ZFlk5JrMqUiS
         XJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762635871; x=1763240671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QfBxOPKy7fDifZhi6nSzMhp9yBd8dZHhu1E69GOcGH8=;
        b=YwFrJA/gMXWRelp0Y3Cb3hGxteiUlFtaBw4GpYQwGOaw3yjZJT6mIHXE5eMxTjHlh9
         5yZ291GrBpTcn/tlb+tffPFWzgm0spS3K0+KYxREhWUxaIhDGo2ffpl31Jae0Wak/Lv/
         Hsvyc5icMHTtTdgcVeE+NSIXQYM+6Q/JnKvJMNEDP4DTa0IDON/CnTlCP//IGmDY+ZF8
         0RA+NuVdkGgyQpLOkongy3QZKLVJuTB2o9AHBGfsIBEG1j0WUJ4k1QLlqDzAz/1+WUM3
         AwVlLwYKasTCH3O/Yj7Uq2wUkXxHnydRbIufrPNfmaHWfbtOnYorjiHqQJxzjCOPP+fO
         tfUA==
X-Forwarded-Encrypted: i=1; AJvYcCU9kkt0oHrR1eNvy9mfvu3wLQIMNRjwFcWZtGU29Ar+HKU2/EaVw9Y1iKOxhmrSHin/fcQ2nOb1MDY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYzGX/HH0yy+e0IkmqoHn82F+286vBpIgEptuJ0Yxeu8tth4U2
	Ptq1mccUQEbjESj0JycGOFbyOwRj/lKRiZH0wOVP0ZRzzfzKqCsPznYB/xz/ix/UMd8UKYu8ANk
	eJD632okl6stEgyOZDpv9wKYfxeaPeVglNNiR
X-Gm-Gg: ASbGncuHslJp042mMBN2kBi5JZuIkNrW7EukZ6Wdu+YBP24XgvjWo2hhjuoXaDMGolo
	UcYIxbRh4NDe1mRXmhZymFG9qP25LZsG+gWagyRoE56YGNdfvh1j6zJ0TnHxbvyhl+C+ii+44Mj
	y2Odb3DXCFoYS5QIjS3n1GXSL2/vqXGBlNd7UmvoGg83KYKEWVrOOOH2iXa8LcYPRBhhN+YEMOe
	VtPrUR8ETt+WM4pnd5LROuE1SWF7h2Zm5ZiPE2Fz9wzBCy/SsQBlYpd4YKzip5Xoag5J5pijsdc
	M2lzxM33JxcgwWTu9YLbGF3RRl3v
X-Google-Smtp-Source: AGHT+IH7CCB9+sHT4Gkgb/MZHAPPjHtlGiNAPQ/L76vDJz380AHMHqeGOPDuOGCkaP2NZNwlmUNoZ72lWfi2Lh0v9Ds=
X-Received: by 2002:a17:903:1109:b0:24c:965a:f94d with SMTP id
 d9443c01a7336-297e56df7b3mr51858835ad.46.1762635870574; Sat, 08 Nov 2025
 13:04:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251031-optimize_pll_driver-v3-0-92f3b2f36a83@amlogic.com> <20251031-optimize_pll_driver-v3-2-92f3b2f36a83@amlogic.com>
In-Reply-To: <20251031-optimize_pll_driver-v3-2-92f3b2f36a83@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 8 Nov 2025 22:04:19 +0100
X-Gm-Features: AWmQ_blQKnrslPLjhIDEU0j0xcOWcQJDgXAAfDygmB-XCYvmXNGV_pkvKxIws4c
Message-ID: <CAFBinCDbx96byeCvLY-Cq2d7r4+RipUVuER57mz1zZ4fgqRd4A@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] clk: amlogic: Improve the issue of PLL lock failures
To: chuan.liu@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 9:10=E2=80=AFAM Chuan Liu via B4 Relay
<devnull+chuan.liu.amlogic.com@kernel.org> wrote:
>
> From: Chuan Liu <chuan.liu@amlogic.com>
>
> Due to factors such as temperature and process variations, the
> internal circuits of the PLL may require a longer time to reach a
> steady state, which can result in occasional lock failures on some
> SoCs under low-temperature conditions.
>
> After enabling the PLL and releasing its reset, a 20 us delay is
> added at each step to provide enough time for the internal PLL
> circuit to stabilize, thus reducing the probability of PLL lock
> failure.
>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com> # Odroi=
d-C1
