Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEFF23A9A5
	for <linux-clk@vger.kernel.org>; Mon,  3 Mar 2025 22:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741042539; cv=none; b=KLG1G8GK0YX/lB2ByHyIXl1SRyONLS4BpWW8kGAM/t3AMnlzyz1bncXlS72kGXImHi8ayNW9WH+Vxdz5eVcj8V0jAfafEY2X3HGQncUzU6JMOO2aphSgRSwebh5Ud2+MOOIOQeezinDuX3A5gRr3JqiV0hG9j5kAh/dSeUx/jcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741042539; c=relaxed/simple;
	bh=2l4XCrqCkQucTXgYQNWv2U2oS7DHD/QEgRLBR2QDT7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p8+KclUkVvUfnDWcnNXI/l9N8b/aKCZWN3+6GvxAn5eUb8UrcOZ1WwKDAFtip8SZ5MhuFgQ8FUKkUL+JS54szL9sK2ZFMPKnDp4KmCTspbZkb819Y4tCIsgeEDU2QGSUt+7LzZU/lErG6r1Vy/Bd3DYT1Lxj1lxO+IyLHlkH7fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xne/v9LK; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xne/v9LK"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-549578af093so549633e87.1
        for <linux-clk@vger.kernel.org>; Mon, 03 Mar 2025 14:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741042536; x=1741647336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIOoOtxpcPHl7i4MSdteBkV3xiIgoMMcqJLCqFrKEb0=;
        b=xne/v9LKOVWBHlawNhNDhNqQOd6V7eTkRyrT28AAgXRKO1WjsaWyrQqgGnEEAnfZgn
         1pacN8ek52MqN4mciiNcLTBu8wkHWsLb2pjG7IIn4CMvaVwtebuW/QqCDUZ011JSOs5/
         3xtv7LGEWo+jwz3Q7deka90+R3vfB1+bLCcpWkX9/SyucxjfZSRoObkm8Siq5PK1Cwfz
         plsU9lvzeHtTgQMxKj12EnkNC8UwjIDB0oQ3lZ3EaqWL5PTWk2biiik/+DC/lL7uCNuw
         cTl9HIEYAMVVgs+veaj5N0QSsVFN/1O0yu/JXzzttRlJFg2WQkjQOUyWrhQvD0alsGrl
         2jIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741042536; x=1741647336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eIOoOtxpcPHl7i4MSdteBkV3xiIgoMMcqJLCqFrKEb0=;
        b=KA947aKZu9kKIw81F5lz1AUB1Z0ndBCbrX/gmxJPznCSIPh4h6uFRGCfviO7Xu6Sj7
         o9cG24TCxLo9V/ZhpPN2KF5zA2HaJKgl9LtVpZ4866gyStz1sKg3Y06f6KMZMxeYXcUf
         1+UrfJH4XB68OLR9PAdcuDCb1sQ/39eoI9jcF/ocNxpIyFVrXGFRb/p8m/NPeam8a4ty
         f4gv2zEirEWsvvG8PQZZQeqXOSwZcirOrU5GIURCsWzCnWL+abwb/0CDa/STYgTPqV5m
         g1EIrsgo14mJI/i+2+BQjGrXCs3WEEJNw4RUef03EtC38KFVwexygYkZ895xAwaAruvg
         mMQg==
X-Forwarded-Encrypted: i=1; AJvYcCVfm1wYmjLYtBAwkEzvQiNsQM9UMvH4siAG8aEykbw7t6UiGHCTy4yH8WXyBnQUh36IFQSSInRqCcg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXZS6dJP3cid8PpFeYEc/pkB8BjADVYWFb1iW3Pf9sR9CemkFU
	+eRUwGODO9pUOOqk3LzT6k3Cwr1YUrX1MawwWbfcS5VAzeuPZQrlJVIsXJZVAQs=
X-Gm-Gg: ASbGncshTaErt9sDU5DHc7nc1wQd38g/0MqUy8mIGaH/AP9fS1RLXZ0OtZ6WTOutl3b
	07UFWfLJNyQd636L0ivUqRRXplS2yBJGD0iB0l4ZGyIb0TYwJYfOGStz4mH5/csqR2NNnMyKkqo
	JCnxc8UGqxPppZJzNB+Ok5UGgd7I8wrq2NraYNVzJfwAeTTl8piATyYEY6eizeitRk9y9+P8pif
	LtEbXKiZKiETidYVstLYufgWvpedMcAyOq9ux8TdJuyH5lXYXqh+HULYJcO5cSHmjzyI/LRtTZR
	Sjqv7Mp+Lc7DgNyBhAREYEWj1oklWrXWq0p/CGJuQaobZuMYVGT1XB2dMkuNekGDt0n+r19aFpf
	W1011zMrgjquJjsDXFIsAWeydchet5u482A==
X-Google-Smtp-Source: AGHT+IGGU9cZXDSw27YYxHElxCiZpERaWAgIGFnaC31uzKIbcLL9ZsjIMNZ/+x0WMmOpWlMlmbI4fA==
X-Received: by 2002:a05:6512:1245:b0:545:6f1:948d with SMTP id 2adb3069b0e04-549763cf7fcmr45673e87.7.1741042535641;
        Mon, 03 Mar 2025 14:55:35 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5495f630cb5sm662059e87.212.2025.03.03.14.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 14:55:35 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clock: qcom: sm8450-camcc: Allow to specify two power domains
Date: Tue,  4 Mar 2025 00:55:20 +0200
Message-ID: <20250303225521.1780611-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During the tests it was unveiled and later it was confirmed that SM8550
Camera Clock Controller shall enable both MXC and MMCX power domains.

Since power-domains property is not specific to MMCX anymore, its
description is removed.

Fixes: 9cbc64745fc6 ("dt-bindings: clock: qcom: Add SM8550 camera clock controller")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../devicetree/bindings/clock/qcom,sm8450-camcc.yaml          | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index 9e79f8fec437..d7fc9e5a2d20 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -37,9 +37,7 @@ properties:
       - description: Sleep clock source
 
   power-domains:
-    maxItems: 1
-    description:
-      A phandle and PM domain specifier for the MMCX power domain.
+    maxItems: 2
 
   required-opps:
     maxItems: 1
-- 
2.43.0

