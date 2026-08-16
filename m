Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F63842050
	for <linux-clk@vger.kernel.org>; Sun, 16 Aug 2026 13:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786886229; cv=none; b=HkxksWqbgnGZk3keE3QZpteg1QxvMg0Gcnu/TbbGdnGflckkJJWzg6sO/8w6WAHKQ03OHWpT2Y28wa1nYBBkF5kY+6ShGEe1Pg89qvVV46Idwp2MNZb6K2rnD8uaBhKU9Tr4QftfjXCjeviJI247TiKYs3jOVxFB5p+btrV+s3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786886229; c=relaxed/simple;
	bh=HNgZBr3EeTP1wU3P8wBuPpWgexNWfQ4T9Evbyc1n0kA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ESa6NL/2WJ6z8waG8sruBphoE2UGUdNYIGZKMecDbu02DNv+QPRqsNeZgce8/dbubGCS3HwMTpmF6FE/1AUy5eP/uZiaYJAaO8kH44hj2pygsQ43Mmvip0ryMZboOE4gPxm8TSlFmsFPao9Y1tZ3fGISWbMEbCnj00fbpsPlOjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mVv9j26K; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mVv9j26K"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3811f512167so3579905a91.3
        for <linux-clk@vger.kernel.org>; Sun, 16 Aug 2026 06:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786886227; x=1787491027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/58bF/vICIzPMoSzDV9ymm4CY+7nbZT+jsoNpyPGqcM=;
        b=mVv9j26KD6ekbRHCtYA2tPSDmGnHlPr2wt2HBNa6mLSz5loCt8OZ0oEDIeoBddnSmw
         oSWGzNsW1UaJecWOpmzn+tq3z2nHvundQ1dGAXDAI7m5BaVGfPye15ffziA1/hgHIYhB
         gPhROmmtyLLpNVX7yGafOBCZo4Pa81G7RSuRexdDhSiKxIkfapy/lQyUzLGoaxK2F9Bf
         moJ1DD2N3Z7lOPEPiZAUgwiA7GfRGrutDKTOKWctx6oywc4ota2vAUz6VbjA4wWClFiU
         zhaqr8YvmiVyP+UU3z/ySrRtnSfLJI/1N4emwFiQmI4kdBS83/Ybr/6wK2WSUwe1rQTd
         AzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786886227; x=1787491027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/58bF/vICIzPMoSzDV9ymm4CY+7nbZT+jsoNpyPGqcM=;
        b=XuEfZUunh/zcAOtw3q2W79xz1Wb6TpmJSAinhtFgD0FTIHGblveSivMlZ9yUWMk4ds
         g6qBBXtOSHj5hauxqlBEHskhbUbtfWGhKcF7LZ3PPnjFmGPca0mPZpbwyXpujmw+VpIQ
         xXfxOJtSZD8Dr1kPfHaegKY3O3H/JcEisKO2Cz0Tq20FxNhJfTIkNkz/wjEHwQfbMCwS
         x42YNl+f1JURmdY+jFqT59UiLczSZLCUbVmsAtlqSUXFMFbhVFq3ny58kfH+uPSIgp6c
         1gEE6siIyNpDHZQ/ux2BnMjeJY2jOwqFBHu521ARxCfOIYmtAK8NCP9UD0bU+ZeoM5jq
         Trzw==
X-Forwarded-Encrypted: i=1; AHgh+RqVV7W+E9yghnMQs20zWbWsNmAP0qGDzrauwr54s7qr986Q6bRCFI8MbO7l8VkNrMQYfWhnez9LkCs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1N/rjKd9CEtZ/Dd2WhwpCubQbeYVwVeADlfpVxP6hAAIZBZcL
	4a4xAS75UCRQ8vcWN0aktGv2X9Jpv3PUhHwZXRpZrve4ChqirndPnKpQoy9osA==
X-Gm-Gg: AR+sD11OrQVvgXQDVOabqfAzBmLssFsGZYc3Px7WG4TUsJCbsamRYdSz1UWXFLpwpla
	nM8lBs14uTeMHXeJVBP+71TMo+Ogh74sKfotQ12KwiFim9fkl1lRtywXaLHLe+qh+Ml8zEFbBfU
	RjdBtjOSTKBl0Hvrb2sdyI9FlYaf7xhYdb5/t1tJphZrbXH7yd9KWdeniK8x0wYXyywSbZta+fH
	31mkrRauhzDJc7h9zkTsCMnQqHT8cVX9WGLLpj3CLvFDVxDBq+o/4D0tfhSVVSQqr5nsJ4VaUUE
	YkLbMSVrDwOVG2568hCazgLaQldeoTgyJz+edUDocEb6ZwNh53UVtinrFIknGvOhqY/Q4pjs8pb
	yh6hJUjGxYYUYlJXIAuQ74LdKqfMe3skqMobfKE9iNMrwbbBuOOr63SqgpVRuNSMmbjVXFpzW3H
	3haa030GlFC8ASxWfU4wBWnpPcbF5lKCfs5k6pfdyj26eBduLEpoAi1k1DaUos1ZPLxVlvgF1pJ
	c6e3GEQxgN2erxBo7eHawY=
X-Received: by 2002:a17:90b:44:b0:38e:2e16:859b with SMTP id 98e67ed59e1d1-3933bcf395amr21446963a91.20.1786886226833;
        Sun, 16 Aug 2026 06:17:06 -0700 (PDT)
Received: from localhost.localdomain ([157.51.221.131])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1413887e3e7sm29235330c88.9.2026.08.16.06.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 06:17:06 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quic_tdas@quicinc.com
Cc: bmasney@redhat.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 0/2] Add SM7250 rpmh clocks
Date: Sun, 16 Aug 2026 13:16:43 +0000
Message-ID: <20260816131646.10551-1-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qualcomm SM7250 is known as lito.
Add the RPMH clocks present in SM7250 SoC.

Sreeshankar K (2):
  clk: qcom: rpmh: Add SM7250 rpmh clocks
  dt-bindings: clock: qcom,rpmhcc: Document RPMHCC bindings for SM7250

 .../bindings/clock/qcom,rpmhcc.yaml           |  1 +
 drivers/clk/qcom/clk-rpmh.c                   | 24 +++++++++++++++++++
 2 files changed, 25 insertions(+)

-- 
2.43.0

