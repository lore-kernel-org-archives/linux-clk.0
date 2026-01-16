Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE6121A453
	for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 13:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768569448; cv=none; b=fRISqDlDFG7pzl7wHKsWFOuUnStvEroVQMtZC3YRPTqFOQkGHSwSzjn5LNuHisKy65L56am3InPz05aDv1cBaqM5wAlhD8Cp5iVmA0DznQP8+WiKQexjgEwkrV1iRqLcRgLg8u0IJVErBHDHN4p2yfz8yXVdEcE2suRqnDuL5KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768569448; c=relaxed/simple;
	bh=0IcwqQH5YyvspgnfvtfN3G6ejhtG8SMMlKk+P1Z9ZNY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tRAJv+JTeEKSS7UasrYfJBUJzSg9YtLGGKt3C3dOW+kU1jaeAsDlcOUouCNPbMVvlI49ozHy3eJCWBgJoOS1i94wBotCb06QWqCUaXdqda0QL1jt21F8kbwk+y+P+nz1y9xI76epPgaIBjM5In0GnvMx57Lvm91Dpn8nhrQ5HJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=bXxtbdvj; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="bXxtbdvj"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b86ed375d37so266153366b.3
        for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 05:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768569444; x=1769174244; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LeO3PxpMi+3RzgWBsyhtH2vzdSGJNBJ2My5HKc/4nPs=;
        b=bXxtbdvjNWxN8CPYrzUOVoTVIk8UCAj4YMnI73pV+i3SUZNY0BkEBaOvxKjvOisM19
         z4GLiV/jFAmjXHmKVkjtZbkhRx5XPaZE7OsgLwvsK3/7/Zt3AV5KGfQUb/jS+uXX/sl6
         +TdgE8dOKuZC/0zxlgqXHl2pFOID1kEFo897MHioVKQAKETgAJm5aV6rpiiZzmy1SyIy
         SQ3KMho/ferVejQqTJx3uo8ft+IUfmYP+pe8XQdjsgezHrNPIyv8298abTsBr0mH5VzJ
         kfhr3gsp+Wu3qS7WMaoHa6kHNc8N5IynhFA6dP5n+GRjNjkQHP999M0FBfH1TspCeHJ1
         wyPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768569444; x=1769174244;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LeO3PxpMi+3RzgWBsyhtH2vzdSGJNBJ2My5HKc/4nPs=;
        b=WcEcBVT4ucISZZXkjcGxqFNyZBRp9EkDk+ghukSG9xM4V2FfcSu6De7noOOptcTaaU
         aURvdLtfZHNWcFe8VhK8J5GAKb+lbtZff75Hen+MYuktk7nFloVNHeK3eAKme19umrcd
         u+rr+M8itguWCDYms9dDrilj3MT6sxaDWePSzpRQdOVljg5GVZzz9oI/TkW7k2aP42mC
         YWLjeT0E1SKtkuC6a4dyoHXhvO73bymWLhxV5qFrEnnplhZyM8JIyMJgcsx5CN7+M/QG
         JYC/leXz9ZIqzidxDi/LrjqTLCZ2mNZQsXQKMJwkXoM8qiN2rQNlxvJ85MTLhcxUH+G3
         /gyw==
X-Forwarded-Encrypted: i=1; AJvYcCWIQqDzHl5Wka88wVA+Ah440dVRoG5m3VqphKD42quqrnrHTNv++sVwQDknvLiYjoDwHHo5WR8TmuE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2LQI7m1q3oG92oxKU7RMTf+B6jxI4zBX9nigcv8+so1KYnUhV
	8abUv0/UzucHrhLz9Hi+bhKGdwg+RZPjDt4VUBYTtAl+zV9h7um8rpE8tSNz7akEnhY=
X-Gm-Gg: AY/fxX5stD35T9TaybEzN2vdxux+bcgMt9/4sS/em8xaqBG9E6dQDrsys6TKQaGAjw2
	Af49Gx0yuCU7w2jkeGi4Ueu3WDOAXGsyLPCRKMTKwqSvPaYQ8iBJXBFvwNitjBi3DgBZ5gn3ANP
	5+ip8PP1nBI9Iw8lqVmqIFPCIQOS8gdCJYhULVvzE6TMYKpw3wVIo7gMSr3GB2ayBJYBnsB4C48
	Li4eX8lF6kwwVz3VHXi7XtOZLD/pbjwSh/20l+vzYeyEOceKdbff2MheddLcG28r9hm/RbUNLbD
	SYM5rOokrNc6yPYUGaMc8k/0SYeR3UTfEaiRuSTTmifL0eNl1DQaTjLYI9j2DtdWVDSRVk8qTzI
	uxxYaAkktze6fAeYxApvbuiCuERjZ2S/iEIwaq0kIgvb6A6mc59OKvgh5suTEnHJSfuGMHPNvqW
	T5n2pXxyrDdlvOzzYemZIlAj6I6+Qt7Yy0cT7RZySBIBrxKfQwe5IPOVmS3l1Fj6yD
X-Received: by 2002:a17:907:7201:b0:b87:281b:1453 with SMTP id a640c23a62f3a-b879324d5bbmr279364666b.59.1768569444136;
        Fri, 16 Jan 2026 05:17:24 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a350dbsm235507366b.69.2026.01.16.05.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 05:17:23 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/5] Support enabling interconnect path for GDSC for fixing
 Milos camcc
Date: Fri, 16 Jan 2026 14:17:19 +0100
Message-Id: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MuwqAMAwAf0UyGzAqRfwVcdA20YAvGhCh+O8Wh
 xtuuEtgHJUN+iJB5FtNzyMLlQX4dToWRg3Zoa5qVxE53HU7Df20e4+aCS3NQaQhlg5ydUUWff7
 jML7vB5s+w8FhAAAA
X-Change-ID: 20260116-milos-camcc-icc-d41bdff31ef8
To: Georgi Djakov <djakov@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768569443; l=1538;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=0IcwqQH5YyvspgnfvtfN3G6ejhtG8SMMlKk+P1Z9ZNY=;
 b=BF0Kn3KVXUmmI5VyWZ3MMLd9Dx/ED72uHOpJt+C3M/p0HmU+c2cc0GJqaqF2EZhm29Kh8nBAS
 h+npu+bFF5wAFmKECrIX1NdAbRXBeh55KJ0NEtbwkro+ohqY4bJsVIm
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Some power domains like CAMSS_TOP_GDSC requires the enablement of the
multimedia NoC on newer SoCs like Milos.

Add support for getting an interconnect path as specified in the SoC
clock driver, and enabling/disabling that interconnect path when the
GDSC is being enabled/disabled.

Then specify that dependency in the camcc-milos driver and add it to the
dt-bindings and milos.dtsi.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (5):
      interconnect: Add devm_of_icc_get_by_index() as exported API for users
      dt-bindings: clock: qcom,milos-camcc: Document interconnect path
      clk: qcom: gdsc: Support enabling interconnect path for power domain
      clk: qcom: camcc-milos: Declare icc path dependency for CAMSS_TOP_GDSC
      arm64: dts: qcom: milos: Add interconnects to camcc

 .../devicetree/bindings/clock/qcom,milos-camcc.yaml  |  8 ++++++++
 arch/arm64/boot/dts/qcom/milos.dtsi                  |  3 +++
 drivers/clk/qcom/camcc-milos.c                       |  7 +++++++
 drivers/clk/qcom/gdsc.c                              | 19 +++++++++++++++++++
 drivers/clk/qcom/gdsc.h                              |  5 +++++
 drivers/interconnect/core.c                          | 20 ++++++++++++++++++++
 include/linux/interconnect.h                         |  6 ++++++
 7 files changed, 68 insertions(+)
---
base-commit: 48746fac3857845ce7ed4aeb56df58735208ffda
change-id: 20260116-milos-camcc-icc-d41bdff31ef8

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

