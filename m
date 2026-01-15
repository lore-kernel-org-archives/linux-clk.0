Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D6032E14F
	for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 23:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768520576; cv=none; b=Tom/jtVC1ipQ9b3bPS+fFMxuobCbcnVtHoMHIqIJlUVgXFbKz94HeoWAqvD7hcqTZlRnisjtN2uuV+Y3l3+IVS/KVjS0zjEqsa505z6fDlVfs71FzSw0ULnDEMAfdQILQDgaUBXlI8LLFk3EuBEvn/evD53P8LTKFN8TrJqd2RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768520576; c=relaxed/simple;
	bh=6upf/F2Vdl/fKKyIKJ8WQQzcZoV1JG7cvz5xZhRldFE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s7YC3E3MLlJM8WffHHCbLTzIhLGJpIHkUpjvIFfeOSpT7T7oN+yUdofLT6cSEirUgE2MM1/znuqSExLgNI9x4rTI9pMXjOxetGjypqpr+Ppj0ZWe9PknlneOGuEy4IdLYJa/gxykEcRPbmylvbvJbSQ+zETZ466Hf0nJsomz+p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=fep03Ckw; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="fep03Ckw"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-78fb6c7874cso16221907b3.0
        for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 15:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1768520571; x=1769125371; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6iZRWuyORG3HiSopQBMtG8viyXNEvTSjWImQZ3xz+Po=;
        b=fep03CkwYFxnuhSSNm10JUrlFHvAk0zxGoI7PT6wQBqeddR74JowNB9DPjZhc+0yoh
         0EaXu7CukphMVJBD3GUADX3VvJdlETKFqNsaQklevo3ENCtuRKSYN2YbEi2AYdwUvWWN
         vtvdHUdiY8OwTFN8pzexh1gxyt28ud9wczJ3q1fiuFbftQZRuoAzaUCQ7guJT3EaAGp/
         HMaIUqnSE59SBvPToxnqXgm7/tarU4K4BRDA4bp1BlksAroGFv2blLN/EquVGQzD07kJ
         kRprhbg3J2QbNkC2T1ZsekupA80UUTQo0k8PcOdQlwzaFU0Q9HHx9bgTFS8DgtFB81AC
         tGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768520571; x=1769125371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6iZRWuyORG3HiSopQBMtG8viyXNEvTSjWImQZ3xz+Po=;
        b=PbOHTu+aUdG+azvAmT/SNH/jmzsx4vpuq+JraDia50HuGXZygYYMuXLymqRgSHUXIZ
         dPcuMV+7a9HOaSXyIcJRtC68Ffs8lA1uFChER88kJ48M/m3SajkPgAefiqgMV+4eVCrx
         DICCT1Y1I0Rfqj+3Ci40yomLB5d37YTRlwPu0j8WI8rXiP1uJP5rCm3zjpRclKWwbutM
         u3mLGb/qb6WuNophg717lUYjdJyNn21S1Wl/PfHVPQ5ONoD9FNdnGj/sW5517LCiNzJY
         8nb+W8JUorEpcqYL0ZNTnBNJSTp1RscGMJBgnIhOTl5Hy/y2Xx4QJho49UfQ76yWhGuL
         EDXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSC0EKhI0mIWwky0cSdLGLiNHbbDDynZjRBdFKfCGZtWn/tgAsOZQMNkWVNJSkKlci8NqL5KNELAM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWmhv0kJG/ZKL1/4IpbfqBHXX7dWLUUBJinBj1F2L2QVPD5g8M
	jsvNLto00JgC1G79G0z3COTARFAIGFvwKaHG/OpK7ihAoc1JMEfbbLYxF0A7MN/DsGw=
X-Gm-Gg: AY/fxX7OWv0BsAYWBeiIGde830foBI1edrdC9LqSP0TLascBC+7+6Cy8d/HalbOhi2p
	EP6YPS+vKT+2Sx7Kfqv/Obwf/YRoTpWCq/qsQyawRTRzCQp5YIP06LWOM/H1qyKLmM70fr42Brw
	doICkxAVl1Ayk26I7YCRBzPK5vEFjXrF48hmP+mI8wZuExWrvL0hw0bI+Omiv9OwQpgXyO22oES
	RL/9tgExZByfI/Vc68BaAWXxsuQj/H3HDLHwMHLmhD+ZBcS9p15pthilv0W8lkjc545VPvmn33O
	vPkqoS7af6EUCni+72I+TOQ0h7Y0FTugBISHWb26iUbeFbEnnGRMZCr43TdvravWWLuElLWR30U
	d+khiS/1VOhH0DDwPTTqQeFYLzi44emRs37+0FIhhz6yZrVsRYRP11SxzHQUFXT3T2QXyjOe14N
	K0//4rM6O6NrXXh5LHkcSCA3cWqfFnnVVJ0r0Ig3XUlvulCaG7AbaQFSVJ4a7DlNq8NsVVFJM=
X-Received: by 2002:a05:690c:46ca:b0:787:1aba:3081 with SMTP id 00721157ae682-793c683dcafmr8332397b3.58.1768520570793;
        Thu, 15 Jan 2026 15:42:50 -0800 (PST)
Received: from [192.168.5.15] ([68.95.197.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-793c66c72aesm3027117b3.11.2026.01.15.15.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 15:42:50 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 15 Jan 2026 17:42:05 -0600
Subject: [PATCH 6/8] soc: tenstorrent: Add auxiliary device definitions for
 Atlantis
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-atlantis-clocks-v1-6-7356e671f28b@oss.tenstorrent.com>
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
In-Reply-To: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
To: Drew Fustini <dfustini@oss.tenstorrent.com>, 
 Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, 
 fustini@kernel.org, mpe@kernel.org, mpe@oss.tenstorrent.com, 
 npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com
X-Mailer: b4 0.14.3

Reset shares the same registers as the Clock Controller, so it is
implemented as an auxiliary device of the Clock Controller.

This commit adds the auxiliary device definitions needed for this.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 include/soc/tenstorrent/atlantis-syscon.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/soc/tenstorrent/atlantis-syscon.h b/include/soc/tenstorrent/atlantis-syscon.h
index f1dc6ad33c6d..972a9b7da596 100644
--- a/include/soc/tenstorrent/atlantis-syscon.h
+++ b/include/soc/tenstorrent/atlantis-syscon.h
@@ -8,6 +8,14 @@
 #include <linux/bits.h>
 #include <linux/types.h>
 
+struct atlantis_ccu_adev {
+	struct auxiliary_device adev;
+	struct regmap *regmap;
+};
+
+#define to_atlantis_ccu_adev(_adev) \
+	container_of((_adev), struct atlantis_ccu_adev, adev)
+
 /* RCPU Clock Register Offsets */
 #define RCPU_PLL_CFG_REG 0x0000
 #define RCPU_NOCC_PLL_CFG_REG 0x0004

-- 
2.43.0

