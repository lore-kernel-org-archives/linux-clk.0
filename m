Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E7D1AB526
	for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 09:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734686634; cv=none; b=L+zm5iFeASUSJESHMxwADvpPymzmYJdAeGR8uuR5blyV88RrY1LM8zB6BgaBst8B+/kLLVzFSy4iOW+2wkPoROE45qmxR5wvNgfkKO8pjVDKfmIMTf6+yrqzamcvkSagPdJsk8p4N0UCSxecRWxwmJGllJZ/j+BnujHgSnPS7EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734686634; c=relaxed/simple;
	bh=hfSDTdXgSCxx/TNbnyObm+tzOfA5J79u56xEq3kEoNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gyiVGRPWblozaGzVna1A9N3BCA0UGsfAOW9ySkSgK7hqo8hLwgmtDDxudIB0LnWZA4ERvY9S+VJMJclIlcXqkfo6vn0KldNdAHyx+nqWQVqAveb/aoOz5fwPmiwN+xlTgjni0ZG7347OySb5iVsDRDzZosRGlJH/o46lTk++9RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=bPeZNZBo; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bPeZNZBo"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37ed3bd6114so748862f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 01:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734686629; x=1735291429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAGVHkBAv4DKPBWXbvZEL50b7QWLDGXfPoabj2FSbxY=;
        b=bPeZNZBoH4NzPPZtCYGquxqwtyuIeE91Zsa8u4VQzGLoiKUVbSEJm5hf35S9tj1q6v
         3njxqwvVLqF19yXuDcqaRp/I5FujztHHOMGU+64c70Y+xEErs0mGpA6zPUZz+eRJQ3Th
         K649v2mce2FDw8aYsWztEhJC/6TBxsqiMB6GFJmKO6W2cKEOp5LisRJYFkWy4+l3WBzU
         xVZFIAEN8wsbcfz5I0TDEstl7wxwJG01xY4LHCUof1akRo1MkYCgyG4UaU8Re+8GRRrn
         At8IOX2xrCnOq4PNiMZfOr4db/QCs6YgccsheeFQlgrvrIuDLZtl0KcGjqdXyHGj5Kja
         E4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734686629; x=1735291429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sAGVHkBAv4DKPBWXbvZEL50b7QWLDGXfPoabj2FSbxY=;
        b=DHE7JGXD8zB2cpj7pxGH41HnHCka05FR5cUcNTO0okk7M9/vUIbf/UmUMRyeUDjPAN
         SzNyX8MsLiRHA+MfcUKr/+WHdr7oFrXO9ASNPNJOyORF9vbH1JZ2el6SNX9sf8NaTtqa
         tw9FpYtdP67D0QkhCnafLzJSxuhwvRIaXS88fwMTPM3+6KSR4voAmieg4Txr3XXemCxG
         oI4r6yVRlscwYlRez9EckVYfF1QSd9zDksxRGoFw9zlimsrKie7QZs/zkHBT1Prq/heZ
         OctCIeqnZyAVrcuGLGWt66F6Vu/xbIBjEBj88mzsVPRTGxydYB3TwfxjIOLyB8ST+mMf
         RrhA==
X-Forwarded-Encrypted: i=1; AJvYcCWJwk5FD2UVdy1qbOCsRI4g8vXRUZtMD81h6gvmYNyE640mz3Wc7XxExD/WQFfN5qiGjocG2qzrYyY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsyukScbLHsVbEPBFDLjrmdy68phSZa8VxwmqMiN09ST/9NpqT
	TvbkM63X19sTHhDZwQ5mJk8jTb9mByXzVKQMNL3Pi3TIYGmpy3i6LJLiKqpl4vY=
X-Gm-Gg: ASbGncu6IAwGLMJ0hPWdCM4JP+CRz56XzunFstn3ILm9VvQy2SzQRuwDxGAWrLFgvHU
	wNbhf2vpZasepi2u4L1m0NW3ePJy9tIepiiUVm0I2/ugwZ9BvrM6hiaIVHaRYTeQq7PY5Cf4hqX
	6QCRGTn0jGXCgK6GG+J4+tSS+Ej47BEf+KNdvs14R/TaQSXFchh7S0esB2gFcrHsVvPSLoc0llG
	yyQouQ5Dl44QGrdruKcHWFkxIfpeoT0GK15xuH83LSTt1yUP9Ae3vVL7cI=
X-Google-Smtp-Source: AGHT+IHWOjD/ySetVcGFfENJkiWJiFBUr1+JfvjdK6eG9oGbSiFLzshOfEXMASqPgSzH7pcRRzPmsA==
X-Received: by 2002:a05:6000:481d:b0:388:da2a:e48 with SMTP id ffacd0b85a97d-38a221fb99bmr1646750f8f.23.1734686629442;
        Fri, 20 Dec 2024 01:23:49 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:c000:46df:1e3e:983f])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c828f8fsm3538787f8f.12.2024.12.20.01.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 01:23:49 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: amlogic: g12b: fix cluster A parent data
Date: Fri, 20 Dec 2024 10:23:38 +0100
Message-ID: <173468657763.2759236.18371740322790756565.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241213-amlogic-clk-g12a-cpua-parent-fix-v1-1-d8c0f41865fe@baylibre.com>
References: <20241213-amlogic-clk-g12a-cpua-parent-fix-v1-1-d8c0f41865fe@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Applied to clk-meson (clk-meson-next), thanks!

[1/1] clk: amlogic: g12b: fix cluster A parent data
      https://github.com/BayLibre/clk-meson/commit/1909d0d351ed

Best regards,
--
Jerome
