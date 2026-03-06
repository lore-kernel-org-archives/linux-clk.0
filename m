Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885B335BDC4
	for <linux-clk@vger.kernel.org>; Fri,  6 Mar 2026 23:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772839384; cv=none; b=iddubVkrxS8udRXzPudkZUwSB0eA2wUp3msx41ktait2RCXVu1AsRxVxkg2LFAccaDF9O07tbewwgONdBMnfTWpEBtoq0pr7H7So71E7gokWYGtrAKcjKGPmnxFjSfJQg6k3SfS+hKpwISHMh+QMQWrAB92XNdKMb1pUoqWW4rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772839384; c=relaxed/simple;
	bh=WQLAr55kMecfPqec87OVnHmOAlkPNngSPXs8OouyW28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W0GI7gF6A39G0mCoZL16Rb+OsRg7+9NkKOGMt9R4p0NVN7yOT6wSvHXVThWIle06bCxctf4PV+Dwsi00eIsZ6iIluOTAqHmTwpv2MHnOYZEx/JrC8HmfOMDiW5/o4d8Se4/xunpV3ZlCeSkVzAACCnD3t4GzsnwGwkOTeF9pDZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LB13DKuU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=F/2AJ/nd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LB13DKuU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="F/2AJ/nd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772839382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vu4zCv4Hf4czVfbvGOCZFUJkIycNVAEZUx405+keqXw=;
	b=LB13DKuU/+d8WAzgXy0ylwCkWEI64vmkTRCsn1dgzLkr0c+6AP89CBQlEDqZ5Ir3HpBl/W
	1mry4IxNjfuACb3kBF1voRco9rzeQUs7PlKBaE87lvnekXpgAlyWWWjZEmTyA21od62CQm
	MCYtmKvHgNtcHT1U6XfaQDMVyEHf53Q=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-V8oAJCWQPMSIsd2yLCdh8Q-1; Fri, 06 Mar 2026 18:23:01 -0500
X-MC-Unique: V8oAJCWQPMSIsd2yLCdh8Q-1
X-Mimecast-MFC-AGG-ID: V8oAJCWQPMSIsd2yLCdh8Q_1772839381
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd77502295so80204385a.1
        for <linux-clk@vger.kernel.org>; Fri, 06 Mar 2026 15:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772839381; x=1773444181; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vu4zCv4Hf4czVfbvGOCZFUJkIycNVAEZUx405+keqXw=;
        b=F/2AJ/ndwd0Lo4ajRAvJAWaymukhnkh6WRrZDULYji70VihllBMWMaOh31nOCRH9ue
         rQcIVVr0zSRnzVwdy5buLobkuo5NAY3Zf2uLtBJg7PW8oScdjOKm0Si8SOvf3z+Nz+qF
         fkG7g8ihH4UUhXMIuCzi0Ka8hA0WxYQyB9Gb+mjyM4K9ne7VoWtWs1dSrG7Pvk3XK3ns
         n4Odgyw5ZGmfn1/Y2Qy+VMNWVdthSLQKEzqJ///HKQm689WpQndHk3aoVJ9ZMp8rEFhs
         08qhQWpFM5pv8Bo4+WKd5jIX/ymT4AUxzKuIBmcaW5XNZroRddPpZ+n4/npx31UsTqbX
         tZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772839381; x=1773444181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vu4zCv4Hf4czVfbvGOCZFUJkIycNVAEZUx405+keqXw=;
        b=XzIsEakh3c6uv2Vb3Uk1PieJgvAjIAVLIkimjXOfhUPx5n2Ltqr+cbhV259olHN89m
         JFinSNHmktF3IL5lXRpQEE7us8RdB76AEzqz4BRMW1K8+5axoANHy7TWl7ikQ+gnzHsr
         d0O/AUdiNJX4rYJR8GGAQpjHrFnxP2hpjzrZHFS8lW2DE00SKVr+9ph3XpO1lNdaTEZ2
         RVFOOgtgcrE/mBF5O92t+CaiC8POIs2jn7N8x22w/CKzklgVq2SIGFlRCsgOiV/ZIVFR
         g8ND7k1E/VbRn7F1iKHYqaRt98jpaJsYvG6asRFhl15fvmtkuR9zb03nt8VyaKSrDjh2
         Uv/A==
X-Gm-Message-State: AOJu0YybWO8cd339uO7XH4DPUSpofq1K8RvOnKpPMlg9jHWt43+4cwdu
	IhEu5vU2NSUGA3SkSMQ8h1/XNKtZKzuJX4mY1K3mV7QHNaIm8McIdsPtLsdWRNMH+IQqspUpTVx
	W8BlPh1mjdNN0EioTG988nzzkVSNejIeBkwIQQw95LGN/nFCo9Oo/fY9DJnruYoqSeECw3WYMKO
	dPZYwPYe03jzi5yNn+dySLyrkKNVcfgf7Mhi2UdLREZKL9
X-Gm-Gg: ATEYQzwix5ENUkF6bG75kgFJFBZHjSzHV/xQ67v1J/BRF+rWun/tZxtMIkG7QoJacGu
	b+H8Xgq72bbrNw279vRKCfNXR/GURdqhrsZFYoZ0jJSEnFxdPu8MH1yuT04uAuXIbSHgc9TQSc8
	axSg70Kfx1SuzmxSZJ1MU/Zs0/sMKMJs+2C1G2M5LCzXvT+9UBW/wlETWfcfmrjEH3HeKpEB0Oj
	lFIlcAtju8kwFg/HmnFto27YFP+bXkVyNn7/MUJZKvCIyStuahQZbvkMgELUTfebR2+5Uj1JESO
	U6oeKTs+GgMBGIXIEpRlGZoOnyNdzxF2TtvZwJsCoBRnTIYzmUjOmG9ueMwBRdW9RoXrrgIXop2
	g2xZHOYpy0De+BnMjNVLOkcN4utHI
X-Received: by 2002:a05:620a:4450:b0:8c9:eada:f3f with SMTP id af79cd13be357-8cd6d4d5f88mr480409085a.67.1772839380942;
        Fri, 06 Mar 2026 15:23:00 -0800 (PST)
X-Received: by 2002:a05:620a:4450:b0:8c9:eada:f3f with SMTP id af79cd13be357-8cd6d4d5f88mr480406185a.67.1772839380517;
        Fri, 06 Mar 2026 15:23:00 -0800 (PST)
Received: from [10.125.247.224] ([2600:382:772b:4f24:8140:d6ff:f19a:7e11])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f4856cesm203119585a.10.2026.03.06.15.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 15:22:59 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Mar 2026 18:21:36 -0500
Subject: [PATCH RFC v5 1/4] clk: test: introduce clk_dummy_div for a mock
 divider
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-clk-scaling-v5-1-d21b84ee6f27@redhat.com>
References: <20260306-clk-scaling-v5-0-d21b84ee6f27@redhat.com>
In-Reply-To: <20260306-clk-scaling-v5-0-d21b84ee6f27@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Alberto Ruiz <aruiz@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2075; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=WQLAr55kMecfPqec87OVnHmOAlkPNngSPXs8OouyW28=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJXJ547mXbc9Jrfs+X/ppcermdO03h32X+zhc/6tm63l
 2JK0/d+7ihlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAik3YwMszacLveaWGawg7h
 Zl8VprR9fKvKrn/ru9v/3bf975aSvaaMDF8mtAvJ2ObdfiYUrywocbbBuzfsy9Gz0yPkXX/ft+a
 dwgoA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

This is used to mock up a divider in the clk kunit tests.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index a268d7b5d4cb28ec1f029f828c31107f8e130556..88e35f4419c958983578750356a97c0a45effb55 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -136,6 +136,50 @@ static const struct clk_ops clk_dummy_single_parent_ops = {
 	.get_parent = clk_dummy_single_get_parent,
 };
 
+/* 4 ought to be enough for anybody */
+#define CLK_DUMMY_DIV_WIDTH 4
+#define CLK_DUMMY_DIV_FLAGS (CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ROUND_CLOSEST)
+
+struct clk_dummy_div {
+	struct clk_hw hw;
+	unsigned int div;
+};
+
+static unsigned long clk_dummy_div_recalc_rate(struct clk_hw *hw,
+					       unsigned long parent_rate)
+{
+	struct clk_dummy_div *div = container_of(hw, struct clk_dummy_div, hw);
+
+	return divider_recalc_rate(hw, parent_rate, div->div, NULL,
+				   CLK_DUMMY_DIV_FLAGS, CLK_DUMMY_DIV_WIDTH);
+}
+
+static int clk_dummy_div_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
+{
+	if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) && req->best_parent_rate < req->rate)
+		return -EINVAL;
+
+	return divider_determine_rate(hw, req, NULL, CLK_DUMMY_DIV_WIDTH, CLK_DUMMY_DIV_FLAGS);
+}
+
+static int clk_dummy_div_set_rate(struct clk_hw *hw, unsigned long rate,
+				  unsigned long parent_rate)
+{
+	struct clk_dummy_div *div = container_of(hw, struct clk_dummy_div, hw);
+
+	div->div = divider_get_val(rate, parent_rate, NULL, CLK_DUMMY_DIV_WIDTH,
+				   CLK_DUMMY_DIV_FLAGS);
+
+	return 0;
+}
+
+static const struct clk_ops clk_dummy_div_ops = {
+	.recalc_rate = clk_dummy_div_recalc_rate,
+	.determine_rate = clk_dummy_div_determine_rate,
+	.set_rate = clk_dummy_div_set_rate,
+};
+
 struct clk_multiple_parent_ctx {
 	struct clk_dummy_context parents_ctx[2];
 	struct clk_hw hw;

-- 
2.53.0

