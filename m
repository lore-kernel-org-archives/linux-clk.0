Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9753D3A63F3
	for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 18:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789668788; cv=none; b=VnukILrvqXize/hMyv6C1S3NKfS8RRf/h6HzS1UdYzWYYfCn+5zV+oJXGYKVvU4LjDAMcnwKQzjyHIGtZBbjNqhSvEKw/Tb+4XdsgEQ9WhWMv5MdK4AfW3XuwIWTWM9P1EOg7/x7dUymTG5zrHwgPFN9OQ6C5jPPvd3MVVlpMcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789668788; c=relaxed/simple;
	bh=rBWaCN814kHmYVV+q8AElI0MqDoPN0IJdHskleXzFrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mQrahi9CG+vKhrv0zTdKHaeLt3D3YZj7Ydm2svd4aSGiwIu4/SZp+mAnL7ZXkwxXPbwwFQq/Ro/4i/Rlt825fusMzj481iFXm/2rENsfEMWwG6z9lwwx+hrZ/10lTXqr+w+/ky8i6C7m434Ym/WUa02YUwcm89RgecbnhrKJQKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cigLMYHA; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cigLMYHA"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d822dso8618755e9.2
        for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 11:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789668785; x=1790273585; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rBWaCN814kHmYVV+q8AElI0MqDoPN0IJdHskleXzFrM=;
        b=cigLMYHAq3HXFTD8YjNTGkS3l4pmA1m6gU26q46GcNXpz7uYr/HnNYk3j18Wq5/BdE
         ZyNe/1J+9ccrw+0b35rAuakTs7rdPX88fY6CDxGEDU0xof8eNHa26rELlxmvlA4Ztgsq
         00InF7VnnyYhNLb83btDZnGREbBKK4HyRWvQ8Vi68UMP+YzYEtOlwf87dQ4iANeqXQRD
         qGq20qiLByDUgH4Czb6Y9qCd2I3ACQiyiQXGfD0c5Kjy1YRmW4dVhfsZzVIUeVtc2THZ
         75td/qiJXi5b5XyyxrTvGcoo/4cHPBafUOvKnGsKWeYiswhkZaK7foUwD8bG1ooXZcKb
         zTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789668785; x=1790273585;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rBWaCN814kHmYVV+q8AElI0MqDoPN0IJdHskleXzFrM=;
        b=BGsokPDFG8/qi8EJ4Q15jdHXkNxV3vcrHX2AYZQmoTIk30wjXpA35ODY4Oa6vpn2hF
         fmcT9cNY9NCdS/AsGh7EtVDjQ5V+RjkJekts2sYg7eY2FcFLQjLL6WY3eR4Q1pjEtTv+
         cPxY4NQUOdefUI8Wu9B8AWz7UohzezTT4t8Uz5808y6N7CDsK2hlmap3yd6GNeXKneH+
         9/oXSETXFiSAqsGiSSdhZVre8X1DwJ73mz0ikOgH48IcEKwW29q9j2T0XVN1klnkWMmQ
         11O4bjq0kjK1BsRkjetLvAXn9eTgA0K5m2iYfGoy1LXkelXmuD1d3L2cDGV6erBXefIc
         GGzw==
X-Forwarded-Encrypted: i=1; AKwUvBxwRvBaQDS5G5FqHar+SP5wkmDf1j8YtaIVbLtXHEw7dm7PjCzdqzoK51UQCVDOPWQEWBmC+ffc5es=@vger.kernel.org
X-Gm-Message-State: AFuF++kovA7oQjUY7pKoieMJAmg5Zgm4R/8IP4zEC9k2e4cEaccc2+Si
	90ZpHsf/MNP3Ge/0ZTZArCXL6e0P3bcb4HSD+Zsg2YbAgL3uGP1oKvl2
X-Gm-Gg: AYBFou3Yr5I60wGVQPi/CP6S4vi1OYY8bU2JqnriJ2ewtPBtNEva0jkV0Pcg/eIlXkU
	1yqo5pgXftAW+5aC4edYRu6usYJdUAVL6Xh8XFYXkgQmxWNrG1pLfEMqDwlGBv7lEfM7guUuemP
	gExhxS/eFgpc0WG1sUucdPvElVQfs1AVEn4/ROxPqvna87bgioAguc0K+LMk8QNPTk0wFHLU94t
	zX56IlIKa+3D1KWa9y3Tq+/pyhc7pij4EONcwhpX6G66BFdtRwYRTPQ/OEoGto9qDF6WeTjVJ37
	g8PXipGXtDLVsNYFqsfj40Kxd+7m9rz7eIfZa31JuGgVGf+F4kc0KMDifz13feHkNGZqtQIe0w3
	TdCbdSfGRplfY5SMlknF6KePAq/S95VzQgJ6C6vC5aDFmzTqB6orXPtXxBpuQ2WAlRDk0XKm5OG
	+Z14Z0QXAfha4H+H/2XHP7OLghzVEvBzxwaZd6KyIMNsdZ+aC2Wae10t1DFavO5iIN7B5H9dRAN
	l8vECNW
X-Received: by 2002:a05:600c:34c2:b0:49e:6c27:d093 with SMTP id 5b1f17b1804b1-49eb72f7043mr91713485e9.15.1789668784618;
        Thu, 17 Sep 2026 11:13:04 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.113])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fc4855b92sm3165935e9.3.2026.09.17.11.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 11:13:04 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Felipe Balbi <balbi@ti.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v19 0/5] Add phy_get_by_of_node and devm helper
Date: Thu, 17 Sep 2026 20:12:54 +0200
Message-ID: <178966877406.2239.2890857291530516772@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v19-0-21ad8a76e941@linaro.org>
References: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v19-0-21ad8a76e941@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Bryan,

On Thu, Sep 17, 2026, Bryan O'Donoghue wrote:
> Add phy_get_by_of_node and devm helper

For the series:

Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11 (Glymur)

ov08x40 on CSIPHY4 through the standalone CSI2 PHY, two data lanes,
data-lanes = <1 2> on both the PHY and the CAMSS endpoint, capturing with
libcamera on next-20260916 with the x1e-csi2-phy v18, Kaanapali v16,
SM8750 v6 and Nihal's Glymur CAMSS v3 series on top. Streams, including
after the sensor is unbound and rebound at runtime.

Thanks,
Oleg
