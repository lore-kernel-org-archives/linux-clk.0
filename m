Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8061F03E5
	for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 22:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769593; cv=none; b=LJ7KOfOxBiVkYxTzAS3muoecI78Ruk85rxBOBpLVtsNo1KrRuUa6pdUG8G8iatrdZhAHuOHkZxCAS+pz1Borikd41ZobZ/IG7lQSeuRig3r4JltPJ3q65oLrcgKtyoEAk4XayoMF4GBRN3RG3s+V1m2Mh9wIO/RUK8jvk4X6ZoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769593; c=relaxed/simple;
	bh=PIE3UA5RRPW78dm5St1dv8icSuMZdl9l2kQ0j44xOOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M+qLDitqQowCsIPiPL9IiWAcxzgcE0I6fb8hUGp5kAUK4ge26FwhZ9qY60a6icxzDxSJ3zJdUv3MGHwyuw9YTbgoZNvW2d8ZJRFCVWoSxUeD9b9gXqWJGlWbrb7vSkuWnIAvbugZq7e1Ds+2tLu0nFf0H15rziHlfBQnZIJk2Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zeR+DCHD; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zeR+DCHD"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac2bfcd2a70so552648366b.0
        for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 15:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769584; x=1743374384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jhTacnWIaHzojbgZVRhkXLoj0m8Qn0dJu2GgWCUO9Oo=;
        b=zeR+DCHDsDBIMpShQebkdtUXd40HXIHIzeIvW7Kd+RwPGGXp5/ug1FhtqNmdp0LjpT
         89inYhfOkztgyaHcOSyUKjD62uXumVJsbYEuhsodv65UAAcZWAaQWGQOn7O2EmSiTIly
         vYA1ccF21zyR1GxD68OogxS8Vw06JkrR5s5JVYQYxLftw0dwbbSuBFq5eWzOijVSfRoF
         8qT78qjhKymxXXtNqphz5NjHp0+5HjuPiZSz7jqp7obOiMYeyMDVZCsz5xXEmAnpj7AN
         82OwFGTRWWles4Sc2f3lL9q6w688lwkqMRA49Rg1+meWzd7qZ8CumTyXWx7ittyOKLnC
         SFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769584; x=1743374384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jhTacnWIaHzojbgZVRhkXLoj0m8Qn0dJu2GgWCUO9Oo=;
        b=ohDCvifRHte15V2T2n1P+DKJ+QoxyTfMgBu79hXppaTgvxdTjT+LwCB9DHfmbpmFfm
         uuSn5wwNf1njLkD67JFFwIgUe/FBp8GPs56XH5rj2Bsv1w6ja4eI8fumNCS/F7JMFv8N
         5Yb9jGQFrlAF2uCl2+Kd8es+57htCnf/lE8YDWf5owpWGuyipZYuADmY5nG/SywaQ/Qu
         1/+MYid/Wu6yTsGU/lqp2UUEPSvEmUwNVYQYez0IGcRSWv98jMXdbQMdIP+YFmRmv+Wb
         PpMrgg2GXS4uu0ES6nqViGRsFCN/XEC0Ni0NP5LoWAlqRbtSkomOyVw/+P5tT9RGjsoA
         oVcA==
X-Forwarded-Encrypted: i=1; AJvYcCUnKg7nCvpo/kGazPE+kEFVGlYz9Pchp7j68hT4fRjDrZWqpigdaPsZQ6wltvJbSxhyJiNipvl7hDc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4hSVQl2Lx47OnjwpzNoNielDeBMtAUTBWwv3Lvs23/QG5IVs8
	JeTZIxnjd3vbKP0bMXFP+k6vWD4lyoBAIPkpRW/pBDDi267zpCycTejRvobWFH4=
X-Gm-Gg: ASbGnctiyZpezvgc9Rd/ODrhVoKRxU31tKrJ12QYJboo14vbq6GnF2ZiewmJGD1OSiJ
	xCsAzxoBGs0+EKwS0LNAN4U+gjK3FCD0YmQ7NKpeMim6UTl5DB7ClfjNG7znSKr+I4DgpRKh/yE
	hFXe3venGgS22DB9lFcXR58j7kj1yLkTO57Ks0C2i89XDEXKnz5ZGPmAwsAJSjCiiJ+1kyCDCEc
	B1h2dwShoyTkUsdo4Nkf+Y2qBXCRomJ09nAfDCMxXXNTjhsCkm2kzoy7UPOdpcXryNQd3aG9kKS
	C9UMgzBnY0ZQZG3j4/gZ9KmPK5mz50YTZRbaXRjgMs48zx/8E86iqgpfxyZdZLc5Hi5Nj4dqrIQ
	L/fGlFeLBLfPmc7roR1r3xyHxuY3+
X-Google-Smtp-Source: AGHT+IGBmk43Q/5KSqStfiKdhkMzhnRppuC/FFtUW+Zjtoma50FlDv2NtShPafcq2wFC3LRoUhXzZg==
X-Received: by 2002:a17:907:d2dc:b0:ac3:a7bb:1c2f with SMTP id a640c23a62f3a-ac3f241b95emr1147181566b.7.1742769583868;
        Sun, 23 Mar 2025 15:39:43 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:43 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:50 +0000
Subject: [PATCH 34/34] MAINTAINERS: add myself as reviewer for Samsung S2M
 MFD
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-34-d08943702707@linaro.org>
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

I'm working on a Samsung device which includes this MFD and would like
to be Cc'ed to further contributions and help on reviewing them. Add me
as reviewer.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d686e02dc7ccd61e35173df997d2f894ee5ab515..10945909f5b317a894b6afbeb6bbccd1a691de9d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21341,6 +21341,7 @@ F:	drivers/platform/x86/samsung-laptop.c
 
 SAMSUNG MULTIFUNCTION PMIC DEVICE DRIVERS
 M:	Krzysztof Kozlowski <krzk@kernel.org>
+R:	André Draszik <andre.draszik@linaro.org>
 L:	linux-kernel@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained

-- 
2.49.0.395.g12beb8f557-goog

