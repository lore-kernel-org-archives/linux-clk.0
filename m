Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00E31BC07A
	for <linux-clk@vger.kernel.org>; Thu, 10 Oct 2024 08:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728550243; cv=none; b=ayNbQo2/sGKjQXCAPRDdaI6aV090LGbHZ49PznBiPjwuWr9recxD5a0fV4waDJbqcr+DqnSQIhwt0/Q6aOGspSr1q4VRn9NL0DuzIBqtqtjdPzS0Tm4XCpdMMidXWbe+uA43we9FXmaBzQqnLbNSC00lIu8DPTQGkr4Bjsc3lUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728550243; c=relaxed/simple;
	bh=z3ez/l61dhCVg9HYagG64y4B3JhRbR7Mux5HiKfRdHc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y1IUdEz5kWl69EhJ4BWIHWqQrTkaPYQWPN8+BqJnar4afMn0k/IJ/0QErvsvyfXXJwBNxifsxrYCdGX0WW/5YASeormJQBPb/+QDl3Xv1I5wKdjkAqzhJjYM1rAT8vjNI1zr/1wZ/Yf1Y9Vgw3vUOYv52qESB3Dk2FWg1YjCqw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oNVpTv5B; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oNVpTv5B"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d4dbb4a89so11485f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 10 Oct 2024 01:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728550240; x=1729155040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aQs7eHLoIcfePSFG7MLMavcGqDeItWvgpHDJCq56Lpk=;
        b=oNVpTv5BG0g0ihfcC2FsNmIjYAn/xWRv/yc3eJIcLIN98aWKU/EbsEBMMT1S5jPuj9
         Ay6NrkgV/UxrdxyRM94guj6OjXoR0cttDr06CsF30LnbzDdZL/fJYLNG3n5/AOI+chm9
         tf/x9ChQ68mqRmwqsK7OMQvnAkGZzbCZrx9MXfwFdmshGRRlJyiLyB3r+bpS3I8qhZwa
         9jhrzp5OjD6GsAQUjy0UgKClcTcvM7lPgfH5/mR6oRDIRi4s9MvOz4BrL9T+UcGBK38a
         pUmWvzn2Saz8nlsXn2gJgK7LZ/Wbw5bXrmTX5Tmul1smQMlFdFprERP8YIs8Kr1spx2D
         YCBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728550240; x=1729155040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aQs7eHLoIcfePSFG7MLMavcGqDeItWvgpHDJCq56Lpk=;
        b=fO+jbVf2vQXZBrRjN8113ZHlaWp4/TOieTNOfA+ltR3ziS9A4V41hhBFKXDqOFjJ+u
         Qh1oQeFs+BX/ofSbe9ZA+c6f+L/6g+bux1AbZ+GhEY+HUP19wUR/fRJcofAo0Ww7yguP
         jeoKUNONrcQblX4GScNofJd0A1i3n3QQvcBA1YH2rKzbNBAwDurEsDDlDalnKXlJS4M/
         hEiWfPYRa5mRTz8SpWpIJT+fXArQ0/vGFGazkY3vRnzh+lTcG+TsEVckKOFEiIivipqp
         0EGWKNfbGK1rcL16Wl2jtc+lqRS2jlJkuq39Gr+VrThKbK9lXLxDMTc9VQT3bLWlEg7v
         n9sA==
X-Forwarded-Encrypted: i=1; AJvYcCUvnMuoW1l1rT+ztLQU3+q0TRv0WrYONI2JmU0NgQcLRL6luI1XRivbD4sLfChrpHAUDRWcdBGt11Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT1rIA4STouGPw5uEYoZfqY+i1y2QRSDYgoK0GZdY1erBwQsni
	Z3KH7O/l+gtf2elOTNu+a37umq0CPPS+gRd8leRuw00iiXOXUQUVyVejw7DCRO8=
X-Google-Smtp-Source: AGHT+IEgI+7jR7sIccWO+9py/YAWd6yyEGtgtX1NOe1YekWpZOfQUG29typMKN9zwT4RSBHy074ecw==
X-Received: by 2002:a05:6000:2cc:b0:37d:4db4:ef6a with SMTP id ffacd0b85a97d-37d4db4f48fmr337919f8f.1.1728550240010;
        Thu, 10 Oct 2024 01:50:40 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b917df3sm879980f8f.111.2024.10.10.01.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 01:50:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-clk@vger.kernel.org,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL fixes] clk: samsung: fixes for v6.12
Date: Thu, 10 Oct 2024 10:50:35 +0200
Message-ID: <20241010085036.141170-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

One patch with a fix for current RC.

Best regards,
Krzysztof


The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-fixes-6.12

for you to fetch changes up to a03c246d4ec836ae5827a4a16f6b9e730ec5ee8c:

  clk: samsung: Fix out-of-bound access of of_match_node() (2024-09-30 13:10:11 +0200)

----------------------------------------------------------------
Samsung clock controller fixes for v6.12

Add missing sentinel in of_device_id table, so the code iterating over
it will not go over the size of an array.

----------------------------------------------------------------
Jinjie Ruan (1):
      clk: samsung: Fix out-of-bound access of of_match_node()

 drivers/clk/samsung/clk-exynosautov920.c | 1 +
 1 file changed, 1 insertion(+)
