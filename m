Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2062652B6
	for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 13:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768569453; cv=none; b=bkha6riZUZrR6+kVJU4KIN9YTNq5clq5lZNJDivn6P9RTGj/pL8CrPO6kemyYhXZGMN4D4aS2Aj01S4cSzEWXKIXT0NQ733Fy1EcdXRQ77EMiuOi0U2MmrBWnkXOT2HzZyRvVFArpIGEe1QVbq05hrjVEBffeNL1aXhM5HZZaBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768569453; c=relaxed/simple;
	bh=5i0VsvUcS0SUwOVd0wGHGUe0uBItUE4uGBSE3yIgsYw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bUvetYnzHXSdnEPi1otxL3/+EFrqFZQFOoDZShkIA8mqLA+QaVJHXC31NSiFRXcPBJedesL6CUNoTA60LHuMOhoBvZrutYdctu51zf/69U3RZzRIf/nc/nxeb7RnLeJpzxvQG1QTjVh3da8qe16MwMxuwdzBqnyb8aAVxXp0t7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=mOjnHEaQ; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="mOjnHEaQ"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-653781de668so3056611a12.2
        for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 05:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768569447; x=1769174247; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=duq39jBoqDFtabq63HAqX5adf5fdfb9r8RBQ2RPSZD0=;
        b=mOjnHEaQ0xxNRyxaRCwgz00PSnpOxde71MA1Cdyi1PZpG1XySlKbhbPekX1OJPrphr
         FBnSrVjmcOvp6VIwJxNpZkarwpgCNFaqwl7PUkzMNSG4VAIORELm6u0O+pw5p9Fe7uKv
         n76OKCHRioCRE3mJXgxGlZwM+tDreLGwshH9yNW7dikStHvDuIBm/qCRxG9hUipKtJV6
         SuMtQqasEkJsxY1h3k/YQBnJq2xQmQfXdmEP8/lfuwflQHgvKGcWPoHCZpbsJUGFTRSA
         FrcopB4CMrUQDykTUbPwZkIgIh4fK5NREzImnnXvShug82Tj82j8k9o3tPdYflJQzFqf
         fEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768569447; x=1769174247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=duq39jBoqDFtabq63HAqX5adf5fdfb9r8RBQ2RPSZD0=;
        b=Vc5cynhUuI6BHXcrDBkDHA02mUw4a4SCkw/dQMa7RqkOZv5DMDDVpfUGD7zu54r6js
         gq8l/rWQqRwk8M4BszeU7H5ZA7dDfOFYusuqkUnzRksmWmeK8RTW6NNltn+r5kiwHiGI
         PalzZz1Ou0BlVO5lzYDVwX212ROXVR0bTrsKDJ061mvoY4hF1hOoA/VXD7JZT6QoF6Ew
         9C5RhKT1lkPuFqfhux6g7CCyR0zeBMQ94fDyrN4nYkMyr4NkUMSkFATcGwdXfrUAR8dY
         g5nWpD2rkttKBstpXGAq45gXQY1GVFRrVePPkI+wHTKZfsWH3REXBKsQg8h9RHBUlvqS
         hgyw==
X-Forwarded-Encrypted: i=1; AJvYcCVgOYw15DcDFmlX3yIe6wx8JpmfBpRjJJ+2t4rpZhszwvZjQROhX/fjUva1TwvRsihtWu1Iczq3/aE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+x87Yd6cX2FpCWroIBqjPudBjxpQiPzccqfOxYH0UPqezkLya
	tycmMiGR3ASv+WAB779rtgk7GjZv4A8d4pOeeRr04CsC1oIPhBQ5HPH/+KfAVjfU0YI=
X-Gm-Gg: AY/fxX5anXJ6ZX0EwWumKTmd9dCCUHjgLKjlCp0BRgmU2NI/Xh8w8y//Pb17l1YaNmB
	5YhO5ZOQw0JeO+HbaQD+KMaVR2wCW1zdYOcXpi437+xxLhUI1fkDKnq+7gljw7KTbBCXnfnddsD
	kldpSvYNwcAT/WhdJz2vaUwkUGYDFDCK+H3fucPQhl3lgRT2DbydZMUaoBSJbHHk9LVsInnEpRm
	UzMRuSFs3MOokbpcbAdfLQGtFNTgMz3WmrZJdzvw9rh7xbvoN8+U1Q2YUypBzpFJ2yGk4oj09bo
	sOlHBRZoqNJ9qR7v2j7CrLd/6+mdU2BK+HYZp26eoC+Wc597uYmeFh/JxoKStc2Wx7AKoNEKNBU
	IE5XuU3WVzczdX/kiV90j61Tl9nbKurJDKttvYeeOijBFYsPRG+S1bKU5YuZ6Smo7QHoJnEua8k
	wNXu38D866t49+kv6MEr6gE3MR16KDVq/K6wHtYnDHE5yZ2x34Il3b0ngvtP+UD85u
X-Received: by 2002:a17:907:25c7:b0:b73:398c:c5a7 with SMTP id a640c23a62f3a-b8793008849mr255921666b.41.1768569447170;
        Fri, 16 Jan 2026 05:17:27 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a350dbsm235507366b.69.2026.01.16.05.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 05:17:26 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 16 Jan 2026 14:17:23 +0100
Subject: [PATCH 4/5] clk: qcom: camcc-milos: Declare icc path dependency
 for CAMSS_TOP_GDSC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-milos-camcc-icc-v1-4-400b7fcd156a@fairphone.com>
References: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
In-Reply-To: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768569443; l=942;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=5i0VsvUcS0SUwOVd0wGHGUe0uBItUE4uGBSE3yIgsYw=;
 b=pxIbdFvn4Pi8X4MwhDSzKXEcKRx9BJ2hA91ot6BC8vc+Xctsgq8QVNEsD4kc47w1mvuNfbMGT
 fbkIhmEQvCTC+X+GuHJJaZKe/3EgLXqaOD5082PO4UqZCO8X7y851YF
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

This GDSC requires an interconnect path to be enabled, otherwise the
GDSC will be stuck on 'off' and can't be enabled.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/camcc-milos.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/qcom/camcc-milos.c b/drivers/clk/qcom/camcc-milos.c
index 0077c9c9249f..45e68165a2f0 100644
--- a/drivers/clk/qcom/camcc-milos.c
+++ b/drivers/clk/qcom/camcc-milos.c
@@ -30,6 +30,11 @@ enum {
 	DT_IFACE,
 };
 
+/* Need to match the order of interconnects in DT binding */
+enum {
+	DT_ICC_TOP_GDSC,
+};
+
 enum {
 	P_BI_TCXO,
 	P_CAM_CC_PLL0_OUT_EVEN,
@@ -1971,6 +1976,8 @@ static struct gdsc cam_cc_camss_top_gdsc = {
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+	.needs_icc = true,
+	.icc_path_index = DT_ICC_TOP_GDSC,
 };
 
 static struct clk_regmap *cam_cc_milos_clocks[] = {

-- 
2.52.0

