Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCC5126F1E
	for <linux-clk@vger.kernel.org>; Mon, 29 Apr 2024 17:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714411809; cv=none; b=Zcojfbb/U0hJ6e6z2idO97ZbVckpQaQSBXiOKtAqXyu+jNS7TkW5FKRuoVpbki18KO08cEa5NFFT1+xI+VMRP06oulVyUZgso2xyWx0byNJE8+mMuho7q6I0ejCwnRiWjVVH0ge4QN/7XiyCw3ajySrbSeXKrjPMr1ezRvrMVh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714411809; c=relaxed/simple;
	bh=8EHP99e7hsXMLGC4Iayh0RZ2xfvUSAj3zXoCNKf6PWE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fScXRUUFz7Ca5JSmuhH0gp730dGBGqWyF3Yw6C6UFh0v2rnjqKkXvnNM5GGjCUCSYNkWXrj23hEYc0XSdZfuEjVETzBTnHCfjfEfF72eZXgNPUV0sCp2tYCHsnBjwiHKh725BWWgx2ZBFQZ2XEPb2EbZ7ExFKiAyUK51Vrdo5ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NLXNKRaE; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NLXNKRaE"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a58872c07d8so1018771366b.0
        for <linux-clk@vger.kernel.org>; Mon, 29 Apr 2024 10:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714411806; x=1715016606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bOJClRFltjtPH5SUzDMPzw+EqdHrKO6L7RF0pIQ+iT8=;
        b=NLXNKRaEbADt1NQWC/qPDBnRwOqiMXQsv3Xei0t9zJTsnF8Hmy11TaTjgplfRHPRr5
         BFD3JQkw70Hyo3cZvl9CfQekdOHGM9EVmLhvKtmo4sHuxjf9d3V9Hpae2cLvRDIAZNYH
         imWtij4krSk76JQHVDBo8sZxffdjpUe8vAZET3yXtYcAVTSMPaztvrZSrC3DCRSvC0sO
         Ez4Z7AVo5tmhd3U6gavlkYhcfHQ14FaZOkSmQw9Js2vY7hyKaz7DskZ0jDZ2HNYyGbzg
         k9MS6JWyh2sH8Y6TxGhfGdzqFEBvi3H/rBkI3Bv1/419qYTnxfcOD1tm4io6vRkUAptV
         ISaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714411806; x=1715016606;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bOJClRFltjtPH5SUzDMPzw+EqdHrKO6L7RF0pIQ+iT8=;
        b=M9DV94dLCeV7rdoOaV3JkGD7xacYzTy37uDPDJHh0eEtoH2Ic4CkqzRfujCtPEVnCi
         XnSD/Q6BRAEXzluCPCNVoahQZppxDOWn+CMffdP3WPl36IOYJQYb/+ceC1xo0ViOmoLP
         Mg9wAPPvNZdKwp2k9t+5OK/wYSoetYh9ZlkIOeW0k3yZgI2g4C5BllDCWnuxPvAwiCBC
         BwmWdRiPHaM+/KrhgdPJCw6GfbQJoeasAo56ENP1PEHv4FCRjPSMIgIW/aDex4MHsf4e
         hMXzhmyfuOOvHbVHKXRdQo9CQ/5DotXoD/7Hvi2A0hwOTcQ3qAWmgKleZalBpBDI4aDp
         5W4Q==
X-Forwarded-Encrypted: i=1; AJvYcCX/Gnpc4ZfGSgIrbH5b/uNkb7Kx/BCsgtTsxQ6mB9qcdkJTOklYSuykm0PCn7gnST/SH1uwXOA3GUuBAvkYbxrFOQ3aZ9zPaPVn
X-Gm-Message-State: AOJu0Yz9TNZZNUZKWKx9TbTDyC+aMf7oaVx2VnhomNwnmyASj3RfmuH4
	0am+b6I1Oxg6ZYnM+qJn1Q+UdQ1MM/t6CQdocsUXNnqwRpB8rPDVNl2fUH79eg8=
X-Google-Smtp-Source: AGHT+IGvLXAzPiDmB+QWdQvxuqGMBFem9tfjCLoQpPn3fdeA8/2TNd6VA2pHq0l426lZdX/DEEPZhw==
X-Received: by 2002:a17:906:4112:b0:a58:9899:89ab with SMTP id j18-20020a170906411200b00a58989989abmr298215ejk.22.1714411805842;
        Mon, 29 Apr 2024 10:30:05 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id x10-20020a170906298a00b00a58ed644d6dsm2770173eje.127.2024.04.29.10.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 10:30:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240429-hsi0-gs101-v3-3-f233be0a2455@linaro.org>
References: <20240429-hsi0-gs101-v3-0-f233be0a2455@linaro.org>
 <20240429-hsi0-gs101-v3-3-f233be0a2455@linaro.org>
Subject: Re: (subset) [PATCH v3 3/3] clk: samsung: gs101: add support for
 cmu_hsi2
Message-Id: <171441180364.306855.10761459860309658442.b4-ty@linaro.org>
Date: Mon, 29 Apr 2024 19:30:03 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0


On Mon, 29 Apr 2024 14:02:19 +0100, André Draszik wrote:
> CMU_HSI2 is the clock management unit used for the hsi2 block.
> HSI stands for High Speed Interface and as such it generates
> clocks for PCIe, UFS and MMC card.
> 
> This patch adds support for the muxes, dividers, and gates in
> cmu_hsi2.
> 
> [...]

Applied, thanks!

[3/3] clk: samsung: gs101: add support for cmu_hsi2
      https://git.kernel.org/krzk/linux/c/093c290084a494844f1650e70755b8912292ee14

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

