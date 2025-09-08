Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701E530BB8C
	for <linux-clk@vger.kernel.org>; Mon,  8 Sep 2025 13:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757337187; cv=none; b=qt+2qjYutn+pKXxSNuRxosV8vtN4WaUh1NW6OHbJqqDSRn/m+Wq83ZXAtT2Gma+cXdMpgLI7oTXmbarleJ0sXU2htNZGeSk5LuUJfcq+/TcR5uMnx1cx4eXo0t8EW2Q3iOYeWKY42hdsrdFRACWtmaouNbyYTm82oqj++mMB/64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757337187; c=relaxed/simple;
	bh=r9B8eJrWR/g38PUeQ9J2wFXWREa48OIMpTY6cZptlBw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OflqBowCghQVX9JNLHyRMBRFybZHEwsu9JJ7vR/krXJxmZoNE1e9AMcKZeBvTnWRjHzz+HTcHMxMHbtj7+jy9wsiAyqxQhSfWWxvroiirfVUi3nTL+EKgt5OcbM//GkrWSLvPsV3vjAS9l5e9jYs32R9yT6jfNnIDST81tC6YAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gfYgd4/m; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gfYgd4/m"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45de64f89a9so7602895e9.1
        for <linux-clk@vger.kernel.org>; Mon, 08 Sep 2025 06:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757337184; x=1757941984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HX1P98lL0ntVTFobuHZJG04rSny4tquvD0IzM102LdE=;
        b=gfYgd4/mMQtSOhMVWToxxh3TVJ5Ttd4tiKfBFq3/plCL4xqF4FqEtMRXWDmASYsZNv
         1W5WdCcLPvjtpdqg+hL/24jZa2tKC/jEfopUTgEpFQZDXygZbev/2HYFMVjvv+VFcQfB
         k8wHoFAnN8mXzChyZHGYGJH3TdfaJf9XqnFfvgtioine3k/ouSD6aLqpaQvFWiVPrAl5
         8fZTS9+kCEYX9JQWxBgrxyAn6deGUAyGMflM1C+BRiYsE2EBexxJDIwOpPc1O0IsljI+
         I+04QdD8Hl7XpjGrDEBq/3/EnVPuyhqY6BhzNMQhLHJgB82NAawPeXcK/XJhlnE1cjZ8
         UwuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757337184; x=1757941984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HX1P98lL0ntVTFobuHZJG04rSny4tquvD0IzM102LdE=;
        b=aFZHZFIl/LQ8hQtPludp7aJQkb3qdHru4to4c8LgsgD2+p7L8Q7c+jI3jaSA0ag8me
         MXjzZbUoPIQIGXnqHer/Cxvz9UC1AKVHToMb+K3W+MJ2FCNP69qkklOxOqeDU+Bm0wdC
         L0ABL+ugy+9/oJPH/mROYF3+M84sKLwiQ0PLgu1uhWhOO/WYBmp/BLDsoXrl29vHGpnH
         xRBJ+y0hTjEwZQAqloiv/bo2v9YJ6pKVZs1i729mhwbt0hrOW/a7zPLoWDrcfHjH0x6+
         GQ1limfVyqkDvk0vggmAGJXpv34a18OyeeqIjinCMtSM4ynkxOaWEKGR2FaOCd0uSbHK
         uuEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWop5m5noDB/VRpqC67fwVaeqP2UdxCLj3Li5AuQ40UVpDMBQt4WlbWVHx9hslBZBHHW6DCwHrWPHQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmUQEJEZHZ6+9TBDliJCRKP+K2xMagz2PIkBBYh5+B/PxrQMYS
	tuhFgDHaK52SFZm/DfghTOvGDbzDrS7j3R2eb8vkVDA+dQ/MHawUolrkUkC7wo/353Y=
X-Gm-Gg: ASbGncvOwU2drdG/e66J59o/ynUl3mNIxeRGO8CQMQL+GncbXXks8yb0gp5ue4bA/Ww
	jlB8eZUeH05iKWBA7JtwgLue7RgFHYgN0wVLMuc0JnQEqn2Ltn1HOv/tzlTNgN/rnaL+5HubvNp
	aix030ICruNIABcwwxU/6TJj2b3iN/dckfxB+rUc6BJQRfOsG76XJDYkbWp1RzYzk/pzMETfgHu
	Uax/ixDr2QecE36mOkBiAn/4iLbP9AhKIiuCHxF76l4GdCHcD+zMbsun03aOp3yByEMlSS4gmAx
	3y/+KxeGcjp9k8yttuBSMH5usrvuszb7wIUpcRLTNWES0UBJ79kPH9+xqn9TO1Ysx0PqWls3QkG
	7vFHTQ9F3Sy23cHOVaJ2yMbF1Xi1/3RpS5Chqfmi09T36/A3Wn5Bon2TrFzqTcjwDTYBGwGj/Zz
	+28DQLDLgfrG04
X-Google-Smtp-Source: AGHT+IHrei69SE3S2Wo3PhQL3nGzDL0r6xFLtoIiPAj8bXHlYe0awD9SWK429eaX/ZmPsA2F6T6ySQ==
X-Received: by 2002:a05:600c:354f:b0:45c:b61a:b1bd with SMTP id 5b1f17b1804b1-45dde220a2emr74636385e9.18.1757337183601;
        Mon, 08 Sep 2025 06:13:03 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf33fb9dbfsm41650181f8f.43.2025.09.08.06.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 06:13:03 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 08 Sep 2025 13:12:46 +0000
Subject: [PATCH v4 5/5] arm64: defconfig: enable Exynos ACPM clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-acpm-clk-v4-5-633350c0c0b1@linaro.org>
References: <20250908-acpm-clk-v4-0-633350c0c0b1@linaro.org>
In-Reply-To: <20250908-acpm-clk-v4-0-633350c0c0b1@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757337178; l=820;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=r9B8eJrWR/g38PUeQ9J2wFXWREa48OIMpTY6cZptlBw=;
 b=9ggP3KUVS2zT7FryKyHNIZtbBh3Rqan9vA/aNkZzb27KJvR7ycYAxiFo0bkteyhSCJ1SQvT4Z
 n+0HD5LlcvUD4LkTHTo1imFXIzH7ED6AZ4JOBehLysGJoPG0239vgL0
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Enable the Exynos ACPM clocks driver. Samsung Exynos platforms
implement ACPM to provide support for clock configuration, PMIC
and temperature sensors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 58f87d09366cd12ae212a1d107660afe8be6c5ef..4255bc885545fb3bb7e9cf02760cac35bf2872fa 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1445,6 +1445,7 @@ CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_SM_VIDEOCC_8450=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
+CONFIG_EXYNOS_ACPM_CLK=m
 CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_OMAP=m

-- 
2.51.0.355.g5224444f11-goog

