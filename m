Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2ABA242D6C
	for <linux-clk@vger.kernel.org>; Tue, 23 Sep 2025 14:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638409; cv=none; b=gm1iMoJhPMoxhD2hnfas0b/JvoAnlbGyDUALnA+p6DNASnU9h1DjMz/TOhU+54dmPhRXzlmaoM8oELOJg6VcHdXa3CLc58tLdMJZfDLwtvTwcqRK+KMNiixUKgErgiOQKdxfyCeX8mvwWa10htzaEqzoZ+0F6nyWhSJQPGqfdkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638409; c=relaxed/simple;
	bh=pFcsx99BIvhSJs9EZjHposR2YHdvSFZidHEyknZiq+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=emRy6Pn1Va9B8p4iErILm2735ztKEy6Lc2eSbCpt9J7ciEjhLb8xCdUtox2vZtOPFmp30ClJyhW0L7dVgU/V9qIZekqvwcImh9fuhWwXeCJHWCAaXywyQHSAXqHU0UnKFycX2oZ+ZfK29xKNBh5OlCjplTuYJA06NbcDVmqW72o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EaF63Ecm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EaF63Ecm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758638407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A9GRgIWzFYj7dDBWP7AZSAac6SnS5DXh5UVkU8dbhRY=;
	b=EaF63Ecm5mcWFDOvt5aUyaXBWWFXxTnFm3J5G597UKlNy64JWIf75XUzt/E1EFEb7v2zFk
	R08cWChZ3RJxtMw7FDGcGphBkK/Ui0IoLUexaTyRpiJnLFBWaRleBl56L4wGzOMpGBNeqj
	8Um9jlsW/IL1voxF1BGo1NUQ1nWZAm8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-484-vvwOWymXOjm_f5RHkw67bg-1; Tue, 23 Sep 2025 10:40:05 -0400
X-MC-Unique: vvwOWymXOjm_f5RHkw67bg-1
X-Mimecast-MFC-AGG-ID: vvwOWymXOjm_f5RHkw67bg_1758638404
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-84e6256b06dso201428785a.3
        for <linux-clk@vger.kernel.org>; Tue, 23 Sep 2025 07:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638404; x=1759243204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A9GRgIWzFYj7dDBWP7AZSAac6SnS5DXh5UVkU8dbhRY=;
        b=eH2ZiD5HrcpmrsyyRzTVt3lBW6bltJFlZWae37okRYxRKrsctC4DuLBanaJgaYKfKR
         qPX9EEfiJh7nRPXypGzKQ92mO3sx407SxE816OfeABKgTIyfqimieeTEQmNV2vgr8IHC
         jNaIDkK4ZQjpxXr+w4KAhchD9ne7R6btKbE3izsGtMt+/qzdtXwdVtMhiNrLOecz5tJs
         /FiT0Q4wBWSYpOvrOt2Qhd5tOcBIefFet751PU8O5Dlr3dKJr+m+h/xwK77MsPxoodyy
         WA8vvPuEOggJXRmEPHAip0IKDPAhziw8eZfjTOGiPYGKpoWYwFcZZLzXO1IytXI1oxUX
         khOA==
X-Gm-Message-State: AOJu0Yw3drkD2aDm+/bbLgsklY7yDz8lNNHGW4pDGDBoyTwFNn0WrxVd
	g2IVjLaXN6aCfxsJo7rY3nss4OZQCi+9bG2nGX66w8REfyXSsJKeMQ5IkRGq8g3YUsDE/B7nYEq
	bskNAVXjj25Di6Qlp6+zOpS3WXgl8VKDfGRnzN5Z+FXgRfbQrQGqN70azVOIHFw==
X-Gm-Gg: ASbGnctcYL61+SKpoxxTOY2ijqMkfPgF+CCUKVRuqqKtL0ZZUX5NQ9CgPIMniOK7KW/
	fZmXVoOK8sFLjCNwYTmSG4I8HTtG/spYmUBGHRBBjoSCR3Toi6gcvYTRLuEdNEIuCkuqvolPxJP
	P4eIMQyKPC2tZ6t+gRgao+X7o7eHExgHtMMTOTbJ4fHd8DORaWmGGDWniSjBUahpv93qm0Ap/Mf
	GyVFvA/k9MS070Vt9lFPc7aTwUqyyPjHjTwOimleK4KOPl3D02LH2ET5aVUmH5LFvZ6iQYudjgr
	EiTQLbqa2Y6XpozSJqN3/Be7PfxaRzF7iuKZFPOJze4VSLbox7Sfp2lA88IVuXoGgGYpVkxaq2r
	qXb2EWz+YbZPLr11zvjGJoRa6I/V9fexuMziTVW8=
X-Received: by 2002:a05:620a:2893:b0:849:a372:24dd with SMTP id af79cd13be357-851724be79cmr315042585a.58.1758638404281;
        Tue, 23 Sep 2025 07:40:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGB1IVa4PYBoaIhw9LnlRHxc9bCRkENFx/qDelC+j1q0D87GHSENwmL4JOuTI63o0roDkoNIA==
X-Received: by 2002:a05:620a:2893:b0:849:a372:24dd with SMTP id af79cd13be357-851724be79cmr315038985a.58.1758638403658;
        Tue, 23 Sep 2025 07:40:03 -0700 (PDT)
Received: from [10.175.117.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-84f2f6f3c25sm230272985a.49.2025.09.23.07.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:40:02 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 23 Sep 2025 10:39:24 -0400
Subject: [PATCH RFC v4 05/12] clk: test: introduce clk_dummy_gate for a
 mock gate
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-clk-tests-docs-v4-5-9205cb3d3cba@redhat.com>
References: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
In-Reply-To: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1504; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=pFcsx99BIvhSJs9EZjHposR2YHdvSFZidHEyknZiq+Y=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIubdRX8HNayV7rWPh6F3dtv+xR1zDb26FZK3vvbOiy5
 ouTnGjRUcrCIMbFICumyLIk16ggInWV7b07miwwc1iZQIYwcHEKwEQ0vzIyTIn91u717/Zus7S2
 9FulzUv5fcQYC75fvT1beMV/32UFGYwMT80s0+27gvmuVftwXFXeGnz7dO2XbI8p/hqTtpfO31T
 PAAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

This is used to mock up a gate in the clk kunit tests.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 1aca266f9922beb7d81124c07d21b2a3d700dc5c..e798ee0591b5db6a7728eda20dcab167245a9834 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -181,6 +181,40 @@ static const struct clk_ops clk_dummy_div_ops = {
 	.set_rate = clk_dummy_div_set_rate,
 };
 
+struct clk_dummy_gate {
+	struct clk_hw hw;
+	bool enabled;
+};
+
+static int clk_dummy_gate_enable(struct clk_hw *hw)
+{
+	struct clk_dummy_gate *gate = container_of(hw, struct clk_dummy_gate, hw);
+
+	gate->enabled = true;
+
+	return 0;
+}
+
+static void clk_dummy_gate_disable(struct clk_hw *hw)
+{
+	struct clk_dummy_gate *gate = container_of(hw, struct clk_dummy_gate, hw);
+
+	gate->enabled = false;
+}
+
+static int clk_dummy_gate_is_enabled(struct clk_hw *hw)
+{
+	struct clk_dummy_gate *gate = container_of(hw, struct clk_dummy_gate, hw);
+
+	return gate->enabled;
+}
+
+static const struct clk_ops clk_dummy_gate_ops = {
+	.enable = clk_dummy_gate_enable,
+	.disable = clk_dummy_gate_disable,
+	.is_enabled = clk_dummy_gate_is_enabled,
+};
+
 struct clk_multiple_parent_ctx {
 	struct clk_dummy_context parents_ctx[2];
 	struct clk_hw hw;

-- 
2.51.0

