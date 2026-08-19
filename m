Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98A347FB16
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 15:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787153287; cv=none; b=adqKKt24EV0IqFhBmvtrAa7yCL3SNp6MghCIA3MK06KbtZKgyATWsgyuu1akVLBoI1hAmQBCZj38abKHZ+gM7jL147TvQKNGTcTP84bIHfMLOJQRUuDi5lIz2Df8Lthfm3PPXMEfJ76CiW/cjf/Sw7goc9AUWnNtlawM4KR6tB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787153287; c=relaxed/simple;
	bh=S4gVIUWwuoALYuzwzRm82WuAYzYN5KLWtNbqZ/oM/+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gT6SrhuO6tISCQB48Lt/gy1hoqqfeQtPZQFlglG4I4DjF78QRg048O3gxw5nVhQm+nbQQ06CJQsO7ZXG8QZFdK5mnojjVO3JwdL+DKZokzaIAICpY1Z1RDU596GejeFYbanPuXaGXqVWmstSOiIjIUTQYsKEtx0sNTNOPo3frWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ic3uAUKR; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ic3uAUKR"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cf27856f9cso10844375ad.2
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 08:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787153285; x=1787758085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=ic3uAUKRMR9niHcAT2iLwtGfyJlpPhMBCt7Gs13q3RW9jDR8nxArW71ww3ATnwoUQ1
         eDXZw9kd0N66quWD5Rou44XVSfFlGoDixgKO+3A/nVFDyd6uHm/bcgS8eM2tPkrPQ0JR
         TXdW4g3qc/VY5buQ91A4rFf4Wvs7H9aK7BDLW8ugQZUSLC4TmW/wXqeNE362k+Nkl543
         vBcQaVeNo0YPk02QAUU41mH2HyBdkBmJPPTOhOmdd3GkaCw8DZ5aQvVHOm2QYa0O8wtd
         4tAxPw5nmZDyblPqi78fAEZEpDzQ9KB25TzKOdDeESazo39eKg6WoGFdrspfbzNlidqu
         j9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787153285; x=1787758085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=P9qYm3IVbOyZp87nBtcRjXQJp0E9IKQM4h2i6GqHp+XK+MmxWtyKnL3JX67Hxghfhq
         bZypE4GXbudW0AiUrPm+isBQSikXfcxpz6Pe5HFPNVSvvV3GQkgZE26xPYaLiUb6WQmW
         lKwdKrtmTmjq3Qd1q829IZuWj6+0TkrNRuNpeyLV/fjL/D37Ih6PjXlgMCTvcneTfJR4
         HnKiVBMZxEgYupAf/R1OhUm9ysmByTmQnC2YSepuZtZdzKkLsYMfi61LzNR6hVbN6HoS
         175jlo6nz9csCLCc7GGLsah6OWSB/JhuXyg41InzVOMoDAdngmuFOgVdtAzoz5TbIdTU
         IlpA==
X-Forwarded-Encrypted: i=1; AHgh+RpNm0tlp5nJ8nky2ON1XMuwjTu10JilnctqyRZdDKUyU2il5JzE6H2rGjdi2T5ECpv2xNWuEGe3Sr8=@vger.kernel.org
X-Gm-Message-State: AFuF++lYQT+ETJGhTL5FjE7IYmpnZYIHoy5TpQZS9ZgHrvvLULCORkVH
	GZJ0a/4qMFmysFFZLVjJmRqaaRwCxnZeqYFmAI9Oq5M09qjemot8dzPV
X-Gm-Gg: AR+sD122uZ7LW7S8xO6ygzsrBo3gz6clWEHH/khunhO1RdRD3yYqEq/Pr5EKjMrAJLH
	bfw+G9a16D/9Mp5fvACwbkAUEUPi+88+dNa0gRQ7iWzbYLCpzl9GQmh3zhVtkQP6zvjRUXvZOFe
	FxkHdOuV4iqaXMm8hZhg2VHcU40Y/CRMjci+5kl2Ryg023AFvpXcV0cOMg8I/GpoKB2hecanjOq
	7lwkwjsCD4Wp5iyDineyHh6YWATKHX6hslRdbBT7H6184p+9zLnhuGPU1sObKc4g72+NoWrbd2A
	6fZiOhY/qvcV9Bxz8KhyxpizfspS8AlopN2eRUS3eA8NuwhzEJfMFVD2rlj/dQ9ZFShFNXG9IY7
	tohRnilv3V9OQ8LOfu9CHe7uQfU4m+sB7jf97TpqZtriFGQngDFQUQbbEKmsMYrretVh+UP8AG9
	7nJByVHLZVrT4tWrm7J/PRHjNXo0c+Hz8JLaZ5/VnBbFxgzmDHktyO25dNOrap8NUKw05KVBUVr
	2R4/X1q5dngerL1geCdnQ==
X-Received: by 2002:a17:903:468d:b0:2cf:afe8:b722 with SMTP id d9443c01a7336-2d601ea52fbmr110193595ad.11.1787153284859;
        Wed, 19 Aug 2026 08:28:04 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf14376asm8232838eec.24.2026.08.19.08.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:28:03 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v2 11/13] dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
Date: Wed, 19 Aug 2026 15:25:40 +0000
Message-ID: <20260819152545.3934-12-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819152545.3934-1-sreeshankar0910@gmail.com>
References: <20260819152545.3934-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the PDC block on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d4..c30b88589 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -50,6 +50,7 @@ properties:
           - qcom,sdx75-pdc
           - qcom,sm4450-pdc
           - qcom,sm6350-pdc
+          - qcom,sm7250-pdc
           - qcom,sm8150-pdc
           - qcom,sm8250-pdc
           - qcom,sm8350-pdc
-- 
2.43.0

