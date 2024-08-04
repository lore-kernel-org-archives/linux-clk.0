Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC8639AFD
	for <linux-clk@vger.kernel.org>; Sun,  4 Aug 2024 05:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722750036; cv=none; b=oR7vlH05hQYol8cqlhXeKFETyFr/gZzlWD7lh5lEVcOw+HkOmTWg0nHP4qMkC9qG70Vk+eeSD7dABh0sqjsUQ5zNBgsSTfNS0eL7bByJ9OVi6xAFvCIITTCAwthuMTBcKbruW/JNCImbvqE1DazOacy8boTASG1pvMgYS3A7r7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722750036; c=relaxed/simple;
	bh=+6qOXA/nRYvF+LJ3fyjiDmQq3/m44DEzHQz0B5kY010=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lQpYcb+8qzqH+mJvN9vKvAHWjye6HmucDpAvNuf38+SZGX+bGKRGgSN7Q842pOh8FkN71SmM6Fg4Hh52o6FNMcCNrzd2B+ikrBL3+QcwfGM0b343CoBNFgWOB0/R+iHqKM8FUNwEziHQltNSid32kBA7PNa4QPtXCsAjY5R51QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WIjCvwAU; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WIjCvwAU"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a7ad02501c3so289206466b.2
        for <linux-clk@vger.kernel.org>; Sat, 03 Aug 2024 22:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722750033; x=1723354833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jZj9/52rwWNE6aCx1N5+a52yjuW6g5rJuFXIxcVgEH4=;
        b=WIjCvwAUXg4T8sEHbmYQJY3U0g+td/WfLbRVrkllLQfgHB9/UpA8fZp+lbJoyZDQEA
         350lK2myd+trsWAK0DXrtRVuwpwSdiFdgY4HDFnxIChW/hwx3BXKjo1bziAztgM8wabL
         EAZpJgpUgZ+S5Y/99v69jxAK/J/Q6ltQ/cw/Nfq1S9b9EJ1qf7Wl6rGEj1mwikAYRM16
         1UVwf0iw0JdAMn1dXzQwpjNPIAE23PrdYkzLtjqdCDnOij/W8ntTaiLz3+FksIx64vsG
         1LRcq5b3RKz1CmPc4d5J925r7ozbVpMsWP9TXYq6Z57g9eKqveke0/kipbJw5mCijF1V
         /oMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722750033; x=1723354833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jZj9/52rwWNE6aCx1N5+a52yjuW6g5rJuFXIxcVgEH4=;
        b=kFKI8FbmYMQxmMekgJkv2a49w67WkNH4Lhr/RIZYWYEOD3vpUzjeG2LBNw8zBYEWmm
         i+20T6Df84XR/akuA2jSzNLFW9/X2x47YxXrEzDsoAl0qaHJBZ3ibx+wlbJ8IXmN+d1S
         Uz5xAbvfid5h0jFh4Fb6Tm40K+34RyaVBwSIuf2TGaEQRBAkMiG+tW9Ry48D/lUNjg1w
         7fxGwxcxD1TzuZKb509W17mW8QX473V6c9MqriXIRMzH79naf+TkUtdsgxqLgrtWjuHD
         OEI5oq7yrPsv+TPoDAdZL38I0bjXJAGBe5LM4luxq/5rq/CL0ZtITNj0SoXjsbvHV0GU
         bOCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLfUAHTLGY7zT9/QxTQfUgyW0OiJ2cZQVny5jFa9PQKYDBPgWKo1kd2JWyOt5nDsS4lP35I2OKK5LgJducQNfrSy9HuDfYNZEC
X-Gm-Message-State: AOJu0Yy9VJ2W3IMbyGFzf6hlQVvAQ8hok70f+A6wlE1Ta3UUbz0OrApW
	+8sHf45aI5QezUPkArd1SqYM0ejo0ou6HkwQdU04t1HzUgcbqsN5cCzjUPUthXU=
X-Google-Smtp-Source: AGHT+IHbci0hVaQgSOMpebGYXLXoRbSJAPdeMpWLhfgxvxEZR+HSx4w/E5jZTEcJ0B5zpBDG5TQSnw==
X-Received: by 2002:a17:907:968b:b0:a7d:c9c6:a692 with SMTP id a640c23a62f3a-a7dc9c6a8a1mr583045066b.51.1722750033049;
        Sat, 03 Aug 2024 22:40:33 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9bc3bd7sm292248466b.34.2024.08.03.22.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Aug 2024 22:40:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 04 Aug 2024 08:40:13 +0300
Subject: [PATCH 09/11] arm64: dts: qcom: sm8350: add MDSS registers
 interconnect
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240804-sm8350-fixes-v1-9-1149dd8399fe@linaro.org>
References: <20240804-sm8350-fixes-v1-0-1149dd8399fe@linaro.org>
In-Reply-To: <20240804-sm8350-fixes-v1-0-1149dd8399fe@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jonathan Marek <jonathan@marek.ca>, 
 Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Georgi Djakov <djakov@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mike Tipton <quic_mdtipton@quicinc.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1178;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=+6qOXA/nRYvF+LJ3fyjiDmQq3/m44DEzHQz0B5kY010=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmrxQ/EZqpfORfNpqmB+gfbID37iTSi1xyvFhc8
 yGcwAyMPX6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZq8UPwAKCRCLPIo+Aiko
 1fEVB/4poQ3kFh5IcUQVcpD9WN/E8hoOPvW5xikRPjmU3YFD3FWnNBXl0NKC2mQ7WS3PnupHux4
 FvdTXUXKBbSus3+FQxXGfy1KvXfiw8Rfq+bBZ1fSt//qdVQNygZHM/LAU4xRdOcd0+0YshgpLif
 r0DdSq9HK0mJds3+Utjv76o8LBIV0Vzu5vPJe/TAp8BdLUk/GneFDKIGgPfPx4Lvj2JAd/N/Jfm
 uj2wWVPXuNxiDTBUBJGcAVBivZkGTIFe0kMQBzzL3kS0L6oPgcGjU2goCBY29+xl6qt+IoIIgnv
 qFb7CLYVIuCQMxxpLvagpIAeRD5Gpp/pQ9wrZrumALkiMHSh
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Aside from the MDSS<->MEM interconnect, display devices have separate
interconnect for register access. Add this interconnect to the display
node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 38ee0850c335..27f36e6366df 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2490,8 +2490,12 @@ mdss: display-subsystem@ae00000 {
 			reg-names = "mdss";
 
 			interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>,
-					<&mmss_noc MASTER_MDP1 0 &mc_virt SLAVE_EBI1 0>;
-			interconnect-names = "mdp0-mem", "mdp1-mem";
+					<&mmss_noc MASTER_MDP1 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "mdp0-mem",
+					     "mdp1-mem",
+					     "cpu-cfg";
 
 			power-domains = <&dispcc MDSS_GDSC>;
 			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;

-- 
2.39.2

