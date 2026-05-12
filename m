Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657F137E2FA
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 20:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778618461; cv=none; b=kvX4El9YmUbcEUBZeQ+5XDbvhkt+0MpUykGNzkexYh7AWX6Ih6znkCYZSO8aJPku0ikgThrsydS5Di9sC8zMV46IhE0z7imA+RAl5VbezGfrhNjjbrMczyUj0oiojnYH6w5ZJIVd2VKtf6naPHcvbICaSywpgweNsZE+bCgahUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778618461; c=relaxed/simple;
	bh=mdKvNw7ehYa2ofYFJlFX5f4iTIdrpZIRO5qNQsZ+a2I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X2IrBNeyR8f80N1kiWNz9lLAwoznxdjv+V9j666tBpodLn8rrRQBg1/G4ROjuEHdp8gRNuw3h26S4lDiHnuWRcqdm/W5jxayT/ZJ/css0WNkjeZfHLRySjBawYiftSJkLzvGKBA/GUN/e5/6hTaD2obSLh6MrxLeElehVbFUgd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zxVsUXSi; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zxVsUXSi"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso37498375e9.3
        for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 13:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778618459; x=1779223259; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kDIItImz4xvLaPbvCqxgl9WDiDNAnqUd0vqenKodWRg=;
        b=zxVsUXSiaC9H1gWnk7kR/DHD9cX00DUy71zRTtS+q6P6Rt9pcgH06Wr8O9vHoiPLu7
         6VOEC/WE9X36A1wK5Fa089+LZlzU4cld+VQM/+cXPfN7sBNf/5TRlwOXSmqIbq7xKiTv
         JAmlSXC7Q2PTXSxQYokVuKDk8flhmxxb2glAJLIxBtESH5Y+KTuPJO+jx7uvBZRDL3yP
         1MrLk++PdF5zO2dXngeUmHWNqBnDJfDkxG+9ElFwQ5a8OdNAOGx55NQg+6wNxP5KPxdw
         w+6lBFvBY7Yiw/vmn6qhkOAB0+7jWHsw8RLWrdXesPJz7UEI/nupim72ySGPhVcZGh9A
         DjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778618459; x=1779223259;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDIItImz4xvLaPbvCqxgl9WDiDNAnqUd0vqenKodWRg=;
        b=C/4tHGethahu4F+Cw6hxKzWAXAHy94QIlnu9NebUEKXDCUv+rKpipJLFlYRlTiT79C
         MYfiu51nyW9OqlnSgzgmpW2bRDUXj0GpxTRr0NfbDuzsEE6yyl7kuzkDbfbZqHYbZZcG
         b4biG4CZjj1erGt9xrwHB3Y0sA7QgtDBhqT66PA3vgjtaFTqmR5T42/bi59yYFnb/u83
         p9b5OpwPIVL+jhvPnhp/Vava/gOibePruDlILApR3kZz79wYfFJovc6v+WYBZvecqnOK
         UE4ACnHDrrWPxmW6lpnEow2uleclZ3jUPt5o2H+xVkL3Wezq9HVgal0TLU3zNDcyFTUs
         rLuw==
X-Forwarded-Encrypted: i=1; AFNElJ+uXQ932ntYYUL8fKqvbOz4O0paLSr1K1lYmQAOMgpJr9E11zKV4xcRezri9dF+bApVU2EWgBrdIgo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzonSTlDWiipY79G52fajBwnjJmjTroHyzgN/MheXFkMM63h3Yr
	W3GN8kI0z0xNGlcW3iRSDFvTbt+5TyVwzLs4VYC/Ghs6ii0/M/QP47dhPWrw9eQhAKU=
X-Gm-Gg: Acq92OEDF2F2QS43emBXxycxV3Hvou28EV1YDGLRPKCz7R5RFybk20qZ0A8R8KPL0iL
	QnguEZNjFcVIGl6ybAtEFZIcc/31C6WYHZN2b9V3S8s8XrsK8pRVLqgJ0ucbdqDXH3VaYCKdBcA
	LY2iBIfY8NW8SvpVG3JmfWpdRInVM+up3ZX8d9F4l9oIHEanFSafwYVTMcLqo4aG+qT06lK86Xl
	zJy0u9tusv8V8slU//3LuEbxnqjbVyslNN1IpmCxJSv8jmRZ/Y1xu9FA/3QK6e0QSSLrAJKJi33
	gNRWbP8LcFuKEKSfNxEv5VUa2L54vGW5E/wxi0+cqxw4VzOrjTyF4N24toBu88UrCpBY8R98pCj
	QPLPtXEA0mOZrlkaXwjWysfODpuNhrfpCQ81tDS+Gxn0QzVnWEUt8V7mMjfWalrGGPbgKmG7Hn7
	yIquo+ZmkA/YLRPOHTGZCZ/5FH04gsSebjwWThMqWCfIuK8smgEFX6+HheGViA81pQ90R3mGvHy
	i8Wy2BQ8zL/1wUI
X-Received: by 2002:a05:600c:a08e:b0:48e:5d91:cfe3 with SMTP id 5b1f17b1804b1-48fc9a075c3mr4764075e9.1.1778618458754;
        Tue, 12 May 2026 13:40:58 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d21c72sm18788095e9.7.2026.05.12.13.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 13:40:58 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH 0/2] Initial support for Exynos850 SoC in ACPM clk driver
Date: Tue, 12 May 2026 21:40:47 +0100
Message-Id: <20260512-exynos850-acpm-clk-v1-0-837532ddbf38@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE+QA2oC/x3MQQqAIBBA0avErBtQI4muEi3SphoqC4UwxLsnL
 d/i/wSBPFOAvkrg6eHAlyuQdQV2m9xKyHMxKKG0aKVCiq+7QtcKnOx9oj12NDRLqxqjNRko4e1
 p4fhPhzHnD8MJ0EpkAAAA
X-Change-ID: 20260512-exynos850-acpm-clk-bed1c23b66eb
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

This series adds support for the Exynos850 SoC to the Samsung ACPM clock
driver. 

Currently, the driver hardcodes the GS101 clock variants directly within
its probe() routine. To cleanly support Exynos850 (and potentially other
SoCs that utilize the ACPM protocol in future), this series first
refactors the driver a little bit to be SoC-agnostic, and then wires up
the new Exynos850 data.

First patch introduces `driver_data` to dynamically extract clock lists,
number of clocks, names of clocks, and mailbox channel id, removing the
GS101 hardcoding.

Second patch introduces the `exynos850_acpm_clks` array and
"exynos850-acpm-clk" device ID.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Alexey Klimov (2):
      clk: samsung: acpm: introduce driver data for SoC-specific clocks
      clk: samsung: acpm: add initial Exynos850 support

 drivers/clk/samsung/clk-acpm.c | 36 +++++++++++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 5 deletions(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260512-exynos850-acpm-clk-bed1c23b66eb

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

