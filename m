Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916A11EB5F8
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 00:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778028635; cv=none; b=X0njksRka65xZ3nVBl/8kPp+aIYWOCol8ru0fHHHhb60jXQ0URy7Nf4YTiYx0nydeHJOT0EUPR+rK/LRG6VOEPLhM6DhYMzO+j/z4zCkmC1uuaveQ/Oi3GWt0OnL9FyKCVcg/uX7zT2VmLpLNQob4apuOrSp6VDKtFfe6+m0ic4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778028635; c=relaxed/simple;
	bh=9eLgOe84G1+qgxzBhagvDPxImGCu+A+SFA5V4275HKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XIzSGEZnepjLgFM6wDDGq4Kqj+XybwbKiQ+jddKaqtj0ABKdyN9QSZcCj9oxtfMZlfDn0yqVVfprBJifZYs8AphPB9s32w4zKOxE33j6dUSyb5J7cmIVqKQTzxwVBJjLGAPuL9bVsKzi0wzL0UzEK8RwiBmMaYaMpAVli40M5AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ahrtdzqh; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=BnH0jmtm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ahrtdzqh";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="BnH0jmtm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778028633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PYWI5q6IWS0HuGrhMbiY7MLQV/QjiFOEif4XZnD0XaI=;
	b=ahrtdzqh6SRLRNSrnhHrdm8VAhcaHkqSMbLJTlh33zen4XJaMtBFB9fm7nK37H3iqb2Tgm
	rzk1kCJ7a/G+0qX5pf4D5xmVdIfp/f1G71XfaMN3QzbKnVwoSE78nfDJJ8IjQ2XEkYLvE9
	6jTumw9AtTauq/p311F7LpM049HVvm4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-362-0FMTGtOANaGaZZqE_ukk6w-1; Tue, 05 May 2026 20:50:31 -0400
X-MC-Unique: 0FMTGtOANaGaZZqE_ukk6w-1
X-Mimecast-MFC-AGG-ID: 0FMTGtOANaGaZZqE_ukk6w_1778028631
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8ece46c4ba9so1140698285a.0
        for <linux-clk@vger.kernel.org>; Tue, 05 May 2026 17:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778028631; x=1778633431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PYWI5q6IWS0HuGrhMbiY7MLQV/QjiFOEif4XZnD0XaI=;
        b=BnH0jmtmF18peEbVQEXSFr55igFSCAIoEr2m+OhGCS+jYxyni8tEAkdqejBR6eY13t
         qFN8gvaKjrMGliS+wQE4+31RjzNIMPw4N6hstV3WiGac8cKzxkpK7EtlAkvBEDgoSR5N
         e05q+BroH3UQKxVtES7ZCwihT6BPom917iXGwD7FKZomPiHRRq2BDU2FPiaKBFikWm6q
         36fE9aHLxsw8QZUL8nH/DN4DGAG0kvHr5k7vqbpmp4NJDOBKF+pZj6IdqG/LFYp936QQ
         6nezJMegm+hbcZo+3gTVVsUIGLM0cgIIf6iuZ621iap1SHsLVli8K7xSLENRcOVz8I5q
         wiWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778028631; x=1778633431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PYWI5q6IWS0HuGrhMbiY7MLQV/QjiFOEif4XZnD0XaI=;
        b=BAk1cxpc3nu72gXMIGaa9yj4oDyRpaVr31MpuepQo+qHV9+rkiB348QBxeh7DvbqaE
         vQGF6HF5YaxX27vdYr9g7Vwt+2KQhLqJQpcsJX7ABBtRXpmJbHYpsk87aeJXgF5yJDk9
         eYpz+zD1nNSivzNKF44Ru2NdkrZ0H5tZDlWnw0z87epGhyxJg6ugUspALebdZ+Y41fZ8
         fubF4o1MfG6fO/GPdT8LEDpTL6nXT1IsfHsqMlsR5LPd6Vq+gGA7OrDKADhkcTTFitM7
         7l8UO0Zi4avQwFfgn7ZcWXdWGsSrNp24Kp9L5oBrswHLEziQ6I0qwvD1SZp+xIVqgJH+
         cRMw==
X-Gm-Message-State: AOJu0YxlALaSlXjodSgMUlc8b81+m2d5xtlF+WhhnobRPsNRA7wt4nca
	t7JbvC0o3B3bk89gcjz71fwVFc/cki2kROIrqXfgaEFetXkuDliQGwKSK62f3SgSFq1D6CMszId
	bOV1jYkNsPAFa0hju/NKHlOAvmsVtst9qbcUKljeH4gM0ym6rDDCkqy6FC9J3UQ==
X-Gm-Gg: AeBDiesEuhS0dPL3uWnCbsF6SC037rBa6uGvLQ1Yod3ZGxWEbMDi1CbgCmPbRIT0+wF
	9JMaCb64v/qSzKJxI3DUBG78IPCUeL9ySIGRKjAnYEEUHJkOuxeHpVja7o4Vp21dF1eK5fySymY
	/RbK0Eq/WGfVqdwlncFMbJYaWIvBriZX5Vvoaq0wIMoWV2MESPYq85xV569OnnNTlSdJINw4MoF
	J+//6Sbl2i4Po8X35EOV/0tYVQ0IM06colJtJuJe4mqkvKNBcKWYcWgdgKEUbCkuMQANtI/eRtw
	CxZUq012yWW//3Fnh0gDOmri80yEcEqDxwzayBwQs2cj+H/Ez+52lThqktjepX6HKAO3r2VRe9U
	GDfFt0thkbn0RjO1L57EUY19gViwQ8UOR/fhpxBYDgG4HTH3WFXXb5qi0huU8ggO8aeYYiYgm
X-Received: by 2002:a05:620a:372c:b0:8cf:d441:c7c0 with SMTP id af79cd13be357-904d5d0d8cbmr224561685a.34.1778028631315;
        Tue, 05 May 2026 17:50:31 -0700 (PDT)
X-Received: by 2002:a05:620a:372c:b0:8cf:d441:c7c0 with SMTP id af79cd13be357-904d5d0d8cbmr224558885a.34.1778028630882;
        Tue, 05 May 2026 17:50:30 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91fb3bsm1464933385a.41.2026.05.05.17.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 17:50:29 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 05 May 2026 20:48:57 -0400
Subject: [PATCH v3 01/15] clk: imx: scu: drop redundant init.ops variable
 assignment
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-clk-determine-rate-noop-v3-1-f3f829fbacdf@redhat.com>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Abel Vesa <abelvesa@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1461; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=9eLgOe84G1+qgxzBhagvDPxImGCu+A+SFA5V4275HKI=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ/TXANuDRLyTWHUaDKdJaMwAzB7R3Pfnv5yCwtvfb6U
 ddMzn7vjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACZSrsTw3zFTdlNm3AUz4Xtf
 7Tsey7+LnPmRUYwnJ1vGaX/d7ndVHxn+1x++IHLLq5njd8Jpswt3Snfeyr//rde/ev17i+l3jge
 eYwEA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The init.ops is assigned a default value, however right below it is an
if, else if, and else where all of them also assign a value to init.ops.
Drop the redundant init.ops assignment at the top.

Fixes: 3b9ea606cda53 ("clk: imx: scu: add cpu frequency scaling support")
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Abel Vesa <abelvesa@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Brian Masney <bmasney@redhat.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/imx/clk-scu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 9b33df9967ec..658b6d94de9b 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -475,7 +475,6 @@ struct clk_hw *__imx_clk_scu(struct device *dev, const char *name,
 	clk->clk_type = clk_type;
 
 	init.name = name;
-	init.ops = &clk_scu_ops;
 	if (rsrc_id == IMX_SC_R_A35 || rsrc_id == IMX_SC_R_A53 || rsrc_id == IMX_SC_R_A72)
 		init.ops = &clk_scu_cpu_ops;
 	else if (rsrc_id == IMX_SC_R_PI_0_PLL)

-- 
2.54.0

