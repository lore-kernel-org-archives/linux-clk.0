Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21E041D13B
	for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 08:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040585; cv=none; b=TJXnjsv8AHOVIvTheIiWkgi6YWeNJSYzaxrHSAifhRM2bqXkWbbwhxHt+Ey9bEUV5iXsY0RsNakXVEWYSE+gDeTg3G7p8FFPMbBBd9wjTU2UIhdEKPE5rXLCvL8RNOImVf/Rffd7RJRxUEwZdcf3RZcaJCk5sYKiHvLKE1bg220=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040585; c=relaxed/simple;
	bh=Unl00eAfFi9To3aFPzg9GlTfdXTVfm9Q5VowGJ6jvsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h+Psus9nrSPq2Qw91B6adeLWEQPEQoYNCiBRabE0oo7ITnv4b+zaiAuvUfkdbcUJ/vHuwjuuiQSyh9XKUhqouszwNGi2fDT+kKPFyiQI7cv9rzMSQ7+x/QiVif7Vv400P+FNIGDG6VJjiJT5SW+beCniPJfHoCFBSxOn7rO4mvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FF4dQhan; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FF4dQhan"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so54662745ad.1
        for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 01:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787040583; x=1787645383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=FF4dQhanQa80jrhuV8O5EinHloE+L7I9SIrdGbMeow0FtBxQ/1MNZz24ApzJDTPdB+
         gwE9iSNQ2eYHu1a7SOyWGMlSdtEYDoOFftLjKciW03I6Wg2waaZbgvwAW8DnBqPpPM/L
         JicDDisW6Iwz0YYCCK0uwCVxgT1834HS+4IUTv9fNAcQZagbGBMkSGs7w/a7M4xGPgkp
         5DrDSU7IYe6Z2Hl8u93vz95vl4T5hxs/L1rElblduNAqZ0Q9Q4CZGm0eWjsFpt+bYaRt
         JhNuOytstuQJgX8Wsk8YrYCdgs9VJkp2VOlOoPaHdG8Fh8h/OKQh6SZA7QbCwGI5Petf
         Qfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040583; x=1787645383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=A3QKymNVSpFuZCBJEww3Y4cdz+swWBGjS8hXPUW2eKyEusHiyNvQDs8bpyTKhpUL6F
         UUjDDo+pkasUAWoIxfz6sDAZSW9oUFKmP1+66RHNuo8JSKgV3ANlCxgY+m46O8ZfC0xV
         y5IbnbYpo+ayj8LmrvdBJveE0gCJVO7WNLbzcsQ6MOPgTIF8SRd9IgQ4rSWtF9GnM3uW
         Z34aIxTw4K34XbohwGxvxJiJ1jawKrkTRZe+2ko4w4krCWSXtn6HvMrh97cVACyCOdhY
         bEiySo7IqJcfwYwt4D3YhQv/5/ae01EAaqGrKbrMXClzV3ykWvuBBniTSShsVm1nJOV5
         OrWg==
X-Forwarded-Encrypted: i=1; AHgh+RrfdNHFhdgUXrGpKbr1eZUxlmDy86MpogyPp5K2C1Tu4EXvNYSI/jWCHzAw1/TxEdlZsWXeV2PseJ8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5dv7IAJ875GpIM+3VtbbvJlj8lJHguosuBeTWFd7NL4EBdUsQ
	dFLdNJ8YjNSw4dNBewl5TdkkRsMyPnc+8ouaCLVVp3x+IxerjzUvwzLp
X-Gm-Gg: AR+sD11cZhJ0PaY7ZIW3XAkkiYHnWDA44OvDlXAySqqDGSwWHsuHgtPDOB1bLS2vf9U
	ZhCyJwocncJ3kvKjLaK1ryFFw1ZFrYU13nExGvCxwFUfqc8VV3lH0vqN1WBeNd+LiVnkrtpvWbC
	X9Ef+99qNAQvfsu7Rr37Kh/SKH0dzd8LohtHVUN3F0DfCmJwOYC+zaa+qGiIgw1h9/uhB5YGi+s
	zCxhyawPLTkn4Uw5vOa7EqTTNgBs322EW2nzZyfnBWsMZwusooS0FDJOZhr7DLfU87soB6IlMoW
	AJYjBex/mHH/GIYoDaZ4v2CGxEdX17tPryJao0C/K6XfKrmpOZFNMU2lmJ1NImy6fTrZ7ZfZ7lc
	MLam6dC9vF4/G8HrFySNdVeEOvZoh96UGGirnO+CGGpoay1WlN9rrhlSuzvZIh1uL+iuWrxVupy
	BKhkBjId2YowgY5jDNCRrCzOI6N0CddKImT4XA1gWNLiruR1YSJguKURdjtYKbCM5oVtKhWcirb
	NaBw81fGo0=
X-Received: by 2002:a17:90a:e18d:b0:380:7688:fbe9 with SMTP id 98e67ed59e1d1-3933b764d23mr35772186a91.8.1787040583219;
        Tue, 18 Aug 2026 01:09:43 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32678dd08d6sm22606290eec.4.2026.08.18.01.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:09:42 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 09/12] dt-bindings: arm: cpus: Document Kryo 475 CPUs
Date: Tue, 18 Aug 2026 08:07:51 +0000
Message-ID: <20260818080754.4362-10-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818080754.4362-1-sreeshankar0910@gmail.com>
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Kryo 475 CPUs found in Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 5be89c584..2a90af67c 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -212,6 +212,7 @@ properties:
           - qcom,kryo465
           - qcom,kryo468
           - qcom,kryo470
+          - qcom,kryo475
           - qcom,kryo485
           - qcom,kryo560
           - qcom,kryo570
-- 
2.43.0

