Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCDA14A4D1
	for <linux-clk@vger.kernel.org>; Fri,  3 May 2024 08:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714725354; cv=none; b=h95GAXG7qgThU+RDkcmEt9+X5p8voqrABh+bdBftHW4mW6Rx0wUiJDFtDFkQH06vHtbp7CSZ5TuZGVVseon4Zku/bdsRGNEPWN1mB0nX8FEA7ayN9apWRr5jLU/tpJR/Ntcb7GClLqEAU2ZEEiemWfj23leNgIpCzkQUfydvGKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714725354; c=relaxed/simple;
	bh=9O/jNqh6RwmgdZzcMSapBkNN6fAwW++OTzSrfYouXXo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DN2utgurLp1t1msE5Sx7/Xw+vE0pg5d8Iel1YHo53BX7Z7tC8yNvVWNko5pLgJCmp0U+VdK0pVuEhWtGOsyojqLjBs4mhTpoOoGK5wYf9JpkCbKFUVw+jHqf2tP4HuTGgAl1nCerWklwzqWs7P3ekMFymCedjg1XvLvfl3ayz0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZVoPWxH8; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZVoPWxH8"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-34d8d11a523so2021837f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 03 May 2024 01:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714725351; x=1715330151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iTVoaXYQmknTRotS0tITeOIG625SY8vKLkmu8tNzGoo=;
        b=ZVoPWxH8hwls600Sg2o+HgrsHUQsCEgd4gWZhggJfru1zKMWNxw1KDBQwfNivnyrFA
         jacFR8YavHYMUSPMJlR2tDXZ3Lz5RWILgVTv533yhQuiBorHOG0LUZMWLN/wo3D/eYt6
         ZxUceEI93CbA8IDuSnfEA2SxlY24PyF50F3jmir/JVh4ZpoCp/NLXjNzsWAdXZJWpzcS
         qXy9ZcyVZzFzV4usUPlk2vw3aAh3Ld5EAp0X4YgXC266lCftFFf5gUCTBSLTKsEa0AYm
         /K+0lCyll7WEzSiOsZc90OZSR5NCB03y592w8QkRiS0qOfoQ/hiP9DbA66F/fx2tyj6i
         e3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714725351; x=1715330151;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iTVoaXYQmknTRotS0tITeOIG625SY8vKLkmu8tNzGoo=;
        b=dMMaHNA81FKmmXzkRF0tsbgScj8UxByjJzOqJStYTef7+wA7aVb0sfcTQ3ntgCFxDK
         Lic/38MXyaPzgg9wpXPOSyWu1hUcdi1mvPwE28bdqUETYExnlVj+2JZmIvyvzPv9oezk
         IqMlQPK2aSe9eX4BMu/52t1K7A+smSIBmNAB3SOBSHZuY3lcWQO7jIK2NApMN5Hi+glb
         116i2vFnkwIsZJ25IJqITgsqcvqiE5hmEI9QlEDKnEBg2Sc13KGLMeGSLj7kWtb5xnG6
         b1fIFOD4v4tFovfJU+ySwpn8o05AWH9hZ46cTdtZNAn+PvP3D16yEwtGCBuu8uVbMxIU
         XZeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkuY+ab26e+qZNMBA0HLDxifouoaiXt5lIeZFpeFwgyBr8OqhVuRmytjrWR5lOBp3ciAmnzCzzIuK/QRI9dp/+xqkR3JImDGpc
X-Gm-Message-State: AOJu0YybguRAumAKaIlX618USpR9x6I6Y4UE1IxLs4IjxGGeaN344puo
	OoODqi1rPROHx3UZ4GfiCJsEYbw710NjUqliALcDTZxU3OeAvfXO6YHvK1rj6RI=
X-Google-Smtp-Source: AGHT+IEaH132tk7uwiYiRvUBCXYBTDRxXpWqfkCiUIhl2McL0yL4H6XUTvSvhKnOsvbYovTodugoeg==
X-Received: by 2002:a5d:526d:0:b0:34d:2447:9f8f with SMTP id l13-20020a5d526d000000b0034d24479f8fmr1381314wrc.5.1714725350966;
        Fri, 03 May 2024 01:35:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id dh11-20020a0560000a8b00b00349c54d6cefsm3171986wrb.54.2024.05.03.01.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 01:35:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com
In-Reply-To: <20240430-gs101-apm-clocks-v1-1-b2e2335e84f5@linaro.org>
References: <20240430-gs101-apm-clocks-v1-1-b2e2335e84f5@linaro.org>
Subject: Re: [PATCH] clk: samsung: gs101: mark some apm UASC and XIU clocks
 critical
Message-Id: <171472534930.18059.10164022477086463014.b4-ty@linaro.org>
Date: Fri, 03 May 2024 10:35:49 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0


On Tue, 30 Apr 2024 10:54:59 +0100, André Draszik wrote:
> The system hangs when any of these clocks are turned off.
> 
> With the introduction of pinctrl clock support [1], the approach taken
> in this clock driver for the APM clocks to rely solely on the
> clk_ignore_unused kernel command line option does not work anymore and
> the system hangs during boot.
> 
> [...]

Applied, thanks!

[1/1] clk: samsung: gs101: mark some apm UASC and XIU clocks critical
      https://git.kernel.org/krzk/linux/c/6b32d7474e9b833dc7fadc1b4d4f08af9bd87fde

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

