Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50572DFA2E
	for <linux-clk@vger.kernel.org>; Thu,  3 Jul 2025 23:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751585003; cv=none; b=SdQ1dYEjaYXehIERifPgds0IOqrLVnI0vQ03jnKiwQSyfus4U0wWJ9WI0WFlJeJIOWmmuhn5JqSjxc2oNi4q668gdgOyQqnPpIUOIbP5wi94pPprwGu32LXWSK7YAUO9gKMc4n94pkB4pRq3qhDFMqmzSn7R6/SGjzR4OU6IqgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751585003; c=relaxed/simple;
	bh=df3heNetVnGAakoOY8ifFlNFJTyILwhXaXx3zST6UYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sbjWLCcPR+zDO0QnpeiWWfLfASm4jzzxj1lHDZaOR7doop86pcGksIabPPaY2rsKOsaoWoKwmaSug4AI4BD9DCd5lsXunQhKurbPToSsacwQNE0qDmw0g1GQdyc16aLnCartppSWGug+N+eL5KX/hYFYi6hKvA1VbeJcyISSNpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Uni5hLcn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Uni5hLcn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751585000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QS4yMTSBWIACzdBsSvd1ueSXzxvii7AwO2574uYorUo=;
	b=Uni5hLcneoVvjFOFjOP6JKV3z/CYhmZ64jfC3lD6YKVbRpm7cSDKS9bNYr6GS77GVeKXeE
	7gw5Pd5oNwIyDHvg7s38eiluGxkeA/2wbg+aVQEeNv8YKPv4Be+kRa67tmyI3HVgdQfGmK
	vbQSnv2EhFRqQgj9LuOGs3u8jOybNnw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-s9bnGGTDOOqJQmx4AvqBzQ-1; Thu, 03 Jul 2025 19:23:19 -0400
X-MC-Unique: s9bnGGTDOOqJQmx4AvqBzQ-1
X-Mimecast-MFC-AGG-ID: s9bnGGTDOOqJQmx4AvqBzQ_1751584999
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fb5664c771so9142846d6.0
        for <linux-clk@vger.kernel.org>; Thu, 03 Jul 2025 16:23:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751584999; x=1752189799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QS4yMTSBWIACzdBsSvd1ueSXzxvii7AwO2574uYorUo=;
        b=ktxyLsKi54fO9DhVn7GkrPV4dCnzPbbKekYOK4VTOVamKwnrs4n70tmZ99NVTq2tHR
         ld2uJBonOB26KcAv3QMR54/PcVJ6+PO8uh7tLwY43qqciBv7mCyVJIQ3Dvm19GdKx5yJ
         e9tayXzBwzHlFQDTsRr7bHKAO1ExlINZmMax1qi2NyVk33N1mpyFKwodOCc0rIBFQeEa
         o1yclTPm+9hYXfhxF4dn2p7X9xVwfjoQazAAG+qOLkpOcnXNrJOWkTsFk8aQeQKWThMN
         JYGvv3vzWiAT0SGldoQ+ZjlpH58y+u+fRx04NpgcqImaRUMTTyAsEuLK5s+HdqPYlu9U
         XWrw==
X-Gm-Message-State: AOJu0YyP504GQwubPyQOteYaG8R+ijagJsctnToYDkg7hnRNTPZ743oW
	y8l6zVC8YWXsiycGBkD1hsYn9T3sdMSbKu9054BuciVw2XOwM0P8USg+7ZAwIAGFNll5TXcuAT+
	BQDxaRJtwTRISOVVugsFUfB6fvhe6e4qnqGhCqJOcXBfe6ceatn4KIb/UDNCtYQ==
X-Gm-Gg: ASbGncv0Kl4/Bo2DHw1V7qJ2DCxHi9zrVL1M6o3tG9tkMbF/MYTVSGtHf1+WXrhh82E
	pR+HSoy+9mxnmYSQ4qgx3fxiNyygDUVSbOUvP6blfRVIII9mmdRoHH32tyINa04mFzc/7Zr4PJh
	P6qOkXaaZzmKLzi7OL/5RlWNRV7emDgKKP0DxfmjXuQOAXSTCd/uX7JY3kH3BNLzqc20A8GPteD
	fU2U1S8vn34K5gDAUKmonG9lGOCh83e5ueapCV4uj9hDIT6hmr6epGXuFiCKCoUSABLcFyICJJW
	ZC+SkerXDzxxC8H44DzF1JzaWypRl4pJIoXb3RWD01SU1XnbX1kdPGvcRLc/mg==
X-Received: by 2002:a05:6214:3c8b:b0:6fa:c81a:6234 with SMTP id 6a1803df08f44-702c6d01143mr4642636d6.10.1751584999104;
        Thu, 03 Jul 2025 16:23:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnyRBtsxkt1pYtkVxxPc81mM4Wpf/ySmYd6WAtzuN8xInUs5YM90SqZ5QPpGic7Y9Pfr/12A==
X-Received: by 2002:a05:6214:3c8b:b0:6fa:c81a:6234 with SMTP id 6a1803df08f44-702c6d01143mr4642196d6.10.1751584998794;
        Thu, 03 Jul 2025 16:23:18 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:16 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:30 -0400
Subject: [PATCH 06/10] clk: qcom: spmi-pmic-div: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-6-3a8da898367e@redhat.com>
References: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=1685;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=df3heNetVnGAakoOY8ifFlNFJTyILwhXaXx3zST6UYs=;
 b=OFYVeMjBJG2jV2b1stxmQ5G0DPbn/iCRgth0RbTQpfPDnrwu1D4KE8bJib4qFP4WVG1I+0SfP
 A2XeBkjrP1YDSfU9lpFAunaG90ILx4mHMpjg4d3zzXSpuGBMZWLMybv
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/qcom/clk-spmi-pmic-div.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/clk-spmi-pmic-div.c b/drivers/clk/qcom/clk-spmi-pmic-div.c
index 41a0a4f3b4fb316827365a522079dcd99630c49f..3e2ac6745325a1e0a30a4587d27f14d93011a225 100644
--- a/drivers/clk/qcom/clk-spmi-pmic-div.c
+++ b/drivers/clk/qcom/clk-spmi-pmic-div.c
@@ -112,16 +112,18 @@ static void clk_spmi_pmic_div_disable(struct clk_hw *hw)
 	spin_unlock_irqrestore(&clkdiv->lock, flags);
 }
 
-static long clk_spmi_pmic_div_round_rate(struct clk_hw *hw, unsigned long rate,
-					 unsigned long *parent_rate)
+static int clk_spmi_pmic_div_determine_rate(struct clk_hw *hw,
+					    struct clk_rate_request *req)
 {
 	unsigned int div, div_factor;
 
-	div = DIV_ROUND_UP(*parent_rate, rate);
+	div = DIV_ROUND_UP(req->best_parent_rate, req->rate);
 	div_factor = div_to_div_factor(div);
 	div = div_factor_to_div(div_factor);
 
-	return *parent_rate / div;
+	req->rate = req->best_parent_rate / div;
+
+	return 0;
 }
 
 static unsigned long
@@ -169,7 +171,7 @@ static const struct clk_ops clk_spmi_pmic_div_ops = {
 	.disable = clk_spmi_pmic_div_disable,
 	.set_rate = clk_spmi_pmic_div_set_rate,
 	.recalc_rate = clk_spmi_pmic_div_recalc_rate,
-	.round_rate = clk_spmi_pmic_div_round_rate,
+	.determine_rate = clk_spmi_pmic_div_determine_rate,
 };
 
 struct spmi_pmic_div_clk_cc {

-- 
2.50.0

