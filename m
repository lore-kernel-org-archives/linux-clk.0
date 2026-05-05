Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6087481ABB
	for <linux-clk@vger.kernel.org>; Tue,  5 May 2026 21:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778017575; cv=none; b=WGL/Pev0ei/YI7uVgL/05sZpROE00xUuid8PXLnZDhQYGXM9vKAW3PRXhY+KEaGOyoVQBXYmvvYzITbhCkhWxSs2sIzPC/uYuoMgzyDtCmptsH+hIqr0oil2hB+OqYexUVtWTYUDiE5ECjQEid9VNf6HPrPzr15wm7lXfMAx+MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778017575; c=relaxed/simple;
	bh=vI5c2wup3N7m7wvOZ+EpIQTCCYUqkmceXR+DGRotI8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l19FhkIUe5ZijdEQl9jpPQ+H9ZpVCLwkhTDUrj68brIbVBHa/ORgOGUIlMaAinhl46KsIO7ZsF7yP2+m6bMhsBg6T7VWnv9w1y8fvTA9NdN217eM66+1o8L0NmMM2LP1/vanE4evPkBik7BAs/zlLYQCfkkMfhsR2IDNUeq7qrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F7j7QgO1; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7j7QgO1"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7bdf83185bbso689137b3.2
        for <linux-clk@vger.kernel.org>; Tue, 05 May 2026 14:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778017573; x=1778622373; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EammlrfJSIT4ldTBdJIISmN8l1LiV/D3VbIo0yD3tMs=;
        b=F7j7QgO1/ZEHRQ8j4k3h/vV1CZpw7eBseb/MmldYW9NO71jM8C/2bvp7ZGvgtWquc2
         yILCpuBnYk+/WriHnGqFKxSKCZqueKWh9M9ZQ0EpMN+ixnRPbZgWuuLFx/jm6/x0xcfR
         GdAojbjrJ7TCqEZrdLr+86nnka9Xjl3NYL2xxxHLWi/vyuZi95DZG+yCin2o1MPwL2/2
         3x5TP8QiUXFDR/kY1sNKo8/yERmAcnK4fZZxudXxb9eRJXnFJL7Jy+6sMfwpKjtJ9JoR
         SicpfEqKqcnUIodTBpYkilqg+AAJw05xoy4ThX7DEKypOWw5PmO1nupZvbv88754fuu2
         h6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778017573; x=1778622373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EammlrfJSIT4ldTBdJIISmN8l1LiV/D3VbIo0yD3tMs=;
        b=Le13wwzO04iGVsvMyFpzFQA6vBwTzvG12mRTCQH1suxrwKThBtY9wozgJa37bbeHPN
         ceuYtZwr346OIezcLIoN/FMDvvao4vF9ECcLD2tLRNNlxWuxInH+lBNo6cghICEWeVW4
         mabvNRWFEOieaAYDFbJDkaHo/Rqc0KxLQmEWpuVK84m+27m1bLK+40fi48Zg8R4h0HMq
         V9Is4K3JY1LlXbv5SQnQ5Ol7ENQQB1oSpooiUVmB1RGCUR6rLHxQ8v9Sa6JaTkAoXeWL
         RwBrvGLzmSryQLPFufOGFwaUD/nCDAiyREzFLI8XpPlpBgyIskLuaTnVXrTuT/XMEvZi
         842Q==
X-Forwarded-Encrypted: i=1; AFNElJ942jnzEn824L/cJ5P/Djl7l8Yg3HDr3n1+4xgbZaoKKcfCogBwFrZBE01YbWdl6sO8U1QwHTNqwfk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5n47J5OjbOKcXotpc+IxVC2xKDpxfVGwKjDqb39WS6j/ZQKIh
	G7AQ8wDQrGqfG0bKPQSTqFsumos8EUqQC3wO/MLva+K0Z+BPWK7Qb/nW
X-Gm-Gg: AeBDievQkdmB5fdQrPOUzEw0BkDpe5l1eSz8Tppsp1dsziOwGLmbHR+BOXklbuQdRR/
	sl20li38FLvteyWJ6ELJ9m4DxULT3aJ+Vo3JEiL00xer5spFdm6x1GBEqe7wAZ5GCK8rZfnbX+5
	OI9/Pzoa6YdxF5SSIvm1hzaziygB2qs2tQZ3KEyqcavD+5WNOyhZvaLfjyBx0AiWNoxLg/zTkhL
	hny0UFcnOtIfkuAHnumRK+1B2O5A/s2O3SjlFP2oC6OAKNSmt948gEWM6q+D/9dpD/GZiahQH0B
	Yy5IuDi7tL5FiswoX+mSnZu6BN4CU2DnQ4zKkWWpj2LOvCzCqb9NbvtLls2x513Ju4BGZM4Tuae
	jINFcUU7hmPWs95WxJdlRMXkSkOW+rU2j8ZfbXeaAI+G4od4njiyR1y6rgOAr4Z4b2fqUzRwpFb
	W7Weuj30JZZNxgC+34iAAxRB8JoldxNInHmzxMBa11M7jkezU=
X-Received: by 2002:a05:690c:c4f9:b0:7ba:f1a2:a448 with SMTP id 00721157ae682-7bdf5d7f239mr11612357b3.10.1778017572841;
        Tue, 05 May 2026 14:46:12 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6656542bsm70158767b3.20.2026.05.05.14.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:46:12 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 06 May 2026 00:44:42 +0300
Subject: [PATCH v4 5/9] arm64: dts: qcom: msm8939-longcheer-l9100: Enable
 venus node
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260506-msm8939-venus-rfc-v4-5-994f5eb22acb@gmail.com>
References: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
In-Reply-To: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
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

