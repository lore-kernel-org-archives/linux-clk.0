Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0947191497
	for <linux-clk@vger.kernel.org>; Fri, 14 Jun 2024 08:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718355526; cv=none; b=sGaPPTeiJJ91G83V2WzfjXIAiCcB3AEQ8Rtwi5KLcRz+tjAIbqDcbpB7GaFiSMDkhdaYeAQiQpYnM7OIX3tJV/EG74/RzOKKSkjqZI5gr7dMXUM0Yt73wEYfrKuEzjGORW7L0lhOvLsBjc7hGa2zDyTcLyCurHwHzAGUR9Eo9Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718355526; c=relaxed/simple;
	bh=URmpVX+h4mlfzvCudxDs8P7msnxwTQi7z+C/vPARdO8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OBwgCrX/4zQyeGoplIeDmoZJUARovD4yuAiGtO42FP4OhE82DUlU/fpMgN7jr4KKuCc9LispNt2daFJaKRCt0iJJpXvXVJ63HKlVlyCKY18K4P0RcY2g+ykedYprRZcanfgaqRXlDYgBWhCAcEXYfsdhm2qcMSKAJRkHrUA/V3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=sIE1IM6w; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="sIE1IM6w"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-35f06861ae6so1803642f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 14 Jun 2024 01:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718355517; x=1718960317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZdYyUMalkTDxkfe8DhCeZo415hoYlYCOiWfh55zkm74=;
        b=sIE1IM6wTzZbA2n/M7MHfRak/+tL9UJaabvQeKyDTWBONyx+oj60Un9OKIiS2Twpt6
         /8c+CdxpM/AN+yqiy1/3TUOgTDw1N1/Dj7L83N+P+8EuggPykpkdBQqAH5DgTzptAZKO
         1dpE/nhmCOR6Bf1neJAq4vLWd7hcsPI+OZw6Pbb8Ia42nDWRJCVq5iaCV1MI+nlY5+mu
         DJgs3mW5oahyS0CslTb9Pondj6kQ0IBysLgrjqrLpPZWYt1Xny0m26en7h62ZpvQtHG7
         TrYMu/NGfHZR8yORh2gvWQkIGz53+PpWqvHKiT1ALn7IeLcfKA0LZOG6roS8p2sAaH2n
         Edqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718355517; x=1718960317;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZdYyUMalkTDxkfe8DhCeZo415hoYlYCOiWfh55zkm74=;
        b=MApUOhVTMKHHj7nUMZc8gc8894zEM7wGyp18CyhRb/Vv5dS9bujWE97G9+4fZAkSHa
         2DcSOoveR0egimzqua1F2nsPgDyOhl1C4EXljNfeL6/UvFpPDgLAPtfoOGroXz5e1EcF
         mKzAGq5IcoWl20O+busSemlIQ60s36tF8O/tGcRr8mJQ9riP04oiFljP77bZhezu//Uo
         ndZnWnZqmUQJd8ME8hrkLqxvJHbsbY1c9mx6iVuNA8ujPYOQMAfinn/9ZH8mp7YFHwGH
         i4lPJDlgSJPCac9LN+ajl0jHoULgnITcg2WSDNoonha9NmPei7xYdbs0fv46AeX8PRnj
         rVVA==
X-Forwarded-Encrypted: i=1; AJvYcCXf2GmkMObGscVFlRtOqfkAC2v9SwL/e6TnCHZKoe+6AxDQ3pQcUSe3NdtNWTzTHHHzsg3FBEZmppV4TbIvA1bI8Xw2n8qxOHj7
X-Gm-Message-State: AOJu0YznIibXNTGKAAK3GWjcLd40rIQZFg/qocYaQL1E34AjuMUm9wam
	DUyDoBTjYo9hp3DaKek9maEIaKwJTIfO88righhSs1LTgfI4x9f77AsQ257zErM=
X-Google-Smtp-Source: AGHT+IGM9Wi7J+z+MS6fiYn0dNhK3jifJCaU6+orZ5nbibQS0YySF3uGnRU/B+esBgM56A84wA1law==
X-Received: by 2002:adf:dd8d:0:b0:35f:28fc:98eb with SMTP id ffacd0b85a97d-3607a764b54mr1322002f8f.18.1718355516988;
        Fri, 14 Jun 2024 01:58:36 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:d811:babc:4f8c:772b])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36075c6fa4esm3632562f8f.67.2024.06.14.01.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 01:58:36 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240611133512.341817-1-jbrunet@baylibre.com>
References: <20240611133512.341817-1-jbrunet@baylibre.com>
Subject: Re: [PATCH] clk: meson: add missing MODULE_DESCRIPTION() macros
Message-Id: <171835551618.663007.10385411290888790860.b4-ty@baylibre.com>
Date: Fri, 14 Jun 2024 10:58:36 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

Applied to clk-meson (v6.11/drivers), thanks!

[1/1] clk: meson: add missing MODULE_DESCRIPTION() macros
      https://github.com/BayLibre/clk-meson/commit/befe87380e21

Best regards,
--
Jerome

