Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1C2270EA1
	for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 13:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018099; cv=none; b=ihxE1kbFTH2LKA6wG9MdyYaTe5yvz1RGRzzCv8HDLbYo8rdSe1a8ntVwwe9ZGmqW2g5To1pDN3ORCb/P9oIr+sh6ulqcFVKV3NTNEvHtOIEPujjPSe9VXzIficK3OPkmTC4wR8Jp9rgLpIByFY3lrC/XlFqMD5NforGBBVpnM/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018099; c=relaxed/simple;
	bh=HJ0MNpBmrQRCw9sK9HdpK5tunBDYYQ7B8hA9RLdeWJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NFrO5wODVDD44jiGujWKMmePwP+QVf5RQS3CZYu4iWJ87J6kU11Fjvht0P3E5ItnDWZChbAHo67qxpXz3t/gRFvF/r0yRqAQdUI3ZQ8vNsYC9qXCXjnI2RzbizBTs4xv8s2+6UGQEccgAJvQfF6QzDB0PjO5weig1+0f3RF6neE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xg1VumJq; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xg1VumJq"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3912622c9c0so678886f8f.3
        for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 06:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746018096; x=1746622896; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SH3I77O1MdTEfL3MdKWLnHOYaZ8YnV2M8EzH5AVzyR4=;
        b=xg1VumJqYcA1GK9IblH6FBVmP77OjJaB5Q7I6Ee2Vf6wfEjf7dRzX/IGact/O5eg6v
         KhKhaAhoqi8AiAkLcCS/gqGsKly8dU23eFH1RZyMu8g3eLuzdcvPLgEFfdz3t6qu5rdE
         2tZWLPrMF8+/Gn2f3cUoKo6+YTfwWLIoWVOWOMRYoR2SdJK7VqDblWkQcTV7gKmU06br
         ParO321eAXHlc8bKJpxvAkwkcewsGRtyCbnEVaWaH5B58sGvcCllWK3dPQiBl3YCC4db
         EEiTGYYii+3C+dpWc+EL4/IHW70HmjteHoQ/Fq2sYI3htTQPproACIEIz48JwofdmV2F
         aEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746018096; x=1746622896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SH3I77O1MdTEfL3MdKWLnHOYaZ8YnV2M8EzH5AVzyR4=;
        b=fANNyKwvHFMSODY5wqrrQUSWeT42VBn3+n6eqFcl7poEziju/WJ4bkbCJ9CccXbVhc
         Pqr0C/mZLwNLmcEzYXlPiDAqgTgpp0PvlecLT/aXyrAtwLFhtHT3yUVtW2TROBUcBrtl
         lTgzjGlfDQ9vLdZXK0PdSEnhhZtIcI23rdMy2HFRrunfJ5HVjaYIXsOIQH1zcfw6m6Ja
         lHiY1A2ZaX4aqqYnHW9MS2kU0BNDgh2C7YlWaFTOHu+3JKe5GcHGjOgsy+v9H5+76/4V
         slnJbw+hwQulJB2OwYhbSMtWIWiMGz4LZs/XTU1NtIJJJJ3ALjoaN6ecgJnA+n1Pr/A5
         8fKA==
X-Forwarded-Encrypted: i=1; AJvYcCUlQQDFyl7glc1DW3uTTTbUtb2bBS6MDiD3h/Rc3CvyVibel0PLgUI8JeEOarxnSmRaxFs+z7G67jE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtU9v0pJQZNy0CfmRpx62pmuHl5zWgmJroQSNqnkrKU8QDWcU6
	3m+KyS9ihCNOA1bFnNsIGM2IlfEPlCYKjRXG1J/Kiy1cKUAhTRHmPRtmm93eRh8=
X-Gm-Gg: ASbGncsY8LI0+FtGNTDU+NooXFg0z5m47Gcc1aBe9RkSY8B66HdxVXCd4tJ16Rj3um5
	/Gb9Aj2I91kvEYU5NfuPbmbiIwEkgNZA89GKr8umBtEPY0pDbKRy8EzLQ92isKf1CDAxr9VhNt5
	28McpcvzkOjoN2jzebB4CjMxoTS6+A4R7tMkA+S4o+l6E5XW/OwmUOulADyb1Pa6p9lVm/kyKuU
	axSqnExzhwl0AyTZgxTyq+kx5NJKySZ+QRVRmoZ/uDxhYmDyCN1TVvC3thZeY+5rBUIdqVyAj5X
	l6IzFmahBHFph+lWdzIVqpaPHYQrAbelejYA96/2Z4WzHJ6FkDwSWl2+o5g=
X-Google-Smtp-Source: AGHT+IEBqMxYQSfRQbTltyFeNLAcJBYzuhFGFWWjAJdPvr+J/sinK/COHmsEoCreQ/Xji9bQuXY9Pg==
X-Received: by 2002:a05:6000:1866:b0:3a0:86f3:451f with SMTP id ffacd0b85a97d-3a09007e244mr807533f8f.12.1746018095608;
        Wed, 30 Apr 2025 06:01:35 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 06:01:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:43 +0200
Subject: [PATCH v5 13/24] drm/msm/dpu: Add handling of LM_6 and LM_7 bits
 in pending flush mask
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-13-8cab30c3e4df@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
In-Reply-To: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1020;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=HJ0MNpBmrQRCw9sK9HdpK5tunBDYYQ7B8hA9RLdeWJU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh8BU1FyXvyJubnZWWpHhlyoSM3xTDbUd9SPV
 SvPM6R3NkSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIfAQAKCRDBN2bmhouD
 10psD/9Nl/I/ReW4K7IMQtk7o5ANVYUTBL85xn5Tru5onHKZC8S2COPO62MOh683IPy6z//4zK7
 BSmb5qO1u0NaRS3wwET/MLK1ieZyMiBYic03mZtr3I7YZ0pMn5JAKQom2h9WkOt6Bx9tapsz5Ir
 zAREj5dgm9LgUL0M+9UHP4oal4NOdTCUwHpeJZ07Y7M8Nfy3ZJgplEVntIxRwMRTv6VZbTocv2S
 hxsaWKfHVXkwWKy7A+6SkxuoOVBwOJnZZwfKlEHDgEo6ow0EW0g9uNCpRP3Zj1+oUUIDe9FKhLs
 8/y0QM5JECZry2ZEVdQufdFMbp2OEPSxzwVMPVacEdpa7f3QT1hwpYa8iSXGjOWrsGotaPw8n+T
 HE08jEI7sdx2f/HXX1O6L9/aKQKioq5WHSQsTsjLKswx3a6U4JQkIK/Qk6/OY8Uhdi4H4P2EmOo
 WpAzr5NvqDbbK0jjRv6Vm3FpovLtNoxT5RIn9TZQLuEeZSDkZzuZwPABJQ+O9m4TVoucb0PmxlY
 d2c6Z73juebij/Zp/7t6ROdddEY+qAlg0aVZpYt6ou2LMY6TqOMSeMv57NiBzJkUC3kbaX1nun6
 9MoAfcvAzjThXuqYBH0RnqDqMJ3rLmmV4XwC5BASN7bwKZI937wsgRo1IjTg2wKokIbNzCIE4Ez
 gyWQDPSon2agTVA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

MDSS/MDP v12 comes with new bits in flush registers (e.g.
MDP_CTL_0_FLUSH) for Layer Mixer 6 and 7.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 2ce59ba50ffa0d14eaa07e993fadf0f218390ef1..3e5e1e09e9d00ade74371489b2b4e50e648e2d16 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -261,6 +261,12 @@ static void dpu_hw_ctl_update_pending_flush_mixer(struct dpu_hw_ctl *ctx,
 	case LM_5:
 		ctx->pending_flush_mask |= BIT(20);
 		break;
+	case LM_6:
+		ctx->pending_flush_mask |= BIT(21);
+		break;
+	case LM_7:
+		ctx->pending_flush_mask |= BIT(27);
+		break;
 	default:
 		break;
 	}

-- 
2.45.2

