Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595139;
	b=f20qfsMb+IkG+moiu97NYJGhOmXw+Sx9vh3SmGtwBhe1jUqTNyHlLUhOf7XPLJKVXfUx
	 qHx/hQkwPbC/dsGtMLtMdxbWCpxq+5/PFnDQ4QTLNMd3pyPS+EpDDVfgKudA53224jm7j
	 3+2jLB/I+rJN/4+VQqLvk3gSEAV7FsygaHXBrDXbWWeG2tHI4/NXGwPJ3cUwMUg8yXqkl
	 CHFUz4adRJgSYUJKCCYnecILCCwORcDFEDx3JkmaB3PIgbCZy/hULQlxfMDUSz8UNHvdU
	 rrPz3v3BWl9sMCfw+bWJp1FTCZRjd6AFyxTMnPVPlR+pYdjrqyiM8oqH62umAi615FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ShonUOYxGGNmtD8AWNfZClVcjwHiQNoIijd5Y0f0jlg=;
	b=sPmKtWEwj4Uc5CgD8roLgOkRsGeHP9EfIx41UYDvGtpIuYmJIHNPk0Tz4fF0knQVXaGs
	 7bCFjWGiJMoOg4+lR4D3oC18Em1ti2+C7FmES9dbHsnRJRKJPbP49zJkydrp1WrByOWSo
	 wkY0KyGNbBoibJh0rwkiPPucYL6cfewkv9VNQOSpgYplyZPmPpRqUN990iPX6PqUPnIXI
	 R6HIx2ikY//3EF+MFcTlECtJgINsNf1/WIfMqKhCczNFuL4Ey1fmPsjMus30p4rkjXXZk
	 OriF4PgSjY0JF4XfWUxYK+3WDokL03BKPbsCFyM4v1Uzm8iqxKqQ25qncV740cfI9AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pzlEBQos;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9371C6070B71
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 18:38:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9371C6070B71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pzlEBQos
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so1809211f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 10:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595137; x=1795199937; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ShonUOYxGGNmtD8AWNfZClVcjwHiQNoIijd5Y0f0jlg=;
        b=pzlEBQos34MNNpurfGyXR57C0NNyfj+EPBTsCLT6EE+7Fi4G/LzhXJ2OL8x2yklRtp
         pqU54v0RQTpZvIhbxhHQAqnB67+/B0xguWkzoVW4mlFHf/P/SIXv8yTbgcIoAwF3sLVc
         0uU6yujcPl//gZIlsko9pCMGUJu+DrMJXKAi0weJPQRsfG/WFs45W01w/RJMFgO6ZoV5
         Vwk/qHGXElE0LJb0jJSGAZ9EPx/P9Flo9CkkyrFfv6Z2mOAFLHBzWVt7wJLnsVXYUjNs
         sC00lnvD4w4JP45/2HdtuuH/dT+gDYc+OyFd1TnDoB5XNPJFrJ3etxWnUAWZVE4I17bJ
         97mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595137; x=1795199937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ShonUOYxGGNmtD8AWNfZClVcjwHiQNoIijd5Y0f0jlg=;
        b=khXOpM1n01B8Ap3DEwLESSERpv8jwVLXIntnOrfuMd3vK4fowURlZQIKw67sCP5lV+
         hfr2uVSSLUh1sCgeh0W0Eu5RuQGTWN+QvaEy4SAtblpk+o1/kbwzf789xnyuh0Vc6iFN
         yhFHdoVJdBAxxaiH2wIXVdET5rXYWqKboqcarq3R9uaa2BCvZORMR19NiiQC++rNynJr
         bQ4R1g73yC/1jpPq2OX0U443SWyL6TTSZD/pAYJYydzwMH/Du5A827iMYqxLAqYISNhK
         STrWqsz+Qf5QDBKHN/5atQgP6YSpMtXSr7C+jk2lq6/VN8tkKV+/boRDb+Zv2JPxwWlx
         KyYg==
X-Forwarded-Encrypted: i=1; AL+hErH+U4O//SOLNGxAyxRqZkUs53qAIRqH2zRvYSMZC8AG/ZglGzuX9aJeAc42r2mAodODwBH+KXZwx1U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TXRcMdGtHJ0AHSAkj812ec1xWUxfm2Xi4QRJ6J7q0m6L1+Z66
	AcnaKRl0WaQCZ+eQ09mLIpozHZXqFiS0aKcElkSgsEIVA6r1qIP4igTzBWZg0jYs2kE=
X-Gm-Gg: AYBFou0s4NUyQqiqDRNWccOkWRNj5l7vFanuz0tzqb8bYVSuzrZxFcumHAiTsoESNpU
	ghdxYoZmqwoAS63u6Ms3L+pLKreUdF8GvarqF8s8fuMG77EmeI7c2PTQ8qGyZH6V6XOMWv1Xan1
	8luMENpBah13AEAEvDyhe2ABVXCz2rwC3DIjwjBmqfYySKPZLuPlFx0kdXQ0pB0VvStbJnIJR4+
	uKPCWNQjwNl6WG+Y4yCQv6HXyaFexypctL/Z3gZN9gxJRr25hSd7iWu1vKCwCcTbgg5WEuJDFc4
	B/cy2GYZ5rf68+1YLFc2a7KRjDRwNrz2QSUzEtahFq9tMlfoWAjqgd7ZS2AYu4kBC7m/B3nC8Bz
	wuwoemH/4oyYrTyzuShAKQReBWxwrKbHS7h+/eBPnShUYSAk0azduY1HhSltRKMmfqA1UAoHBnJ
	ve9Qu9Y33XPSOUt5SSBnEnbViS4hq34eX9uC+ma9SZaS575XyQomhw8TxiXjSOWTPfqqvJOEKE0
	uBSfGjY5Uc9+PRrYG/tIWU0jcCgLfnMLlS/yQ8Btia0MfP4/x8DhGdAQPSPG/S3EbMPDv+j9oG8
	9W9QxK1tUBxojbMVMGEqAihmmwzizZXOzuKX8+gb6Qw=
X-Received: by 2002:a05:6000:29d9:b0:498:b92a:30b with SMTP id ffacd0b85a97d-49c70ed7d88mr4816619f8f.15.1794595136922;
        Fri, 13 Nov 2026 10:38:56 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:38:56 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:32 +0100
Subject: [PATCH RFC 18/23] ASoC: qcom: swd: allow LPASS_CDC_DMA_WSA_RX0 as
 soundwire dai
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-topic-sm8650-el2-v1-18-5183f6aab9fc@linaro.org>
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
In-Reply-To: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rohit kumar <quic_rohkumar@quicinc.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-gpio@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=588;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=B8W0+YjZEiqoAbB2dPCHvIJpxKQMBOWC30klAZVCDd8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91kmG9XLHJeLS7JkptOZPLWufRWNkDG/W5drmOwW
 4Y4Jx0CJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZJgAKCRB33NvayMhJ0R0kEA
 CPcpfO2Q7RH/mOuBrdmSsYWh/Q2dOu/1HoNUT5WDw9BCZ9KYeOyugM6c4PRXbtOZWvx5rcmCrgj4dK
 uOctwbfOrRO7CrXqfSUhskQ4BbiH9AtLqvcmDNt6lZQIi++PrIPtZu/3RVospJueeLMMtkTxlQnaka
 BhIHrbr0o7jHeVHDde7MIVJb9jsk7r961kQ3n+tSxuMkYZuzW92q7kLDMf2T3kdUG49fQq+HtNb7Fn
 oS912dRmDG826ai/0NTCaoM26y1CYZR5zKxzdXmheZPsHts4GBG39RZcFIGnnKaWHQNaQLpdQ1CP6L
 qyjGpWD0rPxLsHi/mmKZ6ImyWTSNsxBUJXrAr8vionS6Cps9C3lPWY5sqeaTdFU7bjYjKDByBY7OCg
 zVwH+GspOzc97Yqo0/CfpwTEuI99sqsyN4nECNVVlEsGYByj7Y8W8r95sMqdWyBeztHhfLBsl75oMO
 FGKGYrfOx5ArkG9Neh9MIvw8uLBIR9Lon0M4TE9Kynly51xl6CZvyJaPlCnIpK0CdhY2hbx/6rLKLV
 Yv2xDY7I06/F7K3vCRn7tR7/9U9vJhFHkTGT4DH/BCpYhpbjNZbOJFT97MfTCsp1HaGiiLeCrg4sS9
 lXXSdPVk3ThK2lywQ+5XCWFy0iSp0cNH+gJPh5QzpvZw+n/45H+zRxX33QHA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Like for the WCD ports, allow the WSA_RX0 port to be initialized
as a soundwire DAI.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/sdw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index 6576b47a4c8c..82a12c050d5e 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -41,6 +41,7 @@ static bool qcom_snd_is_sdw_dai(int id)
 	switch (id) {
 	case LPASS_CDC_DMA_TX3:
 	case LPASS_CDC_DMA_RX0:
+	case LPASS_CDC_DMA_WSA_RX0:
 		return true;
 	default:
 		break;

-- 
2.34.1

