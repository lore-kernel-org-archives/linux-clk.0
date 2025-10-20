Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAED2DC328
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 06:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760943359; cv=none; b=UaWma2MzOHY3vc/DmsYlrZn2wVBRJUGcZC0/70kS51m1hEB4Jm98NjAPc1PI89MvMP3MiIi/dSmWfillRmAmigiOxd3x5tWR7zuIL5/9GxkcyBuZ02cJQbHBiYUDJP9OlMvwaVAvq1oIrreDGQTzpCd3v/qJVVVjkqxm7EUvYD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760943359; c=relaxed/simple;
	bh=mecDzN97h600ak8xyTQUYCNTdSnUFsMCyfQwupMXyXU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hutNaQEvB1kP7/I1PLuzM6hTsRz3wby9cDmjuqE0a/okZkarWttWY6KSuEYWHJ4xirrbRY660+zqgpY5KRyTEkdPDvL4udtcC6UG2wEFSaI2qIILn/HO5Ph/VIHD+RSRgiYSrVoVImikhq4borQmUl0XfLaDtJ0yzwYjl4Wjexw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tic0+zRJ; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tic0+zRJ"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6317348fa4fso673001a12.3
        for <linux-clk@vger.kernel.org>; Sun, 19 Oct 2025 23:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760943355; x=1761548155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jaVK8QBoBqs9ihl8Ihmd+vajoOav06YKNVafHor6TD8=;
        b=Tic0+zRJKoBAb/XOsggVV821SpszQxvsXVwov31kOsGDq8k0uqQYMvu2ZJGImPszJQ
         id7siSBnNlKG3g5tSAbFtaOTxmpGN44Ae7KBZH+bGcdHBnO4psh39BzCusooun+9FZzi
         Lmeuiu6Nm19craV3LUYyu45/Ou2kJpq9e5CYz/rdfneU0up23o76sP89GBCLqXOJi3S/
         E1RvAPJByDegVRch8EkxrhdhHXk8DzNcfCdLqqaPB826gDXGk9p1PcZ5k6VSE+9xHsLZ
         1cDRSVbzuIbm7r9AALGCzYIuSsmqKAXcY8CAsSrQCLUQIrDVUfzKMYPScPBgamswynZG
         xA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760943355; x=1761548155;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jaVK8QBoBqs9ihl8Ihmd+vajoOav06YKNVafHor6TD8=;
        b=m02d26TfU6MnjaD0aGYCd6o2KnJ4mT5h5FxgohVFcQhrVun5pFjZF5FET99RzKhW8F
         ZA6MLvOv83zdlCjYfMueUB4IiJese+1P3PnEWvFzgTXxTXeQTmv31qcf8XEPNLx5RTFY
         Ww2fEdLfs105Ar8i6Io3Xqsk6Vcma9SRc2QwGvAZfvpD4QeDmWZjSGPVraulr1Dy4lZd
         Zi3sioi/KTjvZDNhKxU97UE6AKfD0Xzi/wmFRmC+hYE7jBbXT+qeYombLN6Ay82Y4on/
         SXz36E3yrexBerMFMuk6mp7PP/MRhEtUqcLK0ZFEMMEP4Xen8hBx8vSWblkcPuCClpQK
         yNAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaD2hv62G2dwvV3t68+iPDs5hckoTav+M8iV0POWXjxOUYw0TGCeSrgcDBNrJZXhJcHR/1vuP1jrk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzS7bYPgUVhzr2Q2Qeb4B+6Os9PNcYsNWsjYtFg1kxXbPQFmKEE
	Di94zrPXb5F+4zGR0hBJCp5AJaTGkmlxkRVTwwqeTp9CFnhX0fVS+F4NkpafWo4dVHg=
X-Gm-Gg: ASbGncuhRAboUcI3JVCJEBvK8UsfPfSf+GCHoLzXp06LmZD9nZ+VgWrRLYwUrJc+X9Z
	3otWT1zCGReL/CFNreXpCjVHKNiLJ8tmYoLg/slOTZYqyFbGPO/QDhqcqeHPeL512OCOO/bXDBP
	10PJo6ajtYGw+F0Vl7RQXk9bVtGXAVgjGgCec9RdsllG4PAw6WqjgZ48K9URFpOFSTDHG1WsU0o
	7Pag965bq4wrihMU4co/lrqGKtrZ0KCLakvOoDHhDIOalQM/FyZv9f7UZP1Wr2z5ml2qJXGIq4q
	/uvUsvSvSrnOJSXWUQsbp6mMWYmzIPnVyIiTx+khFgZPCuRVefB/txJNCAC5G8/ztxbvEJ199Y2
	VmTwfezUaMZ3DErZT8C56ySm+n2o/YMY8KNjypSdZp4jiPcMCFiuZE8rPit5mLaHiuQuIOajzTh
	BgUN1IolqFc4iWf3OSJJlCHsdU5e0=
X-Google-Smtp-Source: AGHT+IEACXSl3jMi8mrVrI9HpYdMwelIyG0kqNi6i/MEHpYubXK9Mls2weDpSKYlpFEBDaF0smnKKw==
X-Received: by 2002:a17:907:268b:b0:b3b:44a8:c64b with SMTP id a640c23a62f3a-b6471d45511mr806758766b.1.1760943355217;
        Sun, 19 Oct 2025 23:55:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036a3esm711731466b.46.2025.10.19.23.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 23:55:54 -0700 (PDT)
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
In-Reply-To: <20251010-acpm-clk-v6-3-321ee8826fd4@linaro.org>
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
 <20251010-acpm-clk-v6-3-321ee8826fd4@linaro.org>
Subject: Re: (subset) [PATCH v6 3/6] firmware: exynos-acpm: register ACPM
 clocks pdev
Message-Id: <176094335329.18498.4540786180572368152.b4-ty@linaro.org>
Date: Mon, 20 Oct 2025 08:55:53 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 10 Oct 2025 12:46:33 +0000, Tudor Ambarus wrote:
> Register by hand a platform device for the ACPM clocks.
> The ACPM clocks are not modeled as a DT child of ACPM because:
> 1/ they don't have their own resources.
> 2/ they are not a block that can be reused. The clock identifying
>    data is reduced (clock ID, clock name and mailbox channel ID)
>    and may differ from a SoC to another.
> 
> [...]

Applied, thanks!

[3/6] firmware: exynos-acpm: register ACPM clocks pdev
      https://git.kernel.org/krzk/linux/c/bad0d1260b6dc229657b942400c5fc4f257f50cd

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

