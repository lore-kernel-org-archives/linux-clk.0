Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED3C1DEFEC
	for <linux-clk@vger.kernel.org>; Sat,  1 Mar 2025 14:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740838406; cv=none; b=uWdiaGiHhs/5bzAMCswP4IWwCDDGjSjYz+1c7O/BxjdoFz6Bvk8srrFj9lFqdrb5AHX7ihjwuG7XYgDWEEU0y3BuwJ62AMak/V1gUOmlJyVNhLpAc1aesfrQESGKaUsEttrwKX2hYh4bSadlYcaQ4jsVfouYWvGMbBu5uLQ8bs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740838406; c=relaxed/simple;
	bh=jiT2JUaC/QAsy28BOMROpUvqNfVZo9Bo2xs780cMecE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EelQ8S1wB/bfSseUlh97zKlqIwT0Iwejlc0eVTI1er/qNKjpLMfXT2zfHyAlr3Qcht4VQdyRGbioj/8BClAvEpFO0gnW2eapjO2cVfVZX9Gec8VvmoqxkIXbcRofw+S39LcTezuwyUSixlXqobxdR4v3oX1nxT01qPBoMRsYXzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IBjpVbat; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IBjpVbat"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5dc191ca8baso588770a12.1
        for <linux-clk@vger.kernel.org>; Sat, 01 Mar 2025 06:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740838403; x=1741443203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIMmXa+05o7cFUzmMY0oE5JLkS5yaur+8NGSr9bhuis=;
        b=IBjpVbatbcjKVLmf6CvUmzmS+uHgTWROXMEu3RIB/VmsnvYnDVGxWpkGvq38uQtV7Z
         t1XaciXjApqJai78XgeHW6H2uNFmpOxaVR0zqxuEcTFoWvlSzP2teiHDrdVaMhm3BcDf
         CpRGpTXNORHjs6N2jV8Q5XKLuhjOkBeNOuSRVMzoOT7Wg2cMyp8EtkFVdkLOW7OdkQYo
         YRI61pGaOyDYXka2XLFfSBs5trPfH+9n6pFSfBp1X9Y1P7ecNId3ajouI2vQQchVTXhy
         DH/FI/aRiN/+Mkp4AUscWMzrXq8nolB6SieQJdHiSCBfpKIZ1J9KmatpcVid/noyUubB
         V0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740838403; x=1741443203;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hIMmXa+05o7cFUzmMY0oE5JLkS5yaur+8NGSr9bhuis=;
        b=rs+zuDiWL5g5RA9ZlUUe3Pe7rXRShPCZaaslPQNhmmHYxOiI0YN1rzknk8oFeaeyi2
         TK9iQ0IBid+7PLcKn7uvt8B7YFXNIsueMaRI036G6232YAe+YgAJq6GsTJvI7zrm2iM+
         KQN/+6m2SMEjS16FcOQnTgySXjo+p3cAAqShU4Brn0tUIk1vvikEjKob6ana+cuck5E5
         QOFNJY12zYdzhOf/JBKX77Wcfc4BUSs9/Qmwu21/iKVI1hsa6gwt7PILWKGRgqBCxxGy
         MH3sodsOo8xIAdZY6BWK5NS7mQW7qNpoK4v1hF+Ol4rxU+jVgfRNyJ7r+QQGmEXKRK61
         /BvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUPPjSrWAp9rjEzinh8B3KaphFq+yc5QApADrwM40vyZuJg8U+RDzvI7TdC6Yn9FKjBf9SLd6ytEo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi8rfRAhnSBj5PZMM4Zb/h7DcBIs3CxkhNctmZShIXsCq6KqgH
	BlKe22EQdeSTHh4zDAuaCKwnkJGceIbib0Vdqs1KcF0O2vJVw8Vc854E7+++l7O5vgADhG/QzLA
	gQPo=
X-Gm-Gg: ASbGncv4PprtGj3LOdaYc3cLducrR/F6CSD0MJFJGPtW7IzPdBs/pKNuwSl66iNP1O7
	h59fkLgbS+6xIn1DsWGjszAU3TZeic8bU2tDMC2aIwD9YJ3SiQiA3QIJgn8GjwhgPylhNtyYovX
	xiO15im7INahD6yTRwNve8IaiMXXpDxoKCaM8YuXviqStapYPQy4tIxFrwDqP5gDkpJ2VHBCzRK
	ZQwgMFrbE37kDHEGCQ0UnzQaGtRRG7tXPntHwrI/FpJ1mdGXrU8bEn6sThmZNTt1E1jKPgeJYEP
	LM/VBXwqSOaxedCdLyObMtb74H79LV4qzjVoIAdO6aYvA743Js+qm3N1seZq
X-Google-Smtp-Source: AGHT+IHamdT8SxBWV4TfuLdPou3W8IVb0ZsVqTsHbzvccKkfVKbSEv939NC7kdF+ka7ZD+Wv5iaqLA==
X-Received: by 2002:a17:906:d542:b0:aa6:ab00:7b9d with SMTP id a640c23a62f3a-abf27360ac8mr179019166b.4.1740838402656;
        Sat, 01 Mar 2025 06:13:22 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0b9cbfsm485532366b.14.2025.03.01.06.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:13:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250223115601.723886-2-ivo.ivanov.ivanov1@gmail.com>
References: <20250223115601.723886-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223115601.723886-2-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: (subset) [PATCH v2 1/3] dt-bindings: clock: add Exynos2200 SoC
Message-Id: <174083840012.17657.16502862587559253626.b4-ty@linaro.org>
Date: Sat, 01 Mar 2025 15:13:20 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sun, 23 Feb 2025 13:55:58 +0200, Ivaylo Ivanov wrote:
> Provide dt-schema documentation for Exynos2200 SoC clock controller.
> Add device tree clock binding definitions for the following CMU blocks:
> - CMU_ALIVE
> - CMU_CMGP
> - CMU_HSI0
> - CMU_PERIC0/1/2
> - CMU_PERIS
> - CMU_TOP
> - CMU_UFS
> - CMU_VTS
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: clock: add Exynos2200 SoC
      https://git.kernel.org/krzk/linux/c/6662c09c0ddf10ef97b430533bb9e2f0a8fbe471

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

