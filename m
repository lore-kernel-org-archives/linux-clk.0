Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B54326A1B6
	for <linux-clk@vger.kernel.org>; Sun, 31 Aug 2025 13:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756646901; cv=none; b=DPVO2+WINt+SBCCKskWVXR56m+nRIlp8f4lxQtIPlHeqBzIZfDeAgUGVTV3v9DlFVjDj0yfeSUGiT9uXT7302RN1PD64IXvQgdOdlo5ldqUamAcWQ0Kc2FA6JpVFhRXSbhwh+AlVhdD097Dy8NLS9lhsXG9gZvvsU3sBuIyef10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756646901; c=relaxed/simple;
	bh=LdivQQ+HHnZWD9LIPqe5v9pOuvWPc7P5UYV8ZAoOTho=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eQBwiydliIwvZzW3lgHgk339IxQ0vqtllr+WPkZ9ArpcDqhAa022Qj9yhoYa4ewy9ZwDvVCmHrcKwDyO42/KM50uq6JpkhTppQjNk0Ft1Sz0AMtWXA8RWeVXJGzCbsjWlbfqIzfc3DUkHQ2dC9QejZnG8j5ouFIJkKbSMsZpWGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aiCZn2Rk; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aiCZn2Rk"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3d6af847306so1555f8f.2
        for <linux-clk@vger.kernel.org>; Sun, 31 Aug 2025 06:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756646898; x=1757251698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZuVblRpOdjWQCfpwKse83LT8IgPkp+MhNhnqf1geLpk=;
        b=aiCZn2Rk10y3E6tYyekqS7YbSY8SY+93KAD+xThLDbMxjJnLCqkcD18G5ZLBbqceCH
         Xj68ArzsBIYW6qwWiwRn6kvMY4GCop6aOHewJgETm4jjptSYEzMgqmt72Yb8XwnZbXs5
         kKq6N9FNwq+BXptH8fDrYU3vKNGMdYwpXhtFGVk7tOwLSoFKF9JAlls6WRGX6054b4Rl
         g9DQdVGqZQ2CWk9oA+z+NKpgEdUuyK1CkYTsNkV3s6pS2sZkEvpYMXCvzbP9Xxj3Dv2l
         1FH/91BG//8XA6T0nz29P3lCHfSPFhjv6/BG/qZzpOHpt4qlqPcePFXJvZ/aAaraG0dt
         Pv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756646898; x=1757251698;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZuVblRpOdjWQCfpwKse83LT8IgPkp+MhNhnqf1geLpk=;
        b=j+oJ7GZbvI0cohH1Z9vAnBLkg33Sibv1wM9vwGS6GN+sWVAUmX4/Ulyu3GSzJVbbHB
         CxU02HhozI155dN0bhs7lt6eZMEjoxzyvTZorb8cvX5EaUdOZgNEzB86uIAYZU4Fr6HI
         GRFnQUa0aHBO6O/bfv5L7/R3t76QkpTpq8TgKRLKXo1YIvvyhZ/CzkJNPhUQs9R5Eyiq
         5vYP4RnnJvMKK9/vcQ6ttOu7eQqe9SI7+R2wJuIS2QLyQqCSWAYRNqhQI+Y4MeS9pNTA
         qNdycjMHCWE4A39mQItcPEe34XC1qxPd+luX7Ab9mQlxMJmculvEcKYlBKSv3r1xQ24X
         6bVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqSfzrCZ3otRPTV5lLB9R8YTOXQ0i9IVGRTm5SvtPL+AkvjB1VEkJuDwotFMe99qMv7oSwG3LYOs8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkoHRTiYAfRVWDW+kumifNzKB07QBp3iDLrXh97q1tGBGT1fx2
	BZ3bPMLVvvMCMKMMWpB5YZ44i80T5jSZ+UwVbKmN4ps62HYD5riqZc39Pa6nIu32WEI=
X-Gm-Gg: ASbGncsUKKhZi8mN5dYkCZT48osMd9hK/DIS+IFMbV3vDN5ZEKwLRdr/2vmWsJRW/De
	gVd9gy+qohwAk4KxHImJqhfxyTTfo+XuNeoXyV4X4EoJdcbNlqEqkZxHeC8Q2U67KCFkChW4sy4
	WSRF7H8XHrx0ezpAM47xp+8hPFB1je5RtasJzoicNh/isjuLtMJ2px//tQ5NOb+pyURHnOfCTds
	mMQOzF5plyDl0MsNccwUnFQswT8KKyLJ/d7IuDfLlTiqE+7FXJB9kIazsGBKWt3FFkl99/TxwX0
	i+a7XjAsO47/5HI1cn6RD8nQ3S891sSPSepHJxA9NR5PDwG7GUo9KtxMRRjJ/n9u7fk5eX8BR0X
	3vRpVOMHuVKYN3TnhU7q6qrW0NvtN+k5K3BYYbFjsuwI76DJfkg2UtXb2Apxh
X-Google-Smtp-Source: AGHT+IGjjCRfDtUdQVx88kWUHZJxBBGxwDC32T0AevVKpXcpfKjnIqL3cEb2Sd3S+uivJb0HGuqySg==
X-Received: by 2002:a05:6000:2dc7:b0:3ca:6c06:70f3 with SMTP id ffacd0b85a97d-3d0f967dfa7mr3081239f8f.1.1756646897869;
        Sun, 31 Aug 2025 06:28:17 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b87b3900dsm29956925e9.0.2025.08.31.06.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 06:28:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org, 
 s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com, 
 will@kernel.org, arnd@arndb.de, Ravi Patel <ravi.patel@samsung.com>
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com, 
 gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
 smn1196@coasia.com, pankaj.dubey@samsung.com, shradha.t@samsung.com, 
 inbaraj.e@samsung.com, swathi.ks@samsung.com, hrishikesh.d@samsung.com, 
 dj76.yang@samsung.com, hypmean.kim@samsung.com, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, soc@lists.linux.dev
In-Reply-To: <20250825114436.46882-7-ravi.patel@samsung.com>
References: <20250825114436.46882-1-ravi.patel@samsung.com>
 <CGME20250825120725epcas5p36cdf2c4e839db307f1cc0dc81346b913@epcas5p3.samsung.com>
 <20250825114436.46882-7-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v3 06/10] dt-bindings: arm: Convert Axis
 board/soc bindings to json-schema
Message-Id: <175664689576.195158.13430798793147668085.b4-ty@linaro.org>
Date: Sun, 31 Aug 2025 15:28:15 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 25 Aug 2025 17:14:32 +0530, Ravi Patel wrote:
> Convert Axis SoC bindings to DT schema format using json-schema.
> Existing bindings supports ARTPEC-6 SoC and board.
> 
> 

Applied, thanks!

[06/10] dt-bindings: arm: Convert Axis board/soc bindings to json-schema
        https://git.kernel.org/krzk/linux/c/ea0484e4b82b3496310a94684dfad5e61421f633

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

