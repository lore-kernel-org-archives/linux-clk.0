Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C431D1E0090
	for <linux-clk@vger.kernel.org>; Sat,  1 Mar 2025 14:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740838416; cv=none; b=IJcI6fQcPjSUdpFQmhiD4SmGSItK01t+46Nvi8gmMvtVQueAYM34JDHz4B+SSNF3cV1hPmusXO9Oo8HmGcQiOjb0V9y0DvOKlk+FEIneo6R0S0ETX9rn788gmPe53wnTrH+/XGnDgxqEEiFGDXTuuXyMYEoT9UI0sl643w1+ass=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740838416; c=relaxed/simple;
	bh=d50HSxD/PimQmQ45XW3+Ssx/aRWrlXekJzuR2G9oxOk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ImJ+fP2fnKvIolIpZaJrDM3qBoKUnWtRo0Yy27aVrOkpTiYKZ9DduEfGeJIGwXg+W0UYDx86hLkjDvPzv/X0641q9LCApsHuOviiJmo1P10XTYd05f8A19XojUZsC9JhWSUFPbrBEp0iniJMf9W2RWkKZXNusUJBlOjITwcfXlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qhP+mQhd; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qhP+mQhd"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-abb9e81c408so66872666b.2
        for <linux-clk@vger.kernel.org>; Sat, 01 Mar 2025 06:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740838412; x=1741443212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B6+VMXcyt281MB6S0PILXj/mc3+AiyRry5Dl88JFAmU=;
        b=qhP+mQhdLTmkv9Ku7kQdEZOo2vx7eIDcFaxyctd9gwCcSJOz1CsfudQBDnECcPjtZk
         KrS8MxElReSfdG8JA4gWWGEuE1m33Nri1WoPsRqOzPt2Mdtn4Ak+zs6/LkHIoE5T/UF4
         pioTugZMIxyRA7qEuN/pEPSBeX85d7a6iT67zJ2cGhxJJIDQghq7lpJIw5K7Iff4riYc
         GEIMmxJHH11vgX40J0QO2arOp8kYU3rlFfhCxRd1VHs6uVr8hwK171EJXv2tMUtpkv+r
         bWEcjQvv0sI5XDDfw4nxxADTN+Gbux/bFJYQ9+2OVakO4yLFVi2Giqr0/ypsdO0abMOS
         ob0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740838412; x=1741443212;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B6+VMXcyt281MB6S0PILXj/mc3+AiyRry5Dl88JFAmU=;
        b=U5G2V7vqEpOmkAI3K9nkIobnjAu6ivPMM/lujtlmw+en/uuGqcuInLlE9ChaUNfTDP
         migCASvh6kRaRNPYfypQ2K2ZCwH6Npe816IqgQNxwskZN2PGpp6maXSBJSrMA33/zssM
         weVnFgSPzYp3GbuSAxpNtcuTlosMtZY1shy+eHp/9cKU2YvAcchjo3UYIJ7+FR4ceEAL
         uA0sEY8aCNaYNS+jpXSJsAJodut8ihC6Awv1eWNch5j2h3UlhAFeeQweOKbE0gTupLe0
         422VNBdq1afkHaTln1cG2NaX8cDO1CA10CliDuqtrIBi/NaNAUpFY3WMgRoEzMRZbPCg
         KjUw==
X-Forwarded-Encrypted: i=1; AJvYcCX4j9UYkbuJ4g5Zo2/pelbQh/H4SZ3e+Y5fsYN4J/Dn7o/o1Gtx5QlyJHnC7ZnqfBVUUftb6R97xbs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxLEAwruOr+qL5tS1AVcj1ovFZHiiJUTOGtClO5s3ChyJeStbh
	1M5LgGBxP4LfAjau5wI2DVbObCj+p6Lwop78ZfzrXjSOlyLEeP23Osm5hMjgTmjPvueoo6svPt1
	sSkI=
X-Gm-Gg: ASbGnctnhFaKW82zQyPFe1oAEyIpiEmm9S5F8ayXxB7PV9zAnPRvFMYaPsqg03E49m7
	RXeWu8lUMU5bUEQ/yxL3q1+JH8i7CM+017ifrMdqgNCetIjjwBiG70nFA12iCuzi/pCF6kFcmX8
	aDPFMK4/hgqkpSCwr9CHRZStQf0w8fDY6WdSvapV5Tj2GjT3cs/syL9gZtl9KZ4wlzljbZ4TNxg
	+jGIGMUSPmKQmR+74srlXrvcEnRb+pA5VNFJ/aLeGTZ2GTI5g1QjZoiV/rA2z9KYHalFeLumD24
	xFqm1FAQ0KTuSUSUr06XhdimIe80s7Pj1zTgxZ0GjI8VplKEPtrJla+ldLPb
X-Google-Smtp-Source: AGHT+IFpPIcRFdEEfoNRMXs9IiWLSrC8PzKuk8Eq3BxzR7HGMfJRXaPfAjNFS/RvB4XMH80jRhalrg==
X-Received: by 2002:a17:907:7285:b0:ab7:cd83:98bb with SMTP id a640c23a62f3a-abf25fc79abmr339769466b.5.1740838412580;
        Sat, 01 Mar 2025 06:13:32 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0b9cbfsm485532366b.14.2025.03.01.06.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:13:31 -0800 (PST)
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
In-Reply-To: <20250223115601.723886-4-ivo.ivanov.ivanov1@gmail.com>
References: <20250223115601.723886-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223115601.723886-4-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: (subset) [PATCH v2 3/3] clk: samsung: introduce Exynos2200
 clock driver
Message-Id: <174083840951.17657.11144069313199701338.b4-ty@linaro.org>
Date: Sat, 01 Mar 2025 15:13:29 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sun, 23 Feb 2025 13:56:00 +0200, Ivaylo Ivanov wrote:
> CMU_TOP is the top level clock management unit which contains PLLs,
> muxes, dividers and gates that feed the other clock management units.
> 
> CMU_ALIVE provides clocks for SPMI, the new MCT and other clock
> management units
> 
> CMU_CMGP provides clocks for USI blocks
> CMU_HSI0 provides clocks for USB
> CMU_PERIC0 provides clocks for USI4 and I3C blocks
> CMU_PERIC1 provides clocks for USI blocks
> CMU_PERIC2 provides clocks for USI and I3C blocks
> CMU_PERIS provides clocks for GIC and the legacy MCT
> CMU_UFS provides clocks for UFS
> CMU_VTS provides clocks for other clock management units
> like CMU_AUD, which will be added in the future.
> 
> [...]

Applied, thanks!

[3/3] clk: samsung: introduce Exynos2200 clock driver
      https://git.kernel.org/krzk/linux/c/11fd259b7a9c386179f4bb9657c7597c8e8de067

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

