Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795640076;
	b=OuixDpFF3mrklAsO3p075m/NCpnC7lrsmhpmLjBKIGIQELfwGelHmkc8I2WEUp6f18w3
	 xhRvzRzVJOpaw3Ad+zM10QwhEUDXkqdlXpnsF2aXVGFwKfWc2V9hl/O1ut1hdudusXjPc
	 QyDRh/HlL4Cp6SuuEpjIq823ckatBZ7c9lWsTw84Ev+ifqrqFdAXA1vjvdIMIkzW2HUvq
	 qfHT8bYodUanD72YCngjcr/TtXtjRFUK/zKQMkOCd8bwN6t92fsSYw2raW6eBy7l/HLzU
	 SNPHBGZsVrYKfZ5veoPyF8jKs0brlOV/o6iah/wXaDBa9JQf1U1S3P/aXPL+zscAaAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9cnvF229oCRLM7FklnqYjwW5zZXyLVLkJW2HhsXXmhw=;
	b=qglaRmOXzYkPuuXAYoNx4WkvTv9UZzpnxVqTtEeDGby0nRpI26r80KZS9jt0L/IfmTQQ
	 eG6WRobg7qSQy1YydPhHUyLuT3Y73cw/1R6yJZfMyTWykKEWJ5i0w8rE76FsA4JrfgF86
	 BnUB/lDMgPBTtFjcMhUm4F/r6zQm+ePazHAdGYzmStQbJLBDbdh3uaFLAAMtBYiSIlnm6
	 aP1QZ/eEPJpZaNafE+vZHniHKjY5mD5VQ/0bdHdt4UzH0MNpQD8iBu3plJB4X0AIsB9Ma
	 F2WaFmUTqm2G2msvV0Kir6FGi13dM+27/IqCjgQ75uoYARHqJN3qTu8QcH0nZtqyAeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="XuE+/R02";
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70920606A327
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 20:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70920606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XuE+/R02
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c0ea47f5b8so632632e87.3
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 12:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795640073; x=1796244873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9cnvF229oCRLM7FklnqYjwW5zZXyLVLkJW2HhsXXmhw=;
        b=XuE+/R02Z20PbA63OtcZhpCbYLZKc3TnXmHrajI3qhNr79zzfqDZPk5R8HX6fNoV9u
         jKZDFXmZ30Spk6z9NRVdHsWTo3Eh4Bjf13sLaAltm1du7Gsg1I+X94DjwkhG5hjEEd13
         6MM8/X1x4I4wwliWOV4CZyq7GvuKryi3HFNDiK3I//1VeXEI2fIKPJnIocsNDfHZrJ+P
         XFJaaP28+s5ENtYfsbU/FmOadeQfOYJgCWE+Nz4YS7YzN06fOYqMQMOyBJnNbo1H9vEs
         hhwxXjfA/trvWBDbjZLUwhgMwDYTI7zAwJzP3P9u04AMgia1y1JmTdryd3FJ6YXbG+DI
         Y6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640073; x=1796244873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9cnvF229oCRLM7FklnqYjwW5zZXyLVLkJW2HhsXXmhw=;
        b=t8Tibzoschz0pzr1HsqUXsuFKAmf3PJJfzwC/fXf1pdB8F2P0AOaejUOJmnwU7MNPc
         0/dkISqCP7RernwxRLWe1sOPIJnnzMKkwAENKEIr3qDzVQa+sGEUj9nIUb0RLHOVQkJc
         nvawo6swHezeCOGIoajTXfirnt+Nb8ENw/9wu7Kav16kSS0L6XzcBqrUDHdR7RWR7Bah
         be1O2AaMaCBwJfSEYbGbbX9g+ovO6r8HSWeljvcS9GhrFZhi/RXe5y877d6s8PCPgshK
         yUwXGe+lDlgJ4nOBKg4vWTbRzLQxAxXzuMeHB2Ipg2g8bWqAS9OvUevCVGrWrakG13/D
         5GYQ==
X-Forwarded-Encrypted: i=1; AL+hErG2N9xwTSor3nuPmHpWsfYelrCac1aYl3S+MZMNd1Lqs5ymDx8+wz6mZi8CH9wuadcUzPSMSt1eM/Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BOoylz+wuZ0QZkyrxEQZ4KDfERIuEiS2SE0M7160Xc18GjpjO
	/4+GRiU2kiGtkm7gSKntSsBM+EoCTW8u+BLhHS2LEiRVxqjnszPMWKwTc5+QeXamTU4=
X-Gm-Gg: AZFdTZf2XQaKuSfS1l5bPIVCqp9v0Z+xtn3KtCXai6lTRq6UNClTBY4r2OVYIjHw7L1
	PzT4vXQua1KTQYZEbJ991ZNirB62lu4dYrVCtF2LajVH2do0ZnXTF89Fd9NGjb+DRsBBT52BaEO
	SL+EwAkC6otyOYNwW0TkAEwA/sogPe7q2d638E6CNLObWj9iqvp9/yayzmzlaEl9S9ND8yEIMVB
	fDB/Brk8py3lR+mqXnBum3MjOV2pDyPSQKcqKz9DokEbNpeeqOUXuYP5jSeCWoH1gu+ZP/wmNoc
	z1mw1DVSJD/I3SryYxqAdeo8VVj8tFQ0mc9EdR+hKd7rWhvVylLFJMxDg1DPgI3uUfkpxIf7bXp
	0Q/sNJmpZ7S/Y9/TMEEJRlvuM9FHUAn9NfPLYuEmeDAT0y+4ROiIx7n/29gaKeEq+zEeXyOZ9PC
	yg+fXkYqF0sEyVcuhEVtWtHtcfqgc9nLHlHTlLR0hDh2DnMjeoLQorZU4ozEpP+aOBpWvmla6Su
	OWVJNm/aofJlqdiX6ncQcrYrUWE1Ox0YQbjCK6SXXCyvoQF9LDZF7kTQqmRKF+LIveiGDW6hUUS
	cU55xUtS83Wo5SXTpWO2XwYm3cOU0fTpHq9P7V6HnKmx76vfOt4k07Eh0c1c6qqsxg5Qlw==
X-Received: by 2002:a05:6512:304a:b0:5c1:57b9:90d3 with SMTP id 2adb3069b0e04-5c1bc6d29ffmr6044057e87.1.1795640073506;
        Wed, 25 Nov 2026 12:54:33 -0800 (PST)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805751f4sm50871441fa.40.2026.11.25.12.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:54:33 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: qcom: sm8650: Bump SM8650 CAMCC MXC vote
Date: Wed, 25 Nov 2026 22:54:15 +0200
Message-ID: <20261125205417.1437355-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SM8650 camera clock controller PLL0 runs at 1200MHz and requires SVS_L1
level of MXC rail, but the CAMCC device tree node has no required-opps,
so the MXC rail is voted at its lowest level only. Add the vote and
make 'required-opps' property required for SM8650 CAMCC.

Vladimir Zapolskiy (2):
  dt-bindings: clock: qcom,sm8450-camcc: Require required-opps on SM8650
  arm64: dts: qcom: sm8650: Add camera clock controller MXC vote

 .../devicetree/bindings/clock/qcom,sm8450-camcc.yaml          | 4 +---
 arch/arm64/boot/dts/qcom/sm8650.dtsi                          | 2 ++
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.53.0

