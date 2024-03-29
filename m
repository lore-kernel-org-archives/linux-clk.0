Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D72A54F95
	for <linux-clk@vger.kernel.org>; Fri, 29 Mar 2024 11:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711711611; cv=none; b=ApdbPXO6b2XYdboFe2L3oYpOoVS0zr4Lloz+TBXS6W0P/lS0nWVLMRKekA0wZndYBOL+Vve+nhfl2Y2SNyjkPFFMy4JocvJSzuDY6zPInquqLGkWmQhZF8M1Af+OeJ1uSxSvRYVCaCnqojmPgWQlU0f5Onqhoi4JFIU98goxFUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711711611; c=relaxed/simple;
	bh=yZYIKkF8UnLi0VeCGQ8zrkFnGgcqBEWD0cAzkOL8swc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jX2jfHckM+17aRfy3GMCpVm8ARk0RHGr4oFbtBp6MiRyKrtv/85ZE6AfutJo3QaxsXCrSHiMZENEEvW0tc6A0yP32wzw6X++zGPTmrexUAhRVUQFn9sixFanLOIT5RCtTutXZlMuamTfCXmREStBsqDYfcDbjjkY5f2ixBZBg90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=EFUxathG; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="EFUxathG"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-415523d9824so1927005e9.3
        for <linux-clk@vger.kernel.org>; Fri, 29 Mar 2024 04:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711711606; x=1712316406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=urQSR8k9rOH+nEhJnDB+ssPUq+9+ZuEfluly8f2j41M=;
        b=EFUxathGEBqbGld9LFzx1i+c/5lefNiA3YosEip3XF1F74oR8PVEfoz9Zhteb0RvD8
         jDvRWc3yOPgNYmyJyvSYAQRIDXYV+0m5Nco9IMEza1cGElHHXrcSHrNXAzAkHh39l2kQ
         QjNJJR7Jdhz61fas+wNVLW6GuET98Pwu+cU48XoYLVkZ/skQ67BaCqcwyVkR+HG3tD3T
         i+PKJLgtpUgx1gviBmTZLuCfCu6azh4qhN/aYtoMbaHa4iE7il60+g0tpVoni1g+tgk1
         hx0aouTVwFaV7q1HmyyncmnYKhM2uCudtHBSBueduTzdCen6410rJ5i/7Gbu9WSSHt5L
         Nkrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711711606; x=1712316406;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=urQSR8k9rOH+nEhJnDB+ssPUq+9+ZuEfluly8f2j41M=;
        b=SuH8MPs2Sy4nIR/ov24l5UaAy1gYujgihTjO1LepTPCaUjzOVbfpL/vXcyS2l3+nPJ
         UmGGOHxvzaFeLFRY/CyXhfGUnwzZXfzaDrwsDEK3ZLP/5HciQ8w42oYGsbxX+mAtsQ+A
         RwupQBcSWisi6T4PDtPgXdlguNi8EtHYzLrty0F+i1NxmlE6B00hfZy9EYRo0TEl2L/n
         soz/WZGai0Fc3j5Lio10JOseFiokrgHG6UlvGuf5ttDJxfC876UMA185/mK3CkeMx4qf
         j6Mv4gob2mGpvkLgnyZsDyd7UaOWBnsvs9fFYKdAwmEKP8jpYTCgQ2o/dUaGP/9KoE+4
         h0uQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIEspzdfFI+EdEnF5g3zTQWKM72v4OumP2shpk3i/HRqqOY7f+XG+zHGWyy6w1/p0r0NYz6mjw/Zxi4knMQxzvv2oKbAGWfZws
X-Gm-Message-State: AOJu0Yy0h4lWlzBPF0GwH28CghXvaf9xK2Ws+iOHt7IPA1rm+MImJyPu
	+4lcQzCKEQ8T4zjamOL1ech5uAnFTDSX1VnlT2BhUHse14z05fzqfFvpxwkMDMM=
X-Google-Smtp-Source: AGHT+IEsa3l7CpsgPVX8Rgmc/Uh9bBz2bb8jJuVTT5cPVRLshmDQEunujRnG/h9yH8ptoWIh5fCf+w==
X-Received: by 2002:a05:600c:1c84:b0:414:8e39:7331 with SMTP id k4-20020a05600c1c8400b004148e397331mr1836350wms.3.1711711606499;
        Fri, 29 Mar 2024 04:26:46 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:f8f5:63d4:de5b:e4de])
        by smtp.googlemail.com with ESMTPSA id k33-20020a05600c1ca100b0041409cabb39sm8227448wms.18.2024.03.29.04.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 04:26:46 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: neil.armstrong@linaro.org, mturquette@baylibre.com, 
 khilman@baylibre.com, martin.blumenstingl@googlemail.com, sboyd@kernel.org, 
 Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: kernel@salutedevices.com, rockosov@gmail.com, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20240328195733.30572-1-ddrokosov@salutedevices.com>
References: <20240328195733.30572-1-ddrokosov@salutedevices.com>
Subject: Re: [PATCH v1] clk: meson: pll: print out pll name when unable to
 lock it
Message-Id: <171171160568.1289725.2666199134517231048.b4-ty@baylibre.com>
Date: Fri, 29 Mar 2024 12:26:45 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

Applied to clk-meson (v6.10/drivers), thanks!

[1/1] clk: meson: pll: print out pll name when unable to lock it
      https://github.com/BayLibre/clk-meson/commit/16182ac30a68

Best regards,
--
Jerome

