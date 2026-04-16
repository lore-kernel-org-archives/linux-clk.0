Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD96A3CE495
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 13:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347079; cv=none; b=aAKohKeQqobwjpf/ZeDa1Nit9bUDifNcZ/AbZoDD6sdctrraFTC8RWyL4/bRbIw0TDpoV2t47MhKryl3lBCpXzOeHaAJcAHfNo0sQU+teoovOyUxvOiGEhTIlnPZxrSlbrkefhkn4tXOJrH+2CY2eEsRF9rC+DMLvRN6zwM1+qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347079; c=relaxed/simple;
	bh=+qxk9YKyNyEiRkeW5Mgtu8HCNYz2EeeeSG35f/DmqEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p0YoFN9Vz/nqxdiL1TYu/EEkYeg4njvpMM4EJGmRRdWQQt3va/3u3/bDwR9O364J4WENYebGhPIxhiJyotXksHej+T3lJyyYcyPBspUYTjpJdb8koDigwMGzWO9XXSdbaVU1dZUuvKUj0jEl8S+u1utqW/pbzPk/Vj1HG1AqhfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fDn48dsJ; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fDn48dsJ"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7a4f9cf2b4eso65984927b3.3
        for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 06:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776347069; x=1776951869; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TpnkPSyCrrxqGvSDrOl9HhMQ28DTCCYBlLhEHVmZVf0=;
        b=fDn48dsJPQKBWfJCXLRzNLCQdvybuIC2gXn2uRFqAs5hAX4KrIUdsXcYV72VqJFgLY
         /nEjWzyCLmljGyR0SGhIWd6thkrMfJZQxzo+TZKHuEf7eN7QLlTTiv/L2bDHo6HgEcEt
         v1mkmw5ELq0W7hTbyA8QbFNPW5y7MAg9SdRPRP0mxqfAn8oW1Ec266rVOuTc4zN8ONOa
         LoFF9CAGUe8QPNBgP/qVpPpp2giALlc5XezBBsLWYHMprTFyuqM7BeNLgTRvGPNPbXBb
         /lwmdmKd/UFJtMjR3uWavjJyPFuYDsl4Gk/Z7Wea8QgEtHIFw8t4zp71YNKYrWfzedft
         C1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347069; x=1776951869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TpnkPSyCrrxqGvSDrOl9HhMQ28DTCCYBlLhEHVmZVf0=;
        b=fYl4MBzVPC0R8N66vee1GT+GoLS0dXMKyGID+M9FC5ipBB1W1P5v3BhytNJwYbuQbZ
         cOz7OVvReCcXz0iLPhE8CuYMq4KMsiHahFd/IbUagSj7ualU2lxWrFqorY9n6V1xYPZ8
         kL2fh63lQkFKCN7ADLe5K4qJLyvVgvTYN2+o/TdwbzFRanj/avw9XkHPU3eyBn5vKRwL
         udMvLS26S2XWECOE2bypvixC5nIeaXeVycV7b3ztTKuPZwqB7eVC9MZncxE2TEq9iTa8
         r5nDM8Dv3yUAbU/A/Zq3I5AFTIIHfft0FYNqVaxpnHefYRM10PChORWvu3Imx3R7omXv
         G2aQ==
X-Forwarded-Encrypted: i=1; AFNElJ8v9lqtRuKhx0qph9Yo2zetOYpflsMCb/Bwopth5xIlZwuxZ/TXu9kCR7ruUIj9yAUjXc5TLjT2Ni8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxObjinc0VjaaWp2UDpiVdHlQ2aCzaXunb4tfcJ+614V3Z0S+B3
	u8EI2FuEM6JxfH4GHnVy7NpBpkc+yr63JZ1S2QqPdGUYcgnLSlZiaQkW
X-Gm-Gg: AeBDievgeGQldlD1f7gnUImAUkY3ZdA6xWrUzjW7Mgr9mI9hEkZsN5E36J6vPrhKoat
	Djtsm+1Bo0hY7GDbny9p4ZHCIDB/SYRXg09l/RLTKtHa2m5viQ3m9txYZuWte3mI97d3ntCT7od
	fhab6Csz8gXCLvNNUbISYqiZWDnq9e1RZW6MY6E7l687qlwTJjp/Jc23KptVavT77go+/1UIWot
	+eeHBT0QPiyTXKB3lBPL9r1y1uUMpXg8OZmGlRvUN8lVQrCo9AoT6XTRa5EbqV2Tp9twR3jihWc
	pkz44HOatKcJdGciP57mHdz209bsQMuvdOYIvK+UySM9d16X2NzY7qjhF5nMTlKGxWxc8nLnMUS
	35S5ron2tph4xJ4hqKUyPYtZsLi6xaghPS/IBPGNpNnIGhKgZUeiHkhufNiqRyBhanu0e/aSMIu
	zbF9Q7NOKQw5IKkheq+87ScqEqQA==
X-Received: by 2002:a05:690c:6b01:b0:7b2:7dc9:35eb with SMTP id 00721157ae682-7b27dd88a12mr158996207b3.50.1776347069632;
        Thu, 16 Apr 2026 06:44:29 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b76931854esm23363737b3.37.2026.04.16.06.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:44:28 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 16 Apr 2026 16:43:52 +0300
Subject: [PATCH RFC 05/10] arm64: dts: qcom: msm8939-longcheer-l9100:
 Enable venus node
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-msm8939-venus-rfc-v1-5-a09fcf2c23df@gmail.com>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
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
2.53.0

