Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319281FA14E;
	Mon, 13 Jan 2025 23:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736809862; cv=none; b=bc2kvV/NURIFD7MUqwMb0yEu4OSN0cy7al1J0IcbpwFTOfOyK2WJGEloFHtL8N1A1gqKMcwmj6qlSywS+e8R8tY65sa+OSdu50/5ZQpUOVvy/A6HcF3GKjyIOa97pcvSoyvH91CATrbHmnOf67vgpRMStwJziTLoPnPYY18/bXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736809862; c=relaxed/simple;
	bh=rCGIiKsy1r3ivp+WewAhNO1OJsuucBGyaa3Xrn9kjfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WLPd2GOL+3WPpuYXK2X+BbLsNrD1mcwWVO58/L6D1+uRT7nelmid8aGKtUxtKeHOZqeU7P4r7pKfscHK0+oCQM6Ycz6XEDEgmRKKAuK1L7QCxilMYuyvk9zL1WpxF+ESXUVkJRut6Kr7ZXtuWc0NfJNaxYip+ndQ1jDmE3OQ5HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JbiDlZhI; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JbiDlZhI"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso34955115e9.2;
        Mon, 13 Jan 2025 15:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736809859; x=1737414659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qq2XB+lYJiceaZe/6zMR+qQBDoqtHMjBqrCS9umY4Vg=;
        b=JbiDlZhIfTENB5qJG6gLcteoOdo1Eg7g+WjcTMbXDKlQ+pRCSNZset3ngogpfOvpYM
         h1fqzhYWE7KIpbLHSGWqW+5VJfUMvS2hr+5qskyreq22/wOYd4Ics8G0wX/Za7j3ZMEa
         aEM0rMVJyUhLZU+Ku5P6UKxDzDCKmB7gRmMcDIBXQA28QF9O2uQfK+Sujx2VeJWXV+Up
         fvfJfdpYtyDZUyrOiYzmhh8kUcxMIEwSBdsTrimP+/dPDo2k91NDQv4meDVWDldc1Xhn
         Qi+IV355O8kvpLwTbthiTVbxNyPLYAK0THT2UuaePdYP0gEZLeDzJAzf6UAyotNkJzK4
         6VLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736809859; x=1737414659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qq2XB+lYJiceaZe/6zMR+qQBDoqtHMjBqrCS9umY4Vg=;
        b=nkyuXR7Y7fOf+jrMMDD2o9ARkEkYol0+iAjp1RFs9zHlcBqEpd4K26ElQC/7DJR4rr
         qXcdvT8ZXLuQtwVbmSSaF6JrCuvLpfxtThCtHL2fProCNuRLXGvbzNPv5BjwWUrAAfni
         csBHKwiEtCCreU2DUUGvApDBR7ynTqtgXIkzwk/UC3kehxqqSKS6EuT99+awesOgUzYy
         Vi76KiYRadOENW32+MvzbKDJ/hnwG/G8/phf7IkIvOmnBEZJ50RoJ1bub0I40yvDcF0d
         Lnv95TOjtIAEsy3iO4yZZx+qm2H0nx05cgtN1Y4DpzXie1CdLiT4DJTqKCshfPNP2vFf
         PXvA==
X-Forwarded-Encrypted: i=1; AJvYcCWY61hjmH58GXDfKMig/vp4eodcPbZh3RFWZXvYvQlPk0I0l16oSo9T0h1wmqCz3hDHSMs6H4YRI0s7@vger.kernel.org, AJvYcCX2/OHJcLtqWmuMIeSxCPqHFL+udky9izi0QES0bYrc02QkS/nIhsURzDWZuCJjoTg0rnHAPrxVjoJI@vger.kernel.org, AJvYcCXH+EqTPIkg29rI+o5o1Yck8rr7qr2DfCvD1f78wFHROqCYigqRGWUdAMuFdBvcHnPRyQ1tV90dTYjHlgI6@vger.kernel.org
X-Gm-Message-State: AOJu0YwqwF3s8FtOmbqHHUwfkDgoYBDgDwXhsNTZazAQzENTDOMOHh8X
	jlSwDlGezK1ENq+jjHAGC06GK/pC2aiPoUTdzvY1KAH5AJLLEkHwyeLmgw==
X-Gm-Gg: ASbGncun+f3Og6LKDmwOO/bBbRmQdnSfh1C8n2X0Cy8NPe+OTiM5o4TBkwpDRDPdd5S
	X3TXQ3t8A2hsYRDx/P+n6tqAX6qvot55rHH3ScPHNbpwLB4lwD002I0pKdHIDsAVfou+bCob+3u
	NRiZ+wPXyL832bw8rgzT3cTWU7KWrGo3L9h/sRfDK/IJUJoSlQ7zU5oSZnbfXhVO7QpLWzKkIjd
	1YtciDlw7YBpQCEQx58COnqoDXh0HmZeVGBwlG8TbHay+tSJ4fYCjL9LWyxcOULy/SYMrkvxQcs
	+m/vldqfgN1j2VtQz90FHuK2ZA==
X-Google-Smtp-Source: AGHT+IFEciYLakBizjv0yFAXiHXnnAFrs+2Y7EjzxUeLrzWF2I0JNfNs96lDl0Znuo5JOoZVYLPKTg==
X-Received: by 2002:a05:6000:1848:b0:38a:8b2c:53ab with SMTP id ffacd0b85a97d-38a8b2c563emr19452695f8f.44.1736809859401;
        Mon, 13 Jan 2025 15:10:59 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436e9dd1de9sm156091075e9.15.2025.01.13.15.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 15:10:59 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	upstream@airoha.com
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 2/4] dt-bindings: clock: drop NUM_CLOCKS define for EN7581
Date: Tue, 14 Jan 2025 00:10:03 +0100
Message-ID: <20250113231030.6735-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250113231030.6735-1-ansuelsmth@gmail.com>
References: <20250113231030.6735-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop NUM_CLOCKS define for EN7581 include. This is not a binding and
should not be placed here. Value is derived internally in the user
driver.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/dt-bindings/clock/en7523-clk.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/dt-bindings/clock/en7523-clk.h b/include/dt-bindings/clock/en7523-clk.h
index 717d23a5e5ae..28e56745ccff 100644
--- a/include/dt-bindings/clock/en7523-clk.h
+++ b/include/dt-bindings/clock/en7523-clk.h
@@ -12,6 +12,4 @@
 #define EN7523_CLK_CRYPTO	6
 #define EN7523_CLK_PCIE		7
 
-#define EN7523_NUM_CLOCKS	8
-
 #endif /* _DT_BINDINGS_CLOCK_AIROHA_EN7523_H_ */
-- 
2.45.2

