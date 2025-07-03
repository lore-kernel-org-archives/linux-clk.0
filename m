Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4DD2DD5F7
	for <linux-clk@vger.kernel.org>; Thu,  3 Jul 2025 23:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751584993; cv=none; b=Lb/Xra0xGMU/vBhMHuNBD8PxttmDkTLvfjn1YR4DCdLaLfZGq9GWFjPmDeBIlSt/aW0pYuYOEBdYA7DgRYBkvloAYNkdWRrU8RA9VepsOs9JQJ/6SP0lPCxPn1WO2KDg8W6DiXL8C7svkjtTnH73luRHOmmuYO4L7bxmBuFM14A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751584993; c=relaxed/simple;
	bh=xV38q5FTl0giHcO6B1fUUKKklwS+ypfUiAE8QJ9ufs0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YExpNYdu38nshEprnXFW2ANFV7iu1WCyQMDqtXZ23Qbv93BAlM6G+pABZSzEprKqdqnAQV8QtXFtWhAETnhv6I+TF02aUlOAv1hf/gxVUhrXysdiduqvKeBYxRV6WsXM7AphjWGriQRvRkQGnA/+zF8ueGfAnLwoxrywkMZGTVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=djfEiPFh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="djfEiPFh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751584991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1AzaXolkpwLeUXX6Tltm5nUeMgctbaGRt9VbQb3Als4=;
	b=djfEiPFhTkN9NRoLMK69HOmkfQBpqExj71j2pzSKZmqY4oM45la5BdDcG/MzeN526lvDhI
	2mTEPoDE6RQvz/iMszWZdNterbKSwP3TfJ6kF96ARE/qJig0tf9yXPlQPlcvN7T4o8RgJW
	RY9B0mdORvH2ZswTXgoGzvkqRXWIZ9I=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-XpcF1hqUOjiGx4In_xcVvg-1; Thu, 03 Jul 2025 19:23:09 -0400
X-MC-Unique: XpcF1hqUOjiGx4In_xcVvg-1
X-Mimecast-MFC-AGG-ID: XpcF1hqUOjiGx4In_xcVvg_1751584988
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6face45b58dso3734066d6.3
        for <linux-clk@vger.kernel.org>; Thu, 03 Jul 2025 16:23:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751584988; x=1752189788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1AzaXolkpwLeUXX6Tltm5nUeMgctbaGRt9VbQb3Als4=;
        b=RZpbDTWxtyXMrkwmYxt1vyQDCCdMEtVuksPX/UOatvhILNAQcABI4ljSO+hHkLLS0/
         9nZy0ZGB+ymaK3P7Jfi2AIp2Q7CK2+qHa3uQZ1j7U+aQDn0kUxwXz5cGzpkFgE6bMmC+
         zavWS4ggV/6DrXJzsefMne4+6NajUjRyqzIxmgShrtfqFk6ogpabhwuzrdQFRDvXhbcy
         Q43HRdg9jKbcyVnKMpEzdyZ7suPoFUiymLjMFq+co+Pjl1LBMw3QlGK11o7/30L4Fa8U
         8Myka7yr51pkv/HOBVyY7LapuylHpZSAdqIBNHTkmfApyekqHAob6ILoGN0OGkUsDHhA
         ngXg==
X-Gm-Message-State: AOJu0Yxi0XBUsUFF+mUN7Jimw8S31mhv+tdRMuwYk4SqR6NVToAesrd7
	enXBXlbChFnv4rt1GTCvUHJ8SomsqBMi38fPSCfKaxcIeEAsgkh9TV2Er9ikfjKO7dfh0h6Muc3
	nPtL9XpNR+dFu9KHiQgOSs16LlVgwK76O8p1BLRot0CFdUGUqqloPW9jxWZqupA==
X-Gm-Gg: ASbGncsJjnhaEF0DMEFuEUwa8AQ4dGk/bYqt4+NElYw9jn0kpbVLwV14L2/Z0O3BNzl
	DYjvsSw/ipkMHKkLkPOJGi4bUNZTIHlwmAsafQ3Xq8EtnBk7X9Lc6GkhV4Rq9JuwiaRurYrhqnS
	HoUze7bH9L8GnYKitc6BGfgsMEe/3Rkj+GEJBYxEF0m4ePwMayVYQRFKps9r2bB0gUMy0gKCtAg
	iGnau6CzpqaUxuFJo7y/eOgoQnSTMYguI8/m3lYS7PxvLF/QHGRmdnDOzkvFI2KkbDWnPy+d6Yb
	Z6D4KsKjcZhZ/ReCo8jeJzZ1enqG79qYqijSgUve3eovCSZYrZEto+5Vi2s8Fw==
X-Received: by 2002:a0c:f40e:0:b0:6e8:fbb7:675b with SMTP id 6a1803df08f44-702c6d89379mr3029076d6.32.1751584988546;
        Thu, 03 Jul 2025 16:23:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENUtIQTiH949ayUO0n64DI+W13Cd0LYVyie5G9b3GrNFyICIYDd0Xx0nCu+hVBZqsPuJ4DLw==
X-Received: by 2002:a0c:f40e:0:b0:6e8:fbb7:675b with SMTP id 6a1803df08f44-702c6d89379mr3028786d6.32.1751584988220;
        Thu, 03 Jul 2025 16:23:08 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:07 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:27 -0400
Subject: [PATCH 03/10] clk: qcom: rpm: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-3-3a8da898367e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=1752;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=xV38q5FTl0giHcO6B1fUUKKklwS+ypfUiAE8QJ9ufs0=;
 b=svr9/D7uxrC1Dyo7FmzxHVdb3SQ3e3f4HK+SsFrtv7eZKxGDXZOMRTNco/2iQ/OKe5mC+FRhE
 8ilIx65qxJ/DEVqiPHJ60/E+M1hDDeodgGsGMkUI7YBfZ4ZMx7XNLc8
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/qcom/clk-rpm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
index ccc112c21667ebf8522b06b37234f46c69b07698..be0145631197bea65438f3bed10344f18d6de802 100644
--- a/drivers/clk/qcom/clk-rpm.c
+++ b/drivers/clk/qcom/clk-rpm.c
@@ -351,15 +351,15 @@ static int clk_rpm_set_rate(struct clk_hw *hw,
 	return 0;
 }
 
-static long clk_rpm_round_rate(struct clk_hw *hw, unsigned long rate,
-			       unsigned long *parent_rate)
+static int clk_rpm_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
 	/*
 	 * RPM handles rate rounding and we don't have a way to
 	 * know what the rate will be, so just return whatever
 	 * rate is requested.
 	 */
-	return rate;
+	return 0;
 }
 
 static unsigned long clk_rpm_recalc_rate(struct clk_hw *hw,
@@ -383,7 +383,7 @@ static const struct clk_ops clk_rpm_xo_ops = {
 static const struct clk_ops clk_rpm_fixed_ops = {
 	.prepare	= clk_rpm_fixed_prepare,
 	.unprepare	= clk_rpm_fixed_unprepare,
-	.round_rate	= clk_rpm_round_rate,
+	.determine_rate = clk_rpm_determine_rate,
 	.recalc_rate	= clk_rpm_recalc_rate,
 };
 
@@ -391,7 +391,7 @@ static const struct clk_ops clk_rpm_ops = {
 	.prepare	= clk_rpm_prepare,
 	.unprepare	= clk_rpm_unprepare,
 	.set_rate	= clk_rpm_set_rate,
-	.round_rate	= clk_rpm_round_rate,
+	.determine_rate = clk_rpm_determine_rate,
 	.recalc_rate	= clk_rpm_recalc_rate,
 };
 

-- 
2.50.0

