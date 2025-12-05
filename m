Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FD43375CB
	for <linux-clk@vger.kernel.org>; Fri,  5 Dec 2025 19:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764964015; cv=none; b=uvCsjfgH1IP5dUoCvz3NwC/zge+xs4hwYWHhznYf2HDXvEep2MdbQ920Y3Zv518A0p80ea90fbk9Pln5BpBH7CIOKLkW/A4rLZdSnNVMKsd5aUmTkB4S2UjK6cSdsfW6z3/sv23o3F1bpc1df4inaAIpfdBoT2tBc+4RcyT1yMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764964015; c=relaxed/simple;
	bh=z9S6zDYSq6RyfRn8B4HCTLbBL7NBL7L4ZkDAdn6b+S8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mu8+0gOJwOp1qh3FAL/iid6kxxOMQ24LqR4azSkv8AtJx0DpjN2zMP+FU3m4VeGS2wLn1NiBKnRSY1MJq+nEzJuRsKpC+qCTizwBmYdIqBcR3gXHxyjbwWXy+et6XHD+izC0h8jmlBnx9qqj2AWbODoS39YD4y6k76Lzsj2ytMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BMx06HcO; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=e0PcRveS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BMx06HcO";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="e0PcRveS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764964012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PCnk3SOexQlPSQvnYnFQ+FpFJGUp1UmIpL0d6S9c950=;
	b=BMx06HcOnHzFErfo1z0q57b6zdEvtygIs0Gp8c6pNpJGxDxouulq+w3TUYlQFowzrJ10j6
	uF/wwCvnJQVenN4sQQOOeCY0ePvpL7GNecwBkAMjn/SvpsCDi/LgVu4MjxmUfyQGU6B5Sh
	3WEixT4nGQDh5dMEVA/W5h3vfRhigsc=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-nO5buwDYMOOkfjDiWbhYGQ-1; Fri, 05 Dec 2025 14:46:51 -0500
X-MC-Unique: nO5buwDYMOOkfjDiWbhYGQ-1
X-Mimecast-MFC-AGG-ID: nO5buwDYMOOkfjDiWbhYGQ_1764964011
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-64203afd866so4355577d50.0
        for <linux-clk@vger.kernel.org>; Fri, 05 Dec 2025 11:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1764964011; x=1765568811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PCnk3SOexQlPSQvnYnFQ+FpFJGUp1UmIpL0d6S9c950=;
        b=e0PcRveS3juyqvWVqdsibp43KK+kqdrodTRG48PlnGFVbdAHFkaFyzd4sn3YdcYyyv
         Uo2RmOb3UrRDsbxfYdE4OtCmQyFIYJ20mWZquffo5hh/dIvPDOk9cYPzIO0Ch1xWtkRr
         bNWdUzHWP19w0GR0KL9bJA+cR4GV9BamCz+DS3Uj1mvFQ3h63KL0v5OJgdgZEXKeyLpV
         T4WHJvNs0L0tcsHZqjMfPd1fnSJUqBILQMDgwjwtvQspycMQeGec8vQkp2tWYGQ7EnIm
         yq0VBbVsswAxthIJRt8THlUwGBopQzuV+vbXGdqR93hwtbDZ7Dh6uMdWDZ+P5hzySqHf
         19Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764964011; x=1765568811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PCnk3SOexQlPSQvnYnFQ+FpFJGUp1UmIpL0d6S9c950=;
        b=tuqfBaz8ZwdPdqDUqwWKKbu40nwNayR6z738Oe/M4BH+/XC7EGKAuZE+jT4ucPqNJQ
         hvJ23s3bdeOvehxjAmZ968C5n0BpIxZUGmyxQg8pwnUxiitokWPuKi0PiYPCP94BG21d
         qSRI8qLP9OjVuc06PZMerfvydhBrTFFVsSAkvaNwetlHULwE2jw+Tga7+H7KUEeQrpGH
         aosinQ4swFaCjRVY5D9jockvIrFPNIbIh7CBdR97ipbX4woFCdro0Bn84rKfrnX84jCP
         VywP3Q1CDERISJMzVi7RCDrXepvBjn8sv56nIYeiPs5yqjiRAyj1ml5iqSjHl0NAkjWE
         c+gA==
X-Gm-Message-State: AOJu0YwtH5pj2WCwLLoAbfmgXZoCyOPwSMcCiaTpPhYpd/azYfs9cORh
	d7JrnFjYjPa1qLdqxsDp7begKFFvX3aOenN7V/VNZdVqYW8phI2bKQB2YdkVTbNM0sWUbge9huc
	Od4SuwB9kbuJ+EcrKAkP7/hdGpoCixSvhMQWAwxgQbHQTphSl0xB1GJutjORlfA==
X-Gm-Gg: ASbGncsT0TdEGhDIEhI66g/P7eJDGZYO+u8wvHHpgAjQaM9S29NU/Wop1TXvL8YBdvp
	jpbGRwJCFAkESinmEypHH6AIRe5S9NX37pVdrtz7TLGcI0a4/KbJitEbMnnqhTtp+DPn3nmrk8q
	VsFKgoQf8x7x9/KTr5aYzjqIHsC7tVfFnumVR4x/RxGCTT5NYWCMYinURm9w7ZgNxG0yEoVA1wm
	cDj/Vd2Y0dnSflMujUXtbskk0ziuwdk9tdu6WGwKrYSvoVPeefHI1DbrvJEvAOpKnAiiKilF4cD
	dZDQdGXetCERTHS3dAr8LipBprDnin1Y7AOsGomCdaQRGbEy4QAbUA8M2WkJFZZ2xBd1kBNwEZW
	7Vwo+h6Tsr7jx06XAyG3H+VqnTm3Cb2WqX/Pqle+zdbP/44k4
X-Received: by 2002:a05:690e:2554:b0:63f:b353:8fb5 with SMTP id 956f58d0204a3-6444df9f5abmr277206d50.15.1764964011223;
        Fri, 05 Dec 2025 11:46:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPCTnHwXvSA/0u8cdC7xQI4iIcuunv7o9haRn4g76piPssnlXwS/AvpPUROxj13yRu0IYpmw==
X-Received: by 2002:a05:690e:2554:b0:63f:b353:8fb5 with SMTP id 956f58d0204a3-6444df9f5abmr277192d50.15.1764964010883;
        Fri, 05 Dec 2025 11:46:50 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6443f2b80casm2151181d50.9.2025.12.05.11.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 11:46:50 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 05 Dec 2025 14:46:28 -0500
Subject: [PATCH v3 2/4] clk: microchip: core: correct return value on
 *_get_parent()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-clk-microchip-fixes-v3-2-a02190705e47@redhat.com>
References: <20251205-clk-microchip-fixes-v3-0-a02190705e47@redhat.com>
In-Reply-To: <20251205-clk-microchip-fixes-v3-0-a02190705e47@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Conor Dooley <conor@kernel.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2161; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=z9S6zDYSq6RyfRn8B4HCTLbBL7NBL7L4ZkDAdn6b+S8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKNzZb0hzaodfcG+l0WkzyQfe+hfyKX+LHOe7Exl9KK8
 piWFDt0lLIwiHExyIopsizJNSqISF1le++OJgvMHFYmkCEMXJwCMBFJTYb/iS//Bu5YFDRty5bq
 tZsY/UtP2s4T+hH4Rsa/6HRlxPQXQgy/mISmFMjkzO8+Y/bgjNHCcob8HYcavIRXTvi1LGD5xHh
 vZgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

roclk_get_parent() and sclk_get_parent() has the possibility of
returning -EINVAL, however the framework expects this call to always
succeed since the return value is unsigned.

If there is no parent map defined, then the current value programmed in
the hardware is used. Let's use that same value in the case where
-EINVAL is currently returned.

This index is only used by clk_core_get_parent_by_index(), and it
validates that it doesn't overflow the number of available parents.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202512050233.R9hAWsJN-lkp@intel.com/
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/microchip/clk-core.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/microchip/clk-core.c b/drivers/clk/microchip/clk-core.c
index a0163441dfe5c1dfc27dae48e64cf3cb3d6b764f..82f62731fc0ed566b0c6b007381c4f10a2a8a7e7 100644
--- a/drivers/clk/microchip/clk-core.c
+++ b/drivers/clk/microchip/clk-core.c
@@ -283,14 +283,13 @@ static u8 roclk_get_parent(struct clk_hw *hw)
 
 	v = (readl(refo->ctrl_reg) >> REFO_SEL_SHIFT) & REFO_SEL_MASK;
 
-	if (!refo->parent_map)
-		return v;
-
-	for (i = 0; i < clk_hw_get_num_parents(hw); i++)
-		if (refo->parent_map[i] == v)
-			return i;
+	if (refo->parent_map) {
+		for (i = 0; i < clk_hw_get_num_parents(hw); i++)
+			if (refo->parent_map[i] == v)
+				return i;
+	}
 
-	return -EINVAL;
+	return v;
 }
 
 static unsigned long roclk_calc_rate(unsigned long parent_rate,
@@ -817,13 +816,13 @@ static u8 sclk_get_parent(struct clk_hw *hw)
 
 	v = (readl(sclk->mux_reg) >> OSC_CUR_SHIFT) & OSC_CUR_MASK;
 
-	if (!sclk->parent_map)
-		return v;
+	if (sclk->parent_map) {
+		for (i = 0; i < clk_hw_get_num_parents(hw); i++)
+			if (sclk->parent_map[i] == v)
+				return i;
+	}
 
-	for (i = 0; i < clk_hw_get_num_parents(hw); i++)
-		if (sclk->parent_map[i] == v)
-			return i;
-	return -EINVAL;
+	return v;
 }
 
 static int sclk_set_parent(struct clk_hw *hw, u8 index)

-- 
2.52.0

