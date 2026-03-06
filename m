Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621F133D6DF
	for <linux-clk@vger.kernel.org>; Fri,  6 Mar 2026 13:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772804925; cv=none; b=RSuzmIa5bDKLppXDNHsAuY2GVlSdNULoI43B218U8FBn61PkejFtZEM5r+d4/dsepjZGP7yCRnQr5qUKazzjMH+Hsi0RuNe/buIeutG6XkGRnQxH0N83AidTkwxFWws7rMLuEqXzZp9gU//5uD9kuhNSvhE0YJxGgn3UfU6ir1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772804925; c=relaxed/simple;
	bh=1OR1ALE2jVrBKZLHJvIYGf/LHohuVdSZ9p68Cqwcalw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=P4ICO7T2aeY+AytydyZTkdytsydagyOepxMPZmcy2S/NFh5a+NGBYCdGsyy2TrmcTYkmtE0cszCP3TBiEa/lTjMfVKrIs/W/hUhdRYmDKZCDvKUcni3eGE4sQwFUjIrFS7YJF05Q8Wzm7LgTKj6t1tAvgtduF1yEMhhdyNhGQMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ShfDxM3L; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ShfDxM3L"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439b94a19fdso5278400f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 06 Mar 2026 05:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1772804922; x=1773409722; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KLo34mncvv+zEzucrHcRYMCBDiBVpv66f0nGWBz0AyE=;
        b=ShfDxM3L6Uhsa2K1Z5j/k3byQNeL0hM56ebI+QyIV0I8PPsfQRHYe0k5FLdUx7a+mJ
         2+tNYL3YpJjiFqMl/BkVrJ/JWRAlDfQDECdaIpKeY+YB5ICtG0z5jEUAD854AVohxOZk
         YmGYhkkEMLUJ92n+WrvpCs7KJ0af+UJD4vT5ih9oqzNp2VzSC+llVfowlXiravS0Eopt
         Xtab7hclGZgVy3ECu1siNVapNkchhV/WtaIilhLOOsERIn2Jltwz2nk38KB89dGawRPp
         iUs2WCYi7RyBoDxwsoHIhEk7FalqvEAfX3xxLUQDqigV2d8j8fp0WZjY6XF7pqyeJ/Gp
         Ni+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772804922; x=1773409722;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLo34mncvv+zEzucrHcRYMCBDiBVpv66f0nGWBz0AyE=;
        b=q8NIb+yt6RLtC6A8lNdwjrpoaTJG3fXtlRP1hzndb7SMPMZPIZvxpHBWH/GdPoJJhB
         haGP+nyzUIEKTUZQ3IeOJu+8a6V1t3bY9yrzi3ROimWl0letRIAbpdAb7v5qTwrLs2cF
         oQ3B7c5SQXDNPOE3J8n3HEAXIhia2nVd2xOVvTiFhbjXOAf92wCwlLCKkB2wVKl3QJV1
         DiWGtlx3bWOiZvj2AUurEJf7KMj4jfh/zgmKqF6NsVDGA7qtkYe/QBRgQucRafvE8iiN
         SzmcZHTeH5fUlk5qD1GJLQGioGzLHJHMmJqcc5KTzlrL9ud8zVXBzZSG/9yXVYvhdSaw
         tIsg==
X-Forwarded-Encrypted: i=1; AJvYcCUpYBgkZxVML24P6l6+E614t953C2NgpGIVKjN58nTWFODiUaWylWXaP/sT7ODUmQJO5Qlh2/B4d+c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yys/y/ZvuYONqdNJq2JbQaw0pP9YcQiDHc9n5/diHBgHWClfy4R
	mKbryXJBA7Kfsh59zFaYbsz1GMPhaYhgQXfncmKq7qgU+HREVCOsHhEcTZHQYCHaMuVnDOMrWWh
	EWNmi
X-Gm-Gg: ATEYQzyvE3osRnfDAXlECenBr5Fst9daujBmyFY2hT3C2z7dKlw/Iv69qEVO2/FwXpD
	E1WiTteY3C0yyo7Xsx22tIZefm3iVwXEoduRdnoYciiLtZa/F8B0pHVrYWh1SGxQfL0t9gfD+U6
	Q2TN2Xidcwa/ppZf3Jscmh84y+vaFFnksQQEmJHjCnLpjKNZ6XwJmRMdZKxvsi86ay9s+JhlHhY
	WEUB54ro6GDvkGLGIMTKnCx4aOCJi5SQoY3HqQfpwsUromtTpTJj96dxIgjZpSPOBQr0yVaEF+N
	CMBsLlICsmn4MGBTvRLJ4+tL4Pr8U/CXYilNS1Yg8tePUST4e6zb51wuEPdUaq9b2XypJHiMQt9
	T7r9i9PE0wSB0xvYNNc+uxsbW9IhHmcWVQHrHpWihVpeJEMfHk7q/i4Hh0lBWvIKQtmI4stfFSM
	41B4eVLA8wr6YjeUHk8kpJbVMtNyJPmP1XOnR6u3Wtd+yKBjiMTSQl4qPvgWNGaCUAyYQHgaT/b
	gH9XVtDuFXa2V0=
X-Received: by 2002:a05:6000:24c7:b0:439:c5cf:fc73 with SMTP id ffacd0b85a97d-439da654252mr3515918f8f.12.1772804921601;
        Fri, 06 Mar 2026 05:48:41 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8daf2sm4304767f8f.2.2026.03.06.05.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 05:48:41 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Add support for GXCLK for Milos
Date: Fri, 06 Mar 2026 14:48:36 +0100
Message-Id: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y3MywrCMBCF4VcJs3YgTSWWvop0EdOxDuaiSSqB0
 nc3WJf/gfNtkCkxZRjFBok+nDmGFt1JgH2YsBDy3BqUVFr2UqNnFzMu1bqnLQ4HM/QXNWvTkYR
 2eiW6c/2B1+noRO+1ueUY4WYyoY3ecxlFoFrwb59h2vcvz9r/VZEAAAA=
X-Change-ID: 20260306-milos-gxclkctl-8a8372d6a1e0
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772804920; l=865;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=1OR1ALE2jVrBKZLHJvIYGf/LHohuVdSZ9p68Cqwcalw=;
 b=M06UPn7KuaTC5XklJRqDMhh1yVrVJuyv/h8Op30MNbMy2A5yL6hzG62hBRRaUOV/nHGGRzFA8
 4MgjInTjTzyBWNYS0614zxmx4T4DuzYPPMgQWwBjqw7pF6UMcIB648O
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Similar to other new SoCs, Milos also contains the GXCLKCTL block that
we need to control for GPU. Add support for it.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      dt-bindings: clock: qcom: document the Milos GX clock controller
      clk: qcom: Add support for GXCLK for Milos
      arm64: dts: qcom: milos: Add GX clock controller

 .../bindings/clock/qcom,milos-gxclkctl.yaml        | 61 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/milos.dtsi                | 10 ++++
 drivers/clk/qcom/Makefile                          |  2 +-
 drivers/clk/qcom/gxclkctl-kaanapali.c              |  1 +
 4 files changed, 73 insertions(+), 1 deletion(-)
---
base-commit: 755bfcf32666f86ca2a9a2ea2c9dc7eca4c330a1
change-id: 20260306-milos-gxclkctl-8a8372d6a1e0

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

