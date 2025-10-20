Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F19C2DFF13
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 06:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760943365; cv=none; b=h2L/j6JVwnO0XXkXW2tSSI9pauNCIAyRLDjQe/Ad/3q8v04/zZxJNwvD6rLGtOjk9iKqbh8UcZ0j6ChOewHv0pb+Q2IWhILAvp10Ollq2AJNEwfC9aj0+B+jiu5rHb9U3VthqQsUt8SMeycdgntk6jQEDD2yRdsZlR6ajcSbO9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760943365; c=relaxed/simple;
	bh=z/nKAyPM8Gl3KMi0qkV4zPK4PT1ivqYkvCn2i3d2YbQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DhNobcbnSvJYrM8bKlBFXNM67FGRUDZcjW8xG0WHhSxRVdLUlYy97YTpuBgh1q2Ppu8YkoSpEi6HvR4bZ+hEO6bEKHxqNh4Srn5kjApnNb6YbrsuC9hjXiP2k90Lv/wgtkNjSjCIt2gwjMHO2p7N20xx55cJFKY9H62BZ8XpRCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qwco39ka; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qwco39ka"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b3df81b1486so76216366b.2
        for <linux-clk@vger.kernel.org>; Sun, 19 Oct 2025 23:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760943361; x=1761548161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A0DnThhMkOfv9YGDKUQ7VwqLvt/fY4Aetr2LPisH1YU=;
        b=Qwco39kavjz9il7ru8MtW5CXU9oQtMYm3H1N/9YBxgXD/W4XxEhLGKfOUf43SgT1i/
         RhfavRnP0oMO2Y20DDLK3bAdyoIJfjf5TUhitKoRcTSDsdb7VXHZerZNdfZw/tahdEFQ
         QnVltwZOLNuNigZKJUIaODhua8QhjydxVTnra6CIUiZDQpHARxZbzB7UiIYWeLkPixdo
         HCsuzc9+2ZUtfB+XaQsMgfB05FUZ+j+3NYzL2/HniY3xK6FXNwubNxQH0ToORTIWHr2v
         JpAgrTrbY0CcDqhZtd+Bhcpkm81szB96F80Jctt4G2TV/+1VIGFXsCBWDlOeWDIH0WfA
         PSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760943361; x=1761548161;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0DnThhMkOfv9YGDKUQ7VwqLvt/fY4Aetr2LPisH1YU=;
        b=jgziz5/IlZiPBeICnNyjS7DjpIqf7/J3VrZPePm9gF1zKstvWxfqsZpjIyjXjtPPaW
         jh6xCoeS56gguDKyEKWhaHpxA+1dejI+8/m1dc0MwiXuZnYqzVFlkdl25GHC8hUALdCt
         VGq6kdXwx+u6Qe3YkihiMSXhkXe1TfpcxAz8doJIKUK56NJWPMfu1g1Cp0UU2IbbNWES
         HkDBax1SLe7s8XSc96z13zbSJPKImLE+hyQu78vvQYNqz5SKxUMC/tLD8K12Jr1kj8ED
         FYhAJOVzq7lOAaZGgmOy8K2P9TZyeW4OYSFoz8e46D0PJ5fgQa0Bk+3pBoEZbHTP8q4q
         I99A==
X-Forwarded-Encrypted: i=1; AJvYcCXBQG8VeazAfRctkEoP9InnuL7C6MlF5OzwqDkpCde+gmDwcGLGBt3/6g1w9t6pzlugIXw79SV6Qxg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdY7roMz9fIE24LLrTdhpfODTDERLOblxpJU1vJ+wpRhmYtuyB
	zm2sXHW8+pQEFY+DsigUKyZmxmF1C4uIpVD3Z5PldbBJhnqf8SrFve+ei3BVDYPEZIo=
X-Gm-Gg: ASbGnctKPqrhRq0bOMBWIzNFXiAoLnarW5pDq34Jxuwdum2BFw+5wbYryRHMjnZPP8K
	h1dfLG9C3uzw3+3zBLMCL49gvU3qxfANnM8vBYSS26hRS3P7OrkAohMEAUTSaGYRPj9vRZT/zIo
	2YsWj9iSC9taIiuwMQQXJYcxKaYpxj2PM1yjyU9QBf1XTNi2tdQON+Hm2FT4/hZOFbuf0vS1ktc
	/RM1OATy+BpnX6i8jdUVEdKoHGmC7XJ8MXun9gUDO9BscbHcWqwmA28MOLjCz2eTVnlnSFCLck7
	XOuAxdVT2OGWRLdKmYBX00TuJokicao5xf2ISWZqdBjyrD6WrjdkVX5AeFMoXM4vTXvVoyMZIAJ
	LcB9sHl+UZ2cQjjDg5mZWcUPfv7JNRJsN0p2644hgDujFNMXxAQqI6LfANwnpbrR4sdZntU1WY+
	UH9Q2EGzuz2xRci2iT
X-Google-Smtp-Source: AGHT+IFB6Ey5I5GEPVDKYwQBF2ZBDxVATO0+MlEz4wW7uv+BJczKh6T6QMgfi5LUYg/EAYYZmtjQvg==
X-Received: by 2002:a17:906:9f86:b0:b3d:5088:2140 with SMTP id a640c23a62f3a-b6472353d0emr732095566b.3.1760943361476;
        Sun, 19 Oct 2025 23:56:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036a3esm711731466b.46.2025.10.19.23.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 23:56:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
In-Reply-To: <20251010-acpm-clk-v6-6-321ee8826fd4@linaro.org>
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
 <20251010-acpm-clk-v6-6-321ee8826fd4@linaro.org>
Subject: Re: (subset) [PATCH v6 6/6] MAINTAINERS: add ACPM clock bindings
 and driver
Message-Id: <176094335955.18498.10975479866423717961.b4-ty@linaro.org>
Date: Mon, 20 Oct 2025 08:55:59 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 10 Oct 2025 12:46:36 +0000, Tudor Ambarus wrote:
> Extend the Google Tensor SoC support list of files to include the
> GS101 ACPM clock bindings. Add the ACPM clock driver under the
> Samsung Exynos ACPM Protocol entry.
> 
> 

Applied, thanks!

[6/6] MAINTAINERS: add ACPM clock bindings and driver
      https://git.kernel.org/krzk/linux/c/ad97aba3e64f8e474ecbce0c4e08486023ce8ab2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

