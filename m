Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3C81AAA10
	for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 09:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734686633; cv=none; b=dU2GIZpiCmIYMALUdIi7g4XKbkCVCJrPyddCTd6cFGuP6nAToeDiUgcl+oAvXog2xMpGRN97aYrepe4wqU8QqNQYwr/KfhKvzNjlBllGy0O8L8sOotgxufz1Rd7UYyMaYONe/k6lKnir+srBedAVQ6DHfKMQGU20nBmIOdSRTyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734686633; c=relaxed/simple;
	bh=P2zi0QHsTdKUIcgA51Bko5MKtcxqqN5usJ6c3q1Nx+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BZid2r3I6H0LtSntZg+OZMG9XTnIlmKrlkN4sE2P+GJbdPivK/oS64v2xnJUjQn7aRbsyxpE1TTqrFI1JFJgyDFNkO49tuldxhY4yqtkcD28712jqEZK8D/JfqIVVOl7kUUEkxvIllD5KXx+36Gcwlz/gOSB15lew5M11tcls8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=LkCOop2j; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LkCOop2j"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3862b40a6e0so998756f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 01:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734686628; x=1735291428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iNCwTAAXeO7cfiIJbpT278fKLSv6GPfZdgeicUTKEO8=;
        b=LkCOop2jB84SUXJG3QkCrp+4aFWDxa+j9T4eJA0fo6FUs6HYWQQm1zNOGBYuy3OFqR
         Ff9O1Zc1nLqy8D0HIJ1anlkvnsYY39GsDm2zlMpSo8wcFZOh3zcq6Q4o2b4ipaz2vMER
         4DXFMmh3SnRBexiO08tRs+r+gVpPTX33l9wGmVLutNgKvzGT5RVXqnKQgHsO1phJ2Cia
         YSuI3eq0VYMTJkbF+D4n0ye7M9egWak3rc2TWa99t0cBOgTBO/giqo+326ULd862UFul
         5D3+7kF9uHrknYHB6iYHsL/UMTDg3vkW+EXNPYNb4b91ujmLy8UFvw3/jAzQzTiUZSyb
         jbsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734686628; x=1735291428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iNCwTAAXeO7cfiIJbpT278fKLSv6GPfZdgeicUTKEO8=;
        b=b926TCTF9XhtFuwSVfyZZCMBCXEFSfaXzBn4UyI8L8HXOz5B90Q3lqy+Oomt1+u1PG
         2IB+0IxmFzsr6sw1O/FiyoKYJkAIkd14aUtydxV3l/bu5GK+UjzNylgLmATLGIDje4lX
         GKM5s5ePneQCIdcJw6wx+lyLYp5KY6YWvMY4cmPxuvnWioCNst4mx1WFjqiTUU+W6zNK
         zXmdUvzJAXxgPoFr8eMPhz2+zEx7Gc/JkJUeJyKoqZYzWm29aVXFASmlWFsp91o4xmvF
         vOyBWZ8FK2iX8IzvuFfRfMYf8gKs/FOxeh/j5+oPRgijfya0SIESXUWsGdMR0p6X8LVa
         R/Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXxswonsUfkl64hD0818sJCw/UeWWbozAsuH8t6VaNnWwtJp2VnyS/cpP8X/Y078YOScTezB/PRHj4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3g34JS/qy4UwMXWogktnI1om6kab0VHXOZpyX/tCuSgM4VuLu
	QXi9FUedLPh67bbT8DgQ44M2SopbtDmIVbkCwyInoITIRq+l3O5YNYsYftjekcE=
X-Gm-Gg: ASbGnctHqE749ISVKFYmUWQfTPxsTEjhsPA/6eIqlu3bYZvRjQ3TkHT/Tjv0k0Opv/j
	W+jlE7V7XH4kKsXQwtHeJdY2Sr07kWoS9LgovCjWyidZgyqAPQvJlAsLpr67Bbw/mVtAmJELZLr
	zW2Fa51sOTJCjrENLqXGzy1sCz5ti3xzrVsjDuwCxhKmr+qd7ygAd+34lM4qM5LOhGmDcH6+cBd
	MnS0/yQVEI7dwOMU8I1ez/3YscwcVBMGh0/RK6Uqv4q672H/QPGUDrlvkQ=
X-Google-Smtp-Source: AGHT+IHCGJuc0QPgWiSCcz1rPztAry1sR+Zkfuc/Y/QNK+fl9LlKGIVA6ytnJgB8Y5pGXPIW38hmKw==
X-Received: by 2002:a05:6000:1a8f:b0:386:4034:f9a8 with SMTP id ffacd0b85a97d-38a223f5c51mr1646408f8f.38.1734686628582;
        Fri, 20 Dec 2024 01:23:48 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:c000:46df:1e3e:983f])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c828f8fsm3538787f8f.12.2024.12.20.01.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 01:23:48 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jian Hu <jian.hu@amlogic.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: amlogic: g12a: fix mmc A peripheral clock
Date: Fri, 20 Dec 2024 10:23:37 +0100
Message-ID: <173468657763.2759236.17472540885807657211.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241213-amlogic-clk-g12a-mmca-fix-v1-1-5af421f58b64@baylibre.com>
References: <20241213-amlogic-clk-g12a-mmca-fix-v1-1-5af421f58b64@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Applied to clk-meson (clk-meson-next), thanks!

[1/1] clk: amlogic: g12a: fix mmc A peripheral clock
      https://github.com/BayLibre/clk-meson/commit/799ce46951dc

Best regards,
--
Jerome
