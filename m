Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113F9352008
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 14:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014528; cv=none; b=Ap8iEFpHebcVfc4icbOtRfjg1nrBNuKQFo10qWZ6W7aWDp1Sd+gSROWpNMRSznPaS0ni5ihN+6DV17SfJtHyPw2I5sZnD+B9Q/icN1jO4b1ncRpOm/TmQXmPhl8wvvttJ3eGzwkcCel/A2EZK5g2Y6uH5s6zYSf12RWtYvalMzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014528; c=relaxed/simple;
	bh=lFg+F1HUzAIVKFEHpDSN0ieuO1JF1dx9VVjzKFZEWoU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qxy0gNZ1qu2sYSIgci8mfV/U0krtchcH8Fgpk+AXBGIpNq/mh/tjFFgegn9tf+1+XFkJl0+Kp42pjF5BrdNtSxsXopcLJf239/gyZErON8zTLS1ywF6rsnPX3vTwElTVBciQkxLIUv7Yl3lNZ896ds7Yw2J58nTH+7BpuQrynkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OM+IelwK; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OM+IelwK"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b3637b90so48337625e9.3
        for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 07:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781014525; x=1781619325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eVZsM7CRVUQ8fV8QGfF8shrTWLN8ATYUgZug9STXKt8=;
        b=OM+IelwKtEVUQ7qjgFibv/dX7RLYiRtoBU24GGNrdfchk1TPNSkc9SG3G14yyR4wfJ
         a3Lj1Nk5Xcw8phNTHUSHIOYlukAxHgDdg2w8gcTDssNCaMluT+GVPez2JRZ0T1M2+9aB
         s6e8YG4cSD209tqmlUt+UFsm9IvciLmKJLNwSjvfDovtwKzmbAhhYS6u9kcAs6BWL2pg
         Vxfzm9Wd3KTXcNdNlTliC8qY1WDbcUYi2oyIhMmeckRxfrTVyDp3SDfV62og30lEs1Zb
         lku6Ahv5hA8IarU/AJD0H0Z/Dkwi2O4DcBV1/kOexKlZM1DY6k4Z7sEqsuTyNSxAVluX
         d4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014525; x=1781619325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eVZsM7CRVUQ8fV8QGfF8shrTWLN8ATYUgZug9STXKt8=;
        b=fGcH47bLCHJI8a3WcJxgXGBgGE8wVbZZZuHuU5RalOH0BZdeTC/Tq/xtsFOLVw0w1t
         bkDU2lJ1fnRGuENAfRfM+9paqF5TlXzpjmxlRJ2WJz93uhPwC4d1DhN4arP7ViXlQiV9
         8o/4fmlE3CJOx8CIgv/DoTGtf8TCVQbOA+xUDog6Br3f7aQvnytQ+OsgoUJSwguzPfNW
         p93u/CLXu+Yl0LqBKKQodViEBy/qk/seFO5KFBOofpQSNoiCDARmIGQdQ1LiMp2c5ohu
         wsjonMi4wCTWSqn4AgVagP8cUAYiXSH8qOqb2IpMu+XtQqCbyZUSI0s/1/s6vuD+6MoV
         TD0Q==
X-Forwarded-Encrypted: i=1; AFNElJ9LpNKGZbiA/7HU5OlVNcj+PT8gPn5M7bpx0nMxgDQ5YVC1oPfiY9Z3b8MyO4TtoHP65o1aE2+t5R4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIHUSJp34A0qRP80loUEY4enlrEL8ISwWXVjQjXyz4VjQmNb+B
	uO+IwlZzx4pwwP7vshlfLmrFyzgkcCUsL8IdNzlu7aDqK8M9XSA6s76jofv2okZ4nu8=
X-Gm-Gg: Acq92OE+eqY6vSrCSU7lRk5XmkD5KM1eRBq0n60xYK0rSnUQ79EWCMeRexhFufBZZko
	L+4Xg3C2+d2fqbVPl6GAl+4pBn/pRyx/PTgANyYu8cIS1pfZUSrkOiWGhUzZn3Qe75T2s93QMgn
	/0XTJGtb1rZXPerYr8ifRWOX2UiN7kXIyYFhZE7sBsTWbTuXorkbZ2VzRvht5TNxgfFi+eKzr8D
	O1zcpGqRf/097lK23NWiMIh7MXAXM+zvTUGfxGayv1Sp8B3mcYE7TsoKUyppIaQsC+EpfQddaKP
	rchNaj6jnDTgzIsmyqjVcpcWpbuY9YuodFTgaz2HHpqRlhWB41LFfGkfsLLVrpe/84AjJjW6NHA
	S6/3funjCZatOfLZ5jsnse9R8eOSJFR8yanScmPUEoTsGIgAhZGIRKyCVd3wWHoEeXmLM+kA+ki
	+tJdAmTqzwlIHUojJVh0mO0bUtuzq5icOLrdjWVWRoM1DD4RQ=
X-Received: by 2002:a05:600c:8712:b0:490:958f:2a5c with SMTP id 5b1f17b1804b1-490c25f17dfmr361700555e9.17.1781014525495;
        Tue, 09 Jun 2026 07:15:25 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:59bf:7aa6:43c0:c58b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm321450495e9.2.2026.06.09.07.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:15:25 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 09 Jun 2026 16:14:45 +0200
Subject: [PATCH 09/12] dt-bindings: clock: qcom: gcc-mdm9607: Drop
 incorrect clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-qcom-clk-mdm9607-fixes-v1-9-5e9717faf842@linaro.org>
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2

From: Stephan Gerhold <stephan@gerhold.net>

These clocks do not seem to exist, they have no consumers and
reading/writing to the registers fails. Drop them from the bindings.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 include/dt-bindings/clock/qcom,gcc-mdm9607.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/dt-bindings/clock/qcom,gcc-mdm9607.h b/include/dt-bindings/clock/qcom,gcc-mdm9607.h
index fe4c15be3781..23d15179107d 100644
--- a/include/dt-bindings/clock/qcom,gcc-mdm9607.h
+++ b/include/dt-bindings/clock/qcom,gcc-mdm9607.h
@@ -13,7 +13,6 @@
 #define GPLL2							4
 #define GPLL2_EARLY						5
 #define PCNOC_BFDCD_CLK_SRC				6
-#define SYSTEM_NOC_BFDCD_CLK_SRC		7
 #define GCC_SMMU_CFG_CLK				8
 #define APSS_AHB_CLK_SRC				9
 #define GCC_QDSS_DAP_CLK				10
@@ -38,7 +37,6 @@
 #define PDM2_CLK_SRC					29
 #define SDCC1_APPS_CLK_SRC				30
 #define SDCC2_APPS_CLK_SRC				31
-#define APSS_TCU_CLK_SRC				32
 #define USB_HS_SYSTEM_CLK_SRC			33
 #define GCC_BLSP1_AHB_CLK				34
 #define GCC_BLSP1_SLEEP_CLK				35

-- 
2.54.0

