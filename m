Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D8613DBB1
	for <linux-clk@vger.kernel.org>; Thu,  5 Sep 2024 03:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725507224; cv=none; b=tgPh8xv6Nf1dgTRZmpxkcxGeLjY5+YvhgB5juDsj0weO12av3GEBi4xpQ+xL71iKjBIDF9oQM8xl/7ns/FifVz6EOjOk9b6TN2ay8uRXL4DRcbHxyfax64ltU0UQTeBOmoviCKrah62nh/LPjsTHbBDz285YcQ+cyldU2hH4X6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725507224; c=relaxed/simple;
	bh=Zk7CuvNCGglePje0MWpioiCBoDt5MfGEPMscrIFpuTY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Is4c2swKB0cuJqqL8AXWOjQIH5Kd6UJNvr9daDIFAGkE3/xHqgSquJcrtO4x0YE3Wod2nDrNkZg/Y+XaTu91/JmXV54cDAYm+0RRW1wV9hkT8HhmH96AcyWwaf3wATCeALMmpDT0mQ8QSjU7yh8VgezNYrEii78dgxrG9wxuc2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wFDha7Fy; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wFDha7Fy"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-533488ffaf7so262188e87.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Sep 2024 20:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725507220; x=1726112020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHqDfVFz4e4ch7Qvu8SgYzoITxtA7TzKSa28k2tmaC0=;
        b=wFDha7FyDuKPJM+JrWv9DM85Xje5HVQw7oYYTxV3ihWImY6n/yRPeDbhIDbgT0mzm/
         kFZiZzP8Ut3+YXRiQ5h218CKKPuy9jKcPeyksr8kSNLnC6w0Sc1blx9H5P7qlyZ60ZHu
         825q5j+1qh40VCy0msXOwAo8RqkFJnRz7YAFWcxOjZCSq2dB9f5QUHGUDoyb6PUSujcG
         2H764iDGQolxXaKt+y5GiHBP/+tBbK5ybnjWNNishnYVvumiy08gj7gybZ15VQ2628/K
         LTrh08/LNNMUA/7cpTHHcg2ovvX17qPMmTlD9dnOXua1VBsr6WgqfL+mNkM4pUPdy+Fb
         VpUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725507220; x=1726112020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gHqDfVFz4e4ch7Qvu8SgYzoITxtA7TzKSa28k2tmaC0=;
        b=Dah0KmrA2r82CnR1XAiMsiysFqdpEy92pb/lr3mP56axKY0kd2PhDMMad32hTmo0Uy
         Lk5KGF25Okar4qUBp1BcMbMHk07RUgmnAIJf2GFitovDXWqa1z2+H6bjui+nuSNsuvTh
         6c8eAZScBwnGdpWThqezhdXFJNNDVk6oL75cOvFfKb3klAjvZPkfYVZF1VF2ZHAbBp5+
         VDA/jKA9sklRbJlQ7wfYfruQ9y6vrpZ1+UESPHyWYRWl7FmjMVJB8dBT/6tpZ1xXJCsl
         raGRis5KdoiwUYDsgaPTh6jV9djFDBZoKFLgMciA1yLd0LOJ55DVgC6wi92bPIRjhbYV
         WjPA==
X-Forwarded-Encrypted: i=1; AJvYcCUIRkqRxGn0dgM5bsoMrGGjdI7rcXsBg8jq3CytuvVxnYlY3ctMlZ5L5RtiMl9ML69vud+njgpU9vs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRdz2RCE0lj/YrPXjbaZ11gJj5v3PN9lanbT0omEmXrJJFGwA0
	tMJ7xRPPfsawxA24l4hAwCt2E6svPs7qw97TryzFKtuwna1WbXQtVH/tBhQem6s=
X-Google-Smtp-Source: AGHT+IF8RYrZhm6Rb+d5KJJUucAgU85MelFmmJWy0tHStryL1PjwkJENosRYCfI0WLW1G2JNywVluQ==
X-Received: by 2002:ac2:4e0d:0:b0:52f:d69e:bb38 with SMTP id 2adb3069b0e04-53546afd7c6mr13901020e87.2.1725507219347;
        Wed, 04 Sep 2024 20:33:39 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53565f6d409sm389165e87.35.2024.09.04.20.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 20:33:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Robert Foss <rfoss@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Georgi Djakov <djakov@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mike Tipton <quic_mdtipton@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 00/11] arm64: qcom: set of fixes for SM8350 platform
Date: Thu,  5 Sep 2024 06:33:33 +0300
Message-Id: <172550712140.3299484.13498001864474908780.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240804-sm8350-fixes-v1-0-1149dd8399fe@linaro.org>
References: <20240804-sm8350-fixes-v1-0-1149dd8399fe@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 04 Aug 2024 08:40:04 +0300, Dmitry Baryshkov wrote:
> A set of fixes that target stability of the SM8350 platform.
> 
> 

Applied, thanks!

[03/11] drm/msm/dsi: correct programming sequence for SM8350 / SM8450
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1328cb7c34bf

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
