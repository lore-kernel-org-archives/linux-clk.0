Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE1B4F7970
	for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 15:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203634; cv=none; b=oph+oWHAfLmMSolBQ9i/AGLigyHkf9n7tO9HRZalB3SliIxQayvtptVsUSdMGdmJVN36tVXhOCOeW7I0V3VhtmsHStTR16LJhKBc2wLk1fhaXLhdsmCvydC5hKeG6xsABDantEMmdNwhz3r9raeIIAFieV/bOekv7g69JnJFlEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203634; c=relaxed/simple;
	bh=16AoPtmHTYpJSipw80SylHAI5EPglqbbZ9EkozbD51k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BDW6EmdCaR0y8913rjaStJr6PwF+daVZQ+Gw0BVE/Oo0WoS57VPanIhiP4GyKaCJmO0L73aqYvhgUKO7cpjCtleq4JpUhtdCY0W2yc+zlHM0PdbWrgq3BvFl0FWaYcMcZSmZEZfL6zm0YaATYKgK04jhuJTw+ZkhGNDeOuSvKXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DhYHepEj; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DhYHepEj"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-67c2d57a5ceso6203997a12.3
        for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 08:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779203630; x=1779808430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MD8vAn9/wfDPga+z35YKtSQ1Eizg0RFa87mkXotuc18=;
        b=DhYHepEjAME9HAypfjQdpTCctWhHMNRjAyhpQU1/0WqNsdXG1d5RwaQIA1heOPwwKt
         PgPxdbNmNlFSyFHvMcSF1o2AkXlFVk0YBJuVP/NGqJwce6E3EleGXRgTa3fYDI/stXIn
         28raa0ZhmPTnH8VTljkRhB7UEKe6Y61zgCoJQafdV56XGf+O6WBZixBbnH0uYNjIYiAF
         hJ80rffLRn+/Ir4yJ8E1q+hJOEYUOmyB1cHnrUOW5O270QqEOlVg2+yQZfIXL7NtO63d
         J8nUhG7EOioS8NbA1ElWfgloqYzVvrNnq8rsRPlg+8jCHLD4jUYhUUt8YbuqQOJYaqTK
         M8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203630; x=1779808430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MD8vAn9/wfDPga+z35YKtSQ1Eizg0RFa87mkXotuc18=;
        b=kd2rjzkN2FvUZ3GSLeLNo3JYM4XzUR/n6Fd0soGKQUXaLugoM3mOk4om3UrMWAVtn2
         LQkXxkM1zQbgSMt1UTn95MtBgrLGCYFHknHFXwCpHdXZSJYxsq4aGPLlvzEyOQ4si4lm
         /2cWmw2c+pM2AQe5hYewTQCEfrvYjRHKWD9xubXjkh8SkGK0SaDR4ho/7o5Oz8mrgSuu
         yc9llm7pyRyNU84rkJ7p39DFoLy8Kk3BUj9TI+RS1hz24yc3Oh3ZZNo/Uh21Q1oiiOEM
         kpyrRTKz8f5/k1lqRecqEgNf+cGaUTxO8H1N48s/byrs0PZ4Te36s8BlGzCkJWElaBVR
         6pbQ==
X-Forwarded-Encrypted: i=1; AFNElJ+/4AK9yNEsLzTjttbBlkstf7YfJBEG85Gpvtp2tv4fL2S7lulBJ9GIl7DmXuYVnKXXJhYl4uddo6A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Q61f94nGfTzx0EMuKGrU278OlPQ2o322UtMvBcFS4YgJbv0T
	Duq763kjYmMUGxS+PPO/+bfxejTocqkPujqooHOMqXWilVOQ85qY3K4n
X-Gm-Gg: Acq92OGWBWOZufByMC8EZmSh+5DuXhsNCVaAOi4P0iiVdXSyBC29wI/tlK4ZyCoyPNT
	5XyS8x2gq4abelZzw5fAuXAWRt6KcQCzjEOUrw3f60iM26kszYUJOn/1SFA88OVszO5wqJ0R1xp
	AAq67OnPZCoIf3s3OQ+CTjObF07U7dODhWQ+xLwlD0iyx8XZd8HOJnclrpPq+eAn2Pj3Yjf8s0X
	4LviYj/8ApD+sj1gmCLiOniwjitYJkjZxJers6NeRuduKqHzArhAhQovt4B+JA7ngq53yhjiX62
	Wa9xOQwDGmw87P9cUQi8pSSymNXf5yI0BZQ6myhIm1A4/tYfBNhJ98ot9CAcaBUlqxLeTR0hRq7
	BkYqgjiUTqH1z8hOxJDqc+VRN3dW6paTecqQz3zGx1VtqEjzuYEkhHmBT5QiHE9dPwVxPQxS7G2
	rAAQn0AMf5M/oNu4As6bRdUc0fgQwCU6sWI8vM
X-Received: by 2002:a05:6402:e04:b0:670:ef2a:217e with SMTP id 4fb4d7f45d1cf-683baa391aemr10613028a12.0.1779203630340;
        Tue, 19 May 2026 08:13:50 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b52675sm6697700a12.8.2026.05.19.08.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 08:13:49 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 19 May 2026 18:10:53 +0300
Subject: [PATCH v8 8/9] arm64: dts: qcom: msm8939-longcheer-l9100: Enable
 venus node
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260519-msm8939-venus-rfc-v8-8-542ec7557ebc@gmail.com>
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
In-Reply-To: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

From: André Apitzsch <git@apitzsch.eu>

Enable the venus node so that the video encoder/decoder will start
working.

Default paths for firmware work on BQ Aquaris M5, which means
firmware-name property can be left out.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
---
 arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
index 13422a19c26a..48514c3df718 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
@@ -314,6 +314,14 @@ &usb_hs_phy {
 	extcon = <&usb_id>;
 };
 
+&venus {
+	status = "okay";
+};
+
+&venus_mem {
+	status = "okay";
+};
+
 &wcnss {
 	status = "okay";
 };

-- 
2.54.0

