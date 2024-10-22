Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E29D1A0BE1
	for <linux-clk@vger.kernel.org>; Tue, 22 Oct 2024 14:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729607785; cv=none; b=tweNWYB7ra6jxsGWiAWpVB9YLuF80z12v7yekkvQCi+6TZfB1kUQUwB8NbV1XA/xw3OcFzO5/U1SkCL9kP7lDlp3uYjK1Qa+sKOkZH0LuXidMlZ7mruoMR1xtUwcUd9lWfBzonfn/vrgLKbUjPX4XaaeNIt1zDXwcpkEMaEFCTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729607785; c=relaxed/simple;
	bh=XPTt/DRcxaXM3jq+HjKo66FdsyRj2Gi2+pHUZZljpsY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Pt+jKg5VfIV5VCNYq1bxUbEt24E66kzHqmjiSHJWrU8VMMCd5Bz7CEgzOXVe/j6IuExwAf4EKjX6CSF90wuI2Pa9KfbDFF0gi9QWyK39G2wIkB62g/vKVxHnsPxmseR/iil9aTMrFyIaoddZFSGbcFq77phsuLRxiEpD+oTLgDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cb/mlrbN; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cb/mlrbN"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37d4b0943c7so4140330f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 22 Oct 2024 07:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729607782; x=1730212582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GrUWXWfzIj5zJMMGxBfqh3qOh40//ZAdcEGnfXtiphw=;
        b=Cb/mlrbND1Pa/nKp8ElOnPSNjq1przHnZgJHUbzUL2QqqyLNm6PXZSa/1QMPFPA1jM
         ivYSTZGdhtHAxl6sZ4QyWv6L3krWAjSaVVQMvwOlaRdXZ49dHt81tSoETuzbq2KQsIkC
         Gj9IeiIiRn987DiE1/BU4z7PzH1xXIzpVA92Dq0mJtHftEsZ6UFrmQqEYRK+9dKbkZzQ
         WLniMhNEr1jVwLrdUSJ8rCFMHVo6OSdG0S42y5HK5Xfgx23RpCXOYOPGDIJBv1Q0UMZ0
         QBpl+6NsTkmVIr6d/XIpBpxDg13TTFeLWo5JzG2ZjUHupeoPX/kC8Z/i3+Pt3gZOwy0L
         zT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729607782; x=1730212582;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GrUWXWfzIj5zJMMGxBfqh3qOh40//ZAdcEGnfXtiphw=;
        b=PQE9Yq0h0+OJ9lT92BpoFZSvC0Y13mfcIFae8ij6MK5AFrk8x+41Ku8rpBhrpiifS5
         6uSg3eu5Wy92RfUOucLLEIvueLtZEmyBXS4+udBeRjkjrO2NwERgieaSRa3J7fsiR5gF
         bORhHBnHUmzfbv0I9fMe8mwaIcPkWG+AHC6jCf6AFRWnbtC6UjN2khBEB8+0s3ae8sPg
         Jlsi+nPnQKifseyJi2Y1+PEm2HrbrJwKfBBmIbgy+QDiNW2rv27SxffaV1F9CaZ9Tmx1
         B4PB/cGdaJ1kVSgdCgQ/lBB3mqHUVKXLX1k1gW4dfZ+92uE78VTBZCkClEOoyWySVVTp
         f1HA==
X-Forwarded-Encrypted: i=1; AJvYcCWu9ybLj2zAa4lUs3ffcMwi7EPsxAENKsWPBfxGEE98z3wKka8apMDho6GR20Rx+BvONX62uua3QPc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQx4rswMmBtV0gkluj2fTryd0K9AKBwsSjuwJ5UgRPuMIXvw7G
	Bf8DvuaTMavWM3FYcebIGLCz/O988XortddNYo70+Z97LnLVZz8gNmgNVXxrYWI=
X-Google-Smtp-Source: AGHT+IH1gDK1/uDRHCxw8RYMyjPcimj1r1WhkfVOpVJ9j0PYqU0pkA6VBIa7LJdkDoJQNlhbE2+Oig==
X-Received: by 2002:a05:6000:c85:b0:37d:4e74:68a with SMTP id ffacd0b85a97d-37eb5a59780mr8701399f8f.46.1729607781629;
        Tue, 22 Oct 2024 07:36:21 -0700 (PDT)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a47caesm6723587f8f.28.2024.10.22.07.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 07:36:20 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com, 
 sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 festevam@gmail.com, Richard Zhu <hongxing.zhu@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 imx@lists.linux.dev, kernel@pengutronix.de
In-Reply-To: <1728977644-8207-1-git-send-email-hongxing.zhu@nxp.com>
References: <1728977644-8207-1-git-send-email-hongxing.zhu@nxp.com>
Subject: Re: [PATCH v5 0/2] Add one clock gate for i.MX95 HSIO block
Message-Id: <172960777824.2281007.10515356955760469298.b4-ty@linaro.org>
Date: Tue, 22 Oct 2024 17:36:18 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dedf8


On Tue, 15 Oct 2024 15:34:02 +0800, Richard Zhu wrote:
> REF_EN (Bit6) of LFAST_IO_REG control i.MX95 PCIe REF clock out
> enable/disable.
> Add one clock gate for i.MX95 HSIO block to support PCIe REF clock
> out gate.
> 
> v5 changes:
> - Rebase to v6.12-rc3.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: clock: nxp,imx95-blk-ctl: Add compatible string for i.MX95 HSIO BLK CTRL
      commit: 731237359d83bfb4f27eea5b7a8935af5c72a5ac
[2/2] clk: imx95-blk-ctl: Add one clock gate for HSIO block
      commit: cf295252f0d88410d5793fa6db56a7192a65d66f

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

