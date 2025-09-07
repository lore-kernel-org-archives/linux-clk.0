Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C5C21FF4A
	for <linux-clk@vger.kernel.org>; Sun,  7 Sep 2025 09:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757236450; cv=none; b=tIBkSSbD9kRCDJhZDN8JY+/8kbjLK6TUr2fTpXhpuYou+ttGx6+GEU3omJKYj+4gA6q6MA/ddzZfbsNM4W28gWJr1J76aF5sY0iGWPYPvqu1cp3X6wSgqgp+82dnVQU2vvZiezB7bZU5GdafNE0iUD3TvGk7BUXRSDXILCfIXuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757236450; c=relaxed/simple;
	bh=bjjOrCQY7nCRwJYjDCDSciNQEkgygJ3UGgcY5H/xmAg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=o7Yp4f+sKsUFiTC00SJRoho3tCCqg2ZTwxEhpE8Grir5yluOMSCwQErbGmpVx6II81juS/saZ+DPB8g4sFAlC6LmoqG8NmIJe+45gHAzi030kBczDwPMHVTzPYtP9tapX2RrUoMdE8ds8RT1JXyDh9oPg5a7R6+HDDnEd2qCPFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pMkEQiI8; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pMkEQiI8"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45de185bf68so173875e9.2
        for <linux-clk@vger.kernel.org>; Sun, 07 Sep 2025 02:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757236446; x=1757841246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gsp0bK/nuIonUnBqY9AKagtiSrgSRD7fcSEn1YN+5DI=;
        b=pMkEQiI8+8OgDZi/+a9rJdkYDyX+icHpXyTQw4Bj1noiBGdnH51qHkOVu78nVCZ4cL
         rapQ6FaDJLlofPEF7yeCgzHCjTxE4Kjxuu6J6p5h1tga09tXm6ctE70HNyAjJE1XcudT
         5JDTewC7YuWD+uMsPkFqW71cIkCa7AIefNHpaQpcXI9/8Wh6gq69Z+zVtxvaGHq/qDxM
         ZpUslxECbRr0qcCl8Q1a3a8w8lxyLSexTVNAHrX/U7mhM5S9iXANp/76Xq1eHB7C+jNJ
         AtdyqFY8ruaX/D3xe1B9ft2KqH4WF82mUXBSpJHFYjXKfYJXcNOLOe77OpwNum0hGQcR
         Q6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757236446; x=1757841246;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsp0bK/nuIonUnBqY9AKagtiSrgSRD7fcSEn1YN+5DI=;
        b=YvUFRujdlEKRvqM0lAYSzJL7pb4KbedhvvLyw55ClHx4lgbwRHtt8FVWOyH9aG2wRR
         ZpX1bYYZTBR7x7du8iofW6F7xSVGhEe+u6oBSB3w37qPuSwdGIVQmQ//jUmA+P2TFCY+
         H+emH+vIqByVqXURZVESIt35RW4TUfqgwHBNibFDiD8rbna9FwWNWVGs9at0Orm5yoLS
         bYc63On1EG00o5D61Xi166HCs74WNKGxPJnpKWpk6Y1LRaqGvIPe3FFmVnzyFSOQN01q
         vx8o/Qv/BXHkrijK55YGePJO2yqaTu/qZTGJstW+1HzOKUvBlz5L+QRkmEAhPqRu8Wf9
         p06w==
X-Forwarded-Encrypted: i=1; AJvYcCWcxvlYGBKnunfuXEM/XC54q3nx8oLPTJG4fvwyXSp/x3ROnoAUPOJRllhgJTlGTSnMdDC11k2IBhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtvf9AGmeg48UoJjLRUC3v8u4fAhHgky3Ltj4GQlWRZIa9be3Z
	6CEHr3cZbW+Cg9PtiDjoFBAMOlDrK5A87OA4A4mof7cIRIt0LAAg8hLvLmB0EMsiCYw=
X-Gm-Gg: ASbGncuQxL3Rym2UWsugmSokYy+tLu2CQn9FaGuDrapX5QsP+F70154M09utnzLZP6y
	yuZ8hgIYGlyM69NX5z1ow7ohRlqhoMxGd01fiyvx/N8y74yB3i0B5dVZz8xRcGg1ewZ6joHLOu/
	n5yPZfuEsF5pO6QBFvsBOXGTOS8T+ODsY6EdkB1Cfi1b8Tpp9epRBaumIxS42+id2AEjRRlGdPZ
	WBxyU+FEKep4qXeV7du4EnedfCS/JrwAHWCdkjNOYRC64uN2da8VGuLqk0CQK+nRu8d9DNEorA5
	IWdvHbN+wsGiSBhbaVkwE8Cf88Ganv7JPQvxUwBm8TfuT3gNz0LGkHxi+6AtFLQpoQpqiA89SG1
	BVSJbTUGZMoJVSfMqOTtIc6q8e1RFVU2SSQLqoxv1V1TSl9hOuw==
X-Google-Smtp-Source: AGHT+IFQImOn+iq/yUmUyBTZk4IQaF9iLgVYYsVIQC7hi6Y7Hlt3FPdtOjJo41ClE7NuPr3IM92ZKw==
X-Received: by 2002:a5d:5d12:0:b0:3d4:6abb:7de1 with SMTP id ffacd0b85a97d-3e63736f694mr1567362f8f.3.1757236446397;
        Sun, 07 Sep 2025 02:14:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e21e4c0e6fsm10918962f8f.17.2025.09.07.02.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 02:14:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
In-Reply-To: <20250904-perics-usi-v3-3-3ea109705cb6@gmail.com>
References: <20250904-perics-usi-v3-0-3ea109705cb6@gmail.com>
 <20250904-perics-usi-v3-3-3ea109705cb6@gmail.com>
Subject: Re: (subset) [PATCH v3 3/4] clk: samsung: exynos990: Add PERIC0
 and PERIC1 clock support
Message-Id: <175723644487.30719.10030399153447295312.b4-ty@linaro.org>
Date: Sun, 07 Sep 2025 11:14:04 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 04 Sep 2025 14:07:13 +0000, Denzeel Oliva wrote:
> Add clock controller support for Peripheral Connectivity 0 and 1 blocks.
> These provide clocks for USI, I2C and UART peripherals.
> 
> Some clocks need to be marked as critical to prevent system hang when
> disabled.
> 
> 
> [...]

Applied, thanks!

[3/4] clk: samsung: exynos990: Add PERIC0 and PERIC1 clock support
      https://git.kernel.org/krzk/linux/c/b3b314ef13e46dce1cdd97a856bd0250dac8feb9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

