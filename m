Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D793248F6A
	for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 14:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227426; cv=none; b=s4FJxTw/IQfv8B1FphG/s5n43lOTVsHADPFxlNvOP8P7NKMq1kpSUEDb6awYTbOvuxvS4OCeyKCSbpdFRmS+YJumnq71UwvuAZV2OmTnWEmCppGtmXYv2Z15TIQbxzh2fgcAntcH4bxRw7lk/2OIG4jRtSfV+u7i2oqUKd1ZtPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227426; c=relaxed/simple;
	bh=7b3/8jSg0hsC1cvup2K50pItaQVXTR6L3Z1yqQMb+TM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VSoqYYccnzunjWwukZ0ju0S11kWJ/fiFX7KHCVGmnbsIBk5F+OfU8KLKQ28n+nT7QlSGOn95KZ5kvOy/szG0Y+CdGkkhy8y0qZfBnLd7pAbd1rjWBDHhXqSuKtKt1L0mvOUQUQuQIaD7SGEaghqC1r4IT3xIArd7RnekdtWBrQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oCAdgrLa; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oCAdgrLa"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-430fbb6012bso5188634f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 06:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768227424; x=1768832224; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Wlf+Ha8H0Dh4LV6gM62c/dK5IzNxEQc6+77JBG+adg=;
        b=oCAdgrLawZ7h2K2tLHYggVBZuYEXN3A2hDOTmeM3BDofvjn2bFJTL281xilwUAVH7Y
         CKBTOvWr568OItfZQkCvELO5QNNN3vgO8EZRHd5/KiUjT+LmLhb3T8uckzTeLW9vaB4Q
         y42zRbiZ7e8aNCWn7hmw0nsKoVOTxyxhHjrNDJf1RSLfwfkAA6qgKnjPGTDwYKh7iPID
         B47Q1of1p38d6j8pO23CnxRKzsfCkmZE893GumGWshrHfOYN4Eih4eXwmwZW1hJJI/oV
         BrVoWzePSqIw3sYebam6fUzwkDyqCzn8dsptZJDfVLViPFeFy5PGHOQzTZm5sCs25jT8
         T6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768227424; x=1768832224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0Wlf+Ha8H0Dh4LV6gM62c/dK5IzNxEQc6+77JBG+adg=;
        b=B/MoF+VPQCPOeZcihaxTF9SOSKpObVmt/5pUfXs2YxSPoJvL7Mf9wxsVRYpuBJi7NO
         cWxu6IiTHl5Nnx1OhbRJL+xvXb4yxkSt44y/W2KmXKkSrDiAkC8S1UJ041O5tAS8xfi0
         aZhfapK9Hz1zXbIdPJmIZUCHN22O16KyC7TSld5npGm2nMYlIuGHBcO3YAJAY7bi1L1t
         jwl2Wu6ouN1uuEGpRQ+GTFmqgtPY0kq8ObchC6P2UlD+StNf48ltAz5oa0aZlb537G2Y
         OPlXMntdjiczSwQQvOlrQyA30TcIwwdQYcn+6vLzB5qtOb+M7nUyy3B1GuJf4PQAY3VA
         gFRA==
X-Forwarded-Encrypted: i=1; AJvYcCUqfzNxHt2BPCok1+5uEnfUZTYCWVqYeCCFht+HiGoyhRXodvux9+fI1L/vScomQzpBE5rkHxourM4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGEjFVV01mbkDwbaJ2VakGbLlXhiUgeaQ1ST7fiXZelFPwYFkm
	8SvvFpqumGXkEKRhpeJulrtYvJ94SHdg9U3rK6jPF1kSKlXMvCnQap4bNrNjYbifrIo=
X-Gm-Gg: AY/fxX5MPKNZfynyysHn0GgJGHq8nLScz1IXSUj0SGBOKhZeimrafHnU63n/+L+5LRu
	zLMuH2xhdOBNgE9LWx9ThE4UkXr/UWdSeDF5Icp+VMPotDn5SAskKSp49iR1LUP08bh3ByovBmf
	i6Muxgd/0HnwjRH+Myd/7aUs9ZgUjdTenPoWCRglEv2FajXVTCY0FK5Te4k1lJoXx7SKJZ+duFf
	N2POoKMtg9H1T+ob6bn7FRdg5JCENCdJamXN6oYStW2I9rCFVKolgsvTWhXghSjx+IMlQU3Kfnk
	DVaM+CtsfWY+CzwM2fq1XP2N73jjBaxVs79r0WOnAEHMBqe+KUivAVL3WhtjcpA52Xdbmq04LVj
	yDRkNEF56+FOwOtY/PKdlfdFGYnIWJ1OlQd1879H0/c8UuGlb7p40ZQeE83KhOBhYl9s3FE7Hv3
	RZmOIWXarabyocccrbrEYApTm10I61vhH/s2Dz+EvTQx4Y8pF7zGWAhSk=
X-Google-Smtp-Source: AGHT+IFVR/vjNEYv/FQXYCJiVRI4X2CDCCWrmtGHGFSC/ecZuL4EN6E/j1yU9pK/fy3xfqoqCbgqag==
X-Received: by 2002:a5d:64c8:0:b0:431:32f:3140 with SMTP id ffacd0b85a97d-432c376107dmr21526633f8f.12.1768227423668;
        Mon, 12 Jan 2026 06:17:03 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:3122:c601:4c43:39e0:348c:a72e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5dfa07sm38705096f8f.25.2026.01.12.06.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:17:02 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 12 Jan 2026 14:16:50 +0000
Subject: [PATCH v2 3/5] dt-bindings: samsung: exynos-sysreg: add gs101 dpu
 compatible
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-dpu-clocks-v2-3-bd00903fdeb9@linaro.org>
References: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
In-Reply-To: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 kernel-team@android.com, Will McVicker <willmcvicker@google.com>, 
 Juan Yescas <jyescas@google.com>, Doug Anderson <dianders@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1261;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=7b3/8jSg0hsC1cvup2K50pItaQVXTR6L3Z1yqQMb+TM=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpZQJYZl0VlRqcl5YypTCIBUnftAv7BAYLAp+2v
 WvmYN1nP96JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaWUCWAAKCRDO6LjWAjRy
 uoVKD/9pWR+8ACeFXCJ77W/dlDcR3KY7CwDcsHk0tEOat5gl2BHNChqYlwaNGUIKJhp0vH6IJU7
 H0vPWfPXA7Pr1vLC2NEjfgr87dc+Mdk9lCD9inf0YI25x3F3JEvO52I5cUrnKFuGxeEebzdZGKE
 IPv0+1EgyCG1Z7RQKvGmuEuezyN5u4EKRA3HYgyqFfqWB3RWmJJFGqCIY1Do8Mlsj7Tz8TRmJHA
 Ib9/CBb3zMfJwAGZWPvigrdmIwMcvfNgvaxog+sALJ12cRzPBLhQGkue1ujkOus6jE97sB4pCld
 8IjAPVCl+zmLq5wh+7AwiiWG16QBqhCiNO/KN95F2FPzCmMXI8X9qVjNfiSxKsWLLfh7BG/nbd6
 brrgVG5p+21KcYmIkfZx9WEHMRzKnRLdLrVBHQ8TTUgM1O8XWhXMBwzbjSKdHxysi8YWq1IGavD
 PvWnD920tNRVr4jx0y4pObKTz470tv/OFM/kzQvZjCxIHqB+oydxJiY/8O0+KM+eye8ZGhdX1+F
 f9WT2tP8wDRfsyIupxkfka+MFy3TUk1FAO8kuxv6uofZsswo88mCXarIE+4TORhRZ9k7QBngiJ+
 vIU8Mcu2BBsBE9iREBDssfMnQQZP619lhREWf3d1e5Udnn76sm2mduGGEhXlcNUP90f+Ayp9j7C
 jYVqs9eWQyaJaJQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Add dedicated compatibles for gs101 dpu sysreg controllers to the
documentation.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index 5e1e155510b3b1137d95b87a1bade36c814eec4f..9c63dbcd4d77f930b916087b8008c7f9888a56f5 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -15,6 +15,7 @@ properties:
       - items:
           - enum:
               - google,gs101-apm-sysreg
+              - google,gs101-dpu-sysreg
               - google,gs101-hsi0-sysreg
               - google,gs101-hsi2-sysreg
               - google,gs101-misc-sysreg
@@ -92,6 +93,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - google,gs101-dpu-sysreg
               - google,gs101-hsi0-sysreg
               - google,gs101-hsi2-sysreg
               - google,gs101-misc-sysreg

-- 
2.52.0.457.g6b5491de43-goog

