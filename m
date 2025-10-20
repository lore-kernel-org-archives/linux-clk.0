Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB062DA759
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 06:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760943357; cv=none; b=mPZ2rRBFP8zDY+COyrdtydw8RePZgKB8sEK63CZcyHa4Ml09rTYN8u5yLCZTpEUzLPi7nLmdMm7O7VKCLS6asXwY+v4uFHVx1B8aArZzrPwVJHuKEU90xaivqrbQDqQCidqcHDanJTpCdgmC+AUz/lm+Qdrfd+msgan8oDEJnAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760943357; c=relaxed/simple;
	bh=l+qiMZCLW4L04/8hKzR+kyXDDTjgr7TGBBwRRRf2t6Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DWKA/WXzQFdFfwM5yskLjo0Da2GkMdh7OM+b97NKiqw1Yn4z3owBDWe6Kcvnfn4GPR6gBmaEwNuv3meCgG0+XnWhur4hafUFAodmraX7ElqvHSTQIXX2jC9Qw6CDTCm9zvkNxbJsA0eLdRpAFYx8hDcgHBmgIxwAqAEDQN2sMsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WVCYABZN; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WVCYABZN"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b43a3b1ae1fso105157266b.3
        for <linux-clk@vger.kernel.org>; Sun, 19 Oct 2025 23:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760943353; x=1761548153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3Ehpl/l5WuI0+wUrFaKCbuecKamHajwdDA896DUcww=;
        b=WVCYABZNh1kzR58tV6AZB3MlczhWERCJnjERxLl77XCC7yVnQUuQgSoeGcM/U2J0Ab
         6nYgXpHS2A+QR6jTz5jamMI4SxutrBQDx9JtBGEAaL1GYumioezGvjrCSUI72gcMtogx
         M9LQqL35IIVNXQIgxVLynAauZuwWNvw7ilBRYLTODn9goL0FpsSGr/rBZtlN+0+dhG41
         qeD4wy+j4DwM3ePJ0XofSDG5zet8InZdgU97A5FtqSf0qC8YAK+EGgFus5a+qIxJ1Fjx
         3SFhBoqV+mKhWQgSZFlhge+3OsmiqSNv2flCSlmMmYUF/9L0ual6oo5i0SpAbFNrbQu1
         ybXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760943353; x=1761548153;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3Ehpl/l5WuI0+wUrFaKCbuecKamHajwdDA896DUcww=;
        b=ha97B5q7UTI+pW4wUgt9uFmlvod8QFTFMHH3EjIaq+zrKFKeR9S3GROw4YgWdozYNW
         fpEt0NReuLjGSGiU3tEmOOB9X61ecUkb7rZw8W4wvodmgXeFxJkytardDxScM6yADeIT
         jCBwHb5fM9W4dJPPfPYKnm5f442aVghL0cLUs/KIW6lBXCsshSRVRDUSISjv+M+zDbGG
         /oZM78ZgZ3toho4j+dHeh+psOLNi21zpIJcIH2VFa6bJaCLjpWbrjEnqzt3FfTz1cms7
         FF5GVvJJT1+2IFPyjihLeI5zaE73HqsRLLEVgwc3095JSArL20teHAVUfjqx+MXbnFC3
         qzJw==
X-Forwarded-Encrypted: i=1; AJvYcCXax46UA7g+LVZpVT7D8f2fBMn5+rBakcw84iZhNemdPueTKuD6Rik4g5fu+lidQMnQAGIhlPep3As=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXv/zAHbKn9QcoptsGY0W3IyfKvDyvXNozcgOM9nbT93LcHrtR
	GOZtAMTrGcVlq4Af/LZVlIciXaWRyLmU1nxUsRUi4lIB4OIIZBjKWoR7PUXKtPlBrgI=
X-Gm-Gg: ASbGncvf02NKhqJ2LC11Fb2pVKQB/PhPuvJSWUpdBg7EOF+4SOUZd9RNg6Iqou3Dcpj
	bgJR7UBVvxAX5rfeZCIBP0l8LBaLvBqwIw7opF1Q0dYtvViEWwCwt46rxe1Xlu4Jtq5trZTrCcu
	8ULtC4UJTRo0MWaT0Fz7lmsNA5vSZgC5FJrPhm/ySf94OFQ4mhsvviHUO8k8N4cXQ8RG2qLs8oH
	wweXIoPJ/jOiVY2DVPfDRvgQXFZ9Fr70qViiT959fSqcL50OsaxMMkQnC5snksS6QR3fGo2k/Qz
	QF85LtMGWoamDPqHVeimQt5rvZKCPH15vWHUqaUaAwqjMiBruK1QdGAJjMx2GsfygsLSSAkCbDO
	Sx6dT19g3Tf9NnOHUBdIptvW8UjcdshUWG3/jCR+wEflF12QtSwrglfJmeMh1+oPdD5cse9dEOn
	TyGec3Uw17J4EWfIiFDLP2rRA/PCcusynhzpvxpQ==
X-Google-Smtp-Source: AGHT+IGTKKXPfeTmQ5w4wCnEeRSBRbYzpWHN3venhYhhsMPDOmR1qv1N3pYavRGP3cVhRdJ6rJ9Wog==
X-Received: by 2002:a17:906:c113:b0:b3f:5eaa:ef19 with SMTP id a640c23a62f3a-b6472c64147mr707558966b.3.1760943353147;
        Sun, 19 Oct 2025 23:55:53 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036a3esm711731466b.46.2025.10.19.23.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 23:55:52 -0700 (PDT)
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
In-Reply-To: <20251010-acpm-clk-v6-2-321ee8826fd4@linaro.org>
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
 <20251010-acpm-clk-v6-2-321ee8826fd4@linaro.org>
Subject: Re: (subset) [PATCH v6 2/6] firmware: exynos-acpm: add DVFS
 protocol
Message-Id: <176094335134.18498.14626588240652120863.b4-ty@linaro.org>
Date: Mon, 20 Oct 2025 08:55:51 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 10 Oct 2025 12:46:32 +0000, Tudor Ambarus wrote:
> Add ACPM DVFS protocol handler. It constructs DVFS messages that
> the APM firmware can understand.
> 
> 

Applied, thanks!

[2/6] firmware: exynos-acpm: add DVFS protocol
      https://git.kernel.org/krzk/linux/c/84a222d1b369ba83f8947948670f775367e653f1

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

