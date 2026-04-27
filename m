Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360433EC2FD
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 17:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312746; cv=none; b=SPE+/NnyxCmmnlthGxpxdUtZqqM0nRBsfOa+Tp2Md7zEX3l04EfQJwJCp7OwGES2JMU5OevAIIyCfOaSIpy7+mkzq7fD0QXyofKAijyXdUazcwHDsVBKPyeh1aJDuT3f9L978KR6174jQGbwe060EC+zqcwnkS4rGzXd/GIibTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312746; c=relaxed/simple;
	bh=vI5c2wup3N7m7wvOZ+EpIQTCCYUqkmceXR+DGRotI8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K5MD2IyGeiVuivQ4tKV9qFA0LLgDpuoCO97ngpza6GbRU5Nvaaj08qGBsYSNLul35HWocEkY6QXrF53fY7nk4ZkXWnSCOMqHeKpX452uvu8SOETm6tnLI2/aqEcxfI8P4lnoEZ4vGYHPWBfT8NBeOqfg+YYweXDVN4sooecIPoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5Y3Upzr; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5Y3Upzr"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7991db3dc98so115171047b3.0
        for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 10:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777312744; x=1777917544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EammlrfJSIT4ldTBdJIISmN8l1LiV/D3VbIo0yD3tMs=;
        b=S5Y3UpzrB0uu+Vxo0VIJkGdyxrv0+IBWysjGpqplCcAeeJUEBXRQG+pMY9+C4d6Vke
         MrZF7mGMt0BRdpg11j+MZumZK8vwen3dHp6UwSh9Fqayjf4/Jk5fyinCIYp1RnWIH7LX
         uFkzlDR8EvbADRstKh3nHwh53oD+7vYTCT6BkbW2EusvOGWGDuYMo/ZEwr38NfP1lyUD
         fExvXSEZxk8e+jpDbiAFXaX3RaS6ogLgQLwHqwK4J9qf95BCMeErZvWyocGZUQm2BG7p
         jWZPv54DV8sqO3d9xRVNQUMJpg4MzHCQgPnabB6V0RwMal8hILf8gY0gzoCXsP2X/lbV
         BCOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312744; x=1777917544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EammlrfJSIT4ldTBdJIISmN8l1LiV/D3VbIo0yD3tMs=;
        b=A/Vg/fjeCJdKJe16x4azehpGrYlY11atj5oiVRizBvHUepegHVfFOV4BweWA9qynJv
         tea4o4zs1n61Gu2Itlp0s14Qg8x3JBWUlrMb9G9pc/q80GOTKXM3HWKo5QjyhCjn1zDO
         UC6cxtkysKZvWHsfOfrovQMgJmRGruqxoSRv8bGsyFPAtwF7nDMCsdfkCnFnNOXF7pZc
         4ZUFSHc7JZdNawJ3WEjLzzwd7Pat5UehIPG1knUOcUbPdn6PzpaFBeJF41CqfQHLG2eO
         6Ncw4InKBNWjw8p52i+sEutHgMvwdDNAns6Yl/bWedx4JdL8NM261bY+fyqtS/j6LnDf
         lKsw==
X-Forwarded-Encrypted: i=1; AFNElJ/mfWWyApxfu//RNbAra+TnghJHLNqN7cUKYOQ/rxdJNIbIZ16chtffI0FGT2OeS07keGZNwsBXfbo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt+K3XGEdV6r57GUb2Rl/DgENCYqhhCM7gFUMJku0OMqSN27E8
	5UiQrBOKkmrBAfKw86k+XYWm5lJ20haTrHutgT3xndBGZocX5W9TCheF
X-Gm-Gg: AeBDietapv/Mac0+JM+GAhq0+bCblmN9mxi15aSD/xP8UAVhBjYB9dPsEFteYvwJGZS
	TMN817jwX6qsoNhHju4lyYlZuiyK2ez6HlLyo/qLjz3rpCjRjJg14PKg/4fgRA36tQatTGF/rUk
	N2H6kBHv5ZpomJNRhEm+kz7TYY3BXZQ1PcDO6bdMWr3m+CJ6R0TZoZLmQYddVBpavTIPuRgBTp1
	QVRfUySZ5QKC1R94grfy7SKLwJH3tb71Z1IwVNyedEG3T8ckoKcmbB+GIU/q2S8PkKXe0SMfroR
	+FVOJnv7T1ttA5RLuheAhTBT0d5UpyHeflG0e7H/+igIjFiBIhBimY0Ns/XH9DzB7eqUflIWeWG
	UpMBYQnWevgsPEHwAj0OpuNR9uNBDz1Fg0ckLuo71fEjRyBNDfQkWWGJavg3RJB72y2exRU4wOH
	ahbfhMB6NfnyyCoxKHrrV2/IXJd6PYsUweUPRVunbNo4Lj11E=
X-Received: by 2002:a05:690c:6811:b0:79a:60f6:c5ed with SMTP id 00721157ae682-7bced8dc69amr3564447b3.6.1777312744138;
        Mon, 27 Apr 2026 10:59:04 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e9cf8sm198467b3.18.2026.04.27.10.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:59:03 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 27 Apr 2026 20:58:27 +0300
Subject: [PATCH RFC v3 05/11] arm64: dts: qcom: msm8939-longcheer-l9100:
 Enable venus node
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260427-msm8939-venus-rfc-v3-5-288195bb7917@gmail.com>
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
In-Reply-To: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
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
 Stephen Boyd <sboyd@kernel.org>
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

