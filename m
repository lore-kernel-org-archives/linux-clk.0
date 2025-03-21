Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEDD1917F4
	for <linux-clk@vger.kernel.org>; Fri, 21 Mar 2025 14:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742568353; cv=none; b=o3j9l3qCaMPZkzl9DxNvdT+EywTEs1pzT8KDvsUCS7q5z/g0Uyyf6Br6kz4mo+Dnvo88HOJrC95hvqcvYljk14PqLjSwJF+tZhj98w7LOE2g0kaqyHa/AslPXVWG1iOb4FUtCtEi4+/t7Mt6H6hQXUmjZrDLDEUsb1Gg9gUZ5gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742568353; c=relaxed/simple;
	bh=0k4WlE/9Tyqofqq6qU4Rq2nzt306TPjVYhaNxs0Bvcs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XcgtT6jztzkRn9fXzsWUsLFvi1Cn1xrGgWgIDwpf6RAdFOgdYr6lStcmB/TEL3KRb8gkbrSEiPXhTmKNZLinj7c5wuNb4u4qdbqlEXKD6HaEEdL3Y2ZCyzOUXCrG7CbVLZjFD5OL2ENjkZIXK0U7s3U0lw4RUdPUnW6u96ZS/PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=NIhgSJe0; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="NIhgSJe0"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ab78e6edb99so319573666b.2
        for <linux-clk@vger.kernel.org>; Fri, 21 Mar 2025 07:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1742568348; x=1743173148; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UfREiEIegsjqq2j/Wuwqi5NQffLWKjGNHk3ynXc28wY=;
        b=NIhgSJe0xnaf5jKCrMK6BSd/D305UgFcyZWpz2rODjKRvWY/LVKabDP5NufS4q8DQP
         HhMQxKdx9bNlng21gmeUj8ayfmnxRJ6V/SwuDqvE+m5E1CbJdYOmjdVHSaGxVhLDAjsI
         TyDoCfIrLgnJ0PcAD/s5R7gR2GFxwKO4VsaL7AoJLLMy6zwrxN87vBj2jn3NXVHIcRTj
         pUaYOBTQ5JsZWCJSopidjlZR/SrPY1t0HUR+ErwHMgdQB8rhH3Qa49aHflUAwFFTIzwZ
         J5A7CsxZymW8XRsSdBigvmODl52Q5zjwp58hqVLHtlejyLq5rdkJbU5HGIWGgDX/h7+z
         5MYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742568348; x=1743173148;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UfREiEIegsjqq2j/Wuwqi5NQffLWKjGNHk3ynXc28wY=;
        b=OlSXte5KP0qsimwB+kx0GOhPaHsM1psqJ6EmngaM2CPphDCoQCoKDT3RX3J6tR4PuC
         xJH8SwQgC4oZdbdVaaIc6D/7O+h8uQVu6uixAnsc9iOE0LzY6Aivki76EXvQUVnLyHid
         QTM5rJgM7qO3I5hPWRqOOERwnDA8H40+eP6kvo9lSrCYZLMSho1coWExp8yjqH7v1moh
         XFyx8WcVPA87XUMXPY7hyipKVt4rBt2ntTNRzQGsSQsVNYrpSd0J4NJvuAEwrfo79WI5
         t+Q0F6LKxNRlR9rcbgXQVZriWytLI6Ds0z3qsADX+IPHgQLwSjY03q6tjSLDXCjDzogV
         CcQA==
X-Forwarded-Encrypted: i=1; AJvYcCWSeK0ZJlUbTi8nkvxJQA2cxkvSspzU2c0jOJd0KBs3xC0iKIS80BS1oPFwCUQe+DYjWFAvyvJHuDk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxD9yiT9VMfIzhWBXDp+iEvb8V/imVyfsu5L0Hcfjck+A+DMoQp
	DugMLA3Ju9797lj/DmSjNMMTVza/5/GMyq62/+UbS6c9ISbDJzqVDtczbIj285U=
X-Gm-Gg: ASbGncuIZRAPRaZOOHZmTpLa7cLp8SwKHtp35WuwHn0VOqm5Jv597iN8STYPoBCDF9p
	BtrY6g5MHmSI/a0ijuYSsrXrGzvP/l/34ltQ5JoBI5X875eWmPkWuiPZ9cCVAZ4BXeq39Sen3Ot
	XhEAohT8oYdS3hfGCG0cTxaGCm5w5OHM4LRt2a1/eszLMHO8PGcSRan7VhvcWUNhdcN+zro5x2N
	c61DZzr9ogd1imjS9yKVBzK4Np8i6rZf0+3ftS8Ft7uosisbI7BJwqMdDxpZI5pxr1FCPZbhggB
	2oSMxyFSLhTM4x1WUtI33IQJcpYrT5M3pJGWJPLjM5MYcLOnXhg4j2oEQog5So7bIvvh3rhd+vW
	Xjh9TBzu5JgtH0d/8VA==
X-Google-Smtp-Source: AGHT+IG5MlM9CgB175VZ3Vc4RH0qB2s7BEDKyYcPQFBlPYs47o+HPbEy2dUQI25i+CYb4c4VAAdkLQ==
X-Received: by 2002:a17:907:ba0c:b0:ac0:6e7d:cd0b with SMTP id a640c23a62f3a-ac3f2268607mr442093266b.34.1742568347928;
        Fri, 21 Mar 2025 07:45:47 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efb648acsm168092466b.98.2025.03.21.07.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:45:47 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Add video clock controller for SM6350
Date: Fri, 21 Mar 2025 15:44:58 +0100
Message-Id: <20250321-sm6350-videocc-v1-0-c5ce1f1483ee@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGp73WcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYyND3eJcM2NTA92yzJTU/ORkXbPU5JQky8QkI3NTMyWgpoKi1LTMCrC
 B0bG1tQB8vXnyYAAAAA==
X-Change-ID: 20250321-sm6350-videocc-6ecdb9ab2756
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

The driver for the SM6350 videocc has been lying around in some branches
of my git tree for a long time, let's upstream it. It doesn't get any
better by letting it age!

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Konrad Dybcio (2):
      dt-bindings: clock: add SM6350 QCOM video clock bindings
      clk: qcom: Add video clock controller driver for SM6350

Luca Weiss (1):
      arm64: dts: qcom: sm6350: Add video clock controller

 .../devicetree/bindings/clock/qcom,videocc.yaml    |  20 ++
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |  14 +
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/videocc-sm6350.c                  | 355 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,sm6350-videocc.h    |  27 ++
 6 files changed, 426 insertions(+)
---
base-commit: 73b8c1dbc2508188e383023080ce6a582ff5f279
change-id: 20250321-sm6350-videocc-6ecdb9ab2756

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

