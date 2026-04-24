Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B7B38552C
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 09:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777021686; cv=none; b=WsAqun1pW1CcI5F1IFofZOJUIn1NRs/UDB8z2DPb99yNUdzPA++Abu7IrMOxAw5Dom6DVeMpYUxpAUaGZe0X/R+Ibx33Jff8RoRedbHaeuHV6ly/byf+lcUpQJiyGIzTa5HdPntGUS0vYfeWdoi+g8tzqnP5YjTyBDkSb995LXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777021686; c=relaxed/simple;
	bh=IwkmBkAuWbKdA+FQU3eOvcwJRVeHTGMjU2R5rw8ly3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jv8zzqP0BxQLqQrItP63OpSt7+idzIXTRw+yf1uhz9+PWhF7VtxOO+Fix7WWeEVMC+uO71CuM64rBKwpEoiK3+4aJM5TZEZ55Vw8a/MduSJdy4pd5vPEGlEIsjHOYr8jYTZy47AabsWyXgdFpfSMwHR2drRRDNE7tNzsxGROdzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QwmBuErC; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QwmBuErC"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so80714585e9.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 02:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777021683; x=1777626483; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hTJIDuh1c9B+y7w8n0vHIO8xz2jJldQ3ENPocwBUryE=;
        b=QwmBuErCaC5psT/BN/7tnpgr7zyPKG5stFgNkqTTsy2Gd6QxtE+k2r4OpfcjCpOxR9
         AJNwFqysvhEfqpUD1cBZSiyXSHKJDvbXvGTtNBUeHrTVZ7S6D7ep5pNhlanPY1SLZJ70
         eBPlPtIn89g1SZJlQbDBCE+fY48ERbGZ4GMGqOcvulTmu2ULqlJgsnc8yiYY8FKU/Sb9
         LmpK2wWkySp+xk3cqBpwwl1ma2Si22b4mtgGQcfP++O6mDBsMyr1HfpK3bvhr1WJoQjC
         Ol7Tp516FeGUtfWMBdSItRXLgy3kImduEK9peOjjOGyQQqjCzPWFoIy3LG9mo0Lqh6o9
         SzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777021683; x=1777626483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hTJIDuh1c9B+y7w8n0vHIO8xz2jJldQ3ENPocwBUryE=;
        b=FsdyhBLwMOVEZ4oosrljnmM7jzNe0PO2FvetMchl3UQchgqdrpIG53Az0xrEG5BU/a
         jb3I5AehHns9G3vNlYJ4fJK4HqlSFYyTeZ8XnIkNgbeNUGBXVuhYiD4RijtEkQ1l+DAB
         OqWWFb3J4Ppi4QxwPrc6Xdg8Bmg3qvcW7M5u/K/ChLJv/eJsQbFax/eJJ6Ibw03dK74P
         VNcWqHBlFmpJiodpcqN2fZKUr94aH7EaY9LYBJXKsBnZavzGREPooySr6cACzVLEBxnS
         4nFTUS8ZbxlRt1S9dpup33NpqevyLFEHPcCCk+slrsw7kByFdZGk5ONZLYzTKPlI+lf+
         9ZMQ==
X-Forwarded-Encrypted: i=1; AFNElJ/IwMC6Ca/+A0332HTw7eoq9pYszBa2GeOEo5SoU3nO3FuB2uNB47+3/lykg6KnbNrJn6tZQqVx4Mo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzOJru70mfBixC7c6vrjnSVrib/MkVtHQsF7vc/ULmVBacsyED
	bhSBJpOsnl/p762cHrOL8ZjPgQsX0npNaHwUR9pgo3KupmwqO3UbLQMroZKUHUkBO7Y15LcBAsK
	xfHtqRxk=
X-Gm-Gg: AeBDieuMiWonfhsJcgp8NBPeIC0tDojkYfUwV73E36UofFJWiB/2rYMSICWMdJ/UdRX
	5Itd/jy029hRycWZC2HPHTJqnwlbzH5lU5LPgAEluIRLeAhF454PcwqkpXij0C2tbo4H7dXKyrH
	vKjEyRdTe76OJRbSAqMdfMFlaurep/paabED7KnGxGCwDZQQYx4Vh/BDZ1oUwvyZBogO5KNwhjV
	lPqbLy2YnepupIFGADF4/bY2sFSDE2HIZtcCH3t1IGQx2RiiSn8uUB+2tjYJlAjSPjpdYz69FN2
	78dLTSHO8ahJXY/UsS7tAA3cqa6rHp1J6WCChde1xN2CYa8xUSrCqFfQair6dWIzDGYiGiUGHpR
	MnwJ8NGEhOu1eFCuDsCvUXyZZfOQpcVMKpkwKl4RyHL2EqEvFnfImL44kKPSimtHM7BzVl6Ic/R
	mztlr9HtnH9RzSDIDYVI3M3LksXejo443qO6gvOA6KjPgLSxvjNbN6FSQ=
X-Received: by 2002:a05:600d:b:b0:48a:563c:c8e2 with SMTP id 5b1f17b1804b1-48a563cd137mr173435695e9.3.1777021682880;
        Fri, 24 Apr 2026 02:08:02 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c0354sm537222545e9.11.2026.04.24.02.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 02:08:02 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Apr 2026 11:07:56 +0200
Subject: [PATCH 2/6] dt-bindings: clock: qcom: sm8550-gcc: Add missing
 power-domains property
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-2-4b6e09d532ce@linaro.org>
References: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
In-Reply-To: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1085;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=IwkmBkAuWbKdA+FQU3eOvcwJRVeHTGMjU2R5rw8ly3w=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp6zLta7gwiJ/on/YhF8Netw60TBjWggYjPha7STkA
 1XZQCE6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaesy7QAKCRB33NvayMhJ0cqnD/
 9BF1CqOKgUv5pGbD+oyYkx0JMogo5opYqZcmzeK7n3iZjZ+DEUWIKu29hHh4YhDqWc3yRTGsxIndHX
 2k67GLH/xgKm+IouegCD/4gM9KDEMb8Lg7Tu1VWRDfHetmVe8D78EhKieWWAoG/lyiblqNq0PrjpC7
 BWp2OJIB6pic2kuJ0qx7iTYOoQc2tML9IeanM+PoM+6toR0646j8ELgY6LHZ5PcTdrAFFVG6ics30y
 nmnmRcPW+NQ4r7tCYwtREE4nXaDB0+keYW6Y/wpySvUqFVr5aj0EBNPbnNmpfZtgyK66X99YHrxiti
 GTz4DFauw08t5WeU8Qy4YJbyqk1HkEotnsiSD1Rr5PBYQQo+W9A3vDuG009cTmSbTkNahuwTgAo12x
 h0r8tqAXE0BW9woL5rZRPx2dmBeiMeTQDbIzdqq6bFmvSc7USbX7UmdcdJTaW0ge2L6yFB/cXuhot8
 lOnN8/LRKT6F237DH+E2Xk4HfgvJ8Ts/yqdKNJ7IIgoKVTUk9Y4orQlW+pnB1C8BPVWzVtCFuNsDJ4
 TKxMHWDgshDghaAJ3PPemAb9bsCSmaY5vWzpvCiUT40x/djSBjcn6M9n2FQobziakP7IMXPYf61+yC
 SftzlBy905Uo5wydxR57etbGXRh9SDfQtHHDrUaC0HJM2gXmW0zx8CMOAC+A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

In order for the GCC votes on the GDSCs it provides to be propagated
to CX, CX needs to be declared as power domain of the GCC.

Document the missing power-domains property to that purpose.

Fixes: 47ba9c50bbeb ("dt-bindings: clock: Add SM8550 GCC clocks")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
index c4e9b9bb63f5..8c40e93bf336 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
@@ -31,9 +31,14 @@ properties:
       - description: UFS Phy Tx symbol 0 clock source
       - description: USB3 Phy wrapper pipe clock source
 
+  power-domains:
+    items:
+      - description: CX domain
+
 required:
   - compatible
   - clocks
+  - power-domains
   - '#power-domain-cells'
 
 allOf:

-- 
2.34.1

