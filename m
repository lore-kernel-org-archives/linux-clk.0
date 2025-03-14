Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D47A200119
	for <linux-clk@vger.kernel.org>; Fri, 14 Mar 2025 15:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741966342; cv=none; b=gZfqL37mo9ZC6N+HVsyp50yptqIUcpnJaysGf+3bORJ4rthYADyy49N5/VJcw7M5NDh0x9+AM7iNza+jhYWS0TqAdchDRTT/wmH7j+liH4Pa8Nrorg1lqCMxtoDezEq8FPzawkjgRM9Hbf4F8yQzf/LfSHS1dj9sqKl0YBw9b5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741966342; c=relaxed/simple;
	bh=mjckCbx8V8lajM1SPpyowxlZbZf9qWy1YA+QL/9g9as=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ckw7MsKlClW0Jb337zMHi1jcBHa2qFZUNwrweS6/2FGfBbUsT8RMUBx4bgMpZrc3cf6tUj7SkctqcGSoX5+zRWFyN3mTTGNdWjPpeyoBJ2C8OCIkQ6YYdsvA8oJyH8/2khbxhDv1gW3mvIvyVWoUBp3zWmG1ZtP9bvGu8za2Mbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=LKuWq4zf; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LKuWq4zf"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3912e96c8e8so1473519f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 14 Mar 2025 08:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741966338; x=1742571138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9N6fTM6SFDsTbt/1MZG+/5cRZlKHEghdhbe8yHn1vL0=;
        b=LKuWq4zfvLXjklAYuCVcDYSRCCtj0W1Lq243Y2AXP/K0ajgBCCih1ZcLbayOmCDDi0
         RgMyt6l+g+no7qwnj2g1SHkr9TxGrecAYppJlGgQrr+PH8K1rbBouWqNvxfPHQTUqON9
         opv35RrZu2x+DUXCXRh6fs5EDXD7KxAZJVFkNPDBCIzUIDr7FvzCc6EsO5jI5OM7k+6u
         mkdaXvqRyHd+x6LxDIyM6/lhDmm7lzF19+RfuADhzaXdDZzOJ62K3mKpuXq4/FLc9sxz
         yzyEC2DKHBYdZF0js6f1AnjssmfbZ1REoUj1R/SHtREW1KLoWITpDQSm/KR2FtMSt2G+
         JH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741966338; x=1742571138;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9N6fTM6SFDsTbt/1MZG+/5cRZlKHEghdhbe8yHn1vL0=;
        b=MC7t7OnPXdUd88yrpyAXJeENR5N4vaU4TuHfVFcbWuzJbm5Qha/AOIfnVnv09kTQPc
         sJ4WKX3AxWeZVSQz/Fue//aBZFR2XTd26GEp8MpdICzmRTg+CKbJC9LFgPRegfAvQV7J
         Bg3MWsRH8R6alryKCCc+9eQ6J6mWceUnDsqZ9crLO5Ce/ovyne+KusDj/Yl9MYEYcfnR
         yibQK7enNqeGcBxqf5uwHTxxOuUqfUOGK+legatAvhBzgFKRrQEpvWeOMilYp2/8mjus
         DM4DeowPCb01TbhhSiY+wUtLCGqb4IaaV657D9IxAzeSQS5SPPqlfPWUwhDyD+CJk5wa
         61xg==
X-Gm-Message-State: AOJu0YyjcSEkEU3Uy3ZvcnYzsjIW4dwjd0xx3VY6ktiPcSG6iBLJmhFh
	vWoMYf6Gp6V6QCizLFbWlitdwsmZVq2h8umuRMzMQMr5bacCgmlx0+77B9/f+hk=
X-Gm-Gg: ASbGncs3+SaTGcmUuGgBFbgqkUsaBgEXkXefVmDufJFwp5wt5qcneK+H6488KoDPKo2
	y7UNagOgPs80s+VpBwFRAxdCdzA25n9oCCYj+j5mm8ci+elNvkEZ/v9zFxdErhTqWdcUWytFL+9
	/767gQtjJyITGLaRlAq/cwJfxWzV5gvEezdKOodMq4nynGlCMqIQnWT/f6ADeWPCm9BG+EJ0S3J
	PWRE6fndXBBRKJ58xFe7YoCmQQXwdiTheq/XoPrGjpW1MnHyKswKYf1P4Qt6jWpY+FiCPm24EeP
	2PntCXD+FTT1Li2F7cLA921mQ90WLZ81OHmCGPiuCkeZhsEEQbE6z49tIa8oYGUmY7HDyw==
X-Google-Smtp-Source: AGHT+IElbbi8SqUshMCl/+GUOzbAuMlg/4w/X9x5Rezrz6ar2Vdo2Qvg6tqIZ2ip3uemwQDmNf/X3g==
X-Received: by 2002:a5d:64e3:0:b0:391:2f2f:836 with SMTP id ffacd0b85a97d-3971d336b00mr3512774f8f.17.1741966338308;
        Fri, 14 Mar 2025 08:32:18 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:6eea:2dc0:eafb:9b35])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-395cb318acfsm6036005f8f.70.2025.03.14.08.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:32:17 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, Jian Hu <jian.hu@amlogic.com>
Cc: linux-clk <linux-clk@vger.kernel.org>, 
 linux-amlogic <linux-amlogic@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
In-Reply-To: <20241231062552.2982266-1-jian.hu@amlogic.com>
References: <20241231062552.2982266-1-jian.hu@amlogic.com>
Subject: Re: [PATCH] clk: amlogic: a1: fix a typo
Message-Id: <174196633722.1526311.3272915728848116488.b4-ty@baylibre.com>
Date: Fri, 14 Mar 2025 16:32:17 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Applied to clk-meson (clk-meson-next), thanks!

[1/1] clk: amlogic: a1: fix a typo
      https://github.com/BayLibre/clk-meson/commit/b3c221e752c4

Best regards,
--
Jerome

