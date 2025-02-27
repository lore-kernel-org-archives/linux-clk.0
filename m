Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B20B2222AC
	for <linux-clk@vger.kernel.org>; Thu, 27 Feb 2025 04:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740631069; cv=none; b=tmfapAVu95khYP+e441VX1h66a91/ayWe0lf/Ho52Ztbp3Hvjf0B4IxIutthBBmobZYUReDmMv/daUSnp9IqYTp5XDBtqYiRso2Hy4W5PUHM6WbZYEN5L/EWW4+BUYWqDbSBmcun1pEJtk9gpfznhvyd0Q1zU1AXKNw+HJgw3ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740631069; c=relaxed/simple;
	bh=vpCutPqoDxQnJQCPEd51KBxUZ5j1zIGXF3PAmD3Zp3g=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O+4bYO482StIOznWfNWkJk7e+yhiOnmFxF/VWpWRWmPK++IyfoUiw6VzIxb18ugkYcLEbiGHeNHKSZsI0cyqkbVHDlZcJsNeRM88ZUD44zbKrgaxHy9XT31c5QuCpf/I8kweKTmXSGw6JxrKbcS9d8Cl5WgXYgZTkOo4IyTuXRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UHeNWJAT; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UHeNWJAT"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5462a2b9dedso490741e87.1
        for <linux-clk@vger.kernel.org>; Wed, 26 Feb 2025 20:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740631066; x=1741235866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pb4hUKvEHYfmi+I4u7PNH6BBXGvHJ7207dDOff1Xgt4=;
        b=UHeNWJATzpJq11M/5kKGiYpV6MsrvqFG/hjtQXX8KqPjQBTiAIk+oNCk+SG8H31BcK
         p7S6Yth7r+ddb+eaQnQcUUOd/twxEyxfRR60VMxl00gziFDEgcL/3aJHR9MRNwEvrl7I
         s94S9gm+Gkv0m8I3GDh8rBuvP7wxqzTn57pfflcaBYtG4cueU5EMstqGe7xGfTOJulPJ
         q7gzWbJWq71bX+qEHlUAjJ5SzUe8CC/4a00olJStu9QsSmbfFRU4yJLUm8QtiGZYcoA8
         kF6V+zGhhHuM3TzDHMh4TFj2hwT1XLmaGpttDxcXgpnskW31QNkWhG8AYZ8RCXK0Boq1
         We8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740631066; x=1741235866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pb4hUKvEHYfmi+I4u7PNH6BBXGvHJ7207dDOff1Xgt4=;
        b=izGOgxfufEeYOgRbjCH3eFS8BKVlHfb3OiQsVzqudw5zlNUmmz6EJoOSzul83YHC7X
         UILqT4H2YEe3JtAvYw0pi8YddGocZXFPuCalmMrWqMn64sNaOHP6YiRreixzkkO6doD3
         wL8ukDwr+uYbi4POWCiGxml42h7xwcKpM+YMnpehMtibYHN69ZlbnuqMjW91ejor+dB3
         uZgB0SauWZAOnbWYh4JHffHB8FgAhcsgIrY+/VM49wA+g+tNG8PZu0tvZF64Uyb8vO55
         MshOzyWCw/DX2fuNMwnU6Pw7cessWya0T1+DqJjRpgTLjgTY2I4Apogfp4yLaRZNEkMF
         Ztew==
X-Forwarded-Encrypted: i=1; AJvYcCWUge9U0A7W1HgewI4m6N/p7YM7fgcqRbJ8q1jO7e5E6X/52mk0Pdrjny+XZXuthhcRPdBsZq7ymYU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4jpEC2l1t6rhw3tk6g7CULFGpr2sRkYATZ/+V+ZiX5xVpZ9Na
	9+RHbZ7sR8m0jZH/WV1vNl5CNBFb1jLEmRGUUyLhfxffR2Q3uhgOdCIE+1CIWK4=
X-Gm-Gg: ASbGncv29e3dulheAwKZmQfkvQZxDCJZbzew+IU7uFcsbelkCJusUQm0Vy5+lClBKQM
	ziK2eJfPiHvt10qURaa396uD7Vw9LZspT3xoeUUfsudHldLaxX3pW4ExI1DG6//rCATaq+qndQe
	+tCZzAr+8/W8me1w7s0ndZ5xeNI0KdrbRzWbIdbzfqoJDeW7ZcHhoxmEw11l4d7wqmkgesA9J7U
	JSFU4+WVL9GGcrmLyA0RQg9c03F/Ln8OcwBjeM64f7XJMJegBtU+/cQRUb+vq5zB+Lv+3qFteYA
	8ksVbAg9SH6iggkYUW9BiLbFwK/7ZpKD+EoarkvifQ==
X-Google-Smtp-Source: AGHT+IGd2rBcbdDnOO9mUn66I/dFLYCzyc1GlDdtB8pQVwoJ0TBIn1SVa4Lymy/rEO+PlXQ6q8GIig==
X-Received: by 2002:a05:6512:3d0b:b0:545:aaf:13fd with SMTP id 2adb3069b0e04-548392717d1mr11821826e87.51.1740631066310;
        Wed, 26 Feb 2025 20:37:46 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549443ccf45sm63485e87.229.2025.02.26.20.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 20:37:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: display/msm/dsi-phy: Add header with exposed clock IDs
Date: Thu, 27 Feb 2025 06:37:25 +0200
Message-Id: <174063096233.3733075.8120055678466952428.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>
References: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 27 Jan 2025 14:21:04 +0100, Krzysztof Kozlowski wrote:
> DSI phys, from earliest (28 nm) up to newest (3 nm) generation, provide
> two clocks.  The respective clock ID is used by drivers and DTS, so it
> should be documented as explicit ABI.
> 
> 

Applied, thanks!

[1/2] dt-bindings: display/msm/dsi-phy: Add header with exposed clock IDs
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d1f28e30a525
[2/2] drm/msm/dsi/phy: Use the header with clock IDs
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5100ae76b5ab

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
