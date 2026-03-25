Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C8B411626
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 18:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462058; cv=none; b=DPVoyRXb5nzb4e8THhFnZZ+Htn+vLK81bj432JuJiO2pYF/36LyylN7oZdvrrdEvVgacVj1cCObCk/4UHeA14y8o9SWydzsNr2h2zWTNYzKrIK4y9LwLb3Y2d6e2mejD6h1Gdu0KfJl3R95aDfsGdbs5CDe1+VR43eZJI1H/B0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462058; c=relaxed/simple;
	bh=JX1VT9zgv0Pae5sCQylMsKS3FziR0eu/Z48DU4Modf4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eZrPT9SzlpRmeX0mEh22y/Bhm69aEuhJhGGzZrTpxSfsgLRvrWBRZMZ8JjGVS1LYoaVh+NyDzWQAUzf6ayTuCNtAz9TpV7oqP7beF//DUcfO/WsObDJwpjj+iOetKmjzu479ItgVhBzvUQBLVHmV1cC6/qpEFbIULepnADYC8xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGNxcxjU; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGNxcxjU"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35c1a131946so210117a91.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 11:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774462055; x=1775066855; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=28ojK3/EzMg1N1ScywDMizt5NQH1Eo8ilmYAqBf6aac=;
        b=YGNxcxjUtxqB0bxk2tWvfN7+xR7w5l4EPzffIkE9kPmXTlICzJIeyPZ9R8Wemy0aZf
         km5qypmOEeEiuh3nm0eKfELVG/WyEKJ/ZS+vxmpUZUg4ykLjpIfIpCH0Th+bcobdDkgg
         M4FPuIkKLRcPUk99D/yR9Bh6/kZ0Kd4VGmnMC2uZB1oMnayFNY4hdo5QiD+p8DAFoHyJ
         82Z7k45+bhOaVT+9oVGwkMnZgUxtvVGS+6nBTSS4EPVxD/+xVREtqLxunwogYzdC1np/
         ttQ80lwe6wOeD52LxyW0LtjUtkMNIn+/ehhJ3XjMIl4OjKjuzUHpY7ObQJtDXdpKhZf5
         bxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774462055; x=1775066855;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28ojK3/EzMg1N1ScywDMizt5NQH1Eo8ilmYAqBf6aac=;
        b=Dq6ZMNdm4IN70Xl0mlU/Y5jpMmBmgWHj9YaVjTcXHm5Z36DZ4Dt5Uj72YOe9vH5lS3
         06JfPeluwS1wnbVxBFypBiHyWCiUb/1bAA5Q1lQN5sAyYJhld+ZotXum0HCXHMY350Nw
         yWhBwlYJ3KHTWsRBeDdLvUDy/bFhLtAT0Kaq7Wo2DD0/30FfOknQlaJOxkOP9RNvmmx+
         17atTNlY1u9hlrB+v7LbQ8PyvBGGTLWzWHTpXy5M4UK9au51puThIEGpDgCBKeV7Eg/i
         LO9OSCRtVjwTgkaLyn7aAjCrf7a/ty1JbNw9i/4W3e0XmU/kMVzosU014gHDvc1V3x8R
         BopQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhGjWZN3LL5rtXq9n8ikFGS695nBhDnd86cuGmJthThvhiIQSXe/6GfpQp5eDqANtNd2736IbBaAc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGiq2d8So/AxHwjvVqU5/LYzZIPzIKSamsEsoytGy8i1JLFhcd
	1RW9r9EHlWvjEjLJTQSyKxw9hG9mPNuHea3DqAxm97Ad76B0KPf2ZeKN
X-Gm-Gg: ATEYQzwnIyGi0q7ht0ioipm60L8RghMy/UdIG92f5n2uyqGmq2MMgox6XbLu0drve53
	0SQhmcjZk1m3wG1N/XifX23/Pi8xKmp6tFyBZs69f8lFm7cfG6YIo4VipMp0U5en14syv/e/8Ih
	v/AAL3NhE20zTdScoI5PcHgSLXzVb/IqqCDkGACQmPeHISdTY+cvztbTZbai7XH46Xo4jvlvUfc
	TOI8NNecqu8axEl7DnV7EeezmS27/Qopjjs/WtPJtshALHbKPgFk0YHLKuN249UjY5YCS7WmVNf
	iRQLHEF9hkPGM91ZKQqsDmanwQWSYKlhtvnX46FhvPiZO0uTx0SVSiMtxWeFuLsoKcMt6VW20Xz
	dDTM5Y6kMCGnDQvRi6+/mT9895zw8/nXvIdS9KXWvxPdwAF5j7ZasCvBrWMVEF/1lneNydetNrR
	/ZYVTmzr+p4tl8fiXQ5E76Bs5sjzRp
X-Received: by 2002:a17:903:22ca:b0:2ae:cd8c:bd04 with SMTP id d9443c01a7336-2b0a4dace22mr76613765ad.10.1774462054938;
        Wed, 25 Mar 2026 11:07:34 -0700 (PDT)
Received: from [192.168.0.102] ([43.251.91.187])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc773b33sm5687805ad.10.2026.03.25.11.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:07:34 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Subject: [PATCH 0/7] Add vibrator, IR transmitter and USB-C handling in
 xiaomi-ginkgo
Date: Wed, 25 Mar 2026 18:07:23 +0000
Message-Id: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrDugqQrtVaSLjJnEaSFKRkUQ7
 96oy7f4fwflJKzwLnZIvIrKGDOqRwH9YGNgFJcNpjRt+TQNBom/MKJ1DhcllISrENa2qci9vG9
 rgtxOib1s17f73NaFvtzP5wyO4w+tnvDleQAAAA==
X-Change-ID: 20260325-ginkgo-add-usb-ir-vib-4a51bd9ff64b
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774462047; l=1316;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=JX1VT9zgv0Pae5sCQylMsKS3FziR0eu/Z48DU4Modf4=;
 b=FTGDeN4f4HSu3HsrxdqeKr4af3eKQ0NpAJch2iaq19oGsccNrLS+g9iaX+SYWX5PAjLHHCMD/
 G3XSfR0V/MdAl0iw07TAOtfNpDU4LgFGi2V9fIgH6cXkpvWlUy1Kr8m
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

This patch series add support for various components in Xiaomi Redmi
Note 8.

Most notably:
- IR transmitter
- USB-C OTG
- Vibrator

Also, fix some bindings warning as reported due to previous commits.
These are tested with linux-next tag next-20260320.

Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
Biswapriyo Nath (7):
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable vibrator
      arm64: dts: qcom: sm6125: Enable USB-C port handling
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632 Type-C property
      dt-bindings: leds: irled: ir-spi-led: Add new duty-cycle value
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR transmitter
      arm64: dts: qcom: sm6125: Use 64 bit addressing
      dt-bindings: clock: qcom, dispcc-sm6125: Add #reset-cells property

 .../bindings/clock/qcom,dispcc-sm6125.yaml         |   3 +
 .../devicetree/bindings/leds/irled/ir-spi-led.yaml |   2 +-
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi |  56 +++++++
 arch/arm64/boot/dts/qcom/sm6125.dtsi               | 168 +++++++++++----------
 4 files changed, 152 insertions(+), 77 deletions(-)
---
base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
change-id: 20260325-ginkgo-add-usb-ir-vib-4a51bd9ff64b

Best regards,
--  
Biswapriyo Nath <nathbappai@gmail.com>

