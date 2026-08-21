Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2AA3750DB
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 15:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787326968; cv=none; b=u97e+/nEgp6dhr5nNIeTrgSIe8tzBImlm8TdmBcXz4AHzlD2e7LrpcSvKOUh2P9LS+oa7IEktmGfBoYv/l3o8TnQhU1kmm1qO0948Ir1lhOWvQhBTY1/NsUCtdnobG9XRtAxaZ4l9WhaKBL8mK3LKnzNwu8WwRfj0vbWro8zYBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787326968; c=relaxed/simple;
	bh=S4gVIUWwuoALYuzwzRm82WuAYzYN5KLWtNbqZ/oM/+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ctfICmYPFSDZkdROlQRzH/8kOyAGCz9biThNekDOBf+Yy88/cyLdHWCdwrb1OnRCbYZMjlTsvcyJu+oWb5s/BMvt0vVRYbcteO+VQF3xfidsnetil+6A4vQEsJTHlUH2F71EhIaizSoG8vt2xxLVLWlJoz2adXZH7H3wNurZ3q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kNs/3m3U; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kNs/3m3U"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c96b08cdd1cso909594a12.0
        for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 08:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787326965; x=1787931765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=kNs/3m3U/hh6FK5lKOcRQHOU4uM7XhgCXIyqGeiW7LzdvC8da2/DKA26+u75/2DzI6
         Q+pKPKLbL71j/6+rkBdW73+fnRDfOFhVQeCGlWoNbHH4MwRfdRgmtFtOra3RzCJylGvy
         qT5rAkZ8KX0gde/8TLbAM0r3rKX+j/Q2eZ7row7pNOp1MlVMQIJM6L+OcP/Kixwu8Z16
         bZfYBUEsUWmQR2ZrhnI1eyCsuYwCw8XM0h2lbKq8/McZ7j36X4gDHcGNgm9A6utEAzbr
         horcuxjMwlNwr7QgifdDp6gTNNbuJdlenpoEc+73Z44aJTeC9Mlfwx1N2S99y8S9C3ze
         6wAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787326965; x=1787931765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=sygs9ajRrfJzM20+HbfNuL0GZbfvUzvxhW2+Y2QR7ugotMeMKhs92IgdkXCMt3pp7W
         rBZUGMEzUtNUNDh3lriPRpiDBygc3K+v8w7AEm0hpPlox3D8gwLcu8/axy2X7CYmZ281
         CCujD/pHY0ZzyK72c8P0rEwlb3NuaACouzC03AIXDPrkCxC/qCoDQeyxoCKoqXOeYKkR
         QZlzHuSdAXCD1a3YkCyMUOCLgALvcKgkTpUTqcZKD/CE3WE0RgZXMTKDwBf9YgBwVE5D
         WnvGseDR1VJmrzQgi/dbZfbnf6W0jSt7qnfHq9jZbXPxo5agcCn3JVPqisqbeTvevOGn
         /VvQ==
X-Forwarded-Encrypted: i=1; AHgh+RrauI1pb2TFPdpX0XX7EgMGJw7EkzKLabadJ9FdcqLy5zB1LG80foyN5EWsFMkSQMUIfiLwVSekMg4=@vger.kernel.org
X-Gm-Message-State: AFuF++mZULpTyHXPmW1bvH2LSe3s+asQpYVzkJcCjojrTlfyj1MdNe1U
	FdeMvKGWjI88+xKXs+A8SyDLhQgAVFQe0H+MVyJ6tO8QhnxuwfZvpkao
X-Gm-Gg: AR+sD13DlszjEzG5O7juKThBV6dq4flHt5BPAg5DmBo1HnVtoyjnM3bDnyK2xx3CsX2
	1Bk9Bs0kert0lO/vo13TWgFPu4pNxmt6MwjwvNnnYkueGmXwSuK+XpID1o1nDwBql8rwf/67O1b
	Y570lFnsSTMOaFNuUl25SPvW0JWYLk2j/bq64NqpcpiM4O/FczoiSOgvgjNPM1vUw43QQJmunCJ
	FXJdMrhschQGK1hN4jnrIff4wLrrdGw7FqlWH32l4m9W2EYduDx3+lzgD1Y8/KELTxOg/LMAeN1
	19HcVGVbbCGSos/Osmhg25rB60oE+DmOEDDmdi4I0SsD6FxB57L5Y1fxYdD74ymnoc2S1LIkK5o
	kC9SUuI0ceaw51rjoQfRdcyqU/f+ZFQtB67UYgZtJWi5Qq+3hRL+t4YNJA/Gatv1Dz1iRYGHnKq
	KnZ9SviWlaC3BLjb+oLEze9PSSd1RlNNK5lgLcEzA8AeS9i3LPyTnLVMLTdXHy6ZyIWPnj0rUVc
	vbz1l/sJEU7K7WG2lSMpGo=
X-Received: by 2002:a05:6a21:4514:b0:3cc:9162:6bfe with SMTP id adf61e73a8af0-3cd302e127fmr14339879637.0.1787326964897;
        Fri, 21 Aug 2026 08:42:44 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae5f1ffsm42903185c88.13.2026.08.21.08.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:42:44 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v4 11/13] dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
Date: Fri, 21 Aug 2026 15:40:28 +0000
Message-ID: <20260821154030.2514-12-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821154030.2514-1-sreeshankar0910@gmail.com>
References: <20260821154030.2514-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the PDC block on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d4..c30b88589 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -50,6 +50,7 @@ properties:
           - qcom,sdx75-pdc
           - qcom,sm4450-pdc
           - qcom,sm6350-pdc
+          - qcom,sm7250-pdc
           - qcom,sm8150-pdc
           - qcom,sm8250-pdc
           - qcom,sm8350-pdc
-- 
2.43.0

