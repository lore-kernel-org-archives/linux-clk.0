Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794699761;
	b=QFiuhJcPtGIouUCRhpG8sgxALE4xRMCugw/yiLBVmI7duiLV5Uzb9mzzIZdpbzfkBBbt
	 kGbLLz0PnmZwAn9+b0YqcYfya/HEcJK3XKV0gC46PuHZ4lfLa1THIpj8k/8Sb7c0M5SX8
	 GNp0+ycBDwYtpkG3ju4b4BjSNx08UKQSS2AFdsio/Ijr5Ucb2X8IL3h6eJHA6ItxALIi4
	 wxOIAIMLzvRUmRyShzQdJeZONIeYMVJClxCGU0BQv1mfiAKp9hIyDwIADMuNBut2Hv7Gg
	 UOlhFjkXsgFhpiQ0rYr8839MS9t7GJCddFmbosOHjSp+rns/OjEpK8w8/Az17FBlZ2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794699761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XYsHkPjzQgIm8rz0/nzpRXGmbbQyC+wUFRqtQMI5oUs=;
	b=NKWhTcxQQ75cAAYl2r1coRVvT0iCTtYRLVfmLO50C0vu6OK/64stjIHdjomptMPrU6Nc
	 IZx/GK9/IaoQEr5oWoKPKP0TBOxz4F6vRqU7sC9G+wb8HZR9RnR6PCpoBU9oDC5a1DcKz
	 aiW+UH7I+D0oz1jAPl/tr5rUb1Wh2M0KBPGl7ELF4aeynCw3biJNWwMhTZIYM287SXaJe
	 K091ksl1g83C2dXiz+PIy5d+T1M0gm1SqKzln/+CyIwYMwQJD/FEOPNQOYuGml98/EaYa
	 u2RtrnFCfguwPu2CTygDMVJZDPZ/ktSBQqOh7OBkFLR9X202caMn6WwcsPbnr7euahQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uciOJSd4;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04A0606A8B4
	for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 23:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A04A0606A8B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uciOJSd4
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so3405464a91.3
        for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 15:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794699760; x=1795304560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XYsHkPjzQgIm8rz0/nzpRXGmbbQyC+wUFRqtQMI5oUs=;
        b=uciOJSd4DLcxi5tp7UFydIx3C4EhdZs/GAMHtBiuSi9pmmcpWyswkIexI/S6kLR2N8
         2Le90ZgKylQHdTleR8Xv9Yd0HOEGCaGaHqfZhbtT5RcbpIfz+e6uxDSV4zn+VdBKsvyJ
         d5q7TTht46VFaKlDsBUY736imYOS3xY2du73MdusYM6SCH6Sm6Kjl5zyYFuwaJ/zUWO6
         Lr+yr2laygQVKQkL9Yl+9lv6KhyEjevj9HDc5vaeiZVKIl7u1R0/Fepb7MTpcJ/hP+bz
         Iba1z6IiUxKqXfUAO0OU5MibmUjXTcQF3R6YyK6jd/n4EIpxa49XxgKwGqSDZIOmsCkl
         M1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794699760; x=1795304560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XYsHkPjzQgIm8rz0/nzpRXGmbbQyC+wUFRqtQMI5oUs=;
        b=d8/oY5q6aM9KibAMP9LI/IiO3xLg2QM+1/NPK5oJAxuKzoIdnp7+riUScYOCG2FWYW
         QksH6jgd2YbBbvVnUZAd1qqQktoOMzT9/zLAGPoG7EZ1Iy74K/97mAbjPAqEyPM5e5ZV
         SzjbaA5VodHd6NnsvzG3JSnLnRKGeRkFB2EX3d+flQ0sWM/coC4qU9ZoDQVeXAFrEzCd
         MnU5pRlv8KATBy/hwSEmb+to89Uaxr1AMXVRJnIHuYKuvXMnSzU93a1EyPsIYmxk0DBz
         +1AxjIrmDEqfaaqS+6CHoE81wCVs/iqWxrh+tfSVRN8nh1UHKurC4xF3aHjYUNabfNaO
         sR2A==
X-Forwarded-Encrypted: i=1; AL+hErENtPW0s/9w9dV5Ci/wMD0e9kyM/VYTYolb9aOeSrSUmpNeWJ8ElHlbIZ3ZfIgGc8I8b722TgWz29Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z95NSJp9gtguSc4PGStpBbd9Ynk3d/ulfTYE9bhy/H38Xn56ztN
	vuqJnMrZSNSRxsDq5v5PnkGX8xMlFHhzkgurH5p4nvpCHFfu21NsJJXj
X-Gm-Gg: AYBFou3gco0nPeFQlwcxp2k+bsqklkAZ9eAbZSXTO8igvKqv1eOR9uHDu8y8kWhpE+T
	MWl5RsvK/59wyHYeJnXhh+zeLFWa1jTI+tmedwFdZQ7JQpg8iowrlWA5T9HRz6K8pRgGv7sHmmU
	8g9VlK9iJIBMpBh/lE3aNjlNijihiQ7zkGIirJiOzgRmt/GBT8CMmoTo9PRcgsfTJCSV6DXMLAY
	79xh6P0xcx3prPntsDdCs4Kqio124Ny4fB20p9OH5YiKzVgrE5cQJEIkK65qLJ8M+dhhyqCuXm5
	ECxXVCIrScFXpS2F2Oi2eo05w9Sz92UtCtsnQpgmiVyz7EYWkjN5dlmu87V6ubA0oQz2Nx3rdnF
	mvVE+3/36mvw/msuBIik3LWT61bpT1uenNXUa2Yox5uWlHzSjiqE8s+M4QHA0vmDL90/WpsXRJE
	tFnutkg8Oc73HTHJWIeWXVtv0bFIDk+FDISM3wl6BHgymsSYdz0bxdTcI+EZw25x/jlZsTXlOy1
	+yUFa0jjSIEHW+ZqvSJAGYZB+dMY5DZhOmUmJRgJlqRHwRkEBeBzF6XHFLV5FmMRDyOdfGXYGgS
	T4z5nMGZ9XabEX45NQQGSmoOy6TVf3OWWzrE6YEE4SGL1GCELefE5g7hc/Ggx3i/RJnjWAFnw80
	s5AwhaZi8vQWnoYI8nLAJb1LaOdiVXnAXp8ZG3QUzueglcTMPILhNM6pyHJoCpeSh433zJm11lX
	KCfg==
X-Received: by 2002:a17:90b:4b92:b0:3ac:97bc:4c7b with SMTP id 98e67ed59e1d1-3b1b0b57de5mr6751003a91.14.1794699759981;
        Sat, 14 Nov 2026 15:42:39 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d04336sm15755574a91.7.2026.11.14.15.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:42:38 -0800 (PST)
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
Subject: [PATCH v4 4/7] dt-bindings: clock: ath79: drop ATH79_CLK_END
Date: Sat, 14 Nov 2026 15:42:19 -0800
Message-ID: <20261114234222.88337-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114234222.88337-1-rosenp@gmail.com>
References: <20261114234222.88337-1-rosenp@gmail.com>
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
2.56.1

