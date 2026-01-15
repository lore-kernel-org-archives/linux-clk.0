Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A39330B31
	for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 23:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768520576; cv=none; b=HyYWjqB+HHsEwRQFHWLdy9X9FQ5LsLsa0clg9WuJ1JnIEN+Y9n6SFD3wE5eKsLQRHbV/pYoFuy7Ash6+bcZru1e3tt0hjC4vgBDFXI3lf3YhXdhddiJVIJ1x59Kq0Lyf5Hrderb6gCwTpLcbWfgM6PJFYwNrchXopjJDPzuACyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768520576; c=relaxed/simple;
	bh=9zrQEYyTHE0rrNAGV+bZFy/DeHKOGDCLqOIbqW74yYQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gRcvRUwVDHpm0NZskpa1nIBoVs2tBeSKPY6peB0otL8IijseF6j4FcXilrgLo1tLMLE7lVrp8tmyVIgWoT9af4Pib/RnYe3obLvQtJJOefoAA/v+oPyxsZjwYq5Z7WQ//wfSWR7gXzFwtj5mGgHNmicb+P/WgEHMezK9KCwiUh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=QtwcZK/c; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="QtwcZK/c"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-790ac42fd00so14213407b3.3
        for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 15:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1768520570; x=1769125370; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mr+DET/MCWrJ44Xgox+RvCv0LCqYSg+k7ueyqWHNGvw=;
        b=QtwcZK/ctxiYUTkjVj8LgQ09+euJ6fPCTkhRluM+k+RluCngf0fR5GaJHWUXnmHjDl
         j6gg5A+ZEQXx8s2IzGzZOrG8174On30zGQkVIy4JFao8CtqKNFWLp+jV0EP2VZO7j89A
         W2aF8WJ+Tl7QXNCYQi/DNZQ1J1ANLCLT2qnRC1MRjEP9SEAfnoSPW8Dum/84if53FDlP
         hia77MsnzfFKlPHEBefRaMhvaC34yie1v0y1YAX8ZpQf7JOVxc4DDs8svn2rja1yDWQS
         b7CCInyUZ/yth7hg8Qy/Es66y0bD9TXKYhj9/+IxsIchanddpxOxYOI+HpGpyG9QQBNe
         bQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768520570; x=1769125370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mr+DET/MCWrJ44Xgox+RvCv0LCqYSg+k7ueyqWHNGvw=;
        b=B9EJh5noDZLZtpaeEEt2kBTsvlrL4TAtLb6SsOlUUeEHz/n9SHyQuCXHqc9sqKGV9t
         ZDLbFVAPgmGCNPf674o3urZDQRy5vQi3tNrJ3/IMYE6mmrxGoizSQZTxa0kEZT8yKJDk
         e8hRrAXn30YpH7fE2Lq26zJcCYbK8umMRACbPtq6t7SLCrdZ7OzhzNyjxMmx36OutJxA
         vDg1yYL7e7F5PggI59qNYISXgFC1kygEhkmzbJj+i4GIrpojaUz9miCn/HnGFI3u91Y/
         42sCIcYmd4j4O0QF3IrasoRuMd8Qz3J4cmb3/Tn7WA+O+b8uG0wmjh8TrTNpVCaags5D
         R4wA==
X-Forwarded-Encrypted: i=1; AJvYcCWNUx1CjRBcJE6D/Ijogg2PRmupDlHfSUu0wtzhzPaFFGlzF0Ta7vE0i2goPodXSlA7CHITRJBpK7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYHazWwCgSKjNOkmle/rQpnzv5+rb6id722unCNBH2E0kRGQAO
	OW1AjKDmz9/hyIG1OFU3Wyu77V2PkXAhZ8aeS8hyK3qcRdfYVL5OAuSWx9Z7gEj+LUc=
X-Gm-Gg: AY/fxX5OhmP6w6xT6qcgcrrr1MQGeDmFeDxqhpQ1Sv7IqeaxQYwiagPIgG0SDmFC4ci
	klA0JGazerOwwEfiOVBr4mYOIKdsoN45Ld/wvGUCpQGsJwduhp39Xdo4iV7jR0HoDEx0AjnueyB
	Hxgztut9qxWA2cZv2dhcwVyTzNuyiaZyGYjO6ZVIrfyd6/Y2mRrF+dz1R/m+34c0UC4EOJUXHpC
	I+thS7GrPOuvIB2FPuKKzeR4VCyz8tIxZ60vn7j7k1L1aLE8pdkumNKOm12V1paXOtE1Xhrdzc5
	UNKI1yeyz91Tqoe1Kw5lRz/ZDOvZxP1z+gkooWH8NOupRqChKpIRz8ZXhZu/gghcybUas866o8c
	Sp2ryOYgP93Rr4uf4JT+Wp0sVEzbqsC/kjx+KxUJ7qzMBZ9uXX06nFsSXTF5p7deUeP/UNHT9n0
	uQ+KbyU55A0H5dXBkG9Kfu1OKvzJNHssMzRLhcKmQHZ5fi8+27yKJk1Bu87Tw3B00wOisxDVPA/
	TrfWdntNA==
X-Received: by 2002:a05:690c:e3cc:b0:78f:b820:f2f3 with SMTP id 00721157ae682-793c523ce6dmr26018967b3.12.1768520569702;
        Thu, 15 Jan 2026 15:42:49 -0800 (PST)
Received: from [192.168.5.15] ([68.95.197.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-793c66c72aesm3027117b3.11.2026.01.15.15.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 15:42:49 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 15 Jan 2026 17:42:04 -0600
Subject: [PATCH 5/8] soc: tenstorrent: Add rcpu syscon reset register
 definitions
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-atlantis-clocks-v1-5-7356e671f28b@oss.tenstorrent.com>
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

Document register offsets used for resets in Atlantis

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 include/soc/tenstorrent/atlantis-syscon.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/soc/tenstorrent/atlantis-syscon.h b/include/soc/tenstorrent/atlantis-syscon.h
index b15dabfb42b5..f1dc6ad33c6d 100644
--- a/include/soc/tenstorrent/atlantis-syscon.h
+++ b/include/soc/tenstorrent/atlantis-syscon.h
@@ -19,6 +19,13 @@
 #define PLL_NOCC_EN_REG 0x120
 #define BUS_CG_REG 0x01FC
 
+/* RCPU Reset Register Offsets */
+#define RCPU_BLK_RST_REG 0x1c
+#define LSIO_BLK_RST_REG 0x20
+#define HSIO_BLK_RST_REG 0x0c
+#define PCIE_SUBS_RST_REG 0x00
+#define MM_RSTN_REG 0x14
+
 /* PLL Bit Definitions */
 #define PLL_CFG_EN_BIT BIT(0)
 #define PLL_CFG_BYPASS_BIT BIT(1)

-- 
2.43.0

