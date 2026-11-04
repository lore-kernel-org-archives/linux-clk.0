Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810865;
	b=NSQO/+PYOGGTD0HJO3bfT2s6WrXiWtyAUg9VTjEPtTf0HyAv9cwjargo15dRF66oJUM3
	 btlX2XdvtxPNfm8mVaRct5nXiYlkNuOQRpdhx4bvwLytAAVtIil+Lh4KKj+4key4Nw0z9
	 yLcGfthErTZvdP5ptDwOeojhhDDwDP79pZcqQ2RmS7P0i6mc48sVnTMrKa3rVjXUErjcu
	 7gSBHutDIX427/ohJQdC1S5kUHzeA/9yZu61L6NZlKmAupvHGZxeC4HMDPa13a2D3kr4C
	 0cdMs35w8iY1nfg5DxNXc9sCevaThq6YWBbdFpxsOEvLPfsqTDBZ5Xr0tfMgQS4irLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=U4fFdtJNvcZ6y6D1x1v24LO+4CMQIoUBaMtD1ZPuCLk=;
	b=dRoPBZFrGGemc1b/DYSWA5hHbUzJVju/HpofNY7sCc0YIfDkCR57/Qg9RxiMcWvbxnXM
	 Nd1ExLrjBRTI4j6Rxd0wlv6ZOCAoBoteq5JboRMTah5u46dbdv3XPoNJZOWKhrbAfyG2W
	 DhWIXqOBtdsJcLpj9CC3TFjQq9CyBhlZm9QeO8DFHZpERn2YGxGiiErOoAeWPA0cMv+xK
	 ZKlvGwX+OYHUIjNPWFZvVUVwV/z+rS4IN1+oOTBQ8t62ArDOY7dQiDfhhjmAdFFgpYej+
	 rF8aJviFxFMtkYGaQXg/3tAqyGWMhPynygfbKLIqMM48l6feOJZ3UqG4RgVf22eD04Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oDKTeHu9;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304A86082BF3
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 16:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 304A86082BF3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oDKTeHu9
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-170135e43c7so1402700c88.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 08:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793810864; x=1794415664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U4fFdtJNvcZ6y6D1x1v24LO+4CMQIoUBaMtD1ZPuCLk=;
        b=oDKTeHu9/D7LEgoLtX2Id9RcRVT+1ag0PVlRkJn6LRUJ+tPK8qy9UNhH2k58LkNP7E
         qwgy6EaLkLHJ5BwA5IvnkC7NrLSYc+VeBrciVkYShA1mSofVv9xqO2P4ZLrlUdVgesFb
         U4oV45ybr0Ly2k8X2vFleAjnX6CyM7N/Xgxg+9o+QTkozkOGqbyFkhZTJC0C66h8lVn3
         Ngdhe2KDalL8T+jNBgDzqtZqBlnUPLVnkYXrCHkELW7VjmOHykwjTSDbPWfceaQ8znz9
         Hm8qjdk7tKhA0eI3M5t6XXN9tlH8Ir7rgJs6gdNaxOal2rgWZbfX415OgUxvpsc1Yu39
         sfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810864; x=1794415664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U4fFdtJNvcZ6y6D1x1v24LO+4CMQIoUBaMtD1ZPuCLk=;
        b=vvePrbGwCQruYVPMQURq7EbLQrqNU0tlgw66T04lT+HBfOAqzJgqTpRlcLNkJ2E8GN
         DcIH5xJuVa5pej+gj/JreqIwTXGJotE1Spaj1jv89+7mW7vXe6sJdx8hLZlsPWeU+OQN
         qNcDQhjWai/3CqttuYnltc6/frUVSgYM8W2NdZSEFkprStkoLtxlHoq44LbHgWL/335F
         2GjAT2ohPU8iHhCmq1atdlZVCotXY7P2I2wKk4PohgG20wiNlcotR80GdoLBqdmI5TOy
         gfFUMyCNYUONSYxG9MyEJ3plRXL+mhatKjcFuDDmOiVWZdJOHXXYWK1yzmk0cX4HwvSl
         QTAA==
X-Forwarded-Encrypted: i=1; AKwUvBwIjHYiSHCsgTRTRgns/K3uxVgIOHIvL94zwU0ZtR8guj5GJZM/+7XUc+NNEqxU2sDG1E8nNSz5UL0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oFneY/ChL6+PyEi0Jtw7XvnSQ3XgLySF85jtEtO9hTDT4nCHC
	AFCtjlZVUDLNo6DvBw6ZRJUKWFrN7EU10xHf9IeHRINhHAhxq9oqY79j
X-Gm-Gg: AYBFou1AQoC7tcP72CM3WshQW76KpylHY2UI52bY+9X6U01QmgeGODCXhzxb4lXXAhV
	L0SvE1dorfsFhgSwDQ2voIkvR6ngqn3lvzrQnMkOBnIqtt1JWU+gCfSMmBH/fQdPbFNVVtEITnP
	JLBDn5Bw36udNwRq2aDdEdRBYHAGbj5zYHeVeIS2fzvk01U9uEfqeP5nQroGy86dN40VKHp6VIX
	GKWGIKuzxaL2BYjyhrFdZorbkfQuDRpuoZMOWxbfYmbqsWsr6ntZusa5FaNtxuZUG1pR4xit+Bs
	tTi1FCIu13mZXklcX8Rz9oN86UCMM13Gc22bWGEXEjQBZpRUB0GFGxcEZc+muMbTg3/a1mQPRW6
	Im+w5Dk8Z/nXlXgrJ1ONuWpL6G6SXHvz6PbjQIHYbhseOf+NlZPMiIogsd5CdjF79tj8HQjrqdD
	LlNzImSyd8gyWbTsYA9GXZv/OCgvphfe7+U6fGw4XPORFXw1HMdewPbtpRNpeEwhREs/802nzzl
	68NVCJizM9xrKS28edkgXe+v3sYPLhKQo4w6QMXQLF869jYRIpzC3e16D7R2kZmxcObGXOtNfCP
	+Qj6roDP4ecfAfYI3Zv7sESgXmvMopGdCMXqtUssurn7At2ECc4TQ16oNgyWrg/ECdL2xuSYNgP
	j5B1Vjpw=
X-Received: by 2002:a05:7022:418a:b0:195:e4b9:d326 with SMTP id a92af1059eb24-1ac5b9cb638mr35445301c88.12.1793810863974;
        Wed, 04 Nov 2026 08:47:43 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.207.207])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c57430sm10839666c88.18.2026.11.04.08.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:47:43 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Wed, 04 Nov 2026 16:46:38 +0000
Subject: [PATCH v13 6/8] dt-bindings: firmware: qcom,scm: Document SM7250
 SCM
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
Message-Id: <20261104-master-v13-6-355b65c6f764@gmail.com>
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
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793810796; l=838;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=n/5l0LzNHQkrbMmziTZYOIF2FEcc8PMKPnj4oscjta0=;
 b=Sm+u4EHvzCpGgwZKZFX1DxrtxcvbrxK0wHlNVW12r/ijgENS8oSQFaV6rQsbmumD7aCwcC/gt
 fIcKsAunm2yBJViY0+UhK+wTGor9I9Ro18x6cbo/n9EqUuUrNeNrdiu
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the SCM compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 40a267c54..ee02a9c20 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -76,6 +76,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350

-- 
2.43.0

