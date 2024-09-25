Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A656088F
	for <linux-clk@vger.kernel.org>; Wed, 25 Sep 2024 14:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727275320; cv=none; b=E4iJILOTYt0ODmDoq4t0Wzr+JM+9ruh08LBxAeD+qIr5XHqqJ8bgMjNmUteqdNqDVMo0bLkLr3lhQimt4l/3hyDaNF/TYPSRZFzOlB4vFFrFSTgMMmhZaFeSzQU1yVnCFBGgNunPQtj1MCTOpv9pL2FroMav0viMGjecr1N1I4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727275320; c=relaxed/simple;
	bh=N1n1W7kyeF/rHmv258O39cO37qviIuMCgrLTAZnXVbE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sBOo2SePU+RMPoRcJ9yS3BSrCVOqz8F7KIw/syxOSDwJKMJ09UA9Ynsow49OhML205YENt9izZg/7xTRVrdZt8b0wK+LZfosT2t/m2uliQQvtrlQKPT3BVG+YxYzONxs7G9d9dp35Zk7nWxVMGmaBXdacAP/i0afEXG0G3Y5qps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=YGlORQfX; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="YGlORQfX"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cb8dac900so66997525e9.3
        for <linux-clk@vger.kernel.org>; Wed, 25 Sep 2024 07:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727275315; x=1727880115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6YxIAdzjayyAJ7SPnjQzAFuzcgXCfaGhFkXioDlFtQ=;
        b=YGlORQfXTH42+sWZLhKOrXvRQfP7AmccreECKHo2OC4f3DOcsXzApuEaewo4ZJTkyF
         mjXEsZAq6B6DNTBo9pa5zOunrVBv+WMo0qIY64RHdP3kZ7hMiAo66gw6sKZnf/aR43Bu
         9OhsBAEf9nZhXxSlJrxgt9LAmW9Sq7wjX+yo87UKsNN12fbYdTxd9XzHNYkFOy7sgeLO
         CBHjKAJaF0yQ7Uhfn9ORVJmLTLclRDyhB7Bg992b/mLRayehhjUmOSU1nP6/syetnT2u
         zTBRg5XVW+lq8H5syzkPFjUAqHAjrJ6wLQlY/xyD8Pvve5jpTKGqtJGVWj6DAqblbkTc
         Qv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727275315; x=1727880115;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6YxIAdzjayyAJ7SPnjQzAFuzcgXCfaGhFkXioDlFtQ=;
        b=rNFP3b3JKC3T0TgdM7a8TQzldRlIoI2CpbfSc0NNlg++9ZQMkTQwK6DpBeg4HPyopt
         BJAqvLpjmLc0FUNyuFqUkvDSIkWdJCf4SXIucCrMbdBg9yRq3lJ8Exj6kgFs+X1biAg8
         Y+nRXVZGrTf+kMcR2KlZcU42Mkk70Jii5u+rJFYhe/09qkLn4a2ZrKfOAHuNbbYo1Eu7
         V30EeLyskSsANecdG8cBk7NfV6aQEuPA5tbv2qi9kBi/1cg2maDST80lyDxW4+3/3w/5
         FoF2fMcLSVTO5V1EHPUHx/WkoaSVOfqs8vS892bdLnl7RGXSCll6Wln7kiGC7k8gvOaN
         yvuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFKk4UTCUaMGPVbiGlEeSwM3zPgn3nyBCx7EPMOjq4K72BMHLkCLOQabGFc9Q9kYLFKt/MXCv1Zuk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJFe+Ew/SCrFNum+n6ffMNdcONKVgEH+aS/Xu5T5FEP95TuVf4
	MTrypa7mUQwHRyyLzT5T00kpPuYp7g90Ux4YxNOibzzUU51i8mrYqvJLP4MWkXU=
X-Google-Smtp-Source: AGHT+IHAfHUuxoeTZOXnlSb00AtCPxIw644azB+Jwg19bMpf06tWeqhuqjRnBMg/w0GGwp9dIbB4gw==
X-Received: by 2002:a05:600c:1e27:b0:42c:b45d:4a7b with SMTP id 5b1f17b1804b1-42e961465c2mr20376755e9.25.1727275314706;
        Wed, 25 Sep 2024 07:41:54 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:857b:1996:7ede:6ce4])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42e969fb894sm20822045e9.16.2024.09.25.07.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 07:41:54 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Chuan Liu <chuan.liu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240925-mpll_spinlock-v2-1-8f9b73588ec1@amlogic.com>
References: <20240925-mpll_spinlock-v2-1-8f9b73588ec1@amlogic.com>
Subject: Re: [PATCH v2] clk: meson: mpll: Delete a useless spinlock from
 the MPLL
Message-Id: <172727531377.78586.12477940902502018099.b4-ty@baylibre.com>
Date: Wed, 25 Sep 2024 16:41:53 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1

Applied to clk-meson (clk-meson-next), thanks!

[1/1] clk: meson: mpll: Delete a useless spinlock from the MPLL
      https://github.com/BayLibre/clk-meson/commit/14b8d1d8b2c6

Best regards,
--
Jerome

