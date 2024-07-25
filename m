Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC2916EB7A
	for <linux-clk@vger.kernel.org>; Thu, 25 Jul 2024 07:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721891647; cv=none; b=UPyUIHPldS5fjsutOXzSkd+LfGvQVLs10MKN1uBDvrOek4lWewNiGUoot/CClTvxxKLMBv0fHNJsxCkQ3pTDW9/8UXsFshCGT8/Twv46SRWSF5N9pMBKeTo/3uf0XMX9MXd7IuUmyrRoXq2YUraSaHMaRv2L1UopHdnubcnWF5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721891647; c=relaxed/simple;
	bh=AH9MPnXwcjFIyYvI5beVZA3B4SXJAwhkWPJ0PBaM0K4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AslTUVgTxYzbO97GvQGCoHbIs8uAL7P3jQFSiE32OdfyatLT9wimAvd5vRA7ltu9l4bcaLJEA/uq8+KHlEsZUrgtQPgTM5rgTOehfGcRztTzaH9c8phIrn6AnE4HP+dZVnYq4b6adGj5Hne2Ge/spD5RoYgUki7JTfGj34vrLQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XiggwWEX; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XiggwWEX"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52f01b8738dso435248e87.1
        for <linux-clk@vger.kernel.org>; Thu, 25 Jul 2024 00:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721891643; x=1722496443; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AH9MPnXwcjFIyYvI5beVZA3B4SXJAwhkWPJ0PBaM0K4=;
        b=XiggwWEXGABbJqgTw6xlI6t/azBmosXETnwYJFapYvytfTP3WI75O4nhnxdlHY3diT
         zfK4nAeoqT/O7q/PoODuIfWjoLZb24ioyeorHIGDi6v4pdzVoS+Vbfguy23SVigD+BdG
         pyo64sKNHpqY7m0j1Z4NntlG/n6PtP+iQZk6OXYe7MY6TBXm2XlcNnEAi17BKQcNQVY6
         x9vvzIu+E+M6JYmC3fDKz8NAfvT3KcqY/+b/+cnDWEdkJqsWIh2J25xQwS+6uQObvwJz
         583Lpp8FSl81WT8j3zz0vkgvbGII6E+d4H0VoLGepr57iioif0CM1lI8s2z0eU1O6NjA
         Erng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721891643; x=1722496443;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AH9MPnXwcjFIyYvI5beVZA3B4SXJAwhkWPJ0PBaM0K4=;
        b=hujZDW99DSIykuMuAE1iP/XZqX1H+VKt6tW/4evVO1qBBUlf4wRr3/BHJZ51Y57YP9
         3X+tnoKlj2/YwHlO2gpeVzpCS0TZLm81db6jEBC0QaLvMlke0947AYF+JU18eOAc8V3H
         DEK5rry6o2mY6SqHZLBOVjA4amN0sP1ci2htU0W+QU9oyULXAad0VwTSOO9R4hbYvjBD
         xVK+XXBd3DlXVxpV9nV9h8jl5eg7Ncf5MXwzMXLnjKlvanzU/RfgMahPV+lGVzEdOCQT
         U3ygoW2+uWiuzfS30slicCO57uzTm2TQZjPl0xL+XP4bZyAgZm/CbLtvOV2omKDAqwul
         Y8GA==
X-Forwarded-Encrypted: i=1; AJvYcCU+l1ekS48aGVMnr56ycYnRWiBna+o6qtkY46KHPGLMyrfeOZ85UcdWyT8xcZh2zXefzvpJ9y9vyj3Wx44NPYL8iAeJ0+un1pJs
X-Gm-Message-State: AOJu0YxaCkFh8F9klxq9j9lo22B9U4qOKoB8Yxj4ju37V1k5DDBWrkio
	Y4euC9MnzUPKNFqy5PeziXYOwOa8YYrAQ8orN334M9xoiFmkjNVdbkyOHI40pMc=
X-Google-Smtp-Source: AGHT+IH3gUGG19nPRevQcZ3s8hd7aQYxqwF7qT+FALLS7KJHriJN0NLfu5I762+j+gSizAv6avdUMA==
X-Received: by 2002:a05:6512:1152:b0:52c:d7c9:fb14 with SMTP id 2adb3069b0e04-52fd3f33b4bmr1248062e87.34.1721891643296;
        Thu, 25 Jul 2024 00:14:03 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428057a69c4sm19760575e9.33.2024.07.25.00.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 00:14:02 -0700 (PDT)
Message-ID: <90689f490cba6ea4b1bcd18c451630123a923f48.camel@linaro.org>
Subject: Re: [PATCH v4 1/2] clk: samsung: gs101: allow earlycon to work
 unconditionally
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Peter
 Griffin <peter.griffin@linaro.org>, Sam Protsenko
 <semen.protsenko@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 25 Jul 2024 08:14:02 +0100
In-Reply-To: <c2c2b51d30f551bf8a9c1fb6507301bb.sboyd@kernel.org>
References: 
	<20240712-gs101-non-essential-clocks-2-v4-0-310aee0de46e@linaro.org>
	 <20240712-gs101-non-essential-clocks-2-v4-1-310aee0de46e@linaro.org>
	 <c2c2b51d30f551bf8a9c1fb6507301bb.sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3-1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Stephen,

On Thu, 2024-07-18 at 13:46 -0700, Stephen Boyd wrote:
> I don't see anything in here that's driver specific. Please move this to
> the clk framework, hook something like of_clk_add_provider() similar to
> how of_clk_set_defaults(), and have it look at the of_stdout node for
> 'clocks' to munge the clks in the core framework for the serial console.

That makes sense, I'll have a stab at that instead.

Cheers,
Andre'

