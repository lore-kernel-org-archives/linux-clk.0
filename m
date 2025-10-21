Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D5134D935
	for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 19:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761074831; cv=none; b=ZaNFz+igkyTCE0vcBYJyjlNojIcGn+VYU3z/QGB/X/yDrtByiyU9nJho7bD1kltvPlWNqkp/Ge4AooTqeycSK56H/eYmMApjdL2W/13fSldJwGOLk62uicIe/oSTOg9jco0tWfsvsQN6E1xaB685S60mSVg7gaMpl34zdKIVUic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761074831; c=relaxed/simple;
	bh=H7mmLnyjS4IJj8j/5Cfb777523++/Yd9MxdaxBFMvi4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=b6irCc7keFhK0B/EVB7hoyBxS9x7Adzt9FWQOgH3tCDuh8YImHBCTG9vdq+TEEItG1xdivp7+/dBRLOeq1qDa9cjLpkfTuWSJxkhzjDLfi3diDBMo3F7FFXPMmPqz3GH0mkXAtrW1HvlNLm+3owen9eN9G70uoN97CMuLFaqF4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RjfCV8K2; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RjfCV8K2"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4270a072a0bso649464f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 12:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761074827; x=1761679627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ibZxuBONFvP6tEfHo6ray/hwM+JhW2wvVnRgxqq2YE=;
        b=RjfCV8K29Df2WMDDautePGhbt4yPIGXXLemqb9cmy/qDY+kqtUaInAUH8IXOAVwNM8
         4vVC+BfmXn243+566kVfTaanfMYJR/4icPDIi9JbUzHP51+LWdHAlOkZARxGx8Ow1Lwe
         aNVUMdhDaYwxVynnhUegwo2e6k0xRK/rtTCQbUUNgb/RyPoSJHBttg96nrt2GeEBFiwd
         TGFV+QtblNI2Uq83wHfYmWFx1slMcXUFHKUP8P6n1DS+yzg+xZOOEf+I/DbWu/q2N8d2
         ei7n9iL6vZYQTB53u6lnrhjTOk2AimvAMxYH9+IVAGsNlI65to1b1ssO1HtShwo0VRRn
         HCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761074827; x=1761679627;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ibZxuBONFvP6tEfHo6ray/hwM+JhW2wvVnRgxqq2YE=;
        b=N5R0xHzEVWtipXTis/OK6tkAILQmtEkDTI+mebmkmuPGS1kvKQWFr1un9k/1LyAQpt
         5o7Pc2/IjnWzyjj7r7jTlQtrsTV+/nqZktjBha7N9/DTqWC2XFhcyGHozC9iBb1DraK6
         jgJqggyFIIPDIxEiGYfDKOovy/+/Ck0FD3ux10MNQ2STMjo7+3Q4HQru5O+EbE+oB8PT
         lKUOANQSUUJEdF9fZfUeQ1r8iE9iLYSOoledqp42iFZxpfsGBUZhBFkfXB16jhHXMvye
         m8DYI+jeOUHOnGAoxy6g5MGN6ClPuPY/VftxUMrBUCZwmTMEXaXxmitCoDzzp0KXSmTt
         cFFA==
X-Forwarded-Encrypted: i=1; AJvYcCVH5tH9XUbsvpiNa4y4MlDQ6dzNG2cgK79wdH5LATFiNqHndC+c/MIwjT617S1PtZZ8zfQDoDvGVcA=@vger.kernel.org
X-Gm-Message-State: AOJu0YweM7q8p8hFcchzmeW7VtcvPGt8uQywaXw/Usb19AJXI2VGntrg
	zwT9JUrPSXg7qGhwS6dpCSG7LlntYbUN3POnF2da8QaxKZQ8tAOg2tKAE8b9yJ6yNww=
X-Gm-Gg: ASbGncskKXZRwkLwFkwjqXI1msKFGG9GqXPHx0WlDBXnqKYFt7U8XWJMirwJfzennOx
	vADYevjOf5ngAMeUbR/fibeZZKOvCvLdj2fMo1XuTvyF91KFou1cgR1g8TQG1JnspzXLpkIOHxP
	bKoiMac4yrQWv3txSVNNKHeYscPqP/pQG/vT7OKrcfD56c1gewv9bwMituCjRg1KuJsThJqijzx
	zPFRUhrPe4jV44jiug+SYpq/Z8u+9QQfLH/9WEAcDBrgEvOlRhn4DyhrIV+7w0QjO8ZvIzVygwO
	NSEjLMU5gmLCPkoiTbRojB8pI9LW4NrFpYFUaoIiAHEfmTNM6+NyScQJsqpZbvRn+g9ectuzH11
	Z7eGB6NBwTZVzenftJSaEIrizs2Mw+o4DyS0RS1vi/QTGrjwizuSAAanZ4VAbJrn/BDAJtqTe86
	vr6YO6vItHH/BnZakqMpuTL96NlT8=
X-Google-Smtp-Source: AGHT+IFxRo7mh1kCIiwBlgFSzvscGIsov6AOIfRYcDiKlEW/2CZnKxnmXX+fOq8J1wvQblUD1sFg2A==
X-Received: by 2002:a05:600c:3106:b0:46e:31a1:c07d with SMTP id 5b1f17b1804b1-474942605damr21467615e9.2.1761074826918;
        Tue, 21 Oct 2025 12:27:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c42b48c9sm7839115e9.15.2025.10.21.12.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 12:27:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 kernel-team@android.com
In-Reply-To: <20251013-automatic-clocks-v1-1-72851ee00300@linaro.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
 <20251013-automatic-clocks-v1-1-72851ee00300@linaro.org>
Subject: Re: (subset) [PATCH 1/9] dt-bindings: soc: samsung: exynos-sysreg:
 add gs101 hsi0 and misc compatibles
Message-Id: <176107482513.33931.5052547244710731509.b4-ty@linaro.org>
Date: Tue, 21 Oct 2025 21:27:05 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 13 Oct 2025 21:51:30 +0100, Peter Griffin wrote:
> Add dedicated compatibles for gs101 hsi0 and misc sysreg controllers to the
> documentation.
> 
> 

Applied, thanks!

[1/9] dt-bindings: soc: samsung: exynos-sysreg: add gs101 hsi0 and misc compatibles
      https://git.kernel.org/krzk/linux/c/33fd5a7103959113ea3b60389a7582ec0cc2f15e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

