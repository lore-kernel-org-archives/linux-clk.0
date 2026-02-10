Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AE632E72F
	for <linux-clk@vger.kernel.org>; Tue, 10 Feb 2026 19:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770752016; cv=none; b=H6/LjrVjTvtuVaCKsmdlvE1RIyAXwaI3OYutefalj+HB1Z/i9xtJh3frTnQpvrOj8PM9Q3wToeU4k60MhnNaJ10ccgQLxAlDadXJoRzAQ2Rjda4+ZaaridGWTJ1zZK/ZnfuvmoIAxQyF1n7I8fX0lOH1BJv+HjOwOcYTLdoI+5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770752016; c=relaxed/simple;
	bh=VQdP4rZ9h3J0EhLSTARmuUSjS4BKTN3XyhFq/8TrgLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UqsBBCMMUUYFpP3/HO0+8mLC+q+plWv8VTJ6d6Y5ok36CrtfV3rDV9Kx7XKXJj4PDj+HfDDLQ72m51TKIkBqJne8h/MUNrt/v5WXqy5hO6PiG5Fuzl7NMapXXuXX9jP/zfoZzAUCYYNMI/5xJfFurEsA8tevt8G7OFyA9cnOCdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J0U815zw; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J0U815zw"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-482f2599980so13361185e9.0
        for <linux-clk@vger.kernel.org>; Tue, 10 Feb 2026 11:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770752013; x=1771356813; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xk71nUW+8tIk68OOiZ1p6pMbhgPda0w/fD/dlKzEMWk=;
        b=J0U815zwBIXDmCdVErACvPUDObfUGZ8zxx98hRz536JVdXHPvepHwBiejImrNRcOYk
         NNzSRTG8wtkXxxuEFBldwX2dnzqr3PhIaUK/tB8vkoUhnSlus/cHb88QlNmFhqP7zwBG
         15mEl9c20Z5oSIW4S5DANHAkc/v5EwLD3dCSrMOcYqKk6wNps3fdLSTrgrcIowDXXlmK
         B76vZwFG5qsT5YMZK6rl1ep2u+MeAvU8oPxny0Rk+r9yCiok9UdmV6WRQysJu9KvBalf
         HgKSsx6z9hNBU837i2Z70xBm2HDoWbTSOZxINmKt5+q1sRkTU6sI2UNggcWp1YKvpPaU
         64aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770752013; x=1771356813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xk71nUW+8tIk68OOiZ1p6pMbhgPda0w/fD/dlKzEMWk=;
        b=sfQq++7RkPCY+ynDtPBgWsydEGJM1M6MQU+7mH+mPYxVJUt67DZi4wtfJE93PN0mTr
         VlB0SxhsW/H4hejWKFR3ewC68uNIoP5hRtfHAEvpOFxrPKXrtDBbAhsJc2QAZhgS/+cB
         bLuPQ0Gm1qsClKrlLhRt+hq+8aPunwsZru3wAiz6CtiTy7dW6QXrrfvWx+iSZxa8hZIK
         sXPzOC9ipIi5gaEYfNu3dU4SIme8R6GM/tsUWFpMLEE6q2pt4+lQfUQgR+JtqMa04dyM
         f9La4aVy/JlkOL4y6nT0KDw+/za/eyKnZebXF4wjRMKQjNF7JUTAdmLOmNQleAq51nQS
         d9gA==
X-Gm-Message-State: AOJu0Yw0sYvoygBU639bHZ7EW+6g/+oDeajzZ8RIlzZfboDRjXKy/T1U
	GMpPd1h0QGXMijSGh7N4DEMCgsbhBy/pMfdYG2+Om7pTFqxkdOglurNF
X-Gm-Gg: AZuq6aKspGyWlclnGvzbY9cEH675glTvwkT8zR0x+3tzPikI3UBEo748Zp1lFHqZdgR
	cwZlhhBU8FiR6i55e+fMzYgbLjeYCob6N9GOE1//DqZhd4QHH+0eIFbu/6rtBt1buhKSu6+iGXi
	+rwWC7CK3QDJhhA6DVXqCmaOO/CbrSphlBC9AeqxcE6tMnxDyxNYrqvJRXJOEfmMBMYdgProtNl
	XnMvUffOI9yz9ciPyRAQ1QiLokw93xobkqO2ksV2MgfDQts1KKATdMEk6mjnt8eJbq7EpOVyyil
	1wtaf0Z0Z+5Gh42Ml+w/yaP0qvaEHoCyoMdAJMKyYyxy2FvPOK2Wheg1eJC4NjQL8l3juQWNXd2
	R9f4gjUI/DSAso5Uhsmjpho/FfiXS4aCSwLiHHL2/d+H+vfBlBVmJPNc5lh0dKfO0wk7N0Cq9L0
	ptvr3ag1FxaSM/62SyEkqBbQNl9pYT99TwhsqXBHZbJ4t/y9j6
X-Received: by 2002:a05:600c:3b23:b0:480:1e92:dc65 with SMTP id 5b1f17b1804b1-4832022b9fcmr255795265e9.31.1770752013268;
        Tue, 10 Feb 2026 11:33:33 -0800 (PST)
Received: from localhost (39.31.66.37.rev.sfr.net. [37.66.31.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376d3a32basm19835831f8f.14.2026.02.10.11.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 11:33:32 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 10 Feb 2026 20:32:54 +0100
Subject: [PATCH v9 3/3] arm64: dts: st: set RCC as an access-controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260210-b4-rcc-upstream-v9-3-17ca1db7613f@gmail.com>
References: <20260210-b4-rcc-upstream-v9-0-17ca1db7613f@gmail.com>
In-Reply-To: <20260210-b4-rcc-upstream-v9-0-17ca1db7613f@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-47773

From: Clément Le Goffic <clement.legoffic@foss.st.com>

RCC now implements firewall access ops to check the access to
resources. Allow client nodes to query the RCC with one firewall ID.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 1 +
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 88e214d395ab..e283c760d94f 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -776,6 +776,7 @@ rcc: clock-controller@44200000 {
 			reg = <0x44200000 0x10000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			#access-controller-cells = <1>;
 			clocks = <&scmi_clk CK_SCMI_HSE>,
 				<&scmi_clk CK_SCMI_HSI>,
 				<&scmi_clk CK_SCMI_MSI>,
diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index a8e6e0f77b83..89e0b8f2fbf9 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1761,6 +1761,7 @@ rcc: clock-controller@44200000 {
 			reg = <0x44200000 0x10000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			#access-controller-cells = <1>;
 			clocks = <&scmi_clk CK_SCMI_HSE>,
 				<&scmi_clk CK_SCMI_HSI>,
 				<&scmi_clk CK_SCMI_MSI>,

-- 
2.53.0

