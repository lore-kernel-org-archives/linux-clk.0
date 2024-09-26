Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F344C7C
	for <linux-clk@vger.kernel.org>; Thu, 26 Sep 2024 12:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727354390; cv=none; b=ELsIhkb9hWSKQ2SGPplvG6h8pFcfuBBhfc1xtXPRrHqeUaTMCjzzM9qxkXf9YFXdNtZcn5/GO/joYyJFiESu8Fa0FHEtcRwaKqHoCYsprvAA5cY6GnXSAUpx1OCzKy1T8oEB+mIe8umMLt92+2k3Rg6uW5Tp8WewCVLddOGk4rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727354390; c=relaxed/simple;
	bh=skLMy7f7c37t0z3nWcLfrDGCEYVCt+S0rBEfQwg9Em0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=akJkBWpW+L+6ZXFhQ5GozL6dq/VHrWbHffkW7O5YlznvRr91tlsjNxMjKrRBKXl6t5nahcPO3CB2Z9GVQGh0u6otpr15nM+7UVMZR/KjgdvOUKCm0lDAGXvlun+/xEkg0xTDx84SKsaMFz2diBioB5w7QQQEEc/NGFn4RFGVz94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=jmXU9Xu1; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jmXU9Xu1"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42cb0f28bfbso7971815e9.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Sep 2024 05:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727354386; x=1727959186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQzQys66bp2Ld4WzPHqpjCSslimeJbMa4EBqGsAQRVw=;
        b=jmXU9Xu1r/c92Y7is6oX9gV7Sk5UzQAGEo799ExfxBFK+bzXJuxhRi5H5h1xEZLtKY
         14sMsOFdneEYEfNuvZBH5hz99WU2aRbwd79JEVHv+noNmWzOc63cz/smcvNJJptj6qBP
         42cZ3SSON26syfi3xrSIzOwWrW4M52GDv1RMXilcRq+s3IVbUNcoTOgqPp/Ii08OYTKR
         zR1k598xESUjmtE2N0nXCFNyZWKcWtHCloYQ2gE+eQuHt386eYkD77NdiWPv8iztuR95
         D0lPFXZ5DcLs29mso6McY3E6AYzT2C3ntTa5rjo3BhH3jegEYg0lc5OweJdow5gL2+4O
         rMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727354386; x=1727959186;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UQzQys66bp2Ld4WzPHqpjCSslimeJbMa4EBqGsAQRVw=;
        b=ZRjwknofiM1aUVkpzqSb1f2saBjDI4pKqwK+nqMCBIx7NUdahetIo7mzc7q7CfYvj5
         3M4b0vyvB8rDEUuUPyZZkwIPId57IfFtqQLd6A3xiV9B2mZoT4P6Qgz0YOHLPO99B3El
         n6BkMmATSfWKfg2fb5SqAgGFXfjNWP0G4f/BUnRpoVAKoaH/esPAS3DmUcmnIgTSqiqf
         xRC1y1FMqP/l9+GQppmW33T3+xKzb+0R324gd4LcRn8vg13Lr4nEeJ43Z/04QJ3DR6d0
         aVFSakDibhXvkAVhPmdEMcTHu9WAQ/6fVSwoXKPXInGJnCnvorqtFPS+r81oJRnd8J6p
         VZ3A==
X-Forwarded-Encrypted: i=1; AJvYcCVMzOalP2ZCaJVth1gaDk/cKla+tcMtXi42936T/K46JDn6d1KV3Pxox0vRLMd9w17mqmyEGhRA3KU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp1w4V2QEWFTbplTJMyLI9K5X+MaMoXuWS9xT4KRWNfhlJfcUM
	7t5nOg4BNlQAumY40yZ0UaSYMrYKJ5NT6TXNQ4m/MsOggFmX2dbBp2e4ZBfcQsY=
X-Google-Smtp-Source: AGHT+IF2ktbSn3Aj00xQyiv3ldfTlz4uwMS6dZVkDgJF576LsJ1mascH418BisllGC9fT21zJh/9dQ==
X-Received: by 2002:a05:600c:1d17:b0:42c:b309:8d18 with SMTP id 5b1f17b1804b1-42f50d550e3mr31033565e9.19.1727354385700;
        Thu, 26 Sep 2024 05:39:45 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:4a84:8f2f:8bdb:87])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42e96a0d8eesm47177135e9.30.2024.09.26.05.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 05:39:44 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240925-clk-meson8b-spinlock-v1-1-50b7f2d02d7d@baylibre.com>
References: <20240925-clk-meson8b-spinlock-v1-1-50b7f2d02d7d@baylibre.com>
Subject: Re: [PATCH] clk: meson: meson8b: remove spinlock
Message-Id: <172735438430.200072.15149649780547409113.b4-ty@baylibre.com>
Date: Thu, 26 Sep 2024 14:39:44 +0200
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

[1/1] clk: meson: meson8b: remove spinlock
      https://github.com/BayLibre/clk-meson/commit/e736da1956cf

Best regards,
--
Jerome

