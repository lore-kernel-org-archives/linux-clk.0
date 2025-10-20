Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FFF2DCF70
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 06:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760943361; cv=none; b=rdV62zJZ0Pv53/90U/7e78KYMRC4leek+iEp1sC2xG0rSYjDmYpfYghFTH1Xn2pogUn4qr+PZLB+EAd7cSuCAYKjIiEnlIH0lpk0rTQH0k6jKDH8XEXY+nSgXWFRzpiHf0XQdnejCPOKhPpL6DE0J/dk1mOHDlLQ100yO1T41OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760943361; c=relaxed/simple;
	bh=Guy/Wn6qWPXOWpR+qBL2zJhf1WK3pLxtBayRj8tlDZQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oFvwx/DkeT15xyRPnnJYHFwCenLanTrBOiONNB0dgo5+X3i/NoSx8FVNLziJo2MaEALROemhhbeB//Yi5Ov4N5gWnvGgRNMdcvFL+s31D1fo6p5FcLIJpUvobb1wzGgoMq/tjS0LXOojyY0TF9BTYzh/sZcY9xFVMJ8Fb0YxPmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V4voWSlj; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V4voWSlj"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b484b15e72bso99039366b.1
        for <linux-clk@vger.kernel.org>; Sun, 19 Oct 2025 23:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760943357; x=1761548157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tnPFmndDgQ5IwJj7APl0bxqe2uCJD2IB3khq/qdk9Cc=;
        b=V4voWSljIe0l0Fu9YOB3FvMObA0AxXsL4rhAbhIZwmtwfLUiBfJMdQ+qAJA9niCnfv
         +93flgq35FPdkFWiTp1p3UKdnCjEBr7JuRCkq+C9/YbrBoIzWZfPON9HQb3lDpkTaKa9
         8g6kMKSF4q6id2Xa8sgnR2X+ZzhawhRgpeVGdPxW1+fGlxch6BUGhmw5b0KYsJZKMq1B
         oeKowRa9Be7mZTFZfRcIqea5wZXjAZmC46BOy123Sw/IWxJHgHGD9fAg1HVGmjzayzid
         HpBxBh+yCtBcW+2IAIxkyi1dJq/8SIwT+q+B9wPPesRd+IslvZyAMC+bhc8XYxsMBmaC
         75FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760943357; x=1761548157;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tnPFmndDgQ5IwJj7APl0bxqe2uCJD2IB3khq/qdk9Cc=;
        b=F0TIHK+IRH/OCnfoAwh6A11flmTtfybImObhrcB2vH1nsepZQXux48DhhlGYtxA86w
         P5OpvzAXZ+WQMi9LD0p7AU5he/W7WtvXaRTf4ypIu8Sk25+ZXoOzSUqmDU0/VBmh5TP1
         ruRlfVb3oY++iqp/s4d/xjDjvAOT7aXluTHRO/AM0VRWhejMlGRxdiAWSePrbXeqBXVs
         6uo1sZ7J2QMx+ZMuejlSxmj4gWf1vv9UfOE87CTjMfVUlCIZ3e5Pd/gfCpgD8uTDc+TH
         qaDAWIXvR4bK0D9Zlgzduxqn0JhtHjd/UIwvmWlatXHTW91kOzAT+UElXARosxSOBBEJ
         p9rg==
X-Forwarded-Encrypted: i=1; AJvYcCUrbzKni+AemTWDbLIiRW/6Vi54ZUfPDIOqZz85Zpk5rZryWjihr7CRvVPK8LcnxTqdoYfN50/+Wrk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2cDAmpjSr2xrom43w7uCmtj5lX9alJGUOndkmvnf/DfdD8cgu
	2nsC0dU6PgtU9hZ1pQpSPktnkSlic+8KijAxLVSb736lR69au7PX8+QjVl7ivIM/4EU=
X-Gm-Gg: ASbGncvdPgkVPP71kxjjeTYZ4qVIJOjHYxo5E7pdq+OVip+DHqvmuQB0V1F2/u34Bqj
	jigjt79tNH95YHEMIQGbR/Snuc8nGi61VhDZB16k3roE8SgBsB04XYVzQoCtWseYwGjTx9tZYfZ
	ht9ebiffLFzpWG7c/khaZyGDeURoOPHQOX3azBDN3KCwenMtjguRX7h7T4CSg0aS8i/b+cOna2Z
	fSmrriW3cVW9xwYyhIYd74503urHM3JOMJY6ezs9gnHNbaAGkGTbdaK44kY75SE1VbdvdBg+Lgv
	dzgr5CWJtGUTEYAUWC39G+A5iE56hBfAAHv9PsNrx8j5A4DVarLxNmM3CzuZ/GO6b4RWblMRiqd
	w0Dvswl5yok0LCOL+xvpVrLYuF6iKt4J2lxuOp0jp/3hzuAQTf6T3d0AEwAJhZe3lv6KlBEerxG
	KeRnkc8KkPECuvIGwi
X-Google-Smtp-Source: AGHT+IGM6LazFp2mSfgZ9xBnbGP6M9hpAAYO7X9ryVeCtJlSZaxmstc5s6rhO0igzS0nmtIalIlyNg==
X-Received: by 2002:a17:906:7312:b0:b3f:331a:a98c with SMTP id a640c23a62f3a-b6472c64be8mr763154366b.4.1760943357324;
        Sun, 19 Oct 2025 23:55:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036a3esm711731466b.46.2025.10.19.23.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 23:55:56 -0700 (PDT)
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
In-Reply-To: <20251010-acpm-clk-v6-4-321ee8826fd4@linaro.org>
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
 <20251010-acpm-clk-v6-4-321ee8826fd4@linaro.org>
Subject: Re: (subset) [PATCH v6 4/6] clk: samsung: add Exynos ACPM clock
 driver
Message-Id: <176094335539.18498.16396321408282036378.b4-ty@linaro.org>
Date: Mon, 20 Oct 2025 08:55:55 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 10 Oct 2025 12:46:34 +0000, Tudor Ambarus wrote:
> Add the Exynos ACPM clock driver. It provides support for clocks that
> are controlled by firmware that implements the ACPM interface.
> 
> 

Applied, thanks!

[4/6] clk: samsung: add Exynos ACPM clock driver
      https://git.kernel.org/krzk/linux/c/40498a74205371400a5b0088acb886ac47a523aa

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

