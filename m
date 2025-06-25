Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1342D5C7B
	for <linux-clk@vger.kernel.org>; Wed, 25 Jun 2025 09:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842799; cv=none; b=l/A6VAvu7uqqJ4yvLpQyKG734msCo77LGhZg/Z9RhFTZc5tZc8q32lvhtwdNW15UTXMhDwTU8HVHCTh+6Q89HQ4mgwGh9Ek5pBdOkYrJFx+HFNhgy7OcEHaSdL1H4aIdOZa7M+RUL0peGV0XUllPUPamYrDtgOSsdDeJQMhvs1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842799; c=relaxed/simple;
	bh=1JOfni8ZkAlhqNEZCQ4qgaOEPo7rOylqXJtAkm0jXyA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q41Igiayi4VjJcieuIP4qUOvBPfA1LkcOmgla4LPyCdtijed5lkT3BXD02T9T7xyFYQyuFH7lkdXZnUnpxgEjPM+GE7GHEIz/TkTn4f+rxCos3f7HsU9IUfokD2/ZO//ZP+X6scy3AlbAqMGbNl1U5Oe4GnYItUTbfoibYJMz6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Ffu9byyg; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Ffu9byyg"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ae0c4945c76so58792966b.3
        for <linux-clk@vger.kernel.org>; Wed, 25 Jun 2025 02:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842795; x=1751447595; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/lF9jCYL0fjCtKteHdI1tv3/oJ2GPGAyZAnvXAOR5VA=;
        b=Ffu9byygsxI6mHBEtUUCTsq0r3/XKSJ3KBn63XdwsE+bqWWYwk1yZNn+4PBZoaVjRH
         UxjZ+NFDFbHNm8eygTNLnHw76P/80nOP1eKPo176p1/4P9LCXwKhpJWVsMaGmsU7nTSt
         zqK3PjArsoN3gb/mHSeQ5sbmESn+xe0VbnMRYtYtPU/EUoB2aFzSbr+qwF1g/zqAjM5S
         LBkpbPRjQkuyQtCMF1z6NV/SC4mgkQwhqhC91ldEBSoijQFL6YV2lC/2GoQRQD3Y/ws8
         kdqHpPXl0ajXG8TJTcNjDUVoxD9ObD9B/Hd/3hXz5qd9L8cMvIFulCx5EWjcK8CbIJ2U
         RrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842795; x=1751447595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/lF9jCYL0fjCtKteHdI1tv3/oJ2GPGAyZAnvXAOR5VA=;
        b=P0aOgIDqo1pm/hi9KqDWWLPjixUg/EyyQJAHbucSW/PEYA/5hwdd7ij7Vi5cvCoaCB
         Cr33MI/DyRUKwbKW89m54UbWTIjte5WIkmWjGFw/D25jSRhCzGuxy3WbNBcMvkYgzH6H
         dv1gO2T2udjhjd/I2sHTbXYQwSwTHT0VU4li9dLPvZ7xf0r5IARsA25wKU2NkHqVCsa8
         R19Co240oVCI/ymljAf8Zt/GfeNZZcS9gKz/W9b5y2MTSHMd9Q/mYOmDe71HmKBvzASb
         Tr1zbOOzmTa70qU9Iy72WFVpmq80o+A50BsH+5YHTByyZT9PhRl274ByffnTAGviIv5J
         uFAw==
X-Forwarded-Encrypted: i=1; AJvYcCWpRdFUswJrNiVFgpot4ZreUHpL/ZyOO0CS5bwBBV73gjav0G21/cOevNxLSKsd7NJcktESsktRI/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCeIIaFtQ4VvfDHMTENVOYiafuk04//yr32vGC/r/cawuum7v9
	zj+44Ex8l5oylAsaXKt0mtDNmNE5Bv20mipoB4mlyTJh/yS0vD7AlD/fI77iX37XHbM=
X-Gm-Gg: ASbGncvOFz8nP2Pvp2yBZYebx7j2R2/ZeRI7G23ncMqyhQRNGZpRRy7S9VX4AXjvZzD
	T/1aNxRsqHi11A67bFFWBpWBIPmLzVWbw6oqMW/HYrZFDbqvoZN1Wv/aSXYqEKp1f+SdklAddSG
	/svf2vCvdGotN+VITqpZ+6l5+cxIMaJK0C9aXVQUfyl5leVDAYRWDAo4ne9vc6d7fCaQixEjX5H
	GxGoyuMuPMKzwkGz/3dV9LIiJuq+NLM61JYyxhk22XA1DgwMNgArn/oXcbgeqtGCTbrlfBG4kCT
	00oWonUqt1l73HztwSwcWuUYCgOv4b5Vsv75tJiLB5jz0pPUlXsMqPRKP8rcZKJiAyCKTxIfSy8
	SRvyoO9MN2p1+a8qQw+S8wDqKJ+u03mzH
X-Google-Smtp-Source: AGHT+IFPf461EnwzWCAllVo6gIU16fYgAoPXHUvYcyIX8YNtmHi+yAzHTOgZmKCIoR1P6uPVIJzgLw==
X-Received: by 2002:a17:907:3d0f:b0:ae0:bd48:b9ce with SMTP id a640c23a62f3a-ae0be7fb932mr201771066b.5.1750842795252;
        Wed, 25 Jun 2025 02:13:15 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0a93f5e96sm272499466b.74.2025.06.25.02.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:13:14 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:12:49 +0200
Subject: [PATCH 3/4] dt-bindings: clock: qcom: document the SM7635 TCSR
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-clocks-misc-v1-3-45fea645d39b@fairphone.com>
References: <20250625-sm7635-clocks-misc-v1-0-45fea645d39b@fairphone.com>
In-Reply-To: <20250625-sm7635-clocks-misc-v1-0-45fea645d39b@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842791; l=839;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=1JOfni8ZkAlhqNEZCQ4qgaOEPo7rOylqXJtAkm0jXyA=;
 b=ZN+/dA0VomKn/kWmMDuNthqZKs1tzKqyPNj7BwrbYWGGfV4zAo4FR1LtEZ+SjLFcTk3tItRzS
 Fj8DufRZWs9BEVqAeHiZwe5w6NuyuoICv8vZnIzrY5EaUZHi2qp5YER
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings documentation for the SM7635 TCSR Clock Controller.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index f3afbb25e8682de83fb16acaa35448545f77ce77..f23a32befe4e860336365a17fd56d3ecb32ad44d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -23,6 +23,7 @@ properties:
     items:
       - enum:
           - qcom,sar2130p-tcsr
+          - qcom,sm7635-tcsr
           - qcom,sm8550-tcsr
           - qcom,sm8650-tcsr
           - qcom,sm8750-tcsr

-- 
2.50.0

