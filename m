Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B152638B2
	for <linux-clk@vger.kernel.org>; Mon, 18 Aug 2025 04:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755490258; cv=none; b=TMfpAsF1wWw6mk/SK4yoDS7s1W0jmTHsVR55XDEtZafcU/znfClxruLjd2h868GPfzRpS4qhV7TnhhJOEJNjduNxoMo3GZgoARBy7k7zAOjtkTXdnCo9OUMx6QSgXAoaRIhl/1de1/pp51v8aEJtfKbLbmmNgjLOSn6AuFi+O1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755490258; c=relaxed/simple;
	bh=UBn+LBjax9N4GZfXPTV/0yYRe68OpjEpS5e1cFYqyMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DC7SzN9o5K4mejHJlMw08Xy6xcrSobs2GROlB6DUcnRYIFSCLyvIO0nhHH7IIF70m8pQEBDD5VvioS8dUg3f1oNp1CI8WX6mM8ak8BIBM18iW6hKOEqg7E+p8kaaXNY3XzGjAmEGsevcSBUZpNxjr7A0LFHSU0LTg1te8JQMCS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=P9Q581HK; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="P9Q581HK"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2445818eb6eso27377205ad.2
        for <linux-clk@vger.kernel.org>; Sun, 17 Aug 2025 21:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755490256; x=1756095056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bl+ki3sYBLOuIZdWtmik+PFOlIYEBNco4Pu8AxHtczE=;
        b=P9Q581HK8/KAZ3rnXUSh8nAgIRolwnPxlSBXom15JzP4qXSLqTCzyQzc6bNAfPTjDc
         uU2/MEDHJfhtRWVgZxGo/fxzBeZwL+n4qMxhhdTAQ3Bc34XbcC0g3ROHs0qcGJLShant
         1b/KxBBhvZMiKkFR+kTBu9jXJJlQSqWh2uYl0bTZXzJ3fhmR9j2aSqx3TZPi7uWa0t00
         lpHakni+toVcdH1DUVXY3YRzDA7EDg6rVsDF5DFa+iQAW82SNkfbz29TRkZCLrqAQiK5
         uiRZ3m3yHTIZupCAZhuxr7YHYmDfyyU+KvKvw/092Vf1WCaSZt/fvg/lIKoZXm3Dep2J
         en8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755490256; x=1756095056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bl+ki3sYBLOuIZdWtmik+PFOlIYEBNco4Pu8AxHtczE=;
        b=YduYbSO3nE+MeyfP8cuvhKvLLo/9vSmFTvhbCGWeXm3RTxn2btaHYmlOzUwR6BgzWM
         wZNwWUlRA82hEB88fWB0rKAAjrnYzCzT3OcoD779aS1nI/ATULkUP3wtCSMFEiKlBpcU
         G2ZrO4Hi2QQCZOLkH6bIDr0IUQS92kZqEpzsIkJfhcYPLLXIcnaKdWXRN2vPDisGHfnm
         Mtof/iqd/qeFl1Bo1Ff95zug5V3sQ+dgQONUZJsZX3CG99F35U2neqICxtEO8uv65kX4
         lpbNDwQA70FwjFmU/sKtjwheo2JdmJuBpRknDW9wFHx0rIAIGpOP09DppELjDh4LJn6w
         PyDg==
X-Forwarded-Encrypted: i=1; AJvYcCVuxnDsIBSmwvmj3JliZsWMgyXfoWH5cWl15VE6QFGLpiu0ZTGpK5k9Glb5lhpbFefs24GSzvRGT5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9NXwfDmnZEchvG68w3bHrgW/zGDE0IS+UKsquTSIeoJqDu86j
	vZfjCued85s1onrvBYoOW75/c5VmanNmc8rXW/TUPPD1IQ/dp38GztnKwUqrQgXnyGg=
X-Gm-Gg: ASbGncuGVQ+GHlrc2B68WM5OdAxi1b2bwIjo6QUM90v7zs7sqaGREaPO3ua37jj1Pzm
	4Qkb6MzGolsEVDbrzlIi4EiDNanaYiKDbnPR2vr4dqXVbrUxYg30oU8FFerJUNiN60m9a/nitzw
	Tn/d3WyrYua27oaF1BxjsWvr/1a+Ya3yuDlk5C7zgmD66PiL4/IvfaS4iwyV1R+D4l3nWMTdUlC
	JLw3rM2FdkkDvVW31kzF4sSrBGJuuEy9rZw7ULyiL5XwTjMPLM/9m0qcWr8VGUqDns+rc71aPr4
	6E7kKXPG78+CKdUNKXY4z/3jsiZDmmwnmA+abUluw5IUOM9CH9ZFSiGo+B1XJSh/R7z7sGnNthp
	EngPiEb+Ao8Qb8YELByYXx87v2YqakBCVCvcrX2Hew591EqJNCgq/1Q==
X-Google-Smtp-Source: AGHT+IHeYI/gJKhVi0ejI5JAJv+DItCCeU8H2nRnY+2JhkO9bcHtEjh5t07sN3PKPK/WfAop4xC+yg==
X-Received: by 2002:a17:902:e848:b0:240:72e9:87bb with SMTP id d9443c01a7336-2446d934b0dmr122949965ad.42.1755490256221;
        Sun, 17 Aug 2025 21:10:56 -0700 (PDT)
Received: from localhost.localdomain ([122.171.17.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c70356sm6560972a91.25.2025.08.17.21.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:10:55 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Len Brown <lenb@kernel.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v10 06/24] byteorder: Add memcpy_to_le32() and memcpy_from_le32()
Date: Mon, 18 Aug 2025 09:39:02 +0530
Message-ID: <20250818040920.272664-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818040920.272664-1-apatel@ventanamicro.com>
References: <20250818040920.272664-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add common memcpy APIs for copying u32 array to/from __le32 array.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/linux/byteorder/generic.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/byteorder/generic.h b/include/linux/byteorder/generic.h
index c9a4c96c9943..b3705e8bbe2b 100644
--- a/include/linux/byteorder/generic.h
+++ b/include/linux/byteorder/generic.h
@@ -173,6 +173,22 @@ static inline void cpu_to_le32_array(u32 *buf, unsigned int words)
 	}
 }
 
+static inline void memcpy_from_le32(u32 *dst, const __le32 *src, size_t words)
+{
+	size_t i;
+
+	for (i = 0; i < words; i++)
+		dst[i] = le32_to_cpu(src[i]);
+}
+
+static inline void memcpy_to_le32(__le32 *dst, const u32 *src, size_t words)
+{
+	size_t i;
+
+	for (i = 0; i < words; i++)
+		dst[i] = cpu_to_le32(src[i]);
+}
+
 static inline void be16_add_cpu(__be16 *var, u16 val)
 {
 	*var = cpu_to_be16(be16_to_cpu(*var) + val);
-- 
2.43.0

