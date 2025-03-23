Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6281C84BA
	for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 22:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769570; cv=none; b=rM2eAR4c9sIVgJjmb3cTSUYxa9wAUHH4SBhkDpawLKlW3l1SDwyZcVLBR6k+FsmGQSbTYHqXqZ0Re/q8mja41ixGNXB93ronHC0LWku3NZa/jMaCrk7YuLsJ1T8toJ3tWSeR8V3/v12TfNctIdMr2jMHlGLCRUy4Fnxpo9Fj98Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769570; c=relaxed/simple;
	bh=UZVJoMISWFvF9aHFwyrjWSN+7tVwoe3JXUCgzfVpa24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IAg0aJ3z4wO79qkh+EOuoZ/W3wER7zKN4WOchwszoHdedfN42IUtB2MfDfzpW7rW1r3RyAHan7C3o5WjFIx2ST9ni+Xz/btZ7QmvrBCWYcyBokG3iBWHUKEbQdGd3jKB6P3At0joEUuXNYNGExHeBjD5WEgXfwST24IyPbN5kg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ljwy1hg0; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ljwy1hg0"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-abec8b750ebso702071966b.0
        for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 15:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769566; x=1743374366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vE10aUiMRjd8RDkwLK4ZfbXWjVS481xd07k1tbR4ePA=;
        b=ljwy1hg0w7d08uwjQpIVjewXX//G/+dGER5okwBKZPEiZNQ6YK2oBUxFG3GXFLe29P
         OCvtpzvntIqjjr8U0w09CAFbhy2Ky7AvBjD5Kdvi+aTV4sN0KpidNYNx4nJig1k4I+oi
         9S+ucAq5kUlkX2JN1J+hGhC6zSta+NuKWQugSMNj+Q4cpVztQ8RD4okNJq1qRz1a7wXa
         /72AML98KCLC8/+/+qqDE3OtktZiNIgZcKCUrF4cnyLkuszV0LPBvCDP2hfZxholBsRd
         HWDaloMWO1W217gfhKlAozTvBtCPG7zvFoAGID3n5sqKgByC1zG7iIKzToYofx5b+udG
         GlUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769566; x=1743374366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vE10aUiMRjd8RDkwLK4ZfbXWjVS481xd07k1tbR4ePA=;
        b=vT9BIHVE7prF/Mxk9YYwHEQhAl82hGm7RIGRBi42OaGH6la+lguW2vFjpqJOAUCHhw
         8TlWPmahovuxL3JkrvJGE1dv9N++JmX2x25jmkIoKrg6UjyuWrRqhXwMPgfosnCxgq+i
         mstQs5S18T8/Lg8eqQxiTrHb2cDMsbrbdBnyVHpyQ+IBvSaDRXv3jac0Uhf5MFP1XkDW
         WRawrnJUjhqjPiVDQBMPUl3BQfaKz2wvx00a7wdqPSry1bAsW0sU1XtV3U0MYa0Inej6
         nsejN5ps8O3ALaCZWI3wxb79/Gl97pkbfIjjUudw2LQ2kLqTeL567st0jOK6zMnSHTsO
         tymw==
X-Forwarded-Encrypted: i=1; AJvYcCWbupT1Ry4rVTNHZDaWEoxlpFBYVCHxd7rqVz0X+wRq9CYlUqFOWlSiLVX2+TBvZBFB8HSL66rqMxc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yylt3DCo/ycEBqID1uH0LFB8M8hY04O799T+MyeFjcRILTz2/vx
	wkNDfX2PZFahNmRdhluioxi6ak6bGCQ+rdV3rCuHrUpR/ubrheNBygbkiUqFKQVIEg+rTVszc1b
	OVv8=
X-Gm-Gg: ASbGncsa04Usj2l8lSUkikZaPscuybaWhGCW5vJJfSpP7VdJk5YaFhpgRgXlANmMp0j
	jog2rb9d2oBPyCr2A7eu8DkZLKGM9k9aXLcp7PiHlX+FCW4VYU+vh8hJyb1BHcgfMim6h0S06ws
	X2snrUtYSdaoq3uyALx9jBEiRQb9Fw/iAwqln1QSoEnoV+p01MGaK/lQHkyho4F+HiCbB9zfK2M
	LU7z1Wmbg9JCDtacpCNEF0QR9AvYyICTyA9IufirP8QaqXZHWEwkmVmPjQJS1OKioIdRrXyd17J
	zJ/1wA6qUnvsMaAtCaTUWjnZ/W/dj96GQH6zncZIRNh20Bd+jdwf6yG3tDUGCRXAB46L/pugk5h
	TKiS2GvKtBfR2mPPOtcySQF8OqgNl
X-Google-Smtp-Source: AGHT+IGpWEO6t55UagtbffDf7jAwBntYjANUq6862eIF7eGvrz/eDXOggCL/0jo6AVynnVDx8dSnbA==
X-Received: by 2002:a17:907:97cd:b0:ac3:8988:deda with SMTP id a640c23a62f3a-ac3f24d7916mr1017581866b.40.1742769565973;
        Sun, 23 Mar 2025 15:39:25 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:25 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:20 +0000
Subject: [PATCH 04/34] mfd: sec: drop non-existing forward declarations
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-4-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

sec_irq_resume() was removed in commit 6445b84abf91 ("mfd: Add s2mps11
irq driver") and sec_irq_exit() in commit 3dc6f4aaafbe ("mfd: sec: Use
devm_mfd_add_devices and devm_regmap_add_irq_chip") while the
prototypes were left. They should be removed.

Do so.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 include/linux/mfd/samsung/core.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index f35314458fd22e43fa13034439406bea17a155c9..b7008b50392ab857751b89e0a05d2c27f6306906 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -72,8 +72,6 @@ struct sec_pmic_dev {
 };
 
 int sec_irq_init(struct sec_pmic_dev *sec_pmic);
-void sec_irq_exit(struct sec_pmic_dev *sec_pmic);
-int sec_irq_resume(struct sec_pmic_dev *sec_pmic);
 
 struct sec_platform_data {
 	struct sec_regulator_data	*regulators;

-- 
2.49.0.395.g12beb8f557-goog

