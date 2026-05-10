Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A5B37C0F6
	for <linux-clk@vger.kernel.org>; Sun, 10 May 2026 09:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778406487; cv=none; b=VbYVNzr24oX5qxmVcNxWI1UnWMFNTAPj6hn96zdBPv2SeX9P9IFnTD0xFWURi0NGG8Im3bpJxEBEByU3zs46zHoyOo64vXhRy4LvOa62zuAZHnBYX2OOX7KFKxKqos6RVMl4wXrrJs81qBPIdPY3tvXDz/JweAMN3JHJQmHLrrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778406487; c=relaxed/simple;
	bh=u1ZxeAc19H3I75eYjPO22qxUQ5RQA6sI/ieAA9yHFvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YSLPBwUhkR7PHYwL+bKcH5j/Ng+4u5JFaIi51flBpcTQtBGmQGK++dFbt7vSxC9cFSwLCbulYKeQxbV+PCcX8vo+dE9q9Zu/EWZj93pwlNJAGrWuaPYUZE2chR8zCqrI8LowqorbNU26uKHPFvp85mhSepqySeTFG8ikmWi76Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lF3LGAsf; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lF3LGAsf"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48e8132c6d0so446815e9.1
        for <linux-clk@vger.kernel.org>; Sun, 10 May 2026 02:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778406483; x=1779011283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLO7DOU1ouh67wd4NrLBkCSh/jnFkIqwlgXZjoPnVfo=;
        b=lF3LGAsfl80ehNtg8BrBQyE0KVsNSI9Z/gl1Fc55p7oeMbSvG7MvTEZfywMwlP98wc
         FKGQD87SwGe9PnDexx9bq1fwdB4ZOgQzlmxSuuNrCrNxXrzzhioTMcG5sI9utieidbNO
         ss0oC4fN+NeIgFbf9v7SWFE4djnnpQd6JMUIlF7G1h3qKS5pwBJgX4pi0MNHY1o1C3Au
         nfSywopPsUmVdmJ6TUslR2FwMfEQtMmyAh936QAm63muvTU8rIVvc2FgXxjcgUFaL45P
         94eJEIApjJncidadAPJWHGU8AKwL1FfNPbn8yq6mwweQ1fEwH4pP8L/Bp06e686fp+UJ
         BbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778406483; x=1779011283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xLO7DOU1ouh67wd4NrLBkCSh/jnFkIqwlgXZjoPnVfo=;
        b=lcUiqQLgnPuhorkggksjFW9WcECrTPjMVUyyJiiQCZlSaheTzHMgg2ltKPoGlpW8av
         7D4Rwu+X5XZ1IMvj8sZCTCR/c6rTxH9M8V8zxhlS5M/AyUdQF/drFZ5/UY5WooF5I++h
         cCEpN9B3hpPSzP+N84kpEUZU801lReHTUU/XGRF9P1BKA7uDaUxgtsm5xPavpmMKg2Ce
         d34snfcTEGuLHMy/TlmfrAgyLDQOn3wcp1881kxkzZZ8unJI0aCkVg4hiS34+VLXXPcL
         wo2JW/4Eo7an5yMDGB6nYCxB13hvkdlTYQ/3gehnrHG/PD7XFz+kGUGdDQhqNTCpXMsw
         El/A==
X-Forwarded-Encrypted: i=1; AFNElJ+Lfry+h0TFiCMDvuHkqYJMKwSLTs+7RC5tDTUdBthjEb2bt8CH9LilEIXDIgtxglTQo5sI7sGMDZg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/zGICQwwMR+1VQP9i1baSHQTYVysd1WhBsgP0rBBikj2QZSVw
	0Io9uzCkrnU2SArhSPszAjGQSI7T0vAHzRW7LX/irPnBodZkJlo7nSN8
X-Gm-Gg: Acq92OHN6z/YW6e9HkAx5aiHLdHPpvF9ts6LXxW5DStZLvN4mn7NoItbHnRMGpwo+7x
	qMFe9O8jEXl3zR5rdZ5HEwUbc5kq857Tyc4dWAAnC8uTY+MApG+5uJ/s9278w3w/Aqb3uSSv77O
	QmChrR2E/MYQEDG2MoAeAQr02j7m8Nry1ZaT2TePs65LmhnHAt6M6PmLJKQMoRzdbvC5PtUM2xO
	g7Ss/2ZUAhfnP0ZNAKR0y8uTZAAwzRIFlrP+RabOBXFCLQaqPE+w457iY+RBhH74EZIOTzyjA0+
	G2JNwhRlRJK9Z9+k61LDn/bfajlQro+RNfwjQpusrK/5axom6JO/l6lI3/0au2f4hHp20jqIwK3
	sJAwe59lgB1vQltbj0uD0dzoY42SgrKIVZj1cZshEr6/5IG1RjycEqdnyIQ4PFw4bgmTYNcJ4XN
	4pqZ9gQS6TYGPOKy/IQVKR6CVi9DgzuZYl+1tb99E=
X-Received: by 2002:a05:600c:8485:b0:48d:5c1:bc47 with SMTP id 5b1f17b1804b1-48e51f32a6fmr330837045e9.15.1778406483419;
        Sun, 10 May 2026 02:48:03 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:4e2:a099:cad9:2ecd:93de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e0bf2sm182807925e9.4.2026.05.10.02.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 02:48:03 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sun, 10 May 2026 12:47:42 +0300
Subject: [PATCH v6 4/8] arm64: dts: qcom: msm8939-asus-z00t: add Venus
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-msm8939-venus-rfc-v6-4-e69465375900@gmail.com>
References: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
In-Reply-To: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
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

Enable Venus video encoder/decoder for Asus ZenFone 2 Laser/Selfie.

Default firmware paths work on Asus ZenFone 2 Laser/Selfie, which
means firmware-name property can be left out.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
index 90e966242720..231a3e9c1929 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
@@ -267,6 +267,14 @@ &usb_hs_phy {
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

