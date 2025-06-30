Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4362623D28C
	for <linux-clk@vger.kernel.org>; Mon, 30 Jun 2025 10:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751277644; cv=none; b=MngqfArHxmJf40JX4a5p5PNeYyrvGSwH9WqL76cyTPztvJWxCw6zrmpVrPXLG5Q+yTW05upL7yLkqaIRjgFNG0yWVj0IEVMkXLMZ8aUEkURmivc7wvspS/Qf5Jo73Yu+tCJaNSnfEyvnT/1U3fhbRE4HMBGf2ChAyMmOlaPc27I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751277644; c=relaxed/simple;
	bh=v6MZTsAebqK5pi8z+h84sS4gvkSWKDyxRKB2fdUTHNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JfjnL5hHVZedchPdOtWajkDYoycnWr6xEhsJD5ZoMPTeukfHOXX2FFW+6RKhHrYzzAwq/NgCEy9Hj/1OdMT/7Xdy8TBCy7cxVqI3YuSMk4Jcikvrtb13gx3LeFRTbyXUgr91C+RjIjjHg3YUduFr4pIT38k6ZRC2gCly02yeHLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=lKj84BDe; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lKj84BDe"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a54700a46eso2074610f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 30 Jun 2025 03:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751277639; x=1751882439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XkT/Rstid8JISpjAt6SdqbTq9GQ5RgC+pCfbEEzIrEg=;
        b=lKj84BDeaA+50NB2Tp4fdPZ0rJoZjpixzBJ47EsiLxFRBDjj37CCdnF+QWpesVDxS4
         9mFr4HGLlCmeqYhxm5cni21domuaFjit4DZBFU080iH6PUfh6ce26vaiD2MPnsz/1+iy
         VZmckJGXiMz7Xlz0aoeS3ODCi/HOKyx1/0i/zNvFxHa8JMZTVGO9SQOs08EqUEgZ/7vV
         p8kqh/KNyivWt15bIZpAvRsEruBNlfqfzV8bGQfjMX8yoCK8EEvJFTBqi7EcvWZC4yby
         UfUyBxX+AUN1s7XX2pED0fdVCRZ93t2ofhpPzv5U/DU1YPGjR2xOMSTHDt3F5gctKydp
         t91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751277639; x=1751882439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XkT/Rstid8JISpjAt6SdqbTq9GQ5RgC+pCfbEEzIrEg=;
        b=rCDGj4NF2/FSIkwXlLiwyjcNjT2IkxeKRfWwkQ1w0npwb+eKVrAKTMqpYiuq8OLnqK
         91bAvqX/mjzpNXxM0hJ6T9C2QNQQ6sih9zmsCa4rD0hUhs2tAI8QJhssulYiEDZfzFUm
         D98et2/4/RFwhAaZNnSaI6TD7qQCCL+m4NIbcqChnvYyAfoL9ENi0dBZSr4MNUUcHvwb
         0kGJINuUFkpjFnacvqiUZ8sjRLUvAQtSx1KtjC/5J23hIM1EdppQ229585J6gxZHCvJp
         w4Hhds5/6YP2UDpF6tO/WKqrcZp6Iev41LHutYsTL3YPB+hRapAtUy5IK3gQlSDcgI78
         DuMw==
X-Forwarded-Encrypted: i=1; AJvYcCVssi/z3t40+PzOAnO3uF61XRtGGKn36Sn5J444+Ykuld2J6ND7PIxPlpp1FDX6o3+3msdKOIIrVFk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNiYAE8OcshTa6oJFvC5U9V1yDaSg5EbV85UFnYerQTnO3pw7e
	JRMYjikK7faLP+HyKbstOh1AjBaSETyzRbDDCHmTAlCTlTqha8XX0rWgFMT4Q/vWk0s=
X-Gm-Gg: ASbGncsSA7uxPN4SVJGs+ZtN3MJE8vRtu0mPqNV/kTrUDP9lOXvMwE+xzpLbE9tlLf8
	M7X8t2+omSftVkxEiCxrIxOk/ijLYG7aiFuQ7cIZu0bip8WiaxfbakCthu+H1Ha4En/93TvcFgM
	14Kbffwm9u2HkdnUfgw0cEUz/rdeT14Sj6WL3Cg5nf1Ju7sPnC5ZNeXlQjuCTMbqWuvHYnvWgVR
	1RPNUpFDAnsE8JSh9YUcojiqqJK1Da3ovmo3myWIqQtKWtEn2yAbRWRE2mH/SydkweSKKgxPmuF
	AbmOhfBXt228LHgAiSsqTmfmx4UXQp2APuq2k0MCr4PdWDnPNbspLO4G6+MZvQ==
X-Google-Smtp-Source: AGHT+IGr8kDpio/yTc2q7sbJPgt53a5XcrIQFYk6F8xhvZP/fdYVNcvrjEwO9kaxLpdzOyi51LJFFw==
X-Received: by 2002:a5d:584a:0:b0:3a4:e844:745d with SMTP id ffacd0b85a97d-3a90be8d151mr11063926f8f.56.1751277639515;
        Mon, 30 Jun 2025 03:00:39 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:279:fce:4bb7:6daa])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a892e52bbfsm10076002f8f.65.2025.06.30.03.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 03:00:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: amlogic: remove unnecessary headers
Date: Mon, 30 Jun 2025 12:00:16 +0200
Message-ID: <175127759469.367173.10851786033226658116.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250623-clk-meson-no-headers-v1-1-468161a7279e@baylibre.com>
References: <20250623-clk-meson-no-headers-v1-1-468161a7279e@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Applied to clk-meson (clk-meson-next), thanks!

[1/1] clk: amlogic: remove unnecessary headers
      https://github.com/BayLibre/clk-meson/commit/328d4a7eb073

Best regards,
--
Jerome
