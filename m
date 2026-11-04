Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810846;
	b=cww57IIEsBKklUfCe7l/p4chomOp/phzFSEpt3+0NjryunOEAcBy27AjFzArkbi+hoAE
	 4N8dZOq1eIubnAx8en/dUGmN6v53H8j+Vn5ktQ8datMTqL+qMcrbeK8TbYpD06aI+QJn9
	 oR6iPVRDPBeX95A5UdP+bzeSd11yv6oiY/3NLjeUUaKge3DypNp3OMqOsgdgTiHZpDtcU
	 ZSz1EweGwWquub0mOPL3q11J6DlN68VjP+u/gvopqzir2pqE2mxkazFPZnvZsCnN7CHXP
	 h5sCsxHWZGyJ6qQhxZjzpN480w1y/Em2D6G4Gs44b2dsdsm9NSd3TE6aDGluuLpGm1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810846;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=zMbG6vrMcWe5nACzqEmNc6Lg/tRkWbgNePdHtBr1o4c=;
	b=lugpytTeQdLX2c5eWI82pdrK9t+9WixNOaTrpNIml7hT3O0WblUsG+zph+aRE5sZ66nG
	 uThmU6/ZKDCqL7krkM+2qbdgaR2S5uyJZ0sZwY3qr+NwPtht+Tn9aNXzbAu0LSZ92xkRB
	 jUxlqznSe4vY3z8lhFCXGuDDXcbKUSVSQfm7PaI9omyDYD68l2jx5FFadZOnvpwH2ybDv
	 bWdPJWy1BxqQ2DHeoA0hginPYW3hhbmnCO4C/X2+uZOserI5AhV/HguRnYkese87Qees7
	 Ys57/lMc7TFzRiLXBGen+Ym/b9kLSiMu951GVhZUZ0HxhcekeeT0icjw+kdrdgSuLfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bq1wPuid;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58872606D80D
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 16:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58872606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bq1wPuid
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a8cc11ac42so1103550c88.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 08:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793810845; x=1794415645; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zMbG6vrMcWe5nACzqEmNc6Lg/tRkWbgNePdHtBr1o4c=;
        b=bq1wPuidKb+BpFTqMAhm7/EWX8A0CldFXYzvw7TglvuSehTtA+Wv6rhY2jEAUupSPz
         8Y+6bq9xZ4N22LC/k/nHIU2VRG4ER3x4QhYoQCxWfRAiy/vR3PtZmIv2kgsjUAd8cusj
         swjHaOz2WNvfkpFbGw4/4xxxjoXXGnGZKtQp2GV2xxKRCEg8C550O7PCCGoUHdi+MqYB
         c0M9ArvTTm8LLIkCdho+PEOq6aqF2A6sUoxxZAZUY1J3Vy0xYJ3rBZ93IVmMGnceJbb7
         U7A+9TZZIJmWG75sp5+9VXfLb/Ll2bWz5tr7EoZ4xU7nWPjOf3caHWdaZTOVz/74+p5I
         GrPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810845; x=1794415645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zMbG6vrMcWe5nACzqEmNc6Lg/tRkWbgNePdHtBr1o4c=;
        b=DF+xZ99+TN++NFwoaOCWmj2B7xT7nBuwG8S5ysY3LgGLk/cFu05MXwPG8gvkJQuc9W
         ea330GIlkCl0d/ztNorJqJdy+GRlY5ZqxBOL3rehlFY78uDc9w/JLOpqCsomgct6FM37
         HPn1lDBadszbB1E6q1iyZHUv1mDusowtP0r1oZFe9pXQG7Z364WuF8uoytx0P+ejF9pV
         2uyEIG9LFOuJNBbCpZkLICMMBjwJ4z9bGu3NZOOZ6/9IriCZQHreo1gpf4iZJ3S1VZtO
         vNcXLJXJAjkQ6/PaHNqgvUsoFfyBcgMcqaRWdnEO9aI6BhN5OXWE6Nu1x7GAK9PR3Kki
         UOTw==
X-Forwarded-Encrypted: i=1; AKwUvBzRYHfECzuZyluhaYsKO8g5yrkbz6/25D0+TsIw/msax+kFyGHpvkgpH7pYMqsqEUk0Gv4Dnn56v0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7i7YoSTO0VA9n3kmyHVF3RAVXZuP+JvsCk4bEKhY2wyiTk+Fi
	dejlWnSbvkbGvyJDg8k1NDr+tbR3I7aw1eKB6l/fa+jh1QYfXWPs2TFs
X-Gm-Gg: AYBFou1xhRkeLlSzQzR2I5yeESk6O9KDdjWQlNVQ1jlV/v4Y0FvKxhT36/msaYMZnbI
	F5FJcMgPtfoC5YF9YJeO3FRZxHygoxQYmy+yi9knvkstLQfEhvNE+WmvK5PimCKUWYfW5jpJXs6
	xpOf9MTw54dN7baz1wH67CXVGz331tYsT6Hnd/LsXpt17u+VydLwuCQEGqNFax0SYVrC9Sfz1DO
	Fo5oYic35kGl7FG4ofldyO2BvipWto/C2/doqFh32/M1goA0uDDNu+WeX0fIs0t8jqdsl8ERQbI
	ky/UsrPinfZ8ShCVgjtwpUTppKg8a//GEEq8AGmLu6ofT3G1L8ZIRUWHVpSzD3jPcYIr/Ggzai1
	4aj0PZtFF/TKSjCwHg1P3EnE8s99ZBp8TGjt3ME9t0ewbwO1RElG2B9uxpWBGQiEKQsXr2nDyQ4
	vMPtL+apy8unb1tGwZH4Y0fL4DL0gU7a8N0qpgoY/K5KyS/aL2ylp3z+atNHh82m1OzRNZBu/Qw
	qKU1aVIOwOxTRxkcpprxXWxFhogqidR7+8g2FS4plLSHKfWiwR9pc4Rt44KnNAU/sLRxVuD/klG
	BzIezArIGnDsFLKWua0qFWLd77Q6le13mNAd9sybru0hFCvZUFj2IygxUq7QGjTtsCxkJl9cwzc
	gWjA3UAc=
X-Received: by 2002:a05:7023:90b:b0:14c:8461:b3ef with SMTP id a92af1059eb24-1ac5e6f5132mr31506193c88.24.1793810845290;
        Wed, 04 Nov 2026 08:47:25 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.207.207])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c57430sm10839666c88.18.2026.11.04.08.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:47:24 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Wed, 04 Nov 2026 16:46:36 +0000
Subject: [PATCH v13 4/8] dt-bindings: thermal: lmh: Document SM7250 LMh
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-master-v13-4-355b65c6f764@gmail.com>
References: <20261104-master-v13-0-355b65c6f764@gmail.com>
In-Reply-To: <20261104-master-v13-0-355b65c6f764@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793810796; l=744;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=J3JLI+Blhkxqdoc8xLtRIhgDC8KARWHgIPjkApYQ3sY=;
 b=kBVXuJVpl65Jqkx4GULbJr59C4L4KJhdnwRlb2jZNK7mV/HoJ5fAdvNJsr2e5rCRPli2NX6K3
 QcEZXucPf4MDzauU/SeHXl/IE+5KsUbsPsBPFVOGpVI3IJdTX0hYBET
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the LMh compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/thermal/qcom-lmh.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
index ce72347e2..e1d5cb871 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - qcom,sc8180x-lmh
           - qcom,sdm845-lmh
+          - qcom,sm7250-lmh
           - qcom,sm8150-lmh
       - items:
           - const: qcom,sdm670-lmh

-- 
2.43.0

