Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB00B4908AC
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 19:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784833315; cv=none; b=EuC5s0BTrGply/bARb4P+qPK1IKkOTcdbLPjsNFuCkvNAOb1Ec9XUHA2uNZbd90GHfObPrTwwW4js6GHAxbgUslhW3ZzluQsRSMjc1mvCSO0+21x+S53hULdxtQmiwA5OcadecePvQJSY5t/jMNgW2x8QdHR/ufWO8kcHyuE9AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784833315; c=relaxed/simple;
	bh=5cZJrlPKOxxy55cU1I+05GjtpUsf/PqzQR7YobX8VZE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sfB4Bl+dt4Jr1nWQCzJxPFYfa5WpunKKIVgHR+7mLRDAxFB6ACtINP4+8iEMC4O/GCY4LyK8jwiRoVfcVzblE5UySSDvXHlzt7Lc1lFVgReSrTOemqs91huPrCzZkRRLlo0NUWyueC+EIWoHIUas/AgJJ2712HR87kxN3wvZRsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o+4ojjIp; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o+4ojjIp"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47f904e80eeso908916f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 12:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784833309; x=1785438109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o6TslkgUAWDqod3FQpYnfSZ08UmiNf29gC+HqLWyQ4E=;
        b=o+4ojjIpHiv9VwF2RZql45lORwVH1nS/DmPRwxjhWa+8UP9XdvRnm5neHqlDOMh+h0
         h1dAQh3HryrR0o0+mG5wnRZVKevJcePL/ndVuhYQ3LS+LY/YBeHFuvvBHVt827PWsWOV
         ABoj4zjMcMqY32vBzUAafvKQTar7YbnDXDfea3tWfdngM0Fy2Xn8toFHIFYiUUioq21B
         5ABNeIo1zLlwoBz+8AQclvNU9rED0B2DnakHBvwqGiigvuXb0hiQD1vrk2x157VSv5vV
         hMOgje1Y1KdkNJPu2vB2B6ctCQx+1v6IMHGZ3Ddh7Nq+YWuhRSnqQPQ8ISKdcNf6VLUy
         VLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784833309; x=1785438109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o6TslkgUAWDqod3FQpYnfSZ08UmiNf29gC+HqLWyQ4E=;
        b=W+ppBOkvC+2uE+tvbVy91kSmWjYsrYzuuIzQibDst7Dr7GnE0KbrSb6oGW+WogpJJt
         lMwwaehmo6bnltKHBPE2zdkUME6hRxX7oLbbWwl+6xWgJysrWyID9SweDtEB7/TGUKGt
         aDa/Dk5HGP3Mq3spIjvKHAKIQ8iDn2Q3tqbjCnPw8xc+807mfpJENzOXGpUWq6ZwuLTS
         1zfwrVsddCHVaTwQP76duUSQ8iCgjrTP/CY+HPdRNSRFTlIHG+TtTrJJQFg3v4/zPXGR
         WaEbUJrZZuK7xm/3QafP5a1TTRYTvkoACaZWdM0kvCMGmcvnRpHI5yhiSPec4IDU6vr3
         P5Wg==
X-Forwarded-Encrypted: i=1; AHgh+RpWi6t2tt3gqZJpIpnnpcS5M216AYYr5wGGWRb2LbWiLYGwbJDdoKmrzVg+0NZ+l7oIHs++cg81X8o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlUKvcHL1oZzIgOkBoDx7gHariyCdXgqq9NQyOaozx5lQCAbuw
	amCKNjyuSFXiuLslYi671Wxc62mUDTQfDURpmBTmuiasm8X5fBc05ERLdAotag==
X-Gm-Gg: AR+sD10TLJYWPaf3FkgWwQuAr/EUqt3ZoTlJ3C/YBewFoHRwxKwMCm3T84n34mYEg7G
	Ku7le96yQA+rS0YlDHZQQZToBtlBDJaYXXbzKooUW9j8LdZ1liUrRvL3oujoWXF86grt74LnwOW
	PZaGRcjHxJYg8WG7kb2q+d5TBnQZBvXkloMvZoian7XjbUuHCRinAXs1eO0QrT5KT/w6cTFLtKC
	NixS380S8920BEl1smHessQmlOqNS1w+NcTymE/zaGUjqN5Z3McH98HKK4Z8M4MiONuu1V9dzUx
	mpKBOUG4jyE/9iuMn9U6wV8lk8FBp06TSjCeNK7hext+tuBhPj3ipfqRgpSbNoa0i3QtMUDtCay
	rQteOhOYJarxiR0TF0pBkAWN1Lqiszd6FIYQ2GICtKH7lg/dVpdIBoj+3VcAqYTXiDpvH1EuVrj
	zuNQn3u/MkSar8KF1UHTPSs73Zn6Pr6mRDb2ujKybyO2cZED2PSZ378Vq2rqxhqxeltOvPUd2cD
	Po=
X-Received: by 2002:a05:6000:178d:b0:47f:7005:2893 with SMTP id ffacd0b85a97d-47f8da5ad3dmr5571990f8f.58.1784833309413;
        Thu, 23 Jul 2026 12:01:49 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-3-249-180.retail.telecomitalia.it. [87.3.249.180])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5d9sm16912197f8f.5.2026.07.23.12.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 12:01:48 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: clock: airoha: Add additional reset for PCIe PERSTOUT
Date: Thu, 23 Jul 2026 21:01:30 +0200
Message-ID: <20260723190133.22577-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add additional reset to control PCIe PERSTOUT reset line for each of the 3
PCIe lines.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 include/dt-bindings/reset/airoha,en7581-reset.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/reset/airoha,en7581-reset.h b/include/dt-bindings/reset/airoha,en7581-reset.h
index 6544a1790b83..25e75534daa9 100644
--- a/include/dt-bindings/reset/airoha,en7581-reset.h
+++ b/include/dt-bindings/reset/airoha,en7581-reset.h
@@ -62,5 +62,9 @@
 #define EN7581_CPU_TIMER_RST		50
 #define EN7581_PCIE_HB_RST		51
 #define EN7581_XPON_MAC_RST		52
+/* RST_PCIC */
+#define EN7581_PCIC_PERSTOUT0_RST	53
+#define EN7581_PCIC_PERSTOUT1_RST	54
+#define EN7581_PCIC_PERSTOUT2_RST	55
 
 #endif /* __DT_BINDINGS_RESET_CONTROLLER_AIROHA_EN7581_H_ */
-- 
2.53.0

