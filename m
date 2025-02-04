Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD9B207DF1
	for <linux-clk@vger.kernel.org>; Tue,  4 Feb 2025 08:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738659063; cv=none; b=ZZV8DgnAl3usapwfQw3uWHz7RL2eJo7Q0u+0jgeYZzTEia5gCkufCHAzzgoskra6bdBNyxH2UUjF1GUgFFKlFVBegMzFSjNS7zd0bJqlki1lgDpUBa4ejrz68ZdcKOGstAKE2bRoX/pqY+1gMxLUE2VPHGTfXSVwgF6jivq8fno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738659063; c=relaxed/simple;
	bh=c6sdauT4NAjCLcdSLhhpbauGdNlBvhu97kIIicEbFCo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hhJWCDDF8cADMuiLs3wQaGFrDxigC79NHjMKYEre1N9Pl0fbJRqF0qI5YAHCeII7Bq9ZDImdUQjXXZcvJbMIOOhmj6tjXtTFaBs21tBscI+R2O4wmDcX0dbFxI23dzOvhtstlC46B8nXtyDK8bBYq27GktQn2Ol+Gw4Rr0S+02w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WccpIako; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WccpIako"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43616bf3358so6743705e9.3
        for <linux-clk@vger.kernel.org>; Tue, 04 Feb 2025 00:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738659059; x=1739263859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCr1bIjcarrRGLKq6p0An5lU4Quq+4hAEYJWhfURG2U=;
        b=WccpIakoL1eoJcWs/SS/O/QB1hI7ZbyadkE9kdIYhzetbSnwfRcde1kK0IQ8v/sHhn
         bIXvFt9ba0+8yf0Kd94MvAYVo230DGmZ+4Mgq9bARa9kMQpOBUguUnxeTt5sHQeJJT9i
         3WtaF7fki0GWAX0YV6w3Y0JJJ5cfb7LWOdKHWF3js2XP/ViUZaN8ZmxODkzQ6yT03ye0
         fFwOq/E85qK6l5dosFv+I1LAKnWX7NEvcnl44L7ttDlQmxVHBu/iDlCqFAF6hD1FUsTY
         PY8w1Cop6LkNRRZo9sxMRXiLsbBMYptQBrnxZFVLeAb/yf/emsK8bdh6xOO83WeJ3Rxr
         Wnzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738659059; x=1739263859;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BCr1bIjcarrRGLKq6p0An5lU4Quq+4hAEYJWhfURG2U=;
        b=rNZ5uVrK0616XGEsxJz6v+HUjKl/QzNl0i31CH38xTVVJ2F/mvuI6DY8ABaGdXNwpM
         n0mgVHL58c7ckwNq0VJN1s+NVe9V9PjaB+CFUwfGSmi8NjKwrlqvbjoUVw3+QyfDR3gy
         +a27/mHcAurRAMjkK2b9z2qZiFQJgkDajXbrhlJoWaRBR1iIkStY9KxiGbyguFDGXLip
         WRJunUtoRsbQYEfE+O+LUUYbFcO809czDsh6DYXMoQ5Kt6wzXJjPdZ15qDgp+uCawjua
         IPO7fad20NM2E5sxODSaXCFjFvafdEa5kV8iyYFRq5x9mVa2g3KBPRqYgT0oDEQ6sS0H
         icUw==
X-Forwarded-Encrypted: i=1; AJvYcCUqK3BsWi6/xmljGU8JtoKwdmLnwH+CaHUe4OA8FoEsBu4Y8Bcaef+8xsAHI/5EKTWa9y1yRblsPI8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9BN5sntU7pcEY+MEdZBgvwzv4ASKYHSmk1+0oG0jrpq6HTsPs
	T9h9fHeVl53aXYoU50wR8+Ff7uDngDMPaaQ++ZdNCX8t7wPOsCUuFLPPeIIh3S8=
X-Gm-Gg: ASbGncvpU3h0HJN6/NwPKJbzU3hCIcc0CFjhCQkZFLaCbEaykwfXa/oirx/4bWG1MX8
	xEfxndltBJ8Zow+YxwzFRBlAiPPFBBGXqxhRLl1Lfd6s10970qolcjFGmV9cmaHC9MMI9QfAzDW
	bzatJ4VrpAcVNi0QhYTaViVjfGO0kqUmqRWQLioZ2V9TJHnn6sUT7fUmA3Ml2pJNFk/7VSS/OBv
	Cg13o+mZYotgQc/obhgTPsc2db/LD9HhZbVBxxjoXYsNgoN4cWHKIMW7Xp3tXyj2HAqlt1IH9nv
	F/ubUaear+CTJpUZAFUYu3Jgyp0TamA=
X-Google-Smtp-Source: AGHT+IHYuKkYPbhh9kBPc87DdQpAZ9zcHEHdGkABawo/Qtr0EqGi6f6CTD8BUqoqUJP8UloWPAQavg==
X-Received: by 2002:a05:6000:1848:b0:38d:9e86:2b24 with SMTP id ffacd0b85a97d-38da4e440aemr794591f8f.8.1738659059133;
        Tue, 04 Feb 2025 00:50:59 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38daf27bbf5sm503066f8f.48.2025.02.04.00.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 00:50:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250104-exynos990-cmu-v1-0-9f54d69286d6@mentallysanemainliners.org>
References: <20250104-exynos990-cmu-v1-0-9f54d69286d6@mentallysanemainliners.org>
Subject: Re: [PATCH 0/2] Add CMU_PERIS support for Exynos990 SoC
Message-Id: <173865905768.26600.7188664956285706035.b4-ty@linaro.org>
Date: Tue, 04 Feb 2025 09:50:57 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 04 Jan 2025 21:05:55 +0100, Igor Belwon wrote:
> This small patchset adds support for CMU_PERIS for the
> Exynos990 SoC.
> 
> Best regards
> Igor
> 
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: clock: exynos990: Add CMU_PERIS block
      https://git.kernel.org/krzk/linux/c/7fa119f5707f12f3ac00726345ea6b7a22977ab6
[2/2] clk: samsung: exynos990: Add CMU_PERIS block
      https://git.kernel.org/krzk/linux/c/3214e7c0cfd29b1f0d80e0a4708145326d759d68

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

