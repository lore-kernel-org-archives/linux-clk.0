Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C2B340293
	for <linux-clk@vger.kernel.org>; Tue, 28 Oct 2025 15:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761664844; cv=none; b=tNB1xOEJzSFqtr6d8Bb2jpy2fOJQr4WKUMLvM1HcZcBEyhZRyxAuVQDoQ+RYhBvvm8WyVDyo8431rDW/4FR+SNy9k4TUQkq60GtNQpTbDh1D9aKTHBwADgGHooWMaYpZqJQiFasZVDLshKEf3fcebNLwny/p3q+kiachpmV7UCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761664844; c=relaxed/simple;
	bh=ej1af5qJ3lCW5pa9c4MDK9hKV0MJdmAgjKsq9lgpBzc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=cKpyI0A/qn82RSJ7FMookicWv6IxGpHQtU8fqsuo3o48KRuIjiNDedyTOf/MMeDtsBEv1JPLm3OvOnCyGLew7bcDrVLpH4b6G/9JrbSoDsH/qwKbWasJmV3DyNNOp70qIShCP2RugWqWs8Zy/YHMsXXQ5J7X410YeOAUgrowg4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zonydc5Y; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zonydc5Y"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-6349af0e766so8324246a12.3
        for <linux-clk@vger.kernel.org>; Tue, 28 Oct 2025 08:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761664841; x=1762269641; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YIWLk8it8FdUh5OPoc3YMgGMjFwqnKcGsN70DXgD85k=;
        b=zonydc5YLFVRLc3W5jPPTnZxfxv6DA8EkVJjrSjSJqn5qRBOLAwNJh37KFoyJnnres
         DMZi93rX4UkDW1Ao3CRQ1nCzd9tazIg8ZkLl4+k0JfIMfu3sbVMMQqJDnYjUq5c0oTsM
         mHsFLfGmM4Th7TASJV4L9JgK3kEpBK3hnGXFu8LOR1PC3R/nM2Qbu/RcwRpccrcI2Pn2
         cFrEGcvs3vu2tJUSqtO7Mg8DEUnxZSBsL3AIaW9UgJFFx+/OXGjx8kBaujl8IAnB1qkk
         BeUR7wc0+dw7iK/sZQYYkjnnHRBvT6cYJxK2V5CcpvSSj2o8FgSzk7QfTLJz2sKbzuiA
         plUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761664841; x=1762269641;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YIWLk8it8FdUh5OPoc3YMgGMjFwqnKcGsN70DXgD85k=;
        b=mjPGAQEZDgoaYDUoKYuUvDYCTBev6lplCn6VyqMHbEPHRuYgYW1TXsvG4O9m4fzDM7
         kUXXiTz2lEnS4uu3Jd7VVBeB173977SycU9uIi9rxis2sihwpnhgzi0S2pB63oNPp0il
         0gikyTvFhtKI9RnpdqQOh5AptFtwPGI0B+P9vmDUksi2/Zr0WeLKOxJG28JkqemY5RRV
         SM9tLjsI/HJtmnXDfnNZ8TQt+RfadQv37ZcZU9ODEhEe0EPnr6ETimRkJhEQ7F/RUwLH
         MKR4Qgl0zZG7JyTB6JtWpWo6BHQXWJYall0zAcXu5UewFIHdsTxBXEXPiQHjnepDwO2Q
         efng==
X-Forwarded-Encrypted: i=1; AJvYcCVBSD08i/6yoyS5SMlCuOP9Z3MdI1CKh+1w/I655GTFEC0+JGzBUnGTdp1KzG/H3fJ1N0Hp2xfvOfk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVXB/ZU4CoS9DNst95CV9P0siGiKoAGcy0W2W0+FfxVOs17tBE
	cT58h0gk2jVYhrX5yIh9cbcOy/qqZBrdfITOIMIE0QKMOhscPy/JFHWwLBiBFAs3sEM6j9omcBL
	s2tbOAEpd1A==
X-Google-Smtp-Source: AGHT+IHRlIi7iumEViisCh02GxfRIyDe0dn87sMKGGtppytiH5B8AxwzXZp4+VsLTJGi7NohMhbpMoyrXtUf
X-Received: from ejcyr4.prod.google.com ([2002:a17:907:db04:b0:b37:d295:d0b8])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:7f0b:b0:b42:f820:b7c
 with SMTP id a640c23a62f3a-b6dba56fe4amr441451666b.41.1761664839110; Tue, 28
 Oct 2025 08:20:39 -0700 (PDT)
Date: Tue, 28 Oct 2025 15:20:11 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.1.851.g4ebd6896fd-goog
Message-ID: <20251028152013.1697585-1-abarnas@google.com>
Subject: [PATCH] clk: actions: Fix discarding const qualifier by
 'container_of' macro
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	"=?UTF-8?q?Andreas=20F=C3=A4rber?=" <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Remove const qualifier from functions parameter because it was discarded
when container_of was called. Received pointer had mutable access to
it through received container.

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 drivers/clk/actions/owl-common.h    | 2 +-
 drivers/clk/actions/owl-composite.h | 2 +-
 drivers/clk/actions/owl-divider.h   | 2 +-
 drivers/clk/actions/owl-factor.h    | 2 +-
 drivers/clk/actions/owl-gate.h      | 2 +-
 drivers/clk/actions/owl-mux.h       | 2 +-
 drivers/clk/actions/owl-pll.h       | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/actions/owl-common.h b/drivers/clk/actions/owl-com=
mon.h
index 8fb65f3e82d7..5768a2e0f6a0 100644
--- a/drivers/clk/actions/owl-common.h
+++ b/drivers/clk/actions/owl-common.h
@@ -32,7 +32,7 @@ struct owl_clk_desc {
 };
=20
 static inline struct owl_clk_common *
-	hw_to_owl_clk_common(const struct clk_hw *hw)
+	hw_to_owl_clk_common(struct clk_hw *hw)
 {
 	return container_of(hw, struct owl_clk_common, hw);
 }
diff --git a/drivers/clk/actions/owl-composite.h b/drivers/clk/actions/owl-=
composite.h
index bca38bf8f218..6d7c6f0c47c8 100644
--- a/drivers/clk/actions/owl-composite.h
+++ b/drivers/clk/actions/owl-composite.h
@@ -108,7 +108,7 @@ struct owl_composite {
 		},							\
 	}
=20
-static inline struct owl_composite *hw_to_owl_comp(const struct clk_hw *hw=
)
+static inline struct owl_composite *hw_to_owl_comp(struct clk_hw *hw)
 {
 	struct owl_clk_common *common =3D hw_to_owl_clk_common(hw);
=20
diff --git a/drivers/clk/actions/owl-divider.h b/drivers/clk/actions/owl-di=
vider.h
index 083be6d80954..d76f58782c52 100644
--- a/drivers/clk/actions/owl-divider.h
+++ b/drivers/clk/actions/owl-divider.h
@@ -49,7 +49,7 @@ struct owl_divider {
 		},							\
 	}
=20
-static inline struct owl_divider *hw_to_owl_divider(const struct clk_hw *h=
w)
+static inline struct owl_divider *hw_to_owl_divider(struct clk_hw *hw)
 {
 	struct owl_clk_common *common =3D hw_to_owl_clk_common(hw);
=20
diff --git a/drivers/clk/actions/owl-factor.h b/drivers/clk/actions/owl-fac=
tor.h
index 04b89cbfdccb..24c704d40925 100644
--- a/drivers/clk/actions/owl-factor.h
+++ b/drivers/clk/actions/owl-factor.h
@@ -57,7 +57,7 @@ struct owl_factor {
=20
 #define div_mask(d) ((1 << ((d)->width)) - 1)
=20
-static inline struct owl_factor *hw_to_owl_factor(const struct clk_hw *hw)
+static inline struct owl_factor *hw_to_owl_factor(struct clk_hw *hw)
 {
 	struct owl_clk_common *common =3D hw_to_owl_clk_common(hw);
=20
diff --git a/drivers/clk/actions/owl-gate.h b/drivers/clk/actions/owl-gate.=
h
index c2f161c93fda..ac458d4385ee 100644
--- a/drivers/clk/actions/owl-gate.h
+++ b/drivers/clk/actions/owl-gate.h
@@ -56,7 +56,7 @@ struct owl_gate {
 		},							\
 	}								\
=20
-static inline struct owl_gate *hw_to_owl_gate(const struct clk_hw *hw)
+static inline struct owl_gate *hw_to_owl_gate(struct clk_hw *hw)
 {
 	struct owl_clk_common *common =3D hw_to_owl_clk_common(hw);
=20
diff --git a/drivers/clk/actions/owl-mux.h b/drivers/clk/actions/owl-mux.h
index 53b9ab665294..dc0ecc2d5e10 100644
--- a/drivers/clk/actions/owl-mux.h
+++ b/drivers/clk/actions/owl-mux.h
@@ -44,7 +44,7 @@ struct owl_mux {
 		},							\
 	}
=20
-static inline struct owl_mux *hw_to_owl_mux(const struct clk_hw *hw)
+static inline struct owl_mux *hw_to_owl_mux(struct clk_hw *hw)
 {
 	struct owl_clk_common *common =3D hw_to_owl_clk_common(hw);
=20
diff --git a/drivers/clk/actions/owl-pll.h b/drivers/clk/actions/owl-pll.h
index 78e5fc360b03..58e19f1ade43 100644
--- a/drivers/clk/actions/owl-pll.h
+++ b/drivers/clk/actions/owl-pll.h
@@ -98,7 +98,7 @@ struct owl_pll {
=20
 #define mul_mask(m)		((1 << ((m)->width)) - 1)
=20
-static inline struct owl_pll *hw_to_owl_pll(const struct clk_hw *hw)
+static inline struct owl_pll *hw_to_owl_pll(struct clk_hw *hw)
 {
 	struct owl_clk_common *common =3D hw_to_owl_clk_common(hw);
=20
--=20
2.51.1.821.gb6fe4d2222-goog

