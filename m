Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6F41514F7
	for <linux-clk@vger.kernel.org>; Wed, 27 Mar 2024 20:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711571265; cv=none; b=P7y9kCPAg1nHKOv0zTkhf2Mv7AghviORrK26FtI+aBaBuytR/nmiP0vtqycchvvxnVDM6VwzVucga9QMRTJLeUARQOW016qhzPF/oCIy7zGvxn4VG1CVrQArw0vNtviDFwl09InqvGeE6s6KYO6mLSdXNkGiE75+yVbzQs2x/tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711571265; c=relaxed/simple;
	bh=UAlyW1XBQGh1I1s4OhUVYVSvSBWjHao81V/7b/ey64s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bKDnDkp0qEXqM/ivYJb1qt9Sj45PtlMfkPVhfxxWoaqexQXnF8/t5PJt13B3ULI8V+rI00NFapUkmHKyXli+mzmY6Fs/hIU4TIZYzb0zhDgUeBMP/2IxdFlE1Dfq8QY82Su+HVVy83oYMsG6amPelBmDZwaPylsuAm8hstC2oUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UyyCT3Fh; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UyyCT3Fh"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6e6b5432439so285851b3a.1
        for <linux-clk@vger.kernel.org>; Wed, 27 Mar 2024 13:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711571264; x=1712176064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LCVHzKM95nxrye1cfXoHnsCw/TjZEQVmmlga0bm4uZk=;
        b=UyyCT3FhawgJwkSzxqzkwJSvoYbqqG2Elii0u1mUyG9X3kI0kfU7NSHJImc6evsGqM
         1i/wYv0XszdtcF4Ci4+3hvGGK4oq26rzS4Ro++CNiogjw9fejAgHB/CkOz41G+5f8Se3
         z9V/fgPojoJqal/z6AtKEh2omcAEHzECt/Zhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711571264; x=1712176064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LCVHzKM95nxrye1cfXoHnsCw/TjZEQVmmlga0bm4uZk=;
        b=FxPOWbrQP1DZWLJQYQzvutE2ufbszssbgc3fXGhBxspRlfI/WerAmICDwd+C9E6mbD
         IkgN/qzoIi6AZ9+DNjTnLX22dxzEUltmPd3RpcqqH6rSw/VpvDbKqe5EKT+2RxuV/J1H
         LuPvOVLDQuVSpDFP/ORQlqaGF92vR73keCJRBHJbqE6kONniXx0WjX0q6wFkFoObV9RT
         WDgiRNdAjcXy7ijEA0+jW+8EKKNIoTWc0hEo4GoBjzioVSsvtnw5sFSAswbuLVL1tBy4
         MIY0VATWjOD4eAI4J0qP035ybf7+PPmZk5a85Tg75JKzRiFx9eSCS1qbSmwzb7VmXDEg
         1bpg==
X-Forwarded-Encrypted: i=1; AJvYcCWQF0U8X6/QWSiQ20KtWaoEIwA3qix7EogvfwXAqEsqP3Ux8M0FKELZ20UVS8TObPvA+N9HxKmXWqsiwDWwe01xZ9uqD5ffVk/1
X-Gm-Message-State: AOJu0YyTgY+hCPAHdNt7/i4i0pdTVcehTglM6QoIr6XrI44b3nDSZggp
	DyQ0veE170j4oMae79rbPd4EGeU33qH7Y6Tm39MS3i5mItDTBjuQqCg4+s5ePg==
X-Google-Smtp-Source: AGHT+IHA1C7H1G9I13NxUAKmeyvwBUmBLxBfdkaCF4Xl43hsabFFNBcw1oAA9mmdxMEWX6SsZ2Maiw==
X-Received: by 2002:a05:6a20:7495:b0:1a3:683a:2cbd with SMTP id p21-20020a056a20749500b001a3683a2cbdmr1160699pzd.17.1711571263614;
        Wed, 27 Mar 2024 13:27:43 -0700 (PDT)
Received: from localhost (4.198.125.34.bc.googleusercontent.com. [34.125.198.4])
        by smtp.gmail.com with UTF8SMTPSA id e3-20020aa78c43000000b006e56bf07483sm8303143pfd.77.2024.03.27.13.27.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 13:27:42 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	patches@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Laura Nao <laura.nao@collabora.com>
Subject: [PATCH 0/2] Fix a black screen on sc7180 Trogdor devices
Date: Wed, 27 Mar 2024 13:27:36 -0700
Message-ID: <20240327202740.3075378-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series fixes a black screen seen at boot on Trogdor devices.
The details of that problem are in the second patch, but the TL;DR is
that shared RCGs report the wrong parent to the clk framework and shared
RCGs never get turned off if they're left force enabled out of boot,
wedging the display GDSC causing the display bridge to fail to probe
because it can't turn on DSI.

The first patch is basically a hack. It avoids a problem where the mdss
driver probes, turns on and off the mdp clk, and hangs the rotator clk
because the rotator clk is using the same parent. We don't care about
this case on sc7180, so we simply disable the clk at driver probe so it
can't get stuck on.

The second patch fixes the shared RCG implementation so that the parent
is properly reported and so that the force enable bit is cleared. Fixing
the parent causes the problem that the first patch is avoiding, which is
why that patch is first. Just applying this second patch will make it so
that disabling the mdp clk disables the display pll that the rotator clk
is also using, causing the rotator clk to be stuck on.

This problem comes about because of a combination of issues. The clk
framework doesn't handle the case where two clks share the same parent
and are enabled at boot. The first clk to enable and disable will turn
off the parent. The mdss driver doesn't stay out of runtime suspend
while populating the child devices. In fact, of_platform_populate()
triggers runtime resume and suspend of the mdss device multiple times
while devices are being added. These patches side-step the larger issues
here with the goal of fixing Trogdor in the short-term. Long-term we
need to fix the clk framework and display driver so that shared parents
aren't disabled during boot and so that mdss can't runtime suspend until
the display pipeline/card is fully formed.

Stephen Boyd (2):
  clk: qcom: dispcc-sc7180: Force off rotator clk at probe
  clk: qcom: Properly initialize shared RCGs upon registration

 drivers/clk/qcom/clk-rcg2.c      | 19 +++++++++++++++++++
 drivers/clk/qcom/dispcc-sc7180.c | 14 ++++++++++++++
 2 files changed, 33 insertions(+)

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Taniya Das <quic_tdas@quicinc.com>
Cc: Laura Nao <laura.nao@collabora.com>

base-commit: e8f897f4afef0031fe618a8e94127a0934896aba
-- 
https://chromeos.dev

