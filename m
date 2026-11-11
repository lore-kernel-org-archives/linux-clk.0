Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434264;
	b=aT2hdt9/stbN9T0BeRjYR325DK4aBU4EE7UO66QsT5+WfUOCUGYew1/LKik2DwT6snHa
	 jXDXNyQFbFojA8RRr5t3J7Pbq4rFnay8PxgyO/TZSASTHbo7yIpFClq03N18gy1qRxJ5i
	 Gyx8a87bVjflZ5w+d8uWNBhs/1Qo5mjSqcXXE9TqnaAdJeMK3JJCBqHq4rJqyDQsconwD
	 RfYTrYQumvCiPa6oTvIO/eYKp3CRcPgTxgYE1dXt+jSgFqZ2TwCeTcpnMIdgf2Fy61Qqo
	 Dfn/sEUHQb5wQVRQdFI1GVmhN95u8ya/Ck1xvplHjMwYCdwz6mIM7iCIy7SlLbIIJLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=E5HcxdpQOV9RFM6o/ZfBmmKRtQ1dbEjJPmX/Bpim1FU=;
	b=wOrSYgCqDJyF1B344hpLRaW6+6U4eI9xYFO7fUJSjVed3/v6mKJirtdSJsfNNIXrCPqj
	 FT8/bLLlqumBXPtpXIxMuhqgKzHY8ZPPA9Ey6F15zSq3HcZWReOqtIr6koYT95GzOfbMH
	 CNd7zhMSvsZWgADIdFJatm7fZ2iEx3fIFapIun+rMZBvX5LET9N2mYI7K2iyu6dVVoBq7
	 sPXsBly1joGbzay2mJVu/2PCz0mu+2XX7rwIu8H6LxZ7HE85YzWwdv4poLTsKKmucbRMh
	 zxoQEiOa4FgxY8K2fwENMyZjhWXCrstmPpq10AbsgRoh5UKJBjVs/BfZ1paEIJJWIiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VKJ1JhnH;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C3C60A262A
	for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 21:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3C3C60A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VKJ1JhnH
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so1772291a12.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 13:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434263; x=1795039063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E5HcxdpQOV9RFM6o/ZfBmmKRtQ1dbEjJPmX/Bpim1FU=;
        b=VKJ1JhnHMnZGCpinQvAzVFJUC+MbAAWmd2u5CI3zAOXpLFiDx7qCSS5UpLi1NaBYYP
         8jq2SRgENOiXlwWGjY49oH4aMdu+O0hzKXwExUAzMNnLbozVx3eyyU4T638F1VUbmpnM
         6PL5odfyF2/P2ZtBS32m4knDnod0K0NDyVKjS7kMrNWi35aTu5TwNxgQcsMEdh1H9+O6
         nL8I6S6xfDpE0Gnnzy+IKFUPeNVSubrO1pBsr3skACJx1iDKO/7OHCCODCaABc+8d1E6
         /oibtIOK4J3BvX0UKCjoPTtSLLF/oSokhlSC6CY4EgPFqEZbGVD4bcPp5WYsijHc6ewt
         Tu7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434263; x=1795039063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E5HcxdpQOV9RFM6o/ZfBmmKRtQ1dbEjJPmX/Bpim1FU=;
        b=sZYXUKJiYf1n8SAD/vphMvljXCBqbcsSBlqm2lSAgl3kg07EjBdAleAKVfXjIhFC43
         b71qlWZ9wI0LhTUetKtYiEjOsSDaC8Z1o+SREtzRZUTaVyylaM3s4bJGxncW0oH3QX/x
         ZTfqNWQzf5FgZvAhMyTwHhVgPL/qUHk0zHQ9rqH0B4oByddf5Sb2/yXK2llRhzTcAB0h
         1An6hm/t6FbYDl6yeiJnIY77iZYKTyAZ/izcEUpwMltEb7UBfCUUKw/rEiDW0Tq92lSy
         Mvn3ulIxwaBJfPrS+OGwHCpKq8Sh4PJSrrwnp3XEXsGgfJRzowLT93+xjYFbRiCdQM4n
         0z/A==
X-Forwarded-Encrypted: i=1; AL+hErEAz1rMCZXmOTdpnc4UM2YCjasdOeOQ83dc7eR8VYnKPGSJPDXNemiwlIxVb0IaayyVQJkJnbvF54g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YFEi/BBoM93oDX1IH9V95+9buNGIaKfs0dpVc+MrqhZ4I6IPl
	a91CyDXWvJ+H36t+GDLRgG0LKEJqlSQltgRyJZFvE4GzQpksoLwABgsG
X-Gm-Gg: AYBFou1diuLZi74cy1YCpXxfcht+I0AtgXBYURKk80rzWQO6YFitG4FsuhMXkVewkvZ
	1oDnwTdh7CclLs0spQmDlkUfGFNQMzus50/AQVqvhBnTzUyhInL8vLTDxLxNMsX3RgMFE5hNuFt
	fq75Qe7lbGrrFucRGB7ShoKhzlyinZayJ7+rCGpaOT7/qp0QwNxY7y4v9y2wCa254oZW7FslxHr
	Zit5CcP1CCv2Q+N1x+7opnSO11AtBGwszjOYs4CXlVO9gPnU7AhDR6pa7iDet9iSpE2Cc849FUD
	vQWVg5OgiBeNOpSm7dnfREy6lrzUlpEVT8q9RY7UXU0Mf1lHd+77fl7priMHpkjVXwfNf7mwlAa
	Y3rg8J+lm4JnQJ8tlUHx0wW40Sqno1OrZHq7CPQ+wfdQwrRmAOrdFTtDRKCUQuwWV+ICWI4j7/u
	KXM7mWAskOIMMEqxdHVIm/IrfSf3XfKn8TcBxKnflbcJMAkoeP8velDSP9NIEc+SGFGg/IUf/5g
	CyuwguOVuXIVRdAEJr+OkAF/toaO4IiGCxOr/sTrhVocINH1fAg5Hrjq8DlHdl8+GSWYIazZxDF
	rKkd/fFKlLyqqw1B9nU/NdjXEjmnn9OeOy/aBl+ZpLVzRAJsLPK7E7LQ1T/VnDrmcjD141ETRkN
	Ghk6QTWNSHxSGJIoa4lvY+EN+GTewkfdCcKTuXEf84PIr0CWnLJw72Z23JlCCXoT6q07BrO9PFs
	PgVA==
X-Received: by 2002:a17:90a:c2ce:b0:3ae:5572:c4d1 with SMTP id 98e67ed59e1d1-3b182fdb069mr3632430a91.62.1794434263235;
        Wed, 11 Nov 2026 13:57:43 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce556dsm965429a91.6.2026.11.11.13.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:57:42 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 4/7] dt-bindings: clock: ath79: drop ATH79_CLK_END
Date: Wed, 11 Nov 2026 13:57:26 -0800
Message-ID: <20261111215729.10683-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261111215729.10683-1-rosenp@gmail.com>
References: <20261111215729.10683-1-rosenp@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ATH79_CLK_END only counts the clocks for the driver. No device tree uses
it and it is not part of the ABI, and it would have to change whenever
a clock is added. Drop it.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 include/dt-bindings/clock/ath79-clk.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/dt-bindings/clock/ath79-clk.h b/include/dt-bindings/clock/ath79-clk.h
index eec8f399b9e6..27e31452544d 100644
--- a/include/dt-bindings/clock/ath79-clk.h
+++ b/include/dt-bindings/clock/ath79-clk.h
@@ -12,6 +12,4 @@
 #define ATH79_CLK_REF		3
 #define ATH79_CLK_MDIO		4
 
-#define ATH79_CLK_END		5
-
 #endif /* __DT_BINDINGS_ATH79_CLK_H */
-- 
2.56.0

